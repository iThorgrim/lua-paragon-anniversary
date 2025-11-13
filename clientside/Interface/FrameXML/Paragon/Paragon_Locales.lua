--[[
    Paragon_Locales.lua
    Localization system for the Paragon Anniversary addon

    This module provides multi-language support for all UI text, tooltips, and descriptions.
    Supports 9 languages: frFR, enUS, deDE, esES, ruRU, ptBR, itIT, koKR, zhCN, zhTW

    @module Paragon_Locales
    @author Paragon Team
]]

--- Localization strings table indexed by locale code
-- Contains all translatable strings for the addon organized by language
-- @field [string] Locale code (e.g., "frFR", "enUS")
-- @return table Translation strings for the specified locale
local Locales = {
    ["frFR"] = {
        EXPERIENCE_TEXT = "Expérience %d / %d",
        STATISTICS_TEXT = "Statistiques",

        -- ========================================================================
        -- CATEGORY NAMES
        -- ========================================================================
        DEFENSE_TEXT = "Défense",
        ATTACK_TEXT = "Attaque",
        MAGIC_TEXT = "Magie",
        OTHER_TEXT = "Autres",

        -- ========================================================================
        -- TOOLTIPS
        -- ========================================================================
        TOOLTIP_INSTRUCTIONS = "Clic gauche/droit pour ajouter/retirer un point.\nMolette haut/bas pour ajouter/retirer plusieurs.\nClic molette pour attribution rapide.",
        TOOLTIP_LIMIT = "Limite : %d",

        -- ========================================================================
        -- POINTS DISPLAY
        -- ========================================================================
        POINTS_TO_SPEND = "(%d %s à dépenser)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- ========================================================================
        -- POPUP DIALOGS
        -- ========================================================================
        POPUP_CHOOSE_ACTION = "Voulez-vous ajouter ou retirer des points ?",
        POPUP_BUTTON_ADD = "Ajouter",
        POPUP_BUTTON_REMOVE = "Retirer",
        POPUP_ENTER_AMOUNT = "Combien de points voulez-vous %s dans %s ?",
        POPUP_ACTION_ADD = "ajouter",
        POPUP_ACTION_REMOVE = "retirer",
        POPUP_BUTTON_CONFIRM = "Confirmer",
        POPUP_BUTTON_CANCEL = "Annuler",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Aide - Interface Paragon",
        TUTORIAL_BUTTON_NEXT = "Suivant",
        TUTORIAL_BUTTON_PREVIOUS = "Précédent",
        TUTORIAL_BUTTON_CLOSE = "Fermer",
        TUTORIAL_BUTTON_FINISH = "Terminer",
        TUTORIAL_STEP_COUNTER = "Étape %d/%d",
        TUTORIAL_COMPLETE = "Tutoriel terminé !",
        TUTORIAL_LEVEL = "Niveau Paragon|nAffiche votre niveau actuel dans le système Paragon.",
        TUTORIAL_XP_BAR = "Barre d'expérience Paragon|nMontre votre progression vers le prochain niveau.|nSurvole pour voir les détails XP.",
        TUTORIAL_POINTS = "Points disponibles|nPoints que vous pouvez dépenser dans les statistiques.|nGagnés en montant de niveau.",
        TUTORIAL_HELP_BUTTON = "Bouton d'aide|nRelance ce tutoriel à tout moment.|nClic pour afficher cette aide.",
        TUTORIAL_CATEGORIES = "Catégories de statistiques|nGroupes thématiques : Défense, Attaque, Magie, Autres.|nChaque catégorie contient des stats spécifiques.",
        TUTORIAL_STATS = "Interaction avec les statistiques|n|n- Clic gauche : +1 point|n- Clic droit : -1 point|n- Molette haut : +5 points|n- Molette bas : -5 points|n- Clic molette : Attribution rapide|n|nSurvole une stat pour voir sa description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Compétence d'armes", description = "Augmente votre compétence avec toutes les armes." },
                DEFENSE_SKILL           = { name = "Compétence de défense", description = "Augmente votre compétence de défense contre les attaques." },
                DODGE                   = { name = "Esquive", description = "Augmente votre score d'esquive." },
                PARRY                   = { name = "Parade", description = "Augmente votre score de parade." },
                BLOCK                   = { name = "Blocage", description = "Augmente votre score de blocage." },
                HIT_MELEE               = { name = "Précision (mêlée)", description = "Augmente votre chance de toucher en mêlée." },
                HIT_RANGED              = { name = "Précision (distance)", description = "Augmente votre chance de toucher à distance." },
                HIT_SPELL               = { name = "Précision (sorts)", description = "Augmente votre chance de toucher avec les sorts." },
                CRIT_MELEE              = { name = "Critique (mêlée)", description = "Augmente votre chance de critique en mêlée." },
                CRIT_RANGED             = { name = "Critique (distance)", description = "Augmente votre chance de critique à distance." },
                CRIT_SPELL              = { name = "Critique (sorts)", description = "Augmente votre chance de critique avec les sorts." },
                HIT_TAKEN_MELEE         = { name = "Touché (mêlée)", description = "Augmente la chance d'être touché en mêlée." },
                HIT_TAKEN_RANGED        = { name = "Touché (distance)", description = "Augmente la chance d'être touché à distance." },
                HIT_TAKEN_SPELL         = { name = "Touché (sorts)", description = "Augmente la chance d'être touché par les sorts." },
                CRIT_TAKEN_MELEE        = { name = "Critique reçu (mêlée)", description = "Augmente la chance de recevoir un critique en mêlée." },
                CRIT_TAKEN_RANGED       = { name = "Critique reçu (distance)", description = "Augmente la chance de recevoir un critique à distance." },
                CRIT_TAKEN_SPELL        = { name = "Critique reçu (sorts)", description = "Augmente la chance de recevoir un critique des sorts." },
                HASTE_MELEE             = { name = "Hâte (mêlée)", description = "Augmente votre vitesse d'attaque en mêlée." },
                HASTE_RANGED            = { name = "Hâte (distance)", description = "Augmente votre vitesse d'attaque à distance." },
                HASTE_SPELL             = { name = "Hâte (sorts)", description = "Augmente votre vitesse de lancement de sorts." },
                WEAPON_SKILL_MAINHAND   = { name = "Compétence (main principale)", description = "Augmente votre compétence avec l'arme de main principale." },
                WEAPON_SKILL_OFFHAND    = { name = "Compétence (main secondaire)", description = "Augmente votre compétence avec l'arme de main secondaire." },
                WEAPON_SKILL_RANGED     = { name = "Compétence (distance)", description = "Augmente votre compétence avec les armes à distance." },
                EXPERTISE               = { name = "Expertise", description = "Réduit les chances de parade et d'esquive de la cible." },
                ARMOR_PENETRATION       = { name = "Pénétration d'armure", description = "Ignore un pourcentage de l'armure de la cible." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Force", description = "Augmente votre Force, ce qui améliore votre puissance d'attaque en mêlée." },
                STAT_AGILITY            = { name = "Agilité", description = "Augmente votre Agilité, ce qui améliore votre puissance d'attaque à distance, votre esquive et vos chances de coup critique." },
                STAT_STAMINA            = { name = "Endurance", description = "Augmente votre Endurance, ce qui améliore votre total de points de vie." },
                STAT_INTELLECT          = { name = "Intelligence", description = "Augmente votre Intelligence, ce qui améliore votre puissance des sorts et votre total de mana." },
                STAT_SPIRIT             = { name = "Esprit", description = "Augmente votre Esprit, ce qui améliore votre régénération de mana et de santé." },
                HEALTH                  = { name = "Santé", description = "Augmente votre total de points de vie." },
                MANA                    = { name = "Mana", description = "Augmente votre total de mana." },
                RAGE                    = { name = "Rage", description = "Augmente votre génération de rage (guerriers et druides)." },
                FOCUS                   = { name = "Concentration", description = "Augmente votre réserve de concentration (chasseurs)." },
                ENERGY                  = { name = "Énergie", description = "Augmente votre régénération d'énergie (voleurs et druides)." },
                HAPPINESS               = { name = "Bonheur", description = "Augmente le bonheur de votre familier (chasseurs)." },
                RUNE                    = { name = "Runes", description = "Augmente la régénération des runes (chevaliers de la mort)." },
                RUNIC_POWER             = { name = "Puissance runique", description = "Augmente votre réserve de puissance runique (chevaliers de la mort)." },
                ARMOR                   = { name = "Armure", description = "Augmente votre valeur d'armure, ce qui réduit les dégâts physiques reçus." },
                RESISTANCE_HOLY         = { name = "Résistance sacré", description = "Augmente votre résistance contre les dégâts sacrés." },
                RESISTANCE_FIRE         = { name = "Résistance feu", description = "Augmente votre résistance contre les dégâts de feu." },
                RESISTANCE_NATURE       = { name = "Résistance nature", description = "Augmente votre résistance contre les dégâts de nature." },
                RESISTANCE_FROST        = { name = "Résistance givre", description = "Augmente votre résistance contre les dégâts de givre." },
                RESISTANCE_SHADOW       = { name = "Résistance ombre", description = "Augmente votre résistance contre les dégâts d'ombre." },
                RESISTANCE_ARCANE       = { name = "Résistance arcanes", description = "Augmente votre résistance contre les dégâts des arcanes." },
                ATTACK_POWER            = { name = "Puissance d'attaque (mêlée)", description = "Augmente les dégâts infligés avec des armes de mêlée." },
                ATTACK_POWER_RANGED     = { name = "Puissance d'attaque (distance)", description = "Augmente les dégâts infligés avec des armes à distance." },
                DAMAGE_MAINHAND         = { name = "Dégâts (main principale)", description = "Augmente les dégâts de l'arme en main principale." },
                DAMAGE_OFFHAND          = { name = "Dégâts (main secondaire)", description = "Augmente les dégâts de l'arme en main secondaire." },
                DAMAGE_RANGED           = { name = "Dégâts (distance)", description = "Augmente les dégâts de l'arme à distance." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "Bonus de butin", description = "Augmente vos chances d'obtenir du butin de meilleure qualité." },
                REPUTATION              = { name = "Bonus de réputation", description = "Augmente les points de réputation gagnés auprès des factions." },
                EXPERIENCE              = { name = "Bonus d'expérience", description = "Multiplie les points d'expérience gagnés." },
                GOLD                    = { name = "Bonus d'or", description = "Augmente la quantité d'or obtenue des ennemis." },
                MOVE_SPEED              = { name = "Bonus de vitesse", description = "Augmente votre vitesse de déplacement." },
            }
        }
    },
    ["enUS"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- ========================================================================
        -- TOOLTIPS
        -- ========================================================================
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- ========================================================================
        -- POINTS DISPLAY
        -- ========================================================================
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- ========================================================================
        -- POPUP DIALOGS
        -- ========================================================================
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "Loot Bonus", description = "Increases your chances to obtain better quality loot." },
                REPUTATION              = { name = "Reputation Bonus", description = "Increases reputation points gained with factions." },
                EXPERIENCE              = { name = "Experience Bonus", description = "Multiplies experience points gained." },
                GOLD                    = { name = "Gold Bonus", description = "Increases the amount of gold obtained from enemies." },
                MOVE_SPEED              = { name = "Speed Bonus", description = "Increases your movement speed." },
            }
        }
    },
    ["deDE"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "Beutebonus", description = "Erhöht Ihre Chancen, bessere Beute zu erhalten." },
                REPUTATION              = { name = "Rufbonus", description = "Erhöht die gewonnenen Rufpunkte bei Fraktionen." },
                EXPERIENCE              = { name = "Erfahrungsbonus", description = "Multipliziert gewonnene Erfahrungspunkte." },
                GOLD                    = { name = "Goldbonus", description = "Erhöht die Menge an Gold, die von Gegnern erhalten wird." },
                MOVE_SPEED              = { name = "Geschwindigkeitsbonus", description = "Erhöht Ihre Bewegungsgeschwindigkeit." },
            }
        }
    },
    ["esES"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "Bonus de botín", description = "Aumenta tus posibilidades de obtener botín de mejor calidad." },
                REPUTATION              = { name = "Bonus de reputación", description = "Aumenta los puntos de reputación ganados con facciones." },
                EXPERIENCE              = { name = "Bonus de experiencia", description = "Multiplica los puntos de experiencia ganados." },
                GOLD                    = { name = "Bonus de oro", description = "Aumenta la cantidad de oro obtenido de enemigos." },
                MOVE_SPEED              = { name = "Bonus de velocidad", description = "Aumenta tu velocidad de movimiento." },
            }
        }
    },
    ["ruRU"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "Бонус добычи", description = "Увеличивает ваши шансы получить добычу лучшего качества." },
                REPUTATION              = { name = "Бонус репутации", description = "Увеличивает очки репутации, получаемые от фракций." },
                EXPERIENCE              = { name = "Бонус опыта", description = "Умножает получаемые очки опыта." },
                GOLD                    = { name = "Бонус золота", description = "Увеличивает количество золота, получаемого с врагов." },
                MOVE_SPEED              = { name = "Бонус скорости", description = "Увеличивает вашу скорость передвижения." },
            }
        }
    },
    ["ptBR"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "Bônus de saque", description = "Aumenta suas chances de obter saque de melhor qualidade." },
                REPUTATION              = { name = "Bônus de reputação", description = "Aumenta os pontos de reputação ganhos com facções." },
                EXPERIENCE              = { name = "Bônus de experiência", description = "Multiplica os pontos de experiência ganhos." },
                GOLD                    = { name = "Bônus de ouro", description = "Aumenta a quantidade de ouro obtido de inimigos." },
                MOVE_SPEED              = { name = "Bônus de velocidade", description = "Aumenta sua velocidade de movimento." },
            }
        }
    },
    ["itIT"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "Bonus bottino", description = "Aumenta le tue possibilità di ottenere bottino di qualità migliore." },
                REPUTATION              = { name = "Bonus reputazione", description = "Aumenta i punti reputazione guadagnati con le fazioni." },
                EXPERIENCE              = { name = "Bonus esperienza", description = "Moltiplica i punti esperienza guadagnati." },
                GOLD                    = { name = "Bonus oro", description = "Aumenta la quantità di oro ottenuto dai nemici." },
                MOVE_SPEED              = { name = "Bonus velocità", description = "Aumenta la tua velocità di movimento." },
            }
        }
    },
    ["koKR"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "전리품 보너스", description = "더 좋은 품질의 전리품을 얻을 확률을 증가시킵니다." },
                REPUTATION              = { name = "평판 보너스", description = "진영에서 얻는 평판 점수를 증가시킵니다." },
                EXPERIENCE              = { name = "경험치 보너스", description = "획득하는 경험치 점수를 배가시킵니다." },
                GOLD                    = { name = "골드 보너스", description = "적에게서 얻는 골드량을 증가시킵니다." },
                MOVE_SPEED              = { name = "속도 보너스", description = "이동 속도를 증가시킵니다." },
            }
        }
    },
    ["zhCN"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "战利品奖励", description = "增加获得更好品质战利品的几率。" },
                REPUTATION              = { name = "声望奖励", description = "增加从阵营获得的声望点数。" },
                EXPERIENCE              = { name = "经验奖励", description = "倍增获得的经验值。" },
                GOLD                    = { name = "金币奖励", description = "增加从敌人身上获得的金币数量。" },
                MOVE_SPEED              = { name = "速度奖励", description = "增加移动速度。" },
            }
        }
    },
    ["zhTW"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "戰利品獎勵", description = "增加獲得更好品質戰利品的機率。" },
                REPUTATION              = { name = "聲望獎勵", description = "增加從陣營獲得的聲望點數。" },
                EXPERIENCE              = { name = "經驗獎勵", description = "倍增獲得的經驗值。" },
                GOLD                    = { name = "金幣獎勵", description = "增加從敵人身上獲得的金幣數量。" },
                MOVE_SPEED              = { name = "速度獎勵", description = "增加移動速度。" },
            }
        }
    }
}

--- Regional variant aliases
-- Maps regional variants to their base locale
Locales["enGB"] = Locales["enUS"]
Locales["esMX"] = Locales["esES"]

--- Retrieves the localization table for the current client locale
-- Falls back to English (enUS) if the current locale is not supported
-- @return table The locale strings table for the current or default locale
-- @usage local L = GetLocaleTable(); print(L.EXPERIENCE_TEXT)
function GetLocaleTable()
    local locale = GetLocale()
    return Locales["enUS"]
end
