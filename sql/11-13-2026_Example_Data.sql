/*
SQLyog Community v13.3.1 (64 bit)
MySQL - 8.0.43-0ubuntu0.24.04.2 : Database - acore_ale
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`acore_ale` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `acore_ale`;

/*Table structure for table `account_paragon` */

DROP TABLE IF EXISTS `account_paragon`;

CREATE TABLE `account_paragon` (
  `account_id` int NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `experience` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `account_paragon` */

/*Table structure for table `character_paragon` */

DROP TABLE IF EXISTS `character_paragon`;

CREATE TABLE `character_paragon` (
  `guid` int NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `experience` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `character_paragon` */

/*Table structure for table `character_paragon_stats` */

DROP TABLE IF EXISTS `character_paragon_stats`;

CREATE TABLE `character_paragon_stats` (
  `guid` int NOT NULL,
  `stat_id` int NOT NULL,
  `stat_value` int NOT NULL,
  PRIMARY KEY (`guid`,`stat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `character_paragon_stats` */

/*Table structure for table `paragon_config` */

DROP TABLE IF EXISTS `paragon_config`;

CREATE TABLE `paragon_config` (
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `paragon_config` */

insert  into `paragon_config`(`field`,`value`) values 
('BASE_MAX_EXPERIENCE','100'),
('DEFAULT_STAT_LIMIT','255'),
('ENABLE_PARAGON_SYSTEM','1'),
('EXPERIENCE_MULTIPLIER_HIGH_LEVEL','1'),
('EXPERIENCE_MULTIPLIER_LOW_LEVEL','3'),
('HIGH_LEVEL_THRESHOLD','100'),
('LEVEL_LINKED_TO_ACCOUNT','0'),
('LOW_LEVEL_THRESHOLD','5'),
('MINIMUM_LEVEL_FOR_PARAGON_XP','1'),
('PARAGON_LEVEL_CAP','999'),
('PARAGON_STARTING_EXPERIENCE','1'),
('PARAGON_STARTING_LEVEL','1'),
('POINTS_PER_LEVEL','1'),
('UNIVERSAL_ACHIEVEVEMENT_EXPERIENCE','100'),
('UNIVERSAL_CREATURE_EXPERIENCE','50'),
('UNIVERSAL_QUEST_EXPERIENCE','75'),
('UNIVERSAL_SKILL_EXPERIENCE','25');

/*Table structure for table `paragon_config_category` */

DROP TABLE IF EXISTS `paragon_config_category`;

CREATE TABLE `paragon_config_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `paragon_config_category` */

insert  into `paragon_config_category`(`id`,`name`) values 
(1,'Defense'),
(2,'Attack'),
(3,'Magic'),
(4,'Other');

/*Table structure for table `paragon_config_experience_achievement` */

DROP TABLE IF EXISTS `paragon_config_experience_achievement`;

CREATE TABLE `paragon_config_experience_achievement` (
  `id` int NOT NULL,
  `experience` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `paragon_config_experience_achievement` */

/*Table structure for table `paragon_config_experience_creature` */

DROP TABLE IF EXISTS `paragon_config_experience_creature`;

CREATE TABLE `paragon_config_experience_creature` (
  `id` int NOT NULL,
  `experience` int NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `paragon_config_experience_creature` */

/*Table structure for table `paragon_config_experience_quest` */

DROP TABLE IF EXISTS `paragon_config_experience_quest`;

CREATE TABLE `paragon_config_experience_quest` (
  `id` int NOT NULL,
  `experience` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `paragon_config_experience_quest` */

/*Table structure for table `paragon_config_experience_skill` */

DROP TABLE IF EXISTS `paragon_config_experience_skill`;

CREATE TABLE `paragon_config_experience_skill` (
  `id` int NOT NULL,
  `experience` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `paragon_config_experience_skill` */

/*Table structure for table `paragon_config_statistic` */

DROP TABLE IF EXISTS `paragon_config_statistic`;

CREATE TABLE `paragon_config_statistic` (
  `id` int NOT NULL,
  `category` int NOT NULL DEFAULT '1',
  `type` enum('AURA','COMBAT_RATING','UNIT_MODS') NOT NULL DEFAULT 'AURA',
  `type_value` enum('WEAPON_SKILL','DEFENSE_SKILL','DODGE','PARRY','BLOCK','HIT_MELEE','HIT_RANGED','HIT_SPELL','CRIT_MELEE','CRIT_RANGED','CRIT_SPELL','HIT_TAKEN_MELEE','HIT_TAKEN_RANGED','HIT_TAKEN_SPELL','CRIT_TAKEN_MELEE','CRIT_TAKEN_RANGED','CRIT_TAKEN_SPELL','HASTE_MELEE','HASTE_RANGED','HASTE_SPELL','WEAPON_SKILL_MAINHAND','WEAPON_SKILL_OFFHAND','WEAPON_SKILL_RANGED','EXPERTISE','ARMOR_PENETRATION','STAT_STRENGTH','STAT_AGILITY','STAT_STAMINA','STAT_INTELLECT','STAT_SPIRIT','HEALTH','MANA','RAGE','FOCUS','ENERGY','HAPPINESS','RUNE','RUNIC_POWER','ARMOR','RESISTANCE_HOLY','RESISTANCE_FIRE','RESISTANCE_NATURE','RESISTANCE_FROST','RESISTANCE_SHADOW','RESISTANCE_ARCANE','ATTACK_POWER','ATTACK_POWER_RANGED','DAMAGE_MAINHAND','DAMAGE_OFFHAND','DAMAGE_RANGED','LOOT','REPUTATION','EXPERIENCE','GOLD','MOVE_SPEED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'STAT_STRENGTH',
  `icon` varchar(50) NOT NULL DEFAULT '0',
  `factor` int NOT NULL DEFAULT '1',
  `limit` int NOT NULL DEFAULT '255',
  `application` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category`) REFERENCES `paragon_config_category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `paragon_config_statistic` */

insert  into `paragon_config_statistic`(`id`,`category`,`type`,`type_value`,`icon`,`factor`,`limit`,`application`) values 
(1,1,'UNIT_MODS','ARMOR','Interface/Icons/INV_Chest_Plate01',1,0,0),
(2,1,'COMBAT_RATING','PARRY','Interface/Icons/Ability_Parry',1,0,0),
(3,1,'COMBAT_RATING','BLOCK','Interface/Icons/Ability_Defend',1,0,0),
(4,1,'COMBAT_RATING','DEFENSE_SKILL','Interface/Icons/Spell_Holy_MindSooth',1,0,0),
(5,1,'COMBAT_RATING','DODGE','Interface/Icons/spell_arcane_blink',1,0,0),
(6,2,'UNIT_MODS','STAT_STRENGTH','Interface/Icons/Ability_Warrior_InnerRage',1,0,0),
(7,2,'UNIT_MODS','STAT_AGILITY','Interface/Icons/Ability_Rogue_Sprint',1,0,0),
(8,2,'COMBAT_RATING','CRIT_MELEE','Interface/Icons/Ability_CriticalStrike',1,0,0),
(9,2,'COMBAT_RATING','HASTE_MELEE','Interface/Icons/Spell_Nature_Bloodlust',1,0,0),
(10,2,'COMBAT_RATING','ARMOR_PENETRATION','Interface/Icons/Ability_Warrior_Riposte',1,0,0),
(11,3,'UNIT_MODS','STAT_INTELLECT','Interface/Icons/Spell_Holy_MagicalSentry',1,0,0),
(12,3,'UNIT_MODS','STAT_SPIRIT','Interface/Icons/spell_holy_spiritualguidence',1,0,0),
(13,3,'COMBAT_RATING','HIT_SPELL','Interface/Icons/Spell_Arcane_Blast',1,0,0),
(14,3,'COMBAT_RATING','HASTE_SPELL','Interface/Icons/Spell_Frost_ManaBurn',1,0,0),
(15,4,'AURA','EXPERIENCE','Interface/Icons/INV_Misc_Book_11',1,255,0),
(16,4,'AURA','MOVE_SPEED','Interface/Icons/Ability_Druid_Dash',1,255,0),
(17,4,'AURA','LOOT','Interface/Icons/INV_Misc_Bag_10_Blue',1,255,0),
(18,4,'AURA','GOLD','Interface/Icons/INV_Misc_Coin_01',1,255,0),
(19,4,'AURA','REPUTATION','Interface/Icons/Achievement_Reputation_01',1,255,0);

/* Trigger structure for table `paragon_config_statistic` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `paragon_config_statistics_before_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'wowserver'@'%' */ /*!50003 TRIGGER `paragon_config_statistics_before_insert` BEFORE INSERT ON `paragon_config_statistic` FOR EACH ROW BEGIN
    DECLARE v_type VARCHAR(50);
    DECLARE v_value VARCHAR(50);

    SET v_type = NEW.type;
    SET v_value = NEW.type_value;

    -- Vérification pour COMBAT_RATING
    IF v_type = 'COMBAT_RATING' THEN
        IF v_value NOT IN (
            'WEAPON_SKILL',
            'DEFENSE_SKILL',
            'DODGE',
            'PARRY',
            'BLOCK',
            'HIT_MELEE',
            'HIT_RANGED',
            'HIT_SPELL',
            'CRIT_MELEE',
            'CRIT_RANGED',
            'CRIT_SPELL',
            'HIT_TAKEN_MELEE',
            'HIT_TAKEN_RANGED',
            'HIT_TAKEN_SPELL',
            'CRIT_TAKEN_MELEE',
            'CRIT_TAKEN_RANGED',
            'CRIT_TAKEN_SPELL',
            'HASTE_MELEE',
            'HASTE_RANGED',
            'HASTE_SPELL',
            'WEAPON_SKILL_MAINHAND',
            'WEAPON_SKILL_OFFHAND',
            'WEAPON_SKILL_RANGED',
            'EXPERTISE',
            'ARMOR_PENETRATION'
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid COMBAT_RATING value for this type.';
        END IF;
    END IF;

    -- Vérification pour UNIT_MODS
    IF v_type = 'UNIT_MODS' THEN
        IF v_value NOT IN (
            'STAT_STRENGTH',
            'STAT_AGILITY',
            'STAT_STAMINA',
            'STAT_INTELLECT',
            'STAT_SPIRIT',
            'HEALTH',
            'MANA',
            'RAGE',
            'FOCUS',
            'ENERGY',
            'HAPPINESS',
            'RUNE',
            'RUNIC_POWER',
            'ARMOR',
            'RESISTANCE_HOLY',
            'RESISTANCE_FIRE',
            'RESISTANCE_NATURE',
            'RESISTANCE_FROST',
            'RESISTANCE_SHADOW',
            'RESISTANCE_ARCANE',
            'ATTACK_POWER',
            'ATTACK_POWER_RANGED',
            'DAMAGE_MAINHAND',
            'DAMAGE_OFFHAND',
            'DAMAGE_RANGED'
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid UNIT_MODS value for this type.';
        END IF;
    END IF;

    -- Vérification pour AURA
    IF v_type = 'AURA' THEN
        IF v_value NOT IN ('LOOT', 'REPUTATION', 'EXPERIENCE', 'GOLD', 'MOVE_SPEED') THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid AURA value for this type.';
        END IF;
    END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `paragon_config_statistic` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `paragon_config_statistics_before_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'wowserver'@'%' */ /*!50003 TRIGGER `paragon_config_statistics_before_update` BEFORE UPDATE ON `paragon_config_statistic` FOR EACH ROW BEGIN
    DECLARE v_type VARCHAR(50);
    DECLARE v_value VARCHAR(50);

    SET v_type = NEW.type;
    SET v_value = NEW.type_value;

    -- Vérification pour COMBAT_RATING
    IF v_type = 'COMBAT_RATING' THEN
        IF v_value NOT IN (
            'WEAPON_SKILL',
            'DEFENSE_SKILL',
            'DODGE',
            'PARRY',
            'BLOCK',
            'HIT_MELEE',
            'HIT_RANGED',
            'HIT_SPELL',
            'CRIT_MELEE',
            'CRIT_RANGED',
            'CRIT_SPELL',
            'HIT_TAKEN_MELEE',
            'HIT_TAKEN_RANGED',
            'HIT_TAKEN_SPELL',
            'CRIT_TAKEN_MELEE',
            'CRIT_TAKEN_RANGED',
            'CRIT_TAKEN_SPELL',
            'HASTE_MELEE',
            'HASTE_RANGED',
            'HASTE_SPELL',
            'WEAPON_SKILL_MAINHAND',
            'WEAPON_SKILL_OFFHAND',
            'WEAPON_SKILL_RANGED',
            'EXPERTISE',
            'ARMOR_PENETRATION'
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid COMBAT_RATING value for this type.';
        END IF;
    END IF;

    -- Vérification pour UNIT_MODS
    IF v_type = 'UNIT_MODS' THEN
        IF v_value NOT IN (
            'STAT_STRENGTH',
            'STAT_AGILITY',
            'STAT_STAMINA',
            'STAT_INTELLECT',
            'STAT_SPIRIT',
            'HEALTH',
            'MANA',
            'RAGE',
            'FOCUS',
            'ENERGY',
            'HAPPINESS',
            'RUNE',
            'RUNIC_POWER',
            'ARMOR',
            'RESISTANCE_HOLY',
            'RESISTANCE_FIRE',
            'RESISTANCE_NATURE',
            'RESISTANCE_FROST',
            'RESISTANCE_SHADOW',
            'RESISTANCE_ARCANE',
            'ATTACK_POWER',
            'ATTACK_POWER_RANGED',
            'DAMAGE_MAINHAND',
            'DAMAGE_OFFHAND',
            'DAMAGE_RANGED'
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid UNIT_MODS value for this type.';
        END IF;
    END IF;

    -- Vérification pour AURA
    IF v_type = 'AURA' THEN
        IF v_value NOT IN ('LOOT', 'REPUTATION', 'EXPERIENCE', 'GOLD', 'MOVE_SPEED') THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid AURA value for this type.';
        END IF;
    END IF;
END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
