-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 21 Haz 2023, 00:26:59
-- Sunucu sürümü: 10.4.27-MariaDB
-- PHP Sürümü: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `pvp`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bank_log`
--

CREATE TABLE `bank_log` (
  `id` int(11) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `idClan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `chat_log`
--

CREATE TABLE `chat_log` (
  `id` int(11) NOT NULL,
  `playerName` varchar(255) DEFAULT NULL,
  `playerId` int(11) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `date` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `chat_permissions`
--

CREATE TABLE `chat_permissions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `html_code` varchar(2000) NOT NULL,
  `active` int(11) NOT NULL,
  `event_code` varchar(10) NOT NULL,
  `eventoname` varchar(9999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Tablo döküm verisi `event`
--

INSERT INTO `event` (`id`, `html_code`, `active`, `event_code`, `eventoname`) VALUES
(1, '', 1, '', 'Spaceball'),
(2, '', 0, '', 'B.Royal'),
(3, '', 0, '', 'Jpb'),
(4, '', 0, '', 'Invasion'),
(5, '', 0, '', 'Demaner'),
(6, '', 1, '', 'Meteorit');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `event_coins`
--

CREATE TABLE `event_coins` (
  `id` int(11) NOT NULL,
  `coins` int(11) NOT NULL,
  `userId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gg_log`
--

CREATE TABLE `gg_log` (
  `id` int(11) NOT NULL,
  `log` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `info_galaxygates`
--

CREATE TABLE `info_galaxygates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gateId` int(11) NOT NULL,
  `parts` varchar(255) NOT NULL,
  `cost` varchar(10) NOT NULL,
  `live_cost` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `info_galaxygates`
--

INSERT INTO `info_galaxygates` (`id`, `name`, `gateId`, `parts`, `cost`, `live_cost`) VALUES
(1, 'Alpha', 1, '34', '5000', '10000'),
(2, 'Beta', 2, '48', '10000', '10000'),
(3, 'Gamma', 3, '82', '15000', '10000'),
(4, 'Delta', 4, '128', '20000', '10000');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `log_event_jpb`
--

CREATE TABLE `log_event_jpb` (
  `id` int(11) NOT NULL,
  `players` text NOT NULL,
  `finalists` text NOT NULL,
  `winner_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `log_event_uba`
--

CREATE TABLE `log_event_uba` (
  `id` int(11) NOT NULL,
  `players` text NOT NULL,
  `finalists` text NOT NULL,
  `winner_id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `top` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `log_player_kills`
--

CREATE TABLE `log_player_kills` (
  `id` int(11) NOT NULL,
  `killer_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `pushing` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `uba` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `manage_events`
--

CREATE TABLE `manage_events` (
  `id` int(11) NOT NULL,
  `event` varchar(255) DEFAULT NULL,
  `commandEvent` varchar(255) DEFAULT NULL,
  `canStop` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `manage_events`
--

INSERT INTO `manage_events` (`id`, `event`, `commandEvent`, `canStop`) VALUES
(1, 'Spaceball', '/start-spaceball', '1'),
(2, 'B.royal', '/start_royal', '0'),
(3, 'Company', '/start_company', '0'),
(4, 'Invasion', '/start-invasion', '1'),
(5, 'Team', '/start-team', '0'),
(6, 'Demaner', '/start_demaner', '0'),
(7, 'Meteorit', '/start_meteorit', '0'),
(8, 'Cubikon', '/start_cubikon', '0'),
(9, 'Jackpot', '/start-jpb', '0');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mm_queue`
--

CREATE TABLE `mm_queue` (
  `id` int(11) NOT NULL,
  `ready` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `found` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `newsclantablelog`
--

CREATE TABLE `newsclantablelog` (
  `id` int(11) NOT NULL,
  `date` text NOT NULL,
  `texto` longtext NOT NULL,
  `leaderId` varchar(999) NOT NULL,
  `clanId` int(11) NOT NULL,
  `type` enum('new','logbank','joinmember','logusers','settings','systembank') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `platforms`
--

CREATE TABLE `platforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `player_accounts`
--

CREATE TABLE `player_accounts` (
  `userId` int(20) NOT NULL,
  `sessionId` varchar(32) NOT NULL,
  `data` text NOT NULL DEFAULT '{"uridium":200000,"credits":300000,"honor":0,"experience":0,"jackpot":0}',
  `bootyKeys` text NOT NULL DEFAULT '{"greenKeys":5,"redKeys":5,"blueKeys":5}',
  `info` text NOT NULL,
  `destructions` text NOT NULL DEFAULT '{"fpd":0,"dbrz":0}',
  `username` varchar(20) NOT NULL,
  `pilotName` varchar(20) NOT NULL,
  `petName` varchar(20) NOT NULL DEFAULT 'P.E.T 15',
  `password` varchar(255) NOT NULL,
  `email` varchar(260) NOT NULL,
  `shipId` int(11) NOT NULL DEFAULT 1,
  `premium` tinyint(1) NOT NULL DEFAULT 0,
  `title` varchar(128) NOT NULL DEFAULT '',
  `factionId` int(1) NOT NULL DEFAULT 0,
  `clanId` int(11) NOT NULL DEFAULT 0,
  `rankId` int(2) NOT NULL DEFAULT 1,
  `rankPoints` bigint(20) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0,
  `warBattel` int(11) DEFAULT 0,
  `warPoints` int(11) DEFAULT 0,
  `warRank` int(11) DEFAULT 1,
  `extraEnergy` int(11) NOT NULL,
  `nanohull` int(11) NOT NULL,
  `verification` text NOT NULL,
  `oldPilotNames` tinytext NOT NULL DEFAULT '[]',
  `version` tinyint(4) NOT NULL DEFAULT 1,
  `oldPetNames` tinytext NOT NULL DEFAULT '[]',
  `staff` enum('1','0') DEFAULT '0',
  `petDesign` int(20) DEFAULT 22,
  `petExp` longtext DEFAULT '0',
  `peteExp` longtext NOT NULL DEFAULT '0',
  `droneExp` longtext NOT NULL DEFAULT '0',
  `ammo` text NOT NULL DEFAULT '{"mcb25":1000,"lcb10":1500,"mcb50":1000,"hstrm":500,"sar2":500,"ucb":500,"rsb":200,"job100":100,"cbo100":1000,"sab":300,"pib":100,"ish":5,"emp":5,"smb":5,"plt3030":50,"ice":10,"dcr":9,"wiz":20,"pld":10,"slm":10,"ddm":10,"empm":1,"sabm":10,"cloacks":10,"r310":100,"plt26":100,"plt21":100}',
  `petSavedDesigns` varchar(255) NOT NULL DEFAULT '[]',
  `level` smallint(6) DEFAULT 1,
  `nextLevel` smallint(6) DEFAULT 2,
  `MaxEGWave` int(11) DEFAULT 0,
  `EGWave` int(11) DEFAULT 0,
  `EGKeys` int(11) DEFAULT 0,
  `EgLifes` int(11) DEFAULT 0,
  `ubaPoints` int(11) DEFAULT 0,
  `EGMult` int(11) DEFAULT 0,
  `mapID` int(11) NOT NULL DEFAULT 1,
  `posX` int(11) NOT NULL DEFAULT 2000,
  `posY` int(11) NOT NULL DEFAULT 2000,
  `kills` int(11) NOT NULL DEFAULT 0,
  `cargo` text NOT NULL DEFAULT '[0,0,0,0,0,0,0,0,0]',
  `skylab` text NOT NULL,
  `position` text NOT NULL DEFAULT '{"mapID":0,"x":0,"y":0}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `player_designs`
--

CREATE TABLE `player_designs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `baseShipId` int(11) NOT NULL,
  `userId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `player_equipment`
--

CREATE TABLE `player_equipment` (
  `userId` int(11) NOT NULL,
  `config1_lasers` text NOT NULL DEFAULT '[]',
  `config1_generators` text NOT NULL DEFAULT '[]',
  `config1_drones` text NOT NULL DEFAULT '[{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]}]',
  `config2_lasers` text NOT NULL DEFAULT '[]',
  `config2_generators` text NOT NULL DEFAULT '[]',
  `config2_drones` text NOT NULL DEFAULT '[{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]}]',
  `items` text NOT NULL DEFAULT ' {"lf5Count":0,"lf4Count":0,"lf3Count":0,"lf2Count":2,"lf1Count":2,"bo3Count":0,"bo2Count":1,"B01Count":0,"A03Count":0,"A02Count":0,"A01Count":0,"g3n6900Count":0,"g3n3310Count":0,"g3n3210Count":0,"g3n2010Count":0,"g3n1010Count":0,"g3nCount":1,"havocCount":0,"spartanCount":0,"cyborgCount":10,"herculesCount":0,"iriscount":0,"havocCount":0,"herculesCount":0,"apis":false,"zeus":false,"pet":false,"petModules":[],"ships":[1],"designs":{},"skillTree":{"logdisks":0,"researchPoints":0,"resetCount":0}}',
  `skill_points` text NOT NULL DEFAULT '{"engineering":0,"shieldEngineering":0,"detonation1":0,"detonation2":0,"heatseekingMissiles":0,"rocketFusion":0,"cruelty1":0,"cruelty2":0,"explosives":0,"luck1":0,"luck2":0,"npc1":0,"npc2":0}',
  `modules` longtext NOT NULL DEFAULT '[]',
  `boosters` longtext NOT NULL DEFAULT '{"1":[],"2":[],"3":[],"4":[],"5":[],"6":[],"7":[],"8":[],"9":[],"10":[],"11":[],"12":[],"13":[],"14":[],"15":[],"16":[],"17":[],"18":[],"19":[],"20":[],"21":[],"22":[],"23":[],"24":[],"25":[],"26":[]}',
  `boostersList` longtext DEFAULT NULL,
  `ModulesList` longtext DEFAULT NULL,
  `lf4lvl` int(11) NOT NULL DEFAULT 1,
  `promelvl` int(11) NOT NULL DEFAULT 1,
  `iris` int(11) NOT NULL DEFAULT 0,
  `lf3lvl` int(11) NOT NULL DEFAULT 1,
  `lf2lvl` int(11) NOT NULL DEFAULT 1,
  `lf1lvl` int(11) NOT NULL DEFAULT 1,
  `mp1lvl` int(11) NOT NULL DEFAULT 1,
  `lf5lvl` int(11) NOT NULL DEFAULT 1,
  `A01lvl` int(11) DEFAULT 1,
  `A02lvl` int(11) DEFAULT 1,
  `A03lvl` int(11) DEFAULT 1,
  `B01lvl` int(11) DEFAULT 1,
  `B02lvl` int(11) DEFAULT 1,
  `B03lvl` int(11) DEFAULT 1,
  `formationsSaved` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `player_galaxygates`
--

CREATE TABLE `player_galaxygates` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `gateId` int(11) NOT NULL,
  `parts` longtext NOT NULL DEFAULT '[]',
  `multiplier` int(11) NOT NULL DEFAULT 0,
  `lives` int(11) NOT NULL DEFAULT -1,
  `prepared` tinyint(4) NOT NULL DEFAULT 0,
  `wave` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `player_settings`
--

CREATE TABLE `player_settings` (
  `userId` int(11) NOT NULL,
  `audio` text NOT NULL DEFAULT '',
  `quality` text NOT NULL DEFAULT '',
  `classY2T` text NOT NULL DEFAULT '',
  `display` text NOT NULL DEFAULT '',
  `gameplay` text NOT NULL DEFAULT '',
  `window` text NOT NULL DEFAULT '',
  `boundKeys` text NOT NULL DEFAULT '',
  `inGameSettings` text NOT NULL DEFAULT '',
  `cooldowns` text NOT NULL DEFAULT '',
  `slotbarItems` text NOT NULL DEFAULT '',
  `premiumSlotbarItems` text NOT NULL DEFAULT '',
  `proActionBarItems` text NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `player_titles`
--

CREATE TABLE `player_titles` (
  `userID` int(11) NOT NULL,
  `titles` varchar(255) NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `server_bans`
--

CREATE TABLE `server_bans` (
  `id` bigint(20) NOT NULL,
  `userId` int(11) NOT NULL,
  `modId` int(11) NOT NULL,
  `reason` text NOT NULL,
  `typeId` tinyint(4) NOT NULL,
  `ended` tinyint(1) NOT NULL,
  `end_date` datetime NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `server_battlestations`
--

CREATE TABLE `server_battlestations` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `mapId` int(11) NOT NULL,
  `clanId` int(11) NOT NULL,
  `positionX` int(11) NOT NULL,
  `positionY` int(11) NOT NULL,
  `inBuildingState` tinyint(4) NOT NULL,
  `buildTimeInMinutes` int(11) NOT NULL,
  `buildTime` datetime NOT NULL,
  `deflectorActive` tinyint(4) NOT NULL,
  `deflectorSecondsLeft` int(11) NOT NULL,
  `deflectorTime` datetime NOT NULL,
  `visualModifiers` text NOT NULL,
  `modules` longtext NOT NULL,
  `active` tinyint(4) NOT NULL,
  `protectedClanId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `server_battlestations`
--

INSERT INTO `server_battlestations` (`id`, `name`, `mapId`, `clanId`, `positionX`, `positionY`, `inBuildingState`, `buildTimeInMinutes`, `buildTime`, `deflectorActive`, `deflectorSecondsLeft`, `deflectorTime`, `visualModifiers`, `modules`, `active`, `protectedClanId`) VALUES
(1, 'Aries', 3, 0, 10500, 2500, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(2, 'Balzar', 4, 0, 4500, 9300, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(3, 'Cetus', 17, 0, 17000, 2500, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(4, 'Draco', 18, 0, 10000, 6500, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(5, 'Equleus', 19, 0, 10000, 7500, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(6, 'Fornax', 7, 0, 10500, 2500, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(7, 'Gemini', 8, 0, 16000, 8500, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(8, 'Hydra', 21, 0, 10500, 9000, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(9, 'Indus', 22, 0, 9000, 6500, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(10, 'Julius', 23, 0, 10500, 6000, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(11, 'Kepler', 11, 0, 10500, 2500, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(12, 'Lynx', 12, 0, 4500, 9000, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(13, 'Mensa', 25, 0, 11000, 9000, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(14, 'Nashira', 26, 0, 10000, 8500, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(15, 'Orion', 27, 0, 10500, 5000, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(16, 'Volan', 13, 0, 10000, 6000, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(17, 'Wican', 14, 0, 11500, 6000, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(18, 'Xenitor', 15, 0, 9000, 6000, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0),
(19, 'Yukian', 16, 0, 9000, 6000, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 1, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `server_clans`
--

CREATE TABLE `server_clans` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `tag` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` varchar(16000) NOT NULL DEFAULT '',
  `factionId` tinyint(4) NOT NULL DEFAULT 0,
  `recruiting` tinyint(4) NOT NULL DEFAULT 1,
  `leaderId` int(11) NOT NULL DEFAULT 0,
  `news` text NOT NULL DEFAULT '[]',
  `join_dates` text NOT NULL DEFAULT '{}',
  `rankPoints` bigint(20) NOT NULL,
  `rank` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `profile` varchar(255) NOT NULL DEFAULT 'logo_default.jpg',
  `visible` varchar(1) NOT NULL DEFAULT '1',
  `bankcredits` int(11) NOT NULL DEFAULT 0,
  `bankuri` int(11) NOT NULL DEFAULT 0,
  `creditTax` varchar(255) DEFAULT '0',
  `uridiumTax` varchar(255) DEFAULT '0',
  `lastTaxCredit` varchar(255) DEFAULT NULL,
  `lastTaxUridium` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `server_clan_applications`
--

CREATE TABLE `server_clan_applications` (
  `id` int(11) NOT NULL,
  `clanId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `server_clan_diplomacy`
--

CREATE TABLE `server_clan_diplomacy` (
  `id` bigint(20) NOT NULL,
  `senderClanId` int(11) NOT NULL,
  `toClanId` int(11) NOT NULL,
  `diplomacyType` tinyint(4) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `server_clan_diplomacy_applications`
--

CREATE TABLE `server_clan_diplomacy_applications` (
  `id` bigint(20) NOT NULL,
  `senderClanId` int(11) NOT NULL,
  `toClanId` int(11) NOT NULL,
  `diplomacyType` tinyint(4) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `server_maps`
--

CREATE TABLE `server_maps` (
  `mapID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `npcs` longtext NOT NULL,
  `stations` longtext NOT NULL,
  `portals` longtext NOT NULL,
  `collectables` longtext NOT NULL,
  `options` varchar(512) NOT NULL DEFAULT '{"StarterMap":false,"PvpMap":false,"RangeDisabled":false,"CloakBlocked":false,"LogoutBlocked":false,"DeathLocationRepair":true}',
  `factionID` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Tablo döküm verisi `server_maps`
--

INSERT INTO `server_maps` (`mapID`, `name`, `npcs`, `stations`, `portals`, `collectables`, `options`, `factionID`) VALUES
(1, '1-1', '[{   \"ShipId\": 84,   \"Amount\":5}]     ', '[{\"TypeId\": 46,   \"FactionId\": 1,   \"Position\": [2000,2000] },{\"TypeId\": 58, \"FactionId\": 1, \"Position\": [2200,200]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [1500,300]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [1000,500]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [500,1000]},{\"TypeId\": 58, \"FactionId\": 1, \"Position\": [200,1500]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [200,2100]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [400,2800]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [700,3300]},{\"TypeId\": 58, \"FactionId\": 1, \"Position\": [1200,3600]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [1800,3800]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [2400,3700]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [3000,3400]},{\"TypeId\": 58, \"FactionId\": 1, \"Position\": [3400,3000]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [3700,2400]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [3700,1800]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [3600,1200]},{\"TypeId\": 58, \"FactionId\": 1, \"Position\": [600,7600]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [3200,700]}]\r\n', '[{   \"TargetSpaceMapId\": 2,   \"Position\": [18500, 11500],   \"TargetPosition\": [1900, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 51,   \"Position\": [5100, 1900],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 2,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 52,   \"Position\": [4100, 3500],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 3,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 53,   \"Position\": [2200, 4300],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 4,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 55,   \"Position\": [800, 4600],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 5,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(2, '1-2', '[{\"ShipId\":84,\"Amount\":5},{\"ShipId\":71,\"Amount\":10},{\"ShipId\":23,\"Amount\":5},{\"ShipId\":24,\"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 1,   \"Position\": [1900, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 3,   \"Position\": [18500, 2000],   \"TargetPosition\": [1900, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 4,   \"Position\": [18500, 11500],   \"TargetPosition\": [1900, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(3, '1-3', '[{\"ShipId\":71,\"Amount\":5},{\"ShipId\":72,\"Amount\":5},{\"ShipId\":75,\"Amount\":5},{\"ShipId\":73,\"Amount\":5},{\"ShipId\":26,\"Amount\":5},{\"ShipId\":15,\"Amount\":7},{\"ShipId\":31,\"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 2,   \"Position\": [1900, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 4,   \"Position\": [18500, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 7,   \"Position\": [18500, 2000],   \"TargetPosition\": [1900, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(4, '1-4', '[{\"ShipId\":71,\"Amount\":5},{\"ShipId\":74,\"Amount\":5},{\"ShipId\":75,\"Amount\":5},{\"ShipId\":73,\"Amount\":5},{\"ShipId\":46,\"Amount\":5},{\"ShipId\":25,\"Amount\":5},{\"ShipId\":24,\"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 2,   \"Position\": [1900, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 12,   \"Position\": [18500, 11500],   \"TargetPosition\": [1900, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 3,   \"Position\": [18500, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 13,   \"Position\": [19000, 6000],   \"TargetPosition\": [1500, 6000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(5, '2-1', '[{   \"ShipId\": 84,   \"Amount\":10}]', '[{\"TypeId\": 46,   \"FactionId\": 2,   \"Position\": [18900,2000] },{\"TypeId\": 58, \"FactionId\": 2, \"Position\": [17500,3000]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [17200,2500]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [17200,1800]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [17300,1200]},{\"TypeId\": 58, \"FactionId\": 2, \"Position\": [17700,700]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [18200,300]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [18800,200]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [19400,200]},{\"TypeId\": 58, \"FactionId\": 2, \"Position\": [20000,500]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [20400,1000]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [20700,1500]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [20800,2100]},{\"TypeId\": 58, \"FactionId\": 2, \"Position\": [20600,2800]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [20200,3300]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [19700,3600]},{\"TypeId\": 58, \"FactionId\": 2, \"Position\": [19100,3800]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [18500,3700]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [17900,3400]}]', '[{   \"TargetSpaceMapId\": 6,   \"Position\": [1900, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 51,   \"Position\": [16200, 1400],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 2,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 52,   \"Position\": [17000, 3300],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 3,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 53,   \"Position\": [18800, 4600],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 4,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 55,   \"Position\": [20400, 5100],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 5,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(6, '2-2', '[{\"ShipId\":84,\"Amount\":5},{\"ShipId\":71,\"Amount\":10},{\"ShipId\":23,\"Amount\":5},{\"ShipId\":24,\"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 5,   \"Position\": [18500, 2000],   \"TargetPosition\": [1900, 11500],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 8,   \"Position\": [18500, 11500],   \"TargetPosition\": [1900, 2000],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 7,   \"Position\": [1900, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(7, '2-3', '[{\"ShipId\":71,\"Amount\":7},{\"ShipId\":72,\"Amount\":5},{\"ShipId\":75,\"Amount\":5},{\"ShipId\":73,\"Amount\":5},{\"ShipId\":26,\"Amount\":5},{\"ShipId\":25,\"Amount\":5},{\"ShipId\":31,\"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 6,   \"Position\": [18500, 2000],   \"TargetPosition\": [1900, 11500],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 8,   \"Position\": [18500, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 3,   \"Position\": [1900, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(8, '2-4', '[{\"ShipId\":71,\"Amount\":5},{\"ShipId\":74,\"Amount\":5},{\"ShipId\":75,\"Amount\":5},{\"ShipId\":73,\"Amount\":5},{\"ShipId\":46,\"Amount\":5},{\"ShipId\":25,\"Amount\":5},{\"ShipId\":24,\"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 7,   \"Position\": [18500, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 6,   \"Position\": [1900, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 11,   \"Position\": [1900, 11500],   \"TargetPosition\": [1900, 2000],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 14,   \"Position\": [10000, 12000],   \"TargetPosition\": [10000, 1500],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(9, '3-1', '[{   \"ShipId\": 84,   \"Amount\":10}]   ', '[{\"TypeId\": 46,   \"FactionId\": 3,   \"Position\": [19000,11600] },{\"TypeId\": 58, \"FactionId\": 3, \"Position\": [17500,10400]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [17200,11000]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [17200,11600]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [17300,12200]},{\"TypeId\": 58, \"FactionId\": 3, \"Position\": [17700,12800]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [18200,13100]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [18800,13300]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [19400,13200]},{\"TypeId\": 58, \"FactionId\": 3, \"Position\": [20000,13000]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [20400,12500]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [20700,11900]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [20700,11300]},{\"TypeId\": 58, \"FactionId\": 3, \"Position\": [20600,10700]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [20200,10200]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [19700,9900]},{\"TypeId\": 58, \"FactionId\": 3, \"Position\": [19100,9700]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [18500,9800]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [17900,10000]}]', '[{   \"TargetSpaceMapId\": 10,   \"Position\": [1900, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 51,   \"Position\": [17900, 8900],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 2,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 52,   \"Position\": [16600, 10400],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 3,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 53,   \"Position\": [16000, 12400],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 4,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 55,   \"Position\": [19400, 8400],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 5,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(10, '3-2', '[{\"ShipId\":84,\"Amount\":5},{\"ShipId\":71,\"Amount\":10},{\"ShipId\":23,\"Amount\":5},{\"ShipId\":24,\"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 9,   \"Position\": [18500, 11500],   \"TargetPosition\": [1900, 2000],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 11,   \"Position\": [18500, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 12,   \"Position\": [1900, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(11, '3-3', '[{\"ShipId\":71,\"Amount\":5},{\"ShipId\":72,\"Amount\":7},{\"ShipId\":75,\"Amount\":7},{\"ShipId\":73,\"Amount\":7},{\"ShipId\":26,\"Amount\":5},{\"ShipId\":25,\"Amount\":5},{\"ShipId\":31,\"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 12,   \"Position\": [1900, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 10,   \"Position\": [18500, 11500],   \"TargetPosition\": [1900, 2000],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 8,   \"Position\": [1900, 2000],   \"TargetPosition\": [1900, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(12, '3-4', '[{\"ShipId\":71,\"Amount\":5},{\"ShipId\":74,\"Amount\":7},{\"ShipId\":75,\"Amount\":7},{\"ShipId\":73,\"Amount\":10},{\"ShipId\":46,\"Amount\":5},{\"ShipId\":25,\"Amount\":7},{\"ShipId\":24,\"Amount\":7}]', '', '[{   \"TargetSpaceMapId\": 10,   \"Position\": [18500, 11500],   \"TargetPosition\": [1900, 2000],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 11,   \"Position\": [18500, 2000],   \"TargetPosition\": [1900, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 4,   \"Position\": [1900, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 15,   \"Position\": [10000, 1500],   \"TargetPosition\": [19000, 6000],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(13, '4-1', '', '', '[{   \"TargetSpaceMapId\": 16,   \"Position\": [10400,6400],   \"TargetPosition\": [19200,13400],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 4,   \"Position\": [1900,6350],   \"TargetPosition\": [18600,6400],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 15,   \"Position\": [18500,11500],   \"TargetPosition\": [18500,11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 14,   \"Position\": [18500,2000],   \"TargetPosition\": [2000,11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(14, '4-2', '', '', '[{   \"TargetSpaceMapId\": 16,   \"Position\": [10000,6300],   \"TargetPosition\": [21800,11900],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 13,   \"Position\": [2000,11500],   \"TargetPosition\": [18500,11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 8,   \"Position\": [10000,2000],   \"TargetPosition\": [10200,11300],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 15,   \"Position\": [18500,11500],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(15, '4-3', '', '', '[{   \"TargetSpaceMapId\": 16,   \"Position\": [10200, 6600],   \"TargetPosition\": [21800,14500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 12,   \"Position\": [18500,6750],   \"TargetPosition\": [10500,1200],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 14,   \"Position\": [2000,2000],   \"TargetPosition\": [18500,11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 13,   \"Position\": [2000,11500],   \"TargetPosition\": [18500,11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(16, '4-4', '', '', '[{   \"TargetSpaceMapId\": 17,   \"Position\": [6000,13400],   \"TargetPosition\": [18500,6750],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 21,   \"Position\": [28000,3000],   \"TargetPosition\": [2000,11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 25,   \"Position\": [28000,24000],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 13,   \"Position\": [19200,13400],   \"TargetPosition\": [10400,6400],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 14,   \"Position\": [21800,11900],   \"TargetPosition\": [10000,6400],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 15,   \"Position\": [21800,14500],   \"TargetPosition\": [10200,6600],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":true,\"RangeDisabled\":true,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(17, '1-5', '[{   \"ShipId\": 71,   \"Amount\": 5},{   \"ShipId\": 24,   \"Amount\": 5},{   \"ShipId\": 76,   \"Amount\": 5},{   \"ShipId\": 27,   \"Amount\": 5},{   \"ShipId\": 77,   \"Amount\": 5},{   \"ShipId\": 28,   \"Amount\": 5}]\n', '', '[{   \"TargetSpaceMapId\": 16,   \"Position\": [19000, 6000],   \"TargetPosition\": [7000, 13500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 18,   \"Position\": [2000, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 19,   \"Position\": [2000, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 29,   \"Position\": [10000, 12000],   \"TargetPosition\": [6000, 13000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(18, '1-6', '[{   \"ShipId\": 78,   \"Amount\": 4},{   \"ShipId\": 29,   \"Amount\": 2},{   \"ShipId\": 79,   \"Amount\": 3},{   \"ShipId\": 35,   \"Amount\": 2}]', '', '[{   \"TargetSpaceMapId\": 17,   \"Position\": [18500, 11500],   \"TargetPosition\": [2000, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 20,   \"Position\": [2000, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(19, '1-7', '[{   \"ShipId\": 78,   \"Amount\": 5},{   \"ShipId\": 29,   \"Amount\": 5},{   \"ShipId\": 79,   \"Amount\": 5},{   \"ShipId\": 35,   \"Amount\": 5}]', '', '[{   \"TargetSpaceMapId\": 20,   \"Position\": [2000, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 17,   \"Position\": [18500, 2000],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]\r\n', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(20, '1-8', '[{   \"ShipId\": 85,   \"Amount\": 7},{   \"ShipId\": 34,   \"Amount\": 5}]', '[{   \"TypeId\": 46,   \"FactionId\": 1,   \"Position\": [2100,6600] },{\"TypeId\": 58, \"FactionId\": 1, \"Position\": [200,6700]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [200,6200]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [500,5500]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [900,5100]},{\"TypeId\": 58, \"FactionId\": 1, \"Position\": [1500,4900]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [2100,4800]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [2800,5000]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [3200,5400]},{\"TypeId\": 58, \"FactionId\": 1, \"Position\": [3600,5800]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [3700,6400]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [3700,7100]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [3400,7600]},{\"TypeId\": 58, \"FactionId\": 1, \"Position\": [3000,8100]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [2400,8300]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [1800,8400]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [1200,8200]},{\"TypeId\": 58, \"FactionId\": 1, \"Position\": [600,7600]},{\"TypeId\": 56, \"FactionId\": 1, \"Position\": [300,7300]}]\r\n', '[{   \"TargetSpaceMapId\": 19,   \"Position\": [18500, 11500],   \"TargetPosition\": [2000, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 18,   \"Position\": [18500, 2000],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 306,   \"Position\": [11500, 11500],   \"TargetPosition\": [2000, 12000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(21, '2-5', '[{   \"ShipId\": 71,   \"Amount\": 5},{   \"ShipId\": 24,   \"Amount\": 5},{   \"ShipId\": 76,   \"Amount\": 5},{   \"ShipId\": 27,   \"Amount\": 7},{   \"ShipId\": 77,   \"Amount\": 7},{   \"ShipId\": 28,   \"Amount\": 5}]\r\n', '', '[{   \"TargetSpaceMapId\": 23,   \"Position\": [18500, 2000],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 29,   \"Position\": [18500, 11500],   \"TargetPosition\": [28000, 3000],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 16,   \"Position\": [2000, 11500],   \"TargetPosition\": [28000, 1300],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 22,   \"Position\": [2000, 2000],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(22, '2-6', '[{   \"ShipId\": 78,   \"Amount\": 4},{   \"ShipId\": 29,   \"Amount\": 2},{   \"ShipId\": 79,   \"Amount\": 3},{   \"ShipId\": 35,   \"Amount\": 2}]', '', '[{   \"TargetSpaceMapId\": 21,   \"Position\": [2000, 11500],   \"TargetPosition\": [2000, 2000],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 24,   \"Position\": [18500, 2000],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(23, '2-7', '[{   \"ShipId\": 78,   \"Amount\": 5},{   \"ShipId\": 29,   \"Amount\": 5},{   \"ShipId\": 79,   \"Amount\": 5},{   \"ShipId\": 35,   \"Amount\": 5}]', '', '[{   \"TargetSpaceMapId\": 24,   \"Position\": [18500, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 21,   \"Position\": [2000, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true }]\r\n', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(24, '2-8', '[{   \"ShipId\": 78,   \"Amount\": 4},{   \"ShipId\": 29,   \"Amount\": 2},{   \"ShipId\": 79,   \"Amount\": 3},{   \"ShipId\": 35,   \"Amount\": 2},{   \"ShipId\": 80,   \"Amount\": 3}]', '[{\"TypeId\": 46,   \"FactionId\": 2,   \"Position\": [10400,1800] },{\"TypeId\": 58, \"FactionId\": 2, \"Position\": [8900,2800]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [9300,3200]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [9800,3700]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [10400,3900]},{\"TypeId\": 58, \"FactionId\": 2, \"Position\": [11000,3700]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [11600,3500]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [12000,3100]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [12300,2400]},{\"TypeId\": 58, \"FactionId\": 2, \"Position\": [12400,1700]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [12200,1100]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [11800,800]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [11300,400]},{\"TypeId\": 58, \"FactionId\": 2, \"Position\": [10700,200]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [10100,300]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [9500,500]},{\"TypeId\": 58, \"FactionId\": 2, \"Position\": [9100,900]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [8800,1500]},{\"TypeId\": 56, \"FactionId\": 2, \"Position\": [8700,2100]}]', '[{   \"TargetSpaceMapId\": 22,   \"Position\": [2000, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 23,   \"Position\": [18500, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 307,   \"Position\": [11500, 11500],   \"TargetPosition\": [1000, 6000],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(25, '3-5', '[{   \"ShipId\": 71,   \"Amount\": 10},{   \"ShipId\": 24,   \"Amount\": 10},{   \"ShipId\": 76,   \"Amount\": 10},{   \"ShipId\": 27,   \"Amount\": 10},{   \"ShipId\": 77,   \"Amount\": 10},{   \"ShipId\": 28,   \"Amount\": 5}]', '', '[{   \"TargetSpaceMapId\": 16,   \"Position\": [2000, 2000],   \"TargetPosition\": [28000, 25000],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 27,   \"Position\": [18500, 11500],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 29,   \"Position\": [16500, 1500],   \"TargetPosition\": [28000, 24000],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 26,   \"Position\": [2000, 11500],   \"TargetPosition\": [2000, 2000],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(26, '3-6', '[{   \"ShipId\": 78,   \"Amount\": 4},{   \"ShipId\": 29,   \"Amount\": 2},{   \"ShipId\": 79,   \"Amount\": 3},{   \"ShipId\": 35,   \"Amount\": 2}]', '', '[{   \"TargetSpaceMapId\": 25,   \"Position\": [2000, 2000],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 28,   \"Position\": [18500, 11500],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(27, '3-7', '[{   \"ShipId\": 78,   \"Amount\": 8},{   \"ShipId\": 29,   \"Amount\": 8},{   \"ShipId\": 79,   \"Amount\": 10},{   \"ShipId\": 35,   \"Amount\": 5}]', '', '[{   \"TargetSpaceMapId\": 28,   \"Position\": [18500, 11500],   \"TargetPosition\": [2000, 2000],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 25,   \"Position\": [2000, 11500],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true }]\n', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(28, '3-8', '[{   \"ShipId\": 85,   \"Amount\": 10},{   \"ShipId\": 34,   \"Amount\": 5}]', '[{\"TypeId\": 46,   \"FactionId\": 3,   \"Position\": [19100,6500] },{\"TypeId\": 58, \"FactionId\": 3, \"Position\": [18700,4800]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [19300,4700]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [19900,5000]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [20400,5300]},{\"TypeId\": 58, \"FactionId\": 3, \"Position\": [20800,5800]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [21000,6400]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [20900,7100]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [20600,7600]},{\"TypeId\": 58, \"FactionId\": 3, \"Position\": [20200,8100]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [19600,8300]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [19000,8400]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [18400,8300]},{\"TypeId\": 58, \"FactionId\": 3, \"Position\": [17900,7900]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [17500,7400]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [17300,6700]},{\"TypeId\": 58, \"FactionId\": 3, \"Position\": [17400,6100]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [17700,5500]},{\"TypeId\": 56, \"FactionId\": 3, \"Position\": [18100,5100]}]', '[{   \"TargetSpaceMapId\": 27,   \"Position\": [2000, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 26,   \"Position\": [2000, 11500],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 308,   \"Position\": [11500, 11500],   \"TargetPosition\": [12700, 3500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(29, '4-5', '[{   \"ShipId\": 42,   \"Amount\": 5},{   \"ShipId\": 45,   \"Amount\": 5},{   \"ShipId\": 47,   \"Amount\": 5},{   \"ShipId\": 83,   \"Amount\": 5},{   \"ShipId\": 36,   \"Amount\": 5},{   \"ShipId\": 37,   \"Amount\": 2},{   \"ShipId\": 38,   \"Amount\": 2},{   \"ShipId\": 39,   \"Amount\": 5},{   \"ShipId\": 43,   \"Amount\": 3},{   \"ShipId\": 39,   \"Amount\": 3},{   \"ShipId\": 40,   \"Amount\": 3},{   \"ShipId\": 41,   \"Amount\": 3},{   \"ShipId\": 44,   \"Amount\": 3}]\n', '', '[{   \"TargetSpaceMapId\": 17,   \"Position\": [6000, 13000],   \"TargetPosition\": [10000, 12000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 21,   \"Position\": [28000, 3000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 25,   \"Position\": [28000, 24000],   \"TargetPosition\": [16500, 1500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":true,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(42, '???', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":true,\"LogoutBlocked\":true,\"DeathLocationRepair\":false}', 0),
(51, 'GG Alpha', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":true,\"LogoutBlocked\":true,\"DeathLocationRepair\":false}', 0),
(52, 'GG Beta', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(53, 'GG Gamma', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(55, 'GG Delta', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(58, 'Battle Royal', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":true,\"LogoutBlocked\":true,\"DeathLocationRepair\":false}', 0),
(61, 'MMO INVASION', '', '', '[{   \"TargetSpaceMapId\": 2,   \"Position\": [1800, 11300],   \"TargetPosition\": [18700,1300],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":false}', 0),
(62, 'EIC INVASION', '', '', '[{   \"TargetSpaceMapId\": 5,   \"Position\": [18500, 11000],   \"TargetPosition\": [18500,2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":false}', 0),
(63, 'VRU INVASION', '', '', '[{   \"TargetSpaceMapId\": 9,   \"Position\": [18500, 11000],   \"TargetPosition\": [18500,2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":false}', 0),
(71, 'GG Zeta', '[{   \"ShipId\": 107,   \"Amount\": 18}]', '', '[{   \"TargetSpaceMapId\": 16,   \"Position\": [10300,6300],   \"TargetPosition\": [21300,13400],   \"GraphicId\": 4,   \"FactionId\": 0,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(74, 'GG Kappa', '[{   \"ShipId\": 107,   \"Amount\": 18}]', '', '[{   \"TargetSpaceMapId\": 20,   \"Position\": [10000, 6200],   \"TargetPosition\": [10000,6200],   \"GraphicId\": 41,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":true,\"LogoutBlocked\":true,\"DeathLocationRepair\":false}', 0),
(75, 'MAP CUBIKON', '[{   \"ShipId\": 80,   \"Amount\":5}]     ', '', '[{   \"TargetSpaceMapId\": 51,   \"Position\": [1900,1500],   \"TargetPosition\": [18900,11300],   \"GraphicId\": 4,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 16,   \"Position\": [10500, 6300],   \"TargetPosition\": [19200,13400],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 2,   \"Position\": [18900, 11400],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(91, '5-1', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(92, '5-2', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(93, '5-3', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(101, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":true,\"LogoutBlocked\":true,\"DeathLocationRepair\":false}', 0),
(102, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(103, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(104, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(105, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(106, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(107, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(108, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(109, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(110, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(111, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(121, 'UBA', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":true,\"LogoutBlocked\":true,\"DeathLocationRepair\":false}', 0),
(200, 'LoW', '', '', '[{   \"TargetSpaceMapId\": 16,   \"Position\": [10300,6300],   \"TargetPosition\": [21300,13400],   \"GraphicId\": 4,   \"FactionId\": 0,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":true,\"LogoutBlocked\":true,\"DeathLocationRepair\":false}', 0),
(224, 'Battle Royal', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":true,\"LogoutBlocked\":true,\"DeathLocationRepair\":false}', 0),
(306, '1-BL', '', '', '[{   \"TargetSpaceMapId\": 20,   \"Position\": [2000, 12000],   \"TargetPosition\": [11500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 308,   \"Position\": [19000, 12000],   \"TargetPosition\": [2700, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 307,   \"Position\": [8500, 1500],   \"TargetPosition\": [11000, 1300],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(307, '2-BL', '', '', '[{   \"TargetSpaceMapId\": 24,   \"Position\": [1000, 6000],   \"TargetPosition\": [11500, 11500],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 306,   \"Position\": [11000, 1300],   \"TargetPosition\": [8500, 1500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 308,   \"Position\": [20000, 7400],   \"TargetPosition\": [18800, 11600],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(308, '3-BL', '', '', '[{   \"TargetSpaceMapId\": 28,   \"Position\": [12700, 3500],   \"TargetPosition\": [11500, 11500],   \"GraphicId\": 1,   \"FactionId\": 3,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 306,   \"Position\": [2700, 11500],   \"TargetPosition\": [19000, 12000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 307,   \"Position\": [18800, 11600],   \"TargetPosition\": [20000, 7400],   \"GraphicId\": 1,   \"FactionId\": 2,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `server_ships`
--

CREATE TABLE `server_ships` (
  `id` int(11) NOT NULL,
  `shipID` int(11) NOT NULL,
  `baseShipId` int(11) NOT NULL,
  `lootID` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `health` int(11) NOT NULL DEFAULT 0,
  `shield` int(11) NOT NULL DEFAULT 0,
  `speed` int(11) NOT NULL DEFAULT 300,
  `lasers` int(11) NOT NULL DEFAULT 1,
  `generators` int(11) NOT NULL DEFAULT 1,
  `cargo` int(11) NOT NULL DEFAULT 100,
  `aggressive` tinyint(1) NOT NULL DEFAULT 0,
  `damage` int(11) NOT NULL DEFAULT 20,
  `respawnable` tinyint(1) NOT NULL,
  `reward` varchar(2048) NOT NULL DEFAULT '{"Experience":0,"Honor":0,"Credits":0,"Uridium":0}',
  `isdesign` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Tablo döküm verisi `server_ships`
--

INSERT INTO `server_ships` (`id`, `shipID`, `baseShipId`, `lootID`, `name`, `health`, `shield`, `speed`, `lasers`, `generators`, `cargo`, `aggressive`, `damage`, `respawnable`, `reward`, `isdesign`) VALUES
(47, 1, 1, 'ship_phoenix', 'Phoenix', 104000, 0, 320, 1, 1, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(48, 2, 2, 'ship_yamato', 'Yamato', 260000, 0, 260, 8, 12, 1000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(49, 3, 3, 'ship_leonov', 'Leonov', 260000, 0, 360, 6, 6, 1000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(50, 4, 4, 'ship_defcom', 'Defcom', 250000, 0, 340, 12, 8, 800, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(51, 5, 5, 'ship_liberator', 'Liberator', 116000, 0, 330, 4, 6, 400, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(52, 6, 6, 'ship_piranha', 'Piranha', 164000, 0, 360, 6, 8, 600, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(53, 7, 7, 'ship_nostromo', 'Nostromo', 220000, 0, 340, 7, 10, 700, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(54, 8, 8, 'ship_vengeance', 'Vengeance', 280000, 0, 380, 10, 10, 1000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(55, 9, 9, 'ship_bigboy', 'Bigboy', 160000, 0, 260, 8, 15, 700, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(56, 10, 10, 'ship_goliath', 'Goliath', 356000, 0, 300, 15, 15, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(57, 12, 0, 'pet', 'P.E.T. Level 1-3', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}', 0),
(58, 13, 0, 'pet', 'P.E.T. Red', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}', 0),
(59, 15, 0, 'pet', 'P.E.T. Frozen', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}', 0),
(60, 16, 8, 'ship_vengeance_design_adept', 'Adept', 280000, 0, 380, 10, 10, 1000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(61, 17, 8, 'ship_vengeance_design_corsair', 'Corsair', 280000, 0, 380, 10, 10, 1000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(62, 18, 8, 'ship_vengeance_design_lightning', 'Lightning', 300000, 0, 400, 10, 10, 1000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(63, 19, 10, 'ship_goliath_design_jade', 'Jade', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(64, 20, 0, 'ship_admin', 'Ufo', 256000, 0, 1000, 0, 0, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(65, 22, 0, 'pet', 'P.E.T. Normal', 0, 150000, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(66, 49, 49, 'ship_aegis', 'Aegis', 275000, 0, 300, 10, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(67, 52, 10, 'ship_goliath_design_amber', 'Amber', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(68, 53, 10, 'ship_goliath_design_crimson', 'Crimson', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(69, 54, 10, 'ship_goliath_design_sapphire', 'Sapphire', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(70, 56, 10, 'ship_goliath_design_enforcer', 'Enforcer', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(71, 57, 10, 'ship_goliath_design_independence', 'Independence', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(72, 58, 8, 'ship_vengeance_design_revenge', 'Revenge', 280000, 0, 380, 10, 10, 1000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(73, 59, 10, 'ship_goliath_design_bastion', 'Bastion', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(74, 60, 8, 'ship_vengeance_design_avenger', 'Avenger', 280000, 0, 380, 10, 10, 1000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(75, 14, 0, 'pet', 'P.E.T. Green', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(76, 62, 10, 'ship_goliath_design_exalted', 'Exalted', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(77, 63, 10, 'ship_goliath_design_solace', 'Solace', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(78, 64, 10, 'ship_goliath_design_diminisher', 'Diminisher', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(79, 65, 10, 'ship_goliath_design_spectrum', 'Spectrum', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(80, 66, 10, 'ship_goliath_design_sentinel', 'Sentinel', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(81, 67, 10, 'ship_goliath_design_venom', 'Venom', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(82, 68, 10, 'ship_goliath_design_ignite', 'Ignite', 356000, 0, 300, 16, 16, 0, 1, 170000, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(83, 69, 69, 'ship_citadel', 'Citadel', 650000, 0, 240, 7, 20, 4000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(84, 70, 70, 'ship_spearhead', 'Spearhead', 200000, 0, 370, 5, 12, 500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(85, 130, 130, 'ship_vengeance_design_pusat', 'Pusat', 256000, 0, 360, 16, 12, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(86, 86, 10, 'ship_goliath_design_kick', 'Kick', 366000, 0, 310, 16, 17, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(87, 87, 10, 'ship_goliath_design_referee', 'Referee', 356000, 0, 300, 16, 16, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(88, 88, 10, 'ship_goliath_design_goal', 'Goal', 356000, 0, 300, 16, 16, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(89, 98, 98, 'ship_police', 'PoliceShip', 1000000000, 100000000, 500, 18, 18, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(90, 109, 10, 'ship_goliath_design_saturn', 'Saturn', 390000, 0, 310, 16, 17, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(91, 110, 10, 'ship_goliath_design_centaur', 'Centaur', 370000, 0, 300, 16, 16, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(92, 61, 10, 'ship_goliath_design_veteran', 'Veteran', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(93, 140, 10, 'ship_goliath_design_vanquisher', 'VanquisherMMO', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(94, 141, 10, 'ship_goliath_design_sovereign', 'VanquisherEIC', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(95, 142, 10, 'ship_goliath_design_peacemaker', 'VanquisherVRU', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(96, 150, 7, 'ship_nostromo_design_diplomat', 'Nostromo Diplomat', 220000, 0, 340, 7, 10, 700, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(97, 151, 7, 'ship_nostromo_design_envoy', 'Nostromo Envoy', 220000, 0, 340, 7, 10, 700, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(98, 152, 7, 'ship_nostromo_design_ambassador', 'Nostromo Ambassador', 220000, 0, 340, 7, 10, 700, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(99, 153, 10, 'ship_goliath_design_razer', 'Razer', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(100, 154, 7, 'ship_nostromo_design_nostromo-razer', 'Nostromo Razer', 220000, 0, 340, 12, 12, 700, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(101, 155, 10, 'ship_goliath_design_turkish', 'Champion-Turkish', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(102, 156, 10, 'ship_g-surgeon', 'Surgeon', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(103, 157, 49, 'ship_aegis_design_aegis-elite', 'Aegis Veteran', 306000, 0, 300, 12, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(104, 158, 49, 'ship_aegis_design_aegis-superelite', 'Aegis Super Elite', 275000, 0, 300, 10, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(105, 159, 69, 'ship_citadel_design_citadel-elite', 'Citadel Veteran', 700000, 0, 270, 12, 20, 4000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(106, 160, 69, 'ship_citadel_design_citadel-superelite', 'Citadel Super Elite', 650000, 0, 240, 7, 20, 4000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(107, 161, 70, 'ship_spearhead_design_spearhead-elite', 'Spearhead Veteran', 250000, 0, 370, 10, 14, 500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(108, 162, 70, 'ship_spearhead_design_spearhead-superelite', 'Spearhead Super Elite', 200000, 0, 370, 5, 12, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(109, 442, 0, 'spaceball_summer', '..::{Spaceball}::..', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(110, 443, 0, 'spaceball_winter', '..::{Spaceball}::..', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(111, 444, 0, 'spaceball_soccer', '..::{Spaceball}::..', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(112, 79, 0, 'ship79', '-=[ Kristallon ]=-', 400000, 300000, 250, 1, 1, 100, 0, 5000, 1, '{\"Experience\":153600,\"Honor\":768,\"Credits\":819200,\"Uridium\":384}', 0),
(113, 78, 0, 'ship78', '-=[ Kristallin ]=-', 50000, 40000, 320, 1, 1, 100, 1, 1200, 1, '{\"Experience\":19200,\"Honor\":96,\"Credits\":25600,\"Uridium\":48}', 0),
(114, 35, 0, 'ship35', '..::{ Boss Kristallon }::..', 1600000, 1200000, 250, 1, 1, 100, 0, 20000, 1, '{\"Experience\":614400,\"Honor\":3072,\"Credits\":3276800,\"Uridium\":1536}', 0),
(115, 29, 0, 'ship29', '..::{ Boss Kristallin }::..', 200000, 160000, 320, 1, 1, 100, 1, 4800, 1, '{\"Experience\":76800,\"Honor\":384,\"Credits\":102400,\"Uridium\":192}', 0),
(116, 85, 0, 'ship85', '..::{ StreuneR}::..', 40000, 30000, 280, 1, 1, 100, 0, 3000, 1, '{\"Experience\":18000,\"Honor\":90,\"Credits\":24000,\"Uridium\":45}', 0),
(117, 99, 0, 'ship99', '..::{ Scorcher}::..', 200000, 200000, 360, 1, 1, 100, 1, 3000, 1, '{\"Experience\":45000,\"Honor\":24,\"Credits\":300000,\"Uridium\":96}', 0),
(118, 118, 0, 'ship118', '..::{ Boss Curcubitor }::..', 1200000, 600000, 300, 1, 1, 0, 0, 12000, 1, '{\"Experience\":36000,\"Honor\":150,\"Credits\":36000,\"Uridium\":372}', 0),
(119, 80, 0, 'ship80', '..::{Cubikon}::..', 1600000, 1200000, 30, 2, 2, 100, 0, 125000, 1, '{\"Experience\":1536000,\"Honor\":12288,\"Credits\":3276800,\"Uridium\":3072}', 0),
(120, 116, 0, 'ship116', 'Hitac', 22000000, 7500000, 170, 2, 2, 100, 0, 125000, 1, '{\"Experience\":1250,\"Honor\":1350,\"Credits\":2560,\"Uridium\":370}', 0),
(121, 103, 0, 'ship103', '..::{Ice}::..', 100000, 80000, 430, 2, 2, 100, 0, 5000, 1, '{\"Experience\":19200,\"Honor\":96,\"Credits\":38400,\"Uridium\":48}', 0),
(122, 107, 0, 'ship107', 'COVID-19[MUTATED]', 50000, 30000, 650, 5, 1, 1, 1, 4500, 1, '{\"Experience\":512000,\"Honor\":1012,\"Credits\":512,\"Uridium\":45}', 0),
(123, 246, 246, 'ship_hammerclaw', 'hammerclaw', 377500, 0, 310, 12, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(124, 900, 900, 'mimesis', 'Mimesis', 386000, 0, 300, 14, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(125, 901, 900, 'mimesis_design_carbonite', 'Mimesis-Carbonite', 386000, 0, 300, 14, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(126, 1000, 1000, 'tartarus', 'tartarus', 360000, 0, 340, 14, 15, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(127, 1001, 1000, 'ship_tartarus_epion', 'tartarus-epion', 360000, 0, 340, 14, 15, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(128, 1002, 1000, 'ship_tartarus_osiris', 'tartarus-osiris', 360000, 0, 340, 14, 15, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(129, 1003, 1000, 'ship_tartarus_smite', 'tartarus-smite', 360000, 0, 340, 14, 15, 1500, 0, 0, 0, '{\"Experience\":1200,\"Honor\":2,\"Credits\":512,\"Uridium\":20}', 1),
(130, 84, 0, 'ship84', '-=[ Streuner ]=-', 800, 400, 300, 1, 1, 100, 0, 20, 1, '{\"Experience\":1200,\"Honor\":6,\"Credits\":1200,\"Uridium\":3}', 0),
(131, 23, 0, 'ship23', '..::{ Boss StreuneR }::..', 80000, 40000, 200, 1, 1, 100, 0, 1400, 1, '{\"Experience\":38580,\"Honor\":192,\"Credits\":51200,\"Uridium\":96}', 0),
(132, 71, 0, 'ship71', '-=[ Lordakia ]=-', 2000, 2000, 320, 1, 1, 100, 1, 80, 1, '{\"Experience\":1680,\"Honor\":12,\"Credits\":2400,\"Uridium\":6}', 0),
(133, 73, 0, 'ship73', '-=[ Mordon ]=-', 20000, 10000, 125, 1, 1, 100, 1, 350, 1, '{\"Experience\":9600,\"Honor\":48,\"Credits\":12800,\"Uridium\":24}', 0),
(134, 31, 0, 'ship31', '-=[ Boss Mordon]=-', 80000, 40000, 150, 1, 1, 100, 1, 1300, 1, '{\"Experience\":38400,\"Honor\":192,\"Credits\":51200,\"Uridium\":64}', 0),
(135, 75, 0, 'ship75', '-=[ Saimon ]=-', 6300, 3000, 320, 1, 1, 100, 1, 150, 1, '{\"Experience\":4800,\"Honor\":24,\"Credits\":3200,\"Uridium\":12}', 0),
(136, 25, 0, 'ship25', '-=[ Boss Saimon ]=-', 24000, 12000, 300, 1, 1, 100, 1, 650, 1, '{\"Experience\":19200,\"Honor\":96,\"Credits\":12800,\"Uridium\":48}', 0),
(137, 72, 0, 'ship72', '-=[ Devolarium ]=-', 100000, 100000, 200, 1, 1, 100, 1, 900, 1, '{\"Experience\":19200,\"Honor\":96,\"Credits\":102400,\"Uridium\":48}', 0),
(138, 26, 0, 'ship26', '-=[ Boss Devolarium ]=-', 400000, 400000, 180, 1, 1, 100, 1, 4200, 1, '{\"Experience\":76800,\"Honor\":384,\"Credits\":409600,\"Uridium\":192}', 0),
(139, 34, 0, 'ship34', '-=[ Boss streuneR ]=-', 200000, 160000, 200, 1, 1, 100, 1, 5000, 1, '{\"Experience\":4800,\"Honor\":24,\"Credits\":3800,\"Uridium\":12}', 0),
(140, 46, 0, 'ship46', '-=[ Boss-Sibelon ]=-', 800000, 800000, 175, 1, 1, 100, 1, 9000, 1, '{\"Experience\":153600,\"Honor\":768,\"Credits\":819200,\"Uridium\":384}', 0),
(141, 27, 0, 'ship27', '..::( Boss Sibelonit )::..', 160000, 160000, 300, 1, 1, 100, 1, 3000, 1, '{\"Experience\":38400,\"Honor\":192,\"Credits\":204800,\"Uridium\":144}', 0),
(142, 81, 0, 'ship81', '-=[ Protegit]=-', 500000, 350000, 520, 2, 2, 100, 1, 400, 0, '{\"Experience\":4000,\"Honor\":164,\"Credits\":2800,\"Uridium\":32}', 0),
(143, 1005, 0, 'ship_yamato', 'Yamato', 260000, 0, 260, 8, 12, 1000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(144, 1006, 0, 'ship_leonov', 'Leonov', 260000, 0, 380, 6, 6, 1000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(145, 1007, 0, 'ship_defcom', 'Defcom', 250000, 0, 340, 12, 8, 800, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(146, 1008, 0, 'ship_liberator', 'Liberator', 116000, 0, 330, 4, 6, 400, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(147, 1009, 0, 'ship_piranha', 'Piranha', 164000, 0, 360, 6, 8, 600, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(148, 1010, 0, 'ship_nostromo', 'Nostromo', 220000, 0, 450, 10, 10, 700, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(149, 1011, 0, 'ship_vengeance', 'Vengeance', 280000, 0, 380, 10, 10, 1000, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(150, 1012, 0, 'ship_goliath', 'Goliath', 356000, 0, 300, 15, 15, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(151, 1013, 10, 'ship_goliath_design_kick', 'Kick', 750000, 0, 450, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(152, 1014, 10, 'ship_goliath_design_referee', 'Referee', 750000, 0, 450, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(153, 1015, 0, 'ship_goliath_design_goal', 'Goal', 750000, 0, 450, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(154, 1016, 0, 'ship_vengeance_design_pusatborra', 'Pusat', 1250000, 0, 300, 16, 17, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(155, 1017, 0, 'ship_venom_design_venom-inferno borrar', 'Cyborg Inferno', 1250000, 0, 350, 18, 18, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(156, 1018, 0, 'ship_hammerclaw-lava borrar', 'hammerclaw-lava borrar', 1250000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(157, 1020, 0, 'mimesis_design_carbonite mirar', 'mimesis_design_carbonite', 1250000, 0, 300, 16, 17, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(158, 1021, 0, 'ship_goliath_design_enforcer', 'Enforcer', 750000, 0, 450, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(159, 1022, 0, 'ship_vengeance_design_lightning', 'Lightning', 1250000, 0, 450, 10, 10, 0, 0, 0, 0, '{\"Experience\":7500000,\"Honor\":30006,\"Credits\":3000336,\"Uridium\":30000}', 1),
(160, 42, 0, 'ship42', '[ Uber Kristallin ]', 900000, 900000, 320, 1, 1, 100, 1, 8500, 1, '{\"Experience\":153600,\"Honor\":768,\"Credits\":204800,\"Uridium\":256}', 0),
(161, 45, 0, 'ship45', '[ Uber-Kristallon ]', 3200000, 2400000, 240, 1, 1, 100, 0, 36000, 1, '{\"Experience\":1228800,\"Honor\":6144,\"Credits\":3276800,\"Uridium\":3072}', 0),
(162, 33, 0, 'ship33', '-=: Ice Meteorit :=-', 14000000, 4000000, 250, 1, 1, 100, 0, 15000, 1, '{\"Experience\":3000000,\"Honor\":15000,\"Credits\":6000000,\"Uridium\":5450}', 0),
(163, 47, 0, 'ship47', '[ Uber Sibelon ]', 1600000, 1600000, 100, 1, 1, 100, 0, 21000, 1, '{\"Experience\":307200,\"Honor\":1536,\"Credits\":1638400,\"Uridium\":768}', 0),
(164, 83, 0, 'ship83', '[ Uber Kucurbium ]', 80000000, 10000000, 250, 1, 1, 100, 0, 185000, 1, '{\"Experience\":13107200,\"Honor\":12288,\"Credits\":39321600,\"Uridium\":8192}', 0),
(165, 500, 10, 'ship_goliath_design_gold', 'Goliath Gold', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(166, 499, 10, 'ship_goliath_design_silver', 'Goliath Silver', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(167, 498, 10, 'ship_goliath_design_bronze', 'Goliath Iron', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(168, 497, 10, 'surgeon-cicada borrar', 'borrar', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(169, 496, 10, 'ship_goliath_design_cbs-design', 'MYSTERIOUS', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(170, 11, 0, 'ship11', 'DemaNeR ', 512000, 256000, 400, 1, 1, 100, 1, 4850, 0, '{\"Experience\":153600,\"Honor\":1536,\"Credits\":819200,\"Uridium\":768}', 0),
(171, 126, 0, 'ship126', 'DemaNeR Freighter', 850000000, 750000000, 150, 1, 1, 100, 1, 15000, 0, '{\"Experience\":9000000,\"Honor\":90000,\"Credits\":36000000,\"Uridium\":70000}', 0),
(172, 127, 0, 'ship127', '-=[ Devourer ]=- ', 2000000, 1000000, 200, 1, 1, 100, 1, 12000, 0, '{\"Experience\":3000000,\"Honor\":1536,\"Credits\":5000000,\"Uridium\":3072}', 0),
(173, 1004, 1000, 'ship_tartarus_lava', 'tartarus-lava', 360000, 0, 300, 14, 15, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(174, 261, 10, 'ship_solace_design_solace-asimov', 'Solace-Asimov', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(175, 262, 10, 'ship_solace_design_solace-argon', 'Solace-Argon', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(176, 263, 10, 'ship_solace_design_solace-blaze', 'Solace-Blaze', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(177, 264, 10, 'ship_solace_design_solace-borealis', 'Solace-Borealis', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(178, 340, 10, 'ship_solace_design_solace-ocean', 'Solace-Ocean', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(179, 341, 10, 'ship_solace_design_solace-poison', 'Solace-Poison', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(180, 342, 10, 'ship_solace_design_solace-tyrannos', 'Solace-Tyrannos', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(181, 281, 245, 'ship_cyborg_design_cyborg-infinite', 'Cyborg-Infinite', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(182, 249, 245, 'ship_cyborg_design_cyborg-lava', 'Cyborg-Lava', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(183, 273, 245, 'ship_cyborg_design_cyborg-carbonite', 'Cyborg-Carbonite', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(184, 274, 245, 'ship_cyborg_design_cyborg-firestar', 'Cyborg-Firestar', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(185, 486, 10, 'ship_spectrum_design_spectrum-dusklight', 'Spectrum-dusklight', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(186, 487, 10, 'ship_spectrum_design_spectrum-legend', 'Spectrum-Legend', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(187, 265, 10, 'ship_sentinel_design_sentinel-argon', 'Sentinel-Argon', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(188, 266, 10, 'ship_sentinel_design_sentinel-legend', 'Sentinel-Legend', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(189, 268, 10, 'ship_diminisher_design_diminisher-argon', 'Diminisher-Argon', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(190, 269, 10, 'ship_diminisher_design_diminisher-legend', 'Diminisher-Legend', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(191, 275, 245, 'ship_cyborg_design_cyborg-nobilis', 'Cyborg-Nobilis', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(192, 276, 245, 'ship_cyborg_design_cyborg-scourge', 'Cyborg-Scourge', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(193, 277, 245, 'ship_cyborg_design_cyborg-inferno', 'Cyborg-Inferno', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(194, 278, 245, 'ship_cyborg_design_cyborg-ullrin', 'Cyborg-Ullrin', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(195, 279, 245, 'ship_cyborg_design_cyborg-dusklight', 'Cyborg-Dusklight', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(196, 170, 10, 'ship_goliath_design_orion', 'Orion-azul', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(197, 280, 245, 'ship_cyborg_design_cyborg-frozen', 'Cyborg-Frozen', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(198, 282, 245, 'ship_cyborg_design_cyborg-sunstorm', 'Cyborg-Sunstorm', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(199, 283, 10, 'ship_sentinel_design_sentinel-expo2016', 'Sentinel-Expo', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(200, 284, 10, 'ship_sentinel_design_sentinel-frost', 'Sentinel-Frozen se ve rara', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(201, 285, 10, 'ship_sentinel_design_sentinel-inferno', 'Sentinel-Inferno no se ve', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(202, 286, 10, 'ship_spectrum_design_spectrum-inferno', 'Spectrum-Inferno se ve rara', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(203, 287, 10, 'ship_spectrum_design_spectrum-frost', 'Spectrum-Frost se ve rara', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(204, 288, 10, 'ship_spectrum_design_spectrum-poison', 'Spectrum-Poison', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(205, 289, 10, 'ship_spectrum_design_spectrum-lava', 'Spectrum-Lava', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(206, 290, 10, 'ship_spectrum_design_spectrum-sandstorm', 'Spectrum-Sandstorm', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(207, 291, 10, 'ship_spectrum_design_spectrum-blaze', 'Spectrum-Blaze', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(208, 292, 10, 'ship_spectrum_design_spectrum-ocean', 'Spectrum-Ocean', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(209, 293, 10, 'ship_diminisher_design_diminisher-expo2016', 'Diminisher-Expo2016', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(210, 294, 10, 'ship_diminisher_design_diminisher-lava', 'Diminisher-Lava', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(211, 295, 10, 'ship_g_champion_design_g_champion_spain', 'Champion-Spain', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(212, 296, 10, 'ship_g-champion_design_g-champion-albania', 'Champion-Albania', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(213, 297, 10, 'ship_g-champion_design_g-champion-austria', 'Champion-Austria', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(214, 298, 10, 'ship_g-champion_design_g-champion-belgium', 'Champion-Belgium', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(215, 299, 10, 'ship_g-champion_design_g-champion-croatia', 'Champion-Croatia', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(216, 300, 10, 'ship_g-champion_design_g-champion-czech-republic', 'Champion-Czech-Republic', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(217, 301, 10, 'ship_g-champion_design_g-champion-england', 'Champion-England', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(218, 302, 10, 'ship_g-champion_design_g-champion-france', 'Champion-France', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(219, 303, 10, 'ship_g-champion_design_g-champion-germany', 'Champion-Germany', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(220, 304, 10, 'ship_g-champion_design_g-champion-iceland', 'Champion-Iceland', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(221, 305, 10, 'ship_g-champion_design_g-champion-italy', 'Champion-Italy', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(222, 306, 10, 'ship_g-champion_design_g-champion-northern-ireland', 'Champion-Northern-Ireland', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(223, 307, 10, 'ship_g-champion_design_g-champion-poland', 'Champion-Poland', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(224, 308, 10, 'ship_g-champion_design_g-champion-portugal', 'Champion-Portugal', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(225, 309, 10, 'ship_g-champion_design_g-champion-republic-of-ireland', 'Champion-Republic-Of-Ireland', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(226, 310, 10, 'ship_g-champion_design_g-champion-romania', 'Champion-Romania', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(227, 311, 10, 'ship_g-champion_design_g-champion-russia', 'Champion-Russia', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(228, 312, 10, 'ship_g-champion_design_g-champion-slovakia', 'Champion-Slovakia', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(229, 313, 10, 'ship_g-champion_design_g-champion-sweden', 'Champion-Sweden', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(230, 314, 10, 'ship_g-champion_design_g-champion-switzerland', 'Champion-Switzerland', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(231, 315, 10, 'ship_g-champion_design_g-champion-ukraine', 'Champion-Ukraine', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(232, 316, 10, 'ship_g-champion_design_g-champion-wales', 'Champion-Wales', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(233, 317, 10, 'ship_g-champion_design_g-champion-dusklight', 'Champion-Dusklight', 356000, 0, 300, 16, 16, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(234, 318, 10, 'ship_goliath_design_bronze', 'Goliath-Bronze', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(235, 319, 10, 'ship_goliath_design_silver', 'Goliath-Silver', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(236, 320, 10, 'ship_goliath_design_gold', 'Goliath-Gold', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(237, 321, 10, 'ship_goliath_design_iron', 'Goliath-Iron', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(238, 247, 246, 'ship_hammerclaw_design_hammerclaw-lava', 'Hammerclaw-Lava', 377500, 0, 310, 12, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(239, 248, 246, 'ship_hammerclaw_design_hammerclaw-carbonite', 'Hammerclaw-Carbonite', 377500, 0, 310, 12, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(240, 250, 246, 'ship_hammerclaw_design_hammerclaw-bane', 'Hammerclaw-Bane', 377500, 0, 310, 12, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(241, 251, 246, 'ship_hammerclaw_design_hammerclaw-frozen', 'Hammerclaw-Frozen', 377500, 0, 310, 12, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(242, 252, 246, 'ship_hammerclaw_design_hammerclaw-nobilis', 'Hammerclaw-Nobilis', 377500, 0, 310, 12, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(243, 253, 246, 'ship_hammerclaw_design_hammerclaw-ullrin', 'Hammerclaw-Ullrin', 377500, 0, 310, 12, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(244, 255, 245, 'ship_cyborg_design_cyborg-starscream', 'Cyborg-Starscream', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(245, 256, 245, 'ship_cyborg_design_cyborg-celestial', 'Cyborg-Celestial', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(246, 257, 245, 'ship_cyborg_design_cyborg-maelstrom', 'Cyborg-Maelstrom', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(247, 258, 245, 'ship_cyborg_design_cyborg-asimov', 'Cyborg-Asimov', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(248, 259, 245, 'ship_cyborg_design_cyborg-tyrannos', 'Cyborg-Tyrannos', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(249, 260, 10, 'ship_solace_design_solace-frost', 'Solace-Frost', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(250, 343, 10, 'ship_sentinel_design_sentinel-asimov', 'Sentinel-Asimov', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(251, 344, 10, 'ship_sentinel_design_sentinel-arios', 'Sentinel-Arios', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(252, 345, 10, 'ship_sentinel_design_sentinel-neikos', 'Sentinel-Neikos', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(253, 346, 10, 'ship_sentinel_design_sentinel-lava', 'Sentinel-Lava', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(254, 347, 10, 'ship_sentinel_design_sentinel-tyrannos', 'Sentinel-Tyrannos', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(255, 349, 10, 'ship_spectrum_design_spectrum-tyrannos', 'Spectrum-Tyrannos', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(256, 350, 10, 'ship_venom_design_venom-argon', 'Venom-Argon', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(257, 351, 10, 'ship_venom_design_venom-blaze', 'Venom-Blaze', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(258, 352, 10, 'ship_venom_design_venom-borealis', 'Venom-Borealis', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(259, 353, 10, 'ship_venom_design_venom-ocean', 'Venom-Ocean', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(260, 354, 10, 'ship_venom_design_venom-poison', 'Venom-Poison', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(261, 355, 245, 'ship_cyborg_design_cyborg-ocean', 'Cyborg-Ocean', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(262, 356, 245, 'ship_cyborg_design_cyborg-poison', 'Cyborg-Poison', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(263, 357, 245, 'ship_cyborg_design_cyborg-prometheus', 'Cyborg-Prometheus', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(264, 358, 245, 'ship_cyborg_design_cyborg-blaze', 'Cyborg-Blaze', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(265, 359, 10, 'ship_solace_design_solace-inferno', 'Solace-Inferno se ve rara', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(266, 360, 10, 'ship_diminisher_design_diminisher-frost', 'Diminisher-Frost', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(267, 361, 10, 'ship_g-surgeon_design_g-surgeon-cicada', 'Surgeon-Cicada', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(268, 362, 10, 'ship_g-surgeon_design_g-surgeon-locust', 'Surgeon-Locust', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(269, 363, 10, 'ship_g-champion_design_g-champion-lava', 'Champion-Lava', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(270, 364, 10, 'ship_g-champion_design_g-champion-argon', 'Champion-Argon', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(271, 365, 10, 'ship_g-champion_design_g-champion-legend', 'Champion-Legend', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(272, 366, 10, 'ship_g-champion_design_g-champion-tyrannos', 'Champion-Tyrannos', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(273, 367, 246, 'ship_hammerclaw_design_hammerclaw-tyrannos', 'Hammerclaw-Tyrannos', 377500, 0, 310, 12, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(274, 368, 246, 'ship_hammerclaw_design_hammerclaw-prometheus', 'Hammerclaw-Prometheus', 377500, 0, 310, 12, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(275, 369, 130, 'ship_pusat_design_pusat-blaze', 'Pusat-Blaze', 256000, 0, 360, 16, 12, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(276, 370, 130, 'ship_pusat_design_pusat-expo16', 'Pusat-Expo2016', 256000, 0, 360, 16, 12, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(277, 371, 130, 'ship_pusat_design_pusat-lava', 'Pusat-Lava', 256000, 0, 360, 16, 12, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(278, 372, 130, 'ship_pusat_design_pusat-legend', 'Pusat-Legend', 256000, 0, 360, 16, 12, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(279, 373, 130, 'ship_pusat_design_pusat-ocean', 'Pusat-Ocean', 256000, 0, 360, 16, 12, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(280, 374, 130, 'ship_pusat_design_pusat-poison', 'Pusat-Poison', 256000, 0, 360, 16, 12, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(281, 375, 130, 'ship_pusat_design_pusat-sandstorm', 'Pusat-SandStorm', 256000, 0, 360, 16, 12, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(282, 376, 10, 'ship_solace_design_solace-contagion', 'Solace-Contagion', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(283, 377, 10, 'ship_sentinel_design_sentinel-contagion', 'Sentinel-Contagion', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(284, 378, 10, 'ship_spectrum_design_spectrum-argon', 'Spectrum-Argon', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(285, 902, 900, 'mimesis-epion', 'mimesis-epion', 386000, 0, 300, 14, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(286, 903, 900, 'mimesis-nobilis', 'mimesis-nobilis', 386000, 0, 300, 14, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(287, 904, 900, 'mimesis-osiris', 'mimesis-osiris', 386000, 0, 300, 14, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(288, 905, 900, 'mimesis-smite', 'mimesis-smite', 386000, 0, 300, 14, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(289, 906, 900, 'mimesis-tyrannos', 'mimesis-tyrannos', 386000, 0, 300, 40, 40, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(290, 245, 245, 'ship_cyborg', 'Cyborg', 356000, 0, 300, 16, 16, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(291, 804, 246, 'ship_hammerclaw_design_hammerclaw-tyrannos', 'Hammerclaw-Tyrannos', 377500, 0, 310, 12, 14, 1500, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(292, 122, 0, 'ship122', '[ Emperor-Kristallon ]', 50250000, 35500000, 350, 1, 1, 0, 0, 25000, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}', 0),
(293, 124, 0, 'ship124', '[ Emperor-Sibelon ]', 25250000, 21500000, 350, 1, 1, 0, 0, 20000, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}', 0),
(294, 119, 0, 'ship119', '..::{ Curcubitor }::..', 250000, 150000, 250, 1, 1, 0, 0, 2000, 0, '{\"Experience\":12000,\"Honor\":150,\"Credits\":36000,\"Uridium\":72}', 0),
(295, 123, 0, 'ship123', '[ Emperor-Lordakium ]', 18250000, 16500000, 350, 1, 1, 0, 0, 22000, 0, '{\"Experience\":20000,\"Honor\":10002,\"Credits\":20000,\"Uridium\":805}', 0),
(296, 82, 0, 'ship82', '..::{ Kucurbium }::..', 5000000, 5000000, 200, 1, 1, 100, 1, 25000, 1, '{\"Experience\":614400,\"Honor\":3072,\"Credits\":12000000,\"Uridium\":1536}', 0),
(297, 97, 0, 'ship97', '..::{ Ravager }::..', 370000, 220000, 340, 1, 1, 100, 1, 2200, 1, '{\"Experience\":4300,\"Honor\":380,\"Credits\":1000,\"Uridium\":42}', 0),
(298, 96, 0, 'ship96', '..::{ Hooligan }::..', 300000, 220000, 340, 1, 1, 100, 1, 2200, 1, '{\"Experience\":4400,\"Honor\":400,\"Credits\":1100,\"Uridium\":43}', 0),
(299, 95, 0, 'ship95', '..::{ Convict }::..', 370000, 270000, 345, 1, 1, 100, 1, 3000, 1, '{\"Experience\":4500,\"Honor\":420,\"Credits\":1200,\"Uridium\":44}', 0),
(300, 90, 0, 'ship90', '..::{ Century-Falcon }::..', 12000000, 13000000, 330, 1, 1, 100, 1, 20000, 1, '{\"Experience\":31600,\"Honor\":700,\"Credits\":29530,\"Uridium\":500}', 0),
(301, 91, 0, 'ship91', '..::{ Corsair }::..', 200000, 150000, 345, 1, 1, 100, 1, 1200, 1, '{\"Experience\":3500,\"Honor\":1000,\"Credits\":210,\"Uridium\":27}', 0),
(302, 92, 0, 'ship92', '..::{ Outcast }::..', 150000, 100000, 345, 1, 1, 100, 1, 900, 1, '{\"Experience\":1000,\"Honor\":950,\"Credits\":295,\"Uridium\":18}', 0),
(303, 93, 0, 'ship93', '..::{ Marauder }::..', 380000, 100000, 345, 1, 1, 100, 1, 900, 1, '{\"Experience\":4600,\"Honor\":430,\"Credits\":1300,\"Uridium\":45}', 0),
(304, 94, 0, 'ship94', '..::{ Vagrant }::..', 800000, 500000, 345, 1, 1, 100, 1, 500, 1, '{\"Experience\":4700,\"Honor\":440,\"Credits\":1400,\"Uridium\":46}', 0),
(305, 24, 0, 'ship24', '..::( Boss Lordakia )::..', 8000, 8000, 320, 1, 1, 100, 1, 363, 1, '{\"Experience\":9600,\"Honor\":48,\"Credits\":9600,\"Uridium\":24}', 0),
(306, 76, 0, 'ship76', '-=[ Sibelonit ]=-', 40000, 40000, 320, 1, 1, 100, 1, 1000, 1, '{\"Experience\":9600,\"Honor\":48,\"Credits\":38400,\"Uridium\":36}', 0),
(307, 77, 0, 'ship77', '-=[ Lordakium ]=-', 300000, 200000, 230, 1, 1, 100, 0, 3500, 1, '{\"Experience\":76800,\"Honor\":384,\"Credits\":409600,\"Uridium\":192}', 0),
(308, 28, 0, 'ship28', '..::( Boss Lordakium )::..', 1200000, 800000, 230, 1, 1, 100, 0, 16000, 1, '{\"Experience\":307200,\"Honor\":1536,\"Credits\":1638400,\"Uridium\":768}', 0),
(309, 1100, 1100, 'ship_zephyr', 'Zephyr', 500000, 0, 330, 16, 16, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(310, 1120, 1120, 'ship_berserker', 'Berserker', 500000, 0, 300, 16, 17, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(311, 1121, 1120, 'ship_berserker-arios', 'Berserker-Arios', 520000, 0, 300, 16, 17, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(312, 1122, 1120, 'ship_berserker-blaze', 'Berserker-Blaze', 520000, 0, 300, 16, 17, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(313, 1123, 1120, 'ship_berserker-neikos', 'Berserker-Neikos', 520000, 0, 300, 16, 17, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(314, 1124, 1120, 'ship_berserker-phantasm', 'Berserker-Phantasm', 520000, 0, 300, 16, 17, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(315, 1130, 1130, 'ship_disruptor', 'Disruptor', 356000, 0, 300, 14, 14, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(316, 1131, 1130, 'ship_disruptor-arios', 'Disruptor-Arios', 356000, 0, 300, 14, 14, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(317, 1132, 1130, 'ship_disruptor-neikos', 'Disruptor-Neikos', 356000, 0, 300, 14, 14, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(318, 1133, 1130, 'ship_disruptor-tyrannos', 'Disruptor-Tyrannos', 356000, 0, 300, 14, 14, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(319, 1140, 1140, 'ship_solaris', 'Solaris', 455000, 0, 300, 16, 16, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(320, 1141, 1140, 'ship_solaris-amor', 'Solaris-Amor', 500000, 0, 300, 16, 16, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(321, 1142, 1140, 'ship_solaris-psyche', 'Solaris-Psyche', 500000, 0, 300, 16, 16, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(322, 1150, 1150, 'centurion', 'Centurion', 365000, 0, 300, 15, 15, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(323, 1151, 1150, 'ship_centurion-frost', 'Centurion-Frost', 365000, 0, 300, 15, 15, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(324, 1152, 1150, 'centurion-ability', 'Centurion-Ability', 365000, 0, 300, 16, 17, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(325, 1153, 1150, 'centurion-damage', 'Centurion-Damage', 365000, 0, 300, 16, 17, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(326, 1154, 1150, 'centurion-hp', 'Centurion-Hp', 365000, 0, 300, 16, 17, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(327, 1155, 1150, 'centurion-shield', 'Centurion-Shield', 365000, 0, 300, 16, 17, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(328, 1156, 1150, 'centurion-speed', 'Centurion-Speed', 365000, 0, 320, 16, 17, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(329, 1157, 1150, 'centurion-tyrannos', 'Centurion-Tyrannos', 365000, 0, 300, 16, 17, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(330, 1165, 1165, 'ship_keres', 'Keres', 376000, 0, 330, 16, 16, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(331, 1166, 1165, 'ship_keres-contagion', 'Keres-Contagion', 396000, 0, 330, 16, 16, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(332, 1185, 1185, 'ship_hecate', 'Hecate', 377000, 0, 300, 15, 16, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(333, 1186, 1185, 'ship_hecate_design_hecate-dusklight', 'Hecate-DuskLight', 377000, 0, 300, 15, 16, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1);
INSERT INTO `server_ships` (`id`, `shipID`, `baseShipId`, `lootID`, `name`, `health`, `shield`, `speed`, `lasers`, `generators`, `cargo`, `aggressive`, `damage`, `respawnable`, `reward`, `isdesign`) VALUES
(334, 1187, 1185, 'ship_hecate_design_hecate-inferno', 'Hecate-Inferno', 377000, 0, 300, 15, 16, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(335, 1188, 1185, 'ship_hecate_design_hecate-ullrin', 'Hecate-Ullrin', 377000, 0, 300, 15, 16, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(336, 1189, 1185, 'ship_hecate_design_hecate-tyrannos', 'Hecate-Tyrannos', 377000, 0, 300, 15, 16, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(337, 1190, 1185, 'ship_hecate_design_hecate-frost', 'Hecate-Frost', 377000, 0, 300, 15, 16, 100, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(338, 36, 0, 'ship36', '[ Uber-Streuner ]', 6400, 3200, 300, 1, 1, 100, 1, 160, 1, '{\"Experience\":13660,\"Honor\":60,\"Credits\":9600,\"Uridium\":24}', 0),
(339, 37, 0, 'ship37', '[ Uber-Lordakia ]', 16000, 16000, 250, 1, 1, 100, 1, 550, 1, '{\"Experience\":19200,\"Honor\":96,\"Credits\":630,\"Uridium\":48}', 0),
(340, 38, 0, 'ship38', '[ Uber-Saimon ]', 48000, 24000, 340, 1, 1, 100, 1, 1500, 1, '{\"Experience\":38400,\"Honor\":192,\"Credits\":38400,\"Uridium\":96}', 0),
(341, 43, 0, 'ship43', '[ Uber-Mordon ]', 160000, 80000, 110, 1, 1, 100, 1, 2800, 1, '{\"Experience\":76800,\"Honor\":384,\"Credits\":102400,\"Uridium\":192}', 0),
(342, 39, 0, 'ship39', '[ Uber-Devolarium ]', 800000, 800000, 150, 1, 1, 100, 1, 9500, 1, '{\"Experience\":153600,\"Honor\":768,\"Credits\":819200,\"Uridium\":384}', 0),
(343, 74, 0, 'ship74', '-=[ Sibelon ]=-', 200000, 200000, 100, 1, 1, 100, 0, 2600, 1, '{\"Experience\":38400,\"Honor\":192,\"Credits\":204800,\"Uridium\":96}', 0),
(344, 40, 0, 'ship40', '[ Uber-Sibelonit ]', 320000, 320000, 350, 1, 1, 100, 1, 7000, 1, '{\"Experience\":76800,\"Honor\":384,\"Credits\":409600,\"Uridium\":288}', 0),
(345, 41, 0, 'ship41', '[ Uber-Lordakium ]', 2400000, 1600000, 100, 1, 1, 100, 0, 26000, 1, '{\"Experience\":614400,\"Honor\":3072,\"Credits\":3276800,\"Uridium\":1536}', 0),
(346, 44, 0, 'ship44', '[ Uber-StreuneR ]', 320000, 240000, 330, 1, 1, 100, 1, 8000, 1, '{\"Experience\":144000,\"Honor\":720,\"Credits\":192000,\"Uridium\":360}', 0),
(347, 379, 10, 'ship_diminisher_design_diminisher-epion', 'Diminisher-Epion', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(348, 380, 10, 'ship_diminisher_design_diminisher-phantasm', 'Diminisher-Phantasm', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(349, 381, 10, 'ship_diminisher_design_diminisher-ullrin', 'Diminisher-Ullrin', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(350, 1300, 1300, 'ship_retiarus', 'Retiarus', 500000, 0, 300, 16, 16, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(351, 1301, 1300, 'ship_retiarus-arios', 'Retiarus-Arios', 500000, 0, 300, 17, 16, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(352, 1302, 1300, 'ship_retiarus-neikos', 'Retiarus-Neikos', 500000, 0, 305, 17, 17, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(353, 382, 10, 'ship_diminisher_design_diminisher-smite', 'Diminisher-Smite', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(354, 383, 10, 'ship_diminisher_design_diminisher-osiris', 'Diminisher-Osiris', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(355, 393, 10, 'ship_sentinel_design_sentinel-epion', 'Sentinel-Epion', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(356, 394, 10, 'ship_sentinel_design_sentinel-harbinger', 'Sentinel-Harbinger', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(357, 395, 10, 'ship_sentinel_design_sentinel-osiris', 'Sentinel-Osiris', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(358, 396, 10, 'ship_sentinel_design_sentinel-smite', 'Sentinel-smite', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(359, 397, 10, 'ship_sentinel_design_sentinel-ullrin', 'Sentinel-ullrin', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(360, 410, 10, 'ship_solace_design_solace-epion', 'Solace-Epion', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(361, 411, 10, 'ship_solace_design_solace-nobilis', 'Solace-Nobilis', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(362, 412, 10, 'ship_solace_design_solace-osiris', 'Solace-Osiris', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(363, 413, 10, 'ship_solace_design_solace-smite', 'Solace-Smite', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(364, 414, 10, 'ship_solace_design_solace-ullrin', 'Solace-Ullrin', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(365, 424, 10, 'ship_spectrum_design_spectrum-ace', 'Spectrum-Ace', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(366, 425, 10, 'ship_spectrum_design_spectrum-epion', 'Spectrum-Epion', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(367, 426, 10, 'ship_spectrum_design_spectrum-osiris', 'Spectrum-Osiris', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(368, 427, 10, 'ship_spectrum_design_spectrum-smite', 'Spectrum-Smite', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(369, 450, 10, 'ship_goliath_design_enforcer_bonus', 'Enforcer-Bonus', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(370, 451, 10, 'ship_goliath_design_bastion_bonus', 'Bastion-Bonus', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(371, 452, 245, 'ship_cyborg_design_cyborg-argon', 'Cyborg-Argon', 396000, 0, 320, 16, 16, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(372, 453, 10, 'ship_diminisher_design_diminisher-carbonite', 'Diminisher-Carbonite', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(373, 1191, 1185, 'ship_hecate_design_hecate-carbonite', 'Hecate-Carbonite', 377000, 0, 300, 15, 16, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(374, 454, 130, 'ship_pusat_design_pusat-carbonite', 'Pusat-Carbonite', 280000, 0, 360, 16, 12, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(375, 398, 10, 'ship_sentinel_design_sentinel-carbonite', 'Sentinel-Carbonite', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(376, 415, 10, 'ship_solace_design_solace-carbonite', 'Solace-Carbonite', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(377, 428, 10, 'ship_spectrum_design_spectrum-carbonite', 'Spectrum-Carbonite', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(378, 1125, 1120, 'ship_berserker-carbonite', 'Berserker-Carbonite', 500000, 0, 300, 16, 17, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(379, 1400, 1400, 'ship_orcus', 'Orcus', 500000, 0, 300, 16, 16, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(380, 21, 0, 'ship21', '-=[ UFONIT ]=-', 60000, 50000, 700, 1, 1, 0, 0, 300, 1, '{\"Experience\":400,\"Honor\":104,\"Credits\":68,\"Uridium\":35}', 0),
(381, 32, 0, 'ship32', '-=[ SANTA-BOT ]=-', 550000, 700000, 280, 1, 1, 0, 1, 1800, 1, '{\"Experience\":170,\"Honor\":110,\"Credits\":202,\"Uridium\":15}', 0),
(382, 700, 0, 'ship700', '-=[ SANTA-BOT ]=-', 740000, 980000, 285, 1, 1, 0, 1, 2300, 1, '{\"Experience\":170,\"Honor\":110,\"Credits\":202,\"Uridium\":15}', 0),
(383, 701, 0, 'ship701', '-=[ SANTA-BOT ]=-', 1260000, 1550000, 287, 1, 1, 0, 1, 3400, 1, '{\"Experience\":170,\"Honor\":110,\"Credits\":202,\"Uridium\":15}', 0),
(384, 702, 0, 'ship702', '-=[ SANTA-BOT ]=-', 2150000, 1300000, 299, 1, 1, 0, 1, 5500, 1, '{\"Experience\":170,\"Honor\":110,\"Credits\":202,\"Uridium\":15}', 0),
(385, 703, 0, 'ship703', '-=[ SANTA-BOT ]=-', 3080000, 3289000, 300, 1, 1, 0, 1, 6450, 1, '{\"Experience\":170,\"Honor\":110,\"Credits\":202,\"Uridium\":15}', 0),
(386, 704, 0, 'ship704', '-=[ SANTA-BOT ]=-', 4130000, 4300000, 301, 1, 1, 0, 1, 7000, 1, '{\"Experience\":170,\"Honor\":110,\"Credits\":202,\"Uridium\":15}', 0),
(387, 705, 0, 'ship705', '-=[ SANTA-BOT ]=-', 5530000, 7600000, 305, 1, 1, 0, 1, 8700, 1, '{\"Experience\":170,\"Honor\":110,\"Credits\":202,\"Uridium\":15}', 0),
(388, 213, 0, 'black_light1', 'Impulse II', 1200000, 750000, 450, 1, 1, 0, 1, 4500, 1, '{\"Experience\":222000,\"Honor\":30000,\"Credits\":140000,\"Uridium\":4000}', 0),
(389, 384, 10, 'ship_diminisher-prometheus', 'Diminisher-Prometheus', 356000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":112000,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(390, 214, 0, 'black_light2', 'Attend XI', 7500000, 4800000, 150, 1, 1, 0, 1, 15000, 1, '{\"Experience\":550000,\"Honor\":90750,\"Credits\":300000,\"Uridium\":25000}', 0),
(391, 215, 0, 'black_light3', 'Invoke XVI', 30000000, 0, 0, 1, 1, 0, 1, 70000, 0, '{\"Experience\":7000000,\"Honor\":500000,\"Credits\":3000000,\"Uridium\":500000}', 0),
(392, 216, 0, 'black_light4', 'Mindfire Behemoth', 115000000, 0, 0, 1, 1, 0, 1, 350000, 0, '{\"Experience\":20000000,\"Honor\":1000000,\"Credits\":9000000,\"Uridium\":1350000}', 0),
(393, 1401, 1400, 'ship_orcus-nobilis', 'Orcus-Nobilis', 500000, 0, 300, 16, 16, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(394, 1402, 1400, 'ship_orcus-frost', 'Orcus-Frost', 500000, 0, 300, 16, 16, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(395, 1403, 1400, 'ship_orcus-harbinger', 'Orcus-Harbinger', 500000, 0, 300, 16, 16, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(396, 1404, 1400, 'ship_orcus-seraph', 'Orcus-Seraph', 520000, 0, 320, 17, 17, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 1),
(397, 416, 10, 'ship_solace-prometheus', 'Solace-Prometheus', 356000, 0, 300, 16, 16, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0),
(398, 1303, 1300, 'ship_retiarus-frost', 'Retiarus-Frost', 400000, 0, 305, 17, 17, 0, 0, 0, 0, '{\"Experience\":11200,\"Honor\":112,\"Credits\":512,\"Uridium\":512}', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `shop_category`
--

CREATE TABLE `shop_category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `active` varchar(255) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `shop_category`
--

INSERT INTO `shop_category` (`id`, `category`, `active`) VALUES
(1, 'ships', '1'),
(2, 'lasers', '1'),
(3, 'ammo', '1'),
(4, 'generator', '1'),
(5, 'drones', '1'),
(6, 'drones-formation', '1'),
(7, 'P.E.T', '1'),
(8, 'Extras', '1'),
(9, 'modules', '1'),
(10, 'desings', '1'),
(11, 'special-ec', '1'),
(12, 'new-desings', '1'),
(13, 'booster', '1'),
(14, 'special-credits', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `shop_items`
--

CREATE TABLE `shop_items` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `information` longtext NOT NULL,
  `price` bigint(20) NOT NULL,
  `priceType` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `active` varchar(255) NOT NULL,
  `shipId` int(11) NOT NULL,
  `design_name` varchar(255) NOT NULL,
  `moduleId` varchar(255) NOT NULL,
  `moduleType` varchar(255) NOT NULL,
  `boosterId` varchar(255) NOT NULL,
  `boosterType` varchar(255) NOT NULL,
  `boosterDuration` varchar(255) NOT NULL,
  `laserName` varchar(255) NOT NULL,
  `petName` varchar(255) NOT NULL,
  `skillTree` varchar(255) NOT NULL,
  `droneName` varchar(255) NOT NULL,
  `ammoId` varchar(255) NOT NULL,
  `typeKey` varchar(255) NOT NULL,
  `petDesign` varchar(255) NOT NULL,
  `petFuel` varchar(255) NOT NULL,
  `petModule` varchar(255) NOT NULL,
  `FormationName` varchar(255) NOT NULL,
  `nameBootyKey` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `shop_items`
--

INSERT INTO `shop_items` (`id`, `category`, `name`, `information`, `price`, `priceType`, `amount`, `image`, `active`, `shipId`, `design_name`, `moduleId`, `moduleType`, `boosterId`, `boosterType`, `boosterDuration`, `laserName`, `petName`, `skillTree`, `droneName`, `ammoId`, `typeKey`, `petDesign`, `petFuel`, `petModule`, `FormationName`, `nameBootyKey`) VALUES
(1, 'drones', 'Apis', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(28, 158, 251);display: inline-block;\">Its a part for build a Apis drone. To assemble this drone you need 45 parts. The drone is assembled at Labor.</p>', 55000, 'uridium', '0', 'do_img/global/items/drone/apis.gif', '1', 0, '', '', '', '', '', '', '', '', '', 'apis', '', '', '', '', '', '', ''),
(2, 'drones', 'Zeus', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(28, 158, 251);display: inline-block;\">Its a part for build a Zeus drone.To assemble this drone you need 45 parts. The drone is assembled at Labor.</p>', 65000, 'uridium', '0', 'do_img/global/items/drone/zeus.webp', '1', 0, '', '', '', '', '', '', '', '', '', 'zeus', '', '', '', '', '', '', ''),
(3, 'Extras', 'Logdisk', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Parts for research pilots points.</p>', 200, 'uridium', '1', '/do_img/global/items/resource/logfile.gif', '1', 0, '', '', '', '', '', '', '', '', 'logdisks', '', '', '', '', '', '', '', ''),
(4, 'Extras', 'Logdisk', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Parts for research pilots points.</p>', 300000, 'credits', '1', '/do_img/global/items/resource/logfile.gif', '1', 0, '', '', '', '', '', '', '', '', 'logdisks', '', '', '', '', '', '', '', ''),
(5, 'Extras', 'Logdisk', '', 5000000, 'credits', '1', '', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(6, 'Extras', 'Logdisk', '', 5000000, 'credits', '1', '', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(7, 'Extras', 'Logdisk', '', 5000000, 'credits', '1', '', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(8, 'Extras', 'Logdisk', '', 5000000, 'credits', '1', '', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 'drones', 'Havoc', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">10% Damage</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 212, 0);display: inline-block;\">Full Set</p>', 125000, 'uridium', '1', 'do_img/global/items/drone/designs/havoc.png', '1', 0, '', '', '', '', '', '', '', '', '', 'havocCount', '', '', '', '', '', '', ''),
(10, 'drones', 'Hercules', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">15%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">20%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 212, 0);display: inline-block;\">Full Set</p>', 145000, 'uridium', '1', 'do_img/global/items/drone/designs/hercules.png', '1', 0, '', '', '', '', '', '', '', '', '', 'herculesCount', '', '', '', '', '', '', ''),
(11, 'Extras', 'Logdisk', '', 5000000, 'credits', '1', '', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(12, 'Extras', 'Logdisk', '', 5000000, 'credits', '1', '', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(13, 'Extras', 'Logdisk', '', 5000000, 'credits', '1', '', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(14, 'Extras', 'Logdisk', '', 5000000, 'credits', '1', '', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(15, 'lasers', 'LF-1', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(101, 255, 37);display: inline-block;\">It used to exceed the LF-3 as the best laser cannon available.</p>', 10000, 'credits', '1', '/do_img/global/items/equipment/weapon/laser/lf-1.gif', '1', 0, '', '', '', '', '', '', 'lf1Count', '', '', '', '', '', '', '', '', '', ''),
(16, 'modules', 'Module HULM-1', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Part for build base 1/2</p>', 15, 'event', '0', 'do_img/global/items/module/hulm-1_100x100.png', '1', 0, '', '2', '2', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(17, 'modules', 'Module DEFM-1', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Part for build base 2/2</p>', 15, 'event', '0', 'do_img/global/items/module/defm-1_100x100.png', '1', 0, '', '3', '3', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(18, 'modules', 'Module REPM-1', 'Repair modules and base', 10, 'event', '0', 'do_img/global/items/module/repm-1_100x100.png', '0', 0, '', '4', '4', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(19, 'modules', 'Module HONM-1', 'Increases Honor points', 8, 'event', '0', 'do_img/global/items/module/honm-1_100x100.png', '0', 0, '', '10', '10', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(20, 'booster', 'HP B01', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">Duration 6 Hours, +7% Health</p>', 10000, 'uridium', '0', '/do_img/global/items/booster_hp-b01_100x100.png', '1', 0, '', '', '', '7', '8', '18000', '', '', '', '', '', '', '', '', '', '', ''),
(21, 'booster', 'SHD B01\r\n', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">Duration 6 Hours, +10% Shield</p>', 10000, 'uridium', '0', '/do_img/global/items/booster_shd-b01_100x100.png', '1', 0, '', '', '', '3', '15', '18000', '', '', '', '', '', '', '', '', '', '', ''),
(22, 'booster', 'DMG B01\r\n', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">Duration 6 Hours, +12% Damage</p>', 10000, 'uridium', '0', '/do_img/global/items/booster_dmg-b01_100x100.png', '1', 0, '', '', '', '2', '0', '18000', '', '', '', '', '', '', '', '', '', '', ''),
(23, 'P.E.T', 'P.E.T.', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">A friend for a battle, extra 8.5K DMG</p>', 60000, 'uridium', '0', '/do_img/global/items/pet/pet10-20.gif', '1', 0, '', '', '', '', '', '', '', 'pet', '', '', '', '', '', '', '', '', ''),
(24, 'modules', 'Module DMGM-1', 'Increase damage', 10, 'event', '0', 'do_img/global/items/module/dmgm-1_100x100.png', '0', 0, '', '11', '11', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(25, 'modules', 'Module XPM-1', 'Damage: Increases experience points', 10, 'event', '0', 'do_img/global/items/module/xpm-1_100x100.png', '0', 0, '', '12', '12', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(26, 'modules', 'Module LTM-HR', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage: 58.500</p>', 75000, 'uridium', '0', 'img/base/ltm-hr_100x100.png', '1', 0, '', '5', '5', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(27, 'modules', 'Module LTM-MR', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage: 38.450</p>', 65000, 'uridium', '0', 'do_img/global/items/module/ltm-mr_100x100.png', '1', 0, '', '6', '6', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(28, 'modules', 'Module LTM-LR', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage: 29.850</p>', 55000, 'uridium', '0', 'do_img/global/items/module/ltm-lr_100x100.png', '1', 0, '', '7', '7', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(29, 'modules', 'Module RAM-MA', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage: 51.250</p>', 70000, 'uridium', '0', 'img/base/ram-ma_100x100.png', '1', 0, '', '8', '8', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(30, 'modules', 'Module RAM-LA', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage: 35.550</p>', 65000, 'uridium', '0', 'do_img/global/items/module/ram-la_100x100.png', '1', 0, '', '9', '9', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(31, 'ships', 'Phoenix', '', 0, 'credits', '0', 'do_img/global/items/ship/Phoenix_100x100.png', '1', 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(32, 'ships', 'Yamato', '', 15000, 'credits', '0', 'do_img/global/items/ship/Yamato_100x100.png', '1', 2, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(33, 'ships', 'Leonov', '', 18750, 'uridium', '0', 'do_img/global/items/ship/Leonov_100x100.png', '1', 3, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(34, 'ships', 'Defcom', '', 25000, 'credits', '0', 'do_img/global/items/ship/Defcom_100x100.png', '1', 4, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(35, 'ships', 'Liberator', '', 12500, 'credits', '0', 'do_img/global/items/ship/Liberator_100x100.png', '1', 5, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(36, 'ships', 'Piranha', '', 30000, 'credits', '0', 'do_img/global/items/ship/Piranha_100x100.png', '1', 6, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(37, 'ships', 'Nostromo', '', 50000, 'credits', '0', 'do_img/global/items/ship/Nostromo_100x100.png', '1', 7, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(38, 'ships', 'Vengeance', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">380</p>', 45000, 'uridium', '0', 'do_img/global/items/ship/Vengeance_100x100.png', '1', 8, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(39, 'ships', 'Bigboy', '', 350000, 'credits', '0', 'do_img/global/items/ship/bigboy_100x100.png', '1', 9, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(40, 'ships', 'Goliath', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">15</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">15</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">360</p>', 85000, 'uridium', '0', 'do_img/global/items/ship/goliath_100x100.png', '1', 10, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(41, 'ships', 'Spearhead', '5 LASER/12 GENERATOR <br>speed 370</br>', 150000, 'uridium', '0', 'do_img/global/items/ship/spearhead-vru_100x100.png', '1', 70, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(42, 'ships', 'Aegis', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">15</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">300</p>', 185000, 'uridium', '0', 'do_img/global/items/ship/aegis-vru_100x100.png', '1', 49, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(43, 'ships', 'Citadel', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">7</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">20</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">240</p>', 300000, 'uridium', '0', 'do_img/global/items/ship/citadel-vru_100x100.png', '1', 69, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(46, 'ships', 'Cyborg', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">16</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">16</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">360</p>', 350000, 'uridium', '0', 'do_img/global/items/ship/cyborg_100x100.png', '1', 245, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(47, 'ships', 'Mimesis', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">14</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">14</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">300</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/mimesis_100x100.png', '1', 900, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(48, 'ships', 'Tartarus', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">14</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">15</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">220</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/tartarus_100x100.png', '1', 1000, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(49, 'desings', 'Cyborg-Firestar', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/cyborg/design/cyborg-firestar_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-firestar', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(50, 'desings', 'Cyborg-Sunstorm', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/cyborg/design/cyborg-sunstorm_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-sunstorm', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(51, 'desings', 'Cyborg-Maelstrom', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/cyborg/design/cyborg-maelstrom_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-maelstrom', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(52, 'desings', 'Cyborg-Celestial', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/cyborg/design/cyborg-celestial_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-celestial', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(53, 'desings', 'Cyborg-Starscream', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/cyborg/design/cyborg-starscream_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-starscream', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(54, 'desings', 'Cyborg-Frozen', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/cyborg/design/cyborg-frozen_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-frozen', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(55, 'desings', 'Cyborg-Prometheus', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/cyborg/design/cyborg-prometheus_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-prometheus', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(56, 'desings', 'Cyborg-Dusklight', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/cyborg/design/cyborg-dusklight_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-dusklight', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(57, 'desings', 'Cyborg-Scourge', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/cyborg/design/cyborg-scourge_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-scourge', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(58, 'desings', 'Cyborg-Ullrin', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/cyborg/design/cyborg-ullrin_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-ullrin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(59, 'desings', 'Cyborg-Blaze', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/cyborg/design/cyborg-blaze_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-blaze', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(60, 'desings', 'Cyborg-Ocean', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/cyborg/design/cyborg-ocean_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-ocean', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(61, 'desings', 'Cyborg-Poison', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/cyborg/design/cyborg-poison_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-poison', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(62, 'ships', 'Hammerclaw', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">12</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">14</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">310</p>', 300000, 'uridium', '0', 'do_img/global/items/ship/hammerclaw_100x100.png', '1', 246, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(63, 'desings', 'Hammerclaw-Ullrin', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p>', 175000, 'uridium', '0', 'do_img/global/items/ship/hammerclaw/design/hammerclaw-ullrin_100x100.png', '1', 0, 'ship_hammerclaw_design_hammerclaw-ullrin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(64, 'desings', 'Hammerclaw-Frozen', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p>', 175000, 'uridium', '0', 'do_img/global/items/ship/hammerclaw/design/hammerclaw-frozen_100x100.png', '1', 0, 'ship_hammerclaw_design_hammerclaw-frozen', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(65, 'desings', 'Hammerclaw-Bane', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p>', 175000, 'uridium', '0', 'do_img/global/items/ship/hammerclaw/design/hammerclaw-bane_100x100.png', '1', 0, 'ship_hammerclaw_design_hammerclaw-bane', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(66, 'desings', 'Hammerclaw-Tyrannos', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p>', 175000, 'uridium', '0', 'do_img/global/items/ship/hammerclaw/design/hammerclaw-tyrannos_100x100.png', '1', 0, 'ship_hammerclaw_design_hammerclaw-tyrannos', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(67, 'desings', 'Solace-Argon', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/solace/design/solace-argon_100x100.png', '1', 0, 'ship_solace_design_solace-argon', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(68, 'desings', 'Solace-Blaze', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/solace/design/solace-blaze_100x100.png', '1', 0, 'ship_solace_design_solace-blaze', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(69, 'desings', 'Solace-Borealis', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/solace/design/solace-borealis_100x100.png', '1', 0, 'ship_solace_design_solace-borealis', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(70, 'desings', 'Solace-Ocean', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/solace/design/solace-ocean_100x100.png', '1', 0, 'ship_solace_design_solace-ocean', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(71, 'desings', 'Solace-Poison', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/solace/design/solace-poison_100x100.png', '1', 0, 'ship_solace_design_solace-poison', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(72, 'desings', 'Spectrum-Blaze', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/spectrum/design/spectrum-blaze_100x100.png', '1', 0, 'ship_spectrum_design_spectrum-blaze', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(73, 'desings', 'Spectrum-Ocean', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/spectrum/design/spectrum-ocean_100x100.png', '1', 0, 'ship_spectrum_design_spectrum-ocean', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(74, 'desings', 'Spectrum-Poison', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/spectrum/design/spectrum-poison_100x100.png', '1', 0, 'ship_spectrum_design_spectrum-poison', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(75, 'desings', 'Spectrum-Sandstorm', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/spectrum/design/spectrum-sandstorm_100x100.png', '1', 0, 'ship_spectrum_design_spectrum-sandstorm', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(76, 'desings', 'Spectrum-Legend', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/spectrum/design/spectrum-legend_100x100.png', '1', 0, 'ship_spectrum_design_spectrum-legend', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(77, 'desings', 'Spectrum-Dusklight', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/spectrum/design/spectrum-dusklight_100x100.png', '1', 0, 'ship_spectrum_design_spectrum-dusklight', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(78, 'desings', 'Spectrum-Argon', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/spectrum/design/spectrum-argon_100x100.png', '1', 0, 'ship_spectrum_design_spectrum-argon', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(79, 'desings', 'Sentinel-Argon\r\n', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">8%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/sentinel/design/sentinel-argon_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-argon', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(80, 'desings', 'Sentinel-Expo2016', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">8%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/sentinel/design/sentinel-expo2016_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-expo2016', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(81, 'desings', 'Sentinel-Lava', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">8%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/sentinel/design/sentinel-lava_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-lava', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(82, 'desings', 'Sentinel-Tyrannos', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">8%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/sentinel/design/sentinel-tyrannos_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-tyrannos', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(83, 'desings', 'Sentinel-Asimov', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">8%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/sentinel/design/sentinel-asimov_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-asimov', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(84, 'desings', 'Sentinel-Legend', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">8%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/sentinel/design/sentinel-legend_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-legend', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(85, 'desings', 'Venom-Blaze', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/venom/design/venom-blaze_100x100.png', '1', 0, 'ship_venom_design_venom-blaze', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(86, 'desings', 'Venom-Borealis', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/venom/design/venom-borealis_100x100.png', '1', 0, 'ship_venom_design_venom-borealis', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(87, 'desings', 'Venom-Ocean', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/venom/design/venom-ocean_100x100.png', '1', 0, 'ship_venom_design_venom-ocean', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(88, 'desings', 'Venom-Poison', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/venom/design/venom-poison_100x100.png', '1', 0, 'ship_venom_design_venom-poison', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(89, 'desings', 'Diminisher-Argon', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/diminisher/design/diminisher-argon_100x100.png', '1', 0, 'ship_diminisher_design_diminisher-argon', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(90, 'desings', 'Diminisher-Expo2016', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/diminisher/design/diminisher-expo2016_100x100.png', '1', 0, 'ship_diminisher_design_diminisher-expo2016', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(91, 'desings', 'Diminisher-Lava', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/diminisher/design/diminisher-lava_100x100.png', '1', 0, 'ship_diminisher_design_diminisher-lava', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(92, 'desings', 'Diminisher-Legend', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/diminisher/design/diminisher-legend_100x100.png', '1', 0, 'ship_diminisher_design_diminisher-legend', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(93, 'desings', 'Diminisher-Frost', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/diminisher/design/diminisher-frost_100x100.png', '1', 0, 'ship_diminisher_design_diminisher-frost', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(94, 'desings', 'Champion-Argon', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/g-champion/design/g-champion-argon_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-argon', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(95, 'desings', 'Champion-Lava', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/g-champion/design/g-champion-lava_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-lava', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(96, 'desings', 'Surgeon', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/g-surgeon/design/g-surgeon_100x100.png', '1', 0, 'ship_g-surgeon', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(97, 'desings', 'Pusat-Expo', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 200000, 'uridium', '0', 'do_img/global/items/ship/pusat/design/pusat-expo_100x100.png', '1', 0, 'ship_pusat_design_pusat-expo16', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(98, 'desings', 'Pusat-Lava', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 200000, 'uridium', '0', 'do_img/global/items/ship/pusat/design/pusat-lava_100x100.png', '1', 0, 'ship_pusat_design_pusat-lava', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(99, 'desings', 'Pusat-Blaze', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 200000, 'uridium', '0', 'do_img/global/items/ship/pusat/design/pusat-blaze_100x100.png', '1', 0, 'ship_pusat_design_pusat-blaze', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(100, 'desings', 'Pusat-Ocean', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 200000, 'uridium', '0', 'do_img/global/items/ship/pusat/design/pusat-ocean_100x100.png', '1', 0, 'ship_pusat_design_pusat-ocean', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(101, 'desings', 'Pusat-Poison', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 200000, 'uridium', '0', 'do_img/global/items/ship/pusat/design/pusat-poison_100x100.png', '1', 0, 'ship_pusat_design_pusat-poison', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `shop_items` (`id`, `category`, `name`, `information`, `price`, `priceType`, `amount`, `image`, `active`, `shipId`, `design_name`, `moduleId`, `moduleType`, `boosterId`, `boosterType`, `boosterDuration`, `laserName`, `petName`, `skillTree`, `droneName`, `ammoId`, `typeKey`, `petDesign`, `petFuel`, `petModule`, `FormationName`, `nameBootyKey`) VALUES
(102, 'desings', 'Pusat-Sandstorm', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 200000, 'uridium', '0', 'do_img/global/items/ship/pusat/design/pusat-sandstorm_100x100.png', '1', 0, 'ship_pusat_design_pusat-sandstorm', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(103, 'special-ec', 'Cyborg-Asimov', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p>', 100, 'event', '0', 'do_img/global/items/ship/cyborg/design/cyborg-asimov_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-asimov', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(104, 'special-ec', 'Cyborg-Infinite', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p>', 100, 'event', '0', 'do_img/global/items/ship/cyborg/design/cyborg-infinite_100x100.png', '1', 0, 'ship_cyborg_design_cyborg-infinite', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(105, 'special-ec', 'Hammerclaw-Prometheus', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">15%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">15%</p>', 100, 'event', '0', 'do_img/global/items/ship/hammerclaw/design/hammerclaw-prometheus_100x100.png', '1', 0, 'ship_hammerclaw_design_hammerclaw-prometheus', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(106, 'special-ec', 'Spectrum-Tyrannos', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">3%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">15%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">7%</p>', 150, 'event', '0', 'do_img/global/items/ship/spectrum/design/spectrum-tyrannos_100x100.png', '1', 0, 'ship_spectrum_design_spectrum-tyrannos', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(107, 'special-ec', 'Sentinel-Arios', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">10%</p>', 100, 'event', '0', 'do_img/global/items/ship/sentinel/design/sentinel-arios_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-arios', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(108, 'special-ec', 'Solace-Tyrannos', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 100, 'event', '0', 'do_img/global/items/ship/solace/design/solace-tyrannos_100x100.png', '1', 0, 'ship_solace_design_solace-tyrannos', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(109, 'special-ec', 'Solace-Frost', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 100, 'event', '0', 'do_img/global/items/ship/solace/design/solace-frost_100x100.png', '0', 0, 'ship_solace_design_solace-frost', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(110, 'special-ec', 'Venom-Argon', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">12%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">7%</p>', 100, 'event', '0', 'do_img/global/items/ship/venom/design/venom-argon_100x100.png', '1', 0, 'ship_venom_design_venom-argon', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(111, 'special-ec', 'Surgeon-Cicada', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">7%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">15%</p>', 150, 'event', '0', 'do_img/global/items/ship/g-surgeon/design/g-surgeon-cicada_100x100.png', '1', 0, 'ship_g-surgeon_design_g-surgeon-cicada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(112, 'special-ec', 'Surgeon-Locust', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">7%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">15%</p>', 150, 'event', '0', 'do_img/global/items/ship/g-surgeon/design/g-surgeon-locust_100x100.png', '1', 0, 'ship_g-surgeon_design_g-surgeon-locust', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(113, 'special-ec', 'Champion-Legend', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 100, 'event', '0', 'do_img/global/items/ship/g-champion/design/g-champion-legend_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-legend', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(114, 'special-ec', 'Pusat-Legend', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">15%</p>', 100, 'event', '0', 'do_img/global/items/ship/pusat/design/pusat-legend_100x100.png', '1', 0, 'ship_pusat_design_pusat-legend', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(115, 'special-ec', 'Solace-Contagion', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 100, 'event', '0', 'do_img/global/items/ship/solace/design/solace-contagion_100x100.png', '1', 0, 'ship_solace_design_solace-contagion', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(116, 'special-ec', 'Sentinel-Contagion', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">10%</p>', 100, 'event', '0', 'do_img/global/items/ship/sentinel/design/sentinel-contagion_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-contagion', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(117, 'special-credits', 'Champion-Albania', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-albania_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-albania', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(118, 'special-credits', 'Champion-Austria', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-austria_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-austria', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(119, 'special-credits', 'Champion-Belgium', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-belgium_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-belgium', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(120, 'special-credits', 'Champion-Croatia', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-croatia_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-croatia', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(121, 'special-credits', 'Champion-Czech-Republic', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-czech-republic_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-czech-republic', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(122, 'special-credits', 'Champion-England', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-england_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-england', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(123, 'special-credits', 'Champion-France', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-france_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-france', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(124, 'special-credits', 'Champion-Germany', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-germany_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-germany', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(125, 'special-credits', 'Champion-Iceland', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-iceland_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-iceland', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(126, 'special-credits', 'Champion-Italy', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-italy_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-italy', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(127, 'special-credits', 'Champion-Northern-Ireland', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-northern-ireland_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-northern-ireland', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(128, 'special-credits', 'Champion-Poland', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-poland_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-poland', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(129, 'special-credits', 'Champion-Portugal', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-portugal_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-portugal', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(130, 'special-credits', 'Champion-Republic-Ireland', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-republic-of-ireland_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-republic-of-ireland', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(131, 'special-credits', 'Champion-Romania', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-romania_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-romania', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(132, 'special-credits', 'Champion-Russia', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-russia_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-russia', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(133, 'special-credits', 'Champion-Slovakia', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-slovakia_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-slovakia', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(134, 'special-credits', 'Champion-Sweden', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-sweden_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-sweden', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(135, 'special-credits', 'Champion-Switzerland', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-switzerland_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-switzerland', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(136, 'special-credits', 'Champion-Ukraine', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-ukraine_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-ukraine', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(137, 'special-credits', 'Champion-Wales', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-wales_100x100.png', '1', 0, 'ship_g-champion_design_g-champion-wales', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(138, 'special-credits', 'Champion-Spain', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-spain_100x100.png', '1', 0, 'ship_g_champion_design_g_champion_spain', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(139, 'ships', 'Pusat', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">16</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">12</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">380</p>', 180000, 'uridium', '0', 'do_img/global/items/ship/pusat_100x100.png', '1', 130, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(140, 'ammo', 'LCB-10', 'Low efficiency for a low price', 10, 'credits', '1', '/do_img/global/items/ammunition/laser/lcb-10.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_laser_lcb-10', '', '', '', '', '', ''),
(141, 'ammo', 'MCB-25', 'The ammo is also known as x2 ammo, because when the laser cannon is used it deals twice its normal damage.\r\n', 1, 'uridium', '1', '/do_img/global/items/ammunition/laser/MCB-25.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_laser_mcb-25', '', '', '', '', '', ''),
(142, 'ammo', 'MCB-50', 'MCB-50 is ammunition for the laser cannons and is currently the fifth most powerful laser battery that is available for direct purchase through the shop.', 2, 'uridium', '1', '/do_img/global/items/ammunition/laser/mcb-50.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_laser_mcb-50', '', '', '', '', '', ''),
(143, 'ammo', 'SAB-50', 'Unlike other laser batteries, SAB-50 does not cause normal damage to the target\'s HP; instead, it drains the target\'s shields and refills the shooter\'s shields. The amount of shield it drains is comparable to MCB-25, however, because of its unique trait of refilling your shields, it costs twice as much.', 3, 'uridium', '1', '/do_img/global/items/ammunition/laser/sab-50.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_laser_sab-50', '', '', '', '', '', ''),
(144, 'ammo', 'UCB-100', 'UCB-100 is a type of ammunition that deals 4 times your normal damage on all attacks to anything you shoot. This is the most common type of ammo to be used in PvP battles with RSB-75. This battery is also known as the x4 ammo, since it deals 4 times your normal damage.', 5, 'uridium', '1', '/do_img/global/items/ammunition/laser/ucb-100.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_laser_ucb-100', '', '', '', '', '', ''),
(145, 'ammo', 'RSB-75', 'RSB-75 (Rapid Salvo Battery) is a type of ammunition that gives 6 times the damage but has a brief cooldown after each use. For this reason it is usually combined with another ammo type.', 15, 'uridium', '1', '/do_img/global/items/ammunition/laser/rsb-75.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_laser_rsb-75', '', '', '', '', '', ''),
(146, 'ammo', 'R-310', 'Short-range rocket: causes up to 1,000 damage points per rocket fired', 100, 'credits', '1', '/do_img/global/items/ammunition/rocket/r-310.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_rocket_r-310', '', '', '', '', '', ''),
(147, 'ammo', 'PLT-2026', 'Mid-range rocket: causes up to 2,000 damage points per rocket fired', 500, 'credits', '1', '/do_img/global/items/ammunition/rocket/plt-2026.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_rocket_plt-2026', '', '', '', '', '', ''),
(148, 'ammo', 'PLT-2021', 'Long-range rocket: causes up to 4,000 points per rocket fired', 5, 'uridium', '1', '/do_img/global/items/ammunition/rocket/plt-2021.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_rocket_plt-2021', '', '', '', '', '', ''),
(149, 'ammo', 'PLT-3030', 'PLT-3030 (Long-Range Rocket) is the last type of rocket with no special ability that you can obtain in DarkOrbit. It has a very low accuracy but it packs a big punch. It is available anytime in Shop, Auction, Buy now and can sometimes be received from Pirate Booty.', 7, 'uridium', '1', '/do_img/global/items/ammunition/rocket/plt-3030.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_rocket_plt-3030', '', '', '', '', '', ''),
(150, 'ammo', 'WIZ-X', 'WIZ-X (Holo Emitter Rocket) is an elite rocket that can transform your target into a random ship or alien. The target cannot be a P.E.T.-10. It deals 0 damage and its\' purpose is only to amuse others. It is found ocassionaly during special events, such as Hallowwen, Winterfest and Easter.', 50, 'uridium', '1', '/do_img/global/items/ammunition/rocket/wiz-x.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_specialammo_wiz-x', '', '', '', '', '', ''),
(151, 'ammo', 'PLD-8', 'PLD-8 (Plasma Charger) is elite rocket ammunition that temporarily reduces the accuracy of your enemy\'s weapons system when successfully hit. It is available anytime in Shop and ocassionaly in Bonus Boxes during special events.', 100, 'uridium', '1', '/do_img/global/items/ammunition/rocket/pld-8.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_specialammo_pld-8', '', '', '', '', '', ''),
(152, 'ammo', 'DCR-250', 'DCR-250 (Deceleration Rocket) is an elite rocket that can slow down your enemies by 30% for 5 seconds. It is available anytime in Shop.', 300, 'uridium', '1', '/do_img/global/items/ammunition/rocket/dcr-250.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_specialammo_dcr-250', '', '', '', '', '', ''),
(153, 'ammo', 'R-IC3', 'R-IC3 (Long-Range Rocket) is an elite rocket that can freeze targets for 2 seconds. The target will still be able to use most of their abilities, but it won\'t be able move. EMP-01 will remove the frozen effect, but not the rocket. ISH-01 will remove the rocket as it comes to you, but not when you\'re already frozen. It is available only during Winterfest.', 500, 'uridium', '1', '/do_img/global/items/ammunition/rocket/r-ic3.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_specialammo_r-ic3', '', '', '', '', '', ''),
(154, 'ammo', 'EMP-01', 'EMP-01 (EMP Burst) is an elite ammunition insta-mine. It is available anytime at Shop, Assembly and can be sometimes received from Pirate Booty.', 1000, 'uridium', '1', '/do_img/global/items/ammunition/specialammo/emp-01.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_specialammo_emp-01', '', '', '', '', '', ''),
(155, 'Extras', 'BOOTY-KEY', 'The most common chests found in space, requiring Green keys.', 5000, 'uridium', '1', '/do_img/global/items/resource/gif/booty-key.gif', '0', 0, '', '', '', '', '', '', '', '', '', '', '', 'greenKeys', '', '', '', '', ''),
(156, 'Extras', 'BOOTY-KEY', 'The most common chests found in space, requiring Green keys.', 5000, 'uridium', '1', '/do_img/global/items/resource/booty-key_100x100.png', '0', 0, '', '', '', '', '', '', '', '', '', '', '', 'greenKeys', '', '', '', '', ''),
(171, 'lasers', 'LF-2', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(101, 255, 37);display: inline-block;\">It used to exceed the LF-3 as the best laser cannon available.</p>', 5000, 'uridium', '1', '/do_img/global/items/equipment/weapon/laser/lf-2.gif', '1', 0, '', '', '', '', '', '', 'lf2Count', '', '', '', '', '', '', '', '', '', ''),
(172, 'ships', 'Hecate', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">15</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">16</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">300</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/hecate_100x100.png', '1', 1185, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(173, 'ships', 'Centurion', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">16</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">16</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">300</p>', 275000, 'uridium', '0', 'do_img/global/items/ship/centurion_100x100.png', '1', 1150, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(174, 'ships', 'Solaris', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">15</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">15</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">300</p>', 325000, 'uridium', '0', 'do_img/global/items/ship/solaris_100x100.png', '1', 1140, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(175, 'ships', 'Disruptor', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">14</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">14</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">300</p>', 325000, 'uridium', '0', 'do_img/global/items/ship/disruptor_100x100.png', '1', 1130, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(176, 'ships', 'Berserker', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">16</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">17</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">300</p>', 330000, 'uridium', '0', 'do_img/global/items/ship/berserker_100x100.png', '1', 1120, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(177, 'ships', 'Zephyr', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">16</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">16</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">300</p>', 320000, 'uridium', '0', 'do_img/global/items/ship/zephyr_100x100.png', '1', 1100, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(178, 'new-desings', 'Hecate-Tyrannos', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 215000, 'uridium', '0', 'do_img/global/items/ship/hecate-tyrannos_100x100.png', '1', 0, 'ship_hecate_design_hecate-tyrannos', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(179, 'new-desings', 'Hecate-Frost', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 215000, 'uridium', '0', 'do_img/global/items/ship/hecate-frost_100x100.png', '1', 0, 'ship_hecate_design_hecate-frost', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(180, 'special-ec', 'Hecate-Dusklight', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">13%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">13%</p>', 100, 'event', '0', 'do_img/global/items/ship/hecate-dusklight_100x100.png', '1', 0, 'ship_hecate_design_hecate-dusklight', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(181, 'new-desings', 'Tartarus-Epion', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p>', 215000, 'uridium', '0', 'do_img/global/items/ship/tartarus/epion_100x100.png', '1', 0, 'ship_tartarus_epion', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(182, 'new-desings', 'Tartarus-Smite', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p>', 215000, 'uridium', '0', 'do_img/global/items/ship/tartarus/smite_100x100.png', '1', 0, 'ship_tartarus_smite', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(183, 'special-ec', 'Tartarus-Osiris', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">12%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">12%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 100, 'event', '0', 'do_img/global/items/ship/tartarus/osiris_100x100.png', '1', 0, 'ship_tartarus_osiris', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(184, 'new-desings', 'Centurion-Damage', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">15%</p>', 225000, 'uridium', '0', 'do_img/global/items/centurion-damage_100x100.png', '1', 0, 'centurion-damage', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(185, 'new-desings', 'Centurion-HP', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">15%</p>', 225000, 'uridium', '0', 'do_img/global/items/centurion-hp_100x100.png', '1', 0, 'centurion-hp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(186, 'new-desings', 'Centurion-Shield', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">15%</p>', 225000, 'uridium', '0', 'do_img/global/items/centurion-shield_100x100.png', '1', 0, 'centurion-shield', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(187, 'new-desings', 'Centurion-Speed', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Speed</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">320</p>', 225000, 'uridium', '0', 'do_img/global/items/centurion-speed_100x100.png', '1', 0, 'centurion-speed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(188, 'special-ec', 'Centurion-Tyrannos', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 150, 'event', '0', 'do_img/global/items/centurion-tyrannos_100x100.png', '1', 0, 'centurion-tyrannos', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(189, 'new-desings', 'Solaris-Psyche', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 215000, 'uridium', '0', 'do_img/global/items/ship/solaris-psyche_100x100.png', '1', 0, 'ship_solaris-psyche', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(190, 'new-desings', 'Solaris-Amor', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 215000, 'uridium', '0', 'do_img/global/items/ship/solaris-amor_100x100.png', '1', 0, 'ship_solaris-amor', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(191, 'P.E.T', 'Pet Sentinel Legend', 'Wear the colors of a true hero when you equip the Legend Sentinel P.E.T. Design. Proving your excellence in combat and providing a golden edge to proceedings.\r\n', 180000, 'uridium', '0', 'do_img/global/items/pet/pet-sentinel-legend2.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '203', '', '', '', ''),
(192, 'P.E.T', 'Pet Diminisher Lava', 'When you want to diminishing the threat, what better way than skinning your P.E.T. with the Lava Diminisher P.E.T. Design. A hot way to say you mean business.\r\n\r\n', 180000, 'uridium', '0', 'do_img/global/items/pet/pet-diminisher-lava2.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '205', '', '', '', ''),
(193, 'P.E.T', 'Pet G Champion Legend', 'The Legend G-Champion P.E.T. Design does everything it says on the tin. It makes your P.E.T. look like a legend. What more can we say.', 180000, 'uridium', '0', 'do_img/global/items/pet/pet-g-champion-legend2.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '200', '', '', '', ''),
(194, 'P.E.T', 'Pet Design red', 'The outer shell of your P.E.T. will look like it\\\'s bathed in spooky red St. Elmo\\\'s Fire, astonishing allies and aliens alike!\r\n\r\n', 180000, 'uridium', '0', 'do_img/global/items/pet/red.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '161', '', '', '', ''),
(195, 'P.E.T', 'Pet Design Green', 'This design will imbue your P.E.T. with a high-tech look full of positive energy and joie de vivre!\r\n\r\n\r\n', 180000, 'uridium', '0', 'do_img/global/items/pet/green.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '162', '', '', '', ''),
(196, 'P.E.T', 'Pet Sentinel Argon', 'Make your P.E.T. stand out from the crowd with the Argon Sentinel P.E.T. Design. The colors scheme representing the many aliens Earth has defeated over the centuries.\r\n\r\n\r\n\r\n', 180000, 'uridium', '0', 'do_img/global/items/pet/pet-sentinel-argon2.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '201', '', '', '', ''),
(197, 'P.E.T', 'Pet Diminisher Legend', 'This legend will never be diminished as the Legend Diminisher P.E.T. Design is second-to-none. Bringing a cool slice of civilisation to the vacuum of space, as you carve your way through the galaxy.\r\n\r\n', 180000, 'uridium', '0', 'do_img/global/items/pet/pet-diminisher-legend2.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '206', '', '', '', ''),
(198, 'P.E.T', 'Pet G Champion Argon', 'Be the hippest cat in the galaxy with the Argon G-Champion P.E.T. Design. Make them know you\\\'re ready for action when you battle with this design by your side.\r\n\r\n', 180000, 'uridium', '0', 'do_img/global/items/pet/pet-g-champion-legend2.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '197', '', '', '', ''),
(199, 'P.E.T', 'Pet Pusat Poision', 'The Poison Pusat P.E.T. Design gives your P.E.T. a toxic style. More than enough to ensure your enemies know how dangerous you are.\r\n\r\n\r\n', 180000, 'uridium', '0', 'do_img/global/items/pet/pet-pusat-poison2.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '187', '', '', '', ''),
(200, 'special-credits', 'Champion-Turkish', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 80000000, 'credits', '0', 'do_img/global/items/ship/g-champion/design/g-champion-turkey_100x100.png', '1', 0, 'ship_goliath_design_turkish', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(201, 'new-desings', 'Vengeance-Adept', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 150000, 'uridium', '0', 'do_img/global/items/ship/vengeance/design/adept_100x100.png', '0', 0, 'ship_vengeance_design_adept', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `shop_items` (`id`, `category`, `name`, `information`, `price`, `priceType`, `amount`, `image`, `active`, `shipId`, `design_name`, `moduleId`, `moduleType`, `boosterId`, `boosterType`, `boosterDuration`, `laserName`, `petName`, `skillTree`, `droneName`, `ammoId`, `typeKey`, `petDesign`, `petFuel`, `petModule`, `FormationName`, `nameBootyKey`) VALUES
(202, 'new-desings', 'Vengeance-Corsair', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Exp</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">10%</p>', 150000, 'uridium', '0', 'do_img/global/items/ship/vengeance/design/corsair_100x100.png', '0', 0, 'ship_vengeance_design_corsair', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(203, 'new-desings', 'Vengeance-Revenge', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">5%</p>', 150000, 'uridium', '0', 'do_img/global/items/ship/vengeance/design/revenge_100x100.png', '0', 0, 'ship_vengeance_design_revenge', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(204, 'new-desings', 'Vengeance-Avenger', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">12%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(156, 93, 255);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #9c5dff;display: inline-block;\">8%</p>', 150000, 'uridium', '0', 'do_img/global/items/ship/vengeance/design/avenger_100x100.png', '0', 0, 'ship_vengeance_design_avenger', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(205, 'new-desings', 'Diminisher-Epion', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/diminisher/design/diminisher-epion_100x100.png', '1', 0, 'ship_diminisher_design_diminisher-epion', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(206, 'new-desings', 'Diminisher-Phantasm', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/diminisher/design/diminisher-phantasm_100x100.png', '1', 0, 'ship_diminisher_design_diminisher-phantasm', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(207, 'new-desings', 'Diminisher-Ullrin', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">5%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/diminisher/design/diminisher-ullrin_100x100.png', '1', 0, 'ship_diminisher_design_diminisher-ullrin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(208, 'ships', 'Retiarus', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">17</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">17</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">305</p>', 400000, 'uridium', '0', 'do_img/global/items/ship/retiarus_100x100.png', '1', 1300, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(209, 'new-desings', 'Retiarus-Neikos', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">15%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">13%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">5%</p>', 300000, 'uridium', '0', 'do_img/global/items/ship/retiarus/design/retiarus-neikos_100x100.png', '1', 0, 'ship_retiarus-neikos', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(210, 'new-desings', 'Goliath-Enforcer', '<div class=\"dm-description\">ENFORCER (20% DMG + 15% SHD + 18% HON + 18% EXP</div>\r\n', 250000, 'uridium', '0', 'do_img/global/items/ship/goliath/design/enforcer_100x100.png', '1', 0, 'ship_goliath_design_enforcer', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(211, 'new-desings', 'Goliath-bastion', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">15%</p>\r\n<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Honor</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p>\r\n', 215000, 'uridium', '0', 'do_img/global/items/ship/goliath/design/bastion_100x100.png', '1', 0, 'ship_goliath_design_bastion', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(212, 'new-desings', 'Sentinel-Epion', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">8%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/sentinel/design/sentinel-epion_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-epion', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(213, 'new-desings', 'Sentinel-Harbinger', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">8%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/sentinel/design/sentinel-harbinger_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-harbinger', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(214, 'new-desings', 'Sentinel-Osiris', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">8%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/sentinel/design/sentinel-osiris_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-osiris', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(215, 'new-desings', 'Sentinel-smite', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">8%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/sentinel/design/sentinel-smite_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-smite', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(216, 'new-desings', 'Sentinel-ullrin', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">8%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">8%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/sentinel/design/sentinel-ullrin_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-ullrin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(217, 'new-desings', 'Solace-Epion', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 150000, 'uridium', '0', 'do_img/global/items/ship/solace/design/solace-epion_100x100.png', '1', 0, 'ship_solace_design_solace-epion', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(218, 'new-desings', 'Solace-Nobilis', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 150000, 'uridium', '0', 'do_img/global/items/ship/solace/design/solace-nobilis_100x100.png', '1', 0, 'ship_solace_design_solace-nobilis', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(219, 'new-desings', 'Solace-Osiris', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 150000, 'uridium', '0', 'do_img/global/items/ship/solace/design/solace-osiris_100x100.png', '1', 0, 'ship_solace_design_solace-osiris', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(220, 'new-desings', 'Solace-Smite', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 150000, 'uridium', '0', 'do_img/global/items/ship/solace/design/solace-smite_100x100.png', '1', 0, 'ship_solace_design_solace-smite', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(221, 'new-desings', 'Solace-Ullrin', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">5%</p>', 150000, 'uridium', '0', 'do_img/global/items/ship/solace/design/solace-ullrin_100x100.png', '1', 0, 'ship_solace_design_solace-ullrin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(222, 'new-desings', 'Spectrum-Ace', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">3%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">15%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">7%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/spectrum/design/spectrum-ace_100x100.png', '1', 0, 'ship_spectrum_design_spectrum-ace', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(223, 'new-desings', 'Spectrum-Epion', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">3%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">15%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">7%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/spectrum/design/spectrum-epion_100x100.png', '1', 0, 'ship_spectrum_design_spectrum-epion', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(224, 'new-desings', 'Spectrum-Osiris', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">3%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">15%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">7%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/spectrum/design/spectrum-osiris_100x100.png', '1', 0, 'ship_spectrum_design_spectrum-osiris', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(225, 'new-desings', 'Spectrum-Smite', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">3%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">15%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">7%</p>', 225000, 'uridium', '0', 'do_img/global/items/ship/spectrum/design/spectrum-smite_100x100.png', '1', 0, 'ship_spectrum_design_spectrum-smite', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(226, 'special-ec', 'Berserker-Arios', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">13%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">13%</p>', 100, 'event', '0', 'do_img/global/items/ship/berserker-arios_100x100.png', '1', 0, 'ship_berserker-arios', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(227, 'new-desings', 'Berserker-Blaze', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/berserker-blaze_100x100.png', '1', 0, 'ship_berserker-blaze', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(228, 'new-desings', 'Berserker-Neikos', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/berserker-neikos_100x100.png', '1', 0, 'ship_berserker-neikos', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(229, 'new-desings', 'Berserker-Phantasm', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/berserker-phantasm_100x100.png', '1', 0, 'ship_berserker-phantasm', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(230, 'new-desings', 'Hecate-Carbonite', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">5%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 350000, 'uridium', '0', 'do_img/global/items/ship/hecate/design/hecate-carbonite_100x100.png', '1', 0, 'ship_hecate_design_hecate-carbonite', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(231, 'new-desings', 'Pusat-Carbonite', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Damage</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">8%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 350000, 'uridium', '0', 'do_img/global/items/ship/pusat/design/pusat-carbonite_100x100.png', '1', 0, 'ship_pusat_design_pusat-carbonite', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(232, 'new-desings', 'Sentinel-Carbonite', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p> <p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 114, 31);display: inline-block;\">EXP</p> \r\n          <p style=\"color: #f3721f;display: inline-block;\">10%</p>', 350000, 'uridium', '0', 'do_img/global/items/ship/sentinel/design/sentinel-carbonite_100x100.png', '1', 0, 'ship_sentinel_design_sentinel-carbonite', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(233, 'new-desings', 'Solace-Carbonite', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 350000, 'uridium', '0', 'do_img/global/items/ship/solace/design/solace-carbonite_100x100.png', '1', 0, 'ship_solace_design_solace-carbonite', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(234, 'new-desings', 'Berserker-Carbonite', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 350000, 'uridium', '0', 'do_img/global/items/ship/berserker/design/berserker-carbonite_100x100.png', '1', 0, 'ship_berserker-carbonite', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(235, 'new-desings', 'Spectrum-Carbonite', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">10%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n          <p style=\"color: #2be676;display: inline-block;\">10%</p>', 350000, 'uridium', '0', 'do_img/global/items/ship/spectrum/design/spectrum-carbonite_100x100.png', '1', 0, 'ship_spectrum_design_spectrum-carbonite', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(236, 'ships', 'Orcus', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 65, 65);display: inline-block;\">Lasers:</p> \r\n          <p style=\"color: #f34242;display: inline-block;\">17</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Generators:</p> \r\n          <p style=\"color: #009cf7;display: inline-block;\">17</p> <p style=\"color: rgb(4, 177, 25);display: inline-block;\">Speed:</p> \r\n          <p style=\"color: #04a734;display: inline-block;\">300</p>', 400000, 'uridium', '0', 'do_img/global/items/ship/orcus_100x100.png', '1', 1400, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(237, 'booster', 'HON B01\r\n', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">Duration 6 Hours, +7% Honor</p>', 10000, 'uridium', '0', '/do_img/global/items/booster_hon-b01_100x100.png', '1', 0, '', '', '', '1', '5', '18000', '', '', '', '', '', '', '', '', '', '', ''),
(238, 'booster', 'REP B01\r\n', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">Duration 6 Hours, 7% Repair</p>', 10000, 'uridium', '0', '/do_img/global/items/booster_rep-b01_100x100.png', '1', 0, '', '', '', '4', '10', '18000', '', '', '', '', '', '', '', '', '', '', ''),
(246, 'lasers', 'LF-3', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(101, 255, 37);display: inline-block;\">It used to exceed the LF-3 as the best laser cannon available.</p>', 10000, 'uridium', '1', '/do_img/global/items/equipment/weapon/laser/lf-3.gif', '1', 0, '', '', '', '', '', '', 'lf3Count', '', '', '', '', '', '', '', '', '', ''),
(247, 'lasers', 'LF-4', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(101, 255, 37);display: inline-block;\">It used to exceed the LF-3 as the best laser cannon available.</p>', 20000, 'uridium', '1', '/do_img/global/items/equipment/weapon/laser/LF-4.webp', '1', 0, '', '', '', '', '', '', 'lf4Count', '', '', '', '', '', '', '', '', '', ''),
(248, 'lasers', 'Prometheus', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(101, 255, 37);display: inline-block;\">An essential tool for every pilot\'s arsenal, ensure victory when going head-to-head with the Black Light!</p>', 40000, 'uridium', '1', 'do_img/global/items/equipment/weapon/laser/Prometheus.gif', '0', 0, '', '', '', '', '', '', 'lf4Count', '', '', '', '', '', '', '', '', '', ''),
(249, 'lasers', 'Prometeus', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(101, 255, 37);display: inline-block;\">It used to exceed the LF-3 as the best laser cannon available.</p>', 40000, 'uridium', '1', '/do_img/global/items/equipment/weapon/laser/prometius.gif', '1', 0, '', '', '', '', '', '', 'lf5Count', '', '', '', '', '', '', '', '', '', ''),
(250, 'generator', 'SG3N-A01', 'SG3N-A01 is a shield generator. It is by far the weakest shield generator in the game, but also the cheapest.', 8000, 'credits', '1', '/do_img/global/items/equipment/generator/shield/gif/sg3n-a01.gif', '1', 0, '', '', '', '', '', '', 'A01Count', '', '', '', '', '', '', '', '', '', ''),
(251, 'generator', 'SG3N-A02', 'SG3N-A02 is a shield generator. It is a small improvement over the SG3N-A01 generator.', 16000, 'credits', '1', '/do_img/global/items/equipment/generator/shield/gif/sg3n-a02.gif', '1', 0, '', '', '', '', '', '', 'A02Count', '', '', '', '', '', '', '', '', '', ''),
(252, 'generator', 'SG3N-A03', 'SG3N-A03 is a shield generator. It has a far bigger price than its weaker counterpart, SG3N-A02, for a decent amount of shield strength and absorption. SG3N-A03 cannot be upgraded.', 32000, 'credits', '1', '/do_img/global/items/equipment/generator/shield/gif/sg3n-a03.gif', '1', 0, '', '', '', '', '', '', 'A03Count', '', '', '', '', '', '', '', '', '', ''),
(253, 'generator', 'SG3N-B01', 'SG3N-B01 is a shield generator. It only has 500 more shield strength than its weaker counterpart, SG3N-B00.\r\n\r\n', 5000, 'uridium', '1', '/do_img/global/items/equipment/generator/shield/gif/sg3n-b01.gif', '1', 0, '', '', '', '', '', '', 'B01Count', '', '', '', '', '', '', '', '', '', ''),
(254, 'generator', 'SG3N-B02', 'SG3N-B02 is a shield generator. For a long time it was the best shield generator in the game, and that\'s why it is standard elite equipment.\r\n\r\n', 10000, 'uridium', '1', '/do_img/global/items/equipment/generator/shield/sg3n-b02.gif', '1', 0, '', '', '', '', '', '', 'bo2Count', '', '', '', '', '', '', '', '', '', ''),
(255, 'generator', 'SG3N-B03', 'SG3N-B03 is a shield generator. It is by far the strongest shield generator in the game, offering the most shield strength and absorption out of any other generator available.\r\n\r\n\r\n', 20000, 'uridium', '1', '/do_img/global/items/equipment/generator/shield/gif/SG3N-B03.gif', '1', 0, '', '', '', '', '', '', 'bo3Count', '', '', '', '', '', '', '', '', '', ''),
(256, 'generator', 'G3N-1010', 'Generador basico.Aumenta la velocidad en 2.', 2000, 'credits', '1', '/do_img/global/items/equipment/generator/speed/g3n-1010/g3n-1010.gif', '1', 0, '', '', '', '', '', '', 'g3n1010Count', '', '', '', '', '', '', '', '', '', ''),
(257, 'generator', 'G3N-2010', 'Generador de velocidad basico.Aumenta la velocidad en 3.', 4000, 'credits', '1', '/do_img/global/items/equipment/generator/speed/g3n-2010/g3n-2010.gif', '1', 0, '', '', '', '', '', '', 'g3n2010Count', '', '', '', '', '', '', '', '', '', ''),
(258, 'generator', 'G3N-3210', 'Generador de velocidad medio.Aumenta la velocidad en 4.\r\n\r\n', 8000, 'credits', '1', '/do_img/global/items/equipment/generator/speed/g3n-3210/g3n-3210.gif', '1', 0, '', '', '', '', '', '', 'g3n3210Count', '', '', '', '', '', '', '', '', '', ''),
(259, 'generator', 'G3N-3310', 'Generador de velocidad medio.Aumenta la velocidad en 5.\r\n\r\n', 16000, 'credits', '1', '/do_img/global/items/equipment/generator/speed/g3n-3310/g3n-3310.gif', '1', 0, '', '', '', '', '', '', 'g3n3310Count', '', '', '', '', '', '', '', '', '', ''),
(260, 'generator', 'G3N-6900', 'Generador de velocidad avanzado. Aumenta la velocidad en 7.\r\n\r\n', 1000, 'uridium', '1', '/do_img/global/items/equipment/generator/speed/g3n-6900/g3n-6900.gif', '1', 0, '', '', '', '', '', '', 'g3n6900Count', '', '', '', '', '', '', '', '', '', ''),
(261, 'generator', 'G3N-7900', 'Generador de velocidad elite.Aumenta la velocidad en 10.\r\n\r\n', 2000, 'uridium', '1', '/do_img/global/items/equipment/generator/speed/g3n-7900/g3n-7900.gif', '1', 0, '', '', '', '', '', '', 'g3nCount', '', '', '', '', '', '', '', '', '', ''),
(262, 'drones-formation', 'F-01-TU', 'Augment your drone control unit with the Turtle Formation.\r\n\r\nIncreases shield power by 10%, but laser and rocket damage decrease by 7.5%.\r\n\r\n', 500000, 'credits', '0', '/do_img/global/items/drone/gif/f-01-tu.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-01-tu', ''),
(263, 'drones-formation', 'F-02-AR', 'Augment your drone control unit with the Arrow Formation.\r\n\r\nIncreases rocket damage by 20%, but reduces laser damage by 3%.\r\n\r\n', 500000, 'credits', '0', '/do_img/global/items/drone/gif/f-02-ar.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-02-ar', ''),
(264, 'drones-formation', 'F-03-LA', 'Augment your drone control unit with the Lance Formation. Increases mine damage by 50%.', 80000, 'uridium', '0', '/do_img/global/items/drone/gif/f-03-la.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-03-la', ''),
(265, 'drones-formation', 'F-04-ST', 'Augment your drone control unit with the Star Formation.\r\n\r\nIncreases rocket damage by 25%, evasion by 10%, but rocket launcher reload time increases by 33%, as well.\r\n\r\n', 75000, 'uridium', '0', '/do_img/global/items/drone/gif/f-04-st.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-04-st', ''),
(266, 'drones-formation', 'F-05-PI', 'Augment your drone control unit with the Pincer Formation.\r\n\r\nIncreases laser damage by 3% against other players and provides an additional 5% honor point bonus. However, it reduces shield penetration by 10%.\r\n\r\n', 90000, 'uridium', '0', '/do_img/global/items/drone/gif/f-05-pi.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-05-pi', ''),
(267, 'drones-formation', 'F-06-DA', 'Augment your drone control unit with the Double Arrow Formation.\r\n\r\nIncreases rocket damage by 30%, shield penetration by 10%, but reduces shield power by 20%.\r\n\r\n', 75000, 'uridium', '0', '/do_img/global/items/drone/gif/f-06-da.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-06-da', ''),
(268, 'drones-formation', 'F-07-DI', 'Augment your drone control unit with the Diamond Formation.\r\n\r\nYour shield regenerates 1% of your max shield power per second, up to a maximum of 5,000 per second. But hit points are reduced by 30%.', 80000, 'uridium', '0', '/do_img/global/items/drone/gif/f-07-di.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-07-di', ''),
(269, 'drones-formation', 'F-08-CH', 'Augment your drone control unit with the Chevron Formation.\r\n\r\nIncreases rocket damage by 65%, but reduces ship hit points by 20%.\r\n\r\n', 75000, 'uridium', '0', '/do_img/global/items/drone/gif/f-08-ch.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-08-ch', ''),
(270, 'drones-formation', 'F-09-MO', 'Augment your drone control unit with the Moth Formation.\r\n\r\nIncreases shield penetration by 20%. Hit points are also increased by 20%. But it weakens your shield strength at a rate of 5% per second.\r\n\r\n', 80000, 'uridium', '0', '/do_img/global/items/drone/gif/f-09-mo.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-09-mo', ''),
(271, 'drones-formation', 'F-10-CR', 'Augment your drone control unit with the Crab Formation.\r\n\r\nIncreases shield absorption by 20%, but reduces speed by 15%.\r\n\r\n', 90000, 'uridium', '0', '/do_img/global/items/drone/gif/f-10-cr.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-10-cr', ''),
(272, 'drones-formation', 'F-11-HE', 'Augment your drone control unit with the Heart Formation.\r\n\r\nIncreases your shield power by 20% and your hit points by 20%. Laser damage is, however, reduced by 5%.\r\n\r\n', 90000, 'uridium', '0', '/do_img/global/items/drone/gif/f-11-he.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-11-he', ''),
(273, 'drones-formation', 'F-12-BA', 'Augment your drone control unit with the Barrage Formation.\r\n\r\nIncreases laser damage to NPCs by 5% and provides an additional 5% XP from NPC kills. Shield Leech will, however, be reduced by 15%.\r\n\r\n', 90000, 'uridium', '0', '/do_img/global/items/drone/gif/f-12-ba.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-12-ba', ''),
(274, 'drones-formation', 'F-13-BT', 'Augment your drone control unit with the Bat Formation.\r\n\r\nIncrease damage to NPCs by 8% and earn 8% more XP from NPC kills; however, your speed will be reduced by 15%.', 120000, 'uridium', '0', '/do_img/global/items/drone/gif/f-13-bt.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-13-bt', ''),
(275, 'drones-formation', 'F-3D-DM', 'Augment your drone control unit with the Dome Formation.\r\n\r\nShield points are increased by 30% and regenerate by 0.5% per second. Cooldown times for rockets and rocket launchers are reduced by 25%; however, laser damage and speed are both reduced by 50%.\r\n\r\n', 110000, 'uridium', '0', '/do_img/global/items/drone/gif/f-3d-dm.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-3d-dm', ''),
(276, 'drones-formation', 'F-3D-DR', 'Augment your drone control unit with the Drill Formation.\r\n\r\nLaser damage is increased by 20%; however, shield points are reduced by 25%, shield spread by 5%, and speed by 5%.\r\n\r\n', 110000, 'uridium', '0', '/do_img/global/items/drone/gif/f-3d-dr.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-3d-dr', ''),
(277, 'drones-formation', 'F-3D-RG', 'Augment your drone control unit with the Ring Formation.\r\n\r\nShield points are increased by 85%; however, speed is reduced by 5%, laser damage is reduced by 25%, and cooldown times for rockets and rocket launchers are increased by 25%.\r\n\r\n', 110000, 'uridium', '0', '/do_img/global/items/drone/gif/f-3d-rg.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-3d-rg', ''),
(278, 'drones-formation', 'F-3D-VT', 'Augment your drone control unit with the Veteran Formation.\r\n\r\nHonor is increased by 20%; however, laser damage, hit points, and shield points are all decreased by 20%.\r\n\r\n', 110000, 'uridium', '0', '/do_img/global/items/drone/gif/f-3d-vt.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-3d-vt', ''),
(279, 'drones-formation', 'F-3D-WL', 'The Wheel Formation is mostly used for catching ships or fleeing from enemy ships but is definitely not the cheapest solution to do so.', 110000, 'uridium', '0', '/do_img/global/items/drone/gif/f-3d-wl.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-3d-wl', ''),
(280, 'drones-formation', 'F-3D-WV', 'Jazz up your drones with the Wave Formation!\r\n\r\nDrones will make waves, but otherwise this formation grants neither benefits nor penalties.\r\n\r\n', 75000, 'uridium', '0', '/do_img/global/items/drone/gif/f-3d-wv.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-3d-wv', ''),
(281, 'drones-formation', 'F-3D-X', 'Augment your drone control unit with the X Formation.\r\n\r\n-100% honor rewarded\r\n\r\nYour lasers cause no damage to enemy players\r\n\r\n+5% Laser Damage against aliens\r\n\r\n+5% XP from aliens\r\n\r\n+8% HP', 160000, 'uridium', '0', '/do_img/global/items/drone/gif/f-3d-x.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'drone_formation_f-3d-x', ''),
(282, 'Extras', 'Green Key', 'Required to open valuable blue pirate chests and collect priceless treasures', 2000, 'uridium', '1', '/do_img/global/items/deal/Bootykey.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'greenKeys'),
(283, 'Extras', 'Red Key', 'Required to open valuable blue pirate chests and collect priceless treasures', 5000, 'uridium', '1', '/do_img/global/items/deal/RedBootykey.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'redKeys'),
(284, 'Extras', 'Blue Key', 'Required to open valuable blue pirate chests and collect priceless treasures', 8000, 'uridium', '1', '/do_img/global/items/deal/bluekey.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'blueKeys'),
(286, 'new-desings', 'Goliath-Kick', 'Hitpoints: 10%\r\n\r\nShield: 15%\r\n\r\nDamage: 10%\r\n\r\n', 300000, 'uridium', '0', 'do_img/global/items/ship/goliath/design/kick_100x100.png', '1', 0, 'ship_goliath_design_kick', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(287, 'new-desings', 'Goliath-Referee', 'Hitpoints: 10%\r\n\r\nShield: 10%\r\n\r\nDamage: 15%\r\n', 300000, 'uridium', '0', 'do_img/global/items/ship/goliath/design/referee_100x100.png', '1', 0, 'ship_goliath_design_referee', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(288, 'new-desings', 'Goliath-Goal', 'Hitpoints: 15%\r\n\r\nShield: 20%\r\n\r\nDamage: 10%\r\n\r\n', 300000, 'uridium', '0', 'do_img/global/items/ship/goliath/design/goal_100x100.png', '1', 0, 'ship_goliath_design_goal', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(289, 'new-desings', 'Goliath-Independence', 'Hitpoints: 15%\r\n\r\nShield: 25%\r\n\r\nDamage: 15%\r\n\r\n', 300000, 'uridium', '0', 'do_img/global/items/ship/goliath/design/independence_100x100.png', '1', 0, 'ship_goliath_design_independence', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(290, 'new-desings', 'Goliath-Ignite', 'Hitpoints: 15%\r\n\r\n\r\nShield: 25%\r\n\r\n\r\nDamage: 15%\r\n\r\n', 300000, 'uridium', '0', 'do_img/global/items/ship/goliath/design/ignite_100x100.png', '1', 0, 'ship_goliath_design_ignite', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(291, 'new-desings', 'Goliath-Centaur', 'Hitpoints: 15%\r\n\r\nShield: 25%\r\n\r\nDamage: 15%\r\n\r\n', 300000, 'uridium', '0', 'do_img/global/items/ship/goliath/design/centaur_100x100.png', '1', 0, 'ship_goliath_design_centaur', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(292, 'new-desings', 'Goliath-Saturn', 'Hitpoints: 15%\r\n\r\nShield: 25%\r\n\r\nDamage: 15%\r\n\r\n', 300000, 'uridium', '0', 'do_img/global/items/ship/goliath/design/saturn_100x100.png', '1', 0, 'ship_goliath_design_saturn', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2043, 'new-desings', 'Orcus-Harbinger', '<p style=\"color: rgb(0, 241, 118);display: inline-block;\">SHIELD</p> \r\n<p style=\"color: #2be676;display: inline-block;\">15%</p>\r\n<p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n<p style=\"color: #2be676;display: inline-block;\">10%</p>\r\n<p style=\"color: rgb(0, 241, 118);display: inline-block;\">DMG</p> \r\n<p style=\"color: #2be676;display: inline-block;\">15%</p>\r\n<p style=\"color: rgb(0, 241, 118);display: inline-block;\">HNR</p> \r\n<p style=\"color: #2be676;display: inline-block;\">15%</p>\r\n<p style=\"color: rgb(0, 241, 118);display: inline-block;\">EXP</p> \r\n<p style=\"color: #2be676;display: inline-block;\">15%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/orcus/design/orcus-harbinger_100x100.png', '1', 0, 'ship_orcus-harbinger', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2044, 'new-desings', 'Orcus-Frost\r\n', '<p style=\"color: rgb(0, 241, 118);display: inline-block;\">SHIELD</p> \r\n<p style=\"color: #2be676;display: inline-block;\">15%</p>\r\n<p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n<p style=\"color: #2be676;display: inline-block;\">10%</p>\r\n<p style=\"color: rgb(0, 241, 118);display: inline-block;\">DMG</p> \r\n<p style=\"color: #2be676;display: inline-block;\">15%</p>\r\n<p style=\"color: rgb(0, 241, 118);display: inline-block;\">HNR</p> \r\n<p style=\"color: #2be676;display: inline-block;\">15%</p>\r\n<p style=\"color: rgb(0, 241, 118);display: inline-block;\">EXP</p> \r\n<p style=\"color: #2be676;display: inline-block;\">15%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/orcus/design/orcus-frost_100x100.png', '1', 0, 'ship_orcus-frost', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2045, 'new-desings', 'Orcus-Nobilis', '<p style=\"color: rgb(0, 241, 118);display: inline-block;\">SHIELD</p> \r\n<p style=\"color: #2be676;display: inline-block;\">15%</p>\r\n<p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> \r\n<p style=\"color: #2be676;display: inline-block;\">10%</p>\r\n<p style=\"color: rgb(0, 241, 118);display: inline-block;\">DMG</p> \r\n<p style=\"color: #2be676;display: inline-block;\">15%</p>\r\n<p style=\"color: rgb(0, 241, 118);display: inline-block;\">HNR</p> \r\n<p style=\"color: #2be676;display: inline-block;\">15%</p>\r\n<p style=\"color: rgb(0, 241, 118);display: inline-block;\">EXP</p> \r\n<p style=\"color: #2be676;display: inline-block;\">15%</p>', 250000, 'uridium', '0', 'do_img/global/items/ship/orcus/design/orcus-nobilis_100x100.png', '1', 0, 'ship_orcus-nobilis', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2047, 'Resources', 'Prometium', 'One of the elementary space resources. Combine with Endurium to create Prometid.', 200, 'uridium', '1', '/do_img/global/items/resource/ore/prometium_100x100.png', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2048, 'Resources', 'Endurium', 'One of the elementary space resources. Combine with either Prometium to create Prometid or Terbium to create Duranium.', 200, 'uridium', '1', '/do_img/global/items/resource/ore/endurium_100x100.png', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2049, 'Resources', 'Terbium', 'One of the elementary space resources. Combine with Endurium to create Duranium.', 200, 'uridium', '1', '/do_img/global/items/resource/ore/terbium_100x100.png', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2050, 'Resources', 'Xenomit', 'Required to create Promerium on your ship and in the Skylab.', 1000, 'uridium', '1', '/do_img/global/items/resource/ore/xenomit_100x100.png', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2051, 'Resources', 'Prometid', 'Created from 20 Prometium and 10 Endurium.', 500, 'uridium', '1', '/do_img/global/items/resource/ore/prometid_100x100.png', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2052, 'Resources', 'Duranium', 'Created from 10 Endurium and 20 Terbium.', 500, 'uridium', '1', '/do_img/global/items/resource/ore/duranium_100x100.png', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2053, 'Resources', 'Promerium', 'Created from 10 Prometid and 10 Duranium, Requires: Xenomit', 15000, 'uridium', '1', '/do_img/global/items/resource/ore/promerium_30x30.png', '1', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2054, 'Resources', 'Seprom', 'Created with Promerium and a Xeno Module in Skylab and with Schism and Scrap in the Assembly.', 40000, 'uridium', '1', '/do_img/global/items/resource/ore/seprom_30x30.png', '1', 0, '', '', '', '', '', '', '', '', '', '', 'items_resource_ore_seprom_fullname\r\n', '', '', '', '', '', ''),
(2823, 'ammo', 'ISH-01', 'A ISH-01 (Insta-Shield) is an extra CPU that gives your ship a 4 second invincibility shield from any incoming damage when activated.', 500, 'uridium', '1', '/do_img/global/items/equipment/extra/cpu/ish-01.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'equipment_extra_cpu_ish-01', '', '', '', '', '', ''),
(2824, 'ammo', 'SMB-01', 'SMB-01 (also known as a Smart Bomb or SMTB) is an elite explosive ammunition which cannot be picked up or found, but only be created using the SMB-01 CPU (Smart Bomb CPU).', 500, 'uridium', '1', '/do_img/global/items/equipment/extra/cpu/smb-01.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'ammunition_mine_smb-01', '', '', '', '', '', ''),
(2825, 'ammo', 'CLO4K-XL', 'CLO4K CPU XL is an elite extra which contains 50 cloaks that make the player invisible until you launch an attack yourself, get EMP\'d, or go into Pirate de-cloak mist. Compared to CLO4K CPU and CLO4K-MOD, it is the best out of the two due to having 50 cloaks. Be aware that you\'re still visible in the minimap. The only way to become completely invisible is to own a Spearhead and activate the \"Ultimate Cloaking\" ability.', 500, 'uridium', '1', '/do_img/global/items/equipment/extra/cpu/cl04k-xl.gif', '1', 0, '', '', '', '', '', '', '', '', '', '', 'equipment_extra_cpu_cl04k-xl', '', '', '', '', '', ''),
(2826, 'drones', 'Spartan', '<p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 156, 247);display: inline-block;\">Shield</p> <p style=\"color: #009cf7;display: inline-block;\">15%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(0, 241, 118);display: inline-block;\">HP</p> <p style=\"color: #2be676;display: inline-block;\">35%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: red;display: inline-block;\">DMG</p> <p style=\"color: red;display: inline-block;\">20%</p><p style=\"color: #ffffff; display: inline-block;\"></p> <p style=\"color: rgb(255, 212, 0);display: inline-block;\">Full Set</p> ', 350000, 'uridium', '1', 'do_img/global/items/drone/designs/spartan.gif', '1', 0, '', '', '', '', '', '', '', '', '', 'spartanCount', '', '', '', '', '', '', ''),
(2827, 'new-desings', 'Lightning', '<div class=\"dm-description\">Vengeance-Lightning (17% DMG + 20% SHD +17% HP + 20% HON+ 20% EXP)</div>', 150000, 'uridium', '0', 'do_img/global/items/ship/vengeance/design/lightning_100x100.png', '1', 0, 'ship_vengeance_design_lightning', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2828, 'new-desings', 'Veteran', '<div class=\"dm-description\">The Veteran is an elite battlecruiser ship that feature a black and white paint and a passive that increases all of the experience you gain by 10%)</div> ', 250000, 'uridium', '0', 'do_img/global/items/ship/goliath/design/veteran_100x100.png', '1', 1, 'ship_goliath_design_veteran', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uba_rewards`
--

CREATE TABLE `uba_rewards` (
  `id` int(11) NOT NULL,
  `reward` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_bans`
--

CREATE TABLE `user_bans` (
  `id` int(11) NOT NULL,
  `ip_user` varchar(25) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `banType` tinyint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL,
  `voucher` longtext NOT NULL,
  `uses` bigint(255) NOT NULL,
  `design` varchar(255) NOT NULL,
  `uridium` varchar(255) NOT NULL,
  `credits` varchar(255) NOT NULL,
  `event_coins` varchar(255) NOT NULL,
  `date` time(6) NOT NULL,
  `only_one_user` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 = Desactivado | 1 = Activado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `vouchers`
--

INSERT INTO `vouchers` (`id`, `voucher`, `uses`, `design`, `uridium`, `credits`, `event_coins`, `date`, `only_one_user`) VALUES
(1, 'gift2', 0, '', '1000', '', '', '23:05:00.000000', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vouchers_uses`
--

CREATE TABLE `vouchers_uses` (
  `id` int(11) NOT NULL,
  `userId` int(255) NOT NULL,
  `voucherId` varchar(255) NOT NULL,
  `dateUsed` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `voucher_log`
--

CREATE TABLE `voucher_log` (
  `id` int(11) NOT NULL,
  `voucher` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `bank_log`
--
ALTER TABLE `bank_log`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `chat_log`
--
ALTER TABLE `chat_log`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `chat_permissions`
--
ALTER TABLE `chat_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Tablo için indeksler `event_coins`
--
ALTER TABLE `event_coins`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Tablo için indeksler `gg_log`
--
ALTER TABLE `gg_log`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `info_galaxygates`
--
ALTER TABLE `info_galaxygates`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `log_event_jpb`
--
ALTER TABLE `log_event_jpb`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `log_event_uba`
--
ALTER TABLE `log_event_uba`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `log_player_kills`
--
ALTER TABLE `log_player_kills`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `manage_events`
--
ALTER TABLE `manage_events`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `mm_queue`
--
ALTER TABLE `mm_queue`
  ADD KEY `id` (`id`);

--
-- Tablo için indeksler `newsclantablelog`
--
ALTER TABLE `newsclantablelog`
  ADD KEY `id` (`id`);

--
-- Tablo için indeksler `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `player_accounts`
--
ALTER TABLE `player_accounts`
  ADD PRIMARY KEY (`userId`,`mapID`,`posX`,`posY`);

--
-- Tablo için indeksler `player_designs`
--
ALTER TABLE `player_designs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Tablo için indeksler `player_equipment`
--
ALTER TABLE `player_equipment`
  ADD PRIMARY KEY (`userId`);

--
-- Tablo için indeksler `player_galaxygates`
--
ALTER TABLE `player_galaxygates`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `player_settings`
--
ALTER TABLE `player_settings`
  ADD PRIMARY KEY (`userId`);

--
-- Tablo için indeksler `player_titles`
--
ALTER TABLE `player_titles`
  ADD PRIMARY KEY (`userID`);

--
-- Tablo için indeksler `server_bans`
--
ALTER TABLE `server_bans`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `server_battlestations`
--
ALTER TABLE `server_battlestations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `server_clans`
--
ALTER TABLE `server_clans`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `server_clan_applications`
--
ALTER TABLE `server_clan_applications`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `server_clan_diplomacy`
--
ALTER TABLE `server_clan_diplomacy`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `server_clan_diplomacy_applications`
--
ALTER TABLE `server_clan_diplomacy_applications`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `server_maps`
--
ALTER TABLE `server_maps`
  ADD PRIMARY KEY (`mapID`) USING BTREE;

--
-- Tablo için indeksler `server_ships`
--
ALTER TABLE `server_ships`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `shipID` (`shipID`) USING BTREE;

--
-- Tablo için indeksler `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `shop_items`
--
ALTER TABLE `shop_items`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `uba_rewards`
--
ALTER TABLE `uba_rewards`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `user_bans`
--
ALTER TABLE `user_bans`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Tablo için indeksler `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `vouchers_uses`
--
ALTER TABLE `vouchers_uses`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `voucher_log`
--
ALTER TABLE `voucher_log`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `bank_log`
--
ALTER TABLE `bank_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `chat_log`
--
ALTER TABLE `chat_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `chat_permissions`
--
ALTER TABLE `chat_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Tablo için AUTO_INCREMENT değeri `event_coins`
--
ALTER TABLE `event_coins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `gg_log`
--
ALTER TABLE `gg_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `info_galaxygates`
--
ALTER TABLE `info_galaxygates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `log_event_jpb`
--
ALTER TABLE `log_event_jpb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `log_event_uba`
--
ALTER TABLE `log_event_uba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `log_player_kills`
--
ALTER TABLE `log_player_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `manage_events`
--
ALTER TABLE `manage_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `mm_queue`
--
ALTER TABLE `mm_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `newsclantablelog`
--
ALTER TABLE `newsclantablelog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `platforms`
--
ALTER TABLE `platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `player_accounts`
--
ALTER TABLE `player_accounts`
  MODIFY `userId` int(20) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `player_designs`
--
ALTER TABLE `player_designs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `player_equipment`
--
ALTER TABLE `player_equipment`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `player_galaxygates`
--
ALTER TABLE `player_galaxygates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `player_settings`
--
ALTER TABLE `player_settings`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `player_titles`
--
ALTER TABLE `player_titles`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `server_bans`
--
ALTER TABLE `server_bans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `server_battlestations`
--
ALTER TABLE `server_battlestations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Tablo için AUTO_INCREMENT değeri `server_clans`
--
ALTER TABLE `server_clans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `server_clan_applications`
--
ALTER TABLE `server_clan_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `server_clan_diplomacy`
--
ALTER TABLE `server_clan_diplomacy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `server_clan_diplomacy_applications`
--
ALTER TABLE `server_clan_diplomacy_applications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- Tablo için AUTO_INCREMENT değeri `shop_items`
--
ALTER TABLE `shop_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28243;

--
-- Tablo için AUTO_INCREMENT değeri `uba_rewards`
--
ALTER TABLE `uba_rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `user_bans`
--
ALTER TABLE `user_bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `vouchers_uses`
--
ALTER TABLE `vouchers_uses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `voucher_log`
--
ALTER TABLE `voucher_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
