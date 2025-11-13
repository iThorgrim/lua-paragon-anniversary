local debug = false

local CMH = {}
local datacache = {}
local delim = {"", "", "", "", ""}
local pck = {REQ = "", DAT = ""}

-- HELPERS START
local function debugOut(prefix, x, msg)
	if(debug == true) then
		print("["..date("%X", time()).."][CSMH]["..x.."]["..prefix.."]: "..msg)
	end
end

local function GenerateReqId()
	local length = 6
	local reqId = ""

	for i = 1, length do
		reqId = reqId .. string.char(math.random(97, 122))
	end

	return reqId
end

local function ParseMessage(str)
	str = str or ""
	local output = {}
	local valTemp = {}
	local typeTemp = {}
	
	local valMatch = "[^"..table.concat(delim).."]+"
	local typeMatch = "["..table.concat(delim).."]+"
	
	-- Get values
	for value in str:gmatch(valMatch) do
		table.insert(valTemp, value)
	end
	
	-- Get type from delimiter
	for varType in str:gmatch(typeMatch) do
		for k, v in pairs(delim) do
			if(v == varType) then
				table.insert(typeTemp, k)
			end
		end
	end
	
	-- Convert value to correct type
	for k, v in pairs(valTemp) do
		local varType = typeTemp[k]
		if(varType == 2) then -- Strings
			-- Special case for empty string parsing
			if(v == string.char(tonumber('1A', 16))) then
				v = ""
			end
		elseif(varType == 3) then -- Ints
			v = tonumber(v)
		elseif(varType == 4) then -- Tables
			v = Smallfolk.loads(v, #v)
		elseif(varType == 5) then -- Booleans
			if(v == "true") then v = true else v = false end
		end
		table.insert(output, v)
	end
	
	valTemp = nil
	typeTemp = nil
	
	return output
end

local function ProcessVariables(reqId, ...)
	local splitLength = 200
	local arg = {...}
	local msg = ""
	
	for _, v in pairs(arg) do
		if(type(v) == "string") then
			-- Special case for empty string parsing
			if(#v == 0) then
				v = string.char(tonumber('1A', 16))
			end
			msg = msg .. delim[2]
		elseif(type(v) == "number") then
			msg = msg .. delim[3]
		elseif(type(v) == "table") then
			-- use Smallfolk to convert table structure to string
			v = Smallfolk.dumps(v)
			msg = msg .. delim[4]
		elseif(type(v) == "boolean") then
			v = tostring(v)
			msg = msg .. delim[5]
		end
		msg = msg .. v
	end
	
	if not datacache[reqId] then
		datacache[reqId] = { count = 0, data = {}}
	end
	
	for i=1, msg:len(), splitLength do
		datacache[reqId].count = datacache[reqId].count + 1
		datacache[reqId]["data"][datacache[reqId].count] = msg:sub(i,i+splitLength - 1)
	end
	
	return datacache[reqId]
end

-- HELPERS END

-- Rx START

function CMH.OnReceive(self, event, header, data, Type, sender)
	-- Ensure the sender and receiver is the same, the message is an addon message, and the message type is WHISPER
	if event == "CHAT_MSG_ADDON" and sender == UnitName("player") and Type == "WHISPER" then
		-- unpack and validate addon message structure
		local pfx, source, pckId = header:match("(.)(%u)(.)")	
		if not pfx or not source or not pckId then
			return
		end
		
		-- Make sure we're only processing addon messages using our framework prefix character as well as client messages
		if(pfx == delim[1] and source == "S") then
			if(pckId == pck.REQ) then
				debugOut("REQ", "Rx", "REQ received, data: "..data)
				CMH.OnREQ(sender, data)
			elseif(pckId == pck.DAT) then
				debugOut("DAT", "Rx", "DAT received, data: "..data)
				CMH.OnDAT(sender, data)
			else
				debugOut("ERR", "Rx", "Invalid packet type, aborting")
				return
			end
		end
	end
end

local CMHFrame = CreateFrame("Frame")
CMHFrame:RegisterEvent("CHAT_MSG_ADDON")
CMHFrame:SetScript("OnEvent", CMH.OnReceive)

function CMH.OnREQ(sender, data)
	debugOut("REQ", "Rx", "Processing data..")
	-- split header string into proper variables and ensure the string is the expected format
	local functionId, linkCount, reqId, addon = data:match("(%d%d)(%d%d%d)(%w%w%w%w%w%w)(.+)");
	if not functionId or not linkCount or not reqId or not addon then
		debugOut("REQ", "Rx", "Malformed data, aborting.")
		return
	end
	
	-- make sure the functionId and linkCount is converted to a number
	functionId, linkCount = tonumber(functionId), tonumber(linkCount);
	
	-- if the addon does not exist, abort
	if not CMH[addon] then
		debugOut("REQ", "Rx", "Invalid addon, aborting.")
		return
	end
	
	-- if the functionId does not exist for said addon, abort
	if not CMH[addon][functionId] then
		debugOut("REQ", "Rx", "Invalid addon function, aborting.")
		return
	end
	
	-- the request cache already exists, this should not happen. 
	-- abort and send error to the client, as well as purge id from cache.
	if(datacache[reqId]) then
		datacache[reqId] = nil
		debugOut("REQ", "Rx", "Cache already exists, aborting.")
		return
	end
	
	-- Insert header info for request id and prepare temporary data storage
	datacache[reqId] = {addon = addon, funcId = functionId, count = linkCount, data = {}}
	
	debugOut("REQ", "Rx", "Header validated, cache created. Awaitng data..")
end

function CMH.OnDAT(sender, data)
	debugOut("DAT", "Rx", "Validating data..")
	-- Separate REQ ID from payload and verify
	local reqId = data:sub(1, 6)
	local payload = data:sub(#reqId+1)
	if not reqId then
		debugOut("DAT", "Rx", "Request ID missing, aborting.")
		return
	end
	
	-- If no REQ header info has been cached, abort
	if not datacache[reqId] then
		debugOut("DAT", "Rx", "Cache does not exist, aborting.")
		return
	end
	
	local reqTable = datacache[reqId]
	local sizeOfDataCache = #reqTable.data
	
	-- Some functions are trigger functions and expect no payload
	-- Skip the rest of the functionality and call the expected function
	if reqTable.count == 0 then
		debugOut("DAT", "Rx", "Function expects no data, triggering function..")
		
		-- Retrieve the function from global namespace and pass variables if it exists 
		local func = CMH[reqTable.addon][reqTable.funcId]
		if func then
			_G[func](sender, {})
			datacache[reqId] = nil
			debugOut("DAT", "Rx", "Function "..func.." @ "..reqTable.addon.." executed, cache cleared.")
		end
		return
	end
	
	-- If the size of the cache is larger than expected, abort
	if sizeOfDataCache+1 > reqTable.count then
		debugOut("DAT", "Rx", "Received more data than expected. Aborting.")
		return
	end
	
	-- Add payload to cache and update size variable
	reqTable["data"][sizeOfDataCache+1] = payload
	sizeOfDataCache = #reqTable.data
	debugOut("DAT", "Rx", "Data part "..sizeOfDataCache.." of "..reqTable.count.." added to cache.")
	
	-- If the last expected message has been received, process it
	if(sizeOfDataCache == reqTable.count) then
		debugOut("DAT", "Rx", "All expected data received, processing..")
		-- Concatenate the cache and parse the full payload for function variables to return
		local fullPayload = table.concat(reqTable.data);
		local VarTable = ParseMessage(fullPayload)
		
		-- Retrieve the function from global namespace and pass variables if it exists 
		local func = CMH[reqTable.addon][reqTable.funcId]
		if func then
			_G[func](sender, VarTable)
			datacache[reqId] = nil
			debugOut("DAT", "Rx", "Function "..func.." @ "..reqTable.addon.." executed, cache cleared.")
		end
	end
end

-- Rx END

-- Tx START

function CMH.SendREQ(functionId, linkCount, reqId, addon)
	local header = string.format("%01s%01s%01s", delim[1], "C", pck.REQ)
	local data = string.format("%02d%03d%06s%0"..tostring(#addon).."s", functionId, linkCount, reqId, addon)
	SendAddonMessage(header, data, "WHISPER", UnitName("player"))
	debugOut("REQ", "Tx", "Sent REQ with ID "..reqId..", sending DAT..")
end

function CMH.SendDAT(reqId)
	-- Build data message header
	local header = string.format("%01s%01s%01s", delim[1], "C", pck.DAT)
	
	-- iterate all items in the message data cache and send
	-- functions can also be trigger functions without any data, only send header and no payload
	if(#datacache[reqId]["data"] == 0) then
		SendAddonMessage(header, reqId, "WHISPER", UnitName("player"))
	else
		for _, v in pairs (datacache[reqId]["data"]) do
			local payload = reqId..v
			SendAddonMessage(header, payload, "WHISPER", UnitName("player"))
		end
	end
	
	-- all items have been sent, cache can be purged
	datacache[reqId] = nil
	debugOut("DAT", "Tx", "Sent all DAT for ID "..reqId..", cache cleared, closing.")
end

-- Tx END

-- API START

function RegisterServerResponses(config)
	if(CMH[config.Prefix]) then
		return;
	end
	
	CMH[config.Prefix] = {}
	
	for functionId, functionName in pairs(config.Functions) do
		CMH[config.Prefix][functionId] = functionName
	end
end

function SendClientRequest(prefix, functionId, ...)
	local reqId = GenerateReqId()
	local varTable = ProcessVariables(reqId, ...)
	
	CMH.SendREQ(functionId, varTable.count, reqId, prefix)
	CMH.SendDAT(reqId)
end

--A API END