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
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        STATISTICS_TEXT = "Statistiques",
        SHOW_MAINMENU_XP_LABEL = "Afficher la barre XP sur l'interface principale",
        SHOW_MAINMENU_XP_TOOLTIP = "Si coché, affiche la barre d'expérience Paragon au-dessus de la barre XP de votre personnage en bas de l'écran.",

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
        -- APPLY BUTTON
        -- ========================================================================
        APPLY_BUTTON_TEXT = "Appliquer",

        -- ========================================================================
        -- NOTIFICATION BADGE
        -- ========================================================================
        NOTIFICATION_TITLE = "Points Paragon non distribués",
        NOTIFICATION_MESSAGE = "Vous avez des points Paragon non distribués !",
        NOTIFICATION_DISMISS = "Cliquer pour masquer cette notification.",

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
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        STATISTICS_TEXT = "Statistics",
        SHOW_MAINMENU_XP_LABEL = "Show XP bar on main interface",
        SHOW_MAINMENU_XP_TOOLTIP = "If checked, displays the Paragon experience bar above your character's XP bar at the bottom of the screen.",

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
        -- APPLY BUTTON
        -- ========================================================================
        APPLY_BUTTON_TEXT = "Apply",

        -- ========================================================================
        -- NOTIFICATION BADGE
        -- ========================================================================
        NOTIFICATION_TITLE = "Unspent Paragon Points",
        NOTIFICATION_MESSAGE = "You have unspent Paragon points!",
        NOTIFICATION_DISMISS = "Click to dismiss this notification.",

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
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        STATISTICS_TEXT = "Statistics",
        SHOW_MAINMENU_XP_LABEL = "XP-Leiste auf Hauptinterface anzeigen",
        SHOW_MAINMENU_XP_TOOLTIP = "Wenn aktiviert, wird die Paragon-Erfahrungsleiste über der Charakterleiste am unteren Bildschirmrand angezeigt.",

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
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        SHOW_MAINMENU_XP_LABEL = "Mostrar barra de XP en interfaz principal",
        SHOW_MAINMENU_XP_TOOLTIP = "Si está marcado, muestra la barra de experiencia de Paragon encima de la barra de XP de tu personaje en la parte inferior de la pantalla.",
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
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        SHOW_MAINMENU_XP_LABEL = "Показать полосу опыта на основном интерфейсе",
        SHOW_MAINMENU_XP_TOOLTIP = "Если отмечено, отображает полосу опыта Парагона над полосой опыта вашего персонажа в нижней части экрана.",
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
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        SHOW_MAINMENU_XP_LABEL = "Mostrar barra de XP na interface principal",
        SHOW_MAINMENU_XP_TOOLTIP = "Se marcado, exibe a barra de experiência Paragon acima da barra de XP do seu personagem na parte inferior da tela.",
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
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        SHOW_MAINMENU_XP_LABEL = "Mostra barra XP sull'interfaccia principale",
        SHOW_MAINMENU_XP_TOOLTIP = "Se selezionato, visualizza la barra esperienza Paragon sopra la barra XP del tuo personaggio nella parte inferiore dello schermo.",
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
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        SHOW_MAINMENU_XP_LABEL = "메인 인터페이스에 경험치 바 표시",
        SHOW_MAINMENU_XP_TOOLTIP = "선택하면 화면 하단의 캐릭터 경험치 바 위에 파라곤 경험치 바가 표시됩니다.",
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
    EXPERIENCE_TEXT = "经验 %d / %d",
    PARAGON_EXPERIENCE_TEXT = "巅峰等级 %d / %d（%d%%）",
    SHOW_MAINMENU_XP_LABEL = "在游戏主界面，显示巅峰经验条",
    SHOW_MAINMENU_XP_TOOLTIP = "选中后，会在人物原版经验条上方额外添加巅峰经验条。",
    STATISTICS_TEXT = "属性统计",

    -- ========================================================================
    -- CATEGORY NAMES (Custom translations)
    -- ========================================================================
    DEFENSE_TEXT = "防御",
    ATTACK_TEXT = "攻击",
    MAGIC_TEXT = "法术",
    OTHER_TEXT = "其他",

    -- Tooltip instructions
    TOOLTIP_INSTRUCTIONS = "左键/右键增加/扣除1点。\n滚轮上/下批量增减点数。\n中键快捷分配。",
    TOOLTIP_LIMIT = "上限：%d",

    -- Points display
    POINTS_TO_SPEND = "（剩余%d点可分配）",
    POINTS_SINGULAR = "点数",
    POINTS_PLURAL = "点数",

    -- ========================================================================
    -- POPUP DIALOGS
    -- ========================================================================
    POPUP_CHOOSE_ACTION = "增加还是扣除属性点？",
    POPUP_BUTTON_ADD = "增加",
    POPUP_BUTTON_REMOVE = "扣除",
    POPUP_ENTER_AMOUNT = "需要在%s上%s多少点数？",
    POPUP_ACTION_ADD = "增加",
    POPUP_ACTION_REMOVE = "扣除",
    POPUP_BUTTON_CONFIRM = "确认",
    POPUP_BUTTON_CANCEL = "取消",

    -- ========================================================================
    -- APPLY BUTTON
    -- ========================================================================
    APPLY_BUTTON_TEXT = "应用",

    -- ========================================================================
    -- TUTORIAL MODE
    -- ========================================================================
    BUTTON_HELP = "教程",
    TUTORIAL_TITLE = "帮助 - 巅峰加点界面",
    TUTORIAL_BUTTON_NEXT = "下一步",
    TUTORIAL_BUTTON_PREVIOUS = "上一步",
    TUTORIAL_BUTTON_CLOSE = "关闭",
    TUTORIAL_BUTTON_FINISH = "完成",
    TUTORIAL_STEP_COUNTER = "第%d/%d步",
    TUTORIAL_COMPLETE = "教程完成！",
    TUTORIAL_LEVEL = "巅峰等级|n显示当前巅峰等级。",
    TUTORIAL_XP_BAR = "巅峰经验条|n显示升级进度。|n悬停查看经验详情。",
    TUTORIAL_POINTS = "可用点数|n升级获得，用于分配属性。",
    TUTORIAL_HELP_BUTTON = "帮助按钮|n随时重新打开教程。",
    TUTORIAL_CATEGORIES = "属性分类|n分为防御、攻击、法术、其他四类。",
    TUTORIAL_STATS = "属性操作|n|n左键:+1|n右键:-1|n滚轮上:+5|n滚轮下:-5|n中键:快捷分配|n|n悬停查看属性说明。",

    -- ========================================================================
    -- STATISTICS
    -- ========================================================================
    STATISTICS = {
        -- Combat Rating Statistics
        COMBAT_RATING = {
            WEAPON_SKILL            = { name = "全武器技能", description = "提升所有武器的武器技能。" },
            DEFENSE_SKILL           = { name = "防御技能", description = "提升自身防御技能。" },
            DODGE                   = { name = "躲闪等级", description = "提升躲闪等级。" },
            PARRY                   = { name = "招架等级", description = "提升招架等级。" },
            BLOCK                   = { name = "格挡等级", description = "提升盾牌格挡等级。" },
            HIT_MELEE               = { name = "近战命中等级", description = "提升近战命中几率。" },
            HIT_RANGED              = { name = "远程命中等级", description = "提升远程命中几率。" },
            HIT_SPELL               = { name = "法术命中等级", description = "提升法术命中几率。" },
            CRIT_MELEE              = { name = "近战暴击等级", description = "提升近战暴击几率。" },
            CRIT_RANGED             = { name = "远程暴击等级", description = "提升远程暴击几率。" },
            CRIT_SPELL              = { name = "法术暴击等级", description = "提升法术暴击几率。" },
            HIT_TAKEN_MELEE         = { name = "易被近战命中", description = "提升受到近战攻击命中的概率。" },       -- NOTE: Does this increase OR decrease damage taken
            HIT_TAKEN_RANGED        = { name = "易被远程命中", description = "提升受到远程攻击命中的概率。" },
            HIT_TAKEN_SPELL         = { name = "易被法术命中", description = "提升受到法术命中的概率。" },
            CRIT_TAKEN_MELEE        = { name = "易被近战暴击", description = "提升受到近战暴击的概率。" },
            CRIT_TAKEN_RANGED       = { name = "易被远程暴击", description = "提升受到远程暴击的概率。" },
            CRIT_TAKEN_SPELL        = { name = "易被法术暴击", description = "提升受到法术暴击的概率。" },
            HASTE_MELEE             = { name = "近战急速等级", description = "提升近战攻击速度。" },
            HASTE_RANGED            = { name = "远程急速等级", description = "提升远程攻击速度。" },
            HASTE_SPELL             = { name = "法术急速等级", description = "提升法术施法速度。" },
            WEAPON_SKILL_MAINHAND   = { name = "主手武器技能", description = "提升主手武器技能。" },
            WEAPON_SKILL_OFFHAND    = { name = "副手武器技能", description = "提升副手武器技能。" },
            WEAPON_SKILL_RANGED     = { name = "远程武器技能", description = "提升远程武器技能。" },
            EXPERTISE               = { name = "精准等级", description = "降低目标躲闪与招架你的攻击的概率。" },
            ARMOR_PENETRATION       = { name = "护甲穿透等级", description = "攻击忽略目标一定比例护甲。" },
        },

        -- Unit Modifier Statistics
        UNIT_MODS = {
            STAT_STRENGTH           = { name = "力量", description = "提升力量属性，增加近战攻击强度。" },
            STAT_AGILITY            = { name = "敏捷", description = "提升敏捷属性，增加远程攻强、躲闪与暴击几率。" },
            STAT_STAMINA            = { name = "耐力", description = "提升耐力属性，增加生命值上限。" },
            STAT_INTELLECT          = { name = "智力", description = "提升智力属性，增加法术强度与法力上限。" },
            STAT_SPIRIT             = { name = "精神", description = "提升精神属性，加快生命与法力回复速度。" },
            HEALTH                  = { name = "生命值上限", description = "提升生命值上限。" },
            MANA                    = { name = "法力值上限", description = "提升法力值上限。" },
            RAGE                    = { name = "怒气获取", description = "提升怒气获取效率（战士、德鲁伊）。" },
            FOCUS                   = { name = "集中值上限", description = "提升集中值上限（猎人）。" },
            ENERGY                  = { name = "能量恢复", description = "提升能量恢复速度（盗贼、德鲁伊）。" },
            HAPPINESS               = { name = "宠物快乐值", description = "提升宠物快乐值（猎人）。" },
            RUNE                    = { name = "符文恢复", description = "加快符文冷却恢复（死亡骑士）。" },
            RUNIC_POWER             = { name = "符文能量上限", description = "提升符文能量上限（死亡骑士）。" },
            ARMOR                   = { name = "护甲值", description = "提升护甲数值，减免受到的物理伤害。" },
            RESISTANCE_HOLY         = { name = "神圣抗性", description = "提升神圣法术抗性。" },
            RESISTANCE_FIRE         = { name = "火焰抗性", description = "提升火焰法术抗性。" },
            RESISTANCE_NATURE       = { name = "自然抗性", description = "提升自然法术抗性。" },
            RESISTANCE_FROST        = { name = "冰霜抗性", description = "提升冰霜法术抗性。" },
            RESISTANCE_SHADOW       = { name = "暗影抗性", description = "提升暗影法术抗性。" },
            RESISTANCE_ARCANE       = { name = "奥术抗性", description = "提升奥术法术抗性。" },
            ATTACK_POWER            = { name = "近战攻击强度", description = "提升近战武器造成的伤害。" },
            ATTACK_POWER_RANGED     = { name = "远程攻击强度", description = "提升远程武器造成的伤害。" },
            DAMAGE_MAINHAND         = { name = "主手武器伤害", description = "提升主手武器伤害。" },
            DAMAGE_OFFHAND          = { name = "副手武器伤害", description = "提升副手武器伤害。" },
            DAMAGE_RANGED           = { name = "远程武器伤害", description = "提升远程武器伤害。" },
        },

        -- Aura Bonuses
        AURA = {
            LOOT                    = { name = "战利品奖励", description = "增加获得更好品质战利品的几率。" },
            REPUTATION              = { name = "声望奖励", description = "增加从阵营获得的声望点数。" },
            EXPERIENCE              = { name = "经验奖励", description = "倍增获得的经验值。" },
            GOLD                    = { name = "金币奖励", description = "增加从敌人身上获得的金币数量。" },
            MOVE_SPEED              = { name = "移速奖励", description = "增加移动速度。" },
        }
    }
},
    ["zhTW"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        SHOW_MAINMENU_XP_LABEL = "在主介面上顯示經驗條",
        SHOW_MAINMENU_XP_TOOLTIP = "如果勾選，將在螢幕底部角色經驗條上方顯示巔峰經驗條。",
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
    return Locales[locale] or Locales["enUS"]
end
