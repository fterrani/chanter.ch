-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 22 oct. 2018 à 20:08
-- Version du serveur :  10.1.32-MariaDB
-- Version de PHP :  7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db_wp_chanter`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `IdAddress` int(10) NOT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `NPA` int(10) NOT NULL,
  `Street` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `attribution`
--

CREATE TABLE `attribution` (
  `IdAttribution` int(10) NOT NULL,
  `AttributionTitleFR` varchar(255) NOT NULL,
  `AttributionTitleDE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `choir`
--

CREATE TABLE `choir` (
  `IdChoir` int(10) NOT NULL,
  `AddressIdAddress` int(10) NOT NULL,
  `ChoirName` varchar(255) NOT NULL,
  `CreationYear` int(10) NOT NULL,
  `StaffNumber` int(10) DEFAULT NULL,
  `Language` varchar(255) NOT NULL,
  `GeneralMeeting` varchar(255) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `Type` varchar(255) NOT NULL,
  `Institution` varchar(255) NOT NULL,
  `Eglise` tinyint(1) NOT NULL,
  `Gospel` tinyint(1) NOT NULL,
  `Jodel` tinyint(1) NOT NULL,
  `USCID` varchar(255) DEFAULT NULL,
  `CommentChoir` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `choir_person_attribution`
--

CREATE TABLE `choir_person_attribution` (
  `ChoirIdChoir` int(10) NOT NULL,
  `AttributionIdAttribution` int(10) NOT NULL,
  `PersonIdPerson` int(10) NOT NULL,
  `Since` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `organisation`
--

CREATE TABLE `organisation` (
  `IdOrganisation` int(10) NOT NULL,
  `AddressidAddress` int(10) NOT NULL,
  `OrganisationName` varchar(255) NOT NULL,
  `Language` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `organisation_choir`
--

CREATE TABLE `organisation_choir` (
  `OrganisationIdOrganisation` int(10) NOT NULL,
  `ChoirIdChoir` int(10) NOT NULL,
  `InOrganisationSince` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `organisation_person_attribution`
--

CREATE TABLE `organisation_person_attribution` (
  `OrganisationIdOrganisation` int(10) NOT NULL,
  `AttributionIdAttribution` int(10) NOT NULL,
  `PersonIdPerson` int(10) NOT NULL,
  `Since` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

CREATE TABLE `person` (
  `idPerson` int(10) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Firstname` varchar(255) NOT NULL,
  `Lastname` varchar(255) NOT NULL,
  `AddressIdAddress` int(10) NOT NULL,
  `PersonalPhone` varchar(255) DEFAULT NULL,
  `MobilePhone` varchar(255) NOT NULL,
  `ProfessionalPhone` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Fax` varchar(255) DEFAULT NULL,
  `CommentPerson` varchar(255) DEFAULT NULL,
  `LastUpdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewsautomated`
--

CREATE TABLE `wp_knewsautomated` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selection_method` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` bigint(20) UNSIGNED NOT NULL,
  `newsletter_id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paused` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `every_mode` int(11) NOT NULL,
  `every_time` int(11) NOT NULL,
  `what_dayweek` int(11) NOT NULL,
  `every_posts` int(11) NOT NULL,
  `last_run` datetime NOT NULL,
  `emails_at_once` int(11) NOT NULL DEFAULT '25',
  `run_yet` int(1) NOT NULL DEFAULT '1',
  `id_smtp` bigint(20) NOT NULL DEFAULT '1',
  `what_is` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'autocreate',
  `event` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delay` int(11) NOT NULL DEFAULT '0',
  `delay_unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `use_post_embed_pref` bigint(1) UNSIGNED NOT NULL DEFAULT '1',
  `include_cats` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exclude_cats` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `include_tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exclude_tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `include_postypes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `submit_time` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewsautomatedposts`
--

CREATE TABLE `wp_knewsautomatedposts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_automated` bigint(20) UNSIGNED NOT NULL,
  `id_post` bigint(20) UNSIGNED NOT NULL,
  `id_news` bigint(20) UNSIGNED NOT NULL,
  `when_scheduled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewsautomatedsel`
--

CREATE TABLE `wp_knewsautomatedsel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_automated` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewsextrafields`
--

CREATE TABLE `wp_knewsextrafields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_table` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wp_knewsextrafields`
--

INSERT INTO `wp_knewsextrafields` (`id`, `name`, `show_table`, `token`) VALUES
(1, 'name', 1, '%name%'),
(2, 'surname', 0, '%surname%');

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewskeys`
--

CREATE TABLE `wp_knewskeys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `keyy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(2) NOT NULL,
  `submit_id` bigint(20) UNSIGNED NOT NULL,
  `href` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `param_href` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewsletters`
--

CREATE TABLE `wp_knewsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_mailing` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_modules` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_container` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_head` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_bodytag` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `automated` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `id_mobile` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `newstype` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewslists`
--

CREATE TABLE `wp_knewslists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `open` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_registered` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `langs` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderlist` int(11) NOT NULL DEFAULT '0',
  `auxiliary` int(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wp_knewslists`
--

INSERT INTO `wp_knewslists` (`id`, `name`, `open`, `open_registered`, `langs`, `orderlist`, `auxiliary`) VALUES
(1, 'Default list', '1', '1', '', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewstats`
--

CREATE TABLE `wp_knewstats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `submit_id` bigint(20) UNSIGNED NOT NULL,
  `what` int(2) NOT NULL,
  `date` datetime NOT NULL,
  `statkey` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewsubmits`
--

CREATE TABLE `wp_knewsubmits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `newsletter` int(11) NOT NULL,
  `finished` tinyint(1) NOT NULL,
  `paused` tinyint(1) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `users_total` int(11) NOT NULL,
  `users_ok` int(11) NOT NULL,
  `users_error` int(11) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `strict_control` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emails_at_once` int(11) NOT NULL,
  `special` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_smtp` bigint(20) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewsubmitsdetails`
--

CREATE TABLE `wp_knewsubmitsdetails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `submit` bigint(20) UNSIGNED NOT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewsusers`
--

CREATE TABLE `wp_knewsusers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joined` datetime NOT NULL,
  `confkey` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewsusersevents`
--

CREATE TABLE `wp_knewsusersevents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `event` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `triggered` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewsusersextra`
--

CREATE TABLE `wp_knewsusersextra` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `field_id` bigint(20) UNSIGNED NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_knewsuserslists`
--

CREATE TABLE `wp_knewsuserslists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_list` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_newsletter`
--

CREATE TABLE `wp_newsletter` (
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'S',
  `id` int(11) NOT NULL,
  `profile` mediumtext COLLATE utf8mb4_unicode_ci,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` int(11) NOT NULL DEFAULT '0',
  `last_activity` int(11) NOT NULL DEFAULT '0',
  `followup_step` tinyint(4) NOT NULL DEFAULT '0',
  `followup_time` bigint(20) NOT NULL DEFAULT '0',
  `followup` tinyint(4) NOT NULL DEFAULT '0',
  `surname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sex` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `feed_time` bigint(20) NOT NULL DEFAULT '0',
  `feed` tinyint(4) NOT NULL DEFAULT '0',
  `referrer` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `wp_user_id` int(11) NOT NULL DEFAULT '0',
  `http_referer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `region` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bounce_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bounce_time` int(11) NOT NULL DEFAULT '0',
  `unsub_email_id` int(11) NOT NULL DEFAULT '0',
  `unsub_time` int(11) NOT NULL DEFAULT '0',
  `list_1` tinyint(4) NOT NULL DEFAULT '0',
  `list_2` tinyint(4) NOT NULL DEFAULT '0',
  `list_3` tinyint(4) NOT NULL DEFAULT '0',
  `list_4` tinyint(4) NOT NULL DEFAULT '0',
  `list_5` tinyint(4) NOT NULL DEFAULT '0',
  `list_6` tinyint(4) NOT NULL DEFAULT '0',
  `list_7` tinyint(4) NOT NULL DEFAULT '0',
  `list_8` tinyint(4) NOT NULL DEFAULT '0',
  `list_9` tinyint(4) NOT NULL DEFAULT '0',
  `list_10` tinyint(4) NOT NULL DEFAULT '0',
  `list_11` tinyint(4) NOT NULL DEFAULT '0',
  `list_12` tinyint(4) NOT NULL DEFAULT '0',
  `list_13` tinyint(4) NOT NULL DEFAULT '0',
  `list_14` tinyint(4) NOT NULL DEFAULT '0',
  `list_15` tinyint(4) NOT NULL DEFAULT '0',
  `list_16` tinyint(4) NOT NULL DEFAULT '0',
  `list_17` tinyint(4) NOT NULL DEFAULT '0',
  `list_18` tinyint(4) NOT NULL DEFAULT '0',
  `list_19` tinyint(4) NOT NULL DEFAULT '0',
  `list_20` tinyint(4) NOT NULL DEFAULT '0',
  `list_21` tinyint(4) NOT NULL DEFAULT '0',
  `list_22` tinyint(4) NOT NULL DEFAULT '0',
  `list_23` tinyint(4) NOT NULL DEFAULT '0',
  `list_24` tinyint(4) NOT NULL DEFAULT '0',
  `list_25` tinyint(4) NOT NULL DEFAULT '0',
  `list_26` tinyint(4) NOT NULL DEFAULT '0',
  `list_27` tinyint(4) NOT NULL DEFAULT '0',
  `list_28` tinyint(4) NOT NULL DEFAULT '0',
  `list_29` tinyint(4) NOT NULL DEFAULT '0',
  `list_30` tinyint(4) NOT NULL DEFAULT '0',
  `list_31` tinyint(4) NOT NULL DEFAULT '0',
  `list_32` tinyint(4) NOT NULL DEFAULT '0',
  `list_33` tinyint(4) NOT NULL DEFAULT '0',
  `list_34` tinyint(4) NOT NULL DEFAULT '0',
  `list_35` tinyint(4) NOT NULL DEFAULT '0',
  `list_36` tinyint(4) NOT NULL DEFAULT '0',
  `list_37` tinyint(4) NOT NULL DEFAULT '0',
  `list_38` tinyint(4) NOT NULL DEFAULT '0',
  `list_39` tinyint(4) NOT NULL DEFAULT '0',
  `list_40` tinyint(4) NOT NULL DEFAULT '0',
  `profile_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_11` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_12` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_13` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_14` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_15` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_16` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_17` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_18` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_19` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_20` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `test` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_newsletter_emails`
--

CREATE TABLE `wp_newsletter_emails` (
  `id` int(11) NOT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `subject2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message2` longtext COLLATE utf8mb4_unicode_ci,
  `name2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('new','sending','sent','paused') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `total` int(11) NOT NULL DEFAULT '0',
  `last_id` int(11) NOT NULL DEFAULT '0',
  `sent` int(11) NOT NULL DEFAULT '0',
  `track` int(11) NOT NULL DEFAULT '0',
  `list` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `query` longtext COLLATE utf8mb4_unicode_ci,
  `editor` tinyint(4) NOT NULL DEFAULT '0',
  `sex` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_text` longtext COLLATE utf8mb4_unicode_ci,
  `preferences` longtext COLLATE utf8mb4_unicode_ci,
  `send_on` int(11) NOT NULL DEFAULT '0',
  `token` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `options` longtext COLLATE utf8mb4_unicode_ci,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `click_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `version` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `open_count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_newsletter_sent`
--

CREATE TABLE `wp_newsletter_sent` (
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `open` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `error` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_newsletter_stats`
--

CREATE TABLE `wp_newsletter_stats` (
  `id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `email_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `link_id` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_newsletter_user_logs`
--

CREATE TABLE `wp_newsletter_user_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `source` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `created` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost:8080/chanter.ch', 'yes'),
(2, 'home', 'http://localhost:8080/chanter.ch', 'yes'),
(3, 'blogname', 'FSCV', 'yes'),
(4, 'blogdescription', 'La vie du monde choral en Valais !', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'julien.reichenbach@students.hevs.ch', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'G \\h i \\m\\i\\n', 'yes'),
(25, 'links_updated_date_format', 'j F Y G \\h i \\m\\i\\n', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:13:{i:0;s:21:\"polylang/polylang.php\";i:1;s:25:\"adminimize/adminimize.php\";i:2;s:35:\"author-category/author-category.php\";i:3;s:37:\"disable-comments/disable-comments.php\";i:4;s:15:\"knews/knews.php\";i:5;s:69:\"pending-submission-notifications/pending-submission-notifications.php\";i:6;s:13:\"pods/init.php\";i:7;s:43:\"the-events-calendar/the-events-calendar.php\";i:8;s:59:\"ultimate-social-media-icons/ultimate_social_media_icons.php\";i:9;s:37:\"user-role-editor/user-role-editor.php\";i:10;s:47:\"user-specific-content/User-Specific-Content.php\";i:11;s:60:\"wp-support-plus-responsive-ticket-system/wp-support-plus.php\";i:12;s:24:\"wpforms-lite/wpforms.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:71:\"D:\\Xampp\\htdocs\\chanter.ch/wp-content/plugins/adminimize/adminimize.php\";i:1;s:0:\"\";}', 'no'),
(40, 'template', 'radiate', 'yes'),
(41, 'stylesheet', 'radiate', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:1;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:2:{s:25:\"adminimize/adminimize.php\";s:24:\"_mw_adminimize_uninstall\";s:59:\"ultimate-social-media-icons/ultimate_social_media_icons.php\";s:20:\"sfsi_Unistall_plugin\";}', 'no'),
(82, 'timezone_string', 'Europe/Paris', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '103', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '0', 'yes'),
(93, 'initial_db_version', '38590', 'yes'),
(94, 'wp_user_roles', 'a:12:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:112:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:25:\"read_private_tribe_events\";b:1;s:17:\"edit_tribe_events\";b:1;s:24:\"edit_others_tribe_events\";b:1;s:25:\"edit_private_tribe_events\";b:1;s:27:\"edit_published_tribe_events\";b:1;s:19:\"delete_tribe_events\";b:1;s:26:\"delete_others_tribe_events\";b:1;s:27:\"delete_private_tribe_events\";b:1;s:29:\"delete_published_tribe_events\";b:1;s:20:\"publish_tribe_events\";b:1;s:25:\"read_private_tribe_venues\";b:1;s:17:\"edit_tribe_venues\";b:1;s:24:\"edit_others_tribe_venues\";b:1;s:25:\"edit_private_tribe_venues\";b:1;s:27:\"edit_published_tribe_venues\";b:1;s:19:\"delete_tribe_venues\";b:1;s:26:\"delete_others_tribe_venues\";b:1;s:27:\"delete_private_tribe_venues\";b:1;s:29:\"delete_published_tribe_venues\";b:1;s:20:\"publish_tribe_venues\";b:1;s:29:\"read_private_tribe_organizers\";b:1;s:21:\"edit_tribe_organizers\";b:1;s:28:\"edit_others_tribe_organizers\";b:1;s:29:\"edit_private_tribe_organizers\";b:1;s:31:\"edit_published_tribe_organizers\";b:1;s:23:\"delete_tribe_organizers\";b:1;s:30:\"delete_others_tribe_organizers\";b:1;s:31:\"delete_private_tribe_organizers\";b:1;s:33:\"delete_published_tribe_organizers\";b:1;s:24:\"publish_tribe_organizers\";b:1;s:31:\"read_private_aggregator-records\";b:1;s:23:\"edit_aggregator-records\";b:1;s:30:\"edit_others_aggregator-records\";b:1;s:31:\"edit_private_aggregator-records\";b:1;s:33:\"edit_published_aggregator-records\";b:1;s:25:\"delete_aggregator-records\";b:1;s:32:\"delete_others_aggregator-records\";b:1;s:33:\"delete_private_aggregator-records\";b:1;s:35:\"delete_published_aggregator-records\";b:1;s:26:\"publish_aggregator-records\";b:1;s:14:\"ure_edit_roles\";b:1;s:16:\"ure_create_roles\";b:1;s:16:\"ure_delete_roles\";b:1;s:23:\"ure_create_capabilities\";b:1;s:23:\"ure_delete_capabilities\";b:1;s:18:\"ure_manage_options\";b:1;s:15:\"ure_reset_roles\";b:1;s:14:\"edit_pods_pods\";b:1;s:21:\"edit_others_pods_pods\";b:1;s:17:\"publish_pods_pods\";b:1;s:22:\"read_private_pods_pods\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:30:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:17:\"edit_tribe_events\";b:1;s:27:\"edit_published_tribe_events\";b:1;s:19:\"delete_tribe_events\";b:1;s:29:\"delete_published_tribe_events\";b:1;s:20:\"publish_tribe_events\";b:1;s:17:\"edit_tribe_venues\";b:1;s:27:\"edit_published_tribe_venues\";b:1;s:19:\"delete_tribe_venues\";b:1;s:29:\"delete_published_tribe_venues\";b:1;s:20:\"publish_tribe_venues\";b:1;s:21:\"edit_tribe_organizers\";b:1;s:31:\"edit_published_tribe_organizers\";b:1;s:23:\"delete_tribe_organizers\";b:1;s:33:\"delete_published_tribe_organizers\";b:1;s:24:\"publish_tribe_organizers\";b:1;s:23:\"edit_aggregator-records\";b:1;s:33:\"edit_published_aggregator-records\";b:1;s:25:\"delete_aggregator-records\";b:1;s:35:\"delete_published_aggregator-records\";b:1;s:26:\"publish_aggregator-records\";b:1;}}s:11:\"choeuradmin\";a:2:{s:4:\"name\";s:11:\"ChoeurAdmin\";s:12:\"capabilities\";a:40:{s:12:\"create_posts\";b:1;s:25:\"delete_aggregator-records\";b:1;s:12:\"delete_pages\";b:1;s:12:\"delete_posts\";b:1;s:33:\"delete_private_aggregator-records\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:27:\"delete_private_tribe_events\";b:1;s:31:\"delete_private_tribe_organizers\";b:1;s:27:\"delete_private_tribe_venues\";b:1;s:19:\"delete_tribe_events\";b:1;s:23:\"delete_tribe_organizers\";b:1;s:19:\"delete_tribe_venues\";b:1;s:10:\"edit_pages\";b:1;s:10:\"edit_posts\";b:1;s:31:\"edit_private_aggregator-records\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:25:\"edit_private_tribe_events\";b:1;s:29:\"edit_private_tribe_organizers\";b:1;s:25:\"edit_private_tribe_venues\";b:1;s:20:\"edit_published_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:27:\"edit_published_tribe_events\";b:1;s:31:\"edit_published_tribe_organizers\";b:1;s:27:\"edit_published_tribe_venues\";b:1;s:17:\"edit_tribe_events\";b:1;s:21:\"edit_tribe_organizers\";b:1;s:17:\"edit_tribe_venues\";b:1;s:10:\"edit_users\";b:1;s:7:\"level_0\";b:1;s:10:\"list_users\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:13:\"promote_users\";b:1;s:4:\"read\";b:1;s:31:\"read_private_aggregator-records\";b:1;s:12:\"remove_users\";b:1;s:12:\"upload_files\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:13:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:17:\"edit_tribe_events\";b:1;s:19:\"delete_tribe_events\";b:1;s:17:\"edit_tribe_venues\";b:1;s:19:\"delete_tribe_venues\";b:1;s:21:\"edit_tribe_organizers\";b:1;s:23:\"delete_tribe_organizers\";b:1;s:23:\"edit_aggregator-records\";b:1;s:25:\"delete_aggregator-records\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:64:{s:12:\"create_posts\";b:1;s:23:\"edit_aggregator-records\";b:1;s:30:\"edit_others_aggregator-records\";b:1;s:17:\"edit_others_pages\";b:1;s:17:\"edit_others_posts\";b:1;s:24:\"edit_others_tribe_events\";b:1;s:28:\"edit_others_tribe_organizers\";b:1;s:24:\"edit_others_tribe_venues\";b:1;s:10:\"edit_pages\";b:1;s:10:\"edit_posts\";b:1;s:31:\"edit_private_aggregator-records\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:25:\"edit_private_tribe_events\";b:1;s:29:\"edit_private_tribe_organizers\";b:1;s:25:\"edit_private_tribe_venues\";b:1;s:33:\"edit_published_aggregator-records\";b:1;s:20:\"edit_published_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:27:\"edit_published_tribe_events\";b:1;s:31:\"edit_published_tribe_organizers\";b:1;s:27:\"edit_published_tribe_venues\";b:1;s:17:\"edit_tribe_events\";b:1;s:21:\"edit_tribe_organizers\";b:1;s:17:\"edit_tribe_venues\";b:1;s:7:\"level_0\";b:1;s:7:\"level_1\";b:1;s:7:\"level_2\";b:1;s:7:\"level_3\";b:1;s:7:\"level_4\";b:1;s:7:\"level_5\";b:1;s:7:\"level_6\";b:1;s:7:\"level_7\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:4:\"read\";b:1;s:31:\"read_private_aggregator-records\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:25:\"read_private_tribe_events\";b:1;s:29:\"read_private_tribe_organizers\";b:1;s:25:\"read_private_tribe_venues\";b:1;s:12:\"upload_files\";b:1;s:19:\"delete_tribe_events\";b:1;s:26:\"delete_others_tribe_events\";b:1;s:27:\"delete_private_tribe_events\";b:1;s:29:\"delete_published_tribe_events\";b:1;s:20:\"publish_tribe_events\";b:1;s:19:\"delete_tribe_venues\";b:1;s:26:\"delete_others_tribe_venues\";b:1;s:27:\"delete_private_tribe_venues\";b:1;s:29:\"delete_published_tribe_venues\";b:1;s:20:\"publish_tribe_venues\";b:1;s:23:\"delete_tribe_organizers\";b:1;s:30:\"delete_others_tribe_organizers\";b:1;s:31:\"delete_private_tribe_organizers\";b:1;s:33:\"delete_published_tribe_organizers\";b:1;s:24:\"publish_tribe_organizers\";b:1;s:25:\"delete_aggregator-records\";b:1;s:32:\"delete_others_aggregator-records\";b:1;s:33:\"delete_private_aggregator-records\";b:1;s:35:\"delete_published_aggregator-records\";b:1;s:26:\"publish_aggregator-records\";b:1;}}s:9:\"fscvadmin\";a:2:{s:4:\"name\";s:9:\"FSCVAdmin\";s:12:\"capabilities\";a:38:{s:12:\"create_posts\";b:1;s:25:\"delete_aggregator-records\";b:1;s:12:\"delete_pages\";b:1;s:12:\"delete_posts\";b:1;s:33:\"delete_private_aggregator-records\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:27:\"delete_private_tribe_events\";b:1;s:31:\"delete_private_tribe_organizers\";b:1;s:27:\"delete_private_tribe_venues\";b:1;s:19:\"delete_tribe_events\";b:1;s:23:\"delete_tribe_organizers\";b:1;s:19:\"delete_tribe_venues\";b:1;s:10:\"edit_pages\";b:1;s:10:\"edit_posts\";b:1;s:31:\"edit_private_aggregator-records\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:25:\"edit_private_tribe_events\";b:1;s:29:\"edit_private_tribe_organizers\";b:1;s:25:\"edit_private_tribe_venues\";b:1;s:20:\"edit_published_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:27:\"edit_published_tribe_events\";b:1;s:31:\"edit_published_tribe_organizers\";b:1;s:27:\"edit_published_tribe_venues\";b:1;s:17:\"edit_tribe_events\";b:1;s:21:\"edit_tribe_organizers\";b:1;s:17:\"edit_tribe_venues\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:7:\"level_0\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:4:\"read\";b:1;s:31:\"read_private_aggregator-records\";b:1;s:12:\"upload_files\";b:1;}}s:12:\"gestionliste\";a:2:{s:4:\"name\";s:12:\"GestionListe\";s:12:\"capabilities\";a:4:{s:6:\"export\";b:1;s:6:\"import\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;}}s:9:\"gestionnl\";a:2:{s:4:\"name\";s:9:\"GestionNL\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:11:\"groupsadmin\";a:2:{s:4:\"name\";s:11:\"GroupsAdmin\";s:12:\"capabilities\";a:39:{s:12:\"create_posts\";b:1;s:25:\"delete_aggregator-records\";b:1;s:12:\"delete_pages\";b:1;s:12:\"delete_posts\";b:1;s:33:\"delete_private_aggregator-records\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:27:\"delete_private_tribe_events\";b:1;s:31:\"delete_private_tribe_organizers\";b:1;s:27:\"delete_private_tribe_venues\";b:1;s:19:\"delete_tribe_events\";b:1;s:23:\"delete_tribe_organizers\";b:1;s:19:\"delete_tribe_venues\";b:1;s:10:\"edit_pages\";b:1;s:10:\"edit_posts\";b:1;s:31:\"edit_private_aggregator-records\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:25:\"edit_private_tribe_events\";b:1;s:29:\"edit_private_tribe_organizers\";b:1;s:25:\"edit_private_tribe_venues\";b:1;s:20:\"edit_published_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:27:\"edit_published_tribe_events\";b:1;s:31:\"edit_published_tribe_organizers\";b:1;s:27:\"edit_published_tribe_venues\";b:1;s:17:\"edit_tribe_events\";b:1;s:21:\"edit_tribe_organizers\";b:1;s:17:\"edit_tribe_venues\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:7:\"level_0\";b:1;s:10:\"list_users\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:4:\"read\";b:1;s:31:\"read_private_aggregator-records\";b:1;s:12:\"upload_files\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:10:\"traducteur\";a:2:{s:4:\"name\";s:10:\"Traducteur\";s:12:\"capabilities\";a:25:{s:23:\"edit_aggregator-records\";b:1;s:14:\"edit_dashboard\";b:1;s:30:\"edit_others_aggregator-records\";b:1;s:17:\"edit_others_pages\";b:1;s:17:\"edit_others_posts\";b:1;s:24:\"edit_others_tribe_events\";b:1;s:28:\"edit_others_tribe_organizers\";b:1;s:24:\"edit_others_tribe_venues\";b:1;s:10:\"edit_pages\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_posts\";b:1;s:31:\"edit_private_aggregator-records\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:25:\"edit_private_tribe_events\";b:1;s:29:\"edit_private_tribe_organizers\";b:1;s:25:\"edit_private_tribe_venues\";b:1;s:33:\"edit_published_aggregator-records\";b:1;s:20:\"edit_published_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:27:\"edit_published_tribe_events\";b:1;s:31:\"edit_published_tribe_organizers\";b:1;s:27:\"edit_published_tribe_venues\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;}}s:9:\"webmaster\";a:2:{s:4:\"name\";s:9:\"Webmaster\";s:12:\"capabilities\";a:69:{s:12:\"create_posts\";b:1;s:25:\"delete_aggregator-records\";b:1;s:32:\"delete_others_aggregator-records\";b:1;s:19:\"delete_others_pages\";b:1;s:19:\"delete_others_posts\";b:1;s:26:\"delete_others_tribe_events\";b:1;s:30:\"delete_others_tribe_organizers\";b:1;s:26:\"delete_others_tribe_venues\";b:1;s:12:\"delete_pages\";b:1;s:12:\"delete_posts\";b:1;s:33:\"delete_private_aggregator-records\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:27:\"delete_private_tribe_events\";b:1;s:31:\"delete_private_tribe_organizers\";b:1;s:27:\"delete_private_tribe_venues\";b:1;s:35:\"delete_published_aggregator-records\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:29:\"delete_published_tribe_events\";b:1;s:33:\"delete_published_tribe_organizers\";b:1;s:29:\"delete_published_tribe_venues\";b:1;s:19:\"delete_tribe_events\";b:1;s:23:\"delete_tribe_organizers\";b:1;s:19:\"delete_tribe_venues\";b:1;s:23:\"edit_aggregator-records\";b:1;s:30:\"edit_others_aggregator-records\";b:1;s:17:\"edit_others_pages\";b:1;s:17:\"edit_others_posts\";b:1;s:24:\"edit_others_tribe_events\";b:1;s:28:\"edit_others_tribe_organizers\";b:1;s:24:\"edit_others_tribe_venues\";b:1;s:10:\"edit_pages\";b:1;s:10:\"edit_posts\";b:1;s:31:\"edit_private_aggregator-records\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:25:\"edit_private_tribe_events\";b:1;s:29:\"edit_private_tribe_organizers\";b:1;s:25:\"edit_private_tribe_venues\";b:1;s:33:\"edit_published_aggregator-records\";b:1;s:20:\"edit_published_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:27:\"edit_published_tribe_events\";b:1;s:31:\"edit_published_tribe_organizers\";b:1;s:27:\"edit_published_tribe_venues\";b:1;s:17:\"edit_tribe_events\";b:1;s:21:\"edit_tribe_organizers\";b:1;s:17:\"edit_tribe_venues\";b:1;s:7:\"level_0\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:26:\"publish_aggregator-records\";b:1;s:13:\"publish_pages\";b:1;s:13:\"publish_posts\";b:1;s:20:\"publish_tribe_events\";b:1;s:24:\"publish_tribe_organizers\";b:1;s:20:\"publish_tribe_venues\";b:1;s:4:\"read\";b:1;s:31:\"read_private_aggregator-records\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:25:\"read_private_tribe_events\";b:1;s:29:\"read_private_tribe_organizers\";b:1;s:25:\"read_private_tribe_venues\";b:1;s:15:\"unfiltered_html\";b:1;s:17:\"unfiltered_upload\";b:1;s:12:\"upload_files\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'WPLANG', 'fr_FR', 'yes'),
(97, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;s:9:\"show_date\";b:1;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:5:{i:0;s:10:\"polylang-7\";i:1;s:14:\"recent-posts-2\";i:2;s:12:\"categories-2\";i:3;s:13:\"sfsi-widget-2\";i:4;s:14:\"knews_widget-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(103, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'cron', 'a:12:{i:1540231700;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1540231735;a:1:{s:39:\"tribe_aggregator_process_insert_records\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:17:\"tribe-every15mins\";s:4:\"args\";a:0:{}s:8:\"interval\";i:900;}}}i:1540232077;a:1:{s:26:\"knews_wpcron_function_hook\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:9:\"knewstime\";s:4:\"args\";a:0:{}s:8:\"interval\";i:600;}}}i:1540233877;a:1:{s:26:\"knews_wpcron_automate_hook\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1540256900;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1540277174;a:1:{s:25:\"daily_check_ticket_status\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1540283463;a:1:{s:29:\"newsletter_extension_versions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1540293908;a:2:{s:22:\"tribe_trash_event_cron\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:20:\"tribe_del_event_cron\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1540300201;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1540300325;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1540304634;a:1:{s:24:\"tribe_common_log_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(113, 'theme_mods_twentyseventeen', 'a:3:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:2:{s:3:\"top\";i:5;s:6:\"social\";i:0;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1539960017;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:10:\"polylang-3\";i:1;s:8:\"search-2\";i:2;s:14:\"recent-posts-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:1:{i:0;s:10:\"polylang-6\";}}}}', 'yes'),
(141, 'can_compress_scripts', '1', 'no'),
(146, 'recently_activated', 'a:4:{s:64:\"podamibe-simple-footer-widget-area/simple-footer-widget-area.php\";i:1540231252;s:35:\"insert-headers-and-footers/ihaf.php\";i:1540227798;s:37:\"mailchimp-for-wp/mailchimp-for-wp.php\";i:1539938671;s:21:\"newsletter/plugin.php\";i:1539938122;}', 'yes'),
(170, 'tribe_events_calendar_options', 'a:28:{s:14:\"schema-version\";s:6:\"4.6.25\";s:27:\"recurring_events_are_hidden\";s:6:\"hidden\";s:21:\"previous_ecp_versions\";a:2:{i:0;s:1:\"0\";i:1;s:8:\"4.6.24.1\";}s:18:\"latest_ecp_version\";s:6:\"4.6.25\";s:39:\"last-update-message-the-events-calendar\";s:8:\"4.6.24.1\";s:13:\"earliest_date\";s:19:\"2018-10-12 00:00:00\";s:21:\"earliest_date_markers\";a:1:{i:0;s:2:\"47\";}s:11:\"latest_date\";s:19:\"2018-10-22 17:00:00\";s:19:\"latest_date_markers\";a:1:{i:0;s:3:\"220\";}s:24:\"front_page_event_archive\";b:0;s:11:\"donate-link\";b:0;s:12:\"postsPerPage\";s:2:\"10\";s:17:\"liveFiltersUpdate\";b:1;s:12:\"showComments\";b:0;s:29:\"disable_metabox_custom_fields\";b:1;s:20:\"showEventsInMainLoop\";b:0;s:10:\"eventsSlug\";s:6:\"events\";s:15:\"singleEventSlug\";s:5:\"event\";s:14:\"multiDayCutoff\";s:5:\"00:00\";s:21:\"defaultCurrencySymbol\";s:1:\"$\";s:23:\"reverseCurrencyPosition\";b:0;s:17:\"trash-past-events\";s:1:\"3\";s:18:\"delete-past-events\";s:1:\"3\";s:15:\"embedGoogleMaps\";b:1;s:19:\"embedGoogleMapsZoom\";s:2:\"10\";s:11:\"debugEvents\";b:0;s:26:\"tribe_events_timezone_mode\";s:5:\"event\";s:32:\"tribe_events_timezones_show_zone\";b:0;}', 'yes'),
(171, 'widget_tribe-events-list-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(172, 'tribe_last_save_post', '1540231539', 'yes'),
(207, 'external_updates-event-aggregator', 'O:8:\"stdClass\":3:{s:9:\"lastCheck\";i:1539271936;s:14:\"checkedVersion\";N;s:6:\"update\";O:19:\"Tribe__PUE__Utility\":13:{s:2:\"id\";i:0;s:6:\"plugin\";N;s:4:\"slug\";N;s:7:\"version\";s:3:\"1.0\";s:8:\"homepage\";N;s:12:\"download_url\";N;s:8:\"sections\";O:8:\"stdClass\":1:{s:9:\"changelog\";s:0:\"\";}s:14:\"upgrade_notice\";N;s:13:\"custom_update\";N;s:11:\"api_invalid\";b:1;s:19:\"api_invalid_message\";s:214:\"<p>You are using %plugin_name% but your license key is invalid. Visit the Events Calendar website to check your <a href=\"https://theeventscalendar.com/license-keys/?utm_medium=pue&utm_campaign=in-app\">licenses</a>.\";s:26:\"api_inline_invalid_message\";s:196:\"<p>Your %plugin_name% license key is invalid. Visit the Events Calendar website to check your <a href=\"https://theeventscalendar.com/license-keys/?utm_medium=pue&utm_campaign=in-app\">licenses</a>.\";s:13:\"license_error\";s:203:\"<p>Your Event Aggregator license key is invalid. Visit the Events Calendar website to check your <a href=\"https://theeventscalendar.com/license-keys/?utm_medium=pue&amp;utm_campaign=in-app\">licenses</a>.\";}}', 'no'),
(208, 'tribe_pue_key_notices', 'a:0:{}', 'yes'),
(247, 'wpforms_preview_page', '35', 'yes'),
(248, 'wpforms_version', '1.4.9', 'yes'),
(249, 'wpforms_activated', 'a:1:{s:4:\"lite\";i:1539336875;}', 'yes'),
(252, 'widget_wpforms-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(253, '_amn_wpforms-lite_last_checked', '1540166400', 'yes'),
(254, 'wpforms_review', 'a:2:{s:4:\"time\";i:1539336877;s:9:\"dismissed\";b:0;}', 'yes'),
(284, 'U_S_C', 'a:9:{s:9:\"b_massage\";s:0:\"\";s:10:\"list_users\";b:1;s:10:\"list_roles\";b:1;s:18:\"run_on_the_content\";b:1;s:18:\"run_on_the_excerpt\";b:0;s:9:\"posttypes\";a:2:{s:4:\"post\";s:1:\"1\";s:4:\"page\";s:1:\"1\";}s:10:\"capability\";s:14:\"manage_options\";s:19:\"user_role_list_type\";s:8:\"checkbox\";s:14:\"user_list_type\";s:8:\"checkbox\";}', 'yes'),
(333, '_site_transient_timeout_browser_8651940b33fd1e958c905441aa40a03d', '1540536337', 'no'),
(334, '_site_transient_browser_8651940b33fd1e958c905441aa40a03d', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"69.0.3497.100\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(348, '_site_transient_timeout_community-events-d41d8cd98f00b204e9800998ecf8427e', '1540274736', 'no'),
(351, '_site_transient_community-events-d41d8cd98f00b204e9800998ecf8427e', 'a:2:{s:8:\"location\";a:1:{s:2:\"ip\";b:0;}s:6:\"events\";a:5:{i:0;a:7:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:40:\"Wie baue ich erfolgreich einen Blog auf?\";s:3:\"url\";s:55:\"https://www.meetup.com/WordPress-Bern/events/247420415/\";s:6:\"meetup\";s:14:\"WordPress Bern\";s:10:\"meetup_url\";s:38:\"https://www.meetup.com/WordPress-Bern/\";s:4:\"date\";s:19:\"2018-10-25 18:00:00\";s:8:\"location\";a:4:{s:8:\"location\";s:17:\"Bern, Switzerland\";s:7:\"country\";s:2:\"ch\";s:8:\"latitude\";d:46.948257;s:9:\"longitude\";d:7.442258;}}i:1;a:7:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:30:\"A tavola con i Webmaster Tools\";s:3:\"url\";s:64:\"https://www.meetup.com/WordPress-Meetup-Biella/events/255689496/\";s:6:\"meetup\";s:23:\"WordPress Meetup Biella\";s:10:\"meetup_url\";s:47:\"https://www.meetup.com/WordPress-Meetup-Biella/\";s:4:\"date\";s:19:\"2018-10-25 18:30:00\";s:8:\"location\";a:4:{s:8:\"location\";s:13:\"Biella, Italy\";s:7:\"country\";s:2:\"it\";s:8:\"latitude\";d:45.571903;s:9:\"longitude\";d:8.05906;}}i:2;a:7:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:58:\"Meetup WordPress novembre 2018 : les différentes licences\";s:3:\"url\";s:57:\"https://www.meetup.com/geneva-wordpress/events/255614616/\";s:6:\"meetup\";s:29:\"Geneva WordPress Meetup Group\";s:10:\"meetup_url\";s:40:\"https://www.meetup.com/geneva-wordpress/\";s:4:\"date\";s:19:\"2018-11-01 18:00:00\";s:8:\"location\";a:4:{s:8:\"location\";s:20:\"Genève, Switzerland\";s:7:\"country\";s:2:\"ch\";s:8:\"latitude\";d:46.208904;s:9:\"longitude\";d:6.141291;}}i:3;a:7:{s:4:\"type\";s:8:\"wordcamp\";s:5:\"title\";s:15:\"WordCamp Milano\";s:3:\"url\";s:32:\"https://2018.milano.wordcamp.org\";s:6:\"meetup\";N;s:10:\"meetup_url\";N;s:4:\"date\";s:19:\"2018-11-16 00:00:00\";s:8:\"location\";a:4:{s:8:\"location\";s:21:\"Milan, Lombardy/Italy\";s:7:\"country\";s:2:\"IT\";s:8:\"latitude\";d:45.5184464;s:9:\"longitude\";d:9.2131057;}}i:4;a:7:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:38:\"Erfahrung mit 12 verschiedenen Hostern\";s:3:\"url\";s:55:\"https://www.meetup.com/WordPress-Bern/events/247420416/\";s:6:\"meetup\";s:14:\"WordPress Bern\";s:10:\"meetup_url\";s:38:\"https://www.meetup.com/WordPress-Bern/\";s:4:\"date\";s:19:\"2018-11-22 18:00:00\";s:8:\"location\";a:4:{s:8:\"location\";s:17:\"Bern, Switzerland\";s:7:\"country\";s:2:\"ch\";s:8:\"latitude\";d:46.948257;s:9:\"longitude\";d:7.442258;}}}}', 'no'),
(355, 'polylang', 'a:15:{s:7:\"browser\";i:1;s:7:\"rewrite\";i:1;s:12:\"hide_default\";i:1;s:10:\"force_lang\";i:1;s:13:\"redirect_lang\";i:0;s:13:\"media_support\";i:1;s:9:\"uninstall\";i:0;s:4:\"sync\";a:0:{}s:10:\"post_types\";a:1:{i:0;s:12:\"tribe_events\";}s:10:\"taxonomies\";a:1:{i:0;s:16:\"tribe_events_cat\";}s:7:\"domains\";a:0:{}s:7:\"version\";s:6:\"2.3.11\";s:16:\"first_activation\";i:1539931549;s:12:\"default_lang\";s:2:\"fr\";s:9:\"nav_menus\";a:2:{s:15:\"twentyseventeen\";a:2:{s:3:\"top\";a:2:{s:2:\"fr\";i:5;s:2:\"de\";i:14;}s:6:\"social\";a:2:{s:2:\"fr\";i:0;s:2:\"de\";i:0;}}s:7:\"radiate\";a:1:{s:7:\"primary\";a:2:{s:2:\"fr\";i:5;s:2:\"de\";i:14;}}}}', 'yes'),
(356, 'polylang_wpml_strings', 'a:0:{}', 'yes'),
(357, 'widget_polylang', 'a:3:{i:3;a:7:{s:5:\"title\";s:0:\"\";s:8:\"dropdown\";i:0;s:10:\"show_names\";i:0;s:10:\"show_flags\";i:1;s:10:\"force_home\";i:0;s:12:\"hide_current\";i:0;s:22:\"hide_if_no_translation\";i:0;}i:7;a:7:{s:5:\"title\";s:0:\"\";s:8:\"dropdown\";i:0;s:10:\"show_names\";i:1;s:10:\"show_flags\";i:1;s:10:\"force_home\";i:0;s:12:\"hide_current\";i:0;s:22:\"hide_if_no_translation\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(358, 'widget_knews_widget', 'a:2:{i:2;a:8:{s:8:\"subtitle\";s:1:\"0\";s:4:\"name\";s:3:\"off\";s:7:\"surname\";s:3:\"off\";s:10:\"labelwhere\";s:7:\"outside\";s:5:\"terms\";s:1:\"0\";s:12:\"requiredtext\";s:1:\"1\";s:8:\"multiple\";s:6:\"select\";s:9:\"customCSS\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(360, 'KnewsAdminOptions', 'a:50:{s:10:\"smtp_knews\";s:1:\"0\";s:15:\"from_mail_knews\";s:35:\"julien.reichenbach@students.hevs.ch\";s:15:\"from_name_knews\";s:11:\"Knews robot\";s:15:\"smtp_host_knews\";s:19:\"smtp.yourdomain.com\";s:15:\"smtp_port_knews\";s:2:\"25\";s:15:\"smtp_user_knews\";s:0:\"\";s:15:\"smtp_pass_knews\";s:0:\"\";s:17:\"smtp_secure_knews\";s:0:\"\";s:12:\"smtp_default\";i:1;s:19:\"multilanguage_knews\";s:3:\"off\";s:16:\"no_warn_ml_knews\";s:2:\"no\";s:18:\"no_warn_cron_knews\";s:2:\"no\";s:11:\"cron_callme\";s:1:\"0\";s:12:\"config_knews\";s:2:\"no\";s:12:\"update_knews\";s:2:\"no\";s:10:\"write_logs\";s:2:\"no\";s:10:\"knews_cron\";s:6:\"cronwp\";s:10:\"update_pro\";s:2:\"no\";s:13:\"videotutorial\";s:2:\"no\";s:14:\"def_autom_post\";s:1:\"0\";s:16:\"apply_filters_on\";s:1:\"1\";s:17:\"edited_autom_post\";s:1:\"0\";s:9:\"hide_shop\";s:1:\"0\";s:14:\"hide_templates\";s:1:\"0\";s:9:\"bounce_on\";s:1:\"0\";s:11:\"is_sendmail\";s:1:\"0\";s:12:\"bounce_email\";s:21:\"bounce@yourdomain.com\";s:11:\"bounce_host\";s:19:\"mail.yourdomain.com\";s:11:\"bounce_port\";s:3:\"110\";s:11:\"bounce_user\";s:21:\"bounce@yourdomain.com\";s:11:\"bounce_pass\";s:0:\"\";s:10:\"bounce_ssl\";s:2:\"no\";s:11:\"bounce_mode\";s:10:\"returnpath\";s:14:\"new_users_list\";s:1:\"0\";s:18:\"registration_email\";s:0:\"\";s:19:\"registration_serial\";s:0:\"\";s:9:\"check_bot\";s:1:\"1\";s:10:\"newsletter\";s:2:\"no\";s:20:\"notify_signups_email\";s:0:\"\";s:12:\"double_optin\";i:1;s:21:\"double_optin_register\";i:0;s:14:\"pixel_tracking\";i:0;s:10:\"https_conn\";i:0;s:20:\"allowed_content_tags\";s:34:\"<br><i><em><b><strong><ul><li><ol>\";s:15:\"email_blacklist\";i:1;s:14:\"blacklist_scan\";i:0;s:14:\"excerpt_length\";i:20;s:10:\"crop_knews\";s:3:\"yes\";s:25:\"should_advice_bounce_mode\";i:0;s:13:\"showing_knews\";i:0;}', 'yes'),
(361, 'knews_since', '1.8.7', 'yes'),
(362, 'knews_version', '1.8.7', 'yes'),
(363, 'user_role_editor', 'a:2:{s:11:\"ure_version\";s:4:\"4.46\";s:19:\"ure_hide_pro_banner\";i:1;}', 'yes'),
(364, 'wp_backup_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:101:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:25:\"read_private_tribe_events\";b:1;s:17:\"edit_tribe_events\";b:1;s:24:\"edit_others_tribe_events\";b:1;s:25:\"edit_private_tribe_events\";b:1;s:27:\"edit_published_tribe_events\";b:1;s:19:\"delete_tribe_events\";b:1;s:26:\"delete_others_tribe_events\";b:1;s:27:\"delete_private_tribe_events\";b:1;s:29:\"delete_published_tribe_events\";b:1;s:20:\"publish_tribe_events\";b:1;s:25:\"read_private_tribe_venues\";b:1;s:17:\"edit_tribe_venues\";b:1;s:24:\"edit_others_tribe_venues\";b:1;s:25:\"edit_private_tribe_venues\";b:1;s:27:\"edit_published_tribe_venues\";b:1;s:19:\"delete_tribe_venues\";b:1;s:26:\"delete_others_tribe_venues\";b:1;s:27:\"delete_private_tribe_venues\";b:1;s:29:\"delete_published_tribe_venues\";b:1;s:20:\"publish_tribe_venues\";b:1;s:29:\"read_private_tribe_organizers\";b:1;s:21:\"edit_tribe_organizers\";b:1;s:28:\"edit_others_tribe_organizers\";b:1;s:29:\"edit_private_tribe_organizers\";b:1;s:31:\"edit_published_tribe_organizers\";b:1;s:23:\"delete_tribe_organizers\";b:1;s:30:\"delete_others_tribe_organizers\";b:1;s:31:\"delete_private_tribe_organizers\";b:1;s:33:\"delete_published_tribe_organizers\";b:1;s:24:\"publish_tribe_organizers\";b:1;s:31:\"read_private_aggregator-records\";b:1;s:23:\"edit_aggregator-records\";b:1;s:30:\"edit_others_aggregator-records\";b:1;s:31:\"edit_private_aggregator-records\";b:1;s:33:\"edit_published_aggregator-records\";b:1;s:25:\"delete_aggregator-records\";b:1;s:32:\"delete_others_aggregator-records\";b:1;s:33:\"delete_private_aggregator-records\";b:1;s:35:\"delete_published_aggregator-records\";b:1;s:26:\"publish_aggregator-records\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:74:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:25:\"read_private_tribe_events\";b:1;s:17:\"edit_tribe_events\";b:1;s:24:\"edit_others_tribe_events\";b:1;s:25:\"edit_private_tribe_events\";b:1;s:27:\"edit_published_tribe_events\";b:1;s:19:\"delete_tribe_events\";b:1;s:26:\"delete_others_tribe_events\";b:1;s:27:\"delete_private_tribe_events\";b:1;s:29:\"delete_published_tribe_events\";b:1;s:20:\"publish_tribe_events\";b:1;s:25:\"read_private_tribe_venues\";b:1;s:17:\"edit_tribe_venues\";b:1;s:24:\"edit_others_tribe_venues\";b:1;s:25:\"edit_private_tribe_venues\";b:1;s:27:\"edit_published_tribe_venues\";b:1;s:19:\"delete_tribe_venues\";b:1;s:26:\"delete_others_tribe_venues\";b:1;s:27:\"delete_private_tribe_venues\";b:1;s:29:\"delete_published_tribe_venues\";b:1;s:20:\"publish_tribe_venues\";b:1;s:29:\"read_private_tribe_organizers\";b:1;s:21:\"edit_tribe_organizers\";b:1;s:28:\"edit_others_tribe_organizers\";b:1;s:29:\"edit_private_tribe_organizers\";b:1;s:31:\"edit_published_tribe_organizers\";b:1;s:23:\"delete_tribe_organizers\";b:1;s:30:\"delete_others_tribe_organizers\";b:1;s:31:\"delete_private_tribe_organizers\";b:1;s:33:\"delete_published_tribe_organizers\";b:1;s:24:\"publish_tribe_organizers\";b:1;s:31:\"read_private_aggregator-records\";b:1;s:23:\"edit_aggregator-records\";b:1;s:30:\"edit_others_aggregator-records\";b:1;s:31:\"edit_private_aggregator-records\";b:1;s:33:\"edit_published_aggregator-records\";b:1;s:25:\"delete_aggregator-records\";b:1;s:32:\"delete_others_aggregator-records\";b:1;s:33:\"delete_private_aggregator-records\";b:1;s:35:\"delete_published_aggregator-records\";b:1;s:26:\"publish_aggregator-records\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:30:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:17:\"edit_tribe_events\";b:1;s:27:\"edit_published_tribe_events\";b:1;s:19:\"delete_tribe_events\";b:1;s:29:\"delete_published_tribe_events\";b:1;s:20:\"publish_tribe_events\";b:1;s:17:\"edit_tribe_venues\";b:1;s:27:\"edit_published_tribe_venues\";b:1;s:19:\"delete_tribe_venues\";b:1;s:29:\"delete_published_tribe_venues\";b:1;s:20:\"publish_tribe_venues\";b:1;s:21:\"edit_tribe_organizers\";b:1;s:31:\"edit_published_tribe_organizers\";b:1;s:23:\"delete_tribe_organizers\";b:1;s:33:\"delete_published_tribe_organizers\";b:1;s:24:\"publish_tribe_organizers\";b:1;s:23:\"edit_aggregator-records\";b:1;s:33:\"edit_published_aggregator-records\";b:1;s:25:\"delete_aggregator-records\";b:1;s:35:\"delete_published_aggregator-records\";b:1;s:26:\"publish_aggregator-records\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:13:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:17:\"edit_tribe_events\";b:1;s:19:\"delete_tribe_events\";b:1;s:17:\"edit_tribe_venues\";b:1;s:19:\"delete_tribe_venues\";b:1;s:21:\"edit_tribe_organizers\";b:1;s:23:\"delete_tribe_organizers\";b:1;s:23:\"edit_aggregator-records\";b:1;s:25:\"delete_aggregator-records\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'no'),
(365, 'ure_tasks_queue', 'a:0:{}', 'yes'),
(366, 'wp_support_plus_version', '9.1.1', 'yes'),
(367, 'wpsp_settings_general', 'a:26:{s:12:\"company_logo\";s:130:\"http://localhost:8080/chanter.ch/wp-content/plugins/wp-support-plus-responsive-ticket-system/asset/images/default_company_logo.png\";s:12:\"support_page\";s:2:\"53\";s:17:\"theme_integration\";a:4:{s:8:\"customer\";s:1:\"1\";s:5:\"agent\";s:1:\"1\";s:10:\"supervisor\";s:1:\"1\";s:13:\"administrator\";s:1:\"1\";}s:14:\"load_bootstrap\";s:1:\"1\";s:19:\"support_btn_new_tab\";s:1:\"0\";s:16:\"default_category\";s:1:\"2\";s:14:\"default_status\";s:1:\"1\";s:19:\"close_ticket_status\";s:1:\"1\";s:16:\"default_priority\";s:1:\"1\";s:18:\"agent_reply_status\";s:0:\"\";s:21:\"customer_reply_status\";s:0:\"\";s:16:\"allow_cust_close\";s:1:\"1\";s:18:\"ticket_id_sequence\";s:1:\"1\";s:19:\"reply_form_position\";s:1:\"1\";s:11:\"date_format\";s:8:\"yy-mm-dd\";s:19:\"display_date_format\";s:11:\"Y/m/d H:i:s\";s:18:\"custom_date_format\";s:5:\"Y/m/d\";s:15:\"attachment_size\";s:2:\"20\";s:18:\"allow_guest_ticket\";s:1:\"1\";s:21:\"staff_read_all_ticket\";s:1:\"0\";s:12:\"ticket_lable\";s:6:\"Ticket\";s:16:\"ticket_id_prefix\";s:1:\"#\";s:13:\"default_login\";s:1:\"1\";s:12:\"custom_login\";s:0:\"\";s:21:\"allow_powered_by_text\";s:1:\"1\";s:21:\"make_ticket_as_public\";s:1:\"0\";}', 'yes'),
(368, 'wpsp_settings_support_btn', 'a:3:{s:17:\"support_btn_label\";s:9:\"Help-Desk\";s:7:\"img_url\";s:121:\"http://localhost:8080/chanter.ch/wp-content/plugins/wp-support-plus-responsive-ticket-system/asset/images/icons/agent.png\";s:17:\"allow_support_btn\";i:0;}', 'yes'),
(369, 'wpsp_ticket_list_default_filters', 'a:8:{s:22:\"customer_hide_statuses\";a:0:{}s:16:\"customer_orderby\";s:13:\"t.update_time\";s:22:\"customer_orderby_order\";s:4:\"DESC\";s:25:\"customer_par_page_tickets\";i:20;s:19:\"agent_hide_statuses\";a:0:{}s:13:\"agent_orderby\";s:13:\"t.update_time\";s:19:\"agent_orderby_order\";s:4:\"DESC\";s:22:\"agent_par_page_tickets\";i:20;}', 'yes'),
(370, 'wpsp_agent_settings', 'a:6:{s:25:\"agent_allow_assign_ticket\";i:0;s:25:\"agent_allow_delete_ticket\";i:0;s:28:\"agent_allow_change_raised_by\";i:0;s:39:\"agent_allow_read_only_unassigned_ticket\";i:1;s:30:\"supervisor_allow_delete_ticket\";i:0;s:33:\"supervisor_allow_change_raised_by\";i:0;}', 'yes'),
(371, 'wpsp_custom_css', '', 'yes'),
(372, 'wpsp_text_footer', '', 'yes'),
(373, 'wpsp_custom_status_localize', 'a:3:{s:7:\"label_1\";s:4:\"Open\";s:7:\"label_2\";s:7:\"Pending\";s:7:\"label_3\";s:6:\"Closed\";}', 'yes'),
(374, 'wpsp_custom_category_localize', 'a:5:{s:7:\"label_1\";s:5:\"Autre\";s:7:\"label_2\";s:26:\"Proposition d\\\'événement\";s:7:\"label_3\";s:27:\"Création de petite annonce\";s:7:\"label_4\";s:8:\"Paiement\";s:7:\"label_5\";s:9:\"Dépanage\";}', 'yes'),
(375, 'wpsp_custom_priority_localize', 'a:4:{s:7:\"label_1\";s:6:\"Normal\";s:7:\"label_2\";s:4:\"High\";s:7:\"label_3\";s:6:\"Medium\";s:7:\"label_4\";s:3:\"Low\";}', 'yes'),
(376, 'wpsp_thank_you_page', 'a:1:{s:4:\"body\";s:139:\"<p>Dear {customer_name},</p><p>Thank you for creating ticket. Our agent will shortly look after this and get back as soon as possible.</p>\";}', 'yes'),
(377, 'wpsp_ticket_widget_order', 'a:5:{s:13:\"ticket-status\";s:13:\"Ticket Status\";s:9:\"raised-by\";s:9:\"Raised By\";s:14:\"assigned-agent\";s:15:\"Assigned Agents\";s:17:\"agent-only-fields\";s:17:\"Agent Only Fields\";s:13:\"ticket-fields\";s:13:\"Ticket Fields\";}', 'yes'),
(378, 'wpsp_ticket_active_pre_value', 'a:1:{s:13:\"ticket_active\";s:1:\"1\";}', 'yes'),
(379, 'wp_support_plus_upgrade_version', '9.1.1', 'yes'),
(388, 'wpsp_installation', '5', 'yes'),
(390, 'knews_advice_time', '1540203320', 'yes'),
(391, 'knews_advice_response', '0', 'yes'),
(405, 'ure_role_additional_options_values', 'a:7:{s:9:\"webmaster\";a:0:{}s:9:\"fscvadmin\";a:0:{}s:11:\"groupsadmin\";a:0:{}s:11:\"choeuradmin\";a:0:{}s:6:\"editor\";a:0:{}s:10:\"traducteur\";a:0:{}s:12:\"gestionliste\";a:0:{}}', 'yes'),
(424, 'newsletter_logger_secret', 'c9b8d268', 'yes'),
(426, 'newsletter_main_first_install_time', '1539937830', 'no'),
(427, 'newsletter_main', 'a:30:{s:11:\"return_path\";s:0:\"\";s:8:\"reply_to\";s:0:\"\";s:12:\"sender_email\";s:20:\"newsletter@localhost\";s:11:\"sender_name\";s:4:\"FSCV\";s:6:\"editor\";i:0;s:13:\"scheduler_max\";i:100;s:9:\"phpmailer\";i:0;s:5:\"debug\";i:0;s:5:\"track\";i:1;s:3:\"css\";s:0:\"\";s:12:\"css_disabled\";i:0;s:2:\"ip\";s:0:\"\";s:4:\"page\";i:54;s:19:\"disable_cron_notice\";i:0;s:11:\"header_logo\";s:0:\"\";s:12:\"header_title\";s:4:\"FSCV\";s:10:\"header_sub\";s:27:\"Un site utilisant WordPress\";s:12:\"footer_title\";s:0:\"\";s:14:\"footer_contact\";s:0:\"\";s:12:\"footer_legal\";s:0:\"\";s:12:\"facebook_url\";s:0:\"\";s:11:\"twitter_url\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:14:\"googleplus_url\";s:0:\"\";s:13:\"pinterest_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:10:\"tumblr_url\";s:0:\"\";s:11:\"youtube_url\";s:0:\"\";s:9:\"vimeo_url\";s:0:\"\";s:14:\"soundcloud_url\";s:0:\"\";}', 'yes'),
(428, 'newsletter_main_info', 'a:16:{s:11:\"header_logo\";a:1:{s:2:\"id\";i:0;}s:12:\"header_title\";s:4:\"FSCV\";s:10:\"header_sub\";s:27:\"Un site utilisant WordPress\";s:12:\"footer_title\";s:0:\"\";s:14:\"footer_contact\";s:0:\"\";s:12:\"footer_legal\";s:0:\"\";s:12:\"facebook_url\";s:0:\"\";s:11:\"twitter_url\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:14:\"googleplus_url\";s:0:\"\";s:13:\"pinterest_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:10:\"tumblr_url\";s:0:\"\";s:11:\"youtube_url\";s:0:\"\";s:9:\"vimeo_url\";s:0:\"\";s:14:\"soundcloud_url\";s:0:\"\";}', 'yes'),
(429, 'newsletter_main_smtp', 'a:7:{s:7:\"enabled\";i:0;s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:4:\"pass\";s:0:\"\";s:4:\"port\";i:25;s:6:\"secure\";s:0:\"\";s:12:\"ssl_insecure\";i:0;}', 'yes'),
(430, 'newsletter_main_version', '1.5.0', 'yes'),
(431, 'newsletter_subscription_first_install_time', '1539937831', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(432, 'newsletter', 'a:20:{s:14:\"noconfirmation\";i:1;s:9:\"antiflood\";i:10;s:12:\"ip_blacklist\";a:0:{}s:17:\"address_blacklist\";a:0:{}s:12:\"domain_check\";i:0;s:7:\"akismet\";i:0;s:7:\"captcha\";i:0;s:12:\"notify_email\";s:35:\"julien.reichenbach@students.hevs.ch\";s:8:\"multiple\";i:1;s:6:\"notify\";i:0;s:10:\"error_text\";s:139:\"<p>Vous ne pouvez pas vous inscrire avec l’adresse de messagerie que vous avez saisie, veuillez contacter l’administrateur du site.</p>\";s:17:\"subscription_text\";s:19:\"{subscription_form}\";s:17:\"confirmation_text\";s:104:\"<p>A confirmation email is on the way. Follow the instructions and check the spam folder. Thank you.</p>\";s:20:\"confirmation_subject\";s:35:\"Veuillez confirmer votre abonnement\";s:21:\"confirmation_tracking\";s:0:\"\";s:20:\"confirmation_message\";s:99:\"<p>Veuillez confirmer votre abonnement <a href=\"{subscription_confirm_url}\">en cliquant ici</a></p>\";s:14:\"confirmed_text\";s:41:\"<p>Votre abonnement a été confirmé</p>\";s:17:\"confirmed_subject\";s:9:\"Bienvenue\";s:17:\"confirmed_message\";s:139:\"<p>Ce message confirme votre abonnement à notre newsletter. Je vous remercie !</p><hr><p><a href=\"{profile_url}\">Changez votre profil</p>\";s:18:\"confirmed_tracking\";s:0:\"\";}', 'yes'),
(433, 'newsletter_subscription_lists', 'a:160:{s:6:\"list_1\";s:0:\"\";s:13:\"list_1_status\";i:0;s:14:\"list_1_checked\";i:0;s:13:\"list_1_forced\";i:0;s:6:\"list_2\";s:0:\"\";s:13:\"list_2_status\";i:0;s:14:\"list_2_checked\";i:0;s:13:\"list_2_forced\";i:0;s:6:\"list_3\";s:0:\"\";s:13:\"list_3_status\";i:0;s:14:\"list_3_checked\";i:0;s:13:\"list_3_forced\";i:0;s:6:\"list_4\";s:0:\"\";s:13:\"list_4_status\";i:0;s:14:\"list_4_checked\";i:0;s:13:\"list_4_forced\";i:0;s:6:\"list_5\";s:0:\"\";s:13:\"list_5_status\";i:0;s:14:\"list_5_checked\";i:0;s:13:\"list_5_forced\";i:0;s:6:\"list_6\";s:0:\"\";s:13:\"list_6_status\";i:0;s:14:\"list_6_checked\";i:0;s:13:\"list_6_forced\";i:0;s:6:\"list_7\";s:0:\"\";s:13:\"list_7_status\";i:0;s:14:\"list_7_checked\";i:0;s:13:\"list_7_forced\";i:0;s:6:\"list_8\";s:0:\"\";s:13:\"list_8_status\";i:0;s:14:\"list_8_checked\";i:0;s:13:\"list_8_forced\";i:0;s:6:\"list_9\";s:0:\"\";s:13:\"list_9_status\";i:0;s:14:\"list_9_checked\";i:0;s:13:\"list_9_forced\";i:0;s:7:\"list_10\";s:0:\"\";s:14:\"list_10_status\";i:0;s:15:\"list_10_checked\";i:0;s:14:\"list_10_forced\";i:0;s:7:\"list_11\";s:0:\"\";s:14:\"list_11_status\";i:0;s:15:\"list_11_checked\";i:0;s:14:\"list_11_forced\";i:0;s:7:\"list_12\";s:0:\"\";s:14:\"list_12_status\";i:0;s:15:\"list_12_checked\";i:0;s:14:\"list_12_forced\";i:0;s:7:\"list_13\";s:0:\"\";s:14:\"list_13_status\";i:0;s:15:\"list_13_checked\";i:0;s:14:\"list_13_forced\";i:0;s:7:\"list_14\";s:0:\"\";s:14:\"list_14_status\";i:0;s:15:\"list_14_checked\";i:0;s:14:\"list_14_forced\";i:0;s:7:\"list_15\";s:0:\"\";s:14:\"list_15_status\";i:0;s:15:\"list_15_checked\";i:0;s:14:\"list_15_forced\";i:0;s:7:\"list_16\";s:0:\"\";s:14:\"list_16_status\";i:0;s:15:\"list_16_checked\";i:0;s:14:\"list_16_forced\";i:0;s:7:\"list_17\";s:0:\"\";s:14:\"list_17_status\";i:0;s:15:\"list_17_checked\";i:0;s:14:\"list_17_forced\";i:0;s:7:\"list_18\";s:0:\"\";s:14:\"list_18_status\";i:0;s:15:\"list_18_checked\";i:0;s:14:\"list_18_forced\";i:0;s:7:\"list_19\";s:0:\"\";s:14:\"list_19_status\";i:0;s:15:\"list_19_checked\";i:0;s:14:\"list_19_forced\";i:0;s:7:\"list_20\";s:0:\"\";s:14:\"list_20_status\";i:0;s:15:\"list_20_checked\";i:0;s:14:\"list_20_forced\";i:0;s:7:\"list_21\";s:0:\"\";s:14:\"list_21_status\";i:0;s:15:\"list_21_checked\";i:0;s:14:\"list_21_forced\";i:0;s:7:\"list_22\";s:0:\"\";s:14:\"list_22_status\";i:0;s:15:\"list_22_checked\";i:0;s:14:\"list_22_forced\";i:0;s:7:\"list_23\";s:0:\"\";s:14:\"list_23_status\";i:0;s:15:\"list_23_checked\";i:0;s:14:\"list_23_forced\";i:0;s:7:\"list_24\";s:0:\"\";s:14:\"list_24_status\";i:0;s:15:\"list_24_checked\";i:0;s:14:\"list_24_forced\";i:0;s:7:\"list_25\";s:0:\"\";s:14:\"list_25_status\";i:0;s:15:\"list_25_checked\";i:0;s:14:\"list_25_forced\";i:0;s:7:\"list_26\";s:0:\"\";s:14:\"list_26_status\";i:0;s:15:\"list_26_checked\";i:0;s:14:\"list_26_forced\";i:0;s:7:\"list_27\";s:0:\"\";s:14:\"list_27_status\";i:0;s:15:\"list_27_checked\";i:0;s:14:\"list_27_forced\";i:0;s:7:\"list_28\";s:0:\"\";s:14:\"list_28_status\";i:0;s:15:\"list_28_checked\";i:0;s:14:\"list_28_forced\";i:0;s:7:\"list_29\";s:0:\"\";s:14:\"list_29_status\";i:0;s:15:\"list_29_checked\";i:0;s:14:\"list_29_forced\";i:0;s:7:\"list_30\";s:0:\"\";s:14:\"list_30_status\";i:0;s:15:\"list_30_checked\";i:0;s:14:\"list_30_forced\";i:0;s:7:\"list_31\";s:0:\"\";s:14:\"list_31_status\";i:0;s:15:\"list_31_checked\";i:0;s:14:\"list_31_forced\";i:0;s:7:\"list_32\";s:0:\"\";s:14:\"list_32_status\";i:0;s:15:\"list_32_checked\";i:0;s:14:\"list_32_forced\";i:0;s:7:\"list_33\";s:0:\"\";s:14:\"list_33_status\";i:0;s:15:\"list_33_checked\";i:0;s:14:\"list_33_forced\";i:0;s:7:\"list_34\";s:0:\"\";s:14:\"list_34_status\";i:0;s:15:\"list_34_checked\";i:0;s:14:\"list_34_forced\";i:0;s:7:\"list_35\";s:0:\"\";s:14:\"list_35_status\";i:0;s:15:\"list_35_checked\";i:0;s:14:\"list_35_forced\";i:0;s:7:\"list_36\";s:0:\"\";s:14:\"list_36_status\";i:0;s:15:\"list_36_checked\";i:0;s:14:\"list_36_forced\";i:0;s:7:\"list_37\";s:0:\"\";s:14:\"list_37_status\";i:0;s:15:\"list_37_checked\";i:0;s:14:\"list_37_forced\";i:0;s:7:\"list_38\";s:0:\"\";s:14:\"list_38_status\";i:0;s:15:\"list_38_checked\";i:0;s:14:\"list_38_forced\";i:0;s:7:\"list_39\";s:0:\"\";s:14:\"list_39_status\";i:0;s:15:\"list_39_checked\";i:0;s:14:\"list_39_forced\";i:0;s:7:\"list_40\";s:0:\"\";s:14:\"list_40_status\";i:0;s:15:\"list_40_checked\";i:0;s:14:\"list_40_forced\";i:0;}', 'yes'),
(434, 'newsletter_subscription_template', 'a:1:{s:8:\"template\";s:2359:\"<!DOCTYPE html>\n<html>\n    <head>\n        <!-- General styles, not used by all email clients -->\n        <style type=\"text/css\" media=\"all\">\n            a {\n                text-decoration: none;\n                color: #0088cc;\n            }\n            hr {\n                border-top: 1px solid #999;\n            }\n        </style>\n    </head>\n\n    <!-- KEEP THE LAYOUT SIMPLE: THOSE ARE SERVICE MESSAGES. -->\n    <body style=\"margin: 0; padding: 0;\">\n\n        <!-- Top title with dark background -->\n        <table style=\"background-color: #444; width: 100%;\" cellspacing=\"0\" cellpadding=\"0\">\n            <tr>\n                <td style=\"padding: 20px; text-align: center; font-family: sans-serif; color: #fff; font-size: 28px\">\n                    {blog_title}\n                </td>\n            </tr>\n        </table>\n\n        <!-- Main table 100% wide with background color #eee -->    \n        <table style=\"background-color: #eee; width: 100%;\">\n            <tr>\n                <td align=\"center\" style=\"padding: 15px;\">\n\n                    <!-- Content table with backgdound color #fff, width 500px -->\n                    <table style=\"background-color: #fff; max-width: 600px; width: 100%; border: 1px solid #ddd;\">\n                        <tr>\n                            <td style=\"padding: 15px; color: #333; font-size: 16px; font-family: sans-serif\">\n                                <!-- The {message} tag is replaced with one of confirmation, welcome or goodbye messages -->\n                                <!-- Messages content can be configured on Newsletter List Building panels --> \n\n                                {message}\n\n                                <hr>\n                                <!-- Signature if not already added to single messages (surround with <p>) -->\n                                <p>\n                                    <small>\n                                        <a href=\"{blog_url}\">{blog_url}</a><br>\n                                        {company_name}<br>\n                                        {company_address}\n                                    </small>\n                                </p>\n                                \n\n                            </td>\n                        </tr>\n                    </table>\n\n                </td>\n            </tr>\n        </table>\n\n    </body>\n</html>\";}', 'yes'),
(435, 'newsletter_profile', 'a:183:{s:5:\"email\";s:5:\"Email\";s:11:\"email_error\";s:46:\"L’adresse de messagerie n’est pas correcte\";s:4:\"name\";s:22:\"Prénom ou nom complet\";s:10:\"name_error\";s:22:\"Le nom est obligatoire\";s:11:\"name_status\";i:0;s:10:\"name_rules\";i:0;s:7:\"surname\";s:14:\"Nom de famille\";s:13:\"surname_error\";s:22:\"Le nom est obligatoire\";s:14:\"surname_status\";i:0;s:10:\"sex_status\";i:0;s:3:\"sex\";s:7:\"Je suis\";s:7:\"privacy\";s:61:\"En continuant, vous acceptez la politique de confidentialité\";s:13:\"privacy_error\";s:34:\"You must accept the privacy policy\";s:14:\"privacy_status\";i:0;s:11:\"privacy_url\";s:0:\"\";s:18:\"privacy_use_wp_url\";i:0;s:9:\"subscribe\";s:9:\"S\'abonner\";s:12:\"title_female\";s:4:\"Mme.\";s:10:\"title_male\";s:2:\"M.\";s:10:\"title_none\";s:4:\"Cher\";s:8:\"sex_male\";s:3:\"Man\";s:10:\"sex_female\";s:5:\"Woman\";s:8:\"sex_none\";s:13:\"Not specified\";s:16:\"profile_1_status\";i:0;s:9:\"profile_1\";s:0:\"\";s:14:\"profile_1_type\";s:4:\"text\";s:21:\"profile_1_placeholder\";s:0:\"\";s:15:\"profile_1_rules\";i:0;s:17:\"profile_1_options\";s:0:\"\";s:16:\"profile_2_status\";i:0;s:9:\"profile_2\";s:0:\"\";s:14:\"profile_2_type\";s:4:\"text\";s:21:\"profile_2_placeholder\";s:0:\"\";s:15:\"profile_2_rules\";i:0;s:17:\"profile_2_options\";s:0:\"\";s:16:\"profile_3_status\";i:0;s:9:\"profile_3\";s:0:\"\";s:14:\"profile_3_type\";s:4:\"text\";s:21:\"profile_3_placeholder\";s:0:\"\";s:15:\"profile_3_rules\";i:0;s:17:\"profile_3_options\";s:0:\"\";s:16:\"profile_4_status\";i:0;s:9:\"profile_4\";s:0:\"\";s:14:\"profile_4_type\";s:4:\"text\";s:21:\"profile_4_placeholder\";s:0:\"\";s:15:\"profile_4_rules\";i:0;s:17:\"profile_4_options\";s:0:\"\";s:16:\"profile_5_status\";i:0;s:9:\"profile_5\";s:0:\"\";s:14:\"profile_5_type\";s:4:\"text\";s:21:\"profile_5_placeholder\";s:0:\"\";s:15:\"profile_5_rules\";i:0;s:17:\"profile_5_options\";s:0:\"\";s:16:\"profile_6_status\";i:0;s:9:\"profile_6\";s:0:\"\";s:14:\"profile_6_type\";s:4:\"text\";s:21:\"profile_6_placeholder\";s:0:\"\";s:15:\"profile_6_rules\";i:0;s:17:\"profile_6_options\";s:0:\"\";s:16:\"profile_7_status\";i:0;s:9:\"profile_7\";s:0:\"\";s:14:\"profile_7_type\";s:4:\"text\";s:21:\"profile_7_placeholder\";s:0:\"\";s:15:\"profile_7_rules\";i:0;s:17:\"profile_7_options\";s:0:\"\";s:16:\"profile_8_status\";i:0;s:9:\"profile_8\";s:0:\"\";s:14:\"profile_8_type\";s:4:\"text\";s:21:\"profile_8_placeholder\";s:0:\"\";s:15:\"profile_8_rules\";i:0;s:17:\"profile_8_options\";s:0:\"\";s:16:\"profile_9_status\";i:0;s:9:\"profile_9\";s:0:\"\";s:14:\"profile_9_type\";s:4:\"text\";s:21:\"profile_9_placeholder\";s:0:\"\";s:15:\"profile_9_rules\";i:0;s:17:\"profile_9_options\";s:0:\"\";s:17:\"profile_10_status\";i:0;s:10:\"profile_10\";s:0:\"\";s:15:\"profile_10_type\";s:4:\"text\";s:22:\"profile_10_placeholder\";s:0:\"\";s:16:\"profile_10_rules\";i:0;s:18:\"profile_10_options\";s:0:\"\";s:17:\"profile_11_status\";i:0;s:10:\"profile_11\";s:0:\"\";s:15:\"profile_11_type\";s:4:\"text\";s:22:\"profile_11_placeholder\";s:0:\"\";s:16:\"profile_11_rules\";i:0;s:18:\"profile_11_options\";s:0:\"\";s:17:\"profile_12_status\";i:0;s:10:\"profile_12\";s:0:\"\";s:15:\"profile_12_type\";s:4:\"text\";s:22:\"profile_12_placeholder\";s:0:\"\";s:16:\"profile_12_rules\";i:0;s:18:\"profile_12_options\";s:0:\"\";s:17:\"profile_13_status\";i:0;s:10:\"profile_13\";s:0:\"\";s:15:\"profile_13_type\";s:4:\"text\";s:22:\"profile_13_placeholder\";s:0:\"\";s:16:\"profile_13_rules\";i:0;s:18:\"profile_13_options\";s:0:\"\";s:17:\"profile_14_status\";i:0;s:10:\"profile_14\";s:0:\"\";s:15:\"profile_14_type\";s:4:\"text\";s:22:\"profile_14_placeholder\";s:0:\"\";s:16:\"profile_14_rules\";i:0;s:18:\"profile_14_options\";s:0:\"\";s:17:\"profile_15_status\";i:0;s:10:\"profile_15\";s:0:\"\";s:15:\"profile_15_type\";s:4:\"text\";s:22:\"profile_15_placeholder\";s:0:\"\";s:16:\"profile_15_rules\";i:0;s:18:\"profile_15_options\";s:0:\"\";s:17:\"profile_16_status\";i:0;s:10:\"profile_16\";s:0:\"\";s:15:\"profile_16_type\";s:4:\"text\";s:22:\"profile_16_placeholder\";s:0:\"\";s:16:\"profile_16_rules\";i:0;s:18:\"profile_16_options\";s:0:\"\";s:17:\"profile_17_status\";i:0;s:10:\"profile_17\";s:0:\"\";s:15:\"profile_17_type\";s:4:\"text\";s:22:\"profile_17_placeholder\";s:0:\"\";s:16:\"profile_17_rules\";i:0;s:18:\"profile_17_options\";s:0:\"\";s:17:\"profile_18_status\";i:0;s:10:\"profile_18\";s:0:\"\";s:15:\"profile_18_type\";s:4:\"text\";s:22:\"profile_18_placeholder\";s:0:\"\";s:16:\"profile_18_rules\";i:0;s:18:\"profile_18_options\";s:0:\"\";s:17:\"profile_19_status\";i:0;s:10:\"profile_19\";s:0:\"\";s:15:\"profile_19_type\";s:4:\"text\";s:22:\"profile_19_placeholder\";s:0:\"\";s:16:\"profile_19_rules\";i:0;s:18:\"profile_19_options\";s:0:\"\";s:17:\"profile_20_status\";i:0;s:10:\"profile_20\";s:0:\"\";s:15:\"profile_20_type\";s:4:\"text\";s:22:\"profile_20_placeholder\";s:0:\"\";s:16:\"profile_20_rules\";i:0;s:18:\"profile_20_options\";s:0:\"\";s:13:\"list_1_forced\";i:0;s:13:\"list_2_forced\";i:0;s:13:\"list_3_forced\";i:0;s:13:\"list_4_forced\";i:0;s:13:\"list_5_forced\";i:0;s:13:\"list_6_forced\";i:0;s:13:\"list_7_forced\";i:0;s:13:\"list_8_forced\";i:0;s:13:\"list_9_forced\";i:0;s:14:\"list_10_forced\";i:0;s:14:\"list_11_forced\";i:0;s:14:\"list_12_forced\";i:0;s:14:\"list_13_forced\";i:0;s:14:\"list_14_forced\";i:0;s:14:\"list_15_forced\";i:0;s:14:\"list_16_forced\";i:0;s:14:\"list_17_forced\";i:0;s:14:\"list_18_forced\";i:0;s:14:\"list_19_forced\";i:0;s:14:\"list_20_forced\";i:0;s:14:\"list_21_forced\";i:0;s:14:\"list_22_forced\";i:0;s:14:\"list_23_forced\";i:0;s:14:\"list_24_forced\";i:0;s:14:\"list_25_forced\";i:0;s:14:\"list_26_forced\";i:0;s:14:\"list_27_forced\";i:0;s:14:\"list_28_forced\";i:0;s:14:\"list_29_forced\";i:0;s:14:\"list_30_forced\";i:0;s:14:\"list_31_forced\";i:0;s:14:\"list_32_forced\";i:0;s:14:\"list_33_forced\";i:0;s:14:\"list_34_forced\";i:0;s:14:\"list_35_forced\";i:0;s:14:\"list_36_forced\";i:0;s:14:\"list_37_forced\";i:0;s:14:\"list_38_forced\";i:0;s:14:\"list_39_forced\";i:0;s:14:\"list_40_forced\";i:0;}', 'yes'),
(436, 'newsletter_subscription_version', '2.1.7', 'yes'),
(437, 'newsletter_unsubscription_first_install_time', '1539937832', 'no'),
(438, 'newsletter_unsubscription', 'a:6:{s:16:\"unsubscribe_text\";s:121:\"<p>Veuillez confirmer que vous souhaitez vous désabonner <a href=\"{unsubscription_confirm_url}\">en cliquant ici</a>.</p>\";s:10:\"error_text\";s:102:\"<p>Abonné introuvable, il a probablement déjà été supprimé. Aucune autre action nécessaire.</p>\";s:17:\"unsubscribed_text\";s:138:\"<p>Votre abonnement a été supprimé. S’il s’agit d’une erreur, vous pouvez <a href=\"{reactivate_url}\">vous réabonner ici</a>.</p>\";s:20:\"unsubscribed_subject\";s:9:\"Au revoir\";s:20:\"unsubscribed_message\";s:87:\"<p>This message confirms that you have unsubscribed from our newsletter. Thank you.</p>\";s:16:\"reactivated_text\";s:46:\"<p>Your subscription has been reactivated.</p>\";}', 'yes'),
(439, 'newsletter_unsubscription_version', '1.0.0', 'yes'),
(440, 'newsletter_profile_first_install_time', '1539937832', 'no'),
(441, 'newsletter_profile_main', 'a:8:{s:4:\"text\";s:215:\"{profile_form}\n     <p>Si vous changez votre adresse de messagerie, un e-mail de confirmation vous sera envoyé pour l’activer.</p> \n     <p><a href=\"{unsubscription_confirm_url}\">Annuler votre abonnement</a> </p>\";s:13:\"email_changed\";s:94:\"Votre e-mail a été modifié, un e-mail d’activation a été envoyé avec des instructions.\";s:5:\"error\";s:67:\"Votre adresse de messagerie n’est pas valide ou déjà utilisée.\";s:10:\"save_label\";s:11:\"Enregistrer\";s:13:\"privacy_label\";s:36:\"Lisez notre note de confidentialité\";s:5:\"saved\";s:19:\"Profil enregistré.\";s:18:\"export_newsletters\";i:0;s:3:\"url\";s:0:\"\";}', 'yes'),
(442, 'newsletter_profile_version', '1.1.0', 'yes'),
(443, 'newsletter_emails_first_install_time', '1539937832', 'no'),
(444, 'newsletter_emails', 'a:1:{s:5:\"theme\";s:7:\"default\";}', 'yes'),
(445, 'newsletter_emails_theme_default', 'a:0:{}', 'no'),
(446, 'newsletter_emails_version', '1.1.5', 'yes'),
(447, 'newsletter_users_first_install_time', '1539937832', 'no'),
(448, 'newsletter_users', 'a:0:{}', 'yes'),
(449, 'newsletter_users_version', '1.2.4', 'yes'),
(450, 'newsletter_statistics_first_install_time', '1539937832', 'no'),
(451, 'newsletter_statistics', 'a:1:{s:3:\"key\";s:32:\"7557c102bf48d6cffef086c6dc77fc4e\";}', 'yes'),
(452, 'newsletter_statistics_version', '1.1.8', 'yes'),
(453, 'newsletter_install_time', '1539937833', 'no'),
(454, 'widget_newsletterwidget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(455, 'widget_newsletterwidgetminimal', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(456, 'newsletter_diagnostic_cron_calls', 'a:1:{i:0;i:1539937868;}', 'no'),
(457, 'newsletter_diagnostic_cron_data', '', 'no'),
(465, 'knews_custom_text_direction_fr_FR', 'ltr', 'yes'),
(466, 'knews_custom_widget_title_fr_FR', 'M\'abonner', 'yes'),
(467, 'knews_custom_widget_label_name_fr_FR', 'Nom :', 'yes'),
(468, 'knews_custom_widget_label_surname_fr_FR', 'Nom de famille :', 'yes'),
(469, 'knews_custom_widget_subtitle_fr_FR', 'Souscrivez à notre newsletter pour être tenus au courant :', 'yes'),
(470, 'knews_custom_widget_label_email_fr_FR', 'E-mail :', 'yes'),
(471, 'knews_custom_widget_label_terms_fr_FR', 'J\'accepte les conditions d\'utilisation', 'yes'),
(472, 'knews_custom_widget_required_fr_FR', '* Ce champs est obligatoire', 'yes'),
(473, 'knews_custom_widget_button_fr_FR', 'Envoyer', 'yes'),
(474, 'knews_custom_ajax_wrong_email_fr_FR', 'L\'e-mail semble incorrect, veuillez vérifier', 'yes'),
(475, 'knews_custom_ajax_wrong_fields_fr_FR', 'Veuillez vérifier les champs obligatoires', 'yes'),
(476, 'knews_custom_ajax_subscription_fr_FR', 'Un e-mail vous a été envoyé, vous demandant de confirmer votre abonnement', 'yes'),
(477, 'knews_custom_ajax_subscription_direct_fr_FR', 'Vous avez été correctement abonné.', 'yes'),
(478, 'knews_custom_ajax_subscription_oops_fr_FR', 'Vous vous êtes déjà abonné auparavant.', 'yes'),
(479, 'knews_custom_ajax_subscription_error_fr_FR', 'Erreur d\'envoi de l\'e-mail de confirmation', 'yes'),
(480, 'knews_custom_email_subscription_subject_fr_FR', 'Abonnement newsletter', 'yes'),
(481, 'knews_custom_email_subscription_body_fr_FR', '<p>Vous avez demandez à être abonné à la newsletter de #blog_name#, veuillez confirmer votre inscription en cliquant <a href=\"#url_confirm#\">ici</a></p><p>Vous pouvez coller l\'adresse sur le navigateur:<br>#url_confirm#</p>', 'yes'),
(482, 'knews_custom_email_importation_subject_fr_FR', 'Abonnement newsletter', 'yes'),
(483, 'knews_custom_email_importation_body_fr_FR', '<p>Vous vous êtes abonné à la newsletter de #blog_name#, veuillez confirmer votre inscription en cliquant <a href=\"#url_confirm#\">ici</a></p><p>Vous pouvez coller l\'adresse sur le navigateur:<br>#url_confirm#</p>', 'yes'),
(484, 'knews_custom_subscription_ok_title_fr_FR', 'Votre abonnement a été confirmé', 'yes'),
(485, 'knews_custom_subscription_ok_message_fr_FR', 'Vous allez commercer à recevoir dès à présent notre newsletter.<br><br><strong>Merci beaucoup.</strong>', 'yes'),
(486, 'knews_custom_subscription_error_title_fr_FR', 'Une erreur s\'est produite en vous abonnant', 'yes'),
(487, 'knews_custom_subscription_error_message_fr_FR', 'Veuillez essayer à nouveau. Si nécessaire, copiez le lien complet sur la barre d\'adresses de votre navigateur.<br><br><strong>Veuillez nous excuser</strong>', 'yes'),
(488, 'knews_custom_subscription_stop_error_title_fr_FR', 'Votre abonnement n\'a pas pu être annulé', 'yes'),
(489, 'knews_custom_subscription_stop_error_message_fr_FR', 'Veuillez essayer à nouveau. Si nécessaire, copiez le lien complet sur la barre d\'adresses de votre navigateur.<br><br><strong>Veuillez nous excuser</strong>', 'yes'),
(490, 'knews_custom_subscription_stop_ok_title_fr_FR', 'Votre abonnement a été annulé', 'yes'),
(491, 'knews_custom_subscription_stop_ok_message_fr_FR', 'Vous allez commercer à recevoir dès à présent notre newsletter.<br><br><strong>Merci beaucoup.</strong>', 'yes'),
(492, 'knews_custom_dialogs_close_button_fr_FR', 'Fermer', 'yes'),
(493, 'knews_custom_default_alignment_fr_FR', 'left', 'yes'),
(494, 'knews_custom_inverse_alignment_fr_FR', 'right', 'yes'),
(495, 'knews_custom_cant_read_text_1_fr_FR', 'Si vous ne pouvez pas lire cet e-mail, cliquez', 'yes'),
(496, 'knews_custom_cant_read_text_link_fr_FR', 'ici', 'yes'),
(497, 'knews_custom_cant_read_text_2_fr_FR', '', 'yes'),
(498, 'knews_custom_mobile_version_text_link_fr_FR', 'Version téléphone portable', 'yes'),
(499, 'knews_custom_desktop_version_text_link_fr_FR', 'Version ordinateur', 'yes'),
(500, 'knews_custom_unsubscribe_text_1_fr_FR', 'Si vous ne souhaitez pas recevoir nos e-mails, cliquez', 'yes'),
(501, 'knews_custom_unsubscribe_text_link_fr_FR', 'ici', 'yes'),
(502, 'knews_custom_unsubscribe_text_2_fr_FR', '', 'yes'),
(503, 'knews_custom_read_more_link_fr_FR', 'lire la suite', 'yes'),
(506, 'widget_mc4wp_form_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(507, 'mc4wp_version', '4.2.5', 'yes'),
(508, 'mc4wp_flash_messages', 'a:0:{}', 'no'),
(509, 'mc4wp', 'a:4:{s:7:\"api_key\";s:0:\"\";s:20:\"allow_usage_tracking\";i:0;s:15:\"debug_log_level\";s:7:\"warning\";s:18:\"first_activated_on\";i:1539938488;}', 'yes'),
(527, 'disable_comments_options', 'a:5:{s:19:\"disabled_post_types\";a:4:{i:0;s:4:\"post\";i:1;s:4:\"page\";i:2;s:10:\"attachment\";i:3;s:12:\"tribe_events\";}s:17:\"remove_everywhere\";b:1;s:9:\"permanent\";b:0;s:16:\"extra_post_types\";b:0;s:10:\"db_version\";i:6;}', 'yes'),
(533, '_site_transient_timeout_browser_4d90fb766c3b51de57fa42e860c03217', '1540546262', 'no'),
(534, '_site_transient_browser_4d90fb766c3b51de57fa42e860c03217', 'a:10:{s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"60.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:24:\"https://www.firefox.com/\";s:7:\"img_src\";s:44:\"http://s.w.org/images/browsers/firefox.png?1\";s:11:\"img_src_ssl\";s:45:\"https://s.w.org/images/browsers/firefox.png?1\";s:15:\"current_version\";s:2:\"56\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(543, 'author_cat_option', 'a:1:{s:11:\"check_multi\";s:1:\"1\";}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(573, 'mw_adminimize', 'a:183:{s:29:\"mw_adminimize_admin_bar_nodes\";a:40:{s:12:\"user-actions\";O:8:\"stdClass\":6:{s:2:\"id\";s:12:\"user-actions\";s:5:\"title\";b:0;s:6:\"parent\";s:10:\"my-account\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:9:\"user-info\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"user-info\";s:5:\"title\";s:298:\"<img alt=\'\' src=\'http://1.gravatar.com/avatar/1fcb930a5979b82289195938ce15a7db?s=64&#038;d=mm&#038;r=g\' srcset=\'http://1.gravatar.com/avatar/1fcb930a5979b82289195938ce15a7db?s=128&#038;d=mm&#038;r=g 2x\' class=\'avatar avatar-64 photo\' height=\'64\' width=\'64\' /><span class=\'display-name\'>admin</span>\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:53:\"http://localhost:8080/chanter.ch/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:8:\"tabindex\";i:-1;}}s:12:\"edit-profile\";O:8:\"stdClass\":6:{s:2:\"id\";s:12:\"edit-profile\";s:5:\"title\";s:19:\"Modifier mon profil\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:53:\"http://localhost:8080/chanter.ch/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:6:\"logout\";O:8:\"stdClass\":6:{s:2:\"id\";s:6:\"logout\";s:5:\"title\";s:15:\"Se déconnecter\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:83:\"http://localhost:8080/chanter.ch/wp-login.php?action=logout&amp;_wpnonce=e9786ec161\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:11:\"menu-toggle\";O:8:\"stdClass\":6:{s:2:\"id\";s:11:\"menu-toggle\";s:5:\"title\";s:73:\"<span class=\"ab-icon\"></span><span class=\"screen-reader-text\">Menu</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:1:\"#\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:10:\"my-account\";O:8:\"stdClass\":6:{s:2:\"id\";s:10:\"my-account\";s:5:\"title\";s:306:\"Bonjour, <span class=\"display-name\">admin</span><img alt=\'\' src=\'http://1.gravatar.com/avatar/1fcb930a5979b82289195938ce15a7db?s=26&#038;d=mm&#038;r=g\' srcset=\'http://1.gravatar.com/avatar/1fcb930a5979b82289195938ce15a7db?s=52&#038;d=mm&#038;r=g 2x\' class=\'avatar avatar-26 photo\' height=\'26\' width=\'26\' />\";s:6:\"parent\";s:13:\"top-secondary\";s:4:\"href\";s:53:\"http://localhost:8080/chanter.ch/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"class\";s:11:\"with-avatar\";}}s:7:\"wp-logo\";O:8:\"stdClass\":6:{s:2:\"id\";s:7:\"wp-logo\";s:5:\"title\";s:91:\"<span class=\"ab-icon\"></span><span class=\"screen-reader-text\">À propos de WordPress</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:51:\"http://localhost:8080/chanter.ch/wp-admin/about.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:5:\"about\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"about\";s:5:\"title\";s:22:\"À propos de WordPress\";s:6:\"parent\";s:7:\"wp-logo\";s:4:\"href\";s:51:\"http://localhost:8080/chanter.ch/wp-admin/about.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:5:\"wporg\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"wporg\";s:5:\"title\";s:20:\"Site de WordPress-FR\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:16:\"https://wpfr.net\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:13:\"documentation\";O:8:\"stdClass\":6:{s:2:\"id\";s:13:\"documentation\";s:5:\"title\";s:13:\"Documentation\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:28:\"https://codex.wordpress.org/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:14:\"support-forums\";O:8:\"stdClass\":6:{s:2:\"id\";s:14:\"support-forums\";s:5:\"title\";s:19:\"Forums d’entraide\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:25:\"https://wpfr.net/support/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"feedback\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"feedback\";s:5:\"title\";s:8:\"Remarque\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:57:\"https://wordpress.org/support/forum/requests-and-feedback\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"site-name\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"site-name\";s:5:\"title\";s:4:\"FSCV\";s:6:\"parent\";b:0;s:4:\"href\";s:33:\"http://localhost:8080/chanter.ch/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"view-site\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"view-site\";s:5:\"title\";s:17:\"Aller sur le site\";s:6:\"parent\";s:9:\"site-name\";s:4:\"href\";s:33:\"http://localhost:8080/chanter.ch/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:7:\"updates\";O:8:\"stdClass\":6:{s:2:\"id\";s:7:\"updates\";s:5:\"title\";s:130:\"<span class=\"ab-icon\"></span><span class=\"ab-label\">1</span><span class=\"screen-reader-text\">Mettre à jour les traductions</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:57:\"http://localhost:8080/chanter.ch/wp-admin/update-core.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"title\";s:30:\"Mettre à jour les traductions\";}}s:11:\"new-content\";O:8:\"stdClass\":6:{s:2:\"id\";s:11:\"new-content\";s:5:\"title\";s:65:\"<span class=\"ab-icon\"></span><span class=\"ab-label\">Créer</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:54:\"http://localhost:8080/chanter.ch/wp-admin/post-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-post\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-post\";s:5:\"title\";s:7:\"Article\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:54:\"http://localhost:8080/chanter.ch/wp-admin/post-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"new-media\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"new-media\";s:5:\"title\";s:14:\"Fichier média\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:55:\"http://localhost:8080/chanter.ch/wp-admin/media-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-page\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-page\";s:5:\"title\";s:4:\"Page\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:69:\"http://localhost:8080/chanter.ch/wp-admin/post-new.php?post_type=page\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:16:\"new-tribe_events\";O:8:\"stdClass\":6:{s:2:\"id\";s:16:\"new-tribe_events\";s:5:\"title\";s:11:\"Évènement\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:77:\"http://localhost:8080/chanter.ch/wp-admin/post-new.php?post_type=tribe_events\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-user\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-user\";s:5:\"title\";s:11:\"Utilisateur\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:54:\"http://localhost:8080/chanter.ch/wp-admin/user-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:7:\"wpforms\";O:8:\"stdClass\":6:{s:2:\"id\";s:7:\"wpforms\";s:5:\"title\";s:7:\"WPForms\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:72:\"http://localhost:8080/chanter.ch/wp-admin/admin.php?page=wpforms-builder\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"languages\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"languages\";s:5:\"title\";s:155:\"<span class=\"ab-icon\"></span><span class=\"ab-label\"><span class=\"screen-reader-text\">Filtrer le contenu par langue</span>Afficher toutes les langues</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:45:\"/chanter.ch/wp-admin/update-core.php?lang=all\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"title\";s:29:\"Filtrer le contenu par langue\";}}s:2:\"fr\";O:8:\"stdClass\":6:{s:2:\"id\";s:2:\"fr\";s:5:\"title\";s:807:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAIAAAD5gJpuAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGzSURBVHjaYiyeepkBBv79+Zfnx/f379+fP38CyT9//jAyMiq5GP77wvDnJ8MfoAIGBoAAYgGqC7STApL///3/9++/pCTv////Qdz/QO4/IMna0vf/z+9/v379//37bUUTQACBNDD8Z/j87fffvyAVX79+/Q8GQDbQeKA9fM+e/Pv18/+vnwzCIkBLAAKQOAY5AIAwCEv4/4PddNUm3ji0QJyxW3rgzE0iLfqDGr2oYuu0l54AYvnz5x9Q6d+/QPQfyAQqAin9B3EOyG1A1UDj//36zfjr1y8GBoAAFI9BDgAwCMIw+P8Ho3GDO6XQ0l4MN8b2kUwYaLszqgKM/KHcDXwBxAJUD3TJ779A8h9Q5D8SAHoARP36+Rfo41+/mcA2AAQQy49ff0Cu//MPpAeI/0FdA1QNYYNVA/3wmwEYVgwMAAHE8uPHH5BqoD1//gJJLADoJKDS378Z//wFhhJAALF8A3rizz8uTmYg788fJkj4QOKREQyYxSWBhjEC/fcXZANAALF8+/anbcHlHz9+ffvx58uPX9KckkCn/gby/wLd8uvHjx96k+cD1UGiGQgAAgwA7q17ZpsMdUQAAAAASUVORK5CYII=\" title=\"Français\" alt=\"Français\" />Français\";s:6:\"parent\";s:9:\"languages\";s:4:\"href\";s:44:\"/chanter.ch/wp-admin/update-core.php?lang=fr\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:4:\"lang\";s:5:\"fr-FR\";}}s:2:\"de\";O:8:\"stdClass\":6:{s:2:\"id\";s:2:\"de\";s:5:\"title\";s:801:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAIAAAD5gJpuAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGzSURBVHjaYvTxcWb4+53h3z8GZpZff/79+v3n/7/fDAz/GHAAgABi+f37e3FxOZD1Dwz+/v3z9y+E/AMFv3//+Qumfv9et241QACxMDExAVWfOHkJJAEW/gUEP0EQDn78+AHE/gFOQJUAAcQiy8Ag8O+fLFj1n1+/QDp+/gQioK7fP378+vkDqOH39x9A/RJ/gE5lAAhAYhzcAACCQBDkgRXRjP034R0IaDTZTFZn0DItot37S94KLOINerEcI7aKHAHE8v/3r/9//zIA1f36/R+o4tevf1ANYNVA9P07RD9IJQMDQACxADHD3z8Ig4GMHz+AqqHagKp//fwLVA0U//v7LwMDQACx/LZiYFD7/5/53/+///79BqK/EMZ/UPACSYa/v/8DyX9A0oTxx2EGgABi+a/H8F/m339BoCoQ+g8kgRaCQvgPJJiBYmAuw39hxn+uDAABxMLwi+E/0PusRkwMvxhBGoDkH4b/v/+D2EDyz///QB1/QLb8+sP0lQEggFh+vGXYM2/SP6A2Zoaf30Ex/J+PgekHwz9gQDAz/P0FYrAyMfz7wcDAzPDtFwNAgAEAd3SIyRitX1gAAAAASUVORK5CYII=\" title=\"Deutsch\" alt=\"Deutsch\" />Deutsch\";s:6:\"parent\";s:9:\"languages\";s:4:\"href\";s:44:\"/chanter.ch/wp-admin/update-core.php?lang=de\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:4:\"lang\";s:5:\"de-DE\";}}s:13:\"top-secondary\";O:8:\"stdClass\":6:{s:2:\"id\";s:13:\"top-secondary\";s:5:\"title\";b:0;s:6:\"parent\";b:0;s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:1:{s:5:\"class\";s:16:\"ab-top-secondary\";}}s:16:\"wp-logo-external\";O:8:\"stdClass\":6:{s:2:\"id\";s:16:\"wp-logo-external\";s:5:\"title\";b:0;s:6:\"parent\";s:7:\"wp-logo\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:1:{s:5:\"class\";s:16:\"ab-sub-secondary\";}}s:12:\"tribe-events\";O:8:\"stdClass\":6:{s:2:\"id\";s:12:\"tribe-events\";s:5:\"title\";s:77:\"<span class=\"ab-icon dashicons-before dashicons-calendar\"></span>Évènements\";s:6:\"parent\";b:0;s:4:\"href\";s:40:\"http://localhost:8080/chanter.ch/events/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:18:\"tribe-events-group\";O:8:\"stdClass\":6:{s:2:\"id\";s:18:\"tribe-events-group\";s:5:\"title\";b:0;s:6:\"parent\";s:12:\"tribe-events\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:26:\"tribe-events-add-ons-group\";O:8:\"stdClass\":6:{s:2:\"id\";s:26:\"tribe-events-add-ons-group\";s:5:\"title\";b:0;s:6:\"parent\";s:12:\"tribe-events\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:27:\"tribe-events-settings-group\";O:8:\"stdClass\":6:{s:2:\"id\";s:27:\"tribe-events-settings-group\";s:5:\"title\";b:0;s:6:\"parent\";s:12:\"tribe-events\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:25:\"tribe-events-import-group\";O:8:\"stdClass\":6:{s:2:\"id\";s:25:\"tribe-events-import-group\";s:5:\"title\";b:0;s:6:\"parent\";s:26:\"tribe-events-add-ons-group\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:26:\"tribe-events-view-calendar\";O:8:\"stdClass\":6:{s:2:\"id\";s:26:\"tribe-events-view-calendar\";s:5:\"title\";s:18:\"Voir le calendrier\";s:6:\"parent\";s:18:\"tribe-events-group\";s:4:\"href\";s:40:\"http://localhost:8080/chanter.ch/events/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:22:\"tribe-events-add-event\";O:8:\"stdClass\":6:{s:2:\"id\";s:22:\"tribe-events-add-event\";s:5:\"title\";s:22:\"Ajouter un Évènement\";s:6:\"parent\";s:18:\"tribe-events-group\";s:4:\"href\";s:77:\"http://localhost:8080/chanter.ch/wp-admin/post-new.php?post_type=tribe_events\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:24:\"tribe-events-edit-events\";O:8:\"stdClass\":6:{s:2:\"id\";s:24:\"tribe-events-edit-events\";s:5:\"title\";s:21:\"Modifier Évènements\";s:6:\"parent\";s:18:\"tribe-events-group\";s:4:\"href\";s:73:\"http://localhost:8080/chanter.ch/wp-admin/edit.php?post_type=tribe_events\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:19:\"tribe-events-import\";O:8:\"stdClass\":6:{s:2:\"id\";s:19:\"tribe-events-import\";s:5:\"title\";s:8:\"Importer\";s:6:\"parent\";s:25:\"tribe-events-import-group\";s:4:\"href\";s:94:\"http://localhost:8080/chanter.ch/wp-admin/edit.php?post_type=tribe_events&#038;page=aggregator\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:21:\"tribe-events-settings\";O:8:\"stdClass\":6:{s:2:\"id\";s:21:\"tribe-events-settings\";s:5:\"title\";s:9:\"Réglages\";s:6:\"parent\";s:27:\"tribe-events-settings-group\";s:4:\"href\";s:91:\"http://localhost:8080/chanter.ch/wp-admin/edit.php?post_type=tribe_events&page=tribe-common\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:17:\"tribe-events-help\";O:8:\"stdClass\":6:{s:2:\"id\";s:17:\"tribe-events-help\";s:5:\"title\";s:4:\"Aide\";s:6:\"parent\";s:27:\"tribe-events-settings-group\";s:4:\"href\";s:94:\"http://localhost:8080/chanter.ch/wp-admin/edit.php?post_type=tribe_events&#038;page=tribe-help\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:27:\"tribe-aggregator-import-csv\";O:8:\"stdClass\":6:{s:2:\"id\";s:27:\"tribe-aggregator-import-csv\";s:5:\"title\";s:11:\"Fichier CSV\";s:6:\"parent\";s:19:\"tribe-events-import\";s:4:\"href\";s:113:\"http://localhost:8080/chanter.ch/wp-admin/edit.php?page=aggregator&#038;post_type=tribe_events&#038;ea-origin=csv\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:21:\"tribe-events-app-shop\";O:8:\"stdClass\":6:{s:2:\"id\";s:21:\"tribe-events-app-shop\";s:5:\"title\";s:26:\"Modules d&#039;événement\";s:6:\"parent\";s:27:\"tribe-events-settings-group\";s:4:\"href\";s:93:\"http://localhost:8080/chanter.ch/wp-admin/edit.php?post_type=tribe_events&page=tribe-app-shop\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}}s:52:\"mw_adminimize_disabled_admin_bar_administrator_items\";a:0:{}s:45:\"mw_adminimize_disabled_admin_bar_author_items\";a:0:{}s:50:\"mw_adminimize_disabled_admin_bar_choeuradmin_items\";a:0:{}s:50:\"mw_adminimize_disabled_admin_bar_contributor_items\";a:0:{}s:45:\"mw_adminimize_disabled_admin_bar_editor_items\";a:0:{}s:48:\"mw_adminimize_disabled_admin_bar_fscvadmin_items\";a:0:{}s:51:\"mw_adminimize_disabled_admin_bar_gestionliste_items\";a:0:{}s:48:\"mw_adminimize_disabled_admin_bar_gestionnl_items\";a:0:{}s:50:\"mw_adminimize_disabled_admin_bar_groupsadmin_items\";a:0:{}s:49:\"mw_adminimize_disabled_admin_bar_subscriber_items\";a:0:{}s:49:\"mw_adminimize_disabled_admin_bar_traducteur_items\";a:0:{}s:48:\"mw_adminimize_disabled_admin_bar_webmaster_items\";a:0:{}s:19:\"mw_adminimize_debug\";i:0;s:28:\"mw_adminimize_multiple_roles\";i:0;s:29:\"mw_adminimize_support_bbpress\";i:0;s:33:\"mw_adminimize_prevent_page_access\";i:0;s:38:\"mw_adminimize_admin_bar_frontend_nodes\";a:45:{s:12:\"user-actions\";O:8:\"stdClass\":6:{s:2:\"id\";s:12:\"user-actions\";s:5:\"title\";b:0;s:6:\"parent\";s:10:\"my-account\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:9:\"user-info\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"user-info\";s:5:\"title\";s:298:\"<img alt=\'\' src=\'http://1.gravatar.com/avatar/1fcb930a5979b82289195938ce15a7db?s=64&#038;d=mm&#038;r=g\' srcset=\'http://1.gravatar.com/avatar/1fcb930a5979b82289195938ce15a7db?s=128&#038;d=mm&#038;r=g 2x\' class=\'avatar avatar-64 photo\' height=\'64\' width=\'64\' /><span class=\'display-name\'>admin</span>\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:53:\"http://localhost:8080/chanter.ch/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:8:\"tabindex\";i:-1;}}s:12:\"edit-profile\";O:8:\"stdClass\":6:{s:2:\"id\";s:12:\"edit-profile\";s:5:\"title\";s:19:\"Modifier mon profil\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:53:\"http://localhost:8080/chanter.ch/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:6:\"logout\";O:8:\"stdClass\":6:{s:2:\"id\";s:6:\"logout\";s:5:\"title\";s:15:\"Se déconnecter\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:83:\"http://localhost:8080/chanter.ch/wp-login.php?action=logout&amp;_wpnonce=e9786ec161\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:6:\"search\";O:8:\"stdClass\":6:{s:2:\"id\";s:6:\"search\";s:5:\"title\";s:325:\"<form action=\"http://localhost:8080/chanter.ch/\" method=\"get\" id=\"adminbarsearch\"><input class=\"adminbar-input\" name=\"s\" id=\"adminbar-search\" type=\"text\" value=\"\" maxlength=\"150\" /><label for=\"adminbar-search\" class=\"screen-reader-text\">Recherche</label><input type=\"submit\" class=\"adminbar-button\" value=\"Recherche\"/></form>\";s:6:\"parent\";s:13:\"top-secondary\";s:4:\"href\";b:0;s:5:\"group\";b:0;s:4:\"meta\";a:2:{s:5:\"class\";s:16:\"admin-bar-search\";s:8:\"tabindex\";i:-1;}}s:10:\"my-account\";O:8:\"stdClass\":6:{s:2:\"id\";s:10:\"my-account\";s:5:\"title\";s:306:\"Bonjour, <span class=\"display-name\">admin</span><img alt=\'\' src=\'http://1.gravatar.com/avatar/1fcb930a5979b82289195938ce15a7db?s=26&#038;d=mm&#038;r=g\' srcset=\'http://1.gravatar.com/avatar/1fcb930a5979b82289195938ce15a7db?s=52&#038;d=mm&#038;r=g 2x\' class=\'avatar avatar-26 photo\' height=\'26\' width=\'26\' />\";s:6:\"parent\";s:13:\"top-secondary\";s:4:\"href\";s:53:\"http://localhost:8080/chanter.ch/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"class\";s:11:\"with-avatar\";}}s:7:\"wp-logo\";O:8:\"stdClass\":6:{s:2:\"id\";s:7:\"wp-logo\";s:5:\"title\";s:91:\"<span class=\"ab-icon\"></span><span class=\"screen-reader-text\">À propos de WordPress</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:51:\"http://localhost:8080/chanter.ch/wp-admin/about.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:5:\"about\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"about\";s:5:\"title\";s:22:\"À propos de WordPress\";s:6:\"parent\";s:7:\"wp-logo\";s:4:\"href\";s:51:\"http://localhost:8080/chanter.ch/wp-admin/about.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:5:\"wporg\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"wporg\";s:5:\"title\";s:20:\"Site de WordPress-FR\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:16:\"https://wpfr.net\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:13:\"documentation\";O:8:\"stdClass\":6:{s:2:\"id\";s:13:\"documentation\";s:5:\"title\";s:13:\"Documentation\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:28:\"https://codex.wordpress.org/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:14:\"support-forums\";O:8:\"stdClass\":6:{s:2:\"id\";s:14:\"support-forums\";s:5:\"title\";s:19:\"Forums d’entraide\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:25:\"https://wpfr.net/support/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"feedback\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"feedback\";s:5:\"title\";s:8:\"Remarque\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:57:\"https://wordpress.org/support/forum/requests-and-feedback\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"site-name\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"site-name\";s:5:\"title\";s:4:\"FSCV\";s:6:\"parent\";b:0;s:4:\"href\";s:42:\"http://localhost:8080/chanter.ch/wp-admin/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"dashboard\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"dashboard\";s:5:\"title\";s:15:\"Tableau de bord\";s:6:\"parent\";s:9:\"site-name\";s:4:\"href\";s:42:\"http://localhost:8080/chanter.ch/wp-admin/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:10:\"appearance\";O:8:\"stdClass\":6:{s:2:\"id\";s:10:\"appearance\";s:5:\"title\";b:0;s:6:\"parent\";s:9:\"site-name\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:6:\"themes\";O:8:\"stdClass\":6:{s:2:\"id\";s:6:\"themes\";s:5:\"title\";s:7:\"Thèmes\";s:6:\"parent\";s:10:\"appearance\";s:4:\"href\";s:52:\"http://localhost:8080/chanter.ch/wp-admin/themes.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:7:\"widgets\";O:8:\"stdClass\":6:{s:2:\"id\";s:7:\"widgets\";s:5:\"title\";s:7:\"Widgets\";s:6:\"parent\";s:10:\"appearance\";s:4:\"href\";s:53:\"http://localhost:8080/chanter.ch/wp-admin/widgets.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:5:\"menus\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"menus\";s:5:\"title\";s:5:\"Menus\";s:6:\"parent\";s:10:\"appearance\";s:4:\"href\";s:55:\"http://localhost:8080/chanter.ch/wp-admin/nav-menus.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:10:\"background\";O:8:\"stdClass\":6:{s:2:\"id\";s:10:\"background\";s:5:\"title\";s:13:\"Arrière-plan\";s:6:\"parent\";s:10:\"appearance\";s:4:\"href\";s:75:\"http://localhost:8080/chanter.ch/wp-admin/themes.php?page=custom-background\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"class\";s:17:\"hide-if-customize\";}}s:6:\"header\";O:8:\"stdClass\":6:{s:2:\"id\";s:6:\"header\";s:5:\"title\";s:8:\"En-tête\";s:6:\"parent\";s:10:\"appearance\";s:4:\"href\";s:71:\"http://localhost:8080/chanter.ch/wp-admin/themes.php?page=custom-header\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"class\";s:17:\"hide-if-customize\";}}s:9:\"customize\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"customize\";s:5:\"title\";s:13:\"Personnaliser\";s:6:\"parent\";b:0;s:4:\"href\";s:105:\"http://localhost:8080/chanter.ch/wp-admin/customize.php?url=http%3A%2F%2Flocalhost%3A8080%2Fchanter.ch%2F\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"class\";s:20:\"hide-if-no-customize\";}}s:7:\"updates\";O:8:\"stdClass\":6:{s:2:\"id\";s:7:\"updates\";s:5:\"title\";s:160:\"<span class=\"ab-icon\"></span><span class=\"ab-label\">2</span><span class=\"screen-reader-text\">1 mise à jour d’extension, Mettre à jour les traductions</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:57:\"http://localhost:8080/chanter.ch/wp-admin/update-core.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"title\";s:60:\"1 mise à jour d’extension, Mettre à jour les traductions\";}}s:11:\"new-content\";O:8:\"stdClass\":6:{s:2:\"id\";s:11:\"new-content\";s:5:\"title\";s:65:\"<span class=\"ab-icon\"></span><span class=\"ab-label\">Créer</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:54:\"http://localhost:8080/chanter.ch/wp-admin/post-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-post\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-post\";s:5:\"title\";s:7:\"Article\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:54:\"http://localhost:8080/chanter.ch/wp-admin/post-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"new-media\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"new-media\";s:5:\"title\";s:14:\"Fichier média\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:55:\"http://localhost:8080/chanter.ch/wp-admin/media-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-page\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-page\";s:5:\"title\";s:4:\"Page\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:69:\"http://localhost:8080/chanter.ch/wp-admin/post-new.php?post_type=page\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:16:\"new-tribe_events\";O:8:\"stdClass\":6:{s:2:\"id\";s:16:\"new-tribe_events\";s:5:\"title\";s:11:\"Évènement\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:77:\"http://localhost:8080/chanter.ch/wp-admin/post-new.php?post_type=tribe_events\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-user\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-user\";s:5:\"title\";s:11:\"Utilisateur\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:54:\"http://localhost:8080/chanter.ch/wp-admin/user-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:4:\"edit\";O:8:\"stdClass\":6:{s:2:\"id\";s:4:\"edit\";s:5:\"title\";s:16:\"Modifier la page\";s:6:\"parent\";b:0;s:4:\"href\";s:75:\"http://localhost:8080/chanter.ch/wp-admin/post.php?post=103&amp;action=edit\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:7:\"wpforms\";O:8:\"stdClass\":6:{s:2:\"id\";s:7:\"wpforms\";s:5:\"title\";s:7:\"WPForms\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:72:\"http://localhost:8080/chanter.ch/wp-admin/admin.php?page=wpforms-builder\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:13:\"top-secondary\";O:8:\"stdClass\":6:{s:2:\"id\";s:13:\"top-secondary\";s:5:\"title\";b:0;s:6:\"parent\";b:0;s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:1:{s:5:\"class\";s:16:\"ab-top-secondary\";}}s:16:\"wp-logo-external\";O:8:\"stdClass\":6:{s:2:\"id\";s:16:\"wp-logo-external\";s:5:\"title\";b:0;s:6:\"parent\";s:7:\"wp-logo\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:1:{s:5:\"class\";s:16:\"ab-sub-secondary\";}}s:12:\"tribe-events\";O:8:\"stdClass\":6:{s:2:\"id\";s:12:\"tribe-events\";s:5:\"title\";s:77:\"<span class=\"ab-icon dashicons-before dashicons-calendar\"></span>Évènements\";s:6:\"parent\";b:0;s:4:\"href\";s:40:\"http://localhost:8080/chanter.ch/events/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:18:\"tribe-events-group\";O:8:\"stdClass\":6:{s:2:\"id\";s:18:\"tribe-events-group\";s:5:\"title\";b:0;s:6:\"parent\";s:12:\"tribe-events\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:26:\"tribe-events-add-ons-group\";O:8:\"stdClass\":6:{s:2:\"id\";s:26:\"tribe-events-add-ons-group\";s:5:\"title\";b:0;s:6:\"parent\";s:12:\"tribe-events\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:27:\"tribe-events-settings-group\";O:8:\"stdClass\":6:{s:2:\"id\";s:27:\"tribe-events-settings-group\";s:5:\"title\";b:0;s:6:\"parent\";s:12:\"tribe-events\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:25:\"tribe-events-import-group\";O:8:\"stdClass\":6:{s:2:\"id\";s:25:\"tribe-events-import-group\";s:5:\"title\";b:0;s:6:\"parent\";s:26:\"tribe-events-add-ons-group\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:26:\"tribe-events-view-calendar\";O:8:\"stdClass\":6:{s:2:\"id\";s:26:\"tribe-events-view-calendar\";s:5:\"title\";s:18:\"Voir le calendrier\";s:6:\"parent\";s:18:\"tribe-events-group\";s:4:\"href\";s:40:\"http://localhost:8080/chanter.ch/events/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:22:\"tribe-events-add-event\";O:8:\"stdClass\":6:{s:2:\"id\";s:22:\"tribe-events-add-event\";s:5:\"title\";s:22:\"Ajouter un Évènement\";s:6:\"parent\";s:18:\"tribe-events-group\";s:4:\"href\";s:77:\"http://localhost:8080/chanter.ch/wp-admin/post-new.php?post_type=tribe_events\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:24:\"tribe-events-edit-events\";O:8:\"stdClass\":6:{s:2:\"id\";s:24:\"tribe-events-edit-events\";s:5:\"title\";s:21:\"Modifier Évènements\";s:6:\"parent\";s:18:\"tribe-events-group\";s:4:\"href\";s:73:\"http://localhost:8080/chanter.ch/wp-admin/edit.php?post_type=tribe_events\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:19:\"tribe-events-import\";O:8:\"stdClass\":6:{s:2:\"id\";s:19:\"tribe-events-import\";s:5:\"title\";s:8:\"Importer\";s:6:\"parent\";s:25:\"tribe-events-import-group\";s:4:\"href\";s:94:\"http://localhost:8080/chanter.ch/wp-admin/edit.php?post_type=tribe_events&#038;page=aggregator\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:21:\"tribe-events-settings\";O:8:\"stdClass\":6:{s:2:\"id\";s:21:\"tribe-events-settings\";s:5:\"title\";s:9:\"Réglages\";s:6:\"parent\";s:27:\"tribe-events-settings-group\";s:4:\"href\";s:91:\"http://localhost:8080/chanter.ch/wp-admin/edit.php?page=tribe-common&post_type=tribe_events\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:17:\"tribe-events-help\";O:8:\"stdClass\":6:{s:2:\"id\";s:17:\"tribe-events-help\";s:5:\"title\";s:4:\"Aide\";s:6:\"parent\";s:27:\"tribe-events-settings-group\";s:4:\"href\";s:94:\"http://localhost:8080/chanter.ch/wp-admin/edit.php?post_type=tribe_events&#038;page=tribe-help\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:27:\"tribe-aggregator-import-csv\";O:8:\"stdClass\":6:{s:2:\"id\";s:27:\"tribe-aggregator-import-csv\";s:5:\"title\";s:11:\"Fichier CSV\";s:6:\"parent\";s:19:\"tribe-events-import\";s:4:\"href\";s:113:\"http://localhost:8080/chanter.ch/wp-admin/edit.php?page=aggregator&#038;post_type=tribe_events&#038;ea-origin=csv\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:21:\"tribe-events-app-shop\";O:8:\"stdClass\":6:{s:2:\"id\";s:21:\"tribe-events-app-shop\";s:5:\"title\";s:26:\"Modules d&#039;événement\";s:6:\"parent\";s:27:\"tribe-events-settings-group\";s:4:\"href\";s:93:\"http://localhost:8080/chanter.ch/wp-admin/edit.php?page=tribe-app-shop&post_type=tribe_events\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}}s:61:\"mw_adminimize_disabled_admin_bar_frontend_administrator_items\";a:0:{}s:54:\"mw_adminimize_disabled_admin_bar_frontend_author_items\";a:0:{}s:59:\"mw_adminimize_disabled_admin_bar_frontend_choeuradmin_items\";a:0:{}s:59:\"mw_adminimize_disabled_admin_bar_frontend_contributor_items\";a:0:{}s:54:\"mw_adminimize_disabled_admin_bar_frontend_editor_items\";a:0:{}s:57:\"mw_adminimize_disabled_admin_bar_frontend_fscvadmin_items\";a:0:{}s:60:\"mw_adminimize_disabled_admin_bar_frontend_gestionliste_items\";a:0:{}s:57:\"mw_adminimize_disabled_admin_bar_frontend_gestionnl_items\";a:0:{}s:59:\"mw_adminimize_disabled_admin_bar_frontend_groupsadmin_items\";a:0:{}s:58:\"mw_adminimize_disabled_admin_bar_frontend_subscriber_items\";a:0:{}s:58:\"mw_adminimize_disabled_admin_bar_frontend_traducteur_items\";a:0:{}s:57:\"mw_adminimize_disabled_admin_bar_frontend_webmaster_items\";a:0:{}s:24:\"_mw_adminimize_user_info\";i:0;s:21:\"_mw_adminimize_footer\";i:0;s:21:\"_mw_adminimize_header\";i:0;s:34:\"_mw_adminimize_exclude_super_admin\";i:0;s:24:\"_mw_adminimize_tb_window\";i:0;s:23:\"_mw_adminimize_cat_full\";i:0;s:26:\"_mw_adminimize_db_redirect\";i:0;s:26:\"_mw_adminimize_ui_redirect\";i:0;s:21:\"_mw_adminimize_advice\";i:0;s:25:\"_mw_adminimize_advice_txt\";s:0:\"\";s:24:\"_mw_adminimize_timestamp\";i:0;s:30:\"_mw_adminimize_db_redirect_txt\";s:0:\"\";s:47:\"mw_adminimize_disabled_menu_administrator_items\";a:0:{}s:50:\"mw_adminimize_disabled_submenu_administrator_items\";a:0:{}s:40:\"mw_adminimize_disabled_menu_author_items\";a:2:{i:0;s:10:\"knews_news\";i:1;s:12:\"sfsi-options\";}s:43:\"mw_adminimize_disabled_submenu_author_items\";a:0:{}s:45:\"mw_adminimize_disabled_menu_choeuradmin_items\";a:2:{i:0;s:10:\"knews_news\";i:1;s:12:\"sfsi-options\";}s:48:\"mw_adminimize_disabled_submenu_choeuradmin_items\";a:0:{}s:45:\"mw_adminimize_disabled_menu_contributor_items\";a:2:{i:0;s:10:\"knews_news\";i:1;s:12:\"sfsi-options\";}s:48:\"mw_adminimize_disabled_submenu_contributor_items\";a:0:{}s:40:\"mw_adminimize_disabled_menu_editor_items\";a:2:{i:0;s:10:\"knews_news\";i:1;s:12:\"sfsi-options\";}s:43:\"mw_adminimize_disabled_submenu_editor_items\";a:0:{}s:43:\"mw_adminimize_disabled_menu_fscvadmin_items\";a:2:{i:0;s:10:\"knews_news\";i:1;s:12:\"sfsi-options\";}s:46:\"mw_adminimize_disabled_submenu_fscvadmin_items\";a:0:{}s:46:\"mw_adminimize_disabled_menu_gestionliste_items\";a:2:{i:0;s:10:\"knews_news\";i:1;s:12:\"sfsi-options\";}s:49:\"mw_adminimize_disabled_submenu_gestionliste_items\";a:0:{}s:43:\"mw_adminimize_disabled_menu_gestionnl_items\";a:2:{i:0;s:10:\"knews_news\";i:1;s:12:\"sfsi-options\";}s:46:\"mw_adminimize_disabled_submenu_gestionnl_items\";a:0:{}s:45:\"mw_adminimize_disabled_menu_groupsadmin_items\";a:2:{i:0;s:10:\"knews_news\";i:1;s:12:\"sfsi-options\";}s:48:\"mw_adminimize_disabled_submenu_groupsadmin_items\";a:0:{}s:44:\"mw_adminimize_disabled_menu_subscriber_items\";a:1:{i:0;s:12:\"sfsi-options\";}s:47:\"mw_adminimize_disabled_submenu_subscriber_items\";a:0:{}s:44:\"mw_adminimize_disabled_menu_traducteur_items\";a:1:{i:0;s:12:\"sfsi-options\";}s:47:\"mw_adminimize_disabled_submenu_traducteur_items\";a:0:{}s:43:\"mw_adminimize_disabled_menu_webmaster_items\";a:0:{}s:46:\"mw_adminimize_disabled_submenu_webmaster_items\";a:0:{}s:28:\"_mw_adminimize_own_menu_slug\";s:0:\"\";s:35:\"_mw_adminimize_own_menu_custom_slug\";s:0:\"\";s:56:\"mw_adminimize_disabled_global_option_administrator_items\";a:0:{}s:57:\"mw_adminimize_disabled_metaboxes_post_administrator_items\";a:0:{}s:57:\"mw_adminimize_disabled_metaboxes_page_administrator_items\";a:0:{}s:65:\"mw_adminimize_disabled_metaboxes_tribe_events_administrator_items\";a:0:{}s:54:\"mw_adminimize_disabled_link_option_administrator_items\";a:0:{}s:58:\"mw_adminimize_disabled_nav_menu_option_administrator_items\";a:0:{}s:56:\"mw_adminimize_disabled_widget_option_administrator_items\";a:0:{}s:59:\"mw_adminimize_disabled_dashboard_option_administrator_items\";a:0:{}s:49:\"mw_adminimize_disabled_global_option_author_items\";a:0:{}s:50:\"mw_adminimize_disabled_metaboxes_post_author_items\";a:0:{}s:50:\"mw_adminimize_disabled_metaboxes_page_author_items\";a:0:{}s:58:\"mw_adminimize_disabled_metaboxes_tribe_events_author_items\";a:0:{}s:47:\"mw_adminimize_disabled_link_option_author_items\";a:0:{}s:51:\"mw_adminimize_disabled_nav_menu_option_author_items\";a:0:{}s:49:\"mw_adminimize_disabled_widget_option_author_items\";a:0:{}s:52:\"mw_adminimize_disabled_dashboard_option_author_items\";a:0:{}s:54:\"mw_adminimize_disabled_global_option_choeuradmin_items\";a:0:{}s:55:\"mw_adminimize_disabled_metaboxes_post_choeuradmin_items\";a:0:{}s:55:\"mw_adminimize_disabled_metaboxes_page_choeuradmin_items\";a:0:{}s:63:\"mw_adminimize_disabled_metaboxes_tribe_events_choeuradmin_items\";a:0:{}s:52:\"mw_adminimize_disabled_link_option_choeuradmin_items\";a:0:{}s:56:\"mw_adminimize_disabled_nav_menu_option_choeuradmin_items\";a:0:{}s:54:\"mw_adminimize_disabled_widget_option_choeuradmin_items\";a:0:{}s:57:\"mw_adminimize_disabled_dashboard_option_choeuradmin_items\";a:0:{}s:54:\"mw_adminimize_disabled_global_option_contributor_items\";a:0:{}s:55:\"mw_adminimize_disabled_metaboxes_post_contributor_items\";a:0:{}s:55:\"mw_adminimize_disabled_metaboxes_page_contributor_items\";a:0:{}s:63:\"mw_adminimize_disabled_metaboxes_tribe_events_contributor_items\";a:0:{}s:52:\"mw_adminimize_disabled_link_option_contributor_items\";a:0:{}s:56:\"mw_adminimize_disabled_nav_menu_option_contributor_items\";a:0:{}s:54:\"mw_adminimize_disabled_widget_option_contributor_items\";a:0:{}s:57:\"mw_adminimize_disabled_dashboard_option_contributor_items\";a:0:{}s:49:\"mw_adminimize_disabled_global_option_editor_items\";a:0:{}s:50:\"mw_adminimize_disabled_metaboxes_post_editor_items\";a:0:{}s:50:\"mw_adminimize_disabled_metaboxes_page_editor_items\";a:0:{}s:58:\"mw_adminimize_disabled_metaboxes_tribe_events_editor_items\";a:0:{}s:47:\"mw_adminimize_disabled_link_option_editor_items\";a:0:{}s:51:\"mw_adminimize_disabled_nav_menu_option_editor_items\";a:0:{}s:49:\"mw_adminimize_disabled_widget_option_editor_items\";a:0:{}s:52:\"mw_adminimize_disabled_dashboard_option_editor_items\";a:0:{}s:52:\"mw_adminimize_disabled_global_option_fscvadmin_items\";a:0:{}s:53:\"mw_adminimize_disabled_metaboxes_post_fscvadmin_items\";a:0:{}s:53:\"mw_adminimize_disabled_metaboxes_page_fscvadmin_items\";a:0:{}s:61:\"mw_adminimize_disabled_metaboxes_tribe_events_fscvadmin_items\";a:0:{}s:50:\"mw_adminimize_disabled_link_option_fscvadmin_items\";a:0:{}s:54:\"mw_adminimize_disabled_nav_menu_option_fscvadmin_items\";a:0:{}s:52:\"mw_adminimize_disabled_widget_option_fscvadmin_items\";a:0:{}s:55:\"mw_adminimize_disabled_dashboard_option_fscvadmin_items\";a:0:{}s:55:\"mw_adminimize_disabled_global_option_gestionliste_items\";a:0:{}s:56:\"mw_adminimize_disabled_metaboxes_post_gestionliste_items\";a:0:{}s:56:\"mw_adminimize_disabled_metaboxes_page_gestionliste_items\";a:0:{}s:64:\"mw_adminimize_disabled_metaboxes_tribe_events_gestionliste_items\";a:0:{}s:53:\"mw_adminimize_disabled_link_option_gestionliste_items\";a:0:{}s:57:\"mw_adminimize_disabled_nav_menu_option_gestionliste_items\";a:0:{}s:55:\"mw_adminimize_disabled_widget_option_gestionliste_items\";a:0:{}s:58:\"mw_adminimize_disabled_dashboard_option_gestionliste_items\";a:0:{}s:52:\"mw_adminimize_disabled_global_option_gestionnl_items\";a:0:{}s:53:\"mw_adminimize_disabled_metaboxes_post_gestionnl_items\";a:0:{}s:53:\"mw_adminimize_disabled_metaboxes_page_gestionnl_items\";a:0:{}s:61:\"mw_adminimize_disabled_metaboxes_tribe_events_gestionnl_items\";a:0:{}s:50:\"mw_adminimize_disabled_link_option_gestionnl_items\";a:0:{}s:54:\"mw_adminimize_disabled_nav_menu_option_gestionnl_items\";a:0:{}s:52:\"mw_adminimize_disabled_widget_option_gestionnl_items\";a:0:{}s:55:\"mw_adminimize_disabled_dashboard_option_gestionnl_items\";a:0:{}s:54:\"mw_adminimize_disabled_global_option_groupsadmin_items\";a:0:{}s:55:\"mw_adminimize_disabled_metaboxes_post_groupsadmin_items\";a:0:{}s:55:\"mw_adminimize_disabled_metaboxes_page_groupsadmin_items\";a:0:{}s:63:\"mw_adminimize_disabled_metaboxes_tribe_events_groupsadmin_items\";a:0:{}s:52:\"mw_adminimize_disabled_link_option_groupsadmin_items\";a:0:{}s:56:\"mw_adminimize_disabled_nav_menu_option_groupsadmin_items\";a:0:{}s:54:\"mw_adminimize_disabled_widget_option_groupsadmin_items\";a:0:{}s:57:\"mw_adminimize_disabled_dashboard_option_groupsadmin_items\";a:0:{}s:53:\"mw_adminimize_disabled_global_option_subscriber_items\";a:0:{}s:54:\"mw_adminimize_disabled_metaboxes_post_subscriber_items\";a:0:{}s:54:\"mw_adminimize_disabled_metaboxes_page_subscriber_items\";a:0:{}s:62:\"mw_adminimize_disabled_metaboxes_tribe_events_subscriber_items\";a:0:{}s:51:\"mw_adminimize_disabled_link_option_subscriber_items\";a:0:{}s:55:\"mw_adminimize_disabled_nav_menu_option_subscriber_items\";a:0:{}s:53:\"mw_adminimize_disabled_widget_option_subscriber_items\";a:0:{}s:56:\"mw_adminimize_disabled_dashboard_option_subscriber_items\";a:0:{}s:53:\"mw_adminimize_disabled_global_option_traducteur_items\";a:0:{}s:54:\"mw_adminimize_disabled_metaboxes_post_traducteur_items\";a:0:{}s:54:\"mw_adminimize_disabled_metaboxes_page_traducteur_items\";a:0:{}s:62:\"mw_adminimize_disabled_metaboxes_tribe_events_traducteur_items\";a:0:{}s:51:\"mw_adminimize_disabled_link_option_traducteur_items\";a:0:{}s:55:\"mw_adminimize_disabled_nav_menu_option_traducteur_items\";a:0:{}s:53:\"mw_adminimize_disabled_widget_option_traducteur_items\";a:0:{}s:56:\"mw_adminimize_disabled_dashboard_option_traducteur_items\";a:0:{}s:52:\"mw_adminimize_disabled_global_option_webmaster_items\";a:0:{}s:53:\"mw_adminimize_disabled_metaboxes_post_webmaster_items\";a:0:{}s:53:\"mw_adminimize_disabled_metaboxes_page_webmaster_items\";a:0:{}s:61:\"mw_adminimize_disabled_metaboxes_tribe_events_webmaster_items\";a:0:{}s:50:\"mw_adminimize_disabled_link_option_webmaster_items\";a:0:{}s:54:\"mw_adminimize_disabled_nav_menu_option_webmaster_items\";a:0:{}s:52:\"mw_adminimize_disabled_widget_option_webmaster_items\";a:0:{}s:55:\"mw_adminimize_disabled_dashboard_option_webmaster_items\";a:0:{}s:25:\"_mw_adminimize_own_values\";s:0:\"\";s:26:\"_mw_adminimize_own_options\";s:0:\"\";s:30:\"_mw_adminimize_own_post_values\";s:0:\"\";s:31:\"_mw_adminimize_own_post_options\";s:0:\"\";s:30:\"_mw_adminimize_own_page_values\";s:0:\"\";s:31:\"_mw_adminimize_own_page_options\";s:0:\"\";s:38:\"_mw_adminimize_own_values_tribe_events\";s:0:\"\";s:39:\"_mw_adminimize_own_options_tribe_events\";s:0:\"\";s:30:\"_mw_adminimize_own_link_values\";s:0:\"\";s:31:\"_mw_adminimize_own_link_options\";s:0:\"\";s:34:\"_mw_adminimize_own_nav_menu_values\";s:0:\"\";s:35:\"_mw_adminimize_own_nav_menu_options\";s:0:\"\";s:32:\"_mw_adminimize_own_widget_values\";s:0:\"\";s:33:\"_mw_adminimize_own_widget_options\";s:0:\"\";s:35:\"_mw_adminimize_own_dashboard_values\";s:0:\"\";s:36:\"_mw_adminimize_own_dashboard_options\";s:0:\"\";s:31:\"mw_adminimize_dashboard_widgets\";a:6:{s:19:\"dashboard_right_now\";a:4:{s:2:\"id\";s:19:\"dashboard_right_now\";s:5:\"title\";s:20:\"D’un coup d’œil\";s:7:\"context\";s:6:\"normal\";s:8:\"priority\";s:4:\"core\";}s:18:\"dashboard_activity\";a:4:{s:2:\"id\";s:18:\"dashboard_activity\";s:5:\"title\";s:9:\"Activité\";s:7:\"context\";s:6:\"normal\";s:8:\"priority\";s:4:\"core\";}s:22:\"tribe_dashboard_widget\";a:4:{s:2:\"id\";s:22:\"tribe_dashboard_widget\";s:5:\"title\";s:20:\"Actu de Modern Tribe\";s:7:\"context\";s:6:\"normal\";s:8:\"priority\";s:4:\"core\";}s:25:\"dashboard_recent_comments\";a:4:{s:2:\"id\";s:25:\"dashboard_recent_comments\";s:5:\"title\";s:0:\"\";s:7:\"context\";s:6:\"normal\";s:8:\"priority\";s:3:\"low\";}s:21:\"dashboard_quick_press\";a:4:{s:2:\"id\";s:21:\"dashboard_quick_press\";s:5:\"title\";s:0:\"\";s:7:\"context\";s:4:\"side\";s:8:\"priority\";s:4:\"core\";}s:17:\"dashboard_primary\";a:4:{s:2:\"id\";s:17:\"dashboard_primary\";s:5:\"title\";s:37:\"Évènements et nouveautés WordPress\";s:7:\"context\";s:4:\"side\";s:8:\"priority\";s:4:\"core\";}}s:26:\"mw_adminimize_default_menu\";a:19:{i:2;a:7:{i:0;s:15:\"Tableau de bord\";i:1;s:4:\"read\";i:2;s:9:\"index.php\";i:3;s:0:\"\";i:4;s:57:\"menu-top menu-top-first menu-icon-dashboard menu-top-last\";i:5;s:14:\"menu-dashboard\";i:6;s:19:\"dashicons-dashboard\";}i:4;a:5:{i:0;s:0:\"\";i:1;s:4:\"read\";i:2;s:10:\"separator1\";i:3;s:0:\"\";i:4;s:17:\"wp-menu-separator\";}i:5;a:7:{i:0;s:8:\"Articles\";i:1;s:10:\"edit_posts\";i:2;s:8:\"edit.php\";i:3;s:0:\"\";i:4;s:52:\"menu-top menu-icon-post open-if-no-js menu-top-first\";i:5;s:10:\"menu-posts\";i:6;s:20:\"dashicons-admin-post\";}i:6;a:7:{i:0;s:12:\"Évènements\";i:1;s:17:\"edit_tribe_events\";i:2;s:31:\"edit.php?post_type=tribe_events\";i:3;s:0:\"\";i:4;s:31:\"menu-top menu-icon-tribe_events\";i:5;s:23:\"menu-posts-tribe_events\";i:6;s:18:\"dashicons-calendar\";}i:10;a:7:{i:0;s:7:\"Médias\";i:1;s:12:\"upload_files\";i:2;s:10:\"upload.php\";i:3;s:0:\"\";i:4;s:24:\"menu-top menu-icon-media\";i:5;s:10:\"menu-media\";i:6;s:21:\"dashicons-admin-media\";}i:20;a:7:{i:0;s:5:\"Pages\";i:1;s:10:\"edit_pages\";i:2;s:23:\"edit.php?post_type=page\";i:3;s:0:\"\";i:4;s:23:\"menu-top menu-icon-page\";i:5;s:10:\"menu-pages\";i:6;s:20:\"dashicons-admin-page\";}s:4:\"57.7\";a:7:{i:0;s:7:\"WPForms\";i:1;s:14:\"manage_options\";i:2;s:16:\"wpforms-overview\";i:3;s:7:\"WPForms\";i:4;s:53:\"menu-top toplevel_page_wpforms-overview menu-top-last\";i:5;s:30:\"toplevel_page_wpforms-overview\";i:6;s:738:\"data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTc5MiIgaGVpZ2h0PSIxNzkyIiB2aWV3Qm94PSIwIDAgMTc5MiAxNzkyIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGZpbGw9IiM5ZWEzYTgiIGQ9Ik02NDMgOTExdjEyOGgtMjUydi0xMjhoMjUyem0wLTI1NXYxMjdoLTI1MnYtMTI3aDI1MnptNzU4IDUxMXYxMjhoLTM0MXYtMTI4aDM0MXptMC0yNTZ2MTI4aC02NzJ2LTEyOGg2NzJ6bTAtMjU1djEyN2gtNjcydi0xMjdoNjcyem0xMzUgODYwdi0xMjQwcTAtOC02LTE0dC0xNC02aC0zMmwtMzc4IDI1Ni0yMTAtMTcxLTIxMCAxNzEtMzc4LTI1NmgtMzJxLTggMC0xNCA2dC02IDE0djEyNDBxMCA4IDYgMTR0MTQgNmgxMjQwcTggMCAxNC02dDYtMTR6bS04NTUtMTExMGwxODUtMTUwaC00MDZ6bTQzMCAwbDIyMS0xNTBoLTQwNnptNTUzLTEzMHYxMjQwcTAgNjItNDMgMTA1dC0xMDUgNDNoLTEyNDBxLTYyIDAtMTA1LTQzdC00My0xMDV2LTEyNDBxMC02MiA0My0xMDV0MTA1LTQzaDEyNDBxNjIgMCAxMDUgNDN0NDMgMTA1eiIvPjwvc3ZnPg==\";}i:59;a:5:{i:0;s:0:\"\";i:1;s:4:\"read\";i:2;s:10:\"separator2\";i:3;s:0:\"\";i:4;s:17:\"wp-menu-separator\";}i:60;a:7:{i:0;s:9:\"Apparence\";i:1;s:13:\"switch_themes\";i:2;s:10:\"themes.php\";i:3;s:0:\"\";i:4;s:44:\"menu-top menu-icon-appearance menu-top-first\";i:5;s:15:\"menu-appearance\";i:6;s:26:\"dashicons-admin-appearance\";}i:65;a:7:{i:0;s:90:\"Extensions <span class=\'update-plugins count-1\'><span class=\'plugin-count\'>1</span></span>\";i:1;s:16:\"activate_plugins\";i:2;s:11:\"plugins.php\";i:3;s:0:\"\";i:4;s:26:\"menu-top menu-icon-plugins\";i:5;s:12:\"menu-plugins\";i:6;s:23:\"dashicons-admin-plugins\";}i:70;a:7:{i:0;s:12:\"Utilisateurs\";i:1;s:10:\"list_users\";i:2;s:9:\"users.php\";i:3;s:0:\"\";i:4;s:24:\"menu-top menu-icon-users\";i:5;s:10:\"menu-users\";i:6;s:21:\"dashicons-admin-users\";}i:75;a:7:{i:0;s:6:\"Outils\";i:1;s:10:\"edit_posts\";i:2;s:9:\"tools.php\";i:3;s:0:\"\";i:4;s:24:\"menu-top menu-icon-tools\";i:5;s:10:\"menu-tools\";i:6;s:21:\"dashicons-admin-tools\";}i:80;a:7:{i:0;s:10:\"Réglages \";i:1;s:14:\"manage_options\";i:2;s:19:\"options-general.php\";i:3;s:0:\"\";i:4;s:27:\"menu-top menu-icon-settings\";i:5;s:13:\"menu-settings\";i:6;s:24:\"dashicons-admin-settings\";}s:5:\"81.66\";a:7:{i:0;s:12:\"Support Plus\";i:1;s:14:\"manage_options\";i:2;s:15:\"wp-support-plus\";i:3;s:15:\"WP Support Plus\";i:4;s:52:\"menu-top toplevel_page_wp-support-plus menu-top-last\";i:5;s:29:\"toplevel_page_wp-support-plus\";i:6;s:24:\"dashicons-admin-settings\";}i:99;a:5:{i:0;s:0:\"\";i:1;s:4:\"read\";i:2;s:14:\"separator-last\";i:3;s:0:\"\";i:4;s:17:\"wp-menu-separator\";}i:103;a:7:{i:0;s:5:\"Knews\";i:1;s:10:\"edit_posts\";i:2;s:10:\"knews_news\";i:3;s:5:\"Knews\";i:4;s:48:\"menu-top toplevel_page_knews_news menu-top-first\";i:5;s:24:\"toplevel_page_knews_news\";i:6;s:75:\"http://localhost:8080/chanter.ch/wp-content/plugins/knews/images/icon16.png\";}i:104;a:7:{i:0;s:27:\"Ultimate Social Media Icons\";i:1;s:13:\"administrator\";i:2;s:12:\"sfsi-options\";i:3;s:27:\"Ultimate Social Media Icons\";i:4;s:35:\"menu-top toplevel_page_sfsi-options\";i:5;s:26:\"toplevel_page_sfsi-options\";i:6;s:95:\"http://localhost:8080/chanter.ch/wp-content/plugins/ultimate-social-media-icons/images/logo.png\";}i:105;a:7:{i:0;s:7:\"Langues\";i:1;s:14:\"manage_options\";i:2;s:5:\"mlang\";i:3;s:7:\"Langues\";i:4;s:28:\"menu-top toplevel_page_mlang\";i:5;s:19:\"toplevel_page_mlang\";i:6;s:21:\"dashicons-translation\";}i:106;a:7:{i:0;s:14:\"Administration\";i:1;s:4:\"read\";i:2;s:12:\"pods-add-new\";i:3;s:14:\"Administration\";i:4;s:49:\"menu-top toplevel_page_pods-add-new menu-top-last\";i:5;s:26:\"toplevel_page_pods-add-new\";i:6;s:14:\"dashicons-pods\";}}s:29:\"mw_adminimize_default_submenu\";a:18:{s:9:\"index.php\";a:2:{i:0;a:3:{i:0;s:7:\"Accueil\";i:1;s:4:\"read\";i:2;s:9:\"index.php\";}i:10;a:3:{i:0;s:93:\"Mises à jour <span class=\'update-plugins count-2\'><span class=\'update-count\'>2</span></span>\";i:1;s:11:\"update_core\";i:2;s:15:\"update-core.php\";}}s:10:\"upload.php\";a:2:{i:5;a:3:{i:0;s:13:\"Bibliothèque\";i:1;s:12:\"upload_files\";i:2;s:10:\"upload.php\";}i:10;a:3:{i:0;s:7:\"Ajouter\";i:1;s:12:\"upload_files\";i:2;s:13:\"media-new.php\";}}s:17:\"edit-comments.php\";a:1:{i:0;a:3:{i:0;s:21:\"Tous les commentaires\";i:1;s:10:\"edit_posts\";i:2;s:17:\"edit-comments.php\";}}s:8:\"edit.php\";a:4:{i:5;a:3:{i:0;s:17:\"Tous les articles\";i:1;s:10:\"edit_posts\";i:2;s:8:\"edit.php\";}i:10;a:3:{i:0;s:7:\"Ajouter\";i:1;s:10:\"edit_posts\";i:2;s:12:\"post-new.php\";}i:15;a:3:{i:0;s:11:\"Catégories\";i:1;s:17:\"manage_categories\";i:2;s:31:\"edit-tags.php?taxonomy=category\";}i:16;a:3:{i:0;s:11:\"Étiquettes\";i:1;s:16:\"manage_post_tags\";i:2;s:31:\"edit-tags.php?taxonomy=post_tag\";}}s:23:\"edit.php?post_type=page\";a:2:{i:5;a:3:{i:0;s:16:\"Toutes les pages\";i:1;s:10:\"edit_pages\";i:2;s:23:\"edit.php?post_type=page\";}i:10;a:3:{i:0;s:7:\"Ajouter\";i:1;s:10:\"edit_pages\";i:2;s:27:\"post-new.php?post_type=page\";}}s:31:\"edit.php?post_type=tribe_events\";a:10:{i:5;a:3:{i:0;s:12:\"Évènements\";i:1;s:17:\"edit_tribe_events\";i:2;s:31:\"edit.php?post_type=tribe_events\";}i:10;a:3:{i:0;s:10:\"Ajouter un\";i:1;s:17:\"edit_tribe_events\";i:2;s:35:\"post-new.php?post_type=tribe_events\";}i:15;a:3:{i:0;s:11:\"Étiquettes\";i:1;s:16:\"manage_post_tags\";i:2;s:58:\"edit-tags.php?taxonomy=post_tag&amp;post_type=tribe_events\";}i:16;a:3:{i:0;s:27:\"Catégories d’Évènement\";i:1;s:20:\"publish_tribe_events\";i:2;s:66:\"edit-tags.php?taxonomy=tribe_events_cat&amp;post_type=tribe_events\";}i:17;a:4:{i:0;s:5:\"Lieux\";i:1;s:17:\"edit_tribe_venues\";i:2;s:30:\"edit.php?post_type=tribe_venue\";i:3;s:5:\"Lieux\";}i:18;a:4:{i:0;s:13:\"Organisateurs\";i:1;s:21:\"edit_tribe_organizers\";i:2;s:34:\"edit.php?post_type=tribe_organizer\";i:3;s:13:\"Organisateurs\";}i:19;a:4:{i:0;s:8:\"Importer\";i:1;s:20:\"publish_tribe_events\";i:2;s:10:\"aggregator\";i:3;s:23:\"Import d’évènements\";}i:20;a:4:{i:0;s:13:\"Préférences\";i:1;s:14:\"manage_options\";i:2;s:12:\"tribe-common\";i:3;s:29:\"Réglages d&#039;événements\";}i:21;a:4:{i:0;s:4:\"Aide\";i:1;s:14:\"manage_options\";i:2;s:10:\"tribe-help\";i:3;s:4:\"Aide\";}i:22;a:4:{i:0;s:26:\"Modules d&#039;événement\";i:1;s:15:\"install_plugins\";i:2;s:14:\"tribe-app-shop\";i:3;s:26:\"Modules d&#039;événement\";}}s:10:\"themes.php\";a:11:{i:5;a:3:{i:0;s:7:\"Thèmes\";i:1;s:13:\"switch_themes\";i:2;s:10:\"themes.php\";}i:6;a:5:{i:0;s:13:\"Personnaliser\";i:1;s:9:\"customize\";i:2;s:95:\"customize.php?return=%2Fchanter.ch%2Fwp-admin%2Foptions-general.php%3Fpage%3Dadminimize-options\";i:3;s:0:\"\";i:4;s:20:\"hide-if-no-customize\";}i:7;a:3:{i:0;s:7:\"Widgets\";i:1;s:18:\"edit_theme_options\";i:2;s:11:\"widgets.php\";}i:10;a:3:{i:0;s:5:\"Menus\";i:1;s:18:\"edit_theme_options\";i:2;s:13:\"nav-menus.php\";}i:15;a:5:{i:0;s:8:\"En-tête\";i:1;s:13:\"switch_themes\";i:2;s:136:\"customize.php?return=%2Fchanter.ch%2Fwp-admin%2Foptions-general.php%3Fpage%3Dadminimize-options&#038;autofocus%5Bcontrol%5D=header_image\";i:3;s:0:\"\";i:4;s:20:\"hide-if-no-customize\";}i:20;a:5:{i:0;s:13:\"Arrière-plan\";i:1;s:13:\"switch_themes\";i:2;s:140:\"customize.php?return=%2Fchanter.ch%2Fwp-admin%2Foptions-general.php%3Fpage%3Dadminimize-options&#038;autofocus%5Bcontrol%5D=background_image\";i:3;s:0:\"\";i:4;s:20:\"hide-if-no-customize\";}i:21;a:4:{i:0;s:13:\"About Radiate\";i:1;s:16:\"activate_plugins\";i:2;s:15:\"radiate-welcome\";i:3;s:13:\"About Radiate\";}i:22;a:4:{i:0;s:15:\"Install Plugins\";i:1;s:18:\"edit_theme_options\";i:2;s:21:\"tgmpa-install-plugins\";i:3;s:24:\"Install Required Plugins\";}i:23;a:4:{i:0;s:8:\"En-tête\";i:1;s:18:\"edit_theme_options\";i:2;s:13:\"custom-header\";i:3;s:8:\"En-tête\";}i:24;a:4:{i:0;s:13:\"Arrière-plan\";i:1;s:18:\"edit_theme_options\";i:2;s:17:\"custom-background\";i:3;s:13:\"Arrière-plan\";}i:25;a:4:{i:0;s:8:\"Éditeur\";i:1;s:11:\"edit_themes\";i:2;s:16:\"theme-editor.php\";i:3;s:8:\"Éditeur\";}}s:11:\"plugins.php\";a:3:{i:5;a:3:{i:0;s:22:\"Extensions installées\";i:1;s:16:\"activate_plugins\";i:2;s:11:\"plugins.php\";}i:10;a:3:{i:0;s:7:\"Ajouter\";i:1;s:15:\"install_plugins\";i:2;s:18:\"plugin-install.php\";}i:15;a:3:{i:0;s:8:\"Éditeur\";i:1;s:12:\"edit_plugins\";i:2;s:17:\"plugin-editor.php\";}}s:9:\"users.php\";a:6:{i:5;a:3:{i:0;s:21:\"Tous les utilisateurs\";i:1;s:10:\"list_users\";i:2;s:9:\"users.php\";}i:10;a:3:{i:0;s:7:\"Ajouter\";i:1;s:12:\"create_users\";i:2;s:12:\"user-new.php\";}i:15;a:3:{i:0;s:12:\"Votre profil\";i:1;s:4:\"read\";i:2;s:11:\"profile.php\";}i:16;a:4:{i:0;s:15:\"Author category\";i:1;s:14:\"manage_options\";i:2;s:21:\"Author_category_panel\";i:3;s:38:\"Paramétrage du Plugin Author Category\";}i:17;a:4:{i:0;s:16:\"User Role Editor\";i:1;s:14:\"ure_edit_roles\";i:2;s:26:\"users-user-role-editor.php\";i:3;s:16:\"User Role Editor\";}i:18;a:4:{i:0;s:21:\"User Specific Content\";i:1;s:14:\"manage_options\";i:2;s:27:\"User_specific_content_panel\";i:3;s:21:\"User Specific Content\";}}s:9:\"tools.php\";a:6:{i:5;a:3:{i:0;s:18:\"Outils disponibles\";i:1;s:10:\"edit_posts\";i:2;s:9:\"tools.php\";}i:10;a:3:{i:0;s:8:\"Importer\";i:1;s:6:\"import\";i:2;s:10:\"import.php\";}i:15;a:3:{i:0;s:8:\"Exporter\";i:1;s:6:\"export\";i:2;s:10:\"export.php\";}i:16;a:4:{i:0;s:15:\"Delete Comments\";i:1;s:14:\"manage_options\";i:2;s:22:\"disable_comments_tools\";i:3;s:15:\"Delete Comments\";}i:17;a:4:{i:0;s:21:\"Exporter les données\";i:1;s:27:\"export_others_personal_data\";i:2;s:20:\"export_personal_data\";i:3;s:21:\"Exporter les données\";}i:18;a:4:{i:0;s:20:\"Effacer les données\";i:1;s:26:\"erase_others_personal_data\";i:2;s:20:\"remove_personal_data\";i:3;s:20:\"Effacer les données\";}}s:19:\"options-general.php\";a:10:{i:10;a:3:{i:0;s:9:\"Général\";i:1;s:14:\"manage_options\";i:2;s:19:\"options-general.php\";}i:15;a:3:{i:0;s:9:\"Écriture\";i:1;s:14:\"manage_options\";i:2;s:19:\"options-writing.php\";}i:20;a:3:{i:0;s:7:\"Lecture\";i:1;s:14:\"manage_options\";i:2;s:19:\"options-reading.php\";}i:30;a:3:{i:0;s:7:\"Médias\";i:1;s:14:\"manage_options\";i:2;s:17:\"options-media.php\";}i:40;a:3:{i:0;s:10:\"Permaliens\";i:1;s:14:\"manage_options\";i:2;s:21:\"options-permalink.php\";}i:45;a:3:{i:0;s:17:\"Confidentialité \";i:1;s:22:\"manage_privacy_options\";i:2;s:11:\"privacy.php\";}i:46;a:4:{i:0;s:10:\"Adminimize\";i:1;s:14:\"manage_options\";i:2;s:18:\"adminimize-options\";i:3;s:18:\"Adminimize Options\";}i:47;a:4:{i:0;s:32:\"Pending Submission Notifications\";i:1;s:14:\"manage_options\";i:2;s:42:\"pending-submissions-notifications-settings\";i:3;s:40:\"Pending Submission Notifications Options\";}i:48;a:4:{i:0;s:16:\"User Role Editor\";i:1;s:18:\"ure_manage_options\";i:2;s:29:\"settings-user-role-editor.php\";i:3;s:16:\"User Role Editor\";}i:49;a:4:{i:0;s:16:\"Disable Comments\";i:1;s:14:\"manage_options\";i:2;s:25:\"disable_comments_settings\";i:3;s:16:\"Disable Comments\";}}s:16:\"wpforms-overview\";a:6:{i:0;a:4:{i:0;s:20:\"Tous les formulaires\";i:1;s:14:\"manage_options\";i:2;s:16:\"wpforms-overview\";i:3;s:7:\"WPForms\";}i:1;a:4:{i:0;s:7:\"Nouveau\";i:1;s:14:\"manage_options\";i:2;s:15:\"wpforms-builder\";i:3;s:20:\"Constructeur WPForms\";}i:2;a:4:{i:0;s:8:\"Entrées\";i:1;s:14:\"manage_options\";i:2;s:15:\"wpforms-entries\";i:3;s:22:\"Entrées de formulaire\";}i:3;a:4:{i:0;s:9:\"Réglages\";i:1;s:14:\"manage_options\";i:2;s:16:\"wpforms-settings\";i:3;s:20:\"Réglages de WPForms\";}i:4;a:4:{i:0;s:5:\"Tools\";i:1;s:14:\"manage_options\";i:2;s:13:\"wpforms-tools\";i:3;s:13:\"WPForms Tools\";}i:5;a:4:{i:0;s:45:\"<span style=\"color:#f18500\">Extensions</span>\";i:1;s:14:\"manage_options\";i:2;s:14:\"wpforms-addons\";i:3;s:18:\"Extensions WPForms\";}}s:16:\"wpforms-settings\";a:1:{i:0;a:4:{i:0;s:4:\"Info\";i:1;s:14:\"manage_options\";i:2;s:12:\"wpforms-page\";i:3;s:7:\"WPForms\";}}s:10:\"knews_news\";a:10:{i:0;a:4:{i:0;s:11:\"Newsletters\";i:1;s:10:\"edit_posts\";i:2;s:10:\"knews_news\";i:3;s:11:\"Newsletters\";}i:1;a:4:{i:0;s:17:\"Listes d\'abonnés\";i:1;s:10:\"edit_posts\";i:2;s:11:\"knews_lists\";i:3;s:17:\"Listes d\'abonnés\";}i:2;a:4:{i:0;s:8:\"Abonnés\";i:1;s:10:\"edit_posts\";i:2;s:11:\"knews_users\";i:3;s:8:\"Abonnés\";}i:3;a:4:{i:0;s:6:\"Envois\";i:1;s:10:\"edit_posts\";i:2;s:12:\"knews_submit\";i:3;s:6:\"Envois\";}i:4;a:4:{i:0;s:12:\"Importer CSV\";i:1;s:10:\"edit_posts\";i:2;s:12:\"knews_import\";i:3;s:12:\"Importer CSV\";}i:5;a:4:{i:0;s:12:\"Exporter CSV\";i:1;s:10:\"edit_posts\";i:2;s:12:\"knews_export\";i:3;s:12:\"Exporter CSV\";}i:6;a:4:{i:0;s:21:\"Création automatique\";i:1;s:10:\"edit_posts\";i:2;s:10:\"knews_auto\";i:3;s:21:\"Création automatique\";}i:7;a:4:{i:0;s:12:\"Statistiques\";i:1;s:10:\"edit_posts\";i:2;s:11:\"knews_stats\";i:3;s:12:\"Statistiques\";}i:8;a:4:{i:0;s:13:\"Configuration\";i:1;s:10:\"edit_posts\";i:2;s:12:\"knews_config\";i:3;s:13:\"Configuration\";}i:9;a:4:{i:0;s:16:\"Priority Support\";i:1;s:10:\"edit_posts\";i:2;s:20:\"knews_config&tab=pro\";i:3;s:16:\"Priority Support\";}}s:30:\"edit.php?post_type=tribe_venue\";a:1:{i:0;a:4:{i:0;s:15:\"Ajouter un Lieu\";i:1;s:17:\"edit_tribe_venues\";i:2;s:34:\"post-new.php?post_type=tribe_venue\";i:3;s:15:\"Ajouter un Lieu\";}}s:34:\"edit.php?post_type=tribe_organizer\";a:1:{i:0;a:4:{i:0;s:23:\"Ajouter un Organisateur\";i:1;s:21:\"edit_tribe_organizers\";i:2;s:38:\"post-new.php?post_type=tribe_organizer\";i:3;s:23:\"Ajouter un Organisateur\";}}s:5:\"mlang\";a:4:{i:0;a:4:{i:0;s:7:\"Langues\";i:1;s:14:\"manage_options\";i:2;s:5:\"mlang\";i:3;s:7:\"Langues\";}i:1;a:4:{i:0;s:24:\"Traductions des chaînes\";i:1;s:14:\"manage_options\";i:2;s:13:\"mlang_strings\";i:3;s:24:\"Traductions des chaînes\";}i:2;a:4:{i:0;s:9:\"Réglages\";i:1;s:14:\"manage_options\";i:2;s:14:\"mlang_settings\";i:3;s:9:\"Réglages\";}i:3;a:4:{i:0;s:8:\"Lingotek\";i:1;s:14:\"manage_options\";i:2;s:14:\"mlang_lingotek\";i:3;s:8:\"Lingotek\";}}s:12:\"pods-add-new\";a:5:{i:0;a:4:{i:0;s:7:\"Ajouter\";i:1;s:4:\"read\";i:2;s:12:\"pods-add-new\";i:3;s:7:\"Ajouter\";}i:1;a:4:{i:0;s:10:\"Composants\";i:1;s:4:\"read\";i:2;s:15:\"pods-components\";i:3;s:10:\"Composants\";}i:2;a:4:{i:0;s:11:\"- Templates\";i:1;s:4:\"read\";i:2;s:33:\"edit.php?post_type=_pods_template\";i:3;s:9:\"Templates\";}i:3;a:4:{i:0;s:9:\"Réglages\";i:1;s:4:\"read\";i:2;s:13:\"pods-settings\";i:3;s:9:\"Réglages\";}i:4;a:4:{i:0;s:4:\"Aide\";i:1;s:4:\"read\";i:2;s:9:\"pods-help\";i:3;s:4:\"Aide\";}}}}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(574, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(582, 'category_children', 'a:0:{}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(655, 'rewrite_rules', 'a:447:{s:28:\"event-aggregator/(insert)/?$\";s:53:\"index.php?tribe-aggregator=1&tribe-action=$matches[1]\";s:25:\"(?:event)/([^/]+)/ical/?$\";s:56:\"index.php?ical=1&name=$matches[1]&post_type=tribe_events\";s:33:\"(de)/(?:events)/(?:page)/(\\d+)/?$\";s:85:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=list&paged=$matches[2]\";s:28:\"(?:events)/(?:page)/(\\d+)/?$\";s:76:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=list&paged=$matches[1]\";s:61:\"(de)/(?:events)/(?:featured|mis\\-en\\-avant)/(?:page)/(\\d+)/?$\";s:96:\"index.php?lang=$matches[1]&post_type=tribe_events&featured=1&eventDisplay=list&paged=$matches[2]\";s:56:\"(?:events)/(?:featured|mis\\-en\\-avant)/(?:page)/(\\d+)/?$\";s:87:\"index.php?lang=fr&post_type=tribe_events&featured=1&eventDisplay=list&paged=$matches[1]\";s:43:\"(de)/(?:events)/(feed|rdf|rss|rss2|atom)/?$\";s:84:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=list&feed=$matches[2]\";s:38:\"(?:events)/(feed|rdf|rss|rss2|atom)/?$\";s:75:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=list&feed=$matches[1]\";s:71:\"(de)/(?:events)/(?:featured|mis\\-en\\-avant)/(feed|rdf|rss|rss2|atom)/?$\";s:95:\"index.php?lang=$matches[1]&post_type=tribe_events&featured=1&eventDisplay=list&feed=$matches[2]\";s:66:\"(?:events)/(?:featured|mis\\-en\\-avant)/(feed|rdf|rss|rss2|atom)/?$\";s:86:\"index.php?lang=fr&post_type=tribe_events&featured=1&eventDisplay=list&feed=$matches[1]\";s:33:\"(de)/(?:events)/(?:month|mois)/?$\";s:68:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=month\";s:28:\"(?:events)/(?:month|mois)/?$\";s:59:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=month\";s:61:\"(de)/(?:events)/(?:month|mois)/(?:featured|mis\\-en\\-avant)/?$\";s:79:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=month&featured=1\";s:56:\"(?:events)/(?:month|mois)/(?:featured|mis\\-en\\-avant)/?$\";s:70:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=month&featured=1\";s:47:\"(de)/(?:events)/(?:month|mois)/(\\d{4}-\\d{2})/?$\";s:90:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=month&eventDate=$matches[2]\";s:42:\"(?:events)/(?:month|mois)/(\\d{4}-\\d{2})/?$\";s:81:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=month&eventDate=$matches[1]\";s:48:\"(de)/(?:events)/(?:list|liste)/(?:page)/(\\d+)/?$\";s:85:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=list&paged=$matches[2]\";s:43:\"(?:events)/(?:list|liste)/(?:page)/(\\d+)/?$\";s:76:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=list&paged=$matches[1]\";s:76:\"(de)/(?:events)/(?:list|liste)/(?:featured|mis\\-en\\-avant)/(?:page)/(\\d+)/?$\";s:96:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=list&featured=1&paged=$matches[2]\";s:71:\"(?:events)/(?:list|liste)/(?:featured|mis\\-en\\-avant)/(?:page)/(\\d+)/?$\";s:87:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=list&featured=1&paged=$matches[1]\";s:33:\"(de)/(?:events)/(?:list|liste)/?$\";s:67:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=list\";s:28:\"(?:events)/(?:list|liste)/?$\";s:58:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=list\";s:61:\"(de)/(?:events)/(?:list|liste)/(?:featured|mis\\-en\\-avant)/?$\";s:78:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=list&featured=1\";s:56:\"(?:events)/(?:list|liste)/(?:featured|mis\\-en\\-avant)/?$\";s:69:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=list&featured=1\";s:39:\"(de)/(?:events)/(?:today|aujourdhui)/?$\";s:66:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=day\";s:34:\"(?:events)/(?:today|aujourdhui)/?$\";s:57:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=day\";s:67:\"(de)/(?:events)/(?:today|aujourdhui)/(?:featured|mis\\-en\\-avant)/?$\";s:77:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=day&featured=1\";s:62:\"(?:events)/(?:today|aujourdhui)/(?:featured|mis\\-en\\-avant)/?$\";s:68:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=day&featured=1\";s:32:\"(de)/(?:events)/(\\d{4}-\\d{2})/?$\";s:90:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=month&eventDate=$matches[2]\";s:27:\"(?:events)/(\\d{4}-\\d{2})/?$\";s:81:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=month&eventDate=$matches[1]\";s:60:\"(de)/(?:events)/(\\d{4}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:101:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=month&eventDate=$matches[2]&featured=1\";s:55:\"(?:events)/(\\d{4}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:92:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=month&eventDate=$matches[1]&featured=1\";s:38:\"(de)/(?:events)/(\\d{4}-\\d{2}-\\d{2})/?$\";s:88:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=day&eventDate=$matches[2]\";s:33:\"(?:events)/(\\d{4}-\\d{2}-\\d{2})/?$\";s:79:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=day&eventDate=$matches[1]\";s:66:\"(de)/(?:events)/(\\d{4}-\\d{2}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:99:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=day&eventDate=$matches[2]&featured=1\";s:61:\"(?:events)/(\\d{4}-\\d{2}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:90:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=day&eventDate=$matches[1]&featured=1\";s:46:\"(de)/(?:events)/(?:featured|mis\\-en\\-avant)/?$\";s:60:\"index.php?lang=$matches[1]&post_type=tribe_events&featured=1\";s:41:\"(?:events)/(?:featured|mis\\-en\\-avant)/?$\";s:51:\"index.php?lang=fr&post_type=tribe_events&featured=1\";s:18:\"(de)/(?:events)/?$\";s:70:\"index.php?lang=$matches[1]&post_type=tribe_events&eventDisplay=default\";s:13:\"(?:events)/?$\";s:61:\"index.php?lang=fr&post_type=tribe_events&eventDisplay=default\";s:23:\"(de)/(?:events)/ical/?$\";s:56:\"index.php?lang=$matches[1]&post_type=tribe_events&ical=1\";s:18:\"(?:events)/ical/?$\";s:47:\"index.php?lang=fr&post_type=tribe_events&ical=1\";s:51:\"(de)/(?:events)/(?:featured|mis\\-en\\-avant)/ical/?$\";s:67:\"index.php?lang=$matches[1]&post_type=tribe_events&ical=1&featured=1\";s:46:\"(?:events)/(?:featured|mis\\-en\\-avant)/ical/?$\";s:58:\"index.php?lang=fr&post_type=tribe_events&ical=1&featured=1\";s:43:\"(de)/(?:events)/(\\d{4}-\\d{2}-\\d{2})/ical/?$\";s:95:\"index.php?lang=$matches[1]&post_type=tribe_events&ical=1&eventDisplay=day&eventDate=$matches[2]\";s:38:\"(?:events)/(\\d{4}-\\d{2}-\\d{2})/ical/?$\";s:86:\"index.php?lang=fr&post_type=tribe_events&ical=1&eventDisplay=day&eventDate=$matches[1]\";s:52:\"(de)/(?:events)/(\\d{4}-\\d{2}-\\d{2})/ical/featured/?$\";s:106:\"index.php?lang=$matches[1]&post_type=tribe_events&ical=1&eventDisplay=day&eventDate=$matches[2]&featured=1\";s:47:\"(?:events)/(\\d{4}-\\d{2}-\\d{2})/ical/featured/?$\";s:97:\"index.php?lang=fr&post_type=tribe_events&ical=1&eventDisplay=day&eventDate=$matches[1]&featured=1\";s:75:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:page)/(\\d+)/?$\";s:114:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=list&paged=$matches[3]\";s:70:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:page)/(\\d+)/?$\";s:105:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=list&paged=$matches[2]\";s:103:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:featured|mis\\-en\\-avant)/(?:page)/(\\d+)/?$\";s:125:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&featured=1&eventDisplay=list&paged=$matches[3]\";s:98:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:featured|mis\\-en\\-avant)/(?:page)/(\\d+)/?$\";s:116:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&featured=1&eventDisplay=list&paged=$matches[2]\";s:75:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:month|mois)/?$\";s:97:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=month\";s:70:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:month|mois)/?$\";s:88:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=month\";s:103:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:month|mois)/(?:featured|mis\\-en\\-avant)/?$\";s:108:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=month&featured=1\";s:98:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:month|mois)/(?:featured|mis\\-en\\-avant)/?$\";s:99:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=month&featured=1\";s:90:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:list|liste)/(?:page)/(\\d+)/?$\";s:114:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=list&paged=$matches[3]\";s:85:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:list|liste)/(?:page)/(\\d+)/?$\";s:105:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=list&paged=$matches[2]\";s:118:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:list|liste)/(?:featured|mis\\-en\\-avant)/(?:page)/(\\d+)/?$\";s:125:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=list&featured=1&paged=$matches[3]\";s:113:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:list|liste)/(?:featured|mis\\-en\\-avant)/(?:page)/(\\d+)/?$\";s:116:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=list&featured=1&paged=$matches[2]\";s:75:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:list|liste)/?$\";s:96:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=list\";s:70:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:list|liste)/?$\";s:87:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=list\";s:103:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:list|liste)/(?:featured|mis\\-en\\-avant)/?$\";s:107:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=list&featured=1\";s:98:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:list|liste)/(?:featured|mis\\-en\\-avant)/?$\";s:98:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=list&featured=1\";s:81:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:today|aujourdhui)/?$\";s:95:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=day\";s:76:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:today|aujourdhui)/?$\";s:86:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=day\";s:109:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:today|aujourdhui)/(?:featured|mis\\-en\\-avant)/?$\";s:106:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=day&featured=1\";s:104:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:today|aujourdhui)/(?:featured|mis\\-en\\-avant)/?$\";s:97:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=day&featured=1\";s:93:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:day|jour)/(\\d{4}-\\d{2}-\\d{2})/?$\";s:117:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=day&eventDate=$matches[3]\";s:88:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:day|jour)/(\\d{4}-\\d{2}-\\d{2})/?$\";s:108:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=day&eventDate=$matches[2]\";s:121:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:day|jour)/(\\d{4}-\\d{2}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:128:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=day&eventDate=$matches[3]&featured=1\";s:116:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:day|jour)/(\\d{4}-\\d{2}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:119:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=day&eventDate=$matches[2]&featured=1\";s:74:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(\\d{4}-\\d{2})/?$\";s:119:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=month&eventDate=$matches[3]\";s:69:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(\\d{4}-\\d{2})/?$\";s:110:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=month&eventDate=$matches[2]\";s:102:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(\\d{4}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:130:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=month&eventDate=$matches[3]&featured=1\";s:97:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(\\d{4}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:121:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=month&eventDate=$matches[2]&featured=1\";s:80:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(\\d{4}-\\d{2}-\\d{2})/?$\";s:117:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=day&eventDate=$matches[3]\";s:75:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(\\d{4}-\\d{2}-\\d{2})/?$\";s:108:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=day&eventDate=$matches[2]\";s:108:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(\\d{4}-\\d{2}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:128:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=day&eventDate=$matches[3]&featured=1\";s:103:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(\\d{4}-\\d{2}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:119:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=day&eventDate=$matches[2]&featured=1\";s:65:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/feed/?$\";s:106:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=list&feed=rss2\";s:60:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/feed/?$\";s:97:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=list&feed=rss2\";s:93:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:featured|mis\\-en\\-avant)/feed/?$\";s:117:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&featured=1&eventDisplay=list&feed=rss2\";s:88:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:featured|mis\\-en\\-avant)/feed/?$\";s:108:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&featured=1&eventDisplay=list&feed=rss2\";s:65:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/ical/?$\";s:85:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&ical=1\";s:60:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/ical/?$\";s:76:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&ical=1\";s:93:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:featured|mis\\-en\\-avant)/ical/?$\";s:96:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&featured=1&ical=1\";s:88:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:featured|mis\\-en\\-avant)/ical/?$\";s:87:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&featured=1&ical=1\";s:90:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:95:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&feed=$matches[3]\";s:85:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:86:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&feed=$matches[2]\";s:118:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:featured|mis\\-en\\-avant)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:106:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&featured=1&feed=$matches[3]\";s:113:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:featured|mis\\-en\\-avant)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&featured=1&feed=$matches[2]\";s:88:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:featured|mis\\-en\\-avant)/?$\";s:110:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&featured=1&eventDisplay=default\";s:83:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/(?:featured|mis\\-en\\-avant)/?$\";s:101:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&featured=1&eventDisplay=default\";s:60:\"(de)/(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/?$\";s:99:\"index.php?lang=$matches[1]&post_type=tribe_events&tribe_events_cat=$matches[2]&eventDisplay=default\";s:55:\"(?:events)/(?:category|categorie)/(?:[^/]+/)*([^/]+)/?$\";s:90:\"index.php?lang=fr&post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=default\";s:59:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:page)/(\\d+)/?$\";s:101:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=list&paged=$matches[3]\";s:54:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:page)/(\\d+)/?$\";s:92:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=list&paged=$matches[2]\";s:87:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:featured|mis\\-en\\-avant)/(?:page)/(\\d+)/?$\";s:112:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&featured=1&eventDisplay=list&paged=$matches[3]\";s:82:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:featured|mis\\-en\\-avant)/(?:page)/(\\d+)/?$\";s:103:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&featured=1&eventDisplay=list&paged=$matches[2]\";s:59:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:month|mois)/?$\";s:84:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=month\";s:54:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:month|mois)/?$\";s:75:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=month\";s:87:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:month|mois)/(?:featured|mis\\-en\\-avant)/?$\";s:95:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=month&featured=1\";s:82:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:month|mois)/(?:featured|mis\\-en\\-avant)/?$\";s:86:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=month&featured=1\";s:74:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:list|liste)/(?:page)/(\\d+)/?$\";s:101:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=list&paged=$matches[3]\";s:69:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:list|liste)/(?:page)/(\\d+)/?$\";s:92:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=list&paged=$matches[2]\";s:102:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:list|liste)/(?:featured|mis\\-en\\-avant)/(?:page)/(\\d+)/?$\";s:112:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=list&featured=1&paged=$matches[3]\";s:97:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:list|liste)/(?:featured|mis\\-en\\-avant)/(?:page)/(\\d+)/?$\";s:103:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=list&featured=1&paged=$matches[2]\";s:59:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:list|liste)/?$\";s:83:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=list\";s:54:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:list|liste)/?$\";s:74:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=list\";s:87:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:list|liste)/(?:featured|mis\\-en\\-avant)/?$\";s:94:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=list&featured=1\";s:82:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:list|liste)/(?:featured|mis\\-en\\-avant)/?$\";s:85:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=list&featured=1\";s:65:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:today|aujourdhui)/?$\";s:82:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=day\";s:60:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:today|aujourdhui)/?$\";s:73:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=day\";s:93:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:today|aujourdhui)/(?:featured|mis\\-en\\-avant)/?$\";s:93:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=day&featured=1\";s:88:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:today|aujourdhui)/(?:featured|mis\\-en\\-avant)/?$\";s:84:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=day&featured=1\";s:77:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:day|jour)/(\\d{4}-\\d{2}-\\d{2})/?$\";s:104:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=day&eventDate=$matches[3]\";s:72:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:day|jour)/(\\d{4}-\\d{2}-\\d{2})/?$\";s:95:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=day&eventDate=$matches[2]\";s:105:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:day|jour)/(\\d{4}-\\d{2}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:115:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=day&eventDate=$matches[3]&featured=1\";s:100:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:day|jour)/(\\d{4}-\\d{2}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:106:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=day&eventDate=$matches[2]&featured=1\";s:58:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(\\d{4}-\\d{2})/?$\";s:106:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=month&eventDate=$matches[3]\";s:53:\"(?:events)/(?:tag|etiquette)/([^/]+)/(\\d{4}-\\d{2})/?$\";s:97:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=month&eventDate=$matches[2]\";s:86:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(\\d{4}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:117:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=month&eventDate=$matches[3]&featured=1\";s:81:\"(?:events)/(?:tag|etiquette)/([^/]+)/(\\d{4}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:108:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=month&eventDate=$matches[2]&featured=1\";s:64:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(\\d{4}-\\d{2}-\\d{2})/?$\";s:104:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=day&eventDate=$matches[3]\";s:59:\"(?:events)/(?:tag|etiquette)/([^/]+)/(\\d{4}-\\d{2}-\\d{2})/?$\";s:95:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=day&eventDate=$matches[2]\";s:92:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(\\d{4}-\\d{2}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:115:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=day&eventDate=$matches[3]&featured=1\";s:87:\"(?:events)/(?:tag|etiquette)/([^/]+)/(\\d{4}-\\d{2}-\\d{2})/(?:featured|mis\\-en\\-avant)/?$\";s:106:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=day&eventDate=$matches[2]&featured=1\";s:49:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/feed/?$\";s:93:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=list&feed=rss2\";s:44:\"(?:events)/(?:tag|etiquette)/([^/]+)/feed/?$\";s:84:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=list&feed=rss2\";s:77:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:featured|mis\\-en\\-avant)/feed/?$\";s:104:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=list&feed=rss2&featured=1\";s:72:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:featured|mis\\-en\\-avant)/feed/?$\";s:95:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=list&feed=rss2&featured=1\";s:49:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/ical/?$\";s:72:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&ical=1\";s:44:\"(?:events)/(?:tag|etiquette)/([^/]+)/ical/?$\";s:63:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&ical=1\";s:77:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:featured|mis\\-en\\-avant)/ical/?$\";s:83:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&featured=1&ical=1\";s:72:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:featured|mis\\-en\\-avant)/ical/?$\";s:74:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&featured=1&ical=1\";s:74:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:82:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&feed=$matches[3]\";s:69:\"(?:events)/(?:tag|etiquette)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:73:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&feed=$matches[2]\";s:102:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:featured|mis\\-en\\-avant)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:93:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&featured=1&feed=$matches[3]\";s:97:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:featured|mis\\-en\\-avant)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:84:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&featured=1&feed=$matches[2]\";s:72:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/(?:featured|mis\\-en\\-avant)/?$\";s:76:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&featured=1\";s:67:\"(?:events)/(?:tag|etiquette)/([^/]+)/(?:featured|mis\\-en\\-avant)/?$\";s:67:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&featured=1\";s:44:\"(de)/(?:events)/(?:tag|etiquette)/([^/]+)/?$\";s:86:\"index.php?lang=$matches[1]&post_type=tribe_events&tag=$matches[2]&eventDisplay=default\";s:39:\"(?:events)/(?:tag|etiquette)/([^/]+)/?$\";s:77:\"index.php?lang=fr&post_type=tribe_events&tag=$matches[1]&eventDisplay=default\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:13:\"(de)/event/?$\";s:49:\"index.php?lang=$matches[1]&post_type=tribe_events\";s:8:\"event/?$\";s:40:\"index.php?lang=fr&post_type=tribe_events\";s:43:\"(de)/event/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&post_type=tribe_events&feed=$matches[2]\";s:38:\"event/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=fr&post_type=tribe_events&feed=$matches[1]\";s:38:\"(de)/event/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&post_type=tribe_events&feed=$matches[2]\";s:33:\"event/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=fr&post_type=tribe_events&feed=$matches[1]\";s:30:\"(de)/event/page/([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&post_type=tribe_events&paged=$matches[2]\";s:25:\"event/page/([0-9]{1,})/?$\";s:58:\"index.php?lang=fr&post_type=tribe_events&paged=$matches[1]\";s:52:\"(de)/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?lang=$matches[1]&category_name=$matches[2]&feed=$matches[3]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:47:\"(de)/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?lang=$matches[1]&category_name=$matches[2]&feed=$matches[3]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:28:\"(de)/category/(.+?)/embed/?$\";s:63:\"index.php?lang=$matches[1]&category_name=$matches[2]&embed=true\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:40:\"(de)/category/(.+?)/page/?([0-9]{1,})/?$\";s:70:\"index.php?lang=$matches[1]&category_name=$matches[2]&paged=$matches[3]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:22:\"(de)/category/(.+?)/?$\";s:52:\"index.php?lang=$matches[1]&category_name=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:49:\"(de)/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&tag=$matches[2]&feed=$matches[3]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:44:\"(de)/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&tag=$matches[2]&feed=$matches[3]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:25:\"(de)/tag/([^/]+)/embed/?$\";s:53:\"index.php?lang=$matches[1]&tag=$matches[2]&embed=true\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:37:\"(de)/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:60:\"index.php?lang=$matches[1]&tag=$matches[2]&paged=$matches[3]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:19:\"(de)/tag/([^/]+)/?$\";s:42:\"index.php?lang=$matches[1]&tag=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:50:\"(de)/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=fr&post_format=$matches[1]&feed=$matches[2]\";s:45:\"(de)/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=fr&post_format=$matches[1]&feed=$matches[2]\";s:26:\"(de)/type/([^/]+)/embed/?$\";s:61:\"index.php?lang=$matches[1]&post_format=$matches[2]&embed=true\";s:21:\"type/([^/]+)/embed/?$\";s:52:\"index.php?lang=fr&post_format=$matches[1]&embed=true\";s:38:\"(de)/type/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&post_format=$matches[2]&paged=$matches[3]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:59:\"index.php?lang=fr&post_format=$matches[1]&paged=$matches[2]\";s:20:\"(de)/type/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&post_format=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:41:\"index.php?lang=fr&post_format=$matches[1]\";s:57:\"wpforms_log_type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:55:\"index.php?wpforms_log_type=$matches[1]&feed=$matches[2]\";s:52:\"wpforms_log_type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:55:\"index.php?wpforms_log_type=$matches[1]&feed=$matches[2]\";s:33:\"wpforms_log_type/([^/]+)/embed/?$\";s:49:\"index.php?wpforms_log_type=$matches[1]&embed=true\";s:45:\"wpforms_log_type/([^/]+)/page/?([0-9]{1,})/?$\";s:56:\"index.php?wpforms_log_type=$matches[1]&paged=$matches[2]\";s:27:\"wpforms_log_type/([^/]+)/?$\";s:38:\"index.php?wpforms_log_type=$matches[1]\";s:32:\"lieu/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:42:\"lieu/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:62:\"lieu/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"lieu/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"lieu/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:38:\"lieu/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:21:\"lieu/([^/]+)/embed/?$\";s:44:\"index.php?tribe_venue=$matches[1]&embed=true\";s:25:\"lieu/([^/]+)/trackback/?$\";s:38:\"index.php?tribe_venue=$matches[1]&tb=1\";s:33:\"lieu/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?tribe_venue=$matches[1]&paged=$matches[2]\";s:40:\"lieu/([^/]+)/comment-page-([0-9]{1,})/?$\";s:51:\"index.php?tribe_venue=$matches[1]&cpage=$matches[2]\";s:29:\"lieu/([^/]+)(?:/([0-9]+))?/?$\";s:50:\"index.php?tribe_venue=$matches[1]&page=$matches[2]\";s:21:\"lieu/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:31:\"lieu/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:51:\"lieu/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"lieu/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"lieu/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:27:\"lieu/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:40:\"organisateur/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"organisateur/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"organisateur/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"organisateur/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"organisateur/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"organisateur/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:29:\"organisateur/([^/]+)/embed/?$\";s:48:\"index.php?tribe_organizer=$matches[1]&embed=true\";s:33:\"organisateur/([^/]+)/trackback/?$\";s:42:\"index.php?tribe_organizer=$matches[1]&tb=1\";s:41:\"organisateur/([^/]+)/page/?([0-9]{1,})/?$\";s:55:\"index.php?tribe_organizer=$matches[1]&paged=$matches[2]\";s:48:\"organisateur/([^/]+)/comment-page-([0-9]{1,})/?$\";s:55:\"index.php?tribe_organizer=$matches[1]&cpage=$matches[2]\";s:37:\"organisateur/([^/]+)(?:/([0-9]+))?/?$\";s:54:\"index.php?tribe_organizer=$matches[1]&page=$matches[2]\";s:29:\"organisateur/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"organisateur/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"organisateur/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"organisateur/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"organisateur/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"organisateur/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:38:\"(de)/event/[^/]+/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:33:\"event/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:48:\"(de)/event/[^/]+/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:43:\"event/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:68:\"(de)/event/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:63:\"event/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:63:\"(de)/event/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:58:\"event/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:63:\"(de)/event/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:58:\"event/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:44:\"(de)/event/[^/]+/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:39:\"event/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:27:\"(de)/event/([^/]+)/embed/?$\";s:62:\"index.php?lang=$matches[1]&tribe_events=$matches[2]&embed=true\";s:22:\"event/([^/]+)/embed/?$\";s:45:\"index.php?tribe_events=$matches[1]&embed=true\";s:31:\"(de)/event/([^/]+)/trackback/?$\";s:56:\"index.php?lang=$matches[1]&tribe_events=$matches[2]&tb=1\";s:26:\"event/([^/]+)/trackback/?$\";s:39:\"index.php?tribe_events=$matches[1]&tb=1\";s:51:\"(de)/event/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:68:\"index.php?lang=$matches[1]&tribe_events=$matches[2]&feed=$matches[3]\";s:46:\"event/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?tribe_events=$matches[1]&feed=$matches[2]\";s:46:\"(de)/event/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:68:\"index.php?lang=$matches[1]&tribe_events=$matches[2]&feed=$matches[3]\";s:41:\"event/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?tribe_events=$matches[1]&feed=$matches[2]\";s:39:\"(de)/event/([^/]+)/page/?([0-9]{1,})/?$\";s:69:\"index.php?lang=$matches[1]&tribe_events=$matches[2]&paged=$matches[3]\";s:34:\"event/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?tribe_events=$matches[1]&paged=$matches[2]\";s:46:\"(de)/event/([^/]+)/comment-page-([0-9]{1,})/?$\";s:69:\"index.php?lang=$matches[1]&tribe_events=$matches[2]&cpage=$matches[3]\";s:41:\"event/([^/]+)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?tribe_events=$matches[1]&cpage=$matches[2]\";s:35:\"(de)/event/([^/]+)(?:/([0-9]+))?/?$\";s:68:\"index.php?lang=$matches[1]&tribe_events=$matches[2]&page=$matches[3]\";s:30:\"event/([^/]+)(?:/([0-9]+))?/?$\";s:51:\"index.php?tribe_events=$matches[1]&page=$matches[2]\";s:27:\"(de)/event/[^/]+/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:22:\"event/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"(de)/event/[^/]+/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:32:\"event/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"(de)/event/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:52:\"event/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"(de)/event/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:47:\"event/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"(de)/event/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:47:\"event/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"(de)/event/[^/]+/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:28:\"event/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:60:\"(de)/events/categorie/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:72:\"index.php?lang=$matches[1]&tribe_events_cat=$matches[2]&feed=$matches[3]\";s:55:\"events/categorie/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:55:\"index.php?tribe_events_cat=$matches[1]&feed=$matches[2]\";s:55:\"(de)/events/categorie/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:72:\"index.php?lang=$matches[1]&tribe_events_cat=$matches[2]&feed=$matches[3]\";s:50:\"events/categorie/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:55:\"index.php?tribe_events_cat=$matches[1]&feed=$matches[2]\";s:36:\"(de)/events/categorie/(.+?)/embed/?$\";s:66:\"index.php?lang=$matches[1]&tribe_events_cat=$matches[2]&embed=true\";s:31:\"events/categorie/(.+?)/embed/?$\";s:49:\"index.php?tribe_events_cat=$matches[1]&embed=true\";s:48:\"(de)/events/categorie/(.+?)/page/?([0-9]{1,})/?$\";s:73:\"index.php?lang=$matches[1]&tribe_events_cat=$matches[2]&paged=$matches[3]\";s:43:\"events/categorie/(.+?)/page/?([0-9]{1,})/?$\";s:56:\"index.php?tribe_events_cat=$matches[1]&paged=$matches[2]\";s:30:\"(de)/events/categorie/(.+?)/?$\";s:55:\"index.php?lang=$matches[1]&tribe_events_cat=$matches[2]\";s:25:\"events/categorie/(.+?)/?$\";s:38:\"index.php?tribe_events_cat=$matches[1]\";s:41:\"deleted_event/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:51:\"deleted_event/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:71:\"deleted_event/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:66:\"deleted_event/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:66:\"deleted_event/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:47:\"deleted_event/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:30:\"deleted_event/([^/]+)/embed/?$\";s:46:\"index.php?deleted_event=$matches[1]&embed=true\";s:34:\"deleted_event/([^/]+)/trackback/?$\";s:40:\"index.php?deleted_event=$matches[1]&tb=1\";s:42:\"deleted_event/([^/]+)/page/?([0-9]{1,})/?$\";s:53:\"index.php?deleted_event=$matches[1]&paged=$matches[2]\";s:49:\"deleted_event/([^/]+)/comment-page-([0-9]{1,})/?$\";s:53:\"index.php?deleted_event=$matches[1]&cpage=$matches[2]\";s:38:\"deleted_event/([^/]+)(?:/([0-9]+))?/?$\";s:52:\"index.php?deleted_event=$matches[1]&page=$matches[2]\";s:30:\"deleted_event/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:40:\"deleted_event/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:60:\"deleted_event/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"deleted_event/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"deleted_event/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:36:\"deleted_event/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:44:\"amn_wpforms-lite/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:54:\"amn_wpforms-lite/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:74:\"amn_wpforms-lite/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:69:\"amn_wpforms-lite/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:69:\"amn_wpforms-lite/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:50:\"amn_wpforms-lite/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:33:\"amn_wpforms-lite/([^/]+)/embed/?$\";s:49:\"index.php?amn_wpforms-lite=$matches[1]&embed=true\";s:37:\"amn_wpforms-lite/([^/]+)/trackback/?$\";s:43:\"index.php?amn_wpforms-lite=$matches[1]&tb=1\";s:45:\"amn_wpforms-lite/([^/]+)/page/?([0-9]{1,})/?$\";s:56:\"index.php?amn_wpforms-lite=$matches[1]&paged=$matches[2]\";s:52:\"amn_wpforms-lite/([^/]+)/comment-page-([0-9]{1,})/?$\";s:56:\"index.php?amn_wpforms-lite=$matches[1]&cpage=$matches[2]\";s:41:\"amn_wpforms-lite/([^/]+)(?:/([0-9]+))?/?$\";s:55:\"index.php?amn_wpforms-lite=$matches[1]&page=$matches[2]\";s:33:\"amn_wpforms-lite/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"amn_wpforms-lite/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"amn_wpforms-lite/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"amn_wpforms-lite/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"amn_wpforms-lite/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"amn_wpforms-lite/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:37:\"(de)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:35:\"index.php?lang=fr&&feed=$matches[1]\";s:32:\"(de)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:35:\"index.php?lang=fr&&feed=$matches[1]\";s:13:\"(de)/embed/?$\";s:38:\"index.php?lang=$matches[1]&&embed=true\";s:8:\"embed/?$\";s:29:\"index.php?lang=fr&&embed=true\";s:25:\"(de)/page/?([0-9]{1,})/?$\";s:45:\"index.php?lang=$matches[1]&&paged=$matches[2]\";s:20:\"page/?([0-9]{1,})/?$\";s:36:\"index.php?lang=fr&&paged=$matches[1]\";s:32:\"(de)/comment-page-([0-9]{1,})/?$\";s:57:\"index.php?lang=$matches[1]&&page_id=103&cpage=$matches[2]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:48:\"index.php?lang=fr&&page_id=103&cpage=$matches[1]\";s:7:\"(de)/?$\";s:26:\"index.php?lang=$matches[1]\";s:46:\"(de)/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?lang=fr&&feed=$matches[1]&withcomments=1\";s:41:\"(de)/comments/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?lang=fr&&feed=$matches[1]&withcomments=1\";s:22:\"(de)/comments/embed/?$\";s:38:\"index.php?lang=$matches[1]&&embed=true\";s:17:\"comments/embed/?$\";s:29:\"index.php?lang=fr&&embed=true\";s:49:\"(de)/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?lang=fr&s=$matches[1]&feed=$matches[2]\";s:44:\"(de)/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?lang=fr&s=$matches[1]&feed=$matches[2]\";s:25:\"(de)/search/(.+)/embed/?$\";s:51:\"index.php?lang=$matches[1]&s=$matches[2]&embed=true\";s:20:\"search/(.+)/embed/?$\";s:42:\"index.php?lang=fr&s=$matches[1]&embed=true\";s:37:\"(de)/search/(.+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?lang=$matches[1]&s=$matches[2]&paged=$matches[3]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?lang=fr&s=$matches[1]&paged=$matches[2]\";s:19:\"(de)/search/(.+)/?$\";s:40:\"index.php?lang=$matches[1]&s=$matches[2]\";s:14:\"search/(.+)/?$\";s:31:\"index.php?lang=fr&s=$matches[1]\";s:52:\"(de)/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=fr&author_name=$matches[1]&feed=$matches[2]\";s:47:\"(de)/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=fr&author_name=$matches[1]&feed=$matches[2]\";s:28:\"(de)/author/([^/]+)/embed/?$\";s:61:\"index.php?lang=$matches[1]&author_name=$matches[2]&embed=true\";s:23:\"author/([^/]+)/embed/?$\";s:52:\"index.php?lang=fr&author_name=$matches[1]&embed=true\";s:40:\"(de)/author/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&author_name=$matches[2]&paged=$matches[3]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:59:\"index.php?lang=fr&author_name=$matches[1]&paged=$matches[2]\";s:22:\"(de)/author/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&author_name=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:41:\"index.php?lang=fr&author_name=$matches[1]\";s:74:\"(de)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:69:\"(de)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:50:\"(de)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:91:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&embed=true\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:62:\"(de)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:98:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&paged=$matches[5]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:44:\"(de)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:80:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:61:\"(de)/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:56:\"(de)/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:37:\"(de)/([0-9]{4})/([0-9]{1,2})/embed/?$\";s:75:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&embed=true\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:49:\"(de)/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:82:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&paged=$matches[4]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:31:\"(de)/([0-9]{4})/([0-9]{1,2})/?$\";s:64:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:48:\"(de)/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:43:\"(de)/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:24:\"(de)/([0-9]{4})/embed/?$\";s:54:\"index.php?lang=$matches[1]&year=$matches[2]&embed=true\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:36:\"(de)/([0-9]{4})/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&year=$matches[2]&paged=$matches[3]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:18:\"(de)/([0-9]{4})/?$\";s:43:\"index.php?lang=$matches[1]&year=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:63:\"(de)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:73:\"(de)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:93:\"(de)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:88:\"(de)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:88:\"(de)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:69:\"(de)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:58:\"(de)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:108:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:62:\"(de)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:102:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&tb=1\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:82:\"(de)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:114:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&feed=$matches[6]\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:77:\"(de)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:114:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&feed=$matches[6]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:70:\"(de)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:115:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&paged=$matches[6]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:77:\"(de)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:115:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&cpage=$matches[6]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:66:\"(de)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:114:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&page=$matches[6]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:52:\"(de)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:62:\"(de)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:82:\"(de)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:77:\"(de)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:77:\"(de)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:58:\"(de)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:69:\"(de)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&cpage=$matches[5]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:56:\"(de)/([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:82:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:43:\"(de)/([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&year=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:32:\"(de)/.?.+?/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:42:\"(de)/.?.+?/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:62:\"(de)/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"(de)/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"(de)/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:38:\"(de)/.?.+?/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:21:\"(de)/(.?.+?)/embed/?$\";s:58:\"index.php?lang=$matches[1]&pagename=$matches[2]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:25:\"(de)/(.?.+?)/trackback/?$\";s:52:\"index.php?lang=$matches[1]&pagename=$matches[2]&tb=1\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:45:\"(de)/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&feed=$matches[3]\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:40:\"(de)/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&feed=$matches[3]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:33:\"(de)/(.?.+?)/page/?([0-9]{1,})/?$\";s:65:\"index.php?lang=$matches[1]&pagename=$matches[2]&paged=$matches[3]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:40:\"(de)/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?lang=$matches[1]&pagename=$matches[2]&cpage=$matches[3]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:29:\"(de)/(.?.+?)(?:/([0-9]+))?/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&page=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(684, 'pods_component_settings', '{\"components\":{\"templates\":[]}}', 'yes'),
(685, 'pods_framework_version', '2.7.9', 'yes'),
(686, 'pods_framework_db_version', '2.3.5', 'yes'),
(687, '_transient_pods_pods_flush_rewrites-2.7.9', '0', 'yes'),
(690, '_transient_pods_pods_components-2.7.9', 'a:12:{s:22:\"advanced-content-types\";a:25:{s:2:\"ID\";s:22:\"advanced-content-types\";s:4:\"Name\";s:22:\"Advanced Content Types\";s:9:\"ShortName\";s:22:\"Advanced Content Types\";s:10:\"PluginName\";s:0:\"\";s:13:\"ComponentName\";s:0:\"\";s:3:\"URI\";s:0:\"\";s:8:\"MenuName\";s:22:\"Advanced Content Types\";s:8:\"MenuPage\";s:0:\"\";s:11:\"MenuAddPage\";s:0:\"\";s:7:\"MustUse\";b:0;s:11:\"Description\";s:98:\"A content type that exists outside of the WordPress post and postmeta table and uses custom tables\";s:7:\"Version\";s:3:\"2.3\";s:8:\"Category\";s:8:\"Advanced\";s:6:\"Author\";s:0:\"\";s:9:\"AuthorURI\";s:0:\"\";s:5:\"Class\";s:27:\"Pods_Advanced_Content_Types\";s:4:\"Hide\";s:0:\"\";s:16:\"PluginDependency\";s:0:\"\";s:15:\"ThemeDependency\";s:0:\"\";s:13:\"DeveloperMode\";b:0;s:13:\"TablelessMode\";b:0;s:10:\"Capability\";s:0:\"\";s:6:\"Plugin\";s:0:\"\";s:8:\"External\";b:0;s:4:\"File\";s:26:\"Advanced-Content-Types.php\";}s:22:\"advanced-relationships\";a:25:{s:2:\"ID\";s:22:\"advanced-relationships\";s:4:\"Name\";s:22:\"Advanced Relationships\";s:9:\"ShortName\";s:22:\"Advanced Relationships\";s:10:\"PluginName\";s:0:\"\";s:13:\"ComponentName\";s:0:\"\";s:3:\"URI\";s:0:\"\";s:8:\"MenuName\";s:22:\"Advanced Relationships\";s:8:\"MenuPage\";s:0:\"\";s:11:\"MenuAddPage\";s:0:\"\";s:7:\"MustUse\";b:0;s:11:\"Description\";s:96:\"Add advanced relationship objects for relating to including Database Tables, Multisite Networks,\";s:7:\"Version\";s:3:\"2.3\";s:8:\"Category\";s:8:\"Advanced\";s:6:\"Author\";s:0:\"\";s:9:\"AuthorURI\";s:0:\"\";s:5:\"Class\";s:27:\"Pods_Advanced_Relationships\";s:4:\"Hide\";s:0:\"\";s:16:\"PluginDependency\";s:0:\"\";s:15:\"ThemeDependency\";s:0:\"\";s:13:\"DeveloperMode\";b:0;s:13:\"TablelessMode\";b:0;s:10:\"Capability\";s:0:\"\";s:6:\"Plugin\";s:0:\"\";s:8:\"External\";b:0;s:4:\"File\";s:26:\"Advanced-Relationships.php\";}s:19:\"builder-integration\";a:25:{s:2:\"ID\";s:19:\"builder-integration\";s:4:\"Name\";s:19:\"Builder Integration\";s:9:\"ShortName\";s:19:\"Builder Integration\";s:10:\"PluginName\";s:0:\"\";s:13:\"ComponentName\";s:0:\"\";s:3:\"URI\";s:0:\"\";s:8:\"MenuName\";s:19:\"Builder Integration\";s:8:\"MenuPage\";s:0:\"\";s:11:\"MenuAddPage\";s:0:\"\";s:7:\"MustUse\";b:0;s:11:\"Description\";s:91:\"Integration with the <a href=\"http://ithemes.com/\">Builder</a> theme / child themes from <a\";s:7:\"Version\";s:3:\"1.0\";s:8:\"Category\";s:11:\"Integration\";s:6:\"Author\";s:0:\"\";s:9:\"AuthorURI\";s:0:\"\";s:5:\"Class\";s:12:\"Pods_Builder\";s:4:\"Hide\";s:0:\"\";s:16:\"PluginDependency\";s:0:\"\";s:15:\"ThemeDependency\";s:0:\"\";s:13:\"DeveloperMode\";b:0;s:13:\"TablelessMode\";b:0;s:10:\"Capability\";s:0:\"\";s:6:\"Plugin\";s:29:\"pods-builder/pods-builder.php\";s:8:\"External\";b:0;s:4:\"File\";s:19:\"Builder/Builder.php\";}s:7:\"helpers\";a:25:{s:2:\"ID\";s:7:\"helpers\";s:4:\"Name\";s:7:\"Helpers\";s:9:\"ShortName\";s:7:\"Helpers\";s:10:\"PluginName\";s:0:\"\";s:13:\"ComponentName\";s:0:\"\";s:3:\"URI\";s:0:\"\";s:8:\"MenuName\";s:7:\"Helpers\";s:8:\"MenuPage\";s:31:\"edit.php?post_type=_pods_helper\";s:11:\"MenuAddPage\";s:35:\"post-new.php?post_type=_pods_helper\";s:7:\"MustUse\";b:0;s:11:\"Description\";s:102:\"A holdover from Pods 1.x for backwards compatibility purposes, you most likely don\'t need these and we\";s:7:\"Version\";s:3:\"2.3\";s:8:\"Category\";s:8:\"Advanced\";s:6:\"Author\";s:0:\"\";s:9:\"AuthorURI\";s:0:\"\";s:5:\"Class\";s:12:\"Pods_Helpers\";s:4:\"Hide\";s:0:\"\";s:16:\"PluginDependency\";s:0:\"\";s:15:\"ThemeDependency\";s:0:\"\";s:13:\"DeveloperMode\";b:0;s:13:\"TablelessMode\";b:0;s:10:\"Capability\";s:0:\"\";s:6:\"Plugin\";s:0:\"\";s:8:\"External\";b:0;s:4:\"File\";s:11:\"Helpers.php\";}s:15:\"markdown-syntax\";a:25:{s:2:\"ID\";s:15:\"markdown-syntax\";s:4:\"Name\";s:15:\"Markdown Syntax\";s:9:\"ShortName\";s:15:\"Markdown Syntax\";s:10:\"PluginName\";s:0:\"\";s:13:\"ComponentName\";s:0:\"\";s:3:\"URI\";s:0:\"\";s:8:\"MenuName\";s:15:\"Markdown Syntax\";s:8:\"MenuPage\";s:0:\"\";s:11:\"MenuAddPage\";s:0:\"\";s:7:\"MustUse\";b:0;s:11:\"Description\";s:95:\"Integration with Markdown (http://michelf.com/projects/php-markdown/); Adds an option to enable\";s:7:\"Version\";s:3:\"1.0\";s:8:\"Category\";s:11:\"Field Types\";s:6:\"Author\";s:0:\"\";s:9:\"AuthorURI\";s:0:\"\";s:5:\"Class\";s:13:\"Pods_Markdown\";s:4:\"Hide\";s:0:\"\";s:16:\"PluginDependency\";s:0:\"\";s:15:\"ThemeDependency\";s:0:\"\";s:13:\"DeveloperMode\";b:0;s:13:\"TablelessMode\";b:0;s:10:\"Capability\";s:0:\"\";s:6:\"Plugin\";s:0:\"\";s:8:\"External\";b:0;s:4:\"File\";s:12:\"Markdown.php\";}s:50:\"migrate-import-from-the-custom-post-type-ui-plugin\";a:25:{s:2:\"ID\";s:50:\"migrate-import-from-the-custom-post-type-ui-plugin\";s:4:\"Name\";s:51:\"Migrate: Import from the Custom Post Type UI plugin\";s:9:\"ShortName\";s:51:\"Migrate: Import from the Custom Post Type UI plugin\";s:10:\"PluginName\";s:0:\"\";s:13:\"ComponentName\";s:0:\"\";s:3:\"URI\";s:0:\"\";s:8:\"MenuName\";s:14:\"Migrate CPT UI\";s:8:\"MenuPage\";s:0:\"\";s:11:\"MenuAddPage\";s:0:\"\";s:7:\"MustUse\";b:0;s:11:\"Description\";s:68:\"Import Custom Post Types and Taxonomies from Custom Post Type UI (<a\";s:7:\"Version\";s:3:\"1.0\";s:8:\"Category\";s:9:\"Migration\";s:6:\"Author\";s:0:\"\";s:9:\"AuthorURI\";s:0:\"\";s:5:\"Class\";s:18:\"Pods_Migrate_CPTUI\";s:4:\"Hide\";s:0:\"\";s:16:\"PluginDependency\";s:0:\"\";s:15:\"ThemeDependency\";s:0:\"\";s:13:\"DeveloperMode\";b:0;s:13:\"TablelessMode\";b:0;s:10:\"Capability\";s:0:\"\";s:6:\"Plugin\";s:69:\"pods-migrate-custom-post-type-ui/pods-migrate-custom-post-type-ui.php\";s:8:\"External\";b:0;s:4:\"File\";s:31:\"Migrate-CPTUI/Migrate-CPTUI.php\";}s:16:\"migrate-packages\";a:25:{s:2:\"ID\";s:16:\"migrate-packages\";s:4:\"Name\";s:17:\"Migrate: Packages\";s:9:\"ShortName\";s:17:\"Migrate: Packages\";s:10:\"PluginName\";s:0:\"\";s:13:\"ComponentName\";s:0:\"\";s:3:\"URI\";s:0:\"\";s:8:\"MenuName\";s:16:\"Migrate Packages\";s:8:\"MenuPage\";s:0:\"\";s:11:\"MenuAddPage\";s:0:\"\";s:7:\"MustUse\";b:0;s:11:\"Description\";s:90:\"Import/Export your Pods, Fields, and other settings from any Pods site; Includes an API to\";s:7:\"Version\";s:3:\"2.0\";s:8:\"Category\";s:9:\"Migration\";s:6:\"Author\";s:0:\"\";s:9:\"AuthorURI\";s:0:\"\";s:5:\"Class\";s:21:\"Pods_Migrate_Packages\";s:4:\"Hide\";s:0:\"\";s:16:\"PluginDependency\";s:0:\"\";s:15:\"ThemeDependency\";s:0:\"\";s:13:\"DeveloperMode\";b:0;s:13:\"TablelessMode\";b:0;s:10:\"Capability\";s:0:\"\";s:6:\"Plugin\";s:47:\"pods-migrate-packages/pods-migrate-packages.php\";s:8:\"External\";b:0;s:4:\"File\";s:37:\"Migrate-Packages/Migrate-Packages.php\";}s:5:\"pages\";a:25:{s:2:\"ID\";s:5:\"pages\";s:4:\"Name\";s:5:\"Pages\";s:9:\"ShortName\";s:5:\"Pages\";s:10:\"PluginName\";s:0:\"\";s:13:\"ComponentName\";s:0:\"\";s:3:\"URI\";s:0:\"\";s:8:\"MenuName\";s:5:\"Pages\";s:8:\"MenuPage\";s:29:\"edit.php?post_type=_pods_page\";s:11:\"MenuAddPage\";s:33:\"post-new.php?post_type=_pods_page\";s:7:\"MustUse\";b:0;s:11:\"Description\";s:96:\"Creates advanced URL structures using wildcards in order to enable the front-end display of Pods\";s:7:\"Version\";s:3:\"2.3\";s:8:\"Category\";s:8:\"Advanced\";s:6:\"Author\";s:0:\"\";s:9:\"AuthorURI\";s:0:\"\";s:5:\"Class\";s:10:\"Pods_Pages\";s:4:\"Hide\";s:0:\"\";s:16:\"PluginDependency\";s:0:\"\";s:15:\"ThemeDependency\";s:0:\"\";s:13:\"DeveloperMode\";b:0;s:13:\"TablelessMode\";b:0;s:10:\"Capability\";s:0:\"\";s:6:\"Plugin\";s:0:\"\";s:8:\"External\";b:0;s:4:\"File\";s:9:\"Pages.php\";}s:22:\"roles-and-capabilities\";a:25:{s:2:\"ID\";s:22:\"roles-and-capabilities\";s:4:\"Name\";s:22:\"Roles and Capabilities\";s:9:\"ShortName\";s:22:\"Roles and Capabilities\";s:10:\"PluginName\";s:0:\"\";s:13:\"ComponentName\";s:0:\"\";s:3:\"URI\";s:0:\"\";s:8:\"MenuName\";s:24:\"Roles &amp; Capabilities\";s:8:\"MenuPage\";s:0:\"\";s:11:\"MenuAddPage\";s:0:\"\";s:7:\"MustUse\";b:0;s:11:\"Description\";s:69:\"Create and Manage WordPress User Roles and Capabilities; Uses the \'<a\";s:7:\"Version\";s:3:\"1.0\";s:8:\"Category\";s:5:\"Tools\";s:6:\"Author\";s:0:\"\";s:9:\"AuthorURI\";s:0:\"\";s:5:\"Class\";s:10:\"Pods_Roles\";s:4:\"Hide\";s:0:\"\";s:16:\"PluginDependency\";s:0:\"\";s:15:\"ThemeDependency\";s:0:\"\";s:13:\"DeveloperMode\";b:0;s:13:\"TablelessMode\";b:0;s:10:\"Capability\";s:0:\"\";s:6:\"Plugin\";s:0:\"\";s:8:\"External\";b:0;s:4:\"File\";s:15:\"Roles/Roles.php\";}s:13:\"table-storage\";a:25:{s:2:\"ID\";s:13:\"table-storage\";s:4:\"Name\";s:13:\"Table Storage\";s:9:\"ShortName\";s:13:\"Table Storage\";s:10:\"PluginName\";s:0:\"\";s:13:\"ComponentName\";s:0:\"\";s:3:\"URI\";s:0:\"\";s:8:\"MenuName\";s:13:\"Table Storage\";s:8:\"MenuPage\";s:0:\"\";s:11:\"MenuAddPage\";s:0:\"\";s:7:\"MustUse\";b:0;s:11:\"Description\";s:98:\"Enable a custom database table for your custom fields on Post Types, Media, Taxonomies, Users, and\";s:7:\"Version\";s:3:\"2.3\";s:8:\"Category\";s:8:\"Advanced\";s:6:\"Author\";s:0:\"\";s:9:\"AuthorURI\";s:0:\"\";s:5:\"Class\";s:18:\"Pods_Table_Storage\";s:4:\"Hide\";s:0:\"\";s:16:\"PluginDependency\";s:0:\"\";s:15:\"ThemeDependency\";s:0:\"\";s:13:\"DeveloperMode\";b:0;s:13:\"TablelessMode\";b:0;s:10:\"Capability\";s:0:\"\";s:6:\"Plugin\";s:0:\"\";s:8:\"External\";b:0;s:4:\"File\";s:17:\"Table-Storage.php\";}s:9:\"templates\";a:25:{s:2:\"ID\";s:9:\"templates\";s:4:\"Name\";s:9:\"Templates\";s:9:\"ShortName\";s:9:\"Templates\";s:10:\"PluginName\";s:0:\"\";s:13:\"ComponentName\";s:0:\"\";s:3:\"URI\";s:0:\"\";s:8:\"MenuName\";s:9:\"Templates\";s:8:\"MenuPage\";s:33:\"edit.php?post_type=_pods_template\";s:11:\"MenuAddPage\";s:37:\"post-new.php?post_type=_pods_template\";s:7:\"MustUse\";b:0;s:11:\"Description\";s:101:\"An easy to use templating engine for Pods. Use {@field_name} magic tags to output values, within your\";s:7:\"Version\";s:3:\"2.3\";s:8:\"Category\";s:8:\"Advanced\";s:6:\"Author\";s:0:\"\";s:9:\"AuthorURI\";s:0:\"\";s:5:\"Class\";s:14:\"Pods_Templates\";s:4:\"Hide\";s:0:\"\";s:16:\"PluginDependency\";s:0:\"\";s:15:\"ThemeDependency\";s:0:\"\";s:13:\"DeveloperMode\";b:0;s:13:\"TablelessMode\";b:0;s:10:\"Capability\";s:0:\"\";s:6:\"Plugin\";s:0:\"\";s:8:\"External\";b:0;s:4:\"File\";s:23:\"Templates/Templates.php\";}s:20:\"translate-pods-admin\";a:25:{s:2:\"ID\";s:20:\"translate-pods-admin\";s:4:\"Name\";s:20:\"Translate Pods Admin\";s:9:\"ShortName\";s:20:\"Translate Pods Admin\";s:10:\"PluginName\";s:0:\"\";s:13:\"ComponentName\";s:0:\"\";s:3:\"URI\";s:0:\"\";s:8:\"MenuName\";s:14:\"Translate Pods\";s:8:\"MenuPage\";s:0:\"\";s:11:\"MenuAddPage\";s:0:\"\";s:7:\"MustUse\";b:0;s:11:\"Description\";s:44:\"Allow UI of Pods and fields to be translated\";s:7:\"Version\";s:3:\"0.1\";s:8:\"Category\";s:4:\"I18n\";s:6:\"Author\";s:0:\"\";s:9:\"AuthorURI\";s:0:\"\";s:5:\"Class\";s:19:\"Pods_Component_I18n\";s:4:\"Hide\";s:0:\"\";s:16:\"PluginDependency\";s:0:\"\";s:15:\"ThemeDependency\";s:0:\"\";s:13:\"DeveloperMode\";b:0;s:13:\"TablelessMode\";b:0;s:10:\"Capability\";s:0:\"\";s:6:\"Plugin\";s:0:\"\";s:8:\"External\";b:0;s:4:\"File\";s:13:\"I18n/I18n.php\";}}', 'yes'),
(691, 'widget_pods_widget_single', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(692, 'widget_pods_widget_list', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(693, 'widget_pods_widget_field', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(694, 'widget_pods_widget_form', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(695, 'widget_pods_widget_view', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(696, '_transient_pods_pods_wp_cpt_ct-2.7.9', 'a:3:{s:10:\"post_types\";a:0:{}s:10:\"taxonomies\";a:0:{}s:22:\"post_format_post_types\";a:0:{}}', 'yes'),
(697, '_transient_pods_pods_get_type_pod-2.7.9', 'none', 'yes'),
(698, '_transient_pods_pods_get_type_post_type-2.7.9', 'none', 'yes'),
(699, '_transient_pods_pods_get_type_taxonomy-2.7.9', 'none', 'yes'),
(700, '_transient_pods_pods_get_type_media-2.7.9', 'none', 'yes'),
(701, '_transient_pods_pods_get_type_user-2.7.9', 'none', 'yes'),
(702, '_transient_pods_pods_get_type_comment-2.7.9', 'none', 'yes'),
(703, '_transient_pods_pods_get_type_settings-2.7.9', 'none', 'yes'),
(711, '_transient_pods_pods_field_types-2.7.9', 'a:20:{s:4:\"text\";a:7:{s:5:\"group\";s:4:\"Text\";s:4:\"type\";s:4:\"text\";s:5:\"label\";s:10:\"Texte brut\";s:7:\"prepare\";s:2:\"%s\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:7:\"website\";a:7:{s:5:\"group\";s:4:\"Text\";s:4:\"type\";s:7:\"website\";s:5:\"label\";s:8:\"Site web\";s:7:\"prepare\";s:2:\"%s\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:5:\"phone\";a:7:{s:5:\"group\";s:4:\"Text\";s:4:\"type\";s:5:\"phone\";s:5:\"label\";s:11:\"Téléphone\";s:7:\"prepare\";s:2:\"%s\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:5:\"email\";a:7:{s:5:\"group\";s:4:\"Text\";s:4:\"type\";s:5:\"email\";s:5:\"label\";s:6:\"E-mail\";s:7:\"prepare\";s:2:\"%s\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:8:\"password\";a:7:{s:5:\"group\";s:4:\"Text\";s:4:\"type\";s:8:\"password\";s:5:\"label\";s:12:\"Mot de passe\";s:7:\"prepare\";s:2:\"%s\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:9:\"paragraph\";a:7:{s:5:\"group\";s:9:\"Paragraph\";s:4:\"type\";s:9:\"paragraph\";s:5:\"label\";s:24:\"Paragraphe de texte brut\";s:7:\"prepare\";s:2:\"%s\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:7:\"wysiwyg\";a:7:{s:5:\"group\";s:9:\"Paragraph\";s:4:\"type\";s:7:\"wysiwyg\";s:5:\"label\";s:25:\"WYSIWYG (Éditeur visuel)\";s:7:\"prepare\";s:2:\"%s\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:4:\"code\";a:7:{s:5:\"group\";s:9:\"Paragraph\";s:4:\"type\";s:4:\"code\";s:5:\"label\";s:25:\"Code (syntaxe surlignée)\";s:7:\"prepare\";s:2:\"%s\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:8:\"datetime\";a:9:{s:5:\"group\";s:11:\"Date / Time\";s:4:\"type\";s:8:\"datetime\";s:5:\"label\";s:10:\"Date/Heure\";s:7:\"prepare\";s:2:\"%s\";s:14:\"storage_format\";s:11:\"Y-m-d H:i:s\";s:11:\"empty_value\";s:19:\"0000-00-00 00:00:00\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:4:\"date\";a:9:{s:5:\"group\";s:11:\"Date / Time\";s:4:\"type\";s:4:\"date\";s:5:\"label\";s:4:\"Date\";s:7:\"prepare\";s:2:\"%s\";s:14:\"storage_format\";s:5:\"Y-m-d\";s:11:\"empty_value\";s:10:\"0000-00-00\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:4:\"time\";a:9:{s:5:\"group\";s:11:\"Date / Time\";s:4:\"type\";s:4:\"time\";s:5:\"label\";s:5:\"Heure\";s:7:\"prepare\";s:2:\"%s\";s:14:\"storage_format\";s:5:\"H:i:s\";s:11:\"empty_value\";s:0:\"\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:6:\"number\";a:7:{s:5:\"group\";s:6:\"Number\";s:4:\"type\";s:6:\"number\";s:5:\"label\";s:11:\"Nombre brut\";s:7:\"prepare\";s:2:\"%d\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:8:\"currency\";a:8:{s:5:\"group\";s:6:\"Number\";s:4:\"type\";s:8:\"currency\";s:5:\"label\";s:6:\"Devise\";s:7:\"prepare\";s:2:\"%d\";s:10:\"currencies\";a:31:{s:3:\"aud\";a:4:{s:5:\"label\";s:3:\"AUD\";s:4:\"name\";s:17:\"Dollar australien\";s:4:\"sign\";s:1:\"$\";s:6:\"entity\";s:5:\"&#36;\";}s:3:\"brl\";a:4:{s:5:\"label\";s:3:\"BRL\";s:4:\"name\";s:16:\"Réal brésilien\";s:4:\"sign\";s:2:\"R$\";s:6:\"entity\";s:6:\"R&#36;\";}s:3:\"cad\";a:4:{s:5:\"label\";s:3:\"CAD\";s:4:\"name\";s:15:\"Dollar canadien\";s:4:\"sign\";s:1:\"$\";s:6:\"entity\";s:5:\"&#36;\";}s:3:\"chf\";a:4:{s:5:\"label\";s:3:\"CHF\";s:4:\"name\";s:12:\"Franc suisse\";s:4:\"sign\";s:2:\"Fr\";s:6:\"entity\";s:2:\"Fr\";}s:3:\"cny\";a:4:{s:5:\"label\";s:3:\"CNY\";s:4:\"name\";s:12:\"Yuan chinois\";s:4:\"sign\";s:2:\"¥\";s:6:\"entity\";s:5:\"&yen;\";}s:4:\"cny2\";a:4:{s:5:\"label\";s:3:\"CNY\";s:4:\"name\";s:12:\"Yuan chinois\";s:4:\"sign\";s:3:\"元\";s:6:\"entity\";s:8:\"&#20803;\";}s:3:\"czk\";a:4:{s:5:\"label\";s:3:\"CZK\";s:4:\"name\";s:17:\"Couronne tchèque\";s:4:\"sign\";s:3:\"Kč\";s:6:\"entity\";s:8:\"K&#x10D;\";}s:3:\"dkk\";a:4:{s:5:\"label\";s:3:\"DKK\";s:4:\"name\";s:16:\"Couronne danoise\";s:4:\"sign\";s:3:\"kr.\";s:6:\"entity\";s:3:\"kr.\";}s:4:\"euro\";a:4:{s:5:\"label\";s:3:\"EUR\";s:4:\"name\";s:4:\"Euro\";s:4:\"sign\";s:3:\"€\";s:6:\"entity\";s:6:\"&euro;\";}s:3:\"gbp\";a:4:{s:5:\"label\";s:3:\"GBP\";s:4:\"name\";s:17:\"Livre britannique\";s:4:\"sign\";s:2:\"£\";s:6:\"entity\";s:7:\"&pound;\";}s:3:\"hkd\";a:4:{s:5:\"label\";s:3:\"HKD\";s:4:\"name\";s:18:\"Dollar hongkongais\";s:4:\"sign\";s:1:\"$\";s:6:\"entity\";s:5:\"&#36;\";}s:3:\"huf\";a:4:{s:5:\"label\";s:3:\"HUF\";s:4:\"name\";s:15:\"Forint hongrois\";s:4:\"sign\";s:2:\"Ft\";s:6:\"entity\";s:2:\"Ft\";}s:3:\"ils\";a:4:{s:5:\"label\";s:3:\"ILS\";s:4:\"name\";s:25:\"Nouveau shekel israélien\";s:4:\"sign\";s:3:\"₪\";s:6:\"entity\";s:8:\"&#x20AA;\";}s:3:\"inr\";a:4:{s:5:\"label\";s:3:\"INR\";s:4:\"name\";s:15:\"Roupie Indienne\";s:4:\"sign\";s:3:\"₹\";s:6:\"entity\";s:8:\"&#x20B9;\";}s:3:\"jpy\";a:4:{s:5:\"label\";s:3:\"JPY\";s:4:\"name\";s:13:\"Yen japonais \";s:4:\"sign\";s:2:\"¥\";s:6:\"entity\";s:5:\"&yen;\";}s:3:\"krw\";a:4:{s:5:\"label\";s:3:\"KRW\";s:4:\"name\";s:15:\"Won sud-coréen\";s:4:\"sign\";s:3:\"₩\";s:6:\"entity\";s:7:\"&#8361;\";}s:3:\"mxn\";a:4:{s:5:\"label\";s:3:\"MXN\";s:4:\"name\";s:13:\"Peso mexicain\";s:4:\"sign\";s:1:\"$\";s:6:\"entity\";s:5:\"&#36;\";}s:3:\"myr\";a:4:{s:5:\"label\";s:3:\"MYR\";s:4:\"name\";s:14:\"Ringgit malais\";s:4:\"sign\";s:2:\"MR\";s:6:\"entity\";s:2:\"MR\";}s:3:\"nok\";a:4:{s:5:\"label\";s:3:\"NOK\";s:4:\"name\";s:21:\"Couronne norvégienne\";s:4:\"sign\";s:2:\"kr\";s:6:\"entity\";s:2:\"kr\";}s:3:\"nzd\";a:4:{s:5:\"label\";s:3:\"NZD\";s:4:\"name\";s:22:\"Dollar néo-zélandais\";s:4:\"sign\";s:1:\"$\";s:6:\"entity\";s:5:\"&#36;\";}s:3:\"php\";a:4:{s:5:\"label\";s:3:\"PHP\";s:4:\"name\";s:14:\"Peso philippin\";s:4:\"sign\";s:3:\"₱\";s:6:\"entity\";s:8:\"&#x20B1;\";}s:3:\"pln\";a:4:{s:5:\"label\";s:3:\"PLN\";s:4:\"name\";s:14:\"Zloty polonais\";s:4:\"sign\";s:3:\"zł\";s:6:\"entity\";s:8:\"z&#x142;\";}s:3:\"rub\";a:4:{s:5:\"label\";s:3:\"RUB\";s:4:\"name\";s:12:\"Rouble russe\";s:4:\"sign\";s:3:\"₽\";s:6:\"entity\";s:7:\"&#8381;\";}s:3:\"sek\";a:4:{s:5:\"label\";s:3:\"SEK\";s:4:\"name\";s:18:\"Couronne suédoise\";s:4:\"sign\";s:2:\"kr\";s:6:\"entity\";s:2:\"kr\";}s:3:\"sgd\";a:4:{s:5:\"label\";s:3:\"SGD\";s:4:\"name\";s:19:\"Dollar singapourien\";s:4:\"sign\";s:1:\"$\";s:6:\"entity\";s:5:\"&#36;\";}s:3:\"thb\";a:4:{s:5:\"label\";s:3:\"THB\";s:4:\"name\";s:17:\"Baht thaïlandais\";s:4:\"sign\";s:3:\"฿\";s:6:\"entity\";s:8:\"&#x0E3F;\";}s:3:\"trl\";a:4:{s:5:\"label\";s:3:\"TRL\";s:4:\"name\";s:12:\"Livre turque\";s:4:\"sign\";s:3:\"₺\";s:6:\"entity\";s:7:\"&#8378;\";}s:3:\"twd\";a:4:{s:5:\"label\";s:3:\"TWD\";s:4:\"name\";s:25:\"Nouveau dollar de Taïwan\";s:4:\"sign\";s:1:\"$\";s:6:\"entity\";s:5:\"&#36;\";}s:3:\"usd\";a:4:{s:5:\"label\";s:3:\"USD\";s:4:\"name\";s:9:\"Dollar US\";s:4:\"sign\";s:1:\"$\";s:6:\"entity\";s:5:\"&#36;\";}s:3:\"vnd\";a:4:{s:5:\"label\";s:3:\"VND\";s:4:\"name\";s:15:\"Dong vietnamien\";s:4:\"sign\";s:3:\"₫\";s:6:\"entity\";s:7:\"&#8363;\";}s:3:\"zar\";a:4:{s:5:\"label\";s:3:\"ZAR\";s:4:\"name\";s:17:\"Rand sud-africain\";s:4:\"sign\";s:1:\"R\";s:6:\"entity\";s:1:\"R\";}}s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:4:\"file\";a:7:{s:5:\"group\";s:21:\"Relationships / Media\";s:4:\"type\";s:4:\"file\";s:5:\"label\";s:20:\"Fichier/Image/Vidéo\";s:10:\"deprecated\";b:0;s:7:\"prepare\";s:2:\"%s\";s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:6:\"avatar\";a:7:{s:5:\"group\";s:21:\"Relationships / Media\";s:4:\"type\";s:6:\"avatar\";s:5:\"label\";s:6:\"Avatar\";s:9:\"pod_types\";a:1:{i:0;s:4:\"user\";}s:10:\"deprecated\";b:0;s:7:\"prepare\";s:2:\"%s\";s:4:\"file\";N;}s:6:\"oembed\";a:7:{s:5:\"group\";s:21:\"Relationships / Media\";s:4:\"type\";s:6:\"oembed\";s:5:\"label\";s:14:\"Contenu oEmbed\";s:7:\"prepare\";s:2:\"%s\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:4:\"pick\";a:11:{s:5:\"group\";s:21:\"Relationships / Media\";s:4:\"type\";s:4:\"pick\";s:5:\"label\";s:8:\"Relation\";s:15:\"related_objects\";a:0:{}s:22:\"custom_related_objects\";a:0:{}s:12:\"related_data\";a:0:{}s:10:\"field_data\";a:0:{}s:10:\"deprecated\";b:0;s:7:\"prepare\";s:2:\"%s\";s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:7:\"boolean\";a:6:{s:4:\"type\";s:7:\"boolean\";s:5:\"label\";s:7:\"Oui/Non\";s:7:\"prepare\";s:2:\"%s\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:5:\"color\";a:6:{s:4:\"type\";s:5:\"color\";s:5:\"label\";s:21:\"Sélecteur de couleur\";s:7:\"prepare\";s:2:\"%s\";s:10:\"deprecated\";b:0;s:9:\"pod_types\";b:1;s:4:\"file\";N;}s:4:\"slug\";a:6:{s:4:\"type\";s:4:\"slug\";s:5:\"label\";s:24:\"Permalien (URL-friendly)\";s:7:\"prepare\";s:2:\"%s\";s:9:\"pod_types\";a:2:{i:0;s:3:\"pod\";i:1;s:5:\"table\";}s:10:\"deprecated\";b:0;s:4:\"file\";N;}}', 'yes'),
(712, '_transient_pods_pods_form_admin_init_field_types-2.7.9', 'a:20:{i:0;s:4:\"text\";i:1;s:7:\"website\";i:2;s:5:\"phone\";i:3;s:5:\"email\";i:4;s:8:\"password\";i:5;s:9:\"paragraph\";i:6;s:7:\"wysiwyg\";i:7;s:4:\"code\";i:8;s:8:\"datetime\";i:9;s:4:\"date\";i:10;s:4:\"time\";i:11;s:6:\"number\";i:12;s:8:\"currency\";i:13;s:4:\"file\";i:14;s:6:\"avatar\";i:15;s:6:\"oembed\";i:16;s:4:\"pick\";i:17;s:7:\"boolean\";i:18;s:5:\"color\";i:19;s:4:\"slug\";}', 'yes'),
(718, 'current_theme', 'Radiate', 'yes'),
(719, 'theme_mods_radiate', 'a:7:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:5;}s:18:\"custom_css_post_id\";i:-1;s:12:\"header_image\";s:96:\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/cropped-14598211520_bbbc43b0f1_o.jpg\";s:17:\"header_image_data\";O:8:\"stdClass\":5:{s:13:\"attachment_id\";i:226;s:3:\"url\";s:96:\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/cropped-14598211520_bbbc43b0f1_o.jpg\";s:13:\"thumbnail_url\";s:96:\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/cropped-14598211520_bbbc43b0f1_o.jpg\";s:6:\"height\";i:402;s:5:\"width\";i:1340;}s:16:\"background_color\";s:6:\"f7f7f7\";s:20:\"radiate_color_scheme\";s:7:\"#d1b17b\";}', 'yes'),
(720, 'theme_switched', '', 'yes'),
(721, 'radiate_admin_notice_welcome', '1', 'yes'),
(724, '_transient_pods_pods_fr_get_type_pod-2.7.9', 'none', 'yes'),
(725, '_transient_pods_pods_fr_get_type_post_type-2.7.9', 'none', 'yes'),
(726, '_transient_pods_pods_fr_get_type_taxonomy-2.7.9', 'none', 'yes'),
(727, '_transient_pods_pods_fr_get_type_media-2.7.9', 'none', 'yes'),
(728, '_transient_pods_pods_fr_get_type_user-2.7.9', 'none', 'yes'),
(729, '_transient_pods_pods_fr_get_type_comment-2.7.9', 'none', 'yes'),
(730, '_transient_pods_pods_fr_get_type_settings-2.7.9', 'none', 'yes'),
(735, '_transient_pods_pods_de_get_type_pod-2.7.9', 'none', 'yes'),
(736, '_transient_pods_pods_de_get_type_post_type-2.7.9', 'none', 'yes'),
(737, '_transient_pods_pods_de_get_type_taxonomy-2.7.9', 'none', 'yes'),
(738, '_transient_pods_pods_de_get_type_media-2.7.9', 'none', 'yes'),
(739, '_transient_pods_pods_de_get_type_user-2.7.9', 'none', 'yes'),
(740, '_transient_pods_pods_de_get_type_comment-2.7.9', 'none', 'yes'),
(741, '_transient_pods_pods_de_get_type_settings-2.7.9', 'none', 'yes'),
(743, '_transient_pods__pods_pfat_the_pods-2.7.9', 'a:0:{}', 'yes'),
(744, '_transient_pods__pods_pfat_auto_pods-2.7.9', 'a:0:{}', 'yes'),
(749, 'wpsp_dashbord_general', 'a:2:{s:8:\"statuses\";a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";}s:22:\"allow_to_view_customer\";s:1:\"1\";}', 'yes'),
(760, '_transient_timeout_feed_0d102f2a1f4d6bc90eb8c6ffe18e56ed', '1540246523', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(761, '_transient_feed_0d102f2a1f4d6bc90eb8c6ffe18e56ed', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:49:\"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:19:\"The Events Calendar\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://theeventscalendar.com\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:42:\"WordPress event plugins for awesome people\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:13:\"lastBuildDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 22 Oct 2018 07:18:38 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"en-US\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:10:{i:0;a:6:{s:4:\"data\";s:36:\"\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"Events Gutenberg 0.3.2-alpha Release\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"https://theeventscalendar.com/events-gutenberg-0-3-2-alpha-release/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 20 Oct 2018 02:41:20 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:8:\"Products\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:13:\"Release Notes\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://theeventscalendar.com/?p=1645370\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:582:\"<p>Another week and another round of updates as we prepare for WordPress 5&#8217;s release. We are still really excited to show off the new blocks for Event Tickets (and Event Tickets Plus). We hope you love them as much as we do! This week&#8217;s changelog for our Events Gutenberg extension includes 5 new fixes. Events&#8230;</p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/events-gutenberg-0-3-2-alpha-release/\">Events Gutenberg 0.3.2-alpha Release</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Zach Tirrell\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:7207:\"<p>Another week and another round of updates as we prepare for WordPress 5&#8217;s release. We are still really excited to show off the new blocks for <a href=\"http://wordpress.org/plugins/event-tickets/\">Event Tickets</a> (and <a href=\"https://theeventscalendar.com/product/wordpress-event-tickets-plus/\">Event Tickets Plus</a>). We hope you love them as much as we do! This week&#8217;s changelog for our <a href=\"https://theeventscalendar.com/extensions/events-gutenberg/\">Events Gutenberg extension</a> includes 5 new fixes.</p>\n<p>Events Gutenberg 0.3.2-alpha is compatible with:</p>\n<ul>\n<li><strong>The Events Calendar</strong>: Version 4.6.24.1 or higher</li>\n<li><strong>Gutenberg</strong>: Version 4.0.0</li>\n</ul>\n<p><a class=\"btn-filled extension-download-link\" href=\"https://theeventscalendar.com/extensions/events-gutenberg/\" target=\"_blank\" rel=\"noopener\">Get the Extension</a></p>\n<p><em>If this is your first time getting your hands on Gutenberg, prepare yourself with this <a href=\"https://theeventscalendar.com/wordpress-gutenberg-block-editor-checklist/\">site prep checklist</a>.</em></p>\n<h2>Events Gutenberg 0.3.2-alpha Changelog</h2>\n<ul>\n<li>Fix &#8211; Custom Fields a.k.a. Meta is now saving properly for Events</li>\n<li>Fix &#8211; Adjust vertical alignment of the price section for the classic event date time block</li>\n<li>Fix &#8211; Make sure the ticket block uses the currency from the ticket provider</li>\n<li>Fix &#8211; Header image failing to load due to Incorrect variable type on RSVP block</li>\n<li>Fix &#8211; Venue form is now loading correctly on the Venue block</li>\n</ul>\n<p><em><strong>Please note</strong> that just as with the Gutenberg plugin, this extension is not for use on production sites. Like Gutenberg, it should only be activated on a test site or local install.</em></p>\n<h3>Stay in the Loop</h3>\n<p>Check out our <a href=\"https://theeventscalendar.com/gutenberg-block-editor-news/\">block editor news page</a> for details on the latest Gutenberg developments.</p>\n<p>You can also get the latest news, updates, and announcements delivered to your inbox by signing up for our newsletter.<br />\n\n                <div class=\'gf_browser_unknown gform_wrapper\' id=\'gform_wrapper_28\' ><form method=\'post\' enctype=\'multipart/form-data\'  id=\'gform_28\'  action=\'/feed/\'>\n                        <div class=\'gform_body\'><ul id=\'gform_fields_28\' class=\'gform_fields top_label form_sublabel_below description_below\'><li id=\'field_28_7\'  class=\'gfield field_sublabel_above field_description_above gfield_visibility_visible\' ><label class=\'gfield_label gfield_label_before_complex\' for=\'input_28_7_3\' >Name</label><div class=\'ginput_complex ginput_container no_prefix has_first_name no_middle_name has_last_name no_suffix gf_name_has_2 ginput_container_name gfield_trigger_change\' id=\'input_28_7\'>\n                            \n                            <span id=\'input_28_7_3_container\' class=\'name_first\' >\n                                                    <label for=\'input_28_7_3\' >First</label>\n                                                    <input type=\'text\' name=\'input_7.3\' id=\'input_28_7_3\' value=\'\' aria-label=\'First name\'    aria-invalid=\"false\" />\n                                                </span>\n                            \n                            <span id=\'input_28_7_6_container\' class=\'name_last\' >\n                                                            <label for=\'input_28_7_6\' >Last</label>\n                                                            <input type=\'text\' name=\'input_7.6\' id=\'input_28_7_6\' value=\'\' aria-label=\'Last name\'    aria-invalid=\"false\" />\n                                                        </span>\n                            \n                        </div></li><li id=\'field_28_8\'  class=\'gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_hidden\' ><label class=\'gfield_label\' for=\'input_28_8\' >Email<span class=\'gfield_required\'>*</span></label><div class=\'ginput_container ginput_container_email\'>\n                            <input name=\'input_8\' id=\'input_28_8\' type=\'email\' value=\'\' class=\'medium\'     aria-required=\"true\" aria-invalid=\"false\"/>\n                        </div></li><li id=\'field_28_3\'  class=\'gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible is-gf-checkbox\' ><label class=\'gfield_label\'  ><span class=\'gfield_required\'>*</span></label><div class=\'ginput_container ginput_container_checkbox\'><ul class=\'gfield_checkbox\' id=\'input_28_3\'><li class=\'gchoice_28_3_1\'>\n								<input name=\'input_3.1\' type=\'checkbox\'  value=\'Sign me up for news &amp; updates\' checked=\'checked\' id=\'choice_28_3_1\'   />\n								<label for=\'choice_28_3_1\' id=\'label_28_3_1\'>Sign me up for news & updates</label>\n							</li></ul></div></li><li id=\'field_28_9\'  class=\'gfield gform_hidden field_sublabel_below field_description_below gfield_visibility_visible\' ><input name=\'input_9\' id=\'input_28_9\' type=\'hidden\' class=\'gform_hidden\'  aria-invalid=\"false\" value=\'Gutenberg newsletter signup\' /></li>\n                            </ul></div>\n        <div class=\'gform_footer top_label\'> <input type=\'submit\' id=\'gform_submit_button_28\' class=\'gform_button button\' value=\'Sign Up!\'  onclick=\'if(window[\"gf_submitting_28\"]){return false;}  if( !jQuery(\"#gform_28\")[0].checkValidity || jQuery(\"#gform_28\")[0].checkValidity()){window[\"gf_submitting_28\"]=true;}  \' onkeypress=\'if( event.keyCode == 13 ){ if(window[\"gf_submitting_28\"]){return false;} if( !jQuery(\"#gform_28\")[0].checkValidity || jQuery(\"#gform_28\")[0].checkValidity()){window[\"gf_submitting_28\"]=true;}  jQuery(\"#gform_28\").trigger(\"submit\",[true]); }\' /> \n            <input type=\'hidden\' class=\'gform_hidden\' name=\'is_submit_28\' value=\'1\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_submit\' value=\'28\' />\n            \n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_unique_id\' value=\'\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'state_28\' value=\'WyJbXSIsImM3MzcyYjNlZGVlNTZhMGE4MDM4NGMzMzkwNmEwMGM3Il0=\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_target_page_number_28\' id=\'gform_target_page_number_28\' value=\'0\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_source_page_number_28\' id=\'gform_source_page_number_28\' value=\'1\' />\n            <input type=\'hidden\' name=\'gform_field_values\' value=\'\' />\n            \n        </div>\n                        </form>\n                        </div><script type=\'text/javascript\'> jQuery(document).bind(\'gform_post_render\', function(event, formId, currentPage){if(formId == 28) {} } );jQuery(document).bind(\'gform_post_conditional_logic\', function(event, formId, fields, isInit){} );</script><script type=\'text/javascript\'> jQuery(document).ready(function(){jQuery(document).trigger(\'gform_post_render\', [28, 1]) } ); </script></p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/events-gutenberg-0-3-2-alpha-release/\">Events Gutenberg 0.3.2-alpha Release</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:54:\"Translations Update: Top Five Languages 100% Complete!\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:59:\"https://theeventscalendar.com/improved-plugin-translations/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 17 Oct 2018 18:26:56 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:8:\"Articles\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:20:\"News & Announcements\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:11:\"translation\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://theeventscalendar.com/?p=1642467\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:623:\"<p>In many ways, the Internet has made our world smaller than ever before. Distance and language are no longer barriers to business or communication. Although English is the most popular language used on the Internet, it’s the third most popular language spoken around the world. To better serve our international users, we’ve dedicated resources to&#8230;</p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/improved-plugin-translations/\">Translations Update: Top Five Languages 100% Complete!</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:3:\"Jen\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:2510:\"<p>In many ways, the Internet has made our world smaller than ever before. Distance and language are no longer barriers to business or communication. Although English is the <a href=\"https://www.internetworldstats.com/stats7.htm\">most popular language used on the Internet</a>, it’s the <strong>third</strong> most popular language spoken around the world.</p>\n<p>To better serve our international users, we’ve dedicated resources to fully translate the top 5 language files for <a href=\"https://theeventscalendar.com/product/wordpress-events-calendar-pro/\">Events Calendar PRO</a>, <a href=\"https://theeventscalendar.com/product/wordpress-event-tickets-plus/\">Event Tickets Plus</a>, and Tribe Common.</p>\n<h2>Languages Translated 100%</h2>\n<p>We’re excited to announce the following languages are 100% translated for Events Calendar PRO, Event Tickets Plus, and Tribe Common!</p>\n<ul>\n<li>German</li>\n<li>Italian</li>\n<li>French (France)</li>\n<li>Spanish (Spain)</li>\n<li>Japanese</li>\n</ul>\n<p>To download the translation files for these languages (as well as others that are currently in progress), please visit our <a href=\"https://translations.theeventscalendar.com/projects/\">translations site</a>.</p>\n<h2>More Languages to Come</h2>\n<p>We love the diversity represented in our user base! While these 5 languages are the only ones 100% translated <em>right now</em>, we have <a href=\"https://translations.theeventscalendar.com/projects/\">many other languages and other projects</a> available with varying degrees of completeness.</p>\n<p>As our team continues our translation progress, we welcome contributions from the community for new language translations and updates to existing translations. If you would like to contribute, our <a href=\"https://theeventscalendar.com/knowledgebase/adding-or-updating-a-translation/\">translations knowledgebase article</a> explains how to help.</p>\n<h2>Need Help?</h2>\n<p>Our support team recently hosted a live webinar to help users navigate our translation files, integrate with 3rd party translation plugins, and answer common troubleshooting questions. You can view the <a href=\"https://theeventscalendar.com/translating-the-events-calendar-webinar/\">translations webinar recording here</a>.</p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/improved-plugin-translations/\">Translations Update: Top Five Languages 100% Complete!</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:33:\"\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"Events Gutenberg 0.3.1-alpha Release\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:59:\"https://theeventscalendar.com/events-gutenberg-0-3-1-alpha/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 12 Oct 2018 18:42:52 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Release Notes\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://theeventscalendar.com/?p=1642356\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:636:\"<p>This week&#8217;s changelog for our Events Gutenberg extension includes 8 new fixes. Events Gutenberg 0.3.1-alpha is compatible with: The Events Calendar: Version 4.6.23 or higher Gutenberg: Version 3.9.0 Get the Extension If this is your first time getting your hands on Gutenberg, prepare yourself with this site prep checklist. Events Gutenberg 0.3.1-alpha Changelog Fix &#8211;&#8230;</p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/events-gutenberg-0-3-1-alpha/\">Events Gutenberg 0.3.1-alpha Release</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:3:\"Jen\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:7084:\"<p>This week&#8217;s changelog for our <a href=\"https://theeventscalendar.com/extensions/events-gutenberg/\">Events Gutenberg extension</a> includes 8 new fixes.</p>\n<p>Events Gutenberg 0.3.1-alpha is compatible with:</p>\n<ul>\n<li><strong>The Events Calendar</strong>: Version 4.6.23 or higher</li>\n<li><strong>Gutenberg</strong>: Version 3.9.0</li>\n</ul>\n<p><a class=\"btn-filled extension-download-link\" href=\"https://theeventscalendar.com/extensions/events-gutenberg/\" target=\"_blank\" rel=\"noopener\">Get the Extension</a></p>\n<p><em>If this is your first time getting your hands on Gutenberg, prepare yourself with this <a href=\"https://theeventscalendar.com/wordpress-gutenberg-block-editor-checklist/\">site prep checklist</a>.</em></p>\n<h2>Events Gutenberg 0.3.1-alpha Changelog</h2>\n<ul>\n<li>Fix &#8211; Make sure Classic Editor migration treats correctly Events with Tickets</li>\n<li>Fix &#8211; Error when multi-day toggle component was not functional</li>\n<li>Fix &#8211; Prevent reset of times when set for an event from time pickers</li>\n<li>Fix &#8211; Sync UI of datetime block and human readable input so any changes on any is reflected on the other</li>\n<li>Fix &#8211; Make sure meta types matches before send into the request for Tickets block</li>\n<li>Fix &#8211; Load Going and Not Going values on the RSVP block</li>\n<li>Fix &#8211; Render &#8220;Not Going&#8221; button on RSVP block conditionally</li>\n<li>Fix &#8211; Make sure that the event venue selection works</li>\n</ul>\n<p><em><strong>Please note</strong> that just as with the Gutenberg plugin, this extension is not for use on production sites. Like Gutenberg, it should only be activated on a test site or local install.</em></p>\n<h3>Stay in the Loop</h3>\n<p>Check out our <a href=\"https://theeventscalendar.com/gutenberg-block-editor-news/\">block editor news page</a> for details on the latest Gutenberg developments.</p>\n<p>You can also get the latest news, updates, and announcements delivered to your inbox by signing up for our newsletter.<br />\n\n                <div class=\'gf_browser_unknown gform_wrapper\' id=\'gform_wrapper_28\' ><form method=\'post\' enctype=\'multipart/form-data\'  id=\'gform_28\'  action=\'/feed/\'>\n                        <div class=\'gform_body\'><ul id=\'gform_fields_28\' class=\'gform_fields top_label form_sublabel_below description_below\'><li id=\'field_28_7\'  class=\'gfield field_sublabel_above field_description_above gfield_visibility_visible\' ><label class=\'gfield_label gfield_label_before_complex\' for=\'input_28_7_3\' >Name</label><div class=\'ginput_complex ginput_container no_prefix has_first_name no_middle_name has_last_name no_suffix gf_name_has_2 ginput_container_name gfield_trigger_change\' id=\'input_28_7\'>\n                            \n                            <span id=\'input_28_7_3_container\' class=\'name_first\' >\n                                                    <label for=\'input_28_7_3\' >First</label>\n                                                    <input type=\'text\' name=\'input_7.3\' id=\'input_28_7_3\' value=\'\' aria-label=\'First name\'    aria-invalid=\"false\" />\n                                                </span>\n                            \n                            <span id=\'input_28_7_6_container\' class=\'name_last\' >\n                                                            <label for=\'input_28_7_6\' >Last</label>\n                                                            <input type=\'text\' name=\'input_7.6\' id=\'input_28_7_6\' value=\'\' aria-label=\'Last name\'    aria-invalid=\"false\" />\n                                                        </span>\n                            \n                        </div></li><li id=\'field_28_8\'  class=\'gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_hidden\' ><label class=\'gfield_label\' for=\'input_28_8\' >Email<span class=\'gfield_required\'>*</span></label><div class=\'ginput_container ginput_container_email\'>\n                            <input name=\'input_8\' id=\'input_28_8\' type=\'email\' value=\'\' class=\'medium\'     aria-required=\"true\" aria-invalid=\"false\"/>\n                        </div></li><li id=\'field_28_3\'  class=\'gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible is-gf-checkbox\' ><label class=\'gfield_label\'  ><span class=\'gfield_required\'>*</span></label><div class=\'ginput_container ginput_container_checkbox\'><ul class=\'gfield_checkbox\' id=\'input_28_3\'><li class=\'gchoice_28_3_1\'>\n								<input name=\'input_3.1\' type=\'checkbox\'  value=\'Sign me up for news &amp; updates\' checked=\'checked\' id=\'choice_28_3_1\'   />\n								<label for=\'choice_28_3_1\' id=\'label_28_3_1\'>Sign me up for news & updates</label>\n							</li></ul></div></li><li id=\'field_28_9\'  class=\'gfield gform_hidden field_sublabel_below field_description_below gfield_visibility_visible\' ><input name=\'input_9\' id=\'input_28_9\' type=\'hidden\' class=\'gform_hidden\'  aria-invalid=\"false\" value=\'Gutenberg newsletter signup\' /></li>\n                            </ul></div>\n        <div class=\'gform_footer top_label\'> <input type=\'submit\' id=\'gform_submit_button_28\' class=\'gform_button button\' value=\'Sign Up!\'  onclick=\'if(window[\"gf_submitting_28\"]){return false;}  if( !jQuery(\"#gform_28\")[0].checkValidity || jQuery(\"#gform_28\")[0].checkValidity()){window[\"gf_submitting_28\"]=true;}  \' onkeypress=\'if( event.keyCode == 13 ){ if(window[\"gf_submitting_28\"]){return false;} if( !jQuery(\"#gform_28\")[0].checkValidity || jQuery(\"#gform_28\")[0].checkValidity()){window[\"gf_submitting_28\"]=true;}  jQuery(\"#gform_28\").trigger(\"submit\",[true]); }\' /> \n            <input type=\'hidden\' class=\'gform_hidden\' name=\'is_submit_28\' value=\'1\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_submit\' value=\'28\' />\n            \n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_unique_id\' value=\'\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'state_28\' value=\'WyJbXSIsImM3MzcyYjNlZGVlNTZhMGE4MDM4NGMzMzkwNmEwMGM3Il0=\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_target_page_number_28\' id=\'gform_target_page_number_28\' value=\'0\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_source_page_number_28\' id=\'gform_source_page_number_28\' value=\'1\' />\n            <input type=\'hidden\' name=\'gform_field_values\' value=\'\' />\n            \n        </div>\n                        </form>\n                        </div><script type=\'text/javascript\'> jQuery(document).bind(\'gform_post_render\', function(event, formId, currentPage){if(formId == 28) {} } );jQuery(document).bind(\'gform_post_conditional_logic\', function(event, formId, fields, isInit){} );</script><script type=\'text/javascript\'> jQuery(document).ready(function(){jQuery(document).trigger(\'gform_post_render\', [28, 1]) } ); </script></p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/events-gutenberg-0-3-1-alpha/\">Events Gutenberg 0.3.1-alpha Release</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:52:\"WooCommerce SEO: 6 Tips to Boost Traffic &amp; Sales\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"https://theeventscalendar.com/woocommerce-seo-tips/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 11 Oct 2018 17:08:44 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:8:\"Articles\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:3:\"seo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:11:\"WooCommerce\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://theeventscalendar.com/?p=1641109\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:581:\"<p>SEO (search engine optimization) plays a huge role in how your e-commerce store appears in search results. Why put effort into it? Because even a little bit of extra WooCommerce SEO strategy can help your store rank higher (hello first page of Google!), reach more people, and close more sales. WooCommerce + SEO In a&#8230;</p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/woocommerce-seo-tips/\">WooCommerce SEO: 6 Tips to Boost Traffic &#038; Sales</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:3:\"Jen\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:21748:\"<p>SEO (search engine optimization) plays a huge role in how your e-commerce store appears in search results. Why put effort into it? Because even a little bit of extra WooCommerce SEO strategy can help your store rank higher (<strong>hello first page of Google!</strong>), reach more people, and close more sales.</p>\n<h2>WooCommerce + SEO</h2>\n<p>In a nutshell, SEO is a combination of techniques that increase the organic visibility of a web page. If you have an online shoe store, when someone searches for &#8220;kids sandals,&#8221; you want product pages from your WooCommerce store to show up ahead of your competition.</p>\n<p>The code WooCommerce is built on is already optimized for SEO, so it&#8217;s a super solid foundation to start with. <strong>Any additional efforts you put into your site’s search optimization will only make it better. </strong>And since the results are long-term, you’ll reap the benefits for years to come.</p>\n<h2>Actionable WooCommerce SEO Tips</h2>\n<p>Google and other search engines are constantly changing their algorithms to decide which results to show first on the search engine results page (SERP)—that’s what users see after they type their question or keyword query into a search box. Many “so-called” experts will claim to know what factors influence the rankings of search engines, but the truth is that it’s always changing and nobody outside of the search engine companies themselves really knows.</p>\n<p>Instead of wagering guesses, we&#8217;re going to focus on proven best practices for WooCommerce store optimization.</p>\n<h4>#1: Always Include a Product Description</h4>\n<p>Search engines crawl product descriptions just like they crawl other content on your site, so it&#8217;s important to fill in this information for every product in your WooCommerce inventory.</p>\n<p>When it comes to product descriptions, you have two choices:</p>\n<ol>\n<li>Use the manufacturer descriptions (not recommended)</li>\n<li>Write your own custom descriptions</li>\n</ol>\n<p>While you <em>can</em> use manufacturer product descriptions, they won’t help your search ranking as much as writing your own. Custom descriptions help you <strong>put your customer&#8217;s needs first</strong>—when you write as though you&#8217;re talking directly to your customers, it&#8217;s easy to naturally work in keywords while describing product details and value.</p>\n<p>By nailing your product descriptions, you’ll attract more traffic <em>and</em> improve your conversion rate.</p>\n<h4>#2: Use Strategic Page Titles</h4>\n<p>For most e-commerce sites, you’ll have category pages and product pages. It’s important to understand the difference from an SEO perspective.</p>\n<p><strong>Category pages</strong> group like items together so it’s easy for shoppers to find the products they’re looking for. When it comes to WooCommerce SEO, they also serve another important function—category pages prevent individual product pages from competing with each other in search engine results. <strong>Category page titles should be keyword-optimized for a broad term</strong>, such as “Kids Footwear.”</p>\n<p><strong>Product pages</strong> are specific to each product in your inventory. Your title should naturally include <strong>more distinct, explicit keyword terms</strong> that describe the unique model or feature of the product, such as “Merrell Big Kid Hydro Sandal.”</p>\n<h4>#3: Keep URLs Simple &amp; Concise</h4>\n<p>If you’re not using pretty permalinks, URLs for WooCommerce products will default to using the Product ID, such as <em>example.com/?product=001</em>. A URL that only contains the product ID isn’t very descriptive for users or search engines.</p>\n<p>Any option other than plain is considered a pretty permalink. If you are using pretty permalinks, the default will use the Product Name, such as <em>example.com/product/product-name</em>.</p>\n<p>To set pretty permalinks, navigate to <strong>Settings &gt; Permalinks</strong> from your WordPress admin and choose a structure that allows you to use product names and/or product categories in your URLs.</p>\n<div id=\"attachment_1641122\" style=\"width: 1158px\" class=\"wp-caption aligncenter\"><img class=\"size-full wp-image-1641122\" src=\"http://theeventscalendar.com/content/uploads/2018/10/WooCommerce_Product_Permalinks.png\" alt=\"Product Permalinks screenshot\" width=\"1148\" height=\"336\" srcset=\"https://theeventscalendar.com/content/uploads/2018/10/WooCommerce_Product_Permalinks.png 1148w, https://theeventscalendar.com/content/uploads/2018/10/WooCommerce_Product_Permalinks-140x41.png 140w, https://theeventscalendar.com/content/uploads/2018/10/WooCommerce_Product_Permalinks-300x88.png 300w, https://theeventscalendar.com/content/uploads/2018/10/WooCommerce_Product_Permalinks-768x225.png 768w, https://theeventscalendar.com/content/uploads/2018/10/WooCommerce_Product_Permalinks-665x195.png 665w, https://theeventscalendar.com/content/uploads/2018/10/WooCommerce_Product_Permalinks-430x126.png 430w, https://theeventscalendar.com/content/uploads/2018/10/WooCommerce_Product_Permalinks-645x189.png 645w, https://theeventscalendar.com/content/uploads/2018/10/WooCommerce_Product_Permalinks-1068x313.png 1068w, https://theeventscalendar.com/content/uploads/2018/10/WooCommerce_Product_Permalinks-460x135.png 460w, https://theeventscalendar.com/content/uploads/2018/10/WooCommerce_Product_Permalinks-600x176.png 600w, https://theeventscalendar.com/content/uploads/2018/10/WooCommerce_Product_Permalinks-500x146.png 500w\" sizes=\"(max-width: 1148px) 100vw, 1148px\" /><p class=\"wp-caption-text\">Product permalink options from WooCommerce.com</p></div>\n<h4>#4: Write Compelling Meta Descriptions</h4>\n<p>Meta descriptions display under the URL on the search engine results page.</p>\n<p>By default, meta descriptions are dynamically generated by search engines (usually displaying the first sentence or two from the top of the page), which is often less than ideal when it comes to enticing people to choose your site over others on the search engine results page.</p>\n<div id=\"attachment_1641123\" style=\"width: 1466px\" class=\"wp-caption aligncenter\"><img class=\"wp-image-1641123 size-full\" src=\"http://theeventscalendar.com/content/uploads/2018/10/Meta_Description.png\" alt=\"Meta Description Example Screenshot\" width=\"1456\" height=\"228\" srcset=\"https://theeventscalendar.com/content/uploads/2018/10/Meta_Description.png 1456w, https://theeventscalendar.com/content/uploads/2018/10/Meta_Description-140x22.png 140w, https://theeventscalendar.com/content/uploads/2018/10/Meta_Description-300x47.png 300w, https://theeventscalendar.com/content/uploads/2018/10/Meta_Description-768x120.png 768w, https://theeventscalendar.com/content/uploads/2018/10/Meta_Description-665x104.png 665w, https://theeventscalendar.com/content/uploads/2018/10/Meta_Description-430x67.png 430w, https://theeventscalendar.com/content/uploads/2018/10/Meta_Description-645x101.png 645w, https://theeventscalendar.com/content/uploads/2018/10/Meta_Description-1068x167.png 1068w, https://theeventscalendar.com/content/uploads/2018/10/Meta_Description-460x72.png 460w, https://theeventscalendar.com/content/uploads/2018/10/Meta_Description-600x94.png 600w, https://theeventscalendar.com/content/uploads/2018/10/Meta_Description-500x78.png 500w\" sizes=\"(max-width: 1456px) 100vw, 1456px\" /><p class=\"wp-caption-text\">Lots of keywords here, but not very human-friendly.</p></div>\n<p><strong>An optimized site has a custom meta description for each page.</strong> Zappos does a wonderful job infusing their company personality into their meta descriptions while also enticing customers to click through to their site for more information.</p>\n<div id=\"attachment_1641124\" style=\"width: 1566px\" class=\"wp-caption aligncenter\"><img class=\"wp-image-1641124 size-full\" src=\"http://theeventscalendar.com/content/uploads/2018/10/Merrell_Meta_Description.png\" alt=\"Screenshot of meta description result from Zappos.com\" width=\"1556\" height=\"296\" srcset=\"https://theeventscalendar.com/content/uploads/2018/10/Merrell_Meta_Description.png 1556w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Meta_Description-140x27.png 140w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Meta_Description-300x57.png 300w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Meta_Description-768x146.png 768w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Meta_Description-665x127.png 665w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Meta_Description-430x82.png 430w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Meta_Description-645x123.png 645w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Meta_Description-1068x203.png 1068w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Meta_Description-460x88.png 460w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Meta_Description-600x114.png 600w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Meta_Description-500x95.png 500w\" sizes=\"(max-width: 1556px) 100vw, 1556px\" /><p class=\"wp-caption-text\">Custom meta descriptions help your product stand out from the crowd.</p></div>\n<p>To manually override the default, you can use free WordPress SEO plugins like <a href=\"https://wordpress.org/plugins/wordpress-seo/\">Yoast</a> or <a href=\"https://wordpress.org/plugins/all-in-one-seo-pack/\">All in One SEO Pack</a> to set custom meta title and meta descriptions for your product pages.</p>\n<p><em>Bonus tip: If you&#8217;re using <a href=\"https://theeventscalendar.com/product/wordpress-event-tickets-plus/\">Event Tickets Plus</a> to sell tickets with WooCommerce, don&#8217;t forget to include ticket information in your custom meta description!</em></p>\n<h4>#5: Optimize Product Photos</h4>\n<p>High-quality product images are a staple of any e-commerce store, but did you know that the size of your media files affects page load time, which can dramatically impact your website’s search performance?</p>\n<blockquote><p>According to a survey by Akamai and SOASTA, even a 100-millisecond delay (0.1 seconds) can result in up to a 7% reduction in conversions. [<a href=\"https://ctt.ac/oQh_4\">Tweet this</a>]</p></blockquote>\n<p>Two essential steps to optimize your WooCommerce store images for SEO:</p>\n<ol>\n<li><strong>Reduce the size of image files without compromising quality.</strong> <a href=\"https://wordpress.org/plugins/resmushit-image-optimizer/\">reSmush.it</a> and <a href=\"https://wordpress.org/plugins/ewww-image-optimizer/\">EWWW Image Optimizer</a> are two popular WordPress image optimization plugins that are easy to use and have great reviews.</li>\n<li><strong>Fill in those image fields!</strong> The file name, title, and alt description for each image can (and should be) optimized for your target keywords. Just make sure you don’t go overboard and <a href=\"https://theeventscalendar.com/3-tips-to-make-your-site-more-accessible/\">they’re still people-friendly, too</a>.</li>\n</ol>\n<p>The image fields are displayed when you upload new media to your WordPress site.</p>\n<p><em>(Shameless plug: This image is from our free <a href=\"https://theeventscalendar.com/gutenberg-block-editor-free-ebook/\">Guide to Gutenberg ebook</a>. If you&#8217;re not yet familiar with the WordPress block editor, chapters 1 &amp; 2 are 100% worth checking out as soon as you finish reading this article.)</em></p>\n<div id=\"attachment_1641152\" style=\"width: 1472px\" class=\"wp-caption aligncenter\"><img class=\"wp-image-1641152 size-full\" src=\"http://theeventscalendar.com/content/uploads/2018/10/Image_Field_Example.png\" alt=\"Screenshot of media upload fields\" width=\"1462\" height=\"840\" srcset=\"https://theeventscalendar.com/content/uploads/2018/10/Image_Field_Example.png 1462w, https://theeventscalendar.com/content/uploads/2018/10/Image_Field_Example-140x80.png 140w, https://theeventscalendar.com/content/uploads/2018/10/Image_Field_Example-300x172.png 300w, https://theeventscalendar.com/content/uploads/2018/10/Image_Field_Example-768x441.png 768w, https://theeventscalendar.com/content/uploads/2018/10/Image_Field_Example-665x382.png 665w, https://theeventscalendar.com/content/uploads/2018/10/Image_Field_Example-430x247.png 430w, https://theeventscalendar.com/content/uploads/2018/10/Image_Field_Example-645x371.png 645w, https://theeventscalendar.com/content/uploads/2018/10/Image_Field_Example-1068x614.png 1068w, https://theeventscalendar.com/content/uploads/2018/10/Image_Field_Example-460x264.png 460w, https://theeventscalendar.com/content/uploads/2018/10/Image_Field_Example-600x345.png 600w, https://theeventscalendar.com/content/uploads/2018/10/Image_Field_Example-500x287.png 500w\" sizes=\"(max-width: 1462px) 100vw, 1462px\" /><p class=\"wp-caption-text\">Filling in image title and alt text fields is essential.</p></div>\n<p><strong>Bonus:</strong> If you’re looking for other ways to make your site load faster, check out our article on <a href=\"https://theeventscalendar.com/improve-page-speed/\">improving page speed</a>.</p>\n<h4>#6: Implement Rich Snippets</h4>\n<p>Rich snippets are a form of <a href=\"https://developers.google.com/search/docs/guides/intro-structured-data\">structured data</a> which help website owners add extra details about their website and its content so that search engines can better understand, interpret, and display relevant data.</p>\n<p><strong>In simplified terms, a (basic) snippet is what users see in their Google search results</strong>—the page title, URL, and meta description.</p>\n<p>A rich snippet is essentially the same thing, plus extra bonus information between the URL and the description. The Zappo’s screenshot above is a rich snippet—below the title, it includes the product rating, as well as the number of reviews of the product on their site.</p>\n<div id=\"attachment_1641154\" style=\"width: 1696px\" class=\"wp-caption aligncenter\"><img class=\"wp-image-1641154 size-full\" src=\"http://theeventscalendar.com/content/uploads/2018/10/Merrell_Rich_Snippet.png\" alt=\"Screenshot of merrill rich snippet on the search engine results page\" width=\"1686\" height=\"290\" srcset=\"https://theeventscalendar.com/content/uploads/2018/10/Merrell_Rich_Snippet.png 1686w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Rich_Snippet-140x24.png 140w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Rich_Snippet-300x52.png 300w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Rich_Snippet-768x132.png 768w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Rich_Snippet-665x114.png 665w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Rich_Snippet-430x74.png 430w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Rich_Snippet-645x111.png 645w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Rich_Snippet-1068x184.png 1068w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Rich_Snippet-460x79.png 460w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Rich_Snippet-600x103.png 600w, https://theeventscalendar.com/content/uploads/2018/10/Merrell_Rich_Snippet-500x86.png 500w\" sizes=\"(max-width: 1686px) 100vw, 1686px\" /><p class=\"wp-caption-text\">Rich snippets display additional information such as product ratings.</p></div>\n<p>There are many types of rich snippets you can add to your site. Instead of tackling all of them, <strong>we recommend starting with the <a href=\"https://moz.com/ugc/5-essential-ecommerce-rich-snippets-for-your-store\">top 5 e-commerce rich snippets</a>.</strong> These are the ones that will really move the needle optimizing your WooCommerce SEO.</p>\n<p>To implement rich snippets for your product pages, you can use the <a href=\"http://schema.org/Product\">product properties</a> provided by Schema.org to add extra attributes to your HTML tags. This typically requires the help of a developer to ensure it’s implemented correctly. There are also many <a href=\"https://wordpress.org/plugins/search/schema/\">free schema plugins</a> available in the WordPress.org repository, or you can try the Google <a href=\"https://www.google.com/webmasters/markup-helper/\">Structured Data Markup Helper</a>, which is designed for those with less technical expertise.</p>\n<h2>Final Thoughts</h2>\n<p>While there are loads and loads of WooCommerce SEO tweaks you can make to your e-commerce site, these tips are great first steps to optimize your site. Remember, search optimization is a marathon, not a sprint, so you don’t have to implement them all at once. Even if you start small, you’ll still be well on your way to generating more traffic, improving click-through rates, and increasing sales conversions.</p>\n<p><em>For more website tips and other news from The Events Calendar, sign up for our monthly newsletter.</em></p>\n\n                <div class=\'gf_browser_unknown gform_wrapper gutenberg-email-form_wrapper\' id=\'gform_wrapper_31\' ><form method=\'post\' enctype=\'multipart/form-data\'  id=\'gform_31\' class=\'gutenberg-email-form\' action=\'/feed/\'>\n                        <div class=\'gform_body\'><ul id=\'gform_fields_31\' class=\'gform_fields top_label form_sublabel_below description_below\'><li id=\'field_31_7\'  class=\'gfield field_sublabel_above field_description_above gfield_visibility_visible\' ><label class=\'gfield_label gfield_label_before_complex\' for=\'input_31_7_3\' >Name</label><div class=\'ginput_complex ginput_container no_prefix has_first_name no_middle_name has_last_name no_suffix gf_name_has_2 ginput_container_name gfield_trigger_change\' id=\'input_31_7\'>\n                            \n                            <span id=\'input_31_7_3_container\' class=\'name_first\' >\n                                                    <label for=\'input_31_7_3\' >First</label>\n                                                    <input type=\'text\' name=\'input_7.3\' id=\'input_31_7_3\' value=\'\' aria-label=\'First name\'    aria-invalid=\"false\" />\n                                                </span>\n                            \n                            <span id=\'input_31_7_6_container\' class=\'name_last\' >\n                                                            <label for=\'input_31_7_6\' >Last</label>\n                                                            <input type=\'text\' name=\'input_7.6\' id=\'input_31_7_6\' value=\'\' aria-label=\'Last name\'    aria-invalid=\"false\" />\n                                                        </span>\n                            \n                        </div></li><li id=\'field_31_8\'  class=\'gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_hidden\' ><label class=\'gfield_label\' for=\'input_31_8\' >Email<span class=\'gfield_required\'>*</span></label><div class=\'ginput_container ginput_container_email\'>\n                            <input name=\'input_8\' id=\'input_31_8\' type=\'email\' value=\'\' class=\'medium\'     aria-required=\"true\" aria-invalid=\"false\"/>\n                        </div></li><li id=\'field_31_3\'  class=\'gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible is-gf-checkbox\' ><label class=\'gfield_label\'  ><span class=\'gfield_required\'>*</span></label><div class=\'ginput_container ginput_container_checkbox\'><ul class=\'gfield_checkbox\' id=\'input_31_3\'><li class=\'gchoice_31_3_1\'>\n								<input name=\'input_3.1\' type=\'checkbox\'  value=\'Sign me up for news &amp; updates\' checked=\'checked\' id=\'choice_31_3_1\'   />\n								<label for=\'choice_31_3_1\' id=\'label_31_3_1\'>Sign me up for news & updates</label>\n							</li></ul></div></li>\n                            </ul></div>\n        <div class=\'gform_footer top_label\'> <input type=\'submit\' id=\'gform_submit_button_31\' class=\'gform_button button\' value=\'Sign Up!\'  onclick=\'if(window[\"gf_submitting_31\"]){return false;}  if( !jQuery(\"#gform_31\")[0].checkValidity || jQuery(\"#gform_31\")[0].checkValidity()){window[\"gf_submitting_31\"]=true;}  \' onkeypress=\'if( event.keyCode == 13 ){ if(window[\"gf_submitting_31\"]){return false;} if( !jQuery(\"#gform_31\")[0].checkValidity || jQuery(\"#gform_31\")[0].checkValidity()){window[\"gf_submitting_31\"]=true;}  jQuery(\"#gform_31\").trigger(\"submit\",[true]); }\' /> \n            <input type=\'hidden\' class=\'gform_hidden\' name=\'is_submit_31\' value=\'1\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_submit\' value=\'31\' />\n            \n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_unique_id\' value=\'\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'state_31\' value=\'WyJbXSIsImM3MzcyYjNlZGVlNTZhMGE4MDM4NGMzMzkwNmEwMGM3Il0=\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_target_page_number_31\' id=\'gform_target_page_number_31\' value=\'0\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_source_page_number_31\' id=\'gform_source_page_number_31\' value=\'1\' />\n            <input type=\'hidden\' name=\'gform_field_values\' value=\'\' />\n            \n        </div>\n                        </form>\n                        </div><script type=\'text/javascript\'> jQuery(document).bind(\'gform_post_render\', function(event, formId, currentPage){if(formId == 31) {} } );jQuery(document).bind(\'gform_post_conditional_logic\', function(event, formId, fields, isInit){} );</script><script type=\'text/javascript\'> jQuery(document).ready(function(){jQuery(document).trigger(\'gform_post_render\', [31, 1]) } ); </script>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/woocommerce-seo-tips/\">WooCommerce SEO: 6 Tips to Boost Traffic &#038; Sales</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:33:\"\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"Announcing Event Tickets 4.8.2.1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:63:\"https://theeventscalendar.com/announcing-event-tickets-4-8-2-1/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 10 Oct 2018 12:04:09 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Release Notes\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://theeventscalendar.com/?p=1640718\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:602:\"<p>We&#8217;re pleased to announce that Event Tickets 4.8.2.1 is now available. In most cases you will be able to take advantage of automated updates, but if those are unavailable for any reason you can download the plugins from your downloads page then update manually. Event Tickets 4.8.2.1 Fix &#8211; Prevent fataling when upgrading Event Tickets&#8230;</p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/announcing-event-tickets-4-8-2-1/\">Announcing Event Tickets 4.8.2.1</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"Nico\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1221:\"<p>We&#8217;re pleased to announce that <strong>Event Tickets 4.8.2.1</strong> is now available.</p>\n<p>In most cases you will be able to take advantage of automated updates, but if those are unavailable for any reason you can download the plugins from your <a href=\"https://theeventscalendar.com/my-account/downloads/\">downloads page</a> then <a href=\"https://theeventscalendar.com/knowledgebase/manual-updates/\" target=\"_blank\" rel=\"noopener\">update manually</a>.</p>\n<h3 id=\"et\">Event Tickets 4.8.2.1</h3>\n<ul>\n<li><strong>Fix</strong> &#8211; Prevent fataling when upgrading Event Tickets while running versions of Event Tickets Plus lower than 4.8</li>\n<li><strong>Language</strong> &#8211; 188 new strings added, 125 updated, 6 fuzzied, and 10 obsoleted</li>\n</ul>\n<p>Thanks for your patience and support while we worked on these issues <img src=\"https://s.w.org/images/core/emoji/11/72x72/1f642.png\" alt=\"🙂\" class=\"wp-smiley\" style=\"height: 1em; max-height: 1em;\" /></p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/announcing-event-tickets-4-8-2-1/\">Announcing Event Tickets 4.8.2.1</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:42:\"\n		\n		\n		\n		\n				\n		\n		\n		\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:73:\"Events Gutenberg: Tickets &amp; RSVP Added in Version 0.3.0-Alpha Release\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:77:\"https://theeventscalendar.com/events-gutenberg-tickets-rsvp-extension-update/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 09 Oct 2018 17:13:51 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:4:{i:0;a:5:{s:4:\"data\";s:13:\"Release Notes\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:12:\"Block Editor\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:16:\"events gutenberg\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:3;a:5:{s:4:\"data\";s:9:\"Gutenberg\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://theeventscalendar.com/?p=1640106\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:648:\"<p>Ticket and RSVP blocks have arrived in Events Gutenberg 0.3.0-alpha! The new version of the extension is out in the wild and ready for you to experience ticketing events in the block editor today. This version is compatible with: The Events Calendar: Version 4.6.24.1 or higher Gutenberg: Version 3.9.0 Get the Extension If this is your&#8230;</p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/events-gutenberg-tickets-rsvp-extension-update/\">Events Gutenberg: Tickets &#038; RSVP Added in Version 0.3.0-Alpha Release</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:3:\"Jen\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:8293:\"<p>Ticket and RSVP blocks have arrived in <a href=\"https://theeventscalendar.com/extensions/events-gutenberg/\">Events Gutenberg 0.3.0-alpha!</a> The new version of the extension is out in the wild and ready for you to experience ticketing events in the block editor today.</p>\n<p>This version is compatible with:</p>\n<ul>\n<li><strong>The Events Calendar</strong>: Version 4.6.24.1 or higher</li>\n<li><strong>Gutenberg</strong>: Version 3.9.0</li>\n</ul>\n<p><a class=\"btn-filled extension-download-link\" href=\"https://theeventscalendar.com/extensions/events-gutenberg/\" target=\"_blank\" rel=\"noopener\">Get the Extension</a></p>\n<p><em>If this is your first time getting your hands on Gutenberg, prepare yourself with this <a href=\"https://theeventscalendar.com/wordpress-gutenberg-block-editor-checklist/\">site prep checklist</a>.</em></p>\n<h2>Events Gutenberg 0.3.0-alpha Changelog</h2>\n<h4>15 New Features</h4>\n<ul>\n<li>RSVP block</li>\n<li>Tickets block</li>\n<li>Register ticket block to make it available in the block list</li>\n<li>Register PHP files to use tickets templates</li>\n<li>Add <samp>store</samp> for tickets plugins</li>\n<li>Add Tickets inside of the <samp>plugins/</samp> directory</li>\n<li>Add button component to common elements</li>\n<li>Add action dashboard to tickets elements</li>\n<li>Create <samp>Available</samp> component</li>\n<li>Add TribePropTypes functions to check custom time format</li>\n<li>Add time to seconds and ms and vice versa utility</li>\n<li>Create <samp>&lt;HeaderImage&gt;</samp> component to upload / select an image from the media library</li>\n<li>Add <samp>CapacityTable</samp> component to render the capacity of the tickets</li>\n<li>Connect <samp>Tickets</samp> block with <samp>store</samp> to manage state of component</li>\n<li>Add Events Calendar PRO integration and make the editor take de default values from the Settings</li>\n</ul>\n<h4>6 New Tweaks</h4>\n<ul>\n<li>Move TEC icon into a <samp>common</samp> to make it available regardless of TEC</li>\n<li>Move compatibility class into <samp>/tickets</samp> plugin</li>\n<li>Create an icons module for the plugins and shared one on common to create a set of icons</li>\n<li>Move most utilities from events plugin to common plugin</li>\n<li>Move time picker element from events plugin to common plugin</li>\n<li>Adjust time picker element to accept time string in hh:mm format rather than moments</li>\n</ul>\n<h4>1 New Fix</h4>\n<ul>\n<li>Fix &#8211; Make sure <samp>meta</samp> fields are returned into the <samp>tribe_events</samp> post type when option <samp>disable_metabox_custom_fields</samp> loads the first time</li>\n</ul>\n<p><em><strong>Please note</strong> that just as with the Gutenberg plugin, this extension is not for use on production sites. Like Gutenberg, it should only be activated on a test site or local install.</em></p>\n<h3>Stay in the Loop</h3>\n<p>Check out our <a href=\"https://theeventscalendar.com/gutenberg-block-editor-news/\">block editor news page</a> for details on the latest Gutenberg developments.</p>\n<p>You can also get the latest news, updates, and release date announcements delivered to your inbox by signing up for our newsletter.<br />\n\n                <div class=\'gf_browser_unknown gform_wrapper\' id=\'gform_wrapper_28\' ><form method=\'post\' enctype=\'multipart/form-data\'  id=\'gform_28\'  action=\'/feed/\'>\n                        <div class=\'gform_body\'><ul id=\'gform_fields_28\' class=\'gform_fields top_label form_sublabel_below description_below\'><li id=\'field_28_7\'  class=\'gfield field_sublabel_above field_description_above gfield_visibility_visible\' ><label class=\'gfield_label gfield_label_before_complex\' for=\'input_28_7_3\' >Name</label><div class=\'ginput_complex ginput_container no_prefix has_first_name no_middle_name has_last_name no_suffix gf_name_has_2 ginput_container_name gfield_trigger_change\' id=\'input_28_7\'>\n                            \n                            <span id=\'input_28_7_3_container\' class=\'name_first\' >\n                                                    <label for=\'input_28_7_3\' >First</label>\n                                                    <input type=\'text\' name=\'input_7.3\' id=\'input_28_7_3\' value=\'\' aria-label=\'First name\'    aria-invalid=\"false\" />\n                                                </span>\n                            \n                            <span id=\'input_28_7_6_container\' class=\'name_last\' >\n                                                            <label for=\'input_28_7_6\' >Last</label>\n                                                            <input type=\'text\' name=\'input_7.6\' id=\'input_28_7_6\' value=\'\' aria-label=\'Last name\'    aria-invalid=\"false\" />\n                                                        </span>\n                            \n                        </div></li><li id=\'field_28_8\'  class=\'gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_hidden\' ><label class=\'gfield_label\' for=\'input_28_8\' >Email<span class=\'gfield_required\'>*</span></label><div class=\'ginput_container ginput_container_email\'>\n                            <input name=\'input_8\' id=\'input_28_8\' type=\'email\' value=\'\' class=\'medium\'     aria-required=\"true\" aria-invalid=\"false\"/>\n                        </div></li><li id=\'field_28_3\'  class=\'gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible is-gf-checkbox\' ><label class=\'gfield_label\'  ><span class=\'gfield_required\'>*</span></label><div class=\'ginput_container ginput_container_checkbox\'><ul class=\'gfield_checkbox\' id=\'input_28_3\'><li class=\'gchoice_28_3_1\'>\n								<input name=\'input_3.1\' type=\'checkbox\'  value=\'Sign me up for news &amp; updates\' checked=\'checked\' id=\'choice_28_3_1\'   />\n								<label for=\'choice_28_3_1\' id=\'label_28_3_1\'>Sign me up for news & updates</label>\n							</li></ul></div></li><li id=\'field_28_9\'  class=\'gfield gform_hidden field_sublabel_below field_description_below gfield_visibility_visible\' ><input name=\'input_9\' id=\'input_28_9\' type=\'hidden\' class=\'gform_hidden\'  aria-invalid=\"false\" value=\'Gutenberg newsletter signup\' /></li>\n                            </ul></div>\n        <div class=\'gform_footer top_label\'> <input type=\'submit\' id=\'gform_submit_button_28\' class=\'gform_button button\' value=\'Sign Up!\'  onclick=\'if(window[\"gf_submitting_28\"]){return false;}  if( !jQuery(\"#gform_28\")[0].checkValidity || jQuery(\"#gform_28\")[0].checkValidity()){window[\"gf_submitting_28\"]=true;}  \' onkeypress=\'if( event.keyCode == 13 ){ if(window[\"gf_submitting_28\"]){return false;} if( !jQuery(\"#gform_28\")[0].checkValidity || jQuery(\"#gform_28\")[0].checkValidity()){window[\"gf_submitting_28\"]=true;}  jQuery(\"#gform_28\").trigger(\"submit\",[true]); }\' /> \n            <input type=\'hidden\' class=\'gform_hidden\' name=\'is_submit_28\' value=\'1\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_submit\' value=\'28\' />\n            \n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_unique_id\' value=\'\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'state_28\' value=\'WyJbXSIsImM3MzcyYjNlZGVlNTZhMGE4MDM4NGMzMzkwNmEwMGM3Il0=\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_target_page_number_28\' id=\'gform_target_page_number_28\' value=\'0\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_source_page_number_28\' id=\'gform_source_page_number_28\' value=\'1\' />\n            <input type=\'hidden\' name=\'gform_field_values\' value=\'\' />\n            \n        </div>\n                        </form>\n                        </div><script type=\'text/javascript\'> jQuery(document).bind(\'gform_post_render\', function(event, formId, currentPage){if(formId == 28) {} } );jQuery(document).bind(\'gform_post_conditional_logic\', function(event, formId, fields, isInit){} );</script><script type=\'text/javascript\'> jQuery(document).ready(function(){jQuery(document).trigger(\'gform_post_render\', [28, 1]) } ); </script></p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/events-gutenberg-tickets-rsvp-extension-update/\">Events Gutenberg: Tickets &#038; RSVP Added in Version 0.3.0-Alpha Release</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:70:\"New Releases: Facebook Dev Imports for Event Aggregator + TEC 4.6.24.1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"https://theeventscalendar.com/wordpress-facebook-dev-imports-maintenance-release/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 08 Oct 2018 17:47:49 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:13:\"Release Notes\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:9:\"extension\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:19:\"maintenance release\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://theeventscalendar.com/?p=1639606\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:689:\"<p>The Events Calendar 4.6.24.1 is here, providing support for a new extension that provides a workaround to Facebook&#8217;s API restrictions. Event Aggregator users will be able to grab this extension and starting importing some events from Facebook, just like the good old days! Get the Extension Facebook Imports Are Back While Facebook&#8217;s API restrictions are still the&#8230;</p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/wordpress-facebook-dev-imports-maintenance-release/\">New Releases: Facebook Dev Imports for Event Aggregator + TEC 4.6.24.1</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"Nico\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:2379:\"<p><strong>The Events Calendar 4.6.24.1 </strong>is here, providing support for a new extension that provides a workaround to Facebook&#8217;s API restrictions. Event Aggregator users will be able to grab this extension and starting importing some events from Facebook, just like the good old days!</p>\n<p><a class=\"btn-filled extension-download-link\" href=\"https://theeventscalendar.com/extensions/facebook-ea\" target=\"_blank\" rel=\"noopener\">Get the Extension</a></p>\n<h3>Facebook Imports Are Back</h3>\n<p>While <a href=\"https://theeventscalendar.com/important-facebook-api-changes/\">Facebook&#8217;s API restrictions</a> are still the bane of WordPress users everywhere, our super awesome support team has created a new <a href=\"https://theeventscalendar.com/extensions/facebook-ea\">Facebook import extension</a> that restores some of the previous import functionality for our users. It&#8217;s exciting, but please keep in mind that any workaround we provide (such as this extension) is subject to the whims of Mark Zuckerberg and crew.</p>\n<h3 id=\"tec\">The Events Calendar 4.6.24.1</h3>\n<p>The new extension isn&#8217;t the only news today. We&#8217;ve also got a fresh new update for users of <a href=\"https://theeventscalendar.com/product/wordpress-events-calendar/\">The Events Calendar</a>.</p>\n<p>In most cases, you will be able to take advantage of automated updates, but if those are unavailable for any reason you can download the plugins from your <a href=\"https://theeventscalendar.com/my-account/downloads/\">downloads page</a> then <a href=\"https://theeventscalendar.com/knowledgebase/manual-updates/\" target=\"_blank\" rel=\"noopener\">update manually</a>.</p>\n<ul>\n<li><strong>Fix</strong> &#8211; Fixed an issue where a fatal error could be generated when trying to save a new Event Aggregator scheduled import</li>\n<li><strong>Fix</strong> &#8211; Handle left-over Facebook scheduled imports and notices</li>\n<li><strong>Tweak</strong> &#8211; Added the `tribe_aggregator_import_setting_origins` filter to the origins available for default import settings</li>\n</ul>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/wordpress-facebook-dev-imports-maintenance-release/\">New Releases: Facebook Dev Imports for Event Aggregator + TEC 4.6.24.1</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:33:\"\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"Event Metrics: Measuring the Success of Your Events\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"https://theeventscalendar.com/event-metrics-calculations-measuring-event-success/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 05 Oct 2018 16:09:45 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"Articles\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://theeventscalendar.com/?p=1638203\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:617:\"<p>Event metrics are used to justify your event strategy, evaluate ROI, and determine the ultimate success of your event goals and objectives. Crunching the numbers may not be quite as fun as hosting the event itself, but the results are pretty darn satisfying—and it’s much easier than you think! Why You Need to Track Your&#8230;</p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/event-metrics-calculations-measuring-event-success/\">Event Metrics: Measuring the Success of Your Events</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:3:\"Jen\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:10967:\"<p>Event metrics are used to justify your event strategy, evaluate ROI, and determine the ultimate success of your <a href=\"https://theeventscalendar.com/defining-event-goals-and-objectives/\">event goals and objectives</a>. Crunching the numbers may not be quite as fun as hosting the event itself, but the results are pretty darn satisfying—and it’s much easier than you think!</p>\n<h2>Why You Need to Track Your Event Metrics</h2>\n<p>When the boss asks how an event went, saying “It went great!” isn’t enough—you need to show the hard numbers that prove the value of the event.</p>\n<p><strong>Event metrics help answer key questions</strong>, such as:</p>\n<ul>\n<li>Did the investment pay off?</li>\n<li>Are attendees doing what you asked, such as redeeming a coupon you gave out?</li>\n<li>Which marketing channels helped you meet your goals?</li>\n<li>Is the event worth doing again?</li>\n</ul>\n<p>With these numbers in hand, you’ll be able to confidently say: “It was hugely successful! We generated over xx new leads and exceeded our ROI target by xx%.”</p>\n<h2>Key Metrics You Should be Tracking (and How To Calculate Them)</h2>\n<h4>Revenue Metrics</h4>\n<p>If revenue is the ultimate goal of your event, then these metrics are essential.</p>\n<h5>Net Sales</h5>\n<p>If ticket sales are the revenue driver, calculating net sales is the easiest way to measure the profit generated by the event.</p>\n<p style=\"padding-left: 30px;\"><strong><em>Calculation:</em></strong> (total ticket sales revenue + on-site sales revenue*) &#8211; total event cost</p>\n<p>*On-Site Sales Revenue applies when you’re selling items at your event, such as branded merchandise, or collecting donations for a non-profit.</p>\n<h5>Opportunity Value</h5>\n<p>Events that target sales leads, especially in the B2B sector, need to measure how many attendees become MQLs (marketing qualified leads) and SQLs (sales qualified leads) to calculate the sales opportunity value generated by the event.</p>\n<p style=\"padding-left: 30px;\"><strong><em>Calculation:</em></strong> (MQL leads x MQL value) + (SQL leads x SQL value)</p>\n<h4>Marketing Metrics</h4>\n<p>Event marketing is what gets attendees in the door, so it’s important to know which marketing channels generate the most interest and the highest conversion rate. When reviewing these metrics, attribution is key.</p>\n<p><strong>Tip:</strong> Use <a href=\"https://theeventscalendar.com/utm-parameters-track-your-marketing-initiatives/\">UTM parameters</a> to help you easily track your marketing initiatives in Google Analytics.</p>\n<h5>Website Traffic</h5>\n<p>When looking at traffic reports in Google Analytics, it’s important to make sure you’re looking at traffic specific to your marketing efforts, not just overall traffic on your site.</p>\n<p style=\"padding-left: 30px;\"><strong><em>How:</em></strong> In Google Analytics, navigate to Acquisition &gt; Campaigns &gt; All Campaigns. Select a specific campaign name to see a breakdown of sources and mediums (marketing channel) that drove traffic to your site as a result of your online event marketing activities.</p>\n<h5>Conversions</h5>\n<p>When we talk about conversions for events, we’re usually looking at attendee registrations. In other words, did the traffic we brought into the site result in event RSVPs or ticket purchases?</p>\n<p style=\"padding-left: 30px;\"><strong><em>How:</em></strong> Google Analytics allows you to <a href=\"https://support.google.com/analytics/answer/1032415?hl=en\">create conversion goals</a> to measure the effectiveness of your marketing efforts. After you’ve created your goal, you’ll be able to use the same Campaign report mentioned above and select that goal from the Conversions dropdown. Your conversion rate is automatically calculated and displayed.</p>\n<h5>Channel Effectiveness (ROI)</h5>\n<p>After looking at your traffic and conversion reports, you’ll be able to calculate the ROI of each marketing channel.</p>\n<p style=\"padding-left: 30px;\"><strong><em>Calculation (for each channel):</em></strong> (total conversions / total marketing spend)</p>\n<h4>Attendee Metrics</h4>\n<p>Since attendees are the core of every event, it’s important to track metrics for them, too.</p>\n<h5>Registration Trends</h5>\n<p>Timing is a big part of any event marketing strategy. Understanding when people register for an event allows you to adjust your marketing plan to focus on peak opportunity windows, such as early bird promotions or last-minute ticket releases.</p>\n<h5>Attrition</h5>\n<p>Attrition is the number of people that registered for your event but didn’t show up. It’s an incredibly important metric when it comes to your event budget. If you know your events have a 10% average attrition rate, for example, you can save money by adjusting catering orders at future events.</p>\n<p style=\"padding-left: 30px;\"><strong><em>Calculation:</em></strong> 1 &#8211; (total registrations / total attendees)</p>\n<p>Tip: If you’re using <a href=\"https://theeventscalendar.com/product/wordpress-event-tickets-plus/\">Event Tickets Plus</a>, you can use the Attendee Report to quickly compare total attendee check-ins vs total tickets issued.</p>\n<h5>Attendee Engagement &amp; Satisfaction</h5>\n<p>Yes, it’s possible to quantify this! A few popular options:</p>\n<ul>\n<li>Number of social mentions and interactions</li>\n<li>Social sentiment &#8211; total positive, neutral, and negative posts</li>\n<li><a href=\"https://www.netpromoter.com/know/\">Net Promoter Score</a> &#8211; how likely attendees are to recommend your event</li>\n<li>Post-event survey results</li>\n<li>Number of repeat attendees and/or community growth</li>\n</ul>\n<h2>Wrapping Up</h2>\n<p>Measuring event metrics is highly valuable, no matter which industry you’re in. It allows you to quantitatively measure your event success in relation to your goals and objectives, demonstrate tangible value, and validate your overall event marketing strategy.</p>\n<p><em>For more event tips and other news from The Events Calendar, sign up for our monthly newsletter.</em></p>\n\n                <div class=\'gf_browser_unknown gform_wrapper gutenberg-email-form_wrapper\' id=\'gform_wrapper_31\' ><form method=\'post\' enctype=\'multipart/form-data\'  id=\'gform_31\' class=\'gutenberg-email-form\' action=\'/feed/\'>\n                        <div class=\'gform_body\'><ul id=\'gform_fields_31\' class=\'gform_fields top_label form_sublabel_below description_below\'><li id=\'field_31_7\'  class=\'gfield field_sublabel_above field_description_above gfield_visibility_visible\' ><label class=\'gfield_label gfield_label_before_complex\' for=\'input_31_7_3\' >Name</label><div class=\'ginput_complex ginput_container no_prefix has_first_name no_middle_name has_last_name no_suffix gf_name_has_2 ginput_container_name gfield_trigger_change\' id=\'input_31_7\'>\n                            \n                            <span id=\'input_31_7_3_container\' class=\'name_first\' >\n                                                    <label for=\'input_31_7_3\' >First</label>\n                                                    <input type=\'text\' name=\'input_7.3\' id=\'input_31_7_3\' value=\'\' aria-label=\'First name\'    aria-invalid=\"false\" />\n                                                </span>\n                            \n                            <span id=\'input_31_7_6_container\' class=\'name_last\' >\n                                                            <label for=\'input_31_7_6\' >Last</label>\n                                                            <input type=\'text\' name=\'input_7.6\' id=\'input_31_7_6\' value=\'\' aria-label=\'Last name\'    aria-invalid=\"false\" />\n                                                        </span>\n                            \n                        </div></li><li id=\'field_31_8\'  class=\'gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_hidden\' ><label class=\'gfield_label\' for=\'input_31_8\' >Email<span class=\'gfield_required\'>*</span></label><div class=\'ginput_container ginput_container_email\'>\n                            <input name=\'input_8\' id=\'input_31_8\' type=\'email\' value=\'\' class=\'medium\'     aria-required=\"true\" aria-invalid=\"false\"/>\n                        </div></li><li id=\'field_31_3\'  class=\'gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible is-gf-checkbox\' ><label class=\'gfield_label\'  ><span class=\'gfield_required\'>*</span></label><div class=\'ginput_container ginput_container_checkbox\'><ul class=\'gfield_checkbox\' id=\'input_31_3\'><li class=\'gchoice_31_3_1\'>\n								<input name=\'input_3.1\' type=\'checkbox\'  value=\'Sign me up for news &amp; updates\' checked=\'checked\' id=\'choice_31_3_1\'   />\n								<label for=\'choice_31_3_1\' id=\'label_31_3_1\'>Sign me up for news & updates</label>\n							</li></ul></div></li>\n                            </ul></div>\n        <div class=\'gform_footer top_label\'> <input type=\'submit\' id=\'gform_submit_button_31\' class=\'gform_button button\' value=\'Sign Up!\'  onclick=\'if(window[\"gf_submitting_31\"]){return false;}  if( !jQuery(\"#gform_31\")[0].checkValidity || jQuery(\"#gform_31\")[0].checkValidity()){window[\"gf_submitting_31\"]=true;}  \' onkeypress=\'if( event.keyCode == 13 ){ if(window[\"gf_submitting_31\"]){return false;} if( !jQuery(\"#gform_31\")[0].checkValidity || jQuery(\"#gform_31\")[0].checkValidity()){window[\"gf_submitting_31\"]=true;}  jQuery(\"#gform_31\").trigger(\"submit\",[true]); }\' /> \n            <input type=\'hidden\' class=\'gform_hidden\' name=\'is_submit_31\' value=\'1\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_submit\' value=\'31\' />\n            \n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_unique_id\' value=\'\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'state_31\' value=\'WyJbXSIsImM3MzcyYjNlZGVlNTZhMGE4MDM4NGMzMzkwNmEwMGM3Il0=\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_target_page_number_31\' id=\'gform_target_page_number_31\' value=\'0\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_source_page_number_31\' id=\'gform_source_page_number_31\' value=\'1\' />\n            <input type=\'hidden\' name=\'gform_field_values\' value=\'\' />\n            \n        </div>\n                        </form>\n                        </div><script type=\'text/javascript\'> jQuery(document).bind(\'gform_post_render\', function(event, formId, currentPage){if(formId == 31) {} } );jQuery(document).bind(\'gform_post_conditional_logic\', function(event, formId, fields, isInit){} );</script><script type=\'text/javascript\'> jQuery(document).ready(function(){jQuery(document).trigger(\'gform_post_render\', [31, 1]) } ); </script>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/event-metrics-calculations-measuring-event-success/\">Event Metrics: Measuring the Success of Your Events</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:33:\"\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:53:\"Maintenance Release for the Week of 30 September 2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"https://theeventscalendar.com/maintenance-release-for-the-week-of-30-september-2018/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 03 Oct 2018 18:25:31 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Release Notes\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://theeventscalendar.com/?p=1636196\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:638:\"<p>Welcome to maintenance release number 14 of 2018! If this is your first time getting an update from us, maintenance releases are smaller updates between major releases, and are mostly comprised of bug fixes, tweaks, and small (but meaningful!) improvements. We always recommend using a staging site to test these changes before updating on a&#8230;</p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/maintenance-release-for-the-week-of-30-september-2018/\">Maintenance Release for the Week of 30 September 2018</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:6:\"Victor\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:10460:\"<p>Welcome to maintenance release number 14 of 2018! If this is your first time getting an update from us, maintenance releases are smaller updates between major releases, and are mostly comprised of bug fixes, tweaks, and small (but meaningful!) improvements. We always recommend using a <a href=\"https://theeventscalendar.com/knowledgebase/creating-using-wordpress-staging-site/\">staging site</a> to test these changes before updating on a live site.</p>\n<p>To see all of the changes included in this maintenance release, check out the changelogs for all updated plugins below:</p>\n<ul>\n<li><a href=\"#tec\">The Events Calendar 4.6.24</a></li>\n<li><a href=\"#ep\">Events Calendar PRO 4.4.33</a></li>\n<li><a href=\"#et\">Event Tickets 4.8.2</a></li>\n<li><a href=\"#etp\">Event Tickets Plus 4.8.2</a></li>\n<li><a href=\"#eb\">Eventbrite Tickets 4.5.4</a></li>\n<li><a href=\"#not-updated\">Not Updated this Release</a></li>\n</ul>\n<h3 id=\"tec\">The Events Calendar 4.6.24</h3>\n<ul>\n<li><strong>Fix</strong> &#8211; Prevent broken and low-resolution Google Maps if user has not provided a Google Maps API key of their own by providing our own fallback API key</li>\n<li><strong>Fix</strong> &#8211; Only load widget assets when widget is active on the page</li>\n<li><strong>Fix</strong> &#8211; Ensure that venue, organizer, and meta information doesn&#8217;t show on password-protected events</li>\n<li><strong>Fix</strong> &#8211; Correct the Google Maps API link in the Settings help text to point to the correct API page</li>\n<li><strong>Fix</strong> &#8211; Restores the event categories and tags creation summary in CSV imports</li>\n<li><strong>Fix</strong> &#8211; Updated the Events Gutenberg extension install check to show only when the extension is not active</li>\n<li><strong>Fix</strong> &#8211; Stop potential fatal errors from debug logging when running EA import actions from command line</li>\n<li><strong>Fix</strong> &#8211; Fixed a bug where it was often not possible to un-check the &#8220;Enable JSON-LD&#8221; option in the Events List Widget (thanks to @myrunningresource and @craigwilcox for reporting this!)</li>\n<li><strong>Fix</strong> &#8211; Ensure that the <samp>tribe-events-bar-should-show</samp> filter functions as aspected; if <samp>__return_false</samp> is passed, the Tribe Bar will be totally hidden (thanks @debranettles for reporting this!)</li>\n<li><strong>Fix</strong> &#8211; Added checks to prevent JS Type Error in mobile view. Thanks szenenight, agrilife and others for flagging this!</li>\n<li><strong>Fix</strong> &#8211; Only load Customizer CSS when loading main stylesheets or widget stylesheets of PRO</li>\n<li><strong>Fix</strong> &#8211; Restore functionality of admin notices that display when a license key is invalid (thanks to @tyrann0us on GitHub for submitting the fix!)</li>\n<li><strong>Fix</strong> &#8211; Update our mascot terminology to the preferred verbiage</li>\n<li><strong>Fix</strong> &#8211; Handle the upload of images with more complex URLs</li>\n<li><strong>Tweak</strong> &#8211; Added the <samp>tribe_global_id_valid_types</samp> action to allow new EA origins</li>\n<li><strong>Tweak</strong> &#8211; Added the <samp>tribe_global_id_type_origins</samp> action to allow new EA origins</li>\n<li><strong>Tweak</strong> &#8211; Added new filters for customizing the fallback Google Maps embeds: <samp>tribe_is_using_basic_gmaps_api</samp>, <samp>tribe_get_basic_gmap_embed_url</samp>, and <samp>tribe_get_basic_gmap_embed_url_args</samp></li>\n<li><strong>Tweak</strong> &#8211; Fixed the handling of the global $post variable in some Month View templates to make it easier for themers to customize those templates</li>\n<li><strong>Tweak</strong> &#8211; Ensure linked posts are listed alphabetically in metabox dropdowns, as they are in all other admin locations</li>\n<li><strong>Tweak</strong> &#8211; Added the <samp>tribe_events_month_daily_events</samp> filter to the Month view</li>\n<li><strong>Tweak</strong> &#8211; Move Google Maps API loading to tribe_assets and only load once on single views when PRO is active, thanks to info2grow first reporting</li>\n<li><strong>Tweak</strong> &#8211; Accept 0 as an argument in tribe_get_events() so that <samp>&#8216;post_parent&#8217; => 0</samp> works, thanks Cy for the detailed report</li>\n<li><strong>Tweak</strong> &#8211; Added the <samp>tribe_aggregator_record_by_origin</samp> filter to allow new EA origins</li>\n<li><strong>Tweak</strong> &#8211; Added the <samp>tribe_aggregator_service_post_import_args</samp> filter to allow new EA origins</li>\n<li><strong>Tweak</strong> &#8211; Added the <samp>tribe_aggregator_import_validate_meta_by_origin</samp> filter to allow new EA origins</li>\n<li><strong>Tweak</strong> &#8211; Added the <samp>tribe_events_aggregator_refine_keyword_exclusions</samp> filter to allow new EA origins</li>\n<li><strong>Tweak</strong> &#8211; Added the <samp>tribe_events_aggregator_refine_location_exclusions</samp> filter to allow new EA origins</li>\n<li><strong>Tweak</strong> &#8211; Added the <samp>tribe_aggregator_event_translate_service_data_field_map</samp> filter to allow new EA origins</li>\n<li><strong>Tweak</strong> &#8211; Added the <samp>tribe_aggregator_event_translate_service_data_venue_field_map</samp> filter to allow new EA origins</li>\n<li><strong>Tweak</strong> &#8211; Added the <samp>tribe_aggregator_event_translate_service_data_organizer_field_map</samp> filter to allow new EA origins</li>\n<li><strong>Tweak</strong> &#8211; Added the <samp>tribe_events_status_third_party</samp> action to allow new EA origins</li>\n<li><strong>Tweak</strong> &#8211; Added the <samp>tribe_events_aggregator_import_form</samp> action to allow new EA origins</li>\n<li><strong>Tweak</strong> &#8211; Added <samp>$origin_show_map_options</samp> parameter to the <samp>tribe_aggregator_fields</samp> filter to allow new EA origins to make use of them</li>\n</ul>\n<h3 id=\"ep\">Events Calendar PRO 4.4.33</h3>\n<ul>\n<li><strong>Fix</strong> &#8211; Prevent broken and low-resolution Google Maps if user has not provided a Google Maps API key of their own by providing our own fallback API key</li>\n<li><strong>Fix</strong> &#8211; Prevent duplicate events from being created on the first date of a series, thanks to Mathew for the detailed instructions to reproduce</li>\n<li><strong>Fix</strong> &#8211; Only load widget assets when widget is active on the page</li>\n<li><strong>Fix</strong> &#8211; Saving of widgets so that it completes the process and changes JSON-LD on first load save, thanks to Mathew and Craig for the report</li>\n<li><strong>Fix</strong> &#8211; Ensure that custom month recurrence rules (e.g. &#8220;every three months&#8221;) are respected, and the events are generated on the correct dates (thanks to @applegateconnect and others for reporting this!)</li>\n<li><strong>Tweak</strong> &#8211; Combine widget css into a single css file, still using widget-calendar-pro-style has the handle</li>\n<li><strong>Tweak</strong> &#8211; Move Google Maps API loading to tribe_assets and only load once on single views and Map View when PRO is active, thanks to info2grow first reporting</li>\n<li><strong>Tweak</strong> &#8211; Added localization variables to scripts over the mini calendar widget, in order to avoid warnings when used on non events pages</li>\n<li><strong>Deprecated</strong> &#8211; <samp>tribe_events_pro_google_maps_api</samp> in favor of using <samp>tribe_events_google_maps_api</samp></li>\n<li><strong>Deprecated</strong> &#8211; Removed empty function <samp>tribe_ecp_uninstall</samp></li>\n</ul>\n<h3 id=\"et\">Event Tickets 4.8.2</h3>\n<ul>\n<li><strong>Fix</strong> &#8211; Ensure that ticket forms and related info are not visible on password-protected events, posts, and other post types</li>\n<li><strong>Fix</strong> &#8211; Prevent notice when editing ticket with global capacity</li>\n<li><strong>Fix</strong> &#8211; Fixed a number of locations in Tribe Commerce-powered admin views where prices were reported without their full decimal values</li>\n<li><strong>Fix</strong> &#8211; Display RSVP/Tickets unavailability message on the position selected over the Settings. Thanks @liblogger for flagging this!</li>\n<li><strong>Fix</strong> &#8211; Remove the &#8220;Not Going&#8221; RSVPs from the attendee count on the events list. Props to @mirre1 for flagging this!</li>\n<li><strong>Fix</strong> &#8211; Ensured that the TribeCommerce ticket start and end sale date respect the event timezone. Thanks Ryan and Georges for flagging this!</li>\n<li><strong>Fix</strong> &#8211; Fixed datepicker format related problems when using Event Tickets as standalone</li>\n<li><strong>Tweak</strong> &#8211; Ensure the attendees cache is cleared upon checking in an attendee or undoing a checkin (thanks to @hadamlenz on GitHub for submitting this change!)</li>\n<li><strong>Tweak</strong> &#8211; Fix some internal documentation of shortcode templates to ensure filenames are accurate</li>\n<li><strong>Tweak</strong> &#8211; Prevent RSVP form from submitting when the quantity is 0 or if blank</li>\n</ul>\n<h3 id=\"etp\">Event Tickets Plus 4.8.2</h3>\n<ul>\n<li><strong>Tweak</strong> &#8211; Add <samp>tribe_tickets_plus_qr_enabled</samp> filter</li>\n</ul>\n<h3 id=\"eb\">Eventbrite Tickets 4.5.4</h3>\n<ul>\n<li><strong>Fix</strong> &#8211; Ensure that featured images from Eventbrite events are imported even without an Event Aggregator license key</li>\n<li><strong>Tweak</strong> &#8211; fire the <samp>tribe_events_eventbrite_event_data_not_found</samp> action and add a log entry when no data is found for an Eventbrite event</li>\n<li><strong>Tweak</strong> &#8211; added the <samp>tribe_events_eventbrite_iframe_display</samp> filter to allow overriding Eventbrite tickets iFrame display checks on events</li>\n</ul>\n<h3 id=\"not-updated\">Not Updated this Release</h3>\n<p>The following plugins have not been updated this release, and will remain at the version numbers specified here:</p>\n<ul>\n<li>Community Events 4.5.13.1</li>\n<li>Community Tickets 4.5.6</li>\n<li>Filter Bar 4.5.8</li>\n<li>GigPress 2.3.21</li>\n<li>Image Widget 4.4.7</li>\n<li>Advanced Post Manager 4.4</li>\n<li>Image Widget Plus 1.0.2</li>\n</ul>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/maintenance-release-for-the-week-of-30-september-2018/\">Maintenance Release for the Week of 30 September 2018</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:42:\"\n		\n		\n		\n		\n				\n		\n		\n		\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"Announcing Events Gutenberg Extension 0.2.9-alpha\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:80:\"https://theeventscalendar.com/announcing-events-gutenberg-extension-0-2-9-alpha/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 24 Sep 2018 14:56:38 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:4:{i:0;a:5:{s:4:\"data\";s:13:\"Release Notes\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:12:\"Block Editor\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:16:\"events gutenberg\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:3;a:5:{s:4:\"data\";s:9:\"Gutenberg\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://theeventscalendar.com/?p=1629001\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:653:\"<p>We are pleased to announce that Events Gutenberg 0.2.9-alpha is out! This version is compatible with: The Events Calendar: Version 4.6.23 or higher Gutenberg: Version 3.8.0 Get the Extension Events Gutenberg 0.2.9-alpha Changelog Fix &#8211; Prevent empty diff on new event creation, allowing Meta to be saved Fix &#8211; Prevent generation of empty classic blocks&#8230;</p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/announcing-events-gutenberg-extension-0-2-9-alpha/\">Announcing Events Gutenberg Extension 0.2.9-alpha</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:6:\"Victor\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:6510:\"<p>We are pleased to announce that <a href=\"https://theeventscalendar.com/extensions/events-gutenberg/\">Events Gutenberg 0.2.9-alpha</a> is out!</p>\n<p>This version is compatible with:</p>\n<ul>\n<li><strong>The Events Calendar</strong>: Version 4.6.23 or higher</li>\n<li><strong>Gutenberg</strong>: Version 3.8.0</li>\n</ul>\n<p><a class=\"btn-filled extension-download-link\" href=\"https://theeventscalendar.com/extensions/events-gutenberg/\" target=\"_blank\" rel=\"noopener\">Get the Extension</a></p>\n<h3>Events Gutenberg 0.2.9-alpha Changelog</h3>\n<ul>\n<li><strong>Fix</strong> &#8211; Prevent empty diff on new event creation, allowing Meta to be saved</li>\n<li><strong>Fix</strong> &#8211; Prevent generation of empty classic blocks when migrating events to gutenberg with empty content</li>\n<li><strong>Fix</strong> &#8211; Render the Google Map in the Event Venue Block.</li>\n</ul>\n<p><em><strong>Please note</strong> that just as with the Gutenberg plugin, this extension is not for use on production sites. Like Gutenberg, it should only be activated on a test site or local install.</em></p>\n<h3>Stay in the Loop</h3>\n<p>Check out our <a href=\"https://theeventscalendar.com/gutenberg-block-editor-news/\">block editor news page</a> for details on the latest Gutenberg developments.</p>\n<p>You can also get the latest news, updates, and release date announcements delivered to your inbox by signing up for our newsletter.<br />\n\n                <div class=\'gf_browser_unknown gform_wrapper\' id=\'gform_wrapper_28\' ><form method=\'post\' enctype=\'multipart/form-data\'  id=\'gform_28\'  action=\'/feed/\'>\n                        <div class=\'gform_body\'><ul id=\'gform_fields_28\' class=\'gform_fields top_label form_sublabel_below description_below\'><li id=\'field_28_7\'  class=\'gfield field_sublabel_above field_description_above gfield_visibility_visible\' ><label class=\'gfield_label gfield_label_before_complex\' for=\'input_28_7_3\' >Name</label><div class=\'ginput_complex ginput_container no_prefix has_first_name no_middle_name has_last_name no_suffix gf_name_has_2 ginput_container_name gfield_trigger_change\' id=\'input_28_7\'>\n                            \n                            <span id=\'input_28_7_3_container\' class=\'name_first\' >\n                                                    <label for=\'input_28_7_3\' >First</label>\n                                                    <input type=\'text\' name=\'input_7.3\' id=\'input_28_7_3\' value=\'\' aria-label=\'First name\'    aria-invalid=\"false\" />\n                                                </span>\n                            \n                            <span id=\'input_28_7_6_container\' class=\'name_last\' >\n                                                            <label for=\'input_28_7_6\' >Last</label>\n                                                            <input type=\'text\' name=\'input_7.6\' id=\'input_28_7_6\' value=\'\' aria-label=\'Last name\'    aria-invalid=\"false\" />\n                                                        </span>\n                            \n                        </div></li><li id=\'field_28_8\'  class=\'gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_hidden\' ><label class=\'gfield_label\' for=\'input_28_8\' >Email<span class=\'gfield_required\'>*</span></label><div class=\'ginput_container ginput_container_email\'>\n                            <input name=\'input_8\' id=\'input_28_8\' type=\'email\' value=\'\' class=\'medium\'     aria-required=\"true\" aria-invalid=\"false\"/>\n                        </div></li><li id=\'field_28_3\'  class=\'gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible is-gf-checkbox\' ><label class=\'gfield_label\'  ><span class=\'gfield_required\'>*</span></label><div class=\'ginput_container ginput_container_checkbox\'><ul class=\'gfield_checkbox\' id=\'input_28_3\'><li class=\'gchoice_28_3_1\'>\n								<input name=\'input_3.1\' type=\'checkbox\'  value=\'Sign me up for news &amp; updates\' checked=\'checked\' id=\'choice_28_3_1\'   />\n								<label for=\'choice_28_3_1\' id=\'label_28_3_1\'>Sign me up for news & updates</label>\n							</li></ul></div></li><li id=\'field_28_9\'  class=\'gfield gform_hidden field_sublabel_below field_description_below gfield_visibility_visible\' ><input name=\'input_9\' id=\'input_28_9\' type=\'hidden\' class=\'gform_hidden\'  aria-invalid=\"false\" value=\'Gutenberg newsletter signup\' /></li>\n                            </ul></div>\n        <div class=\'gform_footer top_label\'> <input type=\'submit\' id=\'gform_submit_button_28\' class=\'gform_button button\' value=\'Sign Up!\'  onclick=\'if(window[\"gf_submitting_28\"]){return false;}  if( !jQuery(\"#gform_28\")[0].checkValidity || jQuery(\"#gform_28\")[0].checkValidity()){window[\"gf_submitting_28\"]=true;}  \' onkeypress=\'if( event.keyCode == 13 ){ if(window[\"gf_submitting_28\"]){return false;} if( !jQuery(\"#gform_28\")[0].checkValidity || jQuery(\"#gform_28\")[0].checkValidity()){window[\"gf_submitting_28\"]=true;}  jQuery(\"#gform_28\").trigger(\"submit\",[true]); }\' /> \n            <input type=\'hidden\' class=\'gform_hidden\' name=\'is_submit_28\' value=\'1\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_submit\' value=\'28\' />\n            \n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_unique_id\' value=\'\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'state_28\' value=\'WyJbXSIsImM3MzcyYjNlZGVlNTZhMGE4MDM4NGMzMzkwNmEwMGM3Il0=\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_target_page_number_28\' id=\'gform_target_page_number_28\' value=\'0\' />\n            <input type=\'hidden\' class=\'gform_hidden\' name=\'gform_source_page_number_28\' id=\'gform_source_page_number_28\' value=\'1\' />\n            <input type=\'hidden\' name=\'gform_field_values\' value=\'\' />\n            \n        </div>\n                        </form>\n                        </div><script type=\'text/javascript\'> jQuery(document).bind(\'gform_post_render\', function(event, formId, currentPage){if(formId == 28) {} } );jQuery(document).bind(\'gform_post_conditional_logic\', function(event, formId, fields, isInit){} );</script><script type=\'text/javascript\'> jQuery(document).ready(function(){jQuery(document).trigger(\'gform_post_render\', [28, 1]) } ); </script></p>\n<p>The post <a rel=\"nofollow\" href=\"https://theeventscalendar.com/announcing-events-gutenberg-extension-0-2-9-alpha/\">Announcing Events Gutenberg Extension 0.2.9-alpha</a> appeared first on <a rel=\"nofollow\" href=\"https://theeventscalendar.com\">The Events Calendar</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:4:\"href\";s:35:\"https://theeventscalendar.com/feed/\";s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:44:\"http://purl.org/rss/1.0/modules/syndication/\";a:2:{s:12:\"updatePeriod\";a:1:{i:0;a:5:{s:4:\"data\";s:6:\"hourly\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:15:\"updateFrequency\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:10:{s:4:\"date\";s:29:\"Mon, 22 Oct 2018 10:15:20 GMT\";s:12:\"content-type\";s:34:\"application/rss+xml; charset=UTF-8\";s:6:\"server\";s:21:\"nginx/1.10.3 (Ubuntu)\";s:13:\"cache-control\";s:29:\"max-age=1859, must-revalidate\";s:12:\"x-powered-by\";s:27:\"PHP/7.0.28-0ubuntu0.16.04.1\";s:4:\"vary\";s:6:\"Cookie\";s:13:\"last-modified\";s:29:\"Mon, 22 Oct 2018 07:18:38 GMT\";s:4:\"etag\";s:34:\"\"3d46606dd8e670078e204f71c1622520\"\";s:12:\"x-robots-tag\";s:15:\"noindex, follow\";s:4:\"link\";s:66:\"<https://theeventscalendar.com/wp-json/>; rel=\"https://api.w.org/\"\";}}s:5:\"build\";s:14:\"20181015064052\";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(762, '_transient_timeout_feed_mod_0d102f2a1f4d6bc90eb8c6ffe18e56ed', '1540246523', 'no'),
(763, '_transient_feed_mod_0d102f2a1f4d6bc90eb8c6ffe18e56ed', '1540203323', 'no'),
(764, '_transient_timeout_feed_3ca2a73478cc83bbe37e39039b345a78', '1540246525', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(765, '_transient_feed_3ca2a73478cc83bbe37e39039b345a78', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:49:\"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"WPFR\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:16:\"https://wpfr.net\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Site officiel de la communauté\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:13:\"lastBuildDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 22 Oct 2018 10:11:42 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"fr-FR\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:10:{i:0;a:6:{s:4:\"data\";s:45:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n		\n		\n		\n		\n		\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:71:\"Tout savoir sur l’arrivée de Gutenberg en quelques points essentiels\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"http://feedproxy.google.com/~r/WordpressFrancophone/~3/i6NQjnc9uiQ/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:46:\"https://wpfr.net/wordpress-gutenberg/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 23 Apr 2018 09:00:07 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:4:{i:0;a:5:{s:4:\"data\";s:4:\"Blog\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:9:\"WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:15:\"éditeur visuel\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:3;a:5:{s:4:\"data\";s:9:\"Gutenberg\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"https://wpfr.net/?p=2117903\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1474:\"Gutenberg arrive à grand pas, alors voici un résumé de tout ce qu&#8217;il faut savoir sur le nouvel éditeur visuel de WordPress au travers de questions / réponses ! Difficile de marcher tranquillement dans le quartier WordPress sans entendre parler de ce fameux Gutenberg ! C&#8217;est un nouvel éditeur ? C&#8217;est un nouveau page builder<div class=\"btn btn-default read-more text-uppercase\">Lire la suite <span class=\"meta-nav\"><i class=\"fa fa-caret-right\"></i></span></div><div class=\"feedflare\">\n<a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=i6NQjnc9uiQ:TQYicJ8IHdE:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=i6NQjnc9uiQ:TQYicJ8IHdE:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=i6NQjnc9uiQ:TQYicJ8IHdE:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=i6NQjnc9uiQ:TQYicJ8IHdE:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=i6NQjnc9uiQ:TQYicJ8IHdE:gIN9vFwOqvQ\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=i6NQjnc9uiQ:TQYicJ8IHdE:gIN9vFwOqvQ\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/WordpressFrancophone/~4/i6NQjnc9uiQ\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"maximebj\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:42:\"https://wpfr.net/wordpress-gutenberg/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"13\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:37:\"https://wpfr.net/wordpress-gutenberg/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n		\n		\n		\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"Résultats des élections du bureau 2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"http://feedproxy.google.com/~r/WordpressFrancophone/~3/qvTDw6NqY5Q/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:58:\"https://wpfr.net/resultats-elections-bureau-2018/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 05 Mar 2018 08:00:52 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:16:\"Association WPFR\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:4:\"Blog\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"https://wpfr.net/?p=2107099\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1521:\"Suite à la votation électronique qui s&#8217;est déroulée du 24 février au 3 mars 2018, nous vous communiquons les résultats pour l&#8217;élection du bureau 2018. Vous avez été 40% des adhérents à participer au vote, soit 85 suffrages exprimés. C&#8217;est pratiquement autant de votants que l&#8217;an passé avec un nombre d&#8217;adhérents moins élevé, l&#8217;abstention reste<div class=\"btn btn-default read-more text-uppercase\">Lire la suite <span class=\"meta-nav\"><i class=\"fa fa-caret-right\"></i></span></div><div class=\"feedflare\">\n<a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=qvTDw6NqY5Q:LD0dZBWRJa4:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=qvTDw6NqY5Q:LD0dZBWRJa4:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=qvTDw6NqY5Q:LD0dZBWRJa4:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=qvTDw6NqY5Q:LD0dZBWRJa4:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=qvTDw6NqY5Q:LD0dZBWRJa4:gIN9vFwOqvQ\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=qvTDw6NqY5Q:LD0dZBWRJa4:gIN9vFwOqvQ\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/WordpressFrancophone/~4/qvTDw6NqY5Q\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Aurélien Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:54:\"https://wpfr.net/resultats-elections-bureau-2018/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"13\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"https://wpfr.net/resultats-elections-bureau-2018/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n		\n		\n		\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"Liste des candidats au bureau 2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"http://feedproxy.google.com/~r/WordpressFrancophone/~3/mYCnwrPtTAY/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:54:\"https://wpfr.net/liste-candidats-bureau-2018/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 16 Feb 2018 11:45:20 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:16:\"Association WPFR\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:4:\"Blog\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"https://wpfr.net/?p=2092699\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1508:\"Les élections pour le renouvellement du bureau auront lieu du 24 février au 3 mars 2018 par voie électronique. Nous vous communiquons dès à présent la liste des candidats validée par l&#8217;actuel bureau, classés par ordre alphabétique. Les candidats Willy Bahuaud Présentation Je suis développeur full-stack. Après quelques années passées en agence à Nantes, j’ai<div class=\"btn btn-default read-more text-uppercase\">Lire la suite <span class=\"meta-nav\"><i class=\"fa fa-caret-right\"></i></span></div><div class=\"feedflare\">\n<a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=mYCnwrPtTAY:g4F7i0PDxEQ:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=mYCnwrPtTAY:g4F7i0PDxEQ:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=mYCnwrPtTAY:g4F7i0PDxEQ:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=mYCnwrPtTAY:g4F7i0PDxEQ:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=mYCnwrPtTAY:g4F7i0PDxEQ:gIN9vFwOqvQ\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=mYCnwrPtTAY:g4F7i0PDxEQ:gIN9vFwOqvQ\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/WordpressFrancophone/~4/mYCnwrPtTAY\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Aurélien Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:50:\"https://wpfr.net/liste-candidats-bureau-2018/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:45:\"https://wpfr.net/liste-candidats-bureau-2018/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n		\n		\n		\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"WPFR sponsor du WP Tech Lyon !\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"http://feedproxy.google.com/~r/WordpressFrancophone/~3/kVgok7MJrJM/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"https://wpfr.net/wpfr-sponsor-wptech-lyon/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 12 Feb 2018 07:00:30 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:4:\"Blog\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:11:\"Evènements\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"https://wpfr.net/?p=2082223\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1507:\"L’association WPFR est fière de vous annoncer qu’elle sponsorise WP Tech 2018 qui aura lieu le 28 avril à Lyon. Le WP Tech est une journée de conférences et d’ateliers exclusivement consacrée aux aspects techniques de WordPress. Vous y découvrirez des outils pour améliorer vos méthodes de travail, apprendrez de nouvelles méthodes de développements d’extensions,<div class=\"btn btn-default read-more text-uppercase\">Lire la suite <span class=\"meta-nav\"><i class=\"fa fa-caret-right\"></i></span></div><div class=\"feedflare\">\n<a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=kVgok7MJrJM:wfMH9NuDwps:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=kVgok7MJrJM:wfMH9NuDwps:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=kVgok7MJrJM:wfMH9NuDwps:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=kVgok7MJrJM:wfMH9NuDwps:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=kVgok7MJrJM:wfMH9NuDwps:gIN9vFwOqvQ\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=kVgok7MJrJM:wfMH9NuDwps:gIN9vFwOqvQ\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/WordpressFrancophone/~4/kVgok7MJrJM\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Aurélien Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:47:\"https://wpfr.net/wpfr-sponsor-wptech-lyon/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:42:\"https://wpfr.net/wpfr-sponsor-wptech-lyon/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:45:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n		\n		\n		\n		\n		\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:64:\"Loi anti-fraude et l’e-commerce : les informations officielles\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"http://feedproxy.google.com/~r/WordpressFrancophone/~3/KBb85wMEo0g/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:86:\"https://wpfr.net/loi-anti-fraude-et-le-commerce-les-informations-officielles/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 31 Jan 2018 14:51:34 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:4:{i:0;a:5:{s:4:\"data\";s:10:\"Extensions\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:21:\"WordPress Francophone\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:15:\"Loi anti-fraude\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:3;a:5:{s:4:\"data\";s:11:\"WooCommerce\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"https://wpfr.net/?p=2072415\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1503:\"Cette nouvelle loi a fait couler pas mal d&#8217;encre ces derniers temps et afin d&#8217;apporter des réponses concrètes et officielles, nous nous sommes penchés sur le sujet en profondeur. Voici donc ce qu&#8217;il en ressort officiellement : Les plateformes e-commerce open source sont bien concernées par la loi anti-fraude Que ce soit WooCommerce, Magento, Prestashop,<div class=\"btn btn-default read-more text-uppercase\">Lire la suite <span class=\"meta-nav\"><i class=\"fa fa-caret-right\"></i></span></div><div class=\"feedflare\">\n<a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=KBb85wMEo0g:NZq1YCx1Y5E:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=KBb85wMEo0g:NZq1YCx1Y5E:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=KBb85wMEo0g:NZq1YCx1Y5E:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=KBb85wMEo0g:NZq1YCx1Y5E:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=KBb85wMEo0g:NZq1YCx1Y5E:gIN9vFwOqvQ\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=KBb85wMEo0g:NZq1YCx1Y5E:gIN9vFwOqvQ\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/WordpressFrancophone/~4/KBb85wMEo0g\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"maximebj\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:82:\"https://wpfr.net/loi-anti-fraude-et-le-commerce-les-informations-officielles/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"39\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:77:\"https://wpfr.net/loi-anti-fraude-et-le-commerce-les-informations-officielles/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n		\n		\n		\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"L’élection du bureau WPFR 2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"http://feedproxy.google.com/~r/WordpressFrancophone/~3/BC2q8usn6uA/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:52:\"https://wpfr.net/election-bureau-wpfr-2018/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 15 Jan 2018 11:30:54 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:16:\"Association WPFR\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:4:\"Blog\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"https://wpfr.net/?p=2041252\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1530:\"Comme annoncé lors de l’assemblée générale du 12 décembre 2017, l&#8217;heure des élections a sonné. Le bureau actuellement en place voit son mandat terminé, de nouvelles élections doivent donc avoir lieu afin de le renouveler  Ces élections sont prévues pour le 26 février 2018 et nous invitons les membres l&#8217;association désireux d&#8217;occuper des responsabilités nationales à<div class=\"btn btn-default read-more text-uppercase\">Lire la suite <span class=\"meta-nav\"><i class=\"fa fa-caret-right\"></i></span></div><div class=\"feedflare\">\n<a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=BC2q8usn6uA:rovaWM-7xzU:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=BC2q8usn6uA:rovaWM-7xzU:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=BC2q8usn6uA:rovaWM-7xzU:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=BC2q8usn6uA:rovaWM-7xzU:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=BC2q8usn6uA:rovaWM-7xzU:gIN9vFwOqvQ\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=BC2q8usn6uA:rovaWM-7xzU:gIN9vFwOqvQ\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/WordpressFrancophone/~4/BC2q8usn6uA\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Aurélien Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:48:\"https://wpfr.net/election-bureau-wpfr-2018/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:43:\"https://wpfr.net/election-bureau-wpfr-2018/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:30:\"\n		\n		\n		\n		\n				\n		\n\n		\n		\n		\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"PHP Tour Montpellier 2018 : WPFR est partenaire !\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"http://feedproxy.google.com/~r/WordpressFrancophone/~3/i_ty7z2Kg6A/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 11 Jan 2018 10:12:56 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:16:\"Association WPFR\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:4:\"Blog\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"https://wpfr.net/?p=2035309\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1489:\"WPFR est fière d&#8217;être partenaire du PHP Tour Montpellier 2018 qui se tiendra les 17 et 18 mai. Cet évènement porté par l&#8217;AFUP (Association Française des Utilisateurs de PHP) rassemble une sélection d&#8217;orateurs reconnus du monde PHP. Et comme vous le savez, WordPress repose en grande partie sur le langage PHP. Si vous êtes développeurs,<div class=\"btn btn-default read-more text-uppercase\">Lire la suite <span class=\"meta-nav\"><i class=\"fa fa-caret-right\"></i></span></div><div class=\"feedflare\">\n<a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=i_ty7z2Kg6A:5FE8vgrgZLs:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=i_ty7z2Kg6A:5FE8vgrgZLs:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=i_ty7z2Kg6A:5FE8vgrgZLs:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=i_ty7z2Kg6A:5FE8vgrgZLs:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=i_ty7z2Kg6A:5FE8vgrgZLs:gIN9vFwOqvQ\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=i_ty7z2Kg6A:5FE8vgrgZLs:gIN9vFwOqvQ\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/WordpressFrancophone/~4/i_ty7z2Kg6A\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Aurélien Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:59:\"https://wpfr.net/php-tour-montpellier-2018-wpfr-partenaire/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n		\n		\n		\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:41:\"Le point sur les certifications WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"http://feedproxy.google.com/~r/WordpressFrancophone/~3/SbTm014V92I/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://wpfr.net/point-certifications-wordpress/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 11 Dec 2017 17:15:46 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:16:\"Association WPFR\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:4:\"Blog\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"https://wpfr.net/?p=2001761\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1552:\"Le sujet des certifications WordPress est de retour en cette fin d&#8217;année pour faire un point de situation. L&#8217;association s&#8217;est penchée dessus et voici les conclusions actuelles. Pour rappel, j&#8217;avais émis l&#8217;idée en 2016 de faire certifier les formations WordPress. D&#8217;autres idées ont ensuite suivi, dont notamment celle d&#8217;inscrire WordPress au Registre National des Certifications<div class=\"btn btn-default read-more text-uppercase\">Lire la suite <span class=\"meta-nav\"><i class=\"fa fa-caret-right\"></i></span></div><div class=\"feedflare\">\n<a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=SbTm014V92I:Cd3SuKi-siI:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=SbTm014V92I:Cd3SuKi-siI:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=SbTm014V92I:Cd3SuKi-siI:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=SbTm014V92I:Cd3SuKi-siI:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=SbTm014V92I:Cd3SuKi-siI:gIN9vFwOqvQ\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=SbTm014V92I:Cd3SuKi-siI:gIN9vFwOqvQ\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/WordpressFrancophone/~4/SbTm014V92I\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"maximebj\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:53:\"https://wpfr.net/point-certifications-wordpress/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"11\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:48:\"https://wpfr.net/point-certifications-wordpress/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n		\n		\n		\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"Certification WordPress par WPFR, appel à contributions\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"http://feedproxy.google.com/~r/WordpressFrancophone/~3/UUGDJmDzVjE/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:75:\"https://wpfr.net/certification-wordpress-wpfr-appel-contributions/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 19 Oct 2017 06:46:49 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:16:\"Association WPFR\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:4:\"Blog\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"https://wpfr.net/?p=1931227\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1508:\"Le chantier lié à la mise en place d&#8217;une certification WordPress accessible via le Compte Personnel de Formation (CPF) et enregistré auprès du Registre National des Certifications Professionnelles (RNCP) est en marche. Ce dernier est mené par Maxime Bernard-Jacquet avec nous l&#8217;espérons des résultats concrets pour 2018. Cette mission a été relancée lors de la<div class=\"btn btn-default read-more text-uppercase\">Lire la suite <span class=\"meta-nav\"><i class=\"fa fa-caret-right\"></i></span></div><div class=\"feedflare\">\n<a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=UUGDJmDzVjE:jTMHK5CfDEs:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=UUGDJmDzVjE:jTMHK5CfDEs:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=UUGDJmDzVjE:jTMHK5CfDEs:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=UUGDJmDzVjE:jTMHK5CfDEs:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=UUGDJmDzVjE:jTMHK5CfDEs:gIN9vFwOqvQ\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=UUGDJmDzVjE:jTMHK5CfDEs:gIN9vFwOqvQ\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/WordpressFrancophone/~4/UUGDJmDzVjE\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Aurélien Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:71:\"https://wpfr.net/certification-wordpress-wpfr-appel-contributions/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:66:\"https://wpfr.net/certification-wordpress-wpfr-appel-contributions/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:45:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n		\n		\n		\n		\n		\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:61:\"Le 30 septembre, c’est le WordPress Translation Day 2017 !\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"http://feedproxy.google.com/~r/WordpressFrancophone/~3/PgJgl5KXQwk/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"https://wpfr.net/le-30-septembre-cest-le-wordpress-translation-day-2017/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 12 Sep 2017 12:03:43 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:4:{i:0;a:5:{s:4:\"data\";s:4:\"Blog\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:11:\"Evènements\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:11:\"communauté\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:3;a:5:{s:4:\"data\";s:10:\"traduction\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"https://wpfr.net/?p=1883236\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1488:\"Le troisième WordPress Translation Day aura lieu le 30 septembre 2017 ! Le 30/09 se déroulera un marathon mondial de 24 heures dédié à la traduction et à la localisation de la plate-forme WordPress et de son écosystème : thèmes, extensions, applications… Organisé par l&#8217;équipe WordPress Polyglots dont la mission est de traduire WordPress dans<div class=\"btn btn-default read-more text-uppercase\">Lire la suite <span class=\"meta-nav\"><i class=\"fa fa-caret-right\"></i></span></div><div class=\"feedflare\">\n<a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=PgJgl5KXQwk:7QgDYesvNPg:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=PgJgl5KXQwk:7QgDYesvNPg:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=PgJgl5KXQwk:7QgDYesvNPg:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=PgJgl5KXQwk:7QgDYesvNPg:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs\" border=\"0\"></img></a> <a href=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?a=PgJgl5KXQwk:7QgDYesvNPg:gIN9vFwOqvQ\"><img src=\"http://feeds.feedburner.com/~ff/WordpressFrancophone?i=PgJgl5KXQwk:7QgDYesvNPg:gIN9vFwOqvQ\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/WordpressFrancophone/~4/PgJgl5KXQwk\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"Jb Audras\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:77:\"https://wpfr.net/le-30-septembre-cest-le-wordpress-translation-day-2017/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:72:\"https://wpfr.net/le-30-septembre-cest-le-wordpress-translation-day-2017/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:44:\"http://purl.org/rss/1.0/modules/syndication/\";a:2:{s:12:\"updatePeriod\";a:1:{i:0;a:5:{s:4:\"data\";s:6:\"hourly\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:15:\"updateFrequency\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:2:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";s:4:\"href\";s:48:\"http://feeds.feedburner.com/WordpressFrancophone\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:2:{s:3:\"rel\";s:3:\"hub\";s:4:\"href\";s:32:\"http://pubsubhubbub.appspot.com/\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:4:{s:4:\"info\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:3:\"uri\";s:20:\"wordpressfrancophone\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:14:\"emailServiceId\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordpressFrancophone\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:18:\"feedburnerHostname\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://feedburner.google.com\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"feedFlare\";a:9:{i:0;a:5:{s:4:\"data\";s:24:\"Subscribe with NewsGator\";s:7:\"attribs\";a:1:{s:0:\"\";a:2:{s:4:\"href\";s:112:\"http://www.newsgator.com/ngs/subscriber/subext.aspx?url=http%3A%2F%2Ffeeds.feedburner.com%2FWordpressFrancophone\";s:3:\"src\";s:42:\"http://www.newsgator.com/images/ngsub1.gif\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:24:\"Subscribe with Bloglines\";s:7:\"attribs\";a:1:{s:0:\"\";a:2:{s:4:\"href\";s:77:\"http://www.bloglines.com/sub/http://feeds.feedburner.com/WordpressFrancophone\";s:3:\"src\";s:48:\"http://www.bloglines.com/images/sub_modern11.gif\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:23:\"Subscribe with Netvibes\";s:7:\"attribs\";a:1:{s:0:\"\";a:2:{s:4:\"href\";s:98:\"http://www.netvibes.com/subscribe.php?url=http%3A%2F%2Ffeeds.feedburner.com%2FWordpressFrancophone\";s:3:\"src\";s:39:\"//www.netvibes.com/img/add2netvibes.gif\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:3;a:5:{s:4:\"data\";s:21:\"Subscribe with Google\";s:7:\"attribs\";a:1:{s:0:\"\";a:2:{s:4:\"href\";s:93:\"http://fusion.google.com/add?feedurl=http%3A%2F%2Ffeeds.feedburner.com%2FWordpressFrancophone\";s:3:\"src\";s:51:\"http://buttons.googlesyndication.com/fusion/add.gif\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:4;a:5:{s:4:\"data\";s:25:\"Subscribe with Pageflakes\";s:7:\"attribs\";a:1:{s:0:\"\";a:2:{s:4:\"href\";s:101:\"http://www.pageflakes.com/subscribe.aspx?url=http%3A%2F%2Ffeeds.feedburner.com%2FWordpressFrancophone\";s:3:\"src\";s:87:\"http://www.pageflakes.com/ImageFile.ashx?instanceId=Static_4&fileName=ATP_blu_91x17.gif\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:5;a:5:{s:4:\"data\";s:21:\"Subscribe with Plusmo\";s:7:\"attribs\";a:1:{s:0:\"\";a:2:{s:4:\"href\";s:86:\"http://www.plusmo.com/add?url=http%3A%2F%2Ffeeds.feedburner.com%2FWordpressFrancophone\";s:3:\"src\";s:43:\"http://plusmo.com/res/graphics/fbplusmo.gif\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:6;a:5:{s:4:\"data\";s:23:\"Subscribe with Live.com\";s:7:\"attribs\";a:1:{s:0:\"\";a:2:{s:4:\"href\";s:81:\"http://www.live.com/?add=http%3A%2F%2Ffeeds.feedburner.com%2FWordpressFrancophone\";s:3:\"src\";s:141:\"http://tkfiles.storage.msn.com/x1piYkpqHC_35nIp1gLE68-wvzLZO8iXl_JMledmJQXP-XTBOLfmQv4zhj4MhcWEJh_GtoBIiAl1Mjh-ndp9k47If7hTaFno0mxW9_i3p_5qQw\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:7;a:5:{s:4:\"data\";s:25:\"Subscribe with Mon Yahoo!\";s:7:\"attribs\";a:1:{s:0:\"\";a:2:{s:4:\"href\";s:99:\"https://add.my.yahoo.com/content?lg=fr&url=http%3A%2F%2Ffeeds.feedburner.com%2FWordpressFrancophone\";s:3:\"src\";s:60:\"http://us.i1.yimg.com/us.yimg.com/i/us/my/bn/intatm_fr_1.gif\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:8;a:5:{s:4:\"data\";s:25:\"Subscribe with Excite MIX\";s:7:\"attribs\";a:1:{s:0:\"\";a:2:{s:4:\"href\";s:89:\"http://mix.excite.eu/add?feedurl=http%3A%2F%2Ffeeds.feedburner.com%2FWordpressFrancophone\";s:3:\"src\";s:42:\"http://image.excite.co.uk/mix/addtomix.gif\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:52:\"http://backend.userland.com/creativeCommonsRssModule\";a:1:{s:7:\"license\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"http://creativecommons.org/licenses/by-nc-sa/3.0/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:11:{s:12:\"content-type\";s:23:\"text/xml; charset=UTF-8\";s:4:\"etag\";s:27:\"VLnehmjqQ5WtXr6cBB25ygBIFdk\";s:13:\"last-modified\";s:29:\"Mon, 22 Oct 2018 10:10:30 GMT\";s:16:\"content-encoding\";s:4:\"gzip\";s:4:\"date\";s:29:\"Mon, 22 Oct 2018 10:15:23 GMT\";s:7:\"expires\";s:29:\"Mon, 22 Oct 2018 10:15:23 GMT\";s:13:\"cache-control\";s:18:\"private, max-age=0\";s:22:\"x-content-type-options\";s:7:\"nosniff\";s:16:\"x-xss-protection\";s:13:\"1; mode=block\";s:6:\"server\";s:3:\"GSE\";s:7:\"alt-svc\";s:40:\"quic=\":443\"; ma=2592000; v=\"44,43,39,35\"\";}}s:5:\"build\";s:14:\"20181015064052\";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(766, '_transient_timeout_feed_mod_3ca2a73478cc83bbe37e39039b345a78', '1540246525', 'no'),
(767, '_transient_feed_mod_3ca2a73478cc83bbe37e39039b345a78', '1540203325', 'no'),
(768, '_transient_timeout_feed_76f8d9281c01f21e505004d0986f50c6', '1540246525', 'no'),
(769, '_transient_feed_76f8d9281c01f21e505004d0986f50c6', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:5:\"\n		\n	\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:79:\"\n		\n		\n		\n		\n		\n		\n					\n						\n						\n						\n						\n						\n						\n						\n					\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"Planète WordPress Francophone\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:17:\"https://wpfr.net/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"Toute l’actualité de WordPress en français !\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"fr-FR\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:8:{i:0;a:6:{s:4:\"data\";s:84:\"\n		        \n		        \n		        \n		        \n		        \n		        \n		        \n		    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"Mes Slides du WordCamp Nice 2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"http://feedproxy.google.com/~r/wpfr/~3/9_F1ryiv97A/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:63:\"https://www.thivinfo.com/blog/mes-slides-du-wordcamp-nice-2018/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 19 Oct 2018 13:00:05 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:123:\"\n		        Et voilà les slides de ma 1ère conférence en tant qu&#8217;orateur qui a eu lieu au WordCamp Nice !		        \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:193:\"Et voilà les slides de ma 1ère conférence en tant qu&#8217;orateur qui a eu lieu au WordCamp Nice !<img src=\"http://feeds.feedburner.com/~r/wpfr/~4/9_F1ryiv97A\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:63:\"https://www.thivinfo.com/blog/mes-slides-du-wordcamp-nice-2018/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:84:\"\n		        \n		        \n		        \n		        \n		        \n		        \n		        \n		    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:54:\"L’éditeur moderne de WordPress avec Grid Layout CSS\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"http://feedproxy.google.com/~r/wpfr/~3/ebgzzaadrzg/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"https://www.gregoirenoyelle.com/editeur-moderne-wordpress-gutenberg-grid-layout-css/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 19 Oct 2018 11:36:36 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:558:\"\n		        Dans ce tutoriel, nous verrons comment utiliser l&#8217;éditeur moderne de WordPress pour créer des pages qui repose sur Grid CSS. Si vous connaissez mal cette nouvelle propriété, je vous recommande ma série dédiée sur Grid Layout. Utilisation du nouvel éditeur de WordPress Avec la version 5 de WordPress, l&#8217;éditeur moderne va remplacer le bon vieux ...Cet article a été publié le 19 octobre 2018 par Grégoire Noyelle. Pour le lire en ligne, suivre le lien: L&rsquo;éditeur moderne de WordPress avec Grid Layout CSS.		        \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:780:\"Dans ce tutoriel, nous verrons comment utiliser l&#8217;éditeur moderne de WordPress pour créer des pages qui repose sur Grid CSS. Si vous connaissez mal cette nouvelle propriété, je vous recommande ma série dédiée sur Grid Layout. Utilisation du nouvel éditeur de WordPress Avec la version 5 de WordPress, l&#8217;éditeur moderne va remplacer le bon vieux ...<p>Cet article a été publié le 19 octobre 2018 par <a href=\"https://www.gregoirenoyelle.com\">Grégoire Noyelle</a>. Pour le lire en ligne, suivre le lien: <a href=\"https://www.gregoirenoyelle.com/editeur-moderne-wordpress-gutenberg-grid-layout-css/\">L&rsquo;éditeur moderne de WordPress avec Grid Layout CSS</a>.</p><img src=\"http://feeds.feedburner.com/~r/wpfr/~4/ebgzzaadrzg\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"https://www.gregoirenoyelle.com/editeur-moderne-wordpress-gutenberg-grid-layout-css/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:84:\"\n		        \n		        \n		        \n		        \n		        \n		        \n		        \n		    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"Comment trouver un bon thème WordPress pour photographe\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"http://feedproxy.google.com/~r/wpfr/~3/1tEOjpi1_ec/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:121:\"https://wpmarmite.com/theme-wordpress-photo/?utm_source=rss&#038;utm_medium=rss&%23038;utm_campaign=theme-wordpress-photo\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 17 Oct 2018 06:00:38 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:332:\"\n		        \nLorsque je visite certains sites de photographes, je suis souvent surpris par leur complexité. Photos de couples, de mariages, de bébés, de familles, d&rsquo;événements : la plupart du temps, les...\nL’article Comment trouver un bon thème WordPress pour photographe est apparu en premier sur WP Marmite.		        \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:10:\"WP Marmite\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:713:\"<p><img width=\"1500\" height=\"750\" src=\"https://wpmarmite.com/wp-content/uploads/2018/06/theme-photographe.jpg\" class=\"attachment-full size-full wp-post-image\" alt=\"\" /></p>\n<p>Lorsque je visite certains sites de photographes, je suis souvent surpris par leur complexité. Photos de couples, de mariages, de bébés, de familles, d&rsquo;événements : la plupart du temps, les...</p>\n<p>L’article <a rel=\"nofollow\" href=\"https://wpmarmite.com/theme-wordpress-photo/\">Comment trouver un bon thème WordPress pour photographe</a> est apparu en premier sur <a rel=\"nofollow\" href=\"https://wpmarmite.com\">WP Marmite</a>.</p><img src=\"http://feeds.feedburner.com/~r/wpfr/~4/1tEOjpi1_ec\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:121:\"https://wpmarmite.com/theme-wordpress-photo/?utm_source=rss&#038;utm_medium=rss&%23038;utm_campaign=theme-wordpress-photo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:84:\"\n		        \n		        \n		        \n		        \n		        \n		        \n		        \n		    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:28:\"Retour sur le WP BootCamp #2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"http://feedproxy.google.com/~r/wpfr/~3/cqQx3fhLxOU/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://wpchannel.com/actualites-wordpress/wp-bootcamp-2/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 11 Oct 2018 09:51:58 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:491:\"\n		        La seconde édition du WP BootCamp s&#8217;est déroulée avec succès du 21 au 24 septembre 2018 du côté de Trébeurden en Bretagne. Pour l&#8217;occasion, nous avions loué le château de Ker Nelly, une demeure néo-médiévale capable d&#8217;accueillir 16 participants de la communauté WordPress. Échanges professionnels, partage et moments de détente ont rythmé ce weekend au programme bien chargé. Un mélange de conférences et d&#8217;activités [&#8230;]		        \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:10:\"WP Channel\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:765:\"<div class=\"post-thumbnail\"><img width=\"356\" height=\"327\" src=\"https://wpchannel.com/images/2018/10/team-wp-bootcamp-bretagne-356x327.jpg\" class=\"attachment-large size-large wp-post-image\" alt=\"\" /></div>La seconde édition du WP BootCamp s&#8217;est déroulée avec succès du 21 au 24 septembre 2018 du côté de Trébeurden en Bretagne. Pour l&#8217;occasion, nous avions loué le château de Ker Nelly, une demeure néo-médiévale capable d&#8217;accueillir 16 participants de la communauté WordPress. Échanges professionnels, partage et moments de détente ont rythmé ce weekend au programme bien chargé. Un mélange de conférences et d&#8217;activités [&#8230;]<img src=\"http://feeds.feedburner.com/~r/wpfr/~4/cqQx3fhLxOU\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://wpchannel.com/actualites-wordpress/wp-bootcamp-2/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:84:\"\n		        \n		        \n		        \n		        \n		        \n		        \n		        \n		    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:11:\"Bulk Delete\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"http://feedproxy.google.com/~r/wpfr/~3/PCEA76D1mkU/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://www.echodesplugins.li-an.fr/plugins/bulk-delete/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 10 Oct 2018 14:26:24 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:79:\"\n		        Supprimer une liste de pages, d’articles plus rapidement		        \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:149:\"Supprimer une liste de pages, d’articles plus rapidement<img src=\"http://feeds.feedburner.com/~r/wpfr/~4/PCEA76D1mkU\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://www.echodesplugins.li-an.fr/plugins/bulk-delete/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:84:\"\n		        \n		        \n		        \n		        \n		        \n		        \n		        \n		    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:73:\"Comment effectuer une refonte d’un site WordPress : la checklist ultime\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"http://feedproxy.google.com/~r/wpfr/~3/wCggbYZfolQ/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:123:\"https://wpmarmite.com/refonte-site-wordpress/?utm_source=rss&#038;utm_medium=rss&%23038;utm_campaign=refonte-site-wordpress\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 10 Oct 2018 06:00:54 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:341:\"\n		        \nAaah, la refonte d’un site WordPress… Quand on pense aux différentes problématiques que cette mission implique, on a généralement tendance à stresser un peu. Qui ne rêve pas, dans ce...\nL’article Comment effectuer une refonte d’un site WordPress : la checklist ultime est apparu en premier sur WP Marmite.		        \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:10:\"WP Marmite\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:718:\"<p><img width=\"1500\" height=\"750\" src=\"https://wpmarmite.com/wp-content/uploads/2018/10/refonte-site.jpg\" class=\"attachment-full size-full wp-post-image\" alt=\"\" /></p>\n<p>Aaah, la refonte d’un site WordPress… Quand on pense aux différentes problématiques que cette mission implique, on a généralement tendance à stresser un peu. Qui ne rêve pas, dans ce...</p>\n<p>L’article <a rel=\"nofollow\" href=\"https://wpmarmite.com/refonte-site-wordpress/\">Comment effectuer une refonte d’un site WordPress : la checklist ultime</a> est apparu en premier sur <a rel=\"nofollow\" href=\"https://wpmarmite.com\">WP Marmite</a>.</p><img src=\"http://feeds.feedburner.com/~r/wpfr/~4/wCggbYZfolQ\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:123:\"https://wpmarmite.com/refonte-site-wordpress/?utm_source=rss&#038;utm_medium=rss&%23038;utm_campaign=refonte-site-wordpress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:84:\"\n		        \n		        \n		        \n		        \n		        \n		        \n		        \n		    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:50:\"Lister les scripts CSS / JS chargés par WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"http://feedproxy.google.com/~r/wpfr/~3/Ud2YaPMAswY/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:92:\"https://wpchannel.com/wordpress/tutoriels-wordpress/lister-scripts-css-js-charges-wordpress/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 08 Oct 2018 18:30:23 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:444:\"\n		        Comment obtenir une liste complète des feuilles de styles CSS et des scripts JavaScript chargés par le thème et les extensions d&#8217;un site sous WordPress ? Obtenir une telle liste présente un intérêt évident lorsque vous cherchez à optimiser les performances de votre site. En effet, il n&#8217;est pas rare que certains scripts soient chargés sur l&#8217;ensemble des pages de votre site alors même [&#8230;]		        \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:10:\"WP Channel\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:703:\"<div class=\"post-thumbnail\"><img width=\"356\" height=\"327\" src=\"https://wpchannel.com/images/2018/08/html5-code-356x327.jpg\" class=\"attachment-large size-large wp-post-image\" alt=\"\" /></div>Comment obtenir une liste complète des feuilles de styles CSS et des scripts JavaScript chargés par le thème et les extensions d&#8217;un site sous WordPress ? Obtenir une telle liste présente un intérêt évident lorsque vous cherchez à optimiser les performances de votre site. En effet, il n&#8217;est pas rare que certains scripts soient chargés sur l&#8217;ensemble des pages de votre site alors même [&#8230;]<img src=\"http://feeds.feedburner.com/~r/wpfr/~4/Ud2YaPMAswY\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:92:\"https://wpchannel.com/wordpress/tutoriels-wordpress/lister-scripts-css-js-charges-wordpress/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:84:\"\n		        \n		        \n		        \n		        \n		        \n		        \n		        \n		    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"OceanWP : LE mode d’emploi !\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"http://feedproxy.google.com/~r/wpfr/~3/pnwExm41cE4/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:48:\"https://wpformation.com/oceanwp-le-mode-demploi/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 08 Oct 2018 06:45:30 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:573:\"\n		        OceanWP est certainement le thème WordPress gratuit le plus prisé du moment. Il n&#8217;est pourtant pas le thème le plus utilisé, il compte seulement 200 000 installations actives. Toutefois, sur les 861 notes qu&#8217;il obtient &#8211; à l&#8217;heure où cet article est rédigé &#8211; 857 reviews lui donnent la note de 5/5. C&#8217;est du jamais [&#8230;]\n\nL’article OceanWP : LE mode d&#8217;emploi ! est apparu en premier sur WPFormation. Tutoriels WordPress, Formation WordPress, Woocommerce, SEO. Abonnez-vous pour ne rien manquer !\n		        \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"WP Formation\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1378:\"<p><img width=\"1040\" height=\"782\" src=\"https://wpformation.com/wp-content/uploads/2018/10/ocean-wp.jpg\" class=\"attachment-Large size-Large wp-post-image\" alt=\"OceanWP\" style=\"margin-left: 0px;margin-right: auto;margin-top:10px;margin-bottom:10px;max-width: 640px;max-height: 400px\" />OceanWP est certainement le thème WordPress gratuit le plus prisé du moment. Il n&#8217;est pourtant pas le thème le plus utilisé, il compte seulement 200 000 installations actives. Toutefois, sur les 861 notes qu&#8217;il obtient &#8211; à l&#8217;heure où cet article est rédigé &#8211; 857 reviews lui donnent la note de 5/5. C&#8217;est du jamais [&#8230;]</p>\n<hr />\nL’article <a rel=\"nofollow\" href=\"https://wpformation.com/oceanwp-le-mode-demploi/\">OceanWP : LE mode d&#8217;emploi !</a> est apparu en premier sur <a href=\"https://wpformation.com/\">WPFormation</a>.<br /> <a href=\"https://wpformation.com/wordpress/\">Tutoriels WordPress</a>, <a href=\"https://wpformation.com/formation-wordpress/\">Formation WordPress</a>, <a href=\"https://wpformation.com/formation-woocommerce-e-commerce/\">Woocommerce</a>, <a href=\"https://wpformation.com/formation-wordpress-pro/\">SEO</a>. <a href=\"https://wpformation.com/abonnement-newsletter-wpf/\">Abonnez-vous</a> pour ne rien manquer !</p>\n<hr /><img src=\"http://feeds.feedburner.com/~r/wpfr/~4/pnwExm41cE4\" height=\"1\" width=\"1\" alt=\"\"/>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:8:\"origLink\";a:1:{i:0;a:5:{s:4:\"data\";s:48:\"https://wpformation.com/oceanwp-le-mode-demploi/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:52:\"http://backend.userland.com/creativeCommonsRssModule\";a:1:{s:7:\"license\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"http://creativecommons.org/licenses/by-nc-sa/3.0/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:2:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";s:4:\"href\";s:32:\"http://feeds.feedburner.com/wpfr\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:2:{s:3:\"rel\";s:3:\"hub\";s:4:\"href\";s:32:\"http://pubsubhubbub.appspot.com/\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:42:\"http://rssnamespace.org/feedburner/ext/1.0\";a:1:{s:4:\"info\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:3:\"uri\";s:4:\"wpfr\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:11:{s:12:\"content-type\";s:23:\"text/xml; charset=UTF-8\";s:4:\"etag\";s:27:\"W5eWtRQO97hxKvj6Pv1KuFstOg8\";s:13:\"last-modified\";s:29:\"Mon, 22 Oct 2018 09:58:16 GMT\";s:16:\"content-encoding\";s:4:\"gzip\";s:4:\"date\";s:29:\"Mon, 22 Oct 2018 10:15:24 GMT\";s:7:\"expires\";s:29:\"Mon, 22 Oct 2018 10:15:24 GMT\";s:13:\"cache-control\";s:18:\"private, max-age=0\";s:22:\"x-content-type-options\";s:7:\"nosniff\";s:16:\"x-xss-protection\";s:13:\"1; mode=block\";s:6:\"server\";s:3:\"GSE\";s:7:\"alt-svc\";s:40:\"quic=\":443\"; ma=2592000; v=\"44,43,39,35\"\";}}s:5:\"build\";s:14:\"20181015064052\";}', 'no'),
(770, '_transient_timeout_feed_mod_76f8d9281c01f21e505004d0986f50c6', '1540246525', 'no'),
(771, '_transient_feed_mod_76f8d9281c01f21e505004d0986f50c6', '1540203325', 'no'),
(772, '_transient_timeout_dash_v2_bd94b8f41e74bae2f4dc72e9bd8379af', '1540246525', 'no'),
(773, '_transient_dash_v2_bd94b8f41e74bae2f4dc72e9bd8379af', '<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'http://feedproxy.google.com/~r/WordpressFrancophone/~3/i6NQjnc9uiQ/\'>Tout savoir sur l’arrivée de Gutenberg en quelques points essentiels</a></li></ul></div><div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'http://feedproxy.google.com/~r/wpfr/~3/9_F1ryiv97A/\'>Mes Slides du WordCamp Nice 2018</a></li><li><a class=\'rsswidget\' href=\'http://feedproxy.google.com/~r/wpfr/~3/ebgzzaadrzg/\'>L’éditeur moderne de WordPress avec Grid Layout CSS</a></li><li><a class=\'rsswidget\' href=\'http://feedproxy.google.com/~r/wpfr/~3/1tEOjpi1_ec/\'>Comment trouver un bon thème WordPress pour photographe</a></li><li><a class=\'rsswidget\' href=\'http://feedproxy.google.com/~r/wpfr/~3/cqQx3fhLxOU/\'>Retour sur le WP BootCamp #2</a></li><li><a class=\'rsswidget\' href=\'http://feedproxy.google.com/~r/wpfr/~3/PCEA76D1mkU/\'>Bulk Delete</a></li><li><a class=\'rsswidget\' href=\'http://feedproxy.google.com/~r/wpfr/~3/wCggbYZfolQ/\'>Comment effectuer une refonte d’un site WordPress : la checklist ultime</a></li></ul></div>', 'no'),
(868, 'knews_custom_widget_title_de_DE', 'Anmelden', 'yes'),
(869, 'knews_custom_widget_label_email_de_DE', 'E-Mail:', 'yes'),
(870, 'knews_custom_widget_required_de_DE', '*Pflichtfeld', 'yes'),
(871, 'knews_custom_widget_button_de_DE', 'Senden', 'yes'),
(941, '_transient_timeout_tribe_aggregator_services_list', '1540293908', 'no'),
(942, '_transient_tribe_aggregator_services_list', 'a:1:{s:6:\"origin\";a:1:{i:0;O:8:\"stdClass\":2:{s:2:\"id\";s:3:\"csv\";s:4:\"name\";s:11:\"Fichier CSV\";}}}', 'no'),
(950, '_transient_pll_languages_list', 'a:2:{i:0;a:26:{s:7:\"term_id\";i:6;s:4:\"name\";s:9:\"Français\";s:4:\"slug\";s:2:\"fr\";s:10:\"term_group\";i:0;s:16:\"term_taxonomy_id\";i:6;s:8:\"taxonomy\";s:8:\"language\";s:11:\"description\";s:5:\"fr_FR\";s:6:\"parent\";i:0;s:5:\"count\";i:25;s:10:\"tl_term_id\";i:7;s:19:\"tl_term_taxonomy_id\";i:7;s:8:\"tl_count\";i:4;s:6:\"locale\";R:9;s:6:\"is_rtl\";i:0;s:3:\"w3c\";s:5:\"fr-FR\";s:8:\"facebook\";s:5:\"fr_FR\";s:8:\"flag_url\";s:73:\"http://localhost:8080/chanter.ch/wp-content/plugins/polylang/flags/fr.png\";s:4:\"flag\";s:798:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAIAAAD5gJpuAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGzSURBVHjaYiyeepkBBv79+Zfnx/f379+fP38CyT9//jAyMiq5GP77wvDnJ8MfoAIGBoAAYgGqC7STApL///3/9++/pCTv////Qdz/QO4/IMna0vf/z+9/v379//37bUUTQACBNDD8Z/j87fffvyAVX79+/Q8GQDbQeKA9fM+e/Pv18/+vnwzCIkBLAAKQOAY5AIAwCEv4/4PddNUm3ji0QJyxW3rgzE0iLfqDGr2oYuu0l54AYvnz5x9Q6d+/QPQfyAQqAin9B3EOyG1A1UDj//36zfjr1y8GBoAAFI9BDgAwCMIw+P8Ho3GDO6XQ0l4MN8b2kUwYaLszqgKM/KHcDXwBxAJUD3TJ779A8h9Q5D8SAHoARP36+Rfo41+/mcA2AAQQy49ff0Cu//MPpAeI/0FdA1QNYYNVA/3wmwEYVgwMAAHE8uPHH5BqoD1//gJJLADoJKDS378Z//wFhhJAALF8A3rizz8uTmYg788fJkj4QOKREQyYxSWBhjEC/fcXZANAALF8+/anbcHlHz9+ffvx58uPX9KckkCn/gby/wLd8uvHjx96k+cD1UGiGQgAAgwA7q17ZpsMdUQAAAAASUVORK5CYII=\" title=\"Français\" alt=\"Français\" />\";s:8:\"home_url\";s:33:\"http://localhost:8080/chanter.ch/\";s:10:\"search_url\";s:33:\"http://localhost:8080/chanter.ch/\";s:4:\"host\";N;s:5:\"mo_id\";s:2:\"70\";s:13:\"page_on_front\";i:103;s:14:\"page_for_posts\";b:0;s:6:\"filter\";s:3:\"raw\";s:9:\"flag_code\";s:2:\"fr\";}i:1;a:26:{s:7:\"term_id\";i:9;s:4:\"name\";s:7:\"Deutsch\";s:4:\"slug\";s:2:\"de\";s:10:\"term_group\";i:1;s:16:\"term_taxonomy_id\";i:9;s:8:\"taxonomy\";s:8:\"language\";s:11:\"description\";s:5:\"de_DE\";s:6:\"parent\";i:0;s:5:\"count\";i:19;s:10:\"tl_term_id\";i:10;s:19:\"tl_term_taxonomy_id\";i:10;s:8:\"tl_count\";i:1;s:6:\"locale\";R:35;s:6:\"is_rtl\";i:0;s:3:\"w3c\";s:5:\"de-DE\";s:8:\"facebook\";s:5:\"de_DE\";s:8:\"flag_url\";s:73:\"http://localhost:8080/chanter.ch/wp-content/plugins/polylang/flags/de.png\";s:4:\"flag\";s:794:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAIAAAD5gJpuAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGzSURBVHjaYvTxcWb4+53h3z8GZpZff/79+v3n/7/fDAz/GHAAgABi+f37e3FxOZD1Dwz+/v3z9y+E/AMFv3//+Qumfv9et241QACxMDExAVWfOHkJJAEW/gUEP0EQDn78+AHE/gFOQJUAAcQiy8Ag8O+fLFj1n1+/QDp+/gQioK7fP378+vkDqOH39x9A/RJ/gE5lAAhAYhzcAACCQBDkgRXRjP034R0IaDTZTFZn0DItot37S94KLOINerEcI7aKHAHE8v/3r/9//zIA1f36/R+o4tevf1ANYNVA9P07RD9IJQMDQACxADHD3z8Ig4GMHz+AqqHagKp//fwLVA0U//v7LwMDQACx/LZiYFD7/5/53/+///79BqK/EMZ/UPACSYa/v/8DyX9A0oTxx2EGgABi+a/H8F/m339BoCoQ+g8kgRaCQvgPJJiBYmAuw39hxn+uDAABxMLwi+E/0PusRkwMvxhBGoDkH4b/v/+D2EDyz///QB1/QLb8+sP0lQEggFh+vGXYM2/SP6A2Zoaf30Ex/J+PgekHwz9gQDAz/P0FYrAyMfz7wcDAzPDtFwNAgAEAd3SIyRitX1gAAAAASUVORK5CYII=\" title=\"Deutsch\" alt=\"Deutsch\" />\";s:8:\"home_url\";s:47:\"http://localhost:8080/chanter.ch/de/willkommen/\";s:10:\"search_url\";s:36:\"http://localhost:8080/chanter.ch/de/\";s:4:\"host\";N;s:5:\"mo_id\";s:2:\"71\";s:13:\"page_on_front\";i:105;s:14:\"page_for_posts\";b:0;s:6:\"filter\";s:3:\"raw\";s:9:\"flag_code\";s:2:\"de\";}}', 'yes'),
(986, 'tribe_events_cat_children', 'a:0:{}', 'yes'),
(987, '_transient_is_multi_author', '0', 'yes'),
(995, '_transient_timeout_plugin_slugs', '1540317684', 'no'),
(996, '_transient_plugin_slugs', 'a:14:{i:0;s:25:\"adminimize/adminimize.php\";i:1;s:19:\"akismet/akismet.php\";i:2;s:35:\"author-category/author-category.php\";i:3;s:37:\"disable-comments/disable-comments.php\";i:4;s:15:\"knews/knews.php\";i:5;s:69:\"pending-submission-notifications/pending-submission-notifications.php\";i:6;s:13:\"pods/init.php\";i:7;s:21:\"polylang/polylang.php\";i:8;s:59:\"ultimate-social-media-icons/ultimate_social_media_icons.php\";i:9;s:43:\"the-events-calendar/the-events-calendar.php\";i:10;s:37:\"user-role-editor/user-role-editor.php\";i:11;s:47:\"user-specific-content/User-Specific-Content.php\";i:12;s:24:\"wpforms-lite/wpforms.php\";i:13;s:60:\"wp-support-plus-responsive-ticket-system/wp-support-plus.php\";}', 'no'),
(1004, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-4.9.8.zip\";s:6:\"locale\";s:5:\"fr_FR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-4.9.8.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.8\";s:7:\"version\";s:5:\"4.9.8\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1540231539;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}', 'no'),
(1005, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1540231538;s:7:\"checked\";a:4:{s:7:\"radiate\";s:5:\"1.2.9\";s:13:\"twentyfifteen\";s:3:\"2.0\";s:15:\"twentyseventeen\";s:3:\"1.7\";s:13:\"twentysixteen\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(1008, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1540238469', 'no'),
(1009, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'O:8:\"stdClass\":100:{s:6:\"widget\";a:3:{s:4:\"name\";s:6:\"widget\";s:4:\"slug\";s:6:\"widget\";s:5:\"count\";i:4512;}s:11:\"woocommerce\";a:3:{s:4:\"name\";s:11:\"woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:5:\"count\";i:3078;}s:4:\"post\";a:3:{s:4:\"name\";s:4:\"post\";s:4:\"slug\";s:4:\"post\";s:5:\"count\";i:2593;}s:5:\"admin\";a:3:{s:4:\"name\";s:5:\"admin\";s:4:\"slug\";s:5:\"admin\";s:5:\"count\";i:2452;}s:5:\"posts\";a:3:{s:4:\"name\";s:5:\"posts\";s:4:\"slug\";s:5:\"posts\";s:5:\"count\";i:1886;}s:9:\"shortcode\";a:3:{s:4:\"name\";s:9:\"shortcode\";s:4:\"slug\";s:9:\"shortcode\";s:5:\"count\";i:1687;}s:8:\"comments\";a:3:{s:4:\"name\";s:8:\"comments\";s:4:\"slug\";s:8:\"comments\";s:5:\"count\";i:1676;}s:7:\"twitter\";a:3:{s:4:\"name\";s:7:\"twitter\";s:4:\"slug\";s:7:\"twitter\";s:5:\"count\";i:1462;}s:6:\"images\";a:3:{s:4:\"name\";s:6:\"images\";s:4:\"slug\";s:6:\"images\";s:5:\"count\";i:1408;}s:6:\"google\";a:3:{s:4:\"name\";s:6:\"google\";s:4:\"slug\";s:6:\"google\";s:5:\"count\";i:1405;}s:8:\"facebook\";a:3:{s:4:\"name\";s:8:\"facebook\";s:4:\"slug\";s:8:\"facebook\";s:5:\"count\";i:1405;}s:5:\"image\";a:3:{s:4:\"name\";s:5:\"image\";s:4:\"slug\";s:5:\"image\";s:5:\"count\";i:1337;}s:7:\"sidebar\";a:3:{s:4:\"name\";s:7:\"sidebar\";s:4:\"slug\";s:7:\"sidebar\";s:5:\"count\";i:1284;}s:3:\"seo\";a:3:{s:4:\"name\";s:3:\"seo\";s:4:\"slug\";s:3:\"seo\";s:5:\"count\";i:1254;}s:7:\"gallery\";a:3:{s:4:\"name\";s:7:\"gallery\";s:4:\"slug\";s:7:\"gallery\";s:5:\"count\";i:1117;}s:4:\"page\";a:3:{s:4:\"name\";s:4:\"page\";s:4:\"slug\";s:4:\"page\";s:5:\"count\";i:1077;}s:5:\"email\";a:3:{s:4:\"name\";s:5:\"email\";s:4:\"slug\";s:5:\"email\";s:5:\"count\";i:1052;}s:6:\"social\";a:3:{s:4:\"name\";s:6:\"social\";s:4:\"slug\";s:6:\"social\";s:5:\"count\";i:1039;}s:9:\"ecommerce\";a:3:{s:4:\"name\";s:9:\"ecommerce\";s:4:\"slug\";s:9:\"ecommerce\";s:5:\"count\";i:936;}s:5:\"login\";a:3:{s:4:\"name\";s:5:\"login\";s:4:\"slug\";s:5:\"login\";s:5:\"count\";i:896;}s:5:\"links\";a:3:{s:4:\"name\";s:5:\"links\";s:4:\"slug\";s:5:\"links\";s:5:\"count\";i:836;}s:7:\"widgets\";a:3:{s:4:\"name\";s:7:\"widgets\";s:4:\"slug\";s:7:\"widgets\";s:5:\"count\";i:819;}s:5:\"video\";a:3:{s:4:\"name\";s:5:\"video\";s:4:\"slug\";s:5:\"video\";s:5:\"count\";i:810;}s:8:\"security\";a:3:{s:4:\"name\";s:8:\"security\";s:4:\"slug\";s:8:\"security\";s:5:\"count\";i:740;}s:7:\"content\";a:3:{s:4:\"name\";s:7:\"content\";s:4:\"slug\";s:7:\"content\";s:5:\"count\";i:710;}s:10:\"buddypress\";a:3:{s:4:\"name\";s:10:\"buddypress\";s:4:\"slug\";s:10:\"buddypress\";s:5:\"count\";i:699;}s:4:\"spam\";a:3:{s:4:\"name\";s:4:\"spam\";s:4:\"slug\";s:4:\"spam\";s:5:\"count\";i:690;}s:3:\"rss\";a:3:{s:4:\"name\";s:3:\"rss\";s:4:\"slug\";s:3:\"rss\";s:5:\"count\";i:689;}s:6:\"slider\";a:3:{s:4:\"name\";s:6:\"slider\";s:4:\"slug\";s:6:\"slider\";s:5:\"count\";i:686;}s:10:\"e-commerce\";a:3:{s:4:\"name\";s:10:\"e-commerce\";s:4:\"slug\";s:10:\"e-commerce\";s:5:\"count\";i:669;}s:5:\"pages\";a:3:{s:4:\"name\";s:5:\"pages\";s:4:\"slug\";s:5:\"pages\";s:5:\"count\";i:668;}s:9:\"analytics\";a:3:{s:4:\"name\";s:9:\"analytics\";s:4:\"slug\";s:9:\"analytics\";s:5:\"count\";i:661;}s:5:\"media\";a:3:{s:4:\"name\";s:5:\"media\";s:4:\"slug\";s:5:\"media\";s:5:\"count\";i:650;}s:6:\"jquery\";a:3:{s:4:\"name\";s:6:\"jquery\";s:4:\"slug\";s:6:\"jquery\";s:5:\"count\";i:646;}s:4:\"form\";a:3:{s:4:\"name\";s:4:\"form\";s:4:\"slug\";s:4:\"form\";s:5:\"count\";i:622;}s:6:\"search\";a:3:{s:4:\"name\";s:6:\"search\";s:4:\"slug\";s:6:\"search\";s:5:\"count\";i:621;}s:4:\"feed\";a:3:{s:4:\"name\";s:4:\"feed\";s:4:\"slug\";s:4:\"feed\";s:5:\"count\";i:616;}s:4:\"ajax\";a:3:{s:4:\"name\";s:4:\"ajax\";s:4:\"slug\";s:4:\"ajax\";s:5:\"count\";i:607;}s:4:\"menu\";a:3:{s:4:\"name\";s:4:\"menu\";s:4:\"slug\";s:4:\"menu\";s:5:\"count\";i:602;}s:8:\"category\";a:3:{s:4:\"name\";s:8:\"category\";s:4:\"slug\";s:8:\"category\";s:5:\"count\";i:601;}s:5:\"embed\";a:3:{s:4:\"name\";s:5:\"embed\";s:4:\"slug\";s:5:\"embed\";s:5:\"count\";i:574;}s:10:\"javascript\";a:3:{s:4:\"name\";s:10:\"javascript\";s:4:\"slug\";s:10:\"javascript\";s:5:\"count\";i:557;}s:3:\"css\";a:3:{s:4:\"name\";s:3:\"css\";s:4:\"slug\";s:3:\"css\";s:5:\"count\";i:548;}s:4:\"link\";a:3:{s:4:\"name\";s:4:\"link\";s:4:\"slug\";s:4:\"link\";s:5:\"count\";i:545;}s:7:\"youtube\";a:3:{s:4:\"name\";s:7:\"youtube\";s:4:\"slug\";s:7:\"youtube\";s:5:\"count\";i:533;}s:5:\"share\";a:3:{s:4:\"name\";s:5:\"share\";s:4:\"slug\";s:5:\"share\";s:5:\"count\";i:526;}s:6:\"editor\";a:3:{s:4:\"name\";s:6:\"editor\";s:4:\"slug\";s:6:\"editor\";s:5:\"count\";i:525;}s:5:\"theme\";a:3:{s:4:\"name\";s:5:\"theme\";s:4:\"slug\";s:5:\"theme\";s:5:\"count\";i:518;}s:7:\"comment\";a:3:{s:4:\"name\";s:7:\"comment\";s:4:\"slug\";s:7:\"comment\";s:5:\"count\";i:516;}s:10:\"responsive\";a:3:{s:4:\"name\";s:10:\"responsive\";s:4:\"slug\";s:10:\"responsive\";s:5:\"count\";i:514;}s:12:\"contact-form\";a:3:{s:4:\"name\";s:12:\"contact form\";s:4:\"slug\";s:12:\"contact-form\";s:5:\"count\";i:508;}s:9:\"dashboard\";a:3:{s:4:\"name\";s:9:\"dashboard\";s:4:\"slug\";s:9:\"dashboard\";s:5:\"count\";i:500;}s:6:\"custom\";a:3:{s:4:\"name\";s:6:\"custom\";s:4:\"slug\";s:6:\"custom\";s:5:\"count\";i:493;}s:10:\"categories\";a:3:{s:4:\"name\";s:10:\"categories\";s:4:\"slug\";s:10:\"categories\";s:5:\"count\";i:490;}s:9:\"affiliate\";a:3:{s:4:\"name\";s:9:\"affiliate\";s:4:\"slug\";s:9:\"affiliate\";s:5:\"count\";i:485;}s:3:\"ads\";a:3:{s:4:\"name\";s:3:\"ads\";s:4:\"slug\";s:3:\"ads\";s:5:\"count\";i:482;}s:4:\"tags\";a:3:{s:4:\"name\";s:4:\"tags\";s:4:\"slug\";s:4:\"tags\";s:5:\"count\";i:462;}s:6:\"button\";a:3:{s:4:\"name\";s:6:\"button\";s:4:\"slug\";s:6:\"button\";s:5:\"count\";i:462;}s:4:\"user\";a:3:{s:4:\"name\";s:4:\"user\";s:4:\"slug\";s:4:\"user\";s:5:\"count\";i:457;}s:7:\"contact\";a:3:{s:4:\"name\";s:7:\"contact\";s:4:\"slug\";s:7:\"contact\";s:5:\"count\";i:452;}s:6:\"mobile\";a:3:{s:4:\"name\";s:6:\"mobile\";s:4:\"slug\";s:6:\"mobile\";s:5:\"count\";i:445;}s:3:\"api\";a:3:{s:4:\"name\";s:3:\"api\";s:4:\"slug\";s:3:\"api\";s:5:\"count\";i:437;}s:7:\"payment\";a:3:{s:4:\"name\";s:7:\"payment\";s:4:\"slug\";s:7:\"payment\";s:5:\"count\";i:430;}s:5:\"photo\";a:3:{s:4:\"name\";s:5:\"photo\";s:4:\"slug\";s:5:\"photo\";s:5:\"count\";i:424;}s:5:\"users\";a:3:{s:4:\"name\";s:5:\"users\";s:4:\"slug\";s:5:\"users\";s:5:\"count\";i:422;}s:6:\"events\";a:3:{s:4:\"name\";s:6:\"events\";s:4:\"slug\";s:6:\"events\";s:5:\"count\";i:419;}s:5:\"stats\";a:3:{s:4:\"name\";s:5:\"stats\";s:4:\"slug\";s:5:\"stats\";s:5:\"count\";i:418;}s:9:\"slideshow\";a:3:{s:4:\"name\";s:9:\"slideshow\";s:4:\"slug\";s:9:\"slideshow\";s:5:\"count\";i:418;}s:6:\"photos\";a:3:{s:4:\"name\";s:6:\"photos\";s:4:\"slug\";s:6:\"photos\";s:5:\"count\";i:411;}s:10:\"navigation\";a:3:{s:4:\"name\";s:10:\"navigation\";s:4:\"slug\";s:10:\"navigation\";s:5:\"count\";i:392;}s:10:\"statistics\";a:3:{s:4:\"name\";s:10:\"statistics\";s:4:\"slug\";s:10:\"statistics\";s:5:\"count\";i:389;}s:15:\"payment-gateway\";a:3:{s:4:\"name\";s:15:\"payment gateway\";s:4:\"slug\";s:15:\"payment-gateway\";s:5:\"count\";i:382;}s:8:\"calendar\";a:3:{s:4:\"name\";s:8:\"calendar\";s:4:\"slug\";s:8:\"calendar\";s:5:\"count\";i:375;}s:4:\"news\";a:3:{s:4:\"name\";s:4:\"news\";s:4:\"slug\";s:4:\"news\";s:5:\"count\";i:372;}s:10:\"shortcodes\";a:3:{s:4:\"name\";s:10:\"shortcodes\";s:4:\"slug\";s:10:\"shortcodes\";s:5:\"count\";i:370;}s:4:\"chat\";a:3:{s:4:\"name\";s:4:\"chat\";s:4:\"slug\";s:4:\"chat\";s:5:\"count\";i:367;}s:5:\"popup\";a:3:{s:4:\"name\";s:5:\"popup\";s:4:\"slug\";s:5:\"popup\";s:5:\"count\";i:367;}s:9:\"marketing\";a:3:{s:4:\"name\";s:9:\"marketing\";s:4:\"slug\";s:9:\"marketing\";s:5:\"count\";i:362;}s:12:\"social-media\";a:3:{s:4:\"name\";s:12:\"social media\";s:4:\"slug\";s:12:\"social-media\";s:5:\"count\";i:355;}s:7:\"plugins\";a:3:{s:4:\"name\";s:7:\"plugins\";s:4:\"slug\";s:7:\"plugins\";s:5:\"count\";i:353;}s:10:\"newsletter\";a:3:{s:4:\"name\";s:10:\"newsletter\";s:4:\"slug\";s:10:\"newsletter\";s:5:\"count\";i:350;}s:9:\"multisite\";a:3:{s:4:\"name\";s:9:\"multisite\";s:4:\"slug\";s:9:\"multisite\";s:5:\"count\";i:349;}s:4:\"code\";a:3:{s:4:\"name\";s:4:\"code\";s:4:\"slug\";s:4:\"code\";s:5:\"count\";i:345;}s:4:\"meta\";a:3:{s:4:\"name\";s:4:\"meta\";s:4:\"slug\";s:4:\"meta\";s:5:\"count\";i:342;}s:3:\"url\";a:3:{s:4:\"name\";s:3:\"url\";s:4:\"slug\";s:3:\"url\";s:5:\"count\";i:340;}s:4:\"list\";a:3:{s:4:\"name\";s:4:\"list\";s:4:\"slug\";s:4:\"list\";s:5:\"count\";i:338;}s:5:\"forms\";a:3:{s:4:\"name\";s:5:\"forms\";s:4:\"slug\";s:5:\"forms\";s:5:\"count\";i:333;}s:8:\"redirect\";a:3:{s:4:\"name\";s:8:\"redirect\";s:4:\"slug\";s:8:\"redirect\";s:5:\"count\";i:331;}s:11:\"advertising\";a:3:{s:4:\"name\";s:11:\"advertising\";s:4:\"slug\";s:11:\"advertising\";s:5:\"count\";i:315;}s:11:\"performance\";a:3:{s:4:\"name\";s:11:\"performance\";s:4:\"slug\";s:11:\"performance\";s:5:\"count\";i:312;}s:6:\"simple\";a:3:{s:4:\"name\";s:6:\"simple\";s:4:\"slug\";s:6:\"simple\";s:5:\"count\";i:310;}s:16:\"custom-post-type\";a:3:{s:4:\"name\";s:16:\"custom post type\";s:4:\"slug\";s:16:\"custom-post-type\";s:5:\"count\";i:309;}s:3:\"tag\";a:3:{s:4:\"name\";s:3:\"tag\";s:4:\"slug\";s:3:\"tag\";s:5:\"count\";i:305;}s:12:\"notification\";a:3:{s:4:\"name\";s:12:\"notification\";s:4:\"slug\";s:12:\"notification\";s:5:\"count\";i:305;}s:7:\"adsense\";a:3:{s:4:\"name\";s:7:\"adsense\";s:4:\"slug\";s:7:\"adsense\";s:5:\"count\";i:303;}s:16:\"google-analytics\";a:3:{s:4:\"name\";s:16:\"google analytics\";s:4:\"slug\";s:16:\"google-analytics\";s:5:\"count\";i:303;}s:4:\"html\";a:3:{s:4:\"name\";s:4:\"html\";s:4:\"slug\";s:4:\"html\";s:5:\"count\";i:302;}s:8:\"tracking\";a:3:{s:4:\"name\";s:8:\"tracking\";s:4:\"slug\";s:8:\"tracking\";s:5:\"count\";i:301;}s:6:\"author\";a:3:{s:4:\"name\";s:6:\"author\";s:4:\"slug\";s:6:\"author\";s:5:\"count\";i:299;}s:14:\"contact-form-7\";a:3:{s:4:\"name\";s:14:\"contact form 7\";s:4:\"slug\";s:14:\"contact-form-7\";s:5:\"count\";i:296;}}', 'no'),
(1012, '_transient_timeout_tribe_plugin_upgrade_notice-02c68cbc', '1540317684', 'no'),
(1013, '_transient_tribe_plugin_upgrade_notice-02c68cbc', '', 'no'),
(1014, 'ihaf_insert_header', '<i class=\\\"fa fa-facebook-square\\\" aria-hidden=\\\"true\\\"></i>', 'yes'),
(1015, 'ihaf_insert_footer', '', 'yes'),
(1016, 'insert-headers-and-footers_welcome_dismissed_key', '1', 'yes'),
(1019, 'adding_tags', 'yes', 'yes'),
(1021, 'show_new_notification', 'yes', 'yes'),
(1022, 'show_premium_cumulative_count_notification', 'yes', 'yes'),
(1023, 'sfsi_section1_options', 's:373:\"a:10:{s:16:\"sfsi_rss_display\";s:2:\"no\";s:18:\"sfsi_email_display\";s:2:\"no\";s:21:\"sfsi_facebook_display\";s:3:\"yes\";s:20:\"sfsi_twitter_display\";s:2:\"no\";s:19:\"sfsi_google_display\";s:2:\"no\";s:20:\"sfsi_youtube_display\";s:3:\"yes\";s:22:\"sfsi_pinterest_display\";s:2:\"no\";s:21:\"sfsi_linkedin_display\";s:2:\"no\";s:22:\"sfsi_instagram_display\";s:2:\"no\";s:17:\"sfsi_custom_files\";s:0:\"\";}\";', 'yes'),
(1024, 'sfsi_section2_options', 's:1888:\"a:38:{s:12:\"sfsi_rss_url\";s:0:\"\";s:17:\"sfsi_rss_blogName\";s:0:\"\";s:18:\"sfsi_rss_blogEmail\";s:0:\"\";s:14:\"sfsi_rss_icons\";s:0:\"\";s:14:\"sfsi_email_url\";s:297:\"http://www.specificfeeds.com/widgets/emailSubscribeEncFeed/QU55K2p0c3lLSkFWeVVaeTREeS9BakM4RW1yekxFNTNsekQ3Nm51VXFsamMyUThYQ3RVVTVQNStxeFkwRi9NQkFsMkp1T3pDTlBINkdjNlB3SHpYdG9iOXRJcWozRld6MjJmU1o4dis2KzVPOURiZ3ArSGtuUVlwZ3lEYlo1ZVZ8dVExTFR2b240M0F4QmVWRWdHeWtBSlFCV042OHRxTkthbXM5Nk5wYTN1QT0=/OA==/\";s:24:\"sfsi_facebookPage_option\";s:3:\"yes\";s:21:\"sfsi_facebookPage_url\";s:57:\"https://www.facebook.com/FedSocChantValais/?ref=bookmarks\";s:24:\"sfsi_facebookLike_option\";s:2:\"no\";s:25:\"sfsi_facebookShare_option\";s:2:\"no\";s:21:\"sfsi_twitter_followme\";s:0:\"\";s:27:\"sfsi_twitter_followUserName\";s:0:\"\";s:22:\"sfsi_twitter_aboutPage\";s:0:\"\";s:17:\"sfsi_twitter_page\";s:0:\"\";s:20:\"sfsi_twitter_pageURL\";s:0:\"\";s:26:\"sfsi_twitter_aboutPageText\";s:82:\"Hey, check out this cool site I found: www.yourname.com #Topic via@my_twitter_name\";s:16:\"sfsi_google_page\";s:0:\"\";s:19:\"sfsi_google_pageURL\";s:0:\"\";s:22:\"sfsi_googleLike_option\";s:0:\"\";s:23:\"sfsi_googleShare_option\";s:0:\"\";s:20:\"sfsi_youtube_pageUrl\";s:56:\"https://www.youtube.com/channel/UCdAO5fYe4WS7KfvHvZZdNpg\";s:17:\"sfsi_youtube_page\";s:3:\"yes\";s:19:\"sfsi_youtube_follow\";s:2:\"no\";s:24:\"sfsi_youtubeusernameorid\";s:4:\"name\";s:15:\"sfsi_ytube_user\";s:0:\"\";s:17:\"sfsi_ytube_chnlid\";s:0:\"\";s:19:\"sfsi_pinterest_page\";s:0:\"\";s:22:\"sfsi_pinterest_pageUrl\";s:0:\"\";s:23:\"sfsi_pinterest_pingBlog\";s:0:\"\";s:22:\"sfsi_instagram_pageUrl\";s:0:\"\";s:18:\"sfsi_linkedin_page\";s:0:\"\";s:21:\"sfsi_linkedin_pageURL\";s:0:\"\";s:20:\"sfsi_linkedin_follow\";s:0:\"\";s:27:\"sfsi_linkedin_followCompany\";i:0;s:23:\"sfsi_linkedin_SharePage\";s:0:\"\";s:30:\"sfsi_linkedin_recommendBusines\";s:2:\"no\";s:30:\"sfsi_linkedin_recommendCompany\";s:0:\"\";s:32:\"sfsi_linkedin_recommendProductId\";i:0;s:21:\"sfsi_CustomIcon_links\";s:0:\"\";}\";', 'yes'),
(1025, 'sfsi_section3_options', 's:578:\"a:14:{s:18:\"sfsi_actvite_theme\";s:4:\"thin\";s:14:\"sfsi_mouseOver\";s:2:\"no\";s:21:\"sfsi_mouseOver_effect\";s:7:\"fade_in\";s:18:\"sfsi_shuffle_icons\";s:2:\"no\";s:22:\"sfsi_shuffle_Firstload\";s:2:\"no\";s:21:\"sfsi_shuffle_interval\";s:2:\"no\";s:25:\"sfsi_shuffle_intervalTime\";i:0;s:26:\"sfsi_specialIcon_animation\";s:0:\"\";s:26:\"sfsi_specialIcon_MouseOver\";s:2:\"no\";s:26:\"sfsi_specialIcon_Firstload\";s:2:\"no\";s:32:\"sfsi_specialIcon_Firstload_Icons\";s:3:\"all\";s:25:\"sfsi_specialIcon_interval\";s:2:\"no\";s:29:\"sfsi_specialIcon_intervalTime\";s:0:\"\";s:30:\"sfsi_specialIcon_intervalIcons\";s:3:\"all\";}\";', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1026, 'sfsi_section4_options', 's:1700:\"a:43:{s:19:\"sfsi_display_counts\";s:2:\"no\";s:24:\"sfsi_email_countsDisplay\";s:2:\"no\";s:21:\"sfsi_email_countsFrom\";s:6:\"source\";s:23:\"sfsi_email_manualCounts\";s:2:\"20\";s:22:\"sfsi_rss_countsDisplay\";s:2:\"no\";s:21:\"sfsi_rss_manualCounts\";s:2:\"20\";s:22:\"sfsi_facebook_PageLink\";s:0:\"\";s:27:\"sfsi_facebook_countsDisplay\";s:2:\"no\";s:24:\"sfsi_facebook_countsFrom\";s:6:\"manual\";s:26:\"sfsi_facebook_manualCounts\";s:2:\"20\";s:26:\"sfsi_twitter_countsDisplay\";s:2:\"no\";s:23:\"sfsi_twitter_countsFrom\";s:6:\"manual\";s:25:\"sfsi_twitter_manualCounts\";s:2:\"20\";s:19:\"sfsi_google_api_key\";s:0:\"\";s:25:\"sfsi_google_countsDisplay\";s:2:\"no\";s:22:\"sfsi_google_countsFrom\";s:6:\"manual\";s:24:\"sfsi_google_manualCounts\";s:2:\"20\";s:27:\"sfsi_linkedIn_countsDisplay\";s:2:\"no\";s:24:\"sfsi_linkedIn_countsFrom\";s:6:\"manual\";s:26:\"sfsi_linkedIn_manualCounts\";s:2:\"20\";s:10:\"ln_api_key\";s:0:\"\";s:13:\"ln_secret_key\";s:0:\"\";s:19:\"ln_oAuth_user_token\";s:0:\"\";s:10:\"ln_company\";s:0:\"\";s:24:\"sfsi_youtubeusernameorid\";s:4:\"name\";s:17:\"sfsi_youtube_user\";s:0:\"\";s:22:\"sfsi_youtube_channelId\";s:0:\"\";s:17:\"sfsi_ytube_chnlid\";s:0:\"\";s:26:\"sfsi_youtube_countsDisplay\";s:2:\"no\";s:23:\"sfsi_youtube_countsFrom\";s:6:\"manual\";s:25:\"sfsi_youtube_manualCounts\";s:2:\"20\";s:28:\"sfsi_pinterest_countsDisplay\";s:2:\"no\";s:25:\"sfsi_pinterest_countsFrom\";s:6:\"manual\";s:27:\"sfsi_pinterest_manualCounts\";s:2:\"20\";s:19:\"sfsi_pinterest_user\";s:0:\"\";s:20:\"sfsi_pinterest_board\";s:0:\"\";s:25:\"sfsi_instagram_countsFrom\";s:6:\"manual\";s:28:\"sfsi_instagram_countsDisplay\";s:2:\"no\";s:27:\"sfsi_instagram_manualCounts\";s:2:\"20\";s:19:\"sfsi_instagram_User\";s:0:\"\";s:23:\"sfsi_instagram_clientid\";s:0:\"\";s:21:\"sfsi_instagram_appurl\";s:0:\"\";s:20:\"sfsi_instagram_token\";s:0:\"\";}\";', 'yes'),
(1027, 'sfsi_section5_options', 's:1057:\"a:28:{s:15:\"sfsi_icons_size\";i:50;s:18:\"sfsi_icons_spacing\";i:5;s:20:\"sfsi_icons_Alignment\";s:4:\"left\";s:17:\"sfsi_icons_perRow\";i:5;s:24:\"sfsi_icons_ClickPageOpen\";s:3:\"yes\";s:26:\"sfsi_icons_suppress_errors\";s:2:\"no\";s:16:\"sfsi_icons_stick\";s:2:\"no\";s:22:\"sfsi_rss_MouseOverText\";s:0:\"\";s:24:\"sfsi_email_MouseOverText\";s:0:\"\";s:26:\"sfsi_twitter_MouseOverText\";s:0:\"\";s:27:\"sfsi_facebook_MouseOverText\";s:8:\"Facebook\";s:25:\"sfsi_google_MouseOverText\";s:0:\"\";s:27:\"sfsi_linkedIn_MouseOverText\";s:0:\"\";s:28:\"sfsi_pinterest_MouseOverText\";s:0:\"\";s:26:\"sfsi_youtube_MouseOverText\";s:7:\"YouTube\";s:28:\"sfsi_instagram_MouseOverText\";s:0:\"\";s:22:\"sfsi_CustomIcons_order\";s:0:\"\";s:18:\"sfsi_rssIcon_order\";i:1;s:20:\"sfsi_emailIcon_order\";i:2;s:23:\"sfsi_facebookIcon_order\";i:5;s:21:\"sfsi_googleIcon_order\";i:3;s:22:\"sfsi_twitterIcon_order\";i:4;s:22:\"sfsi_youtubeIcon_order\";i:6;s:24:\"sfsi_pinterestIcon_order\";i:7;s:24:\"sfsi_instagramIcon_order\";i:9;s:23:\"sfsi_linkedinIcon_order\";i:8;s:26:\"sfsi_custom_MouseOverTexts\";s:0:\"\";s:23:\"sfsi_custom_social_hide\";s:2:\"no\";}\";', 'yes'),
(1028, 'sfsi_section6_options', 's:523:\"a:14:{s:17:\"sfsi_show_Onposts\";s:2:\"no\";s:18:\"sfsi_show_Onbottom\";s:2:\"no\";s:22:\"sfsi_icons_postPositon\";s:6:\"source\";s:20:\"sfsi_icons_alignment\";s:12:\"center-right\";s:22:\"sfsi_rss_countsDisplay\";s:2:\"no\";s:20:\"sfsi_textBefor_icons\";s:26:\"Please follow and like us:\";s:24:\"sfsi_icons_DisplayCounts\";s:2:\"no\";s:12:\"sfsi_rectsub\";s:3:\"yes\";s:11:\"sfsi_rectfb\";s:3:\"yes\";s:11:\"sfsi_rectgp\";s:3:\"yes\";s:12:\"sfsi_rectshr\";s:2:\"no\";s:13:\"sfsi_recttwtr\";s:3:\"yes\";s:14:\"sfsi_rectpinit\";s:3:\"yes\";s:16:\"sfsi_rectfbshare\";s:3:\"yes\";}\";', 'yes'),
(1029, 'sfsi_section7_options', 's:666:\"a:15:{s:15:\"sfsi_show_popup\";s:2:\"no\";s:15:\"sfsi_popup_text\";s:42:\"Enjoy this blog? Please spread the word :)\";s:27:\"sfsi_popup_background_color\";s:7:\"#eff7f7\";s:23:\"sfsi_popup_border_color\";s:7:\"#f3faf2\";s:27:\"sfsi_popup_border_thickness\";s:1:\"1\";s:24:\"sfsi_popup_border_shadow\";s:3:\"yes\";s:15:\"sfsi_popup_font\";s:26:\"Helvetica,Arial,sans-serif\";s:19:\"sfsi_popup_fontSize\";s:2:\"30\";s:20:\"sfsi_popup_fontStyle\";s:6:\"normal\";s:20:\"sfsi_popup_fontColor\";s:7:\"#000000\";s:17:\"sfsi_Show_popupOn\";s:4:\"none\";s:25:\"sfsi_Show_popupOn_PageIDs\";s:0:\"\";s:14:\"sfsi_Shown_pop\";s:8:\"ETscroll\";s:24:\"sfsi_Shown_popupOnceTime\";s:0:\"\";s:32:\"sfsi_Shown_popuplimitPerUserTime\";s:0:\"\";}\";', 'yes'),
(1030, 'sfsi_section8_options', 's:1208:\"a:26:{s:20:\"sfsi_form_adjustment\";s:3:\"yes\";s:16:\"sfsi_form_height\";s:3:\"180\";s:15:\"sfsi_form_width\";s:3:\"230\";s:16:\"sfsi_form_border\";s:2:\"no\";s:26:\"sfsi_form_border_thickness\";s:1:\"1\";s:22:\"sfsi_form_border_color\";s:7:\"#b5b5b5\";s:20:\"sfsi_form_background\";s:7:\"#ffffff\";s:22:\"sfsi_form_heading_text\";s:22:\"Get new posts by email\";s:22:\"sfsi_form_heading_font\";s:26:\"Helvetica,Arial,sans-serif\";s:27:\"sfsi_form_heading_fontstyle\";s:4:\"bold\";s:27:\"sfsi_form_heading_fontcolor\";s:7:\"#000000\";s:26:\"sfsi_form_heading_fontsize\";s:2:\"16\";s:27:\"sfsi_form_heading_fontalign\";s:6:\"center\";s:20:\"sfsi_form_field_text\";s:9:\"Subscribe\";s:20:\"sfsi_form_field_font\";s:26:\"Helvetica,Arial,sans-serif\";s:25:\"sfsi_form_field_fontstyle\";s:6:\"normal\";s:25:\"sfsi_form_field_fontcolor\";s:7:\"#000000\";s:24:\"sfsi_form_field_fontsize\";s:2:\"14\";s:25:\"sfsi_form_field_fontalign\";s:6:\"center\";s:21:\"sfsi_form_button_text\";s:9:\"Subscribe\";s:21:\"sfsi_form_button_font\";s:26:\"Helvetica,Arial,sans-serif\";s:26:\"sfsi_form_button_fontstyle\";s:4:\"bold\";s:26:\"sfsi_form_button_fontcolor\";s:7:\"#000000\";s:25:\"sfsi_form_button_fontsize\";s:2:\"16\";s:26:\"sfsi_form_button_fontalign\";s:6:\"center\";s:27:\"sfsi_form_button_background\";s:7:\"#dedede\";}\";', 'yes'),
(1031, 'sfsi_section9_options', 's:409:\"a:10:{s:20:\"sfsi_show_via_widget\";s:3:\"yes\";s:16:\"sfsi_icons_float\";s:2:\"no\";s:24:\"sfsi_icons_floatPosition\";s:12:\"center-right\";s:26:\"sfsi_icons_floatMargin_top\";i:0;s:29:\"sfsi_icons_floatMargin_bottom\";i:0;s:27:\"sfsi_icons_floatMargin_left\";i:0;s:28:\"sfsi_icons_floatMargin_right\";i:0;s:23:\"sfsi_disable_floaticons\";s:2:\"no\";s:23:\"sfsi_show_via_shortcode\";s:2:\"no\";s:24:\"sfsi_show_via_afterposts\";s:2:\"no\";}\";', 'yes'),
(1032, 'sfsi_feed_id', 'QU55K2p0c3lLSkFWeVVaeTREeS9BakM4RW1yekxFNTNsekQ3Nm51VXFsamMyUThYQ3RVVTVQNStxeFkwRi9NQkFsMkp1T3pDTlBINkdjNlB3SHpYdG9iOXRJcWozRld6MjJmU1o4dis2KzVPOURiZ3ArSGtuUVlwZ3lEYlo1ZVZ8dVExTFR2b240M0F4QmVWRWdHeWtBSlFCV042OHRxTkthbXM5Nk5wYTN1QT0=', 'yes'),
(1033, 'sfsi_redirect_url', 'http://www.specificfeeds.com/widgets/emailSubscribeEncFeed/QU55K2p0c3lLSkFWeVVaeTREeS9BakM4RW1yekxFNTNsekQ3Nm51VXFsamMyUThYQ3RVVTVQNStxeFkwRi9NQkFsMkp1T3pDTlBINkdjNlB3SHpYdG9iOXRJcWozRld6MjJmU1o4dis2KzVPOURiZ3ArSGtuUVlwZ3lEYlo1ZVZ8dVExTFR2b240M0F4QmVWRWdHeWtBSlFCV042OHRxTkthbXM5Nk5wYTN1QT0=/OA==/', 'yes'),
(1034, 'sfsi_installDate', '2018-10-22 05:05:25', 'yes'),
(1035, 'sfsi_RatingDiv', 'no', 'yes'),
(1036, 'sfsi_footer_sec', 'no', 'yes'),
(1037, 'sfsi_activate', '0', 'yes'),
(1038, 'sfsi_instagram_sf_count', 's:93:\"a:3:{s:4:\"date\";i:1540166400;s:13:\"sfsi_sf_count\";s:0:\"\";s:20:\"sfsi_instagram_count\";s:0:\"\";}\";', 'yes'),
(1039, 'sfsi_error_reporting_notice_dismissed', '1', 'yes'),
(1040, 'widget_sfsi-widget', 'a:2:{i:2;a:2:{s:5:\"showf\";i:1;s:5:\"title\";s:12:\"Social media\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(1041, 'widget_subscriber_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(1042, 'sfsi_pluginVersion', '2.06', 'yes'),
(1043, 'sfsi_serverphpVersionnotification', 'yes', 'yes'),
(1044, 'show_premium_notification', 'no', 'yes'),
(1045, 'show_notification', 'yes', 'yes'),
(1046, 'show_mobile_notification', 'yes', 'yes'),
(1047, 'sfsi_languageNotice', 'yes', 'yes'),
(1048, 'sfsi_pplus_error_reporting_notice_dismissed', '1', 'yes'),
(1049, 'sfsi_addThis_icon_removal_notice_dismissed', '1', 'yes'),
(1050, 'sfsi_verificatiom_code', 'vwtmJnrvvZJ1LvA2WBDF', 'yes'),
(1053, '_site_transient_timeout_ure_caps_readable', '1540229814', 'no'),
(1054, '_site_transient_ure_caps_readable', '', 'no'),
(1055, '_site_transient_timeout_available_translations', '1540240607', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1056, '_site_transient_available_translations', 'a:113:{s:2:\"af\";a:8:{s:8:\"language\";s:2:\"af\";s:7:\"version\";s:5:\"4.9.4\";s:7:\"updated\";s:19:\"2018-02-06 13:56:09\";s:12:\"english_name\";s:9:\"Afrikaans\";s:11:\"native_name\";s:9:\"Afrikaans\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.4/af.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"af\";i:2;s:3:\"afr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Gaan voort\";}}s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-22 00:11:36\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:5:\"4.7.7\";s:7:\"updated\";s:19:\"2017-01-26 15:42:35\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.7/ary.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"as\";a:8:{s:8:\"language\";s:2:\"as\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-22 18:59:07\";s:12:\"english_name\";s:8:\"Assamese\";s:11:\"native_name\";s:21:\"অসমীয়া\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/as.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"as\";i:2;s:3:\"asm\";i:3;s:3:\"asm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:3:\"azb\";a:8:{s:8:\"language\";s:3:\"azb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-12 20:34:31\";s:12:\"english_name\";s:17:\"South Azerbaijani\";s:11:\"native_name\";s:29:\"گؤنئی آذربایجان\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:3;s:3:\"azb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-06 00:09:27\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:3:\"bel\";a:8:{s:8:\"language\";s:3:\"bel\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-04-04 08:43:29\";s:12:\"english_name\";s:10:\"Belarusian\";s:11:\"native_name\";s:29:\"Беларуская мова\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.5/bel.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"be\";i:2;s:3:\"bel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Працягнуць\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-13 19:50:59\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Напред\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:5:\"4.8.6\";s:7:\"updated\";s:19:\"2017-10-01 12:57:10\";s:12:\"english_name\";s:7:\"Bengali\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.6/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:23:\"এগিয়ে চল.\";}}s:2:\"bo\";a:8:{s:8:\"language\";s:2:\"bo\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-07-26 07:51:00\";s:12:\"english_name\";s:7:\"Tibetan\";s:11:\"native_name\";s:21:\"བོད་ཡིག\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/bo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bo\";i:2;s:3:\"tib\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"མུ་མཐུད།\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-04 20:20:28\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-05 13:08:41\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:3:\"ceb\";a:8:{s:8:\"language\";s:3:\"ceb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-02 17:25:51\";s:12:\"english_name\";s:7:\"Cebuano\";s:11:\"native_name\";s:7:\"Cebuano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"ceb\";i:3;s:3:\"ceb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Padayun\";}}s:5:\"cs_CZ\";a:8:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-08 18:04:52\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:9:\"Čeština\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/cs_CZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cs\";i:2;s:3:\"ces\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Pokračovat\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-19 08:22:12\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:5:\"4.9.7\";s:7:\"updated\";s:19:\"2018-07-06 08:46:24\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.7/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsæt\";}}s:14:\"de_CH_informal\";a:8:{s:8:\"language\";s:14:\"de_CH_informal\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-07-28 11:48:22\";s:12:\"english_name\";s:30:\"German (Switzerland, Informal)\";s:11:\"native_name\";s:21:\"Deutsch (Schweiz, Du)\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/translation/core/4.9.8/de_CH_informal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-07-28 11:47:36\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-15 10:39:52\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/4.9.8/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-15 10:41:04\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:3:\"dzo\";a:8:{s:8:\"language\";s:3:\"dzo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-06-29 08:59:03\";s:12:\"english_name\";s:8:\"Dzongkha\";s:11:\"native_name\";s:18:\"རྫོང་ཁ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"dz\";i:2;s:3:\"dzo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-08 10:19:50\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-19 05:41:30\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-18 22:06:02\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-19 05:39:09\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-18 22:06:08\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-04 13:34:08\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-08-01 16:09:29\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-08-03 20:43:09\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/es_AR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-09 15:16:30\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/es_CL.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-28 16:07:01\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/es_MX.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-18 11:45:31\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/es_ES.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_GT\";a:8:{s:8:\"language\";s:5:\"es_GT\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2017-11-15 15:03:42\";s:12:\"english_name\";s:19:\"Spanish (Guatemala)\";s:11:\"native_name\";s:21:\"Español de Guatemala\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.2/es_GT.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2017-11-15 23:17:08\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.2/es_CO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CR\";a:8:{s:8:\"language\";s:5:\"es_CR\";s:7:\"version\";s:5:\"4.8.3\";s:7:\"updated\";s:19:\"2017-10-01 17:54:52\";s:12:\"english_name\";s:20:\"Spanish (Costa Rica)\";s:11:\"native_name\";s:22:\"Español de Costa Rica\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.3/es_CR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-09 09:36:22\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/es_PE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-10 17:20:09\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/es_VE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2017-11-19 14:11:29\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.2/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2017-12-09 21:12:23\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.2/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-04 08:05:41\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-05 07:24:22\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-19 19:03:27\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-02 11:16:28\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-01-31 11:16:06\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:3:\"fur\";a:8:{s:8:\"language\";s:3:\"fur\";s:7:\"version\";s:5:\"4.8.6\";s:7:\"updated\";s:19:\"2018-01-29 17:32:35\";s:12:\"english_name\";s:8:\"Friulian\";s:11:\"native_name\";s:8:\"Friulian\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.6/fur.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"fur\";i:3;s:3:\"fur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-08-23 17:41:37\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-20 00:15:02\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"gu\";a:8:{s:8:\"language\";s:2:\"gu\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-14 12:33:48\";s:12:\"english_name\";s:8:\"Gujarati\";s:11:\"native_name\";s:21:\"ગુજરાતી\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/gu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gu\";i:2;s:3:\"guj\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:31:\"ચાલુ રાખવું\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:5:\"4.4.2\";s:7:\"updated\";s:19:\"2015-12-05 00:59:09\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4.2/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-04-15 08:49:46\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"המשך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:5:\"4.9.7\";s:7:\"updated\";s:19:\"2018-06-17 09:33:44\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.7/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"जारी\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-19 09:43:51\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-08-03 10:29:39\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Folytatás\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-03 16:21:10\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-07-28 13:16:13\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:6:\"4.7.11\";s:7:\"updated\";s:19:\"2018-09-20 11:13:37\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.7.11/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-08 11:53:09\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-19 06:05:40\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"続ける\";}}s:5:\"jv_ID\";a:8:{s:8:\"language\";s:5:\"jv_ID\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-24 13:53:29\";s:12:\"english_name\";s:8:\"Javanese\";s:11:\"native_name\";s:9:\"Basa Jawa\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/jv_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"jv\";i:2;s:3:\"jav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Nerusaké\";}}s:5:\"ka_GE\";a:8:{s:8:\"language\";s:5:\"ka_GE\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-24 04:57:34\";s:12:\"english_name\";s:8:\"Georgian\";s:11:\"native_name\";s:21:\"ქართული\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/ka_GE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ka\";i:2;s:3:\"kat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"გაგრძელება\";}}s:3:\"kab\";a:8:{s:8:\"language\";s:3:\"kab\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-21 14:15:57\";s:12:\"english_name\";s:6:\"Kabyle\";s:11:\"native_name\";s:9:\"Taqbaylit\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.8/kab.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"kab\";i:3;s:3:\"kab\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Kemmel\";}}s:2:\"kk\";a:8:{s:8:\"language\";s:2:\"kk\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-12 08:08:32\";s:12:\"english_name\";s:6:\"Kazakh\";s:11:\"native_name\";s:19:\"Қазақ тілі\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.5/kk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kk\";i:2;s:3:\"kaz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Жалғастыру\";}}s:2:\"km\";a:8:{s:8:\"language\";s:2:\"km\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-07 02:07:59\";s:12:\"english_name\";s:5:\"Khmer\";s:11:\"native_name\";s:27:\"ភាសាខ្មែរ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/km.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"km\";i:2;s:3:\"khm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"បន្ត\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-25 00:05:58\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:3:\"ckb\";a:8:{s:8:\"language\";s:3:\"ckb\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-05 16:42:45\";s:12:\"english_name\";s:16:\"Kurdish (Sorani)\";s:11:\"native_name\";s:13:\"كوردی‎\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.8/ckb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ku\";i:3;s:3:\"ckb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"به‌رده‌وام به‌\";}}s:2:\"lo\";a:8:{s:8:\"language\";s:2:\"lo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 09:59:23\";s:12:\"english_name\";s:3:\"Lao\";s:11:\"native_name\";s:21:\"ພາສາລາວ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lo\";i:2;s:3:\"lao\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"ຕໍ່​ໄປ\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:5:\"4.9.6\";s:7:\"updated\";s:19:\"2018-05-24 09:42:27\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.6/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:2:\"lv\";a:8:{s:8:\"language\";s:2:\"lv\";s:7:\"version\";s:5:\"4.7.7\";s:7:\"updated\";s:19:\"2017-03-17 20:40:40\";s:12:\"english_name\";s:7:\"Latvian\";s:11:\"native_name\";s:16:\"Latviešu valoda\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.7/lv.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lv\";i:2;s:3:\"lav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Turpināt\";}}s:5:\"mk_MK\";a:8:{s:8:\"language\";s:5:\"mk_MK\";s:7:\"version\";s:5:\"4.7.7\";s:7:\"updated\";s:19:\"2017-01-26 15:54:41\";s:12:\"english_name\";s:10:\"Macedonian\";s:11:\"native_name\";s:31:\"Македонски јазик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.7/mk_MK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mk\";i:2;s:3:\"mkd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Продолжи\";}}s:5:\"ml_IN\";a:8:{s:8:\"language\";s:5:\"ml_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:43:32\";s:12:\"english_name\";s:9:\"Malayalam\";s:11:\"native_name\";s:18:\"മലയാളം\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ml\";i:2;s:3:\"mal\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"തുടരുക\";}}s:2:\"mn\";a:8:{s:8:\"language\";s:2:\"mn\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-12 07:29:35\";s:12:\"english_name\";s:9:\"Mongolian\";s:11:\"native_name\";s:12:\"Монгол\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/mn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mn\";i:2;s:3:\"mon\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"Үргэлжлүүлэх\";}}s:2:\"mr\";a:8:{s:8:\"language\";s:2:\"mr\";s:7:\"version\";s:5:\"4.8.6\";s:7:\"updated\";s:19:\"2018-02-13 07:38:55\";s:12:\"english_name\";s:7:\"Marathi\";s:11:\"native_name\";s:15:\"मराठी\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.6/mr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mr\";i:2;s:3:\"mar\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"सुरु ठेवा\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-08-30 20:27:25\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:6:\"4.1.20\";s:7:\"updated\";s:19:\"2015-03-26 15:57:42\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.1.20/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ဆောင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-17 11:02:30\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"ne_NP\";a:8:{s:8:\"language\";s:5:\"ne_NP\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-27 10:30:26\";s:12:\"english_name\";s:6:\"Nepali\";s:11:\"native_name\";s:18:\"नेपाली\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/ne_NP.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ne\";i:2;s:3:\"nep\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:43:\"जारी राख्नुहोस्\";}}s:5:\"nl_BE\";a:8:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-18 11:11:49\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/nl_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-11 10:13:23\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:12:\"nl_NL_formal\";a:8:{s:8:\"language\";s:12:\"nl_NL_formal\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-11 10:11:08\";s:12:\"english_name\";s:14:\"Dutch (Formal)\";s:11:\"native_name\";s:20:\"Nederlands (Formeel)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/4.9.8/nl_NL_formal.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-18 11:10:50\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:5:\"4.8.3\";s:7:\"updated\";s:19:\"2017-08-25 10:03:08\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.3/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pa_IN\";a:8:{s:8:\"language\";s:5:\"pa_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-16 05:19:43\";s:12:\"english_name\";s:7:\"Punjabi\";s:11:\"native_name\";s:18:\"ਪੰਜਾਬੀ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pa\";i:2;s:3:\"pan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ਜਾਰੀ ਰੱਖੋ\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-18 05:15:17\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:6:\"4.1.20\";s:7:\"updated\";s:19:\"2015-03-29 22:19:48\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.1.20/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"دوام ورکړه\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-26 15:06:48\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-09 11:50:07\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:10:\"pt_PT_ao90\";a:8:{s:8:\"language\";s:10:\"pt_PT_ao90\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-09 09:30:48\";s:12:\"english_name\";s:27:\"Portuguese (Portugal, AO90)\";s:11:\"native_name\";s:17:\"Português (AO90)\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/translation/core/4.9.5/pt_PT_ao90.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"rhg\";a:8:{s:8:\"language\";s:3:\"rhg\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-16 13:03:18\";s:12:\"english_name\";s:8:\"Rohingya\";s:11:\"native_name\";s:8:\"Ruáinga\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"rhg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-09 06:33:48\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-30 20:13:53\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:3:\"sah\";a:8:{s:8:\"language\";s:3:\"sah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-21 02:06:41\";s:12:\"english_name\";s:5:\"Sakha\";s:11:\"native_name\";s:14:\"Сахалыы\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"sah\";i:3;s:3:\"sah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Салҕаа\";}}s:5:\"si_LK\";a:8:{s:8:\"language\";s:5:\"si_LK\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 06:00:52\";s:12:\"english_name\";s:7:\"Sinhala\";s:11:\"native_name\";s:15:\"සිංහල\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"si\";i:2;s:3:\"sin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:44:\"දිගටම කරගෙන යන්න\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-26 12:03:12\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2018-01-04 13:33:13\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.2/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Nadaljuj\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-19 07:46:08\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-08-02 20:59:54\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-18 08:13:44\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:3:\"szl\";a:8:{s:8:\"language\";s:3:\"szl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-24 19:58:14\";s:12:\"english_name\";s:8:\"Silesian\";s:11:\"native_name\";s:17:\"Ślōnskŏ gŏdka\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"szl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:13:\"Kōntynuować\";}}s:5:\"ta_IN\";a:8:{s:8:\"language\";s:5:\"ta_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:22:47\";s:12:\"english_name\";s:5:\"Tamil\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"தொடரவும்\";}}s:2:\"te\";a:8:{s:8:\"language\";s:2:\"te\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:47:39\";s:12:\"english_name\";s:6:\"Telugu\";s:11:\"native_name\";s:18:\"తెలుగు\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/te.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"te\";i:2;s:3:\"tel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"కొనసాగించు\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-02 17:08:41\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.5/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-30 02:38:08\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-08 19:05:26\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"tt_RU\";a:8:{s:8:\"language\";s:5:\"tt_RU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-20 20:20:50\";s:12:\"english_name\";s:5:\"Tatar\";s:11:\"native_name\";s:19:\"Татар теле\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tt\";i:2;s:3:\"tat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"дәвам итү\";}}s:3:\"tah\";a:8:{s:8:\"language\";s:3:\"tah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-06 18:39:39\";s:12:\"english_name\";s:8:\"Tahitian\";s:11:\"native_name\";s:10:\"Reo Tahiti\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ty\";i:2;s:3:\"tah\";i:3;s:3:\"tah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-04-12 12:31:53\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:16:\"ئۇيغۇرچە\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-18 07:42:01\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"ur\";a:8:{s:8:\"language\";s:2:\"ur\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-06 08:37:04\";s:12:\"english_name\";s:4:\"Urdu\";s:11:\"native_name\";s:8:\"اردو\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/ur.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ur\";i:2;s:3:\"urd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"جاری رکھیں\";}}s:5:\"uz_UZ\";a:8:{s:8:\"language\";s:5:\"uz_UZ\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-10-11 06:46:15\";s:12:\"english_name\";s:5:\"Uzbek\";s:11:\"native_name\";s:11:\"O‘zbekcha\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/uz_UZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uz\";i:2;s:3:\"uzb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Davom etish\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-19 13:50:55\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_HK\";a:8:{s:8:\"language\";s:5:\"zh_HK\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-04-09 00:56:52\";s:12:\"english_name\";s:19:\"Chinese (Hong Kong)\";s:11:\"native_name\";s:16:\"香港中文版	\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/zh_HK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:5:\"4.9.4\";s:7:\"updated\";s:19:\"2018-02-13 02:41:15\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.4/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2017-11-17 22:20:52\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.2/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}}', 'no'),
(1057, 'new_admin_email', 'julien.reichenbach@students.hevs.ch', 'yes'),
(1061, '_transient_doing_cron', '1540231523.2563860416412353515625', 'yes'),
(1063, '_site_transient_timeout_theme_roots', '1540232776', 'no'),
(1064, '_site_transient_theme_roots', 'a:4:{s:7:\"radiate\";s:7:\"/themes\";s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no'),
(1066, 'widget_sfwa_footer_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(1067, 'widget_sfwa_button_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(1068, 'widget_sfwa_social_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(1069, 'widget_sfwa_ads', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(1070, 'widget_sfwa_contact_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(1071, 'widget_sfwa_credential', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(1072, 'sfwa_layout_setting', 'a:39:{s:11:\"title-color\";s:0:\"\";s:10:\"text-color\";s:0:\"\";s:12:\"anchor-color\";s:0:\"\";s:18:\"hover-anchor-color\";s:0:\"\";s:17:\"full_width_footer\";s:9:\"contained\";s:12:\"footer-color\";s:0:\"\";s:17:\"footer_background\";s:0:\"\";s:24:\"credibility-footer-color\";s:0:\"\";s:17:\"credit_background\";s:0:\"\";s:19:\"footer-border-color\";s:0:\"\";s:24:\"credibility-border-color\";s:0:\"\";s:19:\"footer_border_style\";s:5:\"solid\";s:24:\"credibility_border_style\";s:5:\"solid\";s:20:\"footer-border-radius\";s:0:\"\";s:25:\"credibility-border-radius\";s:0:\"\";s:17:\"footer-margin-top\";s:0:\"\";s:19:\"footer-margin-right\";s:0:\"\";s:20:\"footer-margin-bottom\";s:0:\"\";s:18:\"footer-margin-left\";s:0:\"\";s:22:\"credibility-margin-top\";s:0:\"\";s:24:\"credibility-margin-right\";s:0:\"\";s:25:\"credibility-margin-bottom\";s:0:\"\";s:23:\"credibility-margin-left\";s:0:\"\";s:17:\"footer-border-top\";s:0:\"\";s:19:\"footer-border-right\";s:0:\"\";s:20:\"footer-border-bottom\";s:0:\"\";s:18:\"footer-border-left\";s:0:\"\";s:22:\"credibility-border-top\";s:0:\"\";s:24:\"credibility-border-right\";s:0:\"\";s:25:\"credibility-border-bottom\";s:0:\"\";s:23:\"credibility-border-left\";s:0:\"\";s:18:\"footer-padding-top\";s:0:\"\";s:20:\"footer-padding-right\";s:0:\"\";s:21:\"footer-padding-bottom\";s:0:\"\";s:19:\"footer-padding-left\";s:0:\"\";s:23:\"credibility-padding-top\";s:0:\"\";s:25:\"credibility-padding-right\";s:0:\"\";s:26:\"credibility-padding-bottom\";s:0:\"\";s:24:\"credibility-padding-left\";s:0:\"\";}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1074, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1540231536;s:8:\"response\";a:0:{}s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:19:\"the-events-calendar\";s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:8:\"4.6.24.1\";s:7:\"updated\";s:19:\"2018-10-21 17:12:55\";s:7:\"package\";s:89:\"https://downloads.wordpress.org/translation/plugin/the-events-calendar/4.6.24.1/de_DE.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:14:{s:25:\"adminimize/adminimize.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:24:\"w.org/plugins/adminimize\";s:4:\"slug\";s:10:\"adminimize\";s:6:\"plugin\";s:25:\"adminimize/adminimize.php\";s:11:\"new_version\";s:6:\"1.11.4\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/adminimize/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/adminimize.1.11.4.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:61:\"https://s.w.org/plugins/geopattern-icon/adminimize_000000.svg\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/adminimize/assets/banner-772x250.png?rev=1118207\";}s:11:\"banners_rtl\";a:0:{}}s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.8\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.8.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:35:\"author-category/author-category.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:29:\"w.org/plugins/author-category\";s:4:\"slug\";s:15:\"author-category\";s:6:\"plugin\";s:35:\"author-category/author-category.php\";s:11:\"new_version\";s:3:\"0.8\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/author-category/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/author-category.0.8.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:66:\"https://s.w.org/plugins/geopattern-icon/author-category_ffffff.svg\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:69:\"https://ps.w.org/author-category/assets/banner-772x250.jpg?rev=514823\";}s:11:\"banners_rtl\";a:0:{}}s:37:\"disable-comments/disable-comments.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:30:\"w.org/plugins/disable-comments\";s:4:\"slug\";s:16:\"disable-comments\";s:6:\"plugin\";s:37:\"disable-comments/disable-comments.php\";s:11:\"new_version\";s:5:\"1.8.0\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/disable-comments/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/disable-comments.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/disable-comments/assets/icon-256x256.png?rev=971176\";s:2:\"1x\";s:68:\"https://ps.w.org/disable-comments/assets/icon-128x128.png?rev=971176\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:72:\"https://ps.w.org/disable-comments/assets/banner-1544x500.png?rev=1652560\";s:2:\"1x\";s:71:\"https://ps.w.org/disable-comments/assets/banner-772x250.png?rev=1652560\";}s:11:\"banners_rtl\";a:0:{}}s:15:\"knews/knews.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:19:\"w.org/plugins/knews\";s:4:\"slug\";s:5:\"knews\";s:6:\"plugin\";s:15:\"knews/knews.php\";s:11:\"new_version\";s:5:\"1.8.7\";s:3:\"url\";s:36:\"https://wordpress.org/plugins/knews/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/knews.1.8.7.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:58:\"https://ps.w.org/knews/assets/icon-128x128.png?rev=1138977\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:60:\"https://ps.w.org/knews/assets/banner-772x250.jpg?rev=1265944\";}s:11:\"banners_rtl\";a:0:{}}s:69:\"pending-submission-notifications/pending-submission-notifications.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:46:\"w.org/plugins/pending-submission-notifications\";s:4:\"slug\";s:32:\"pending-submission-notifications\";s:6:\"plugin\";s:69:\"pending-submission-notifications/pending-submission-notifications.php\";s:11:\"new_version\";s:3:\"1.2\";s:3:\"url\";s:63:\"https://wordpress.org/plugins/pending-submission-notifications/\";s:7:\"package\";s:81:\"https://downloads.wordpress.org/plugin/pending-submission-notifications.1.2.1.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:83:\"https://s.w.org/plugins/geopattern-icon/pending-submission-notifications_909297.svg\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:87:\"https://ps.w.org/pending-submission-notifications/assets/banner-772x250.jpg?rev=1826247\";}s:11:\"banners_rtl\";a:0:{}}s:13:\"pods/init.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:18:\"w.org/plugins/pods\";s:4:\"slug\";s:4:\"pods\";s:6:\"plugin\";s:13:\"pods/init.php\";s:11:\"new_version\";s:5:\"2.7.9\";s:3:\"url\";s:35:\"https://wordpress.org/plugins/pods/\";s:7:\"package\";s:53:\"https://downloads.wordpress.org/plugin/pods.2.7.9.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:57:\"https://ps.w.org/pods/assets/icon-256x256.png?rev=1667333\";s:2:\"1x\";s:49:\"https://ps.w.org/pods/assets/icon.svg?rev=1667333\";s:3:\"svg\";s:49:\"https://ps.w.org/pods/assets/icon.svg?rev=1667333\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:59:\"https://ps.w.org/pods/assets/banner-772x250.png?rev=1667333\";}s:11:\"banners_rtl\";a:0:{}}s:21:\"polylang/polylang.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:22:\"w.org/plugins/polylang\";s:4:\"slug\";s:8:\"polylang\";s:6:\"plugin\";s:21:\"polylang/polylang.php\";s:11:\"new_version\";s:6:\"2.3.11\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/polylang/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/polylang.2.3.11.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:61:\"https://ps.w.org/polylang/assets/icon-256x256.png?rev=1331499\";s:2:\"1x\";s:61:\"https://ps.w.org/polylang/assets/icon-128x128.png?rev=1331499\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/polylang/assets/banner-1544x500.png?rev=1405299\";s:2:\"1x\";s:63:\"https://ps.w.org/polylang/assets/banner-772x250.png?rev=1405299\";}s:11:\"banners_rtl\";a:0:{}}s:59:\"ultimate-social-media-icons/ultimate_social_media_icons.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:41:\"w.org/plugins/ultimate-social-media-icons\";s:4:\"slug\";s:27:\"ultimate-social-media-icons\";s:6:\"plugin\";s:59:\"ultimate-social-media-icons/ultimate_social_media_icons.php\";s:11:\"new_version\";s:5:\"2.0.6\";s:3:\"url\";s:58:\"https://wordpress.org/plugins/ultimate-social-media-icons/\";s:7:\"package\";s:76:\"https://downloads.wordpress.org/plugin/ultimate-social-media-icons.2.0.6.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:80:\"https://ps.w.org/ultimate-social-media-icons/assets/icon-128x128.png?rev=1598977\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:82:\"https://ps.w.org/ultimate-social-media-icons/assets/banner-772x250.png?rev=1032920\";}s:11:\"banners_rtl\";a:0:{}}s:43:\"the-events-calendar/the-events-calendar.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:33:\"w.org/plugins/the-events-calendar\";s:4:\"slug\";s:19:\"the-events-calendar\";s:6:\"plugin\";s:43:\"the-events-calendar/the-events-calendar.php\";s:11:\"new_version\";s:6:\"4.6.25\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/the-events-calendar/\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/plugin/the-events-calendar.4.6.25.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:72:\"https://ps.w.org/the-events-calendar/assets/icon-256x256.png?rev=1679210\";s:2:\"1x\";s:72:\"https://ps.w.org/the-events-calendar/assets/icon-128x128.png?rev=1679210\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/the-events-calendar/assets/banner-1544x500.png?rev=1907269\";s:2:\"1x\";s:74:\"https://ps.w.org/the-events-calendar/assets/banner-772x250.png?rev=1907269\";}s:11:\"banners_rtl\";a:0:{}}s:37:\"user-role-editor/user-role-editor.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:30:\"w.org/plugins/user-role-editor\";s:4:\"slug\";s:16:\"user-role-editor\";s:6:\"plugin\";s:37:\"user-role-editor/user-role-editor.php\";s:11:\"new_version\";s:4:\"4.46\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/user-role-editor/\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/plugin/user-role-editor.4.46.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/user-role-editor/assets/icon-256x256.jpg?rev=1020390\";s:2:\"1x\";s:69:\"https://ps.w.org/user-role-editor/assets/icon-128x128.jpg?rev=1020390\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:71:\"https://ps.w.org/user-role-editor/assets/banner-772x250.png?rev=1263116\";}s:11:\"banners_rtl\";a:0:{}}s:47:\"user-specific-content/User-Specific-Content.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:35:\"w.org/plugins/user-specific-content\";s:4:\"slug\";s:21:\"user-specific-content\";s:6:\"plugin\";s:47:\"user-specific-content/User-Specific-Content.php\";s:11:\"new_version\";s:5:\"1.0.6\";s:3:\"url\";s:52:\"https://wordpress.org/plugins/user-specific-content/\";s:7:\"package\";s:70:\"https://downloads.wordpress.org/plugin/user-specific-content.1.0.6.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:72:\"https://s.w.org/plugins/geopattern-icon/user-specific-content_ffffff.svg\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:75:\"https://ps.w.org/user-specific-content/assets/banner-772x250.png?rev=606328\";}s:11:\"banners_rtl\";a:0:{}}s:24:\"wpforms-lite/wpforms.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:26:\"w.org/plugins/wpforms-lite\";s:4:\"slug\";s:12:\"wpforms-lite\";s:6:\"plugin\";s:24:\"wpforms-lite/wpforms.php\";s:11:\"new_version\";s:5:\"1.4.9\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/wpforms-lite/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/plugin/wpforms-lite.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/wpforms-lite/assets/icon-256x256.png?rev=1371112\";s:2:\"1x\";s:65:\"https://ps.w.org/wpforms-lite/assets/icon-128x128.png?rev=1371112\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/wpforms-lite/assets/banner-1544x500.png?rev=1371112\";s:2:\"1x\";s:67:\"https://ps.w.org/wpforms-lite/assets/banner-772x250.png?rev=1371112\";}s:11:\"banners_rtl\";a:0:{}}s:60:\"wp-support-plus-responsive-ticket-system/wp-support-plus.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:54:\"w.org/plugins/wp-support-plus-responsive-ticket-system\";s:4:\"slug\";s:40:\"wp-support-plus-responsive-ticket-system\";s:6:\"plugin\";s:60:\"wp-support-plus-responsive-ticket-system/wp-support-plus.php\";s:11:\"new_version\";s:5:\"9.1.1\";s:3:\"url\";s:71:\"https://wordpress.org/plugins/wp-support-plus-responsive-ticket-system/\";s:7:\"package\";s:83:\"https://downloads.wordpress.org/plugin/wp-support-plus-responsive-ticket-system.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:93:\"https://ps.w.org/wp-support-plus-responsive-ticket-system/assets/icon-128x128.png?rev=1811749\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:95:\"https://ps.w.org/wp-support-plus-responsive-ticket-system/assets/banner-772x250.png?rev=1826676\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Structure de la table `wp_podsrel`
--

CREATE TABLE `wp_podsrel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pod_id` int(10) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `related_pod_id` int(10) UNSIGNED DEFAULT NULL,
  `related_field_id` int(10) UNSIGNED DEFAULT NULL,
  `related_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `weight` smallint(5) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(3, 5, '_edit_last', '1'),
(4, 5, '_edit_lock', '1539090854:1'),
(41, 18, '_wp_attached_file', '2018/10/photo_2018-04-19_13-04-08-e1539271576637.jpg'),
(42, 18, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:678;s:6:\"height\";i:793;s:4:\"file\";s:52:\"2018/10/photo_2018-04-19_13-04-08-e1539271576637.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:52:\"photo_2018-04-19_13-04-08-e1539271576637-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:52:\"photo_2018-04-19_13-04-08-e1539271576637-256x300.jpg\";s:5:\"width\";i:256;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:38:\"photo_2018-04-19_13-04-08-576x1024.jpg\";s:5:\"width\";i:576;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"twentyseventeen-featured-image\";a:4:{s:4:\"file\";s:38:\"photo_2018-04-19_13-04-08-720x1200.jpg\";s:5:\"width\";i:720;s:6:\"height\";i:1200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:52:\"photo_2018-04-19_13-04-08-e1539271576637-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(43, 18, '_wp_attachment_backup_sizes', 'a:6:{s:9:\"full-orig\";a:3:{s:5:\"width\";i:720;s:6:\"height\";i:1280;s:4:\"file\";s:29:\"photo_2018-04-19_13-04-08.jpg\";}s:14:\"thumbnail-orig\";a:4:{s:4:\"file\";s:37:\"photo_2018-04-19_13-04-08-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"medium-orig\";a:4:{s:4:\"file\";s:37:\"photo_2018-04-19_13-04-08-169x300.jpg\";s:5:\"width\";i:169;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"large-orig\";a:4:{s:4:\"file\";s:38:\"photo_2018-04-19_13-04-08-576x1024.jpg\";s:5:\"width\";i:576;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:35:\"twentyseventeen-featured-image-orig\";a:4:{s:4:\"file\";s:38:\"photo_2018-04-19_13-04-08-720x1200.jpg\";s:5:\"width\";i:720;s:6:\"height\";i:1200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:37:\"twentyseventeen-thumbnail-avatar-orig\";a:4:{s:4:\"file\";s:37:\"photo_2018-04-19_13-04-08-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}'),
(59, 20, '_VenueOrigin', 'events-calendar'),
(60, 20, '_tribe_modified_fields', 'a:20:{s:12:\"_VenueOrigin\";d:1539278882;s:17:\"_EventShowMapLink\";d:1539278882;s:13:\"_EventShowMap\";d:1539278882;s:17:\"_VenueShowMapLink\";d:1539278882;s:13:\"_VenueShowMap\";d:1539278882;s:13:\"_VenueAddress\";d:1539278882;s:10:\"_VenueCity\";d:1539278882;s:13:\"_VenueCountry\";d:1539278882;s:14:\"_VenueProvince\";d:1539278882;s:11:\"_VenueState\";d:1539278882;s:9:\"_VenueZip\";d:1539278883;s:11:\"_VenuePhone\";d:1539278883;s:9:\"_VenueURL\";d:1539278883;s:18:\"_VenueEventShowMap\";d:1539278883;s:22:\"_VenueEventShowMapLink\";d:1539278883;s:19:\"_VenueStateProvince\";d:1539278883;s:21:\"_wp_trash_meta_status\";d:1539279130;s:19:\"_wp_trash_meta_time\";d:1539279130;s:21:\"_wp_desired_post_slug\";d:1539279130;s:11:\"post_status\";d:1539279131;}'),
(61, 20, '_EventShowMapLink', '1'),
(62, 20, '_EventShowMap', '1'),
(63, 20, '_VenueShowMapLink', '1'),
(64, 20, '_VenueShowMap', '1'),
(65, 20, '_VenueAddress', 'Chemin du Vieux-Canal 42'),
(66, 20, '_VenueCity', 'Sion'),
(67, 20, '_VenueCountry', 'Suisse'),
(68, 20, '_VenueProvince', 'valais'),
(69, 20, '_VenueState', ''),
(70, 20, '_VenueZip', '1950'),
(71, 20, '_VenuePhone', ''),
(72, 20, '_VenueURL', ''),
(73, 20, '_VenueEventShowMap', '1'),
(74, 20, '_VenueEventShowMapLink', '1'),
(75, 20, '_VenueStateProvince', 'valais'),
(77, 21, '_OrganizerOrigin', 'events-calendar'),
(78, 21, '_tribe_modified_fields', 'a:9:{s:16:\"_OrganizerOrigin\";d:1539278883;s:21:\"_OrganizerOrganizerID\";d:1539278883;s:15:\"_OrganizerPhone\";d:1539278883;s:17:\"_OrganizerWebsite\";d:1539278883;s:15:\"_OrganizerEmail\";d:1539278883;s:21:\"_wp_trash_meta_status\";d:1539279134;s:19:\"_wp_trash_meta_time\";d:1539279134;s:21:\"_wp_desired_post_slug\";d:1539279134;s:11:\"post_status\";d:1539279134;}'),
(79, 21, '_OrganizerOrganizerID', '0'),
(80, 21, '_OrganizerPhone', '0796584861'),
(81, 21, '_OrganizerWebsite', ''),
(82, 21, '_OrganizerEmail', ''),
(126, 20, '_edit_lock', '1539271783:1'),
(127, 20, '_wp_trash_meta_status', 'publish'),
(128, 20, '_wp_trash_meta_time', '1539271930'),
(129, 20, '_wp_desired_post_slug', 'hes-so'),
(130, 21, '_wp_trash_meta_status', 'publish'),
(131, 21, '_wp_trash_meta_time', '1539271934'),
(132, 21, '_wp_desired_post_slug', 'julien-reichenbach'),
(133, 31, '_EventOrigin', 'events-calendar'),
(134, 31, '_tribe_modified_fields', 'a:20:{s:12:\"_EventOrigin\";d:1539333695;s:10:\"_edit_last\";d:1539333704;s:10:\"post_title\";d:1539333704;s:11:\"post_status\";d:1539333943;s:12:\"post_content\";d:1539333943;s:17:\"_EventShowMapLink\";d:1539333943;s:13:\"_EventShowMap\";d:1539333943;s:13:\"_EventVenueID\";d:1539333944;s:17:\"_EventOrganizerID\";d:1539333945;s:15:\"_EventStartDate\";d:1539333945;s:13:\"_EventEndDate\";d:1539333945;s:18:\"_EventStartDateUTC\";d:1539333945;s:16:\"_EventEndDateUTC\";d:1539333945;s:14:\"_EventDuration\";d:1539333945;s:20:\"_EventCurrencySymbol\";d:1539333945;s:22:\"_EventCurrencyPosition\";d:1539333945;s:10:\"_EventCost\";d:1539333945;s:9:\"_EventURL\";d:1539333945;s:14:\"_EventTimezone\";d:1539333945;s:18:\"_EventTimezoneAbbr\";d:1539333945;}'),
(135, 31, '_edit_last', '1'),
(136, 31, '_edit_lock', '1539336364:1'),
(137, 32, '_EventShowMapLink', '1'),
(138, 32, '_EventShowMap', '1'),
(139, 32, '_EventStartDate', '2018-10-12 08:00:00'),
(140, 32, '_EventEndDate', '2018-10-12 17:00:00'),
(141, 32, '_EventStartDateUTC', '2018-10-12 06:00:00'),
(142, 32, '_EventEndDateUTC', '2018-10-12 15:00:00'),
(143, 32, '_EventDuration', '32400'),
(144, 32, '_EventCurrencySymbol', ''),
(145, 32, '_EventCurrencyPosition', 'prefix'),
(146, 32, '_EventCost', ''),
(147, 32, '_EventURL', ''),
(148, 32, '_EventTimezone', 'Europe/Paris'),
(149, 32, '_EventTimezoneAbbr', 'CEST'),
(150, 31, '_EventShowMapLink', '1'),
(151, 31, '_EventShowMap', '1'),
(152, 33, '_VenueOrigin', 'events-calendar'),
(153, 33, '_tribe_modified_fields', 'a:16:{s:12:\"_VenueOrigin\";d:1539333943;s:17:\"_EventShowMapLink\";d:1539333943;s:13:\"_EventShowMap\";d:1539333943;s:17:\"_VenueShowMapLink\";d:1539333943;s:13:\"_VenueShowMap\";d:1539333943;s:13:\"_VenueAddress\";d:1539333944;s:10:\"_VenueCity\";d:1539333944;s:13:\"_VenueCountry\";d:1539333944;s:14:\"_VenueProvince\";d:1539333944;s:11:\"_VenueState\";d:1539333944;s:9:\"_VenueZip\";d:1539333944;s:11:\"_VenuePhone\";d:1539333944;s:9:\"_VenueURL\";d:1539333944;s:18:\"_VenueEventShowMap\";d:1539333944;s:22:\"_VenueEventShowMapLink\";d:1539333944;s:19:\"_VenueStateProvince\";d:1539333944;}'),
(154, 33, '_EventShowMapLink', '1'),
(155, 33, '_EventShowMap', '1'),
(156, 33, '_VenueShowMapLink', '1'),
(157, 33, '_VenueShowMap', '1'),
(158, 33, '_VenueAddress', 'TestAddress'),
(159, 33, '_VenueCity', 'TestCity'),
(160, 33, '_VenueCountry', 'Afghanistan'),
(161, 33, '_VenueProvince', 'TestRegion'),
(162, 33, '_VenueState', ''),
(163, 33, '_VenueZip', '1950'),
(164, 33, '_VenuePhone', '000 000 00 00'),
(165, 33, '_VenueURL', 'testsite.ch'),
(166, 33, '_VenueEventShowMap', '1'),
(167, 33, '_VenueEventShowMapLink', '1'),
(168, 33, '_VenueStateProvince', 'TestRegion'),
(169, 31, '_EventVenueID', '33'),
(170, 34, '_OrganizerOrigin', 'events-calendar'),
(171, 34, '_tribe_modified_fields', 'a:5:{s:16:\"_OrganizerOrigin\";d:1539333944;s:21:\"_OrganizerOrganizerID\";d:1539333944;s:15:\"_OrganizerPhone\";d:1539333945;s:17:\"_OrganizerWebsite\";d:1539333945;s:15:\"_OrganizerEmail\";d:1539333945;}'),
(172, 34, '_OrganizerOrganizerID', '0'),
(173, 34, '_OrganizerPhone', '111 111 11 11'),
(174, 34, '_OrganizerWebsite', 'testorgaweb.ch'),
(175, 34, '_OrganizerEmail', 'testmail@mail.ch'),
(176, 31, '_EventOrganizerID', '34'),
(177, 31, '_EventStartDate', '2018-10-12 08:00:00'),
(178, 31, '_EventEndDate', '2018-10-12 17:00:00'),
(179, 31, '_EventStartDateUTC', '2018-10-12 06:00:00'),
(180, 31, '_EventEndDateUTC', '2018-10-12 15:00:00'),
(181, 31, '_EventDuration', '32400'),
(182, 31, '_EventCurrencySymbol', ''),
(183, 31, '_EventCurrencyPosition', 'prefix'),
(184, 31, '_EventCost', ''),
(185, 31, '_EventURL', ''),
(186, 31, '_EventTimezone', 'Europe/Paris'),
(187, 31, '_EventTimezoneAbbr', 'CEST'),
(194, 38, '_EventOrigin', 'events-calendar'),
(195, 38, '_tribe_modified_fields', 'a:21:{s:12:\"_EventOrigin\";d:1539351319;s:10:\"_edit_last\";d:1539351336;s:10:\"post_title\";d:1539351336;s:11:\"post_status\";d:1539351485;s:12:\"post_content\";d:1539351485;s:13:\"_thumbnail_id\";d:1539351485;s:17:\"_EventShowMapLink\";d:1539351486;s:13:\"_EventShowMap\";d:1539351782;s:13:\"_EventVenueID\";d:1539351487;s:17:\"_EventOrganizerID\";d:1539351783;s:15:\"_EventStartDate\";d:1539351488;s:13:\"_EventEndDate\";d:1539351488;s:18:\"_EventStartDateUTC\";d:1539351488;s:16:\"_EventEndDateUTC\";d:1539351488;s:14:\"_EventDuration\";d:1539351488;s:20:\"_EventCurrencySymbol\";d:1539351489;s:22:\"_EventCurrencyPosition\";d:1539351489;s:10:\"_EventCost\";d:1539351489;s:9:\"_EventURL\";d:1539351489;s:14:\"_EventTimezone\";d:1539351489;s:18:\"_EventTimezoneAbbr\";d:1539351489;}'),
(196, 38, '_edit_last', '1'),
(197, 38, '_edit_lock', '1539931465:1'),
(198, 33, '_edit_lock', '1539344360:1'),
(199, 34, '_edit_lock', '1539344094:1'),
(200, 38, '_thumbnail_id', '18'),
(201, 39, '_EventShowMapLink', '1'),
(202, 39, '_EventShowMap', '1'),
(203, 39, '_EventStartDate', '2018-10-13 08:00:00'),
(204, 39, '_EventEndDate', '2018-10-13 17:00:00'),
(205, 39, '_EventStartDateUTC', '2018-10-13 06:00:00'),
(206, 39, '_EventEndDateUTC', '2018-10-13 15:00:00'),
(207, 39, '_EventDuration', '32400'),
(208, 39, '_EventCurrencySymbol', ''),
(209, 39, '_EventCurrencyPosition', 'prefix'),
(210, 39, '_EventCost', ''),
(211, 39, '_EventURL', ''),
(212, 39, '_EventTimezone', 'Europe/Paris'),
(213, 39, '_EventTimezoneAbbr', 'CEST'),
(214, 38, '_EventShowMapLink', '1'),
(215, 38, '_EventShowMap', ''),
(216, 40, '_VenueOrigin', 'events-calendar'),
(217, 40, '_tribe_modified_fields', 'a:16:{s:12:\"_VenueOrigin\";d:1539351486;s:17:\"_EventShowMapLink\";d:1539351486;s:13:\"_EventShowMap\";d:1539351486;s:17:\"_VenueShowMapLink\";d:1539351486;s:13:\"_VenueShowMap\";d:1539351486;s:13:\"_VenueAddress\";d:1539351486;s:10:\"_VenueCity\";d:1539351486;s:13:\"_VenueCountry\";d:1539351486;s:14:\"_VenueProvince\";d:1539351487;s:11:\"_VenueState\";d:1539351487;s:9:\"_VenueZip\";d:1539351487;s:11:\"_VenuePhone\";d:1539351487;s:9:\"_VenueURL\";d:1539351487;s:18:\"_VenueEventShowMap\";d:1539351487;s:22:\"_VenueEventShowMapLink\";d:1539351487;s:19:\"_VenueStateProvince\";d:1539351487;}'),
(218, 40, '_EventShowMapLink', '1'),
(219, 40, '_EventShowMap', '1'),
(220, 40, '_VenueShowMapLink', '1'),
(221, 40, '_VenueShowMap', '1'),
(222, 40, '_VenueAddress', 'Chemin du Vieux Canal 42'),
(223, 40, '_VenueCity', 'Sion'),
(224, 40, '_VenueCountry', 'Suisse'),
(225, 40, '_VenueProvince', 'Valais'),
(226, 40, '_VenueState', ''),
(227, 40, '_VenueZip', '1950'),
(228, 40, '_VenuePhone', '079 568 58 61'),
(229, 40, '_VenueURL', 'www.google.ch'),
(230, 40, '_VenueEventShowMap', '1'),
(231, 40, '_VenueEventShowMapLink', '1'),
(232, 40, '_VenueStateProvince', 'Valais'),
(233, 38, '_EventVenueID', '40'),
(234, 41, '_OrganizerOrigin', 'events-calendar'),
(235, 41, '_tribe_modified_fields', 'a:5:{s:16:\"_OrganizerOrigin\";d:1539351488;s:21:\"_OrganizerOrganizerID\";d:1539351488;s:15:\"_OrganizerPhone\";d:1539351488;s:17:\"_OrganizerWebsite\";d:1539351488;s:15:\"_OrganizerEmail\";d:1539351488;}'),
(236, 41, '_OrganizerOrganizerID', ''),
(237, 41, '_OrganizerPhone', '000 000 00 00'),
(238, 41, '_OrganizerWebsite', '00.ch'),
(239, 41, '_OrganizerEmail', ''),
(241, 38, '_EventStartDate', '2018-10-13 08:00:00'),
(242, 38, '_EventEndDate', '2018-10-13 17:00:00'),
(243, 38, '_EventStartDateUTC', '2018-10-13 06:00:00'),
(244, 38, '_EventEndDateUTC', '2018-10-13 15:00:00'),
(245, 38, '_EventDuration', '32400'),
(246, 38, '_EventCurrencySymbol', ''),
(247, 38, '_EventCurrencyPosition', 'prefix'),
(248, 38, '_EventCost', ''),
(249, 38, '_EventURL', ''),
(250, 38, '_EventTimezone', 'Europe/Paris'),
(251, 38, '_EventTimezoneAbbr', 'CEST'),
(252, 42, '_EventOrigin', 'events-calendar'),
(253, 42, '_tribe_modified_fields', 'a:18:{s:12:\"_EventOrigin\";d:1539351672;s:10:\"_edit_last\";d:1539351677;s:10:\"post_title\";d:1539351677;s:11:\"post_status\";d:1539351681;s:12:\"post_content\";d:1539351681;s:17:\"_EventShowMapLink\";d:1539351682;s:13:\"_EventShowMap\";d:1539351682;s:15:\"_EventStartDate\";d:1539351682;s:13:\"_EventEndDate\";d:1539351682;s:18:\"_EventStartDateUTC\";d:1539351682;s:16:\"_EventEndDateUTC\";d:1539351682;s:14:\"_EventDuration\";d:1539351682;s:20:\"_EventCurrencySymbol\";d:1539351682;s:22:\"_EventCurrencyPosition\";d:1539351682;s:10:\"_EventCost\";d:1539351682;s:9:\"_EventURL\";d:1539351682;s:14:\"_EventTimezone\";d:1539351682;s:18:\"_EventTimezoneAbbr\";d:1539351682;}'),
(254, 42, '_edit_last', '1'),
(255, 42, '_edit_lock', '1539344374:1'),
(256, 43, '_EventShowMapLink', '1'),
(257, 43, '_EventShowMap', '1'),
(258, 43, '_EventStartDate', '2018-10-12 08:00:00'),
(259, 43, '_EventEndDate', '2018-10-12 17:00:00'),
(260, 43, '_EventStartDateUTC', '2018-10-12 06:00:00'),
(261, 43, '_EventEndDateUTC', '2018-10-12 15:00:00'),
(262, 43, '_EventDuration', '32400'),
(263, 43, '_EventCurrencySymbol', ''),
(264, 43, '_EventCurrencyPosition', 'prefix'),
(265, 43, '_EventCost', ''),
(266, 43, '_EventURL', ''),
(267, 43, '_EventTimezone', 'Europe/Paris'),
(268, 43, '_EventTimezoneAbbr', 'CEST'),
(269, 42, '_EventShowMapLink', '1'),
(270, 42, '_EventShowMap', '1'),
(271, 42, '_EventStartDate', '2018-10-12 08:00:00'),
(272, 42, '_EventEndDate', '2018-10-12 17:00:00'),
(273, 42, '_EventStartDateUTC', '2018-10-12 06:00:00'),
(274, 42, '_EventEndDateUTC', '2018-10-12 15:00:00'),
(275, 42, '_EventDuration', '32400'),
(276, 42, '_EventCurrencySymbol', ''),
(277, 42, '_EventCurrencyPosition', 'prefix'),
(278, 42, '_EventCost', ''),
(279, 42, '_EventURL', ''),
(280, 42, '_EventTimezone', 'Europe/Paris'),
(281, 42, '_EventTimezoneAbbr', 'CEST'),
(282, 44, '_OrganizerOrigin', 'events-calendar'),
(283, 44, '_tribe_modified_fields', 'a:5:{s:16:\"_OrganizerOrigin\";d:1539351782;s:21:\"_OrganizerOrganizerID\";d:1539351783;s:15:\"_OrganizerPhone\";d:1539351783;s:17:\"_OrganizerWebsite\";d:1539351783;s:15:\"_OrganizerEmail\";d:1539351783;}'),
(284, 44, '_OrganizerOrganizerID', ''),
(285, 44, '_OrganizerPhone', ''),
(286, 44, '_OrganizerWebsite', ''),
(287, 44, '_OrganizerEmail', ''),
(288, 38, '_EventOrganizerID', '44'),
(290, 47, '_EventOrigin', 'events-calendar'),
(291, 47, '_tribe_modified_fields', 'a:18:{s:12:\"_EventOrigin\";d:1539353107;s:10:\"_edit_last\";d:1539353169;s:10:\"post_title\";d:1539354054;s:12:\"post_content\";d:1539353825;s:11:\"post_status\";d:1539353825;s:17:\"_EventShowMapLink\";d:1539353825;s:13:\"_EventShowMap\";d:1539353825;s:15:\"_EventStartDate\";d:1539353825;s:13:\"_EventEndDate\";d:1539353825;s:18:\"_EventStartDateUTC\";d:1539353825;s:16:\"_EventEndDateUTC\";d:1539353825;s:14:\"_EventDuration\";d:1539353825;s:20:\"_EventCurrencySymbol\";d:1539353825;s:22:\"_EventCurrencyPosition\";d:1539353825;s:10:\"_EventCost\";d:1539353825;s:9:\"_EventURL\";d:1539353826;s:14:\"_EventTimezone\";d:1539353826;s:18:\"_EventTimezoneAbbr\";d:1539353826;}'),
(292, 47, '_edit_lock', '1539931450:1'),
(293, 47, '_edit_last', '1'),
(295, 49, '_EventShowMapLink', ''),
(296, 49, '_EventShowMap', ''),
(297, 49, '_EventStartDate', '2018-10-12 00:00:00'),
(298, 49, '_EventEndDate', '2018-10-12 00:00:00'),
(299, 49, '_EventStartDateUTC', '2018-10-11 22:00:00'),
(300, 49, '_EventEndDateUTC', '2018-10-11 22:00:00'),
(301, 49, '_EventDuration', '0'),
(302, 49, '_EventCurrencySymbol', ''),
(303, 49, '_EventCurrencyPosition', 'prefix'),
(304, 49, '_EventCost', ''),
(305, 49, '_EventURL', ''),
(306, 49, '_EventTimezone', 'Europe/Paris'),
(307, 49, '_EventTimezoneAbbr', 'CEST'),
(308, 47, '_EventShowMapLink', ''),
(309, 47, '_EventShowMap', ''),
(310, 47, '_EventStartDate', '2018-10-12 00:00:00'),
(311, 47, '_EventEndDate', '2018-10-12 00:00:00'),
(312, 47, '_EventStartDateUTC', '2018-10-11 22:00:00'),
(313, 47, '_EventEndDateUTC', '2018-10-11 22:00:00'),
(314, 47, '_EventDuration', '0'),
(315, 47, '_EventCurrencySymbol', ''),
(316, 47, '_EventCurrencyPosition', 'prefix'),
(317, 47, '_EventCost', ''),
(318, 47, '_EventURL', ''),
(319, 47, '_EventTimezone', 'Europe/Paris'),
(320, 47, '_EventTimezoneAbbr', 'CEST'),
(321, 50, '_EventShowMapLink', ''),
(322, 50, '_EventShowMap', ''),
(323, 50, '_EventStartDate', '2018-10-12 00:00:00'),
(324, 50, '_EventEndDate', '2018-10-12 00:00:00'),
(325, 50, '_EventStartDateUTC', '2018-10-11 22:00:00'),
(326, 50, '_EventEndDateUTC', '2018-10-11 22:00:00'),
(327, 50, '_EventDuration', '0'),
(328, 50, '_EventCurrencySymbol', ''),
(329, 50, '_EventCurrencyPosition', 'prefix'),
(330, 50, '_EventCost', ''),
(331, 50, '_EventURL', ''),
(332, 50, '_EventTimezone', 'Europe/Paris'),
(333, 50, '_EventTimezoneAbbr', 'CEST'),
(335, 53, '_edit_lock', '1539959954:1'),
(338, 58, '_edit_lock', '1539941528:1'),
(339, 58, '_edit_last', '1'),
(341, 58, '_knews_automated', '0'),
(342, 58, 'U_S_C_message', ''),
(343, 60, '_edit_lock', '1539941784:1'),
(344, 63, '_edit_last', '5'),
(345, 63, '_knews_automated', '0'),
(346, 63, '_edit_lock', '1539955352:5'),
(347, 65, '_EventOrigin', 'events-calendar'),
(348, 65, '_tribe_modified_fields', 'a:18:{s:12:\"_EventOrigin\";d:1539962696;s:10:\"_edit_last\";d:1540213212;s:10:\"post_title\";d:1539962705;s:11:\"post_status\";d:1540213214;s:17:\"_EventShowMapLink\";d:1539962705;s:13:\"_EventShowMap\";d:1539962705;s:15:\"_EventStartDate\";d:1539962705;s:13:\"_EventEndDate\";d:1539962705;s:18:\"_EventStartDateUTC\";d:1539962705;s:16:\"_EventEndDateUTC\";d:1539962705;s:14:\"_EventDuration\";d:1539962705;s:20:\"_EventCurrencySymbol\";d:1539962705;s:22:\"_EventCurrencyPosition\";d:1539962706;s:10:\"_EventCost\";d:1539962706;s:9:\"_EventURL\";d:1539962706;s:14:\"_EventTimezone\";d:1539962706;s:18:\"_EventTimezoneAbbr\";d:1539962706;s:12:\"_wp_old_date\";d:1540213214;}'),
(349, 65, '_edit_last', '1'),
(350, 66, '_EventShowMapLink', '1'),
(351, 66, '_EventShowMap', '1'),
(352, 66, '_EventStartDate', '2018-10-19 08:00:00'),
(353, 66, '_EventEndDate', '2018-10-19 17:00:00'),
(354, 66, '_EventStartDateUTC', '2018-10-19 06:00:00'),
(355, 66, '_EventEndDateUTC', '2018-10-19 15:00:00'),
(356, 66, '_EventDuration', '32400'),
(357, 66, '_EventCurrencySymbol', ''),
(358, 66, '_EventCurrencyPosition', 'prefix'),
(359, 66, '_EventCost', ''),
(360, 66, '_EventURL', ''),
(361, 66, '_EventTimezone', 'Europe/Paris'),
(362, 66, '_EventTimezoneAbbr', 'CEST'),
(363, 65, '_EventShowMapLink', '1'),
(364, 65, '_EventShowMap', '1'),
(365, 65, '_EventStartDate', '2018-10-19 08:00:00'),
(366, 65, '_EventEndDate', '2018-10-19 17:00:00'),
(367, 65, '_EventStartDateUTC', '2018-10-19 06:00:00'),
(368, 65, '_EventEndDateUTC', '2018-10-19 15:00:00'),
(369, 65, '_EventDuration', '32400'),
(370, 65, '_EventCurrencySymbol', ''),
(371, 65, '_EventCurrencyPosition', 'prefix'),
(372, 65, '_EventCost', ''),
(373, 65, '_EventURL', ''),
(374, 65, '_EventTimezone', 'Europe/Paris'),
(375, 65, '_EventTimezoneAbbr', 'CEST'),
(376, 65, '_edit_lock', '1540205879:1'),
(388, 70, '_pll_strings_translations', 'a:0:{}'),
(389, 71, '_pll_strings_translations', 'a:0:{}'),
(390, 72, '_menu_item_type', 'custom'),
(391, 72, '_menu_item_menu_item_parent', '0'),
(392, 72, '_menu_item_object_id', '72'),
(393, 72, '_menu_item_object', 'custom'),
(394, 72, '_menu_item_target', ''),
(395, 72, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(396, 72, '_menu_item_xfn', ''),
(397, 72, '_menu_item_url', '#pll_switcher'),
(398, 72, '_menu_item_orphaned', '1539956269'),
(411, 76, '_edit_lock', '1539957599:1'),
(412, 76, '_edit_last', '1'),
(413, 77, '_wp_attached_file', '2018/10/carte_valais.gif'),
(414, 77, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:382;s:6:\"height\";i:259;s:4:\"file\";s:24:\"2018/10/carte_valais.gif\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"carte_valais-150x150.gif\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/gif\";}s:6:\"medium\";a:4:{s:4:\"file\";s:24:\"carte_valais-300x203.gif\";s:5:\"width\";i:300;s:6:\"height\";i:203;s:9:\"mime-type\";s:9:\"image/gif\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:24:\"carte_valais-100x100.gif\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/gif\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(415, 78, '_wp_attached_file', '2018/10/organigrammeFSCV.png'),
(416, 78, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:705;s:6:\"height\";i:545;s:4:\"file\";s:28:\"2018/10/organigrammeFSCV.png\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"organigrammeFSCV-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:28:\"organigrammeFSCV-300x232.png\";s:5:\"width\";i:300;s:6:\"height\";i:232;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:28:\"organigrammeFSCV-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(417, 79, '_wp_attached_file', '2018/10/statuts_FSCV_mars_2014_final.pdf'),
(418, 76, 'U_S_C_message', ''),
(419, 81, 'U_S_C_message', ''),
(420, 81, '_edit_lock', '1539957642:1'),
(421, 81, '_edit_last', '1'),
(422, 82, '_wp_attached_file', '2018/10/carte_valais-1.gif'),
(423, 82, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:382;s:6:\"height\";i:259;s:4:\"file\";s:26:\"2018/10/carte_valais-1.gif\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:26:\"carte_valais-1-150x150.gif\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/gif\";}s:6:\"medium\";a:4:{s:4:\"file\";s:26:\"carte_valais-1-300x203.gif\";s:5:\"width\";i:300;s:6:\"height\";i:203;s:9:\"mime-type\";s:9:\"image/gif\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:26:\"carte_valais-1-100x100.gif\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/gif\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(424, 83, '_wp_attached_file', '2018/10/organigrammeFSCV-1.png'),
(425, 83, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:705;s:6:\"height\";i:545;s:4:\"file\";s:30:\"2018/10/organigrammeFSCV-1.png\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"organigrammeFSCV-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"organigrammeFSCV-1-300x232.png\";s:5:\"width\";i:300;s:6:\"height\";i:232;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:30:\"organigrammeFSCV-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(426, 84, '_wp_attached_file', '2018/10/statuts_FSCV_mars_2014_final-1.pdf'),
(427, 87, '_edit_lock', '1540205013:1'),
(428, 87, '_edit_last', '1'),
(429, 87, 'U_S_C_message', ''),
(430, 89, '_edit_lock', '1540205032:1'),
(431, 89, '_edit_last', '1'),
(432, 89, 'U_S_C_message', ''),
(433, 91, '_edit_lock', '1540205107:1'),
(434, 91, '_edit_last', '1'),
(435, 91, 'U_S_C_message', ''),
(436, 93, '_edit_lock', '1540205148:1'),
(437, 93, '_edit_last', '1'),
(438, 93, 'U_S_C_message', ''),
(439, 95, '_menu_item_type', 'post_type'),
(440, 95, '_menu_item_menu_item_parent', '100'),
(441, 95, '_menu_item_object_id', '93'),
(442, 95, '_menu_item_object', 'page'),
(443, 95, '_menu_item_target', ''),
(444, 95, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(445, 95, '_menu_item_xfn', ''),
(446, 95, '_menu_item_url', ''),
(448, 96, '_menu_item_type', 'post_type'),
(449, 96, '_menu_item_menu_item_parent', '100'),
(450, 96, '_menu_item_object_id', '91'),
(451, 96, '_menu_item_object', 'page'),
(452, 96, '_menu_item_target', ''),
(453, 96, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(454, 96, '_menu_item_xfn', ''),
(455, 96, '_menu_item_url', ''),
(457, 97, '_menu_item_type', 'post_type'),
(458, 97, '_menu_item_menu_item_parent', '100'),
(459, 97, '_menu_item_object_id', '89'),
(460, 97, '_menu_item_object', 'page'),
(461, 97, '_menu_item_target', ''),
(462, 97, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(463, 97, '_menu_item_xfn', ''),
(464, 97, '_menu_item_url', ''),
(466, 98, '_menu_item_type', 'post_type'),
(467, 98, '_menu_item_menu_item_parent', '100'),
(468, 98, '_menu_item_object_id', '87'),
(469, 98, '_menu_item_object', 'page'),
(470, 98, '_menu_item_target', ''),
(471, 98, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(472, 98, '_menu_item_xfn', ''),
(473, 98, '_menu_item_url', ''),
(484, 100, '_menu_item_type', 'post_type'),
(485, 100, '_menu_item_menu_item_parent', '0'),
(486, 100, '_menu_item_object_id', '76'),
(487, 100, '_menu_item_object', 'page'),
(488, 100, '_menu_item_target', ''),
(489, 100, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(490, 100, '_menu_item_xfn', ''),
(491, 100, '_menu_item_url', ''),
(493, 101, '_menu_item_type', 'post_type'),
(494, 101, '_menu_item_menu_item_parent', '0'),
(495, 101, '_menu_item_object_id', '53'),
(496, 101, '_menu_item_object', 'page'),
(497, 101, '_menu_item_target', ''),
(498, 101, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(499, 101, '_menu_item_xfn', ''),
(500, 101, '_menu_item_url', ''),
(502, 102, '_menu_item_type', 'post_type'),
(503, 102, '_menu_item_menu_item_parent', '0'),
(504, 102, '_menu_item_object_id', '81'),
(505, 102, '_menu_item_object', 'page'),
(506, 102, '_menu_item_target', ''),
(507, 102, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(508, 102, '_menu_item_xfn', ''),
(509, 102, '_menu_item_url', ''),
(511, 103, '_edit_lock', '1539958886:1'),
(512, 103, '_edit_last', '1'),
(513, 103, 'U_S_C_message', ''),
(514, 105, 'U_S_C_message', ''),
(515, 105, '_edit_lock', '1539958141:1'),
(516, 105, '_edit_last', '1'),
(517, 107, '_EventOrigin', 'events-calendar'),
(518, 107, '_tribe_modified_fields', 'a:1:{s:12:\"_EventOrigin\";d:1539965554;}'),
(519, 108, '_EventOrigin', 'events-calendar'),
(520, 108, '_tribe_modified_fields', 'a:1:{s:12:\"_EventOrigin\";d:1539965610;}'),
(521, 108, '_edit_lock', '1539958441:1'),
(522, 109, 'U_S_C_message', ''),
(523, 109, '_edit_lock', '1539958375:1'),
(524, 109, '_edit_last', '1'),
(525, 111, 'U_S_C_message', ''),
(526, 111, '_edit_lock', '1539958592:1'),
(527, 111, '_edit_last', '1'),
(528, 113, 'U_S_C_message', ''),
(529, 113, '_edit_lock', '1540205067:1'),
(530, 113, '_edit_last', '1'),
(531, 115, 'U_S_C_message', ''),
(532, 115, '_edit_lock', '1540205123:1'),
(533, 115, '_edit_last', '1'),
(543, 118, '_menu_item_type', 'post_type'),
(544, 118, '_menu_item_menu_item_parent', '102'),
(545, 118, '_menu_item_object_id', '115'),
(546, 118, '_menu_item_object', 'page'),
(547, 118, '_menu_item_target', ''),
(548, 118, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(549, 118, '_menu_item_xfn', ''),
(550, 118, '_menu_item_url', ''),
(552, 119, '_menu_item_type', 'post_type'),
(553, 119, '_menu_item_menu_item_parent', '102'),
(554, 119, '_menu_item_object_id', '113'),
(555, 119, '_menu_item_object', 'page'),
(556, 119, '_menu_item_target', ''),
(557, 119, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(558, 119, '_menu_item_xfn', ''),
(559, 119, '_menu_item_url', ''),
(561, 120, '_menu_item_type', 'post_type'),
(562, 120, '_menu_item_menu_item_parent', '102'),
(563, 120, '_menu_item_object_id', '111'),
(564, 120, '_menu_item_object', 'page'),
(565, 120, '_menu_item_target', ''),
(566, 120, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(567, 120, '_menu_item_xfn', ''),
(568, 120, '_menu_item_url', ''),
(570, 121, '_menu_item_type', 'post_type'),
(571, 121, '_menu_item_menu_item_parent', '102'),
(572, 121, '_menu_item_object_id', '109'),
(573, 121, '_menu_item_object', 'page'),
(574, 121, '_menu_item_target', ''),
(575, 121, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(576, 121, '_menu_item_xfn', ''),
(577, 121, '_menu_item_url', ''),
(579, 122, '_menu_item_type', 'post_type'),
(580, 122, '_menu_item_menu_item_parent', '0'),
(581, 122, '_menu_item_object_id', '105'),
(582, 122, '_menu_item_object', 'page'),
(583, 122, '_menu_item_target', ''),
(584, 122, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(585, 122, '_menu_item_xfn', ''),
(586, 122, '_menu_item_url', ''),
(587, 122, '_menu_item_orphaned', '1539958721'),
(589, 123, '_menu_item_type', 'custom'),
(590, 123, '_menu_item_menu_item_parent', '0'),
(591, 123, '_menu_item_object_id', '123'),
(592, 123, '_menu_item_object', 'custom'),
(593, 123, '_menu_item_target', ''),
(594, 123, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(595, 123, '_menu_item_xfn', ''),
(596, 123, '_menu_item_url', '#pll_switcher'),
(597, 123, '_menu_item_orphaned', '1539958816'),
(598, 125, '_wp_trash_meta_status', 'publish'),
(599, 125, '_wp_trash_meta_time', '1539958968'),
(600, 126, '_wp_trash_meta_status', 'publish'),
(601, 126, '_wp_trash_meta_time', '1539959099'),
(602, 53, '_edit_last', '1'),
(603, 53, 'U_S_C_message', ''),
(604, 128, 'U_S_C_message', ''),
(605, 128, '_edit_lock', '1539959970:1'),
(606, 128, '_edit_last', '1'),
(607, 131, '_menu_item_type', 'post_type'),
(608, 131, '_menu_item_menu_item_parent', '0'),
(609, 131, '_menu_item_object_id', '128'),
(610, 131, '_menu_item_object', 'page'),
(611, 131, '_menu_item_target', ''),
(612, 131, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(613, 131, '_menu_item_xfn', ''),
(614, 131, '_menu_item_url', ''),
(616, 132, '_menu_item_type', 'post_type'),
(617, 132, '_menu_item_menu_item_parent', '0'),
(618, 132, '_menu_item_object_id', '53'),
(619, 132, '_menu_item_object', 'page'),
(620, 132, '_menu_item_target', ''),
(621, 132, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(622, 132, '_menu_item_xfn', ''),
(623, 132, '_menu_item_url', ''),
(624, 132, '_menu_item_orphaned', '1539960141'),
(645, 135, '_wp_trash_meta_status', 'publish'),
(646, 135, '_wp_trash_meta_time', '1539962539'),
(647, 136, '_wp_trash_meta_status', 'publish'),
(648, 136, '_wp_trash_meta_time', '1539962553'),
(649, 137, '_edit_lock', '1540205075:1'),
(650, 137, '_edit_last', '1'),
(651, 137, 'U_S_C_message', ''),
(652, 139, 'U_S_C_message', ''),
(653, 139, '_edit_lock', '1540203756:1'),
(654, 139, '_edit_last', '1'),
(655, 141, '_menu_item_type', 'post_type'),
(656, 141, '_menu_item_menu_item_parent', '217'),
(657, 141, '_menu_item_object_id', '137'),
(658, 141, '_menu_item_object', 'page'),
(659, 141, '_menu_item_target', ''),
(660, 141, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(661, 141, '_menu_item_xfn', ''),
(662, 141, '_menu_item_url', ''),
(664, 142, '_edit_lock', '1540203835:1'),
(665, 142, '_edit_last', '1'),
(666, 142, 'U_S_C_message', ''),
(667, 144, 'U_S_C_message', ''),
(668, 144, '_edit_lock', '1540205471:1'),
(669, 144, '_edit_last', '1'),
(670, 146, '_edit_lock', '1540205696:1'),
(671, 146, '_edit_last', '1'),
(672, 146, 'U_S_C_options', 'a:1:{s:6:\"logged\";s:1:\"1\";}'),
(673, 146, 'U_S_C_roles', 'a:4:{i:0;s:13:\"Administrator\";i:1;s:11:\"ChoeurAdmin\";i:2;s:9:\"FSCVAdmin\";i:3;s:11:\"GroupsAdmin\";}'),
(674, 146, 'U_S_C_message', 'Vous n\'êtes pas autorisé à modifier un choeur. Veuillez vous connecter.'),
(675, 148, 'U_S_C_options', 'a:1:{s:6:\"logged\";s:1:\"1\";}'),
(676, 148, 'U_S_C_roles', 'a:4:{i:0;s:13:\"Administrator\";i:1;s:11:\"ChoeurAdmin\";i:2;s:9:\"FSCVAdmin\";i:3;s:11:\"GroupsAdmin\";}'),
(677, 148, 'U_S_C_message', 'Sie dürfen keinen Chor bearbeiten. Bitte einloggen'),
(678, 148, '_edit_lock', '1540205002:1'),
(679, 148, '_edit_last', '1'),
(680, 150, '_edit_lock', '1540204172:1'),
(681, 151, '_menu_item_type', 'custom'),
(682, 151, '_menu_item_menu_item_parent', '0'),
(683, 151, '_menu_item_object_id', '151'),
(684, 151, '_menu_item_object', 'custom'),
(685, 151, '_menu_item_target', ''),
(686, 151, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(687, 151, '_menu_item_xfn', ''),
(688, 151, '_menu_item_url', ''),
(690, 152, '_edit_lock', '1540204993:1'),
(691, 152, '_edit_last', '1'),
(692, 152, 'U_S_C_message', ''),
(693, 156, '_edit_lock', '1540204278:1'),
(694, 156, '_edit_last', '1'),
(695, 156, 'U_S_C_message', ''),
(696, 158, '_edit_lock', '1540204435:1'),
(697, 158, '_edit_last', '1'),
(698, 158, 'U_S_C_message', ''),
(699, 160, 'U_S_C_message', ''),
(700, 161, 'U_S_C_message', ''),
(701, 161, '_edit_lock', '1540204966:1'),
(702, 161, '_edit_last', '1'),
(703, 163, '_edit_lock', '1540204489:1'),
(704, 163, '_edit_last', '1'),
(705, 163, 'U_S_C_message', ''),
(706, 165, 'U_S_C_message', ''),
(707, 165, '_edit_lock', '1540204515:1'),
(708, 165, '_edit_last', '1'),
(709, 167, '_edit_lock', '1540205054:1'),
(710, 167, '_edit_last', '1'),
(711, 167, 'U_S_C_message', ''),
(712, 169, 'U_S_C_message', ''),
(713, 169, '_edit_lock', '1540204704:1'),
(714, 170, '_edit_lock', '1540204608:1'),
(715, 170, '_edit_last', '1'),
(716, 170, 'U_S_C_message', ''),
(717, 172, '_edit_lock', '1540204645:1'),
(718, 172, '_edit_last', '1'),
(719, 172, 'U_S_C_message', ''),
(720, 174, '_edit_lock', '1540204820:1'),
(721, 175, 'U_S_C_message', ''),
(722, 175, '_edit_lock', '1540204762:1'),
(723, 175, '_edit_last', '1'),
(724, 177, '_edit_lock', '1540205086:1'),
(725, 177, '_edit_last', '1'),
(726, 177, 'U_S_C_message', ''),
(727, 179, '_edit_lock', '1540204810:1'),
(728, 179, '_edit_last', '1'),
(729, 179, 'U_S_C_message', ''),
(730, 181, '_edit_lock', '1540205133:1'),
(731, 181, '_edit_last', '1'),
(732, 181, 'U_S_C_message', ''),
(733, 183, '_edit_lock', '1540204877:1'),
(734, 183, '_edit_last', '1'),
(735, 183, 'U_S_C_message', ''),
(736, 185, '_edit_lock', '1540204894:1'),
(737, 185, '_edit_last', '1'),
(738, 185, 'U_S_C_message', ''),
(739, 187, '_edit_lock', '1540204917:1'),
(740, 187, '_edit_last', '1'),
(741, 187, 'U_S_C_message', ''),
(742, 190, '_menu_item_type', 'post_type'),
(743, 190, '_menu_item_menu_item_parent', '0'),
(744, 190, '_menu_item_object_id', '142'),
(745, 190, '_menu_item_object', 'page'),
(746, 190, '_menu_item_target', ''),
(747, 190, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(748, 190, '_menu_item_xfn', ''),
(749, 190, '_menu_item_url', ''),
(751, 191, '_menu_item_type', 'post_type'),
(752, 191, '_menu_item_menu_item_parent', '151'),
(753, 191, '_menu_item_object_id', '152'),
(754, 191, '_menu_item_object', 'page'),
(755, 191, '_menu_item_target', ''),
(756, 191, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(757, 191, '_menu_item_xfn', ''),
(758, 191, '_menu_item_url', ''),
(760, 192, '_menu_item_type', 'custom'),
(761, 192, '_menu_item_menu_item_parent', '0'),
(762, 192, '_menu_item_object_id', '192'),
(763, 192, '_menu_item_object', 'custom'),
(764, 192, '_menu_item_target', ''),
(765, 192, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(766, 192, '_menu_item_xfn', ''),
(767, 192, '_menu_item_url', ''),
(769, 193, '_menu_item_type', 'post_type'),
(770, 193, '_menu_item_menu_item_parent', '192'),
(771, 193, '_menu_item_object_id', '167'),
(772, 193, '_menu_item_object', 'page'),
(773, 193, '_menu_item_target', ''),
(774, 193, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(775, 193, '_menu_item_xfn', ''),
(776, 193, '_menu_item_url', ''),
(778, 194, '_menu_item_type', 'post_type'),
(779, 194, '_menu_item_menu_item_parent', '192'),
(780, 194, '_menu_item_object_id', '158'),
(781, 194, '_menu_item_object', 'page'),
(782, 194, '_menu_item_target', ''),
(783, 194, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(784, 194, '_menu_item_xfn', ''),
(785, 194, '_menu_item_url', ''),
(787, 195, '_menu_item_type', 'post_type'),
(788, 195, '_menu_item_menu_item_parent', '192'),
(789, 195, '_menu_item_object_id', '163'),
(790, 195, '_menu_item_object', 'page'),
(791, 195, '_menu_item_target', ''),
(792, 195, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(793, 195, '_menu_item_xfn', ''),
(794, 195, '_menu_item_url', ''),
(796, 196, '_menu_item_type', 'custom'),
(797, 196, '_menu_item_menu_item_parent', '0'),
(798, 196, '_menu_item_object_id', '196'),
(799, 196, '_menu_item_object', 'custom'),
(800, 196, '_menu_item_target', ''),
(801, 196, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(802, 196, '_menu_item_xfn', ''),
(803, 196, '_menu_item_url', '#'),
(804, 196, '_menu_item_orphaned', '1540205495'),
(805, 197, '_menu_item_type', 'post_type'),
(806, 197, '_menu_item_menu_item_parent', '0'),
(807, 197, '_menu_item_object_id', '179'),
(808, 197, '_menu_item_object', 'page'),
(809, 197, '_menu_item_target', ''),
(810, 197, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(811, 197, '_menu_item_xfn', ''),
(812, 197, '_menu_item_url', ''),
(814, 198, '_menu_item_type', 'post_type'),
(815, 198, '_menu_item_menu_item_parent', '197'),
(816, 198, '_menu_item_object_id', '183'),
(817, 198, '_menu_item_object', 'page'),
(818, 198, '_menu_item_target', ''),
(819, 198, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(820, 198, '_menu_item_xfn', ''),
(821, 198, '_menu_item_url', ''),
(823, 199, '_menu_item_type', 'post_type'),
(824, 199, '_menu_item_menu_item_parent', '197'),
(825, 199, '_menu_item_object_id', '185'),
(826, 199, '_menu_item_object', 'page'),
(827, 199, '_menu_item_target', ''),
(828, 199, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(829, 199, '_menu_item_xfn', ''),
(830, 199, '_menu_item_url', ''),
(832, 200, '_menu_item_type', 'post_type'),
(833, 200, '_menu_item_menu_item_parent', '197'),
(834, 200, '_menu_item_object_id', '181'),
(835, 200, '_menu_item_object', 'page'),
(836, 200, '_menu_item_target', ''),
(837, 200, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(838, 200, '_menu_item_xfn', ''),
(839, 200, '_menu_item_url', ''),
(841, 201, '_menu_item_type', 'post_type'),
(842, 201, '_menu_item_menu_item_parent', '197'),
(843, 201, '_menu_item_object_id', '187'),
(844, 201, '_menu_item_object', 'page'),
(845, 201, '_menu_item_target', ''),
(846, 201, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(847, 201, '_menu_item_xfn', ''),
(848, 201, '_menu_item_url', ''),
(850, 202, '_menu_item_type', 'post_type'),
(851, 202, '_menu_item_menu_item_parent', '190'),
(852, 202, '_menu_item_object_id', '146'),
(853, 202, '_menu_item_object', 'page'),
(854, 202, '_menu_item_target', ''),
(855, 202, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(856, 202, '_menu_item_xfn', ''),
(857, 202, '_menu_item_url', ''),
(859, 203, '_menu_item_type', 'post_type'),
(860, 203, '_menu_item_menu_item_parent', '0'),
(861, 203, '_menu_item_object_id', '144'),
(862, 203, '_menu_item_object', 'page'),
(863, 203, '_menu_item_target', ''),
(864, 203, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(865, 203, '_menu_item_xfn', ''),
(866, 203, '_menu_item_url', ''),
(868, 204, '_menu_item_type', 'post_type'),
(869, 204, '_menu_item_menu_item_parent', '203'),
(870, 204, '_menu_item_object_id', '148'),
(871, 204, '_menu_item_object', 'page'),
(872, 204, '_menu_item_target', ''),
(873, 204, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(874, 204, '_menu_item_xfn', ''),
(875, 204, '_menu_item_url', ''),
(877, 205, '_menu_item_type', 'post_type'),
(878, 205, '_menu_item_menu_item_parent', '236'),
(879, 205, '_menu_item_object_id', '139'),
(880, 205, '_menu_item_object', 'page'),
(881, 205, '_menu_item_target', ''),
(882, 205, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(883, 205, '_menu_item_xfn', ''),
(884, 205, '_menu_item_url', ''),
(886, 206, '_menu_item_type', 'custom'),
(887, 206, '_menu_item_menu_item_parent', '0'),
(888, 206, '_menu_item_object_id', '206'),
(889, 206, '_menu_item_object', 'custom'),
(890, 206, '_menu_item_target', ''),
(891, 206, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(892, 206, '_menu_item_xfn', ''),
(893, 206, '_menu_item_url', ''),
(895, 207, '_menu_item_type', 'post_type'),
(896, 207, '_menu_item_menu_item_parent', '206'),
(897, 207, '_menu_item_object_id', '156'),
(898, 207, '_menu_item_object', 'page'),
(899, 207, '_menu_item_target', ''),
(900, 207, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(901, 207, '_menu_item_xfn', ''),
(902, 207, '_menu_item_url', ''),
(904, 208, '_menu_item_type', 'custom'),
(905, 208, '_menu_item_menu_item_parent', '0'),
(906, 208, '_menu_item_object_id', '208'),
(907, 208, '_menu_item_object', 'custom'),
(908, 208, '_menu_item_target', ''),
(909, 208, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(910, 208, '_menu_item_xfn', ''),
(911, 208, '_menu_item_url', ''),
(913, 209, '_menu_item_type', 'post_type'),
(914, 209, '_menu_item_menu_item_parent', '208'),
(915, 209, '_menu_item_object_id', '161'),
(916, 209, '_menu_item_object', 'page'),
(917, 209, '_menu_item_target', ''),
(918, 209, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(919, 209, '_menu_item_xfn', ''),
(920, 209, '_menu_item_url', ''),
(922, 210, '_menu_item_type', 'post_type'),
(923, 210, '_menu_item_menu_item_parent', '208'),
(924, 210, '_menu_item_object_id', '165'),
(925, 210, '_menu_item_object', 'page'),
(926, 210, '_menu_item_target', ''),
(927, 210, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(928, 210, '_menu_item_xfn', ''),
(929, 210, '_menu_item_url', ''),
(931, 211, '_menu_item_type', 'post_type'),
(932, 211, '_menu_item_menu_item_parent', '208'),
(933, 211, '_menu_item_object_id', '170'),
(934, 211, '_menu_item_object', 'page'),
(935, 211, '_menu_item_target', ''),
(936, 211, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(937, 211, '_menu_item_xfn', ''),
(938, 211, '_menu_item_url', ''),
(940, 212, '_menu_item_type', 'post_type'),
(941, 212, '_menu_item_menu_item_parent', '0'),
(942, 212, '_menu_item_object_id', '172'),
(943, 212, '_menu_item_object', 'page'),
(944, 212, '_menu_item_target', ''),
(945, 212, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(946, 212, '_menu_item_xfn', ''),
(947, 212, '_menu_item_url', ''),
(949, 213, '_menu_item_type', 'post_type'),
(950, 213, '_menu_item_menu_item_parent', '0'),
(951, 213, '_menu_item_object_id', '175'),
(952, 213, '_menu_item_object', 'page'),
(953, 213, '_menu_item_target', ''),
(954, 213, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(955, 213, '_menu_item_xfn', ''),
(956, 213, '_menu_item_url', ''),
(958, 65, '_wp_old_date', '2018-10-19'),
(959, 214, '_menu_item_type', 'taxonomy'),
(960, 214, '_menu_item_menu_item_parent', '217'),
(961, 214, '_menu_item_object_id', '27'),
(962, 214, '_menu_item_object', 'tribe_events_cat'),
(963, 214, '_menu_item_target', ''),
(964, 214, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(965, 214, '_menu_item_xfn', ''),
(966, 214, '_menu_item_url', ''),
(968, 215, '_menu_item_type', 'taxonomy'),
(969, 215, '_menu_item_menu_item_parent', '217'),
(970, 215, '_menu_item_object_id', '29'),
(971, 215, '_menu_item_object', 'tribe_events_cat'),
(972, 215, '_menu_item_target', ''),
(973, 215, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(974, 215, '_menu_item_xfn', ''),
(975, 215, '_menu_item_url', ''),
(977, 216, '_menu_item_type', 'taxonomy'),
(978, 216, '_menu_item_menu_item_parent', '217'),
(979, 216, '_menu_item_object_id', '31'),
(980, 216, '_menu_item_object', 'tribe_events_cat'),
(981, 216, '_menu_item_target', ''),
(982, 216, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(983, 216, '_menu_item_xfn', ''),
(984, 216, '_menu_item_url', ''),
(986, 217, '_menu_item_type', 'custom'),
(987, 217, '_menu_item_menu_item_parent', '0'),
(988, 217, '_menu_item_object_id', '217'),
(989, 217, '_menu_item_object', 'custom'),
(990, 217, '_menu_item_target', ''),
(991, 217, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(992, 217, '_menu_item_xfn', ''),
(993, 217, '_menu_item_url', '/chanter.ch/events'),
(995, 218, '_edit_lock', '1540206941:1'),
(996, 219, '_EventOrigin', 'events-calendar'),
(997, 219, '_tribe_modified_fields', 'a:1:{s:12:\"_EventOrigin\";d:1540214191;}'),
(998, 220, '_EventOrigin', 'events-calendar'),
(999, 220, '_tribe_modified_fields', 'a:17:{s:12:\"_EventOrigin\";d:1540214194;s:10:\"_edit_last\";d:1540214202;s:10:\"post_title\";d:1540214203;s:11:\"post_status\";d:1540214203;s:17:\"_EventShowMapLink\";d:1540214203;s:13:\"_EventShowMap\";d:1540214203;s:15:\"_EventStartDate\";d:1540214204;s:13:\"_EventEndDate\";d:1540214204;s:18:\"_EventStartDateUTC\";d:1540214204;s:16:\"_EventEndDateUTC\";d:1540214204;s:14:\"_EventDuration\";d:1540214204;s:20:\"_EventCurrencySymbol\";d:1540214204;s:22:\"_EventCurrencyPosition\";d:1540214204;s:10:\"_EventCost\";d:1540214204;s:9:\"_EventURL\";d:1540214204;s:14:\"_EventTimezone\";d:1540214204;s:18:\"_EventTimezoneAbbr\";d:1540214204;}'),
(1000, 220, '_edit_last', '1'),
(1001, 221, '_EventShowMapLink', '1'),
(1002, 221, '_EventShowMap', '1'),
(1003, 221, '_EventStartDate', '2018-10-22 08:00:00'),
(1004, 221, '_EventEndDate', '2018-10-22 17:00:00'),
(1005, 221, '_EventStartDateUTC', '2018-10-22 06:00:00'),
(1006, 221, '_EventEndDateUTC', '2018-10-22 15:00:00'),
(1007, 221, '_EventDuration', '32400'),
(1008, 221, '_EventCurrencySymbol', ''),
(1009, 221, '_EventCurrencyPosition', 'prefix'),
(1010, 221, '_EventCost', ''),
(1011, 221, '_EventURL', ''),
(1012, 221, '_EventTimezone', 'Europe/Paris'),
(1013, 221, '_EventTimezoneAbbr', 'CEST'),
(1014, 220, '_EventShowMapLink', '1'),
(1015, 220, '_EventShowMap', '1'),
(1016, 220, '_EventStartDate', '2018-10-22 08:00:00'),
(1017, 220, '_EventEndDate', '2018-10-22 17:00:00'),
(1018, 220, '_EventStartDateUTC', '2018-10-22 06:00:00'),
(1019, 220, '_EventEndDateUTC', '2018-10-22 15:00:00'),
(1020, 220, '_EventDuration', '32400'),
(1021, 220, '_EventCurrencySymbol', ''),
(1022, 220, '_EventCurrencyPosition', 'prefix'),
(1023, 220, '_EventCost', ''),
(1024, 220, '_EventURL', ''),
(1025, 220, '_EventTimezone', 'Europe/Paris'),
(1026, 220, '_EventTimezoneAbbr', 'CEST'),
(1027, 220, '_edit_lock', '1540206868:1'),
(1028, 218, '_customize_restore_dismissed', '1'),
(1029, 222, '_edit_lock', '1540207958:1'),
(1030, 223, '_wp_attached_file', '2018/10/photo_2018-10-21_23-56-40.jpg'),
(1031, 223, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1024;s:6:\"height\";i:768;s:4:\"file\";s:37:\"2018/10/photo_2018-10-21_23-56-40.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:37:\"photo_2018-10-21_23-56-40-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:37:\"photo_2018-10-21_23-56-40-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:37:\"photo_2018-10-21_23-56-40-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:38:\"photo_2018-10-21_23-56-40-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"featured-image-medium\";a:4:{s:4:\"file\";s:37:\"photo_2018-10-21_23-56-40-768x350.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1032, 224, '_wp_attached_file', '2018/10/cropped-photo_2018-10-21_23-56-40.jpg'),
(1033, 224, '_wp_attachment_context', 'custom-header'),
(1034, 224, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1024;s:6:\"height\";i:308;s:4:\"file\";s:45:\"2018/10/cropped-photo_2018-10-21_23-56-40.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"cropped-photo_2018-10-21_23-56-40-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:44:\"cropped-photo_2018-10-21_23-56-40-300x90.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:90;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:45:\"cropped-photo_2018-10-21_23-56-40-768x231.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:231;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:46:\"cropped-photo_2018-10-21_23-56-40-1024x308.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:308;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"featured-image-medium\";a:4:{s:4:\"file\";s:45:\"cropped-photo_2018-10-21_23-56-40-768x308.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:308;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:17:\"attachment_parent\";i:223;}'),
(1035, 224, '_wp_attachment_custom_header_last_used_radiate', '1540208004'),
(1036, 224, '_wp_attachment_is_custom_header', 'radiate'),
(1037, 222, '_wp_trash_meta_status', 'publish'),
(1038, 222, '_wp_trash_meta_time', '1540208004'),
(1039, 225, '_wp_attached_file', '2018/10/14598211520_bbbc43b0f1_o.jpg');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1040, 225, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1780;s:6:\"height\";i:402;s:4:\"file\";s:36:\"2018/10/14598211520_bbbc43b0f1_o.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:36:\"14598211520_bbbc43b0f1_o-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"14598211520_bbbc43b0f1_o-300x68.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:68;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:36:\"14598211520_bbbc43b0f1_o-768x173.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:173;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:37:\"14598211520_bbbc43b0f1_o-1024x231.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:231;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"featured-image-medium\";a:4:{s:4:\"file\";s:36:\"14598211520_bbbc43b0f1_o-768x350.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1041, 226, '_wp_attached_file', '2018/10/cropped-14598211520_bbbc43b0f1_o.jpg'),
(1042, 226, '_wp_attachment_context', 'custom-header'),
(1043, 226, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1340;s:6:\"height\";i:402;s:4:\"file\";s:44:\"2018/10/cropped-14598211520_bbbc43b0f1_o.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"cropped-14598211520_bbbc43b0f1_o-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:43:\"cropped-14598211520_bbbc43b0f1_o-300x90.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:90;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:44:\"cropped-14598211520_bbbc43b0f1_o-768x230.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:230;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:45:\"cropped-14598211520_bbbc43b0f1_o-1024x307.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:307;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"featured-image-medium\";a:4:{s:4:\"file\";s:44:\"cropped-14598211520_bbbc43b0f1_o-768x350.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:17:\"attachment_parent\";i:225;}'),
(1044, 226, '_wp_attachment_custom_header_last_used_radiate', '1540208201'),
(1045, 226, '_wp_attachment_is_custom_header', 'radiate'),
(1046, 227, '_edit_lock', '1540208196:1'),
(1047, 227, '_wp_trash_meta_status', 'publish'),
(1048, 227, '_wp_trash_meta_time', '1540208201'),
(1049, 228, '_wp_trash_meta_status', 'publish'),
(1050, 228, '_wp_trash_meta_time', '1540208261'),
(1051, 229, '_wp_trash_meta_status', 'publish'),
(1052, 229, '_wp_trash_meta_time', '1540208304'),
(1053, 230, '_wp_trash_meta_status', 'publish'),
(1054, 230, '_wp_trash_meta_time', '1540208321'),
(1055, 231, '_wp_trash_meta_status', 'publish'),
(1056, 231, '_wp_trash_meta_time', '1540208347'),
(1057, 232, '_wp_trash_meta_status', 'publish'),
(1058, 232, '_wp_trash_meta_time', '1540208389'),
(1086, 236, '_menu_item_type', 'custom'),
(1087, 236, '_menu_item_menu_item_parent', '0'),
(1088, 236, '_menu_item_object_id', '236'),
(1089, 236, '_menu_item_object', 'custom'),
(1090, 236, '_menu_item_target', ''),
(1091, 236, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1092, 236, '_menu_item_xfn', ''),
(1093, 236, '_menu_item_url', '/chanter.ch/de/events'),
(1095, 237, '_menu_item_type', 'taxonomy'),
(1096, 237, '_menu_item_menu_item_parent', '236'),
(1097, 237, '_menu_item_object_id', '38'),
(1098, 237, '_menu_item_object', 'tribe_events_cat'),
(1099, 237, '_menu_item_target', ''),
(1100, 237, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1101, 237, '_menu_item_xfn', ''),
(1102, 237, '_menu_item_url', ''),
(1104, 238, '_menu_item_type', 'taxonomy'),
(1105, 238, '_menu_item_menu_item_parent', '236'),
(1106, 238, '_menu_item_object_id', '36'),
(1107, 238, '_menu_item_object', 'tribe_events_cat'),
(1108, 238, '_menu_item_target', ''),
(1109, 238, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1110, 238, '_menu_item_xfn', ''),
(1111, 238, '_menu_item_url', ''),
(1113, 239, '_menu_item_type', 'taxonomy'),
(1114, 239, '_menu_item_menu_item_parent', '236'),
(1115, 239, '_menu_item_object_id', '34'),
(1116, 239, '_menu_item_object', 'tribe_events_cat'),
(1117, 239, '_menu_item_target', ''),
(1118, 239, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1119, 239, '_menu_item_xfn', ''),
(1120, 239, '_menu_item_url', '');

-- --------------------------------------------------------

--
-- Structure de la table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-10-09 15:08:19', '2018-10-09 13:08:19', 'Bienvenue sur WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis lancez-vous !', 'Bonjour tout le monde !', '', 'publish', 'closed', 'open', '', 'bonjour-tout-le-monde', '', '', '2018-10-19 11:21:37', '2018-10-19 09:21:37', '', 0, 'http://localhost:8080/chanter.ch/?p=1', 0, 'post', '', 0),
(5, 1, '2018-10-19 11:21:38', '0000-00-00 00:00:00', 'Toto', 'Ceci est un nouvel article', '', 'draft', 'closed', 'open', '', '', '', '', '2018-10-19 11:21:38', '2018-10-19 09:21:38', '', 0, 'http://localhost:8080/chanter.ch/?p=5', 0, 'post', '', 0),
(18, 1, '2018-10-11 17:25:58', '2018-10-11 15:25:58', 'cest moi !', 'photo_2018-04-19_13-04-08', 'cestmoi', 'inherit', 'open', 'closed', '', 'photo_2018-04-19_13-04-08', '', '', '2018-10-12 13:35:51', '2018-10-12 11:35:51', '', 38, 'http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/photo_2018-04-19_13-04-08.jpg', 0, 'attachment', 'image/jpeg', 0),
(20, 1, '2018-10-11 17:28:02', '2018-10-11 15:28:02', '', 'hes so', '', 'trash', 'closed', 'closed', '', 'hes-so__trashed', '', '', '2018-10-11 17:32:10', '2018-10-11 15:32:10', '', 0, 'http://localhost:8080/chanter.ch/lieu/hes-so/', 0, 'tribe_venue', '', 0),
(21, 1, '2018-10-11 17:28:03', '2018-10-11 15:28:03', '', 'julien reichenbach', '', 'trash', 'closed', 'closed', '', 'julien-reichenbach__trashed', '', '', '2018-10-11 17:32:14', '2018-10-11 15:32:14', '', 0, 'http://localhost:8080/chanter.ch/organisateur/julien-reichenbach/', 0, 'tribe_organizer', '', 0),
(31, 1, '2018-10-12 08:45:42', '2018-10-12 06:45:42', 'Testing event body\r\n<ul>\r\n 	<li>point 1</li>\r\n 	<li>point 2</li>\r\n 	<li>point 3</li>\r\n</ul>', 'Testing Event Title', '', 'publish', 'open', 'closed', '', 'testing-event-title', '', '', '2018-10-12 08:45:42', '2018-10-12 06:45:42', '', 0, 'http://localhost:8080/chanter.ch/?post_type=tribe_events&#038;p=31', 0, 'tribe_events', '', 0),
(32, 1, '2018-10-12 08:45:42', '2018-10-12 06:45:42', 'Testing event body\r\n<ul>\r\n 	<li>point 1</li>\r\n 	<li>point 2</li>\r\n 	<li>point 3</li>\r\n</ul>', 'Testing Event Title', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2018-10-12 08:45:42', '2018-10-12 06:45:42', '', 31, 'http://localhost:8080/chanter.ch/2018/10/12/31-revision-v1/', 0, 'revision', '', 0),
(33, 1, '2018-10-12 08:45:43', '2018-10-12 06:45:43', '', 'TestLocation', '', 'publish', 'closed', 'closed', '', 'testlocation', '', '', '2018-10-12 08:45:43', '2018-10-12 06:45:43', '', 0, 'http://localhost:8080/chanter.ch/lieu/testlocation/', 0, 'tribe_venue', '', 0),
(34, 1, '2018-10-12 08:45:44', '2018-10-12 06:45:44', '', 'TestOrga', '', 'publish', 'closed', 'closed', '', 'testorga', '', '', '2018-10-12 08:45:44', '2018-10-12 06:45:44', '', 0, 'http://localhost:8080/chanter.ch/organisateur/testorga/', 0, 'tribe_organizer', '', 0),
(35, 1, '2018-10-12 11:34:35', '2018-10-12 09:34:35', '<p>This is the WPForms preview page. All your form previews will be handled on this page.</p><p>The page is set to private, so it is not publicly accessible. Please do not delete this page :) .</p>', 'WPForms Preview', '', 'private', 'closed', 'closed', '', 'wpforms-preview', '', '', '2018-10-12 11:34:35', '2018-10-12 09:34:35', '', 0, 'http://localhost:8080/chanter.ch/wpforms-preview/', 0, 'page', '', 0),
(36, 1, '2018-10-12 11:35:04', '2018-10-12 09:35:04', '{\"id\":\"36\",\"field_id\":4,\"fields\":{\"2\":{\"id\":\"2\",\"type\":\"textarea\",\"label\":\"Commentaire (facultatif)\",\"description\":\"\",\"size\":\"small\",\"placeholder\":\"\",\"css\":\"\"},\"3\":{\"id\":\"3\",\"type\":\"checkbox\",\"label\":\"\",\"choices\":{\"3\":{\"label\":\"J\'inscris mon choeur\",\"value\":\"\",\"image\":\"\"}},\"description\":\"\",\"choices_images_style\":\"modern\",\"input_columns\":\"\",\"label_hide\":\"1\",\"css\":\"\",\"dynamic_choices\":\"\"}},\"settings\":{\"form_title\":\"Inscription \\u00e0 l\'\\u00e9v\\u00e9nement\",\"form_desc\":\"\",\"form_class\":\"\",\"submit_text\":\"Envoyer inscription\",\"submit_text_processing\":\"\",\"submit_class\":\"\",\"honeypot\":\"1\",\"notification_enable\":\"1\",\"notifications\":{\"1\":{\"email\":\"{admin_email}\",\"subject\":\"Nouvelle entr\\u00e9e Formulaire vierge\",\"sender_name\":\"FSCV\",\"sender_address\":\"{admin_email}\",\"replyto\":\"\",\"message\":\"{all_fields}\"}},\"confirmations\":{\"1\":{\"type\":\"message\",\"message\":\"<p>Merci de nous avoir contact\\u00e9\\u00a0! Nous reviendrons vers vous rapidement.<\\/p>\",\"message_scroll\":\"1\",\"page\":\"2\",\"redirect\":\"\"}}},\"meta\":{\"template\":\"contact\"}}', 'Inscription à l&#039;événement', '', 'publish', 'closed', 'closed', '', 'formulaire-vierge', '', '', '2018-10-12 11:44:34', '2018-10-12 09:44:34', '', 0, 'http://localhost:8080/chanter.ch/?post_type=wpforms&#038;p=36', 0, 'wpforms', '', 0),
(38, 1, '2018-10-12 13:38:05', '2018-10-12 11:38:05', 'Bonjour bienvenue à mon événement\r\n\r\n[caption id=\"attachment_18\" align=\"alignnone\" width=\"256\"]<img class=\"size-medium wp-image-18\" src=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/photo_2018-04-19_13-04-08-e1539271576637-256x300.jpg\" alt=\"\" width=\"256\" height=\"300\" /> cestmoi[/caption]', 'Mon événement', '', 'publish', 'open', 'closed', '', 'mon-evenement', '', '', '2018-10-12 13:43:02', '2018-10-12 11:43:02', '', 0, 'http://localhost:8080/chanter.ch/?post_type=tribe_events&#038;p=38', 0, 'tribe_events', '', 0),
(39, 1, '2018-10-12 13:38:05', '2018-10-12 11:38:05', 'Bonjour bienvenue à mon événement\r\n\r\n[caption id=\"attachment_18\" align=\"alignnone\" width=\"256\"]<img class=\"size-medium wp-image-18\" src=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/photo_2018-04-19_13-04-08-e1539271576637-256x300.jpg\" alt=\"\" width=\"256\" height=\"300\" /> cestmoi[/caption]', 'Mon événement', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2018-10-12 13:38:05', '2018-10-12 11:38:05', '', 38, 'http://localhost:8080/chanter.ch/2018/10/12/38-revision-v1/', 0, 'revision', '', 0),
(40, 1, '2018-10-12 13:38:06', '2018-10-12 11:38:06', '', 'NewLocation', '', 'publish', 'closed', 'closed', '', 'newlocation', '', '', '2018-10-12 13:38:06', '2018-10-12 11:38:06', '', 0, 'http://localhost:8080/chanter.ch/lieu/newlocation/', 0, 'tribe_venue', '', 0),
(41, 1, '2018-10-12 13:38:07', '2018-10-12 11:38:07', '', 'Choeur de Vex', '', 'publish', 'closed', 'closed', '', 'choeur-de-vex', '', '', '2018-10-12 13:38:07', '2018-10-12 11:38:07', '', 0, 'http://localhost:8080/chanter.ch/organisateur/choeur-de-vex/', 0, 'tribe_organizer', '', 0),
(42, 1, '2018-10-12 13:41:21', '2018-10-12 11:41:21', 'fs gbtgbd', 'No Orga', '', 'publish', 'open', 'closed', '', 'no-orga', '', '', '2018-10-12 13:41:21', '2018-10-12 11:41:21', '', 0, 'http://localhost:8080/chanter.ch/?post_type=tribe_events&#038;p=42', 0, 'tribe_events', '', 0),
(43, 1, '2018-10-12 13:41:21', '2018-10-12 11:41:21', 'fs gbtgbd', 'No Orga', '', 'inherit', 'closed', 'closed', '', '42-revision-v1', '', '', '2018-10-12 13:41:21', '2018-10-12 11:41:21', '', 42, 'http://localhost:8080/chanter.ch/2018/10/12/42-revision-v1/', 0, 'revision', '', 0),
(44, 1, '2018-10-12 13:43:02', '2018-10-12 11:43:02', '', 'USC', '', 'publish', 'closed', 'closed', '', 'usc', '', '', '2018-10-12 13:43:02', '2018-10-12 11:43:02', '', 0, 'http://localhost:8080/chanter.ch/organisateur/usc/', 0, 'tribe_organizer', '', 0),
(45, 1, '2018-10-12 13:44:05', '2018-10-12 11:44:05', 'Bonjour bienvenue à mon événement', 'Mon événement', '', 'inherit', 'closed', 'closed', '', '38-autosave-v1', '', '', '2018-10-12 13:44:05', '2018-10-12 11:44:05', '', 38, 'http://localhost:8080/chanter.ch/2018/10/12/38-autosave-v1/', 0, 'revision', '', 0),
(47, 1, '2018-10-12 14:17:04', '2018-10-12 12:17:04', 'Test\r\n\r\n[O_U user_role=\'editor\' blocked_message=\'only editors can register\']\r\n\r\n[wpforms id=\"36\" title=\"true\" description=\"true\"]\r\n\r\n[/O_U]', 'Testing', '', 'publish', 'open', 'closed', '', '47', '', '', '2018-10-12 14:36:55', '2018-10-12 12:36:55', '', 0, 'http://localhost:8080/chanter.ch/?post_type=tribe_events&#038;p=47', 0, 'tribe_events', '', 0),
(49, 1, '2018-10-12 14:17:04', '2018-10-12 12:17:04', 'Test\r\n\r\n[O_U user_role=\'editor\' blocked_message=\'only editors can register\']\r\n\r\n[wpforms id=\"36\" title=\"true\" description=\"true\"]\r\n\r\n[/O_U]', '', '', 'inherit', 'closed', 'closed', '', '47-revision-v1', '', '', '2018-10-12 14:17:04', '2018-10-12 12:17:04', '', 47, 'http://localhost:8080/chanter.ch/2018/10/12/47-revision-v1/', 0, 'revision', '', 0),
(50, 1, '2018-10-12 14:20:53', '2018-10-12 12:20:53', 'Test\r\n\r\n[O_U user_role=\'editor\' blocked_message=\'only editors can register\']\r\n\r\n[wpforms id=\"36\" title=\"true\" description=\"true\"]\r\n\r\n[/O_U]', 'Testing', '', 'inherit', 'closed', 'closed', '', '47-revision-v1', '', '', '2018-10-12 14:20:53', '2018-10-12 12:20:53', '', 47, 'http://localhost:8080/chanter.ch/2018/10/12/47-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2018-10-19 08:45:41', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-10-19 08:45:41', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?p=52', 0, 'post', '', 0),
(53, 1, '2018-10-19 08:48:50', '2018-10-19 06:48:50', '[wp_support_plus]', 'Contact', '', 'publish', 'closed', 'closed', '', 'contact', '', '', '2018-10-19 16:40:58', '2018-10-19 14:40:58', '', 0, 'http://localhost:8080/chanter.ch/support/', 0, 'page', '', 0),
(55, 1, '2018-10-19 11:21:37', '2018-10-19 09:21:37', 'Bienvenue sur WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis lancez-vous !', 'Bonjour tout le monde !', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2018-10-19 11:21:37', '2018-10-19 09:21:37', '', 1, 'http://localhost:8080/chanter.ch/2018/10/19/1-revision-v1/', 0, 'revision', '', 0),
(56, 1, '2018-10-19 11:21:38', '2018-10-19 09:21:38', 'Toto', 'Ceci est un nouvel article', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2018-10-19 11:21:38', '2018-10-19 09:21:38', '', 5, 'http://localhost:8080/chanter.ch/2018/10/19/5-revision-v1/', 0, 'revision', '', 0),
(57, 5, '2018-10-19 11:31:03', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-10-19 11:31:03', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?p=57', 0, 'post', '', 0),
(58, 1, '2018-10-19 11:33:48', '2018-10-19 09:33:48', 'On est le coeur de sion lol c\'est trop bien', 'Choeur de Sion', '', 'publish', 'closed', 'closed', '', 'choeur-de-sion', '', '', '2018-10-19 11:33:48', '2018-10-19 09:33:48', '', 0, 'http://localhost:8080/chanter.ch/?p=58', 0, 'post', '', 0),
(59, 1, '2018-10-19 11:33:48', '2018-10-19 09:33:48', 'On est le coeur de sion lol c\'est trop bien', 'Choeur de Sion', '', 'inherit', 'closed', 'closed', '', '58-revision-v1', '', '', '2018-10-19 11:33:48', '2018-10-19 09:33:48', '', 58, 'http://localhost:8080/chanter.ch/2018/10/19/58-revision-v1/', 0, 'revision', '', 0),
(60, 1, '2018-10-19 11:35:05', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-10-19 11:35:05', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?p=60', 0, 'post', '', 0),
(61, 5, '2018-10-19 11:36:56', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-10-19 11:36:56', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?p=61', 0, 'post', '', 0),
(62, 6, '2018-10-19 15:16:18', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-10-19 15:16:18', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?p=62', 0, 'post', '', 0),
(63, 5, '2018-10-19 15:16:50', '0000-00-00 00:00:00', '', 'Test nouvel article', '', 'pending', 'closed', 'closed', '', '', '', '', '2018-10-19 15:16:50', '2018-10-19 13:16:50', '', 0, 'http://localhost:8080/chanter.ch/?p=63', 0, 'post', '', 0),
(64, 5, '2018-10-19 15:16:50', '2018-10-19 13:16:50', '', 'Test nouvel article', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2018-10-19 15:16:50', '2018-10-19 13:16:50', '', 63, 'http://localhost:8080/chanter.ch/2018/10/19/63-revision-v1/', 0, 'revision', '', 0),
(65, 5, '2018-10-22 13:00:12', '2018-10-22 11:00:12', '', 'Evenement de test', '', 'publish', 'closed', 'closed', '', 'evenement-de-test', '', '', '2018-10-22 13:00:12', '2018-10-22 11:00:12', '', 0, 'http://localhost:8080/chanter.ch/?post_type=tribe_events&#038;p=65', 0, 'tribe_events', '', 0),
(66, 5, '2018-10-19 15:25:03', '2018-10-19 13:25:03', '', 'Evenement de test', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2018-10-19 15:25:03', '2018-10-19 13:25:03', '', 65, 'http://localhost:8080/chanter.ch/2018/10/19/65-revision-v1/', 0, 'revision', '', 0),
(70, 1, '2018-10-19 15:36:15', '2018-10-19 13:36:15', '', 'polylang_mo_6', '', 'private', 'closed', 'closed', '', 'polylang_mo_6', '', '', '2018-10-19 15:36:15', '2018-10-19 13:36:15', '', 0, 'http://localhost:8080/chanter.ch/?post_type=polylang_mo&p=70', 0, 'polylang_mo', '', 0),
(71, 1, '2018-10-19 15:37:18', '2018-10-19 13:37:18', '', 'polylang_mo_9', '', 'private', 'closed', 'closed', '', 'polylang_mo_9', '', '', '2018-10-19 15:37:18', '2018-10-19 13:37:18', '', 0, 'http://localhost:8080/chanter.ch/?post_type=polylang_mo&p=71', 0, 'polylang_mo', '', 0),
(72, 1, '2018-10-19 15:37:49', '0000-00-00 00:00:00', '', 'Liste des langues', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-10-19 15:37:49', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?p=72', 1, 'nav_menu_item', '', 0),
(76, 1, '2018-10-19 15:57:11', '2018-10-19 13:57:11', 'La Fédération des Sociétés de Chant du Valais (FSCV) est une association membre de l’Union Suisse des Chorales (USC) regroupant des chœurs d’adultes, de jeunes et d’enfants du Valais Romand et du Haut-Valais.\r\n\r\nFondée en 1906, elle chapeaute l’Association Valaisanne des Chefs de Chœurs (AVCC) et 4 groupements régionaux : le Groupement des Sociétés de Chant du Bas-Valais (GSCBV), l’Union Chorale du Centre (UCC), le Groupement des Chanteurs du Valais Central (GCVC) et le Oberwalliser Chor- und Cäcilien Verband (OCV).\r\n\r\nA ce jour, plus de 160 chorales d’adultes avec plus de 5000 chanteurs sont réunis au sein de la Fédération. Les chœurs de jeunes et d’enfants sont également membres de la Fédération, ce qui leur permet d’accéder aux offres de formation et au soutien des chorales d’adultes.\r\n\r\n<img class=\"size-medium wp-image-77 aligncenter\" src=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/carte_valais-300x203.gif\" alt=\"\" width=\"300\" height=\"203\" />\r\n<h4><strong>Organisation</strong></h4>\r\nLa FSCV est présidée avec compétence et enthousiasme par Laurent Bovier. Elle est composée d’un comité directeur, d’un comité cantonal et de la commission de musique. Les présidents des groupements régionaux et de l’AVCC sont également membres d’office du comité directeur.\r\n\r\n<img class=\"size-medium wp-image-78 aligncenter\" src=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/organigrammeFSCV-300x232.png\" alt=\"\" width=\"300\" height=\"232\" />\r\n\r\nVous pouvez télécharger les <a href=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/statuts_FSCV_mars_2014_final.pdf\">status de la FSCV</a> tels qu’adoptés pour l’Assemblée Générale du 22 mars 2014 à Brigue.', 'Présentation', '', 'publish', 'closed', 'closed', '', 'presentation', '', '', '2018-10-19 15:58:36', '2018-10-19 13:58:36', '', 0, 'http://localhost:8080/chanter.ch/?page_id=76', 0, 'page', '', 0),
(77, 1, '2018-10-19 15:51:27', '2018-10-19 13:51:27', '', 'carte_valais', '', 'inherit', 'closed', 'closed', '', 'carte_valais', '', '', '2018-10-19 15:51:27', '2018-10-19 13:51:27', '', 76, 'http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/carte_valais.gif', 0, 'attachment', 'image/gif', 0),
(78, 1, '2018-10-19 15:52:51', '2018-10-19 13:52:51', '', 'organigrammeFSCV', '', 'inherit', 'closed', 'closed', '', 'organigrammefscv', '', '', '2018-10-19 15:52:51', '2018-10-19 13:52:51', '', 76, 'http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/organigrammeFSCV.png', 0, 'attachment', 'image/png', 0),
(79, 1, '2018-10-19 15:55:16', '2018-10-19 13:55:16', '', 'status de la FSCV', '', 'inherit', 'closed', 'closed', '', 'statuts_fscv_mars_2014_final', '', '', '2018-10-19 15:56:27', '2018-10-19 13:56:27', '', 76, 'http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/statuts_FSCV_mars_2014_final.pdf', 0, 'attachment', 'application/pdf', 0),
(80, 1, '2018-10-19 15:57:11', '2018-10-19 13:57:11', 'La Fédération des Sociétés de Chant du Valais (FSCV) est une association membre de l’Union Suisse des Chorales (USC) regroupant des chœurs d’adultes, de jeunes et d’enfants du Valais Romand et du Haut-Valais.\r\n\r\nFondée en 1906, elle chapeaute l’Association Valaisanne des Chefs de Chœurs (AVCC) et 4 groupements régionaux : le Groupement des Sociétés de Chant du Bas-Valais (GSCBV), l’Union Chorale du Centre (UCC), le Groupement des Chanteurs du Valais Central (GCVC) et le Oberwalliser Chor- und Cäcilien Verband (OCV).\r\n\r\nA ce jour, plus de 160 chorales d’adultes avec plus de 5000 chanteurs sont réunis au sein de la Fédération. Les chœurs de jeunes et d’enfants sont également membres de la Fédération, ce qui leur permet d’accéder aux offres de formation et au soutien des chorales d’adultes.\r\n\r\n<img class=\"size-medium wp-image-77 aligncenter\" src=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/carte_valais-300x203.gif\" alt=\"\" width=\"300\" height=\"203\" />\r\n<h4><strong>Organisation</strong></h4>\r\nLa FSCV est présidée avec compétence et enthousiasme par Laurent Bovier. Elle est composée d’un comité directeur, d’un comité cantonal et de la commission de musique. Les présidents des groupements régionaux et de l’AVCC sont également membres d’office du comité directeur.\r\n\r\n<img class=\"size-medium wp-image-78 aligncenter\" src=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/organigrammeFSCV-300x232.png\" alt=\"\" width=\"300\" height=\"232\" />\r\n\r\nVous pouvez télécharger les <a href=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/statuts_FSCV_mars_2014_final.pdf\">status de la FSCV</a> tels qu’adoptés pour l’Assemblée Générale du 22 mars 2014 à Brigue.', 'Présentation', '', 'inherit', 'closed', 'closed', '', '76-revision-v1', '', '', '2018-10-19 15:57:11', '2018-10-19 13:57:11', '', 76, 'http://localhost:8080/chanter.ch/2018/10/19/76-revision-v1/', 0, 'revision', '', 0),
(81, 1, '2018-10-19 16:01:53', '2018-10-19 14:01:53', 'Der Verband Walliser Gesangvereine (VWG) ist Mitglied der Schweizerischen Chorvereinigung (SCV) und vereinigt Erwachsenen-, Jugend- und Kinderchöre aus dem Unter- und Oberwallis.\r\n\r\nDer Verband ist 1906 gegründet worden. Ihm gehören die Association Valaisanne des Chefs de Choeurs (AVCC) sowie 4 regionale Gruppierungen an: le Groupement des Sociétés de Chant du Bas-Valais (GSCBV), l’Union Chorale du Centre (UCC), le Groupement des Chanteurs du Valais Central (GCVC) und der Oberwalliser Chor- und Cäcilien Verband (OCV).\r\n\r\nDer Verband besteht heute aus über 160 Erwachsenenchören mit mehr als 5000 Sängerinnen und Sängern. Auch die Jugend- und Kinderchöre sind Mitglieder des Verbands, was ihnen Zugang zum Ausbildungsangebot verschafft und die Unterstützung durch Erwachsenenchöre ermöglicht.\r\n<div class=\"entry-content article\">\r\n\r\n<img class=\"size-medium wp-image-82 aligncenter\" src=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/carte_valais-1-300x203.gif\" alt=\"\" width=\"300\" height=\"203\" />\r\n<h4><strong>Organisation</strong></h4>\r\nDer VWG wird von Laurent Bovier mit Kompetenz und Begeisterung präsidiert. Die Organisation besteht aus einem Leitenden Ausschuss, einem Kantonalvorstand und der Musikkommission. Die Präsidenten der regionalen Gruppierungen und der AVCC gehören ebenfalls dem Leitenden Ausschuss an.\r\n\r\n<img class=\"size-medium wp-image-83 aligncenter\" src=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/organigrammeFSCV-1-300x232.png\" alt=\"\" width=\"300\" height=\"232\" />\r\n\r\nSie können die <a href=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/statuts_FSCV_mars_2014_final-1.pdf\">Statuten des VWG</a>, die an der Generalversammlung vom 22. März 2014 in Brig angenommen worden sind, herunterladen (deutscher Text im 2. Teil).\r\n\r\n</div>', 'Präsentation', '', 'publish', 'closed', 'closed', '', 'prasentation', '', '', '2018-10-19 16:02:54', '2018-10-19 14:02:54', '', 0, 'http://localhost:8080/chanter.ch/?page_id=81', 0, 'page', '', 0),
(82, 1, '2018-10-19 16:00:22', '2018-10-19 14:00:22', '', 'carte_valais', '', 'inherit', 'closed', 'closed', '', 'carte_valais-2', '', '', '2018-10-19 16:00:22', '2018-10-19 14:00:22', '', 81, 'http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/carte_valais-1.gif', 0, 'attachment', 'image/gif', 0),
(83, 1, '2018-10-19 16:01:06', '2018-10-19 14:01:06', '', 'organigrammeFSCV', '', 'inherit', 'closed', 'closed', '', 'organigrammefscv-2', '', '', '2018-10-19 16:01:06', '2018-10-19 14:01:06', '', 81, 'http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/organigrammeFSCV-1.png', 0, 'attachment', 'image/png', 0),
(84, 1, '2018-10-19 16:01:37', '2018-10-19 14:01:37', '', 'Statuten des VWG', '', 'inherit', 'closed', 'closed', '', 'statuts_fscv_mars_2014_final-2', '', '', '2018-10-19 16:01:45', '2018-10-19 14:01:45', '', 81, 'http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/statuts_FSCV_mars_2014_final-1.pdf', 0, 'attachment', 'application/pdf', 0),
(85, 1, '2018-10-19 16:01:53', '2018-10-19 14:01:53', '<p class=\"entry-title\"><span style=\"font-size: 1rem;\">Der Verband Walliser Gesangvereine (VWG) ist Mitglied der Schweizerischen Chorvereinigung (SCV) und vereinigt Erwachsenen-, Jugend- und Kinderchöre aus dem Unter- und Oberwallis.</span></p>\r\n\r\n<div class=\"entry-content article\">\r\n\r\nDer Verband ist 1906 gegründet worden. Ihm gehören die Association Valaisanne des Chefs de Choeurs (AVCC) sowie 4 regionale Gruppierungen an: le Groupement des Sociétés de Chant du Bas-Valais (GSCBV), l’Union Chorale du Centre (UCC), le Groupement des Chanteurs du Valais Central (GCVC) und der Oberwalliser Chor- und Cäcilien Verband (OCV).\r\n\r\nDer Verband besteht heute aus über 160 Erwachsenenchören mit mehr als 5000 Sängerinnen und Sängern. Auch die Jugend- und Kinderchöre sind Mitglieder des Verbands, was ihnen Zugang zum Ausbildungsangebot verschafft und die Unterstützung durch Erwachsenenchöre ermöglicht.\r\n\r\n<img class=\"size-medium wp-image-82 aligncenter\" src=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/carte_valais-1-300x203.gif\" alt=\"\" width=\"300\" height=\"203\" />\r\n<h4><strong>Organisation</strong></h4>\r\nDer VWG wird von Laurent Bovier mit Kompetenz und Begeisterung präsidiert. Die Organisation besteht aus einem Leitenden Ausschuss, einem Kantonalvorstand und der Musikkommission. Die Präsidenten der regionalen Gruppierungen und der AVCC gehören ebenfalls dem Leitenden Ausschuss an.\r\n\r\n<img class=\"size-medium wp-image-83 aligncenter\" src=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/organigrammeFSCV-1-300x232.png\" alt=\"\" width=\"300\" height=\"232\" />\r\n\r\nSie können die <a href=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/statuts_FSCV_mars_2014_final-1.pdf\">Statuten des VWG</a>, die an der Generalversammlung vom 22. März 2014 in Brig angenommen worden sind, herunterladen (deutscher Text im 2. Teil).\r\n\r\n</div>', 'Präsentation', '', 'inherit', 'closed', 'closed', '', '81-revision-v1', '', '', '2018-10-19 16:01:53', '2018-10-19 14:01:53', '', 81, 'http://localhost:8080/chanter.ch/2018/10/19/81-revision-v1/', 0, 'revision', '', 0),
(86, 1, '2018-10-19 16:02:54', '2018-10-19 14:02:54', 'Der Verband Walliser Gesangvereine (VWG) ist Mitglied der Schweizerischen Chorvereinigung (SCV) und vereinigt Erwachsenen-, Jugend- und Kinderchöre aus dem Unter- und Oberwallis.\r\n\r\nDer Verband ist 1906 gegründet worden. Ihm gehören die Association Valaisanne des Chefs de Choeurs (AVCC) sowie 4 regionale Gruppierungen an: le Groupement des Sociétés de Chant du Bas-Valais (GSCBV), l’Union Chorale du Centre (UCC), le Groupement des Chanteurs du Valais Central (GCVC) und der Oberwalliser Chor- und Cäcilien Verband (OCV).\r\n\r\nDer Verband besteht heute aus über 160 Erwachsenenchören mit mehr als 5000 Sängerinnen und Sängern. Auch die Jugend- und Kinderchöre sind Mitglieder des Verbands, was ihnen Zugang zum Ausbildungsangebot verschafft und die Unterstützung durch Erwachsenenchöre ermöglicht.\r\n<div class=\"entry-content article\">\r\n\r\n<img class=\"size-medium wp-image-82 aligncenter\" src=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/carte_valais-1-300x203.gif\" alt=\"\" width=\"300\" height=\"203\" />\r\n<h4><strong>Organisation</strong></h4>\r\nDer VWG wird von Laurent Bovier mit Kompetenz und Begeisterung präsidiert. Die Organisation besteht aus einem Leitenden Ausschuss, einem Kantonalvorstand und der Musikkommission. Die Präsidenten der regionalen Gruppierungen und der AVCC gehören ebenfalls dem Leitenden Ausschuss an.\r\n\r\n<img class=\"size-medium wp-image-83 aligncenter\" src=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/organigrammeFSCV-1-300x232.png\" alt=\"\" width=\"300\" height=\"232\" />\r\n\r\nSie können die <a href=\"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/statuts_FSCV_mars_2014_final-1.pdf\">Statuten des VWG</a>, die an der Generalversammlung vom 22. März 2014 in Brig angenommen worden sind, herunterladen (deutscher Text im 2. Teil).\r\n\r\n</div>', 'Präsentation', '', 'inherit', 'closed', 'closed', '', '81-revision-v1', '', '', '2018-10-19 16:02:54', '2018-10-19 14:02:54', '', 81, 'http://localhost:8080/chanter.ch/2018/10/19/81-revision-v1/', 0, 'revision', '', 0),
(87, 1, '2018-10-19 16:04:19', '2018-10-19 14:04:19', '*PAGE COMITE*', 'Comité de la FSCV', '', 'publish', 'closed', 'closed', '', 'comite-de-la-fscv', '', '', '2018-10-22 12:45:55', '2018-10-22 10:45:55', '', 76, 'http://localhost:8080/chanter.ch/?page_id=87', 0, 'page', '', 0),
(88, 1, '2018-10-19 16:04:19', '2018-10-19 14:04:19', '*PAGE COMITE*', 'Comité de la FSCV', '', 'inherit', 'closed', 'closed', '', '87-revision-v1', '', '', '2018-10-19 16:04:19', '2018-10-19 14:04:19', '', 87, 'http://localhost:8080/chanter.ch/2018/10/19/87-revision-v1/', 0, 'revision', '', 0),
(89, 1, '2018-10-19 16:04:45', '2018-10-19 14:04:45', '*PAGE COMMISSION DE MUSIQUE*', 'Commission de musique', '', 'publish', 'closed', 'closed', '', 'commission-de-musique', '', '', '2018-10-22 12:46:13', '2018-10-22 10:46:13', '', 76, 'http://localhost:8080/chanter.ch/?page_id=89', 0, 'page', '', 0),
(90, 1, '2018-10-19 16:04:45', '2018-10-19 14:04:45', '*PAGE COMMISSION DE MUSIQUE*', 'Commission de musique', '', 'inherit', 'closed', 'closed', '', '89-revision-v1', '', '', '2018-10-19 16:04:45', '2018-10-19 14:04:45', '', 89, 'http://localhost:8080/chanter.ch/2018/10/19/89-revision-v1/', 0, 'revision', '', 0),
(91, 1, '2018-10-19 16:05:05', '2018-10-19 14:05:05', '*PAGE GROUPEMENTS*', 'Groupements', '', 'publish', 'closed', 'closed', '', 'groupements', '', '', '2018-10-22 12:47:26', '2018-10-22 10:47:26', '', 76, 'http://localhost:8080/chanter.ch/?page_id=91', 0, 'page', '', 0),
(92, 1, '2018-10-19 16:05:05', '2018-10-19 14:05:05', '*PAGE GROUPEMENTS*', 'Groupement', '', 'inherit', 'closed', 'closed', '', '91-revision-v1', '', '', '2018-10-19 16:05:05', '2018-10-19 14:05:05', '', 91, 'http://localhost:8080/chanter.ch/2018/10/19/91-revision-v1/', 0, 'revision', '', 0),
(93, 1, '2018-10-19 16:05:24', '2018-10-19 14:05:24', '*PAGE MEMBRES D\'HONNEUR*', 'Membres d\'honneur', '', 'publish', 'closed', 'closed', '', 'membres-dhonneur', '', '', '2018-10-22 12:48:10', '2018-10-22 10:48:10', '', 76, 'http://localhost:8080/chanter.ch/?page_id=93', 0, 'page', '', 0),
(94, 1, '2018-10-19 16:05:24', '2018-10-19 14:05:24', '*PAGE MEMBRES D\'HONNEUR*', 'Membres d\'honneur', '', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2018-10-19 16:05:24', '2018-10-19 14:05:24', '', 93, 'http://localhost:8080/chanter.ch/2018/10/19/93-revision-v1/', 0, 'revision', '', 0),
(95, 1, '2018-10-19 16:07:01', '2018-10-19 14:07:01', '', 'Membres d\'honneur', '', 'publish', 'closed', 'closed', '', 'membres-dhonneur', '', '', '2018-10-22 13:09:20', '2018-10-22 11:09:20', '', 76, 'http://localhost:8080/chanter.ch/?p=95', 5, 'nav_menu_item', '', 0),
(96, 1, '2018-10-19 16:07:00', '2018-10-19 14:07:00', ' ', '', '', 'publish', 'closed', 'closed', '', '96', '', '', '2018-10-22 13:09:20', '2018-10-22 11:09:20', '', 76, 'http://localhost:8080/chanter.ch/?p=96', 4, 'nav_menu_item', '', 0),
(97, 1, '2018-10-19 16:07:00', '2018-10-19 14:07:00', ' ', '', '', 'publish', 'closed', 'closed', '', '97', '', '', '2018-10-22 13:09:20', '2018-10-22 11:09:20', '', 76, 'http://localhost:8080/chanter.ch/?p=97', 3, 'nav_menu_item', '', 0),
(98, 1, '2018-10-19 16:07:00', '2018-10-19 14:07:00', ' ', '', '', 'publish', 'closed', 'closed', '', '98', '', '', '2018-10-22 13:09:20', '2018-10-22 11:09:20', '', 76, 'http://localhost:8080/chanter.ch/?p=98', 2, 'nav_menu_item', '', 0),
(100, 1, '2018-10-19 16:06:59', '2018-10-19 14:06:59', ' ', '', '', 'publish', 'closed', 'closed', '', '100', '', '', '2018-10-22 13:09:20', '2018-10-22 11:09:20', '', 0, 'http://localhost:8080/chanter.ch/?p=100', 1, 'nav_menu_item', '', 0),
(101, 1, '2018-10-19 16:07:01', '2018-10-19 14:07:01', ' ', '', '', 'publish', 'closed', 'closed', '', '101', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 0, 'http://localhost:8080/chanter.ch/?p=101', 25, 'nav_menu_item', '', 0),
(102, 1, '2018-10-19 16:08:21', '2018-10-19 14:08:21', ' ', '', '', 'publish', 'closed', 'closed', '', '102', '', '', '2018-10-22 13:45:40', '2018-10-22 11:45:40', '', 0, 'http://localhost:8080/chanter.ch/?p=102', 1, 'nav_menu_item', '', 0),
(103, 1, '2018-10-19 16:09:09', '2018-10-19 14:09:09', 'Bienvenue sur le site de la FSCV', 'Accueil', '', 'publish', 'closed', 'closed', '', 'accueil', '', '', '2018-10-19 16:09:09', '2018-10-19 14:09:09', '', 0, 'http://localhost:8080/chanter.ch/?page_id=103', 0, 'page', '', 0),
(104, 1, '2018-10-19 16:09:09', '2018-10-19 14:09:09', 'Bienvenue sur le site de la FSCV', 'Accueil', '', 'inherit', 'closed', 'closed', '', '103-revision-v1', '', '', '2018-10-19 16:09:09', '2018-10-19 14:09:09', '', 103, 'http://localhost:8080/chanter.ch/2018/10/19/103-revision-v1/', 0, 'revision', '', 0),
(105, 1, '2018-10-19 16:11:18', '2018-10-19 14:11:18', '*Accent allemand* Bienvenue sur le site de la FSCV', 'Willkommen', '', 'publish', 'closed', 'closed', '', 'willkommen', '', '', '2018-10-19 16:11:18', '2018-10-19 14:11:18', '', 0, 'http://localhost:8080/chanter.ch/?page_id=105', 0, 'page', '', 0),
(106, 1, '2018-10-19 16:11:18', '2018-10-19 14:11:18', '*Accent allemand* Bienvenue sur le site de la FSCV', 'Willkommen', '', 'inherit', 'closed', 'closed', '', '105-revision-v1', '', '', '2018-10-19 16:11:18', '2018-10-19 14:11:18', '', 105, 'http://localhost:8080/chanter.ch/2018/10/19/105-revision-v1/', 0, 'revision', '', 0),
(107, 1, '2018-10-19 16:12:34', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-10-19 16:12:34', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?post_type=tribe_events&p=107', 0, 'tribe_events', '', 0),
(108, 1, '2018-10-19 16:13:30', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-10-19 16:13:30', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?post_type=tribe_events&p=108', 0, 'tribe_events', '', 0),
(109, 1, '2018-10-19 16:15:04', '2018-10-19 14:15:04', '*PAGE VORSTAND*', 'Vorstand', '', 'publish', 'closed', 'closed', '', 'vorstand', '', '', '2018-10-19 16:15:04', '2018-10-19 14:15:04', '', 0, 'http://localhost:8080/chanter.ch/?page_id=109', 0, 'page', '', 0),
(110, 1, '2018-10-19 16:15:04', '2018-10-19 14:15:04', '*PAGE VORSTAND*', 'Vorstand', '', 'inherit', 'closed', 'closed', '', '109-revision-v1', '', '', '2018-10-19 16:15:04', '2018-10-19 14:15:04', '', 109, 'http://localhost:8080/chanter.ch/2018/10/19/109-revision-v1/', 0, 'revision', '', 0),
(111, 1, '2018-10-19 16:15:45', '2018-10-19 14:15:45', '*PAGE MUSIKKOMMISSION*', 'Musikkommission', '', 'publish', 'closed', 'closed', '', 'musikkommission', '', '', '2018-10-19 16:15:45', '2018-10-19 14:15:45', '', 0, 'http://localhost:8080/chanter.ch/?page_id=111', 0, 'page', '', 0),
(112, 1, '2018-10-19 16:15:45', '2018-10-19 14:15:45', '*PAGE MUSIKKOMMISSION*', 'Musikkommission', '', 'inherit', 'closed', 'closed', '', '111-revision-v1', '', '', '2018-10-19 16:15:45', '2018-10-19 14:15:45', '', 111, 'http://localhost:8080/chanter.ch/2018/10/19/111-revision-v1/', 0, 'revision', '', 0),
(113, 1, '2018-10-19 16:16:47', '2018-10-19 14:16:47', '*PAGE EHRENMITGLIED*', 'Ehrenmitglied', '', 'publish', 'closed', 'closed', '', 'ehrenmitglied', '', '', '2018-10-22 12:46:49', '2018-10-22 10:46:49', '', 81, 'http://localhost:8080/chanter.ch/?page_id=113', 0, 'page', '', 0),
(114, 1, '2018-10-19 16:16:47', '2018-10-19 14:16:47', '*PAGE EHRENMITGLIED*', 'Ehrenmitglied', '', 'inherit', 'closed', 'closed', '', '113-revision-v1', '', '', '2018-10-19 16:16:47', '2018-10-19 14:16:47', '', 113, 'http://localhost:8080/chanter.ch/2018/10/19/113-revision-v1/', 0, 'revision', '', 0),
(115, 1, '2018-10-19 16:17:29', '2018-10-19 14:17:29', '*PAGE GRUPPEN*', 'Gruppen', '', 'publish', 'closed', 'closed', '', 'gruppen', '', '', '2018-10-22 12:47:44', '2018-10-22 10:47:44', '', 81, 'http://localhost:8080/chanter.ch/?page_id=115', 0, 'page', '', 0),
(116, 1, '2018-10-19 16:17:29', '2018-10-19 14:17:29', '*PAGE GRUPPEN*', 'Gruppen', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2018-10-19 16:17:29', '2018-10-19 14:17:29', '', 115, 'http://localhost:8080/chanter.ch/2018/10/19/115-revision-v1/', 0, 'revision', '', 0),
(118, 1, '2018-10-19 16:19:30', '2018-10-19 14:19:30', ' ', '', '', 'publish', 'closed', 'closed', '', '118', '', '', '2018-10-22 13:45:40', '2018-10-22 11:45:40', '', 81, 'http://localhost:8080/chanter.ch/?p=118', 4, 'nav_menu_item', '', 0),
(119, 1, '2018-10-19 16:19:30', '2018-10-19 14:19:30', ' ', '', '', 'publish', 'closed', 'closed', '', '119', '', '', '2018-10-22 13:45:40', '2018-10-22 11:45:40', '', 81, 'http://localhost:8080/chanter.ch/?p=119', 5, 'nav_menu_item', '', 0),
(120, 1, '2018-10-19 16:19:29', '2018-10-19 14:19:29', ' ', '', '', 'publish', 'closed', 'closed', '', '120', '', '', '2018-10-22 13:45:40', '2018-10-22 11:45:40', '', 0, 'http://localhost:8080/chanter.ch/?p=120', 3, 'nav_menu_item', '', 0),
(121, 1, '2018-10-19 16:19:29', '2018-10-19 14:19:29', ' ', '', '', 'publish', 'closed', 'closed', '', '121', '', '', '2018-10-22 13:45:40', '2018-10-22 11:45:40', '', 0, 'http://localhost:8080/chanter.ch/?p=121', 2, 'nav_menu_item', '', 0),
(122, 1, '2018-10-19 16:18:41', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-10-19 16:18:41', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?p=122', 1, 'nav_menu_item', '', 0),
(123, 1, '2018-10-19 16:20:15', '0000-00-00 00:00:00', '', 'Liste des langues', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-10-19 16:20:15', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?p=123', 1, 'nav_menu_item', '', 0),
(125, 1, '2018-10-19 16:22:48', '2018-10-19 14:22:48', '{\n    \"sidebars_widgets[sidebar-1]\": {\n        \"value\": [\n            \"polylang-3\",\n            \"search-2\",\n            \"recent-posts-2\",\n            \"archives-2\",\n            \"categories-2\",\n            \"meta-2\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-19 14:22:48\"\n    },\n    \"widget_polylang[3]\": {\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo3OntzOjU6InRpdGxlIjtzOjA6IiI7czo4OiJkcm9wZG93biI7aTowO3M6MTA6InNob3dfbmFtZXMiO2k6MDtzOjEwOiJzaG93X2ZsYWdzIjtpOjE7czoxMDoiZm9yY2VfaG9tZSI7aTowO3M6MTI6ImhpZGVfY3VycmVudCI7aTowO3M6MjI6ImhpZGVfaWZfbm9fdHJhbnNsYXRpb24iO2k6MDt9\",\n            \"title\": \"\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"03ee3060a3c7edb64a725b6e5c1e4510\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-19 14:22:48\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'ceb05c5d-52dd-4b12-bbcd-7cd77962e903', '', '', '2018-10-19 16:22:48', '2018-10-19 14:22:48', '', 0, 'http://localhost:8080/chanter.ch/2018/10/19/ceb05c5d-52dd-4b12-bbcd-7cd77962e903/', 0, 'customize_changeset', '', 0),
(126, 1, '2018-10-19 16:24:58', '2018-10-19 14:24:58', '{\n    \"sidebars_widgets[sidebar-2]\": {\n        \"value\": [],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-19 14:24:58\"\n    },\n    \"sidebars_widgets[sidebar-3]\": {\n        \"value\": [\n            \"polylang-6\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-19 14:24:58\"\n    },\n    \"widget_polylang[5]\": {\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo3OntzOjU6InRpdGxlIjtzOjA6IiI7czo4OiJkcm9wZG93biI7aTowO3M6MTA6InNob3dfbmFtZXMiO2k6MTtzOjEwOiJzaG93X2ZsYWdzIjtpOjE7czoxMDoiZm9yY2VfaG9tZSI7aTowO3M6MTI6ImhpZGVfY3VycmVudCI7aTowO3M6MjI6ImhpZGVfaWZfbm9fdHJhbnNsYXRpb24iO2k6MDt9\",\n            \"title\": \"\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"1f5866f84e385031f8f0a9f933e0c412\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-19 14:24:58\"\n    },\n    \"widget_polylang[6]\": {\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo3OntzOjU6InRpdGxlIjtzOjA6IiI7czo4OiJkcm9wZG93biI7aTowO3M6MTA6InNob3dfbmFtZXMiO2k6MTtzOjEwOiJzaG93X2ZsYWdzIjtpOjE7czoxMDoiZm9yY2VfaG9tZSI7aTowO3M6MTI6ImhpZGVfY3VycmVudCI7aTowO3M6MjI6ImhpZGVfaWZfbm9fdHJhbnNsYXRpb24iO2k6MDt9\",\n            \"title\": \"\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"1f5866f84e385031f8f0a9f933e0c412\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-19 14:24:58\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '777ef44e-2221-44d9-8858-250315dbfb2d', '', '', '2018-10-19 16:24:58', '2018-10-19 14:24:58', '', 0, 'http://localhost:8080/chanter.ch/2018/10/19/777ef44e-2221-44d9-8858-250315dbfb2d/', 0, 'customize_changeset', '', 0),
(127, 1, '2018-10-19 16:40:58', '2018-10-19 14:40:58', '[wp_support_plus]', 'Contact', '', 'inherit', 'closed', 'closed', '', '53-revision-v1', '', '', '2018-10-19 16:40:58', '2018-10-19 14:40:58', '', 53, 'http://localhost:8080/chanter.ch/2018/10/19/53-revision-v1/', 0, 'revision', '', 0),
(128, 1, '2018-10-19 16:41:32', '2018-10-19 14:41:32', '[wp_support_plus]', 'Kontakt', '', 'publish', 'closed', 'closed', '', 'kontakt', '', '', '2018-10-19 16:41:41', '2018-10-19 14:41:41', '', 0, 'http://localhost:8080/chanter.ch/?page_id=128', 0, 'page', '', 0),
(129, 1, '2018-10-19 16:41:32', '2018-10-19 14:41:32', '', 'Kontakt', '', 'inherit', 'closed', 'closed', '', '128-revision-v1', '', '', '2018-10-19 16:41:32', '2018-10-19 14:41:32', '', 128, 'http://localhost:8080/chanter.ch/2018/10/19/128-revision-v1/', 0, 'revision', '', 0),
(130, 1, '2018-10-19 16:41:41', '2018-10-19 14:41:41', '[wp_support_plus]', 'Kontakt', '', 'inherit', 'closed', 'closed', '', '128-revision-v1', '', '', '2018-10-19 16:41:41', '2018-10-19 14:41:41', '', 128, 'http://localhost:8080/chanter.ch/2018/10/19/128-revision-v1/', 0, 'revision', '', 0),
(131, 1, '2018-10-19 16:42:05', '2018-10-19 14:42:05', ' ', '', '', 'publish', 'closed', 'closed', '', '131', '', '', '2018-10-22 13:45:42', '2018-10-22 11:45:42', '', 0, 'http://localhost:8080/chanter.ch/?p=131', 20, 'nav_menu_item', '', 0),
(132, 1, '2018-10-19 16:42:21', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-10-19 16:42:21', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?p=132', 1, 'nav_menu_item', '', 0),
(135, 1, '2018-10-19 17:22:18', '2018-10-19 15:22:18', '{\n    \"sidebars_widgets[sidebar-1]\": {\n        \"value\": [\n            \"search-2\",\n            \"recent-posts-2\",\n            \"archives-2\",\n            \"categories-2\",\n            \"meta-2\",\n            \"polylang-6\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-19 15:22:18\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '99843244-75dc-41bd-9bd2-c959051455dd', '', '', '2018-10-19 17:22:18', '2018-10-19 15:22:18', '', 0, 'http://localhost:8080/chanter.ch/2018/10/19/99843244-75dc-41bd-9bd2-c959051455dd/', 0, 'customize_changeset', '', 0),
(136, 1, '2018-10-19 17:22:33', '2018-10-19 15:22:33', '{\n    \"sidebars_widgets[wp_inactive_widgets]\": {\n        \"value\": [\n            \"text-2\",\n            \"text-3\",\n            \"text-4\",\n            \"text-5\",\n            \"polylang-5\",\n            \"polylang-6\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-19 15:22:33\"\n    },\n    \"sidebars_widgets[sidebar-1]\": {\n        \"value\": [\n            \"search-2\",\n            \"recent-posts-2\",\n            \"archives-2\",\n            \"categories-2\",\n            \"meta-2\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-19 15:22:33\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '1d82ca4e-fcc5-4188-a150-da523fd73a41', '', '', '2018-10-19 17:22:33', '2018-10-19 15:22:33', '', 0, 'http://localhost:8080/chanter.ch/2018/10/19/1d82ca4e-fcc5-4188-a150-da523fd73a41/', 0, 'customize_changeset', '', 0),
(137, 1, '2018-10-22 12:21:24', '2018-10-22 10:21:24', '*INFO FETE CANTONALE 2018*', 'Fête cantonale 2018', '', 'publish', 'closed', 'closed', '', 'fete-cantonale-2018', '', '', '2018-10-22 12:21:24', '2018-10-22 10:21:24', '', 0, 'http://localhost:8080/chanter.ch/?page_id=137', 0, 'page', '', 0),
(138, 1, '2018-10-22 12:21:24', '2018-10-22 10:21:24', '*INFO FETE CANTONALE 2018*', 'Fête cantonale 2018', '', 'inherit', 'closed', 'closed', '', '137-revision-v1', '', '', '2018-10-22 12:21:24', '2018-10-22 10:21:24', '', 137, 'http://localhost:8080/chanter.ch/2018/10/22/137-revision-v1/', 0, 'revision', '', 0),
(139, 1, '2018-10-22 12:22:27', '2018-10-22 10:22:27', '*INFO FETE CANTONALE 2018 DE*', 'Kantonale Gesangsfest 2018', '', 'publish', 'closed', 'closed', '', 'kantonale-gesangsfest-2018', '', '', '2018-10-22 12:22:27', '2018-10-22 10:22:27', '', 0, 'http://localhost:8080/chanter.ch/?page_id=139', 0, 'page', '', 0),
(140, 1, '2018-10-22 12:22:27', '2018-10-22 10:22:27', '*INFO FETE CANTONALE 2018 DE*', 'Kantonale Gesangsfest 2018', '', 'inherit', 'closed', 'closed', '', '139-revision-v1', '', '', '2018-10-22 12:22:27', '2018-10-22 10:22:27', '', 139, 'http://localhost:8080/chanter.ch/2018/10/22/139-revision-v1/', 0, 'revision', '', 0),
(141, 1, '2018-10-22 12:23:41', '2018-10-22 10:23:41', ' ', '', '', 'publish', 'closed', 'closed', '', '141', '', '', '2018-10-22 13:09:20', '2018-10-22 11:09:20', '', 0, 'http://localhost:8080/chanter.ch/?p=141', 9, 'nav_menu_item', '', 0),
(142, 1, '2018-10-22 12:25:45', '2018-10-22 10:25:45', '*RECHERCHE DE CHOEURS*', 'Choeurs', '', 'publish', 'closed', 'closed', '', 'choeurs', '', '', '2018-10-22 12:25:45', '2018-10-22 10:25:45', '', 0, 'http://localhost:8080/chanter.ch/?page_id=142', 0, 'page', '', 0),
(143, 1, '2018-10-22 12:25:45', '2018-10-22 10:25:45', '*RECHERCHE DE CHOEURS*', 'Choeurs', '', 'inherit', 'closed', 'closed', '', '142-revision-v1', '', '', '2018-10-22 12:25:45', '2018-10-22 10:25:45', '', 142, 'http://localhost:8080/chanter.ch/2018/10/22/142-revision-v1/', 0, 'revision', '', 0),
(144, 1, '2018-10-22 12:26:33', '2018-10-22 10:26:33', '*RECHERCHE DE CHOEURS DE*', 'Chöre', '', 'publish', 'closed', 'closed', '', 'chore', '', '', '2018-10-22 12:26:33', '2018-10-22 10:26:33', '', 0, 'http://localhost:8080/chanter.ch/?page_id=144', 0, 'page', '', 0),
(145, 1, '2018-10-22 12:26:33', '2018-10-22 10:26:33', '*RECHERCHE DE CHOEURS DE*', 'Chöre', '', 'inherit', 'closed', 'closed', '', '144-revision-v1', '', '', '2018-10-22 12:26:33', '2018-10-22 10:26:33', '', 144, 'http://localhost:8080/chanter.ch/2018/10/22/144-revision-v1/', 0, 'revision', '', 0),
(146, 1, '2018-10-22 12:27:53', '2018-10-22 10:27:53', '*FORMULAIRE MISE A JOUR CHOEUR*', 'Mettre à jour un choeur', '', 'publish', 'closed', 'closed', '', 'mettre-a-jour-un-choeur', '', '', '2018-10-22 12:53:52', '2018-10-22 10:53:52', '', 142, 'http://localhost:8080/chanter.ch/?page_id=146', 0, 'page', '', 0),
(147, 1, '2018-10-22 12:27:53', '2018-10-22 10:27:53', '*FORMULAIRE MISE A JOUR CHOEUR*', 'Mettre à jour un choeur', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2018-10-22 12:27:53', '2018-10-22 10:27:53', '', 146, 'http://localhost:8080/chanter.ch/2018/10/22/146-revision-v1/', 0, 'revision', '', 0),
(148, 1, '2018-10-22 12:29:08', '2018-10-22 10:29:08', '*FORMULAIRE MISE A JOUR CHOEUR DE*', 'Aktualisierung der Chöre', '', 'publish', 'closed', 'closed', '', 'aktualisierung-der-chore', '', '', '2018-10-22 12:44:35', '2018-10-22 10:44:35', '', 144, 'http://localhost:8080/chanter.ch/?page_id=148', 0, 'page', '', 0),
(149, 1, '2018-10-22 12:29:08', '2018-10-22 10:29:08', '*FORMULAIRE MISE A JOUR CHOEUR DE*', 'Aktualisierung der Chöre', '', 'inherit', 'closed', 'closed', '', '148-revision-v1', '', '', '2018-10-22 12:29:08', '2018-10-22 10:29:08', '', 148, 'http://localhost:8080/chanter.ch/2018/10/22/148-revision-v1/', 0, 'revision', '', 0),
(150, 1, '2018-10-22 12:29:16', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', '0', 'closed', '', '', '', '', '2018-10-22 12:29:16', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?page_id=150', 0, 'page', '', 0),
(151, 1, '2018-10-22 12:31:00', '2018-10-22 10:31:00', '', 'Projets musicaux', '', 'publish', 'closed', 'closed', '', 'projets-musicaux', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 0, 'http://localhost:8080/chanter.ch/?p=151', 13, 'nav_menu_item', '', 0),
(152, 1, '2018-10-22 12:31:57', '2018-10-22 10:31:57', '*DESCRIPTION PROJET*', 'Choeur en Herbe 2018', '', 'publish', 'closed', 'closed', '', 'choeur-en-herbe-2018', '', '', '2018-10-22 12:32:46', '2018-10-22 10:32:46', '', 0, 'http://localhost:8080/chanter.ch/?page_id=152', 0, 'page', '', 0),
(153, 1, '2018-10-22 12:31:57', '2018-10-22 10:31:57', '*DESCRIPTION PROJET*', 'Choeur en Herbe 2018', '', 'inherit', 'closed', 'closed', '', '152-revision-v1', '', '', '2018-10-22 12:31:57', '2018-10-22 10:31:57', '', 152, 'http://localhost:8080/chanter.ch/2018/10/22/152-revision-v1/', 0, 'revision', '', 0),
(154, 1, '2018-10-22 12:32:26', '2018-10-22 10:32:26', '*DESCRIPTION PROJET DE*', 'Lager 2018', '', 'inherit', 'closed', 'closed', '', '152-revision-v1', '', '', '2018-10-22 12:32:26', '2018-10-22 10:32:26', '', 152, 'http://localhost:8080/chanter.ch/2018/10/22/152-revision-v1/', 0, 'revision', '', 0),
(155, 1, '2018-10-22 12:32:46', '2018-10-22 10:32:46', '*DESCRIPTION PROJET*', 'Choeur en Herbe 2018', '', 'inherit', 'closed', 'closed', '', '152-revision-v1', '', '', '2018-10-22 12:32:46', '2018-10-22 10:32:46', '', 152, 'http://localhost:8080/chanter.ch/2018/10/22/152-revision-v1/', 0, 'revision', '', 0),
(156, 1, '2018-10-22 12:33:06', '2018-10-22 10:33:06', '*DESCRIPTION PROJET DE*', 'Lager 2018', '', 'publish', 'closed', 'closed', '', 'lager-2018', '', '', '2018-10-22 12:33:06', '2018-10-22 10:33:06', '', 0, 'http://localhost:8080/chanter.ch/?page_id=156', 0, 'page', '', 0),
(157, 1, '2018-10-22 12:33:06', '2018-10-22 10:33:06', '*DESCRIPTION PROJET DE*', 'Lager 2018', '', 'inherit', 'closed', 'closed', '', '156-revision-v1', '', '', '2018-10-22 12:33:06', '2018-10-22 10:33:06', '', 156, 'http://localhost:8080/chanter.ch/2018/10/22/156-revision-v1/', 0, 'revision', '', 0),
(158, 1, '2018-10-22 12:34:56', '2018-10-22 10:34:56', '*PLAN 2018-2019*', 'Plan général de formation 2018-2019', '', 'publish', 'closed', 'closed', '', 'plan-general-de-formation-2018-2019', '', '', '2018-10-22 12:34:56', '2018-10-22 10:34:56', '', 0, 'http://localhost:8080/chanter.ch/?page_id=158', 0, 'page', '', 0),
(159, 1, '2018-10-22 12:34:56', '2018-10-22 10:34:56', '*PLAN 2018-2019*', 'Plan général de formation 2018-2019', '', 'inherit', 'closed', 'closed', '', '158-revision-v1', '', '', '2018-10-22 12:34:56', '2018-10-22 10:34:56', '', 158, 'http://localhost:8080/chanter.ch/2018/10/22/158-revision-v1/', 0, 'revision', '', 0),
(160, 1, '2018-10-22 12:36:02', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', '0', 'closed', '', '', '', '', '2018-10-22 12:36:02', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?page_id=160', 0, 'page', '', 0),
(161, 1, '2018-10-22 12:36:34', '2018-10-22 10:36:34', '*PLAN 2018-2019 DE*', 'Allgemeiner Ausbildungsplan', '', 'publish', 'closed', 'closed', '', 'allgemeiner-ausbildungsplan', '', '', '2018-10-22 12:36:34', '2018-10-22 10:36:34', '', 0, 'http://localhost:8080/chanter.ch/?page_id=161', 0, 'page', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(162, 1, '2018-10-22 12:36:34', '2018-10-22 10:36:34', '*PLAN 2018-2019 DE*', 'Allgemeiner Ausbildungsplan', '', 'inherit', 'closed', 'closed', '', '161-revision-v1', '', '', '2018-10-22 12:36:34', '2018-10-22 10:36:34', '', 161, 'http://localhost:8080/chanter.ch/2018/10/22/161-revision-v1/', 0, 'revision', '', 0),
(163, 1, '2018-10-22 12:36:55', '2018-10-22 10:36:55', '*DESCRIPTION*', 'Travail vocal en chorale', '', 'publish', 'closed', 'closed', '', 'travail-vocal-en-chorale', '', '', '2018-10-22 12:36:55', '2018-10-22 10:36:55', '', 0, 'http://localhost:8080/chanter.ch/?page_id=163', 0, 'page', '', 0),
(164, 1, '2018-10-22 12:36:55', '2018-10-22 10:36:55', '*DESCRIPTION*', 'Travail vocal en chorale', '', 'inherit', 'closed', 'closed', '', '163-revision-v1', '', '', '2018-10-22 12:36:55', '2018-10-22 10:36:55', '', 163, 'http://localhost:8080/chanter.ch/2018/10/22/163-revision-v1/', 0, 'revision', '', 0),
(165, 1, '2018-10-22 12:37:30', '2018-10-22 10:37:30', '*DESCRIPTION DE*', 'Stimmbildung im Chor', '', 'publish', 'closed', 'closed', '', 'stimmbildung-im-chor', '', '', '2018-10-22 12:37:30', '2018-10-22 10:37:30', '', 0, 'http://localhost:8080/chanter.ch/?page_id=165', 0, 'page', '', 0),
(166, 1, '2018-10-22 12:37:30', '2018-10-22 10:37:30', '*DESCRIPTION DE*', 'Stimmbildung im Chor', '', 'inherit', 'closed', 'closed', '', '165-revision-v1', '', '', '2018-10-22 12:37:30', '2018-10-22 10:37:30', '', 165, 'http://localhost:8080/chanter.ch/2018/10/22/165-revision-v1/', 0, 'revision', '', 0),
(167, 1, '2018-10-22 12:38:03', '2018-10-22 10:38:03', '*DESCRIPTION CONFERENCE*', 'Conférence 2018 - Mouvement et musique', '', 'publish', 'closed', 'closed', '', 'conference-2018-mouvement-et-musique', '', '', '2018-10-22 12:38:03', '2018-10-22 10:38:03', '', 0, 'http://localhost:8080/chanter.ch/?page_id=167', 0, 'page', '', 0),
(168, 1, '2018-10-22 12:38:03', '2018-10-22 10:38:03', '*DESCRIPTION CONFERENCE*', 'Conférence 2018 - Mouvement et musique', '', 'inherit', 'closed', 'closed', '', '167-revision-v1', '', '', '2018-10-22 12:38:03', '2018-10-22 10:38:03', '', 167, 'http://localhost:8080/chanter.ch/2018/10/22/167-revision-v1/', 0, 'revision', '', 0),
(169, 1, '2018-10-22 12:38:07', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', '0', 'closed', '', '', '', '', '2018-10-22 12:38:07', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?page_id=169', 0, 'page', '', 0),
(170, 1, '2018-10-22 12:38:54', '2018-10-22 10:38:54', '*DESCRIPTION DE*', 'Weiterbildungs - Wochenende für Chöre', '', 'publish', 'closed', 'closed', '', 'weiterbildungs-wochenende-fur-chore', '', '', '2018-10-22 12:38:54', '2018-10-22 10:38:54', '', 0, 'http://localhost:8080/chanter.ch/?page_id=170', 0, 'page', '', 0),
(171, 1, '2018-10-22 12:38:54', '2018-10-22 10:38:54', '*DESCRIPTION DE*', 'Weiterbildungs - Wochenende für Chöre', '', 'inherit', 'closed', 'closed', '', '170-revision-v1', '', '', '2018-10-22 12:38:54', '2018-10-22 10:38:54', '', 170, 'http://localhost:8080/chanter.ch/2018/10/22/170-revision-v1/', 0, 'revision', '', 0),
(172, 1, '2018-10-22 12:39:40', '2018-10-22 10:39:40', '*DESCRIPTION SKJF DE*', 'SKJF', '', 'publish', 'closed', 'closed', '', 'skjf', '', '', '2018-10-22 12:39:40', '2018-10-22 10:39:40', '', 0, 'http://localhost:8080/chanter.ch/?page_id=172', 0, 'page', '', 0),
(173, 1, '2018-10-22 12:39:40', '2018-10-22 10:39:40', '*DESCRIPTION SKJF DE*', 'SKJF', '', 'inherit', 'closed', 'closed', '', '172-revision-v1', '', '', '2018-10-22 12:39:40', '2018-10-22 10:39:40', '', 172, 'http://localhost:8080/chanter.ch/2018/10/22/172-revision-v1/', 0, 'revision', '', 0),
(174, 1, '2018-10-22 12:39:49', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', '0', 'closed', '', '', '', '', '2018-10-22 12:39:49', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?page_id=174', 0, 'page', '', 0),
(175, 1, '2018-10-22 12:40:48', '2018-10-22 10:40:48', '*DESCRIPTION*', 'ASJC', '', 'publish', 'closed', 'closed', '', 'asjc', '', '', '2018-10-22 12:40:48', '2018-10-22 10:40:48', '', 0, 'http://localhost:8080/chanter.ch/?page_id=175', 0, 'page', '', 0),
(176, 1, '2018-10-22 12:40:48', '2018-10-22 10:40:48', '*DESCRIPTION*', 'ASJC', '', 'inherit', 'closed', 'closed', '', '175-revision-v1', '', '', '2018-10-22 12:40:48', '2018-10-22 10:40:48', '', 175, 'http://localhost:8080/chanter.ch/2018/10/22/175-revision-v1/', 0, 'revision', '', 0),
(177, 1, '2018-10-22 12:42:04', '2018-10-22 10:42:04', '*DESCRIPTION*', 'Forum des présidents et contrats', '', 'publish', 'closed', 'closed', '', 'forum-des-presidents-et-contrats', '', '', '2018-10-22 12:42:04', '2018-10-22 10:42:04', '', 0, 'http://localhost:8080/chanter.ch/?page_id=177', 0, 'page', '', 0),
(178, 1, '2018-10-22 12:42:04', '2018-10-22 10:42:04', '*DESCRIPTION*', 'Forum des présidents et contrats', '', 'inherit', 'closed', 'closed', '', '177-revision-v1', '', '', '2018-10-22 12:42:04', '2018-10-22 10:42:04', '', 177, 'http://localhost:8080/chanter.ch/2018/10/22/177-revision-v1/', 0, 'revision', '', 0),
(179, 1, '2018-10-22 12:42:31', '2018-10-22 10:42:31', '*DESCRIPTION*', 'Présentation AVCC', '', 'publish', 'closed', 'closed', '', 'presentation-avcc', '', '', '2018-10-22 12:42:31', '2018-10-22 10:42:31', '', 0, 'http://localhost:8080/chanter.ch/?page_id=179', 0, 'page', '', 0),
(180, 1, '2018-10-22 12:42:31', '2018-10-22 10:42:31', '*DESCRIPTION*', 'Présentation AVCC', '', 'inherit', 'closed', 'closed', '', '179-revision-v1', '', '', '2018-10-22 12:42:31', '2018-10-22 10:42:31', '', 179, 'http://localhost:8080/chanter.ch/2018/10/22/179-revision-v1/', 0, 'revision', '', 0),
(181, 1, '2018-10-22 12:42:46', '2018-10-22 10:42:46', '*DESCRIPTION*', 'Historique AVCC', '', 'publish', 'closed', 'closed', '', 'historique-avcc', '', '', '2018-10-22 12:47:55', '2018-10-22 10:47:55', '', 179, 'http://localhost:8080/chanter.ch/?page_id=181', 0, 'page', '', 0),
(182, 1, '2018-10-22 12:42:46', '2018-10-22 10:42:46', '*DESCRIPTION*', 'Historique AVCC', '', 'inherit', 'closed', 'closed', '', '181-revision-v1', '', '', '2018-10-22 12:42:46', '2018-10-22 10:42:46', '', 181, 'http://localhost:8080/chanter.ch/2018/10/22/181-revision-v1/', 0, 'revision', '', 0),
(183, 1, '2018-10-22 12:43:17', '2018-10-22 10:43:17', '*DESCRIPTION*', 'Comité AVCC', '', 'publish', 'closed', 'closed', '', 'comite-avcc', '', '', '2018-10-22 12:43:17', '2018-10-22 10:43:17', '', 179, 'http://localhost:8080/chanter.ch/?page_id=183', 0, 'page', '', 0),
(184, 1, '2018-10-22 12:43:17', '2018-10-22 10:43:17', '*DESCRIPTION*', 'Comité AVCC', '', 'inherit', 'closed', 'closed', '', '183-revision-v1', '', '', '2018-10-22 12:43:17', '2018-10-22 10:43:17', '', 183, 'http://localhost:8080/chanter.ch/2018/10/22/183-revision-v1/', 0, 'revision', '', 0),
(185, 1, '2018-10-22 12:43:54', '2018-10-22 10:43:54', '*DESCRIPTION*', 'Fonds choral et Foyer AVCC', '', 'publish', 'closed', 'closed', '', 'fonds-choral-et-foyer-avcc', '', '', '2018-10-22 12:43:54', '2018-10-22 10:43:54', '', 179, 'http://localhost:8080/chanter.ch/?page_id=185', 0, 'page', '', 0),
(186, 1, '2018-10-22 12:43:54', '2018-10-22 10:43:54', '*DESCRIPTION*', 'Fonds choral et Foyer AVCC', '', 'inherit', 'closed', 'closed', '', '185-revision-v1', '', '', '2018-10-22 12:43:54', '2018-10-22 10:43:54', '', 185, 'http://localhost:8080/chanter.ch/2018/10/22/185-revision-v1/', 0, 'revision', '', 0),
(187, 1, '2018-10-22 12:44:13', '2018-10-22 10:44:13', '*DESCRIPTION*', 'Prochaine formation AVCC', '', 'publish', 'closed', 'closed', '', 'prochaine-formation-avcc', '', '', '2018-10-22 12:44:13', '2018-10-22 10:44:13', '', 179, 'http://localhost:8080/chanter.ch/?page_id=187', 0, 'page', '', 0),
(188, 1, '2018-10-22 12:44:13', '2018-10-22 10:44:13', '*DESCRIPTION*', 'Prochaine formation AVCC', '', 'inherit', 'closed', 'closed', '', '187-revision-v1', '', '', '2018-10-22 12:44:13', '2018-10-22 10:44:13', '', 187, 'http://localhost:8080/chanter.ch/2018/10/22/187-revision-v1/', 0, 'revision', '', 0),
(189, 1, '2018-10-22 12:47:26', '2018-10-22 10:47:26', '*PAGE GROUPEMENTS*', 'Groupements', '', 'inherit', 'closed', 'closed', '', '91-revision-v1', '', '', '2018-10-22 12:47:26', '2018-10-22 10:47:26', '', 91, 'http://localhost:8080/chanter.ch/2018/10/22/91-revision-v1/', 0, 'revision', '', 0),
(190, 1, '2018-10-22 12:50:41', '2018-10-22 10:50:41', ' ', '', '', 'publish', 'closed', 'closed', '', '190', '', '', '2018-10-22 13:09:20', '2018-10-22 11:09:20', '', 0, 'http://localhost:8080/chanter.ch/?p=190', 6, 'nav_menu_item', '', 0),
(191, 1, '2018-10-22 12:50:41', '2018-10-22 10:50:41', ' ', '', '', 'publish', 'closed', 'closed', '', '191', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 0, 'http://localhost:8080/chanter.ch/?p=191', 14, 'nav_menu_item', '', 0),
(192, 1, '2018-10-22 12:50:42', '2018-10-22 10:50:42', '', 'Formations', '', 'publish', 'closed', 'closed', '', 'formations', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 0, 'http://localhost:8080/chanter.ch/?p=192', 15, 'nav_menu_item', '', 0),
(193, 1, '2018-10-22 12:52:45', '2018-10-22 10:52:45', '', 'Conférence 2018 – Mouvement et musique', '', 'publish', 'closed', 'closed', '', 'conference-2018-mouvement-et-musique', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 0, 'http://localhost:8080/chanter.ch/?p=193', 17, 'nav_menu_item', '', 0),
(194, 1, '2018-10-22 12:52:45', '2018-10-22 10:52:45', ' ', '', '', 'publish', 'closed', 'closed', '', '194', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 0, 'http://localhost:8080/chanter.ch/?p=194', 16, 'nav_menu_item', '', 0),
(195, 1, '2018-10-22 12:52:45', '2018-10-22 10:52:45', ' ', '', '', 'publish', 'closed', 'closed', '', '195', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 0, 'http://localhost:8080/chanter.ch/?p=195', 18, 'nav_menu_item', '', 0),
(196, 1, '2018-10-22 12:51:34', '0000-00-00 00:00:00', '', 'Chefs de choeurs', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-10-22 12:51:34', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?p=196', 1, 'nav_menu_item', '', 0),
(197, 1, '2018-10-22 12:52:45', '2018-10-22 10:52:45', '', 'Chefs de choeurs', '', 'publish', 'closed', 'closed', '', 'chefs-de-choeurs', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 0, 'http://localhost:8080/chanter.ch/?p=197', 19, 'nav_menu_item', '', 0),
(198, 1, '2018-10-22 12:52:46', '2018-10-22 10:52:46', ' ', '', '', 'publish', 'closed', 'closed', '', '198', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 179, 'http://localhost:8080/chanter.ch/?p=198', 21, 'nav_menu_item', '', 0),
(199, 1, '2018-10-22 12:52:46', '2018-10-22 10:52:46', ' ', '', '', 'publish', 'closed', 'closed', '', '199', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 179, 'http://localhost:8080/chanter.ch/?p=199', 22, 'nav_menu_item', '', 0),
(200, 1, '2018-10-22 12:52:45', '2018-10-22 10:52:45', ' ', '', '', 'publish', 'closed', 'closed', '', '200', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 179, 'http://localhost:8080/chanter.ch/?p=200', 20, 'nav_menu_item', '', 0),
(201, 1, '2018-10-22 12:52:47', '2018-10-22 10:52:47', ' ', '', '', 'publish', 'closed', 'closed', '', '201', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 179, 'http://localhost:8080/chanter.ch/?p=201', 23, 'nav_menu_item', '', 0),
(202, 1, '2018-10-22 12:54:16', '2018-10-22 10:54:16', ' ', '', '', 'publish', 'closed', 'closed', '', '202', '', '', '2018-10-22 13:09:20', '2018-10-22 11:09:20', '', 142, 'http://localhost:8080/chanter.ch/?p=202', 7, 'nav_menu_item', '', 0),
(203, 1, '2018-10-22 12:56:50', '2018-10-22 10:56:50', ' ', '', '', 'publish', 'closed', 'closed', '', '203', '', '', '2018-10-22 13:45:41', '2018-10-22 11:45:41', '', 0, 'http://localhost:8080/chanter.ch/?p=203', 6, 'nav_menu_item', '', 0),
(204, 1, '2018-10-22 12:56:51', '2018-10-22 10:56:51', ' ', '', '', 'publish', 'closed', 'closed', '', '204', '', '', '2018-10-22 13:45:41', '2018-10-22 11:45:41', '', 144, 'http://localhost:8080/chanter.ch/?p=204', 7, 'nav_menu_item', '', 0),
(205, 1, '2018-10-22 12:56:51', '2018-10-22 10:56:51', ' ', '', '', 'publish', 'closed', 'closed', '', '205', '', '', '2018-10-22 13:45:41', '2018-10-22 11:45:41', '', 0, 'http://localhost:8080/chanter.ch/?p=205', 9, 'nav_menu_item', '', 0),
(206, 1, '2018-10-22 12:56:52', '2018-10-22 10:56:52', '', 'Musikalische Projekte', '', 'publish', 'closed', 'closed', '', 'musikalische-projekte', '', '', '2018-10-22 13:45:42', '2018-10-22 11:45:42', '', 0, 'http://localhost:8080/chanter.ch/?p=206', 13, 'nav_menu_item', '', 0),
(207, 1, '2018-10-22 12:56:52', '2018-10-22 10:56:52', ' ', '', '', 'publish', 'closed', 'closed', '', '207', '', '', '2018-10-22 13:45:42', '2018-10-22 11:45:42', '', 0, 'http://localhost:8080/chanter.ch/?p=207', 14, 'nav_menu_item', '', 0),
(208, 1, '2018-10-22 12:56:52', '2018-10-22 10:56:52', '', 'Ausbildungen', '', 'publish', 'closed', 'closed', '', 'ausbildungen', '', '', '2018-10-22 13:45:42', '2018-10-22 11:45:42', '', 0, 'http://localhost:8080/chanter.ch/?p=208', 15, 'nav_menu_item', '', 0),
(209, 1, '2018-10-22 12:56:53', '2018-10-22 10:56:53', ' ', '', '', 'publish', 'closed', 'closed', '', '209', '', '', '2018-10-22 13:45:42', '2018-10-22 11:45:42', '', 0, 'http://localhost:8080/chanter.ch/?p=209', 16, 'nav_menu_item', '', 0),
(210, 1, '2018-10-22 12:56:53', '2018-10-22 10:56:53', ' ', '', '', 'publish', 'closed', 'closed', '', '210', '', '', '2018-10-22 13:45:42', '2018-10-22 11:45:42', '', 0, 'http://localhost:8080/chanter.ch/?p=210', 17, 'nav_menu_item', '', 0),
(211, 1, '2018-10-22 12:56:53', '2018-10-22 10:56:53', '', 'Weiterbildungs – Wochenende für Chöre', '', 'publish', 'closed', 'closed', '', 'weiterbildungs-wochenende-fur-chore', '', '', '2018-10-22 13:45:42', '2018-10-22 11:45:42', '', 0, 'http://localhost:8080/chanter.ch/?p=211', 18, 'nav_menu_item', '', 0),
(212, 1, '2018-10-22 12:56:53', '2018-10-22 10:56:53', ' ', '', '', 'publish', 'closed', 'closed', '', '212', '', '', '2018-10-22 13:45:42', '2018-10-22 11:45:42', '', 0, 'http://localhost:8080/chanter.ch/?p=212', 19, 'nav_menu_item', '', 0),
(213, 1, '2018-10-22 12:57:15', '2018-10-22 10:57:15', ' ', '', '', 'publish', 'closed', 'closed', '', '213', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 0, 'http://localhost:8080/chanter.ch/?p=213', 24, 'nav_menu_item', '', 0),
(214, 1, '2018-10-22 13:05:09', '2018-10-22 11:05:09', ' ', '', '', 'publish', 'closed', 'closed', '', '214', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 0, 'http://localhost:8080/chanter.ch/?p=214', 10, 'nav_menu_item', '', 0),
(215, 1, '2018-10-22 13:05:09', '2018-10-22 11:05:09', ' ', '', '', 'publish', 'closed', 'closed', '', '215', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 0, 'http://localhost:8080/chanter.ch/?p=215', 11, 'nav_menu_item', '', 0),
(216, 1, '2018-10-22 13:05:10', '2018-10-22 11:05:10', ' ', '', '', 'publish', 'closed', 'closed', '', '216', '', '', '2018-10-22 13:09:21', '2018-10-22 11:09:21', '', 0, 'http://localhost:8080/chanter.ch/?p=216', 12, 'nav_menu_item', '', 0),
(217, 1, '2018-10-22 13:05:09', '2018-10-22 11:05:09', '', 'Calendrier', '', 'publish', 'closed', 'closed', '', 'calendrier', '', '', '2018-10-22 13:09:20', '2018-10-22 11:09:20', '', 0, 'http://localhost:8080/chanter.ch/?p=217', 8, 'nav_menu_item', '', 0),
(218, 1, '2018-10-22 13:11:27', '0000-00-00 00:00:00', '{\n    \"tribe_customizer[widget][calendar_header_color]\": {\n        \"value\": \"#999999\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-22 11:11:27\"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', '4dff6147-3ee2-4af4-b18a-403313f4705c', '', '', '2018-10-22 13:11:27', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?p=218', 0, 'customize_changeset', '', 0),
(219, 1, '2018-10-22 13:16:30', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-10-22 13:16:30', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/chanter.ch/?post_type=tribe_events&p=219', 0, 'tribe_events', '', 0),
(220, 1, '2018-10-22 13:16:42', '2018-10-22 11:16:42', '', 'evenement de', '', 'publish', 'closed', 'closed', '', 'evenement-de', '', '', '2018-10-22 13:16:42', '2018-10-22 11:16:42', '', 0, 'http://localhost:8080/chanter.ch/?post_type=tribe_events&#038;p=220', 0, 'tribe_events', '', 0),
(221, 1, '2018-10-22 13:16:42', '2018-10-22 11:16:42', '', 'evenement de', '', 'inherit', 'closed', 'closed', '', '220-revision-v1', '', '', '2018-10-22 13:16:42', '2018-10-22 11:16:42', '', 220, 'http://localhost:8080/chanter.ch/2018/10/22/220-revision-v1/', 0, 'revision', '', 0),
(222, 1, '2018-10-22 13:33:24', '2018-10-22 11:33:24', '{\n    \"radiate::header_image\": {\n        \"value\": \"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/cropped-photo_2018-10-21_23-56-40.jpg\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-22 11:33:24\"\n    },\n    \"radiate::header_image_data\": {\n        \"value\": {\n            \"url\": \"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/cropped-photo_2018-10-21_23-56-40.jpg\",\n            \"thumbnail_url\": \"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/cropped-photo_2018-10-21_23-56-40.jpg\",\n            \"timestamp\": 1540207996621,\n            \"attachment_id\": 224,\n            \"width\": 1024,\n            \"height\": 308\n        },\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-22 11:33:24\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'f1c2faa6-1f67-4145-a78c-79d1fae1816b', '', '', '2018-10-22 13:33:24', '2018-10-22 11:33:24', '', 0, 'http://localhost:8080/chanter.ch/?p=222', 0, 'customize_changeset', '', 0),
(223, 1, '2018-10-22 13:33:06', '2018-10-22 11:33:06', '', 'photo_2018-10-21_23-56-40', '', 'inherit', 'closed', 'closed', '', 'photo_2018-10-21_23-56-40', '', '', '2018-10-22 13:33:06', '2018-10-22 11:33:06', '', 0, 'http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/photo_2018-10-21_23-56-40.jpg', 0, 'attachment', 'image/jpeg', 0),
(224, 1, '2018-10-22 13:33:15', '2018-10-22 11:33:15', '', 'cropped-photo_2018-10-21_23-56-40.jpg', '', 'inherit', 'closed', 'closed', '', 'cropped-photo_2018-10-21_23-56-40-jpg', '', '', '2018-10-22 13:33:15', '2018-10-22 11:33:15', '', 0, 'http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/cropped-photo_2018-10-21_23-56-40.jpg', 0, 'attachment', 'image/jpeg', 0),
(225, 1, '2018-10-22 13:36:27', '2018-10-22 11:36:27', '', '14598211520_bbbc43b0f1_o', '', 'inherit', 'closed', 'closed', '', '14598211520_bbbc43b0f1_o', '', '', '2018-10-22 13:36:27', '2018-10-22 11:36:27', '', 0, 'http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/14598211520_bbbc43b0f1_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(226, 1, '2018-10-22 13:36:34', '2018-10-22 11:36:34', '', 'cropped-14598211520_bbbc43b0f1_o.jpg', '', 'inherit', 'closed', 'closed', '', 'cropped-14598211520_bbbc43b0f1_o-jpg', '', '', '2018-10-22 13:36:34', '2018-10-22 11:36:34', '', 0, 'http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/cropped-14598211520_bbbc43b0f1_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(227, 1, '2018-10-22 13:36:41', '2018-10-22 11:36:41', '{\n    \"radiate::header_image\": {\n        \"value\": \"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/cropped-14598211520_bbbc43b0f1_o.jpg\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-22 11:36:35\"\n    },\n    \"radiate::header_image_data\": {\n        \"value\": {\n            \"url\": \"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/cropped-14598211520_bbbc43b0f1_o.jpg\",\n            \"thumbnail_url\": \"http://localhost:8080/chanter.ch/wp-content/uploads/2018/10/cropped-14598211520_bbbc43b0f1_o.jpg\",\n            \"timestamp\": 1540208194760,\n            \"attachment_id\": 226,\n            \"width\": 1340,\n            \"height\": 402\n        },\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-22 11:36:35\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '980a36a5-9b42-4008-b5e1-3af4d805eaac', '', '', '2018-10-22 13:36:41', '2018-10-22 11:36:41', '', 0, 'http://localhost:8080/chanter.ch/?p=227', 0, 'customize_changeset', '', 0),
(228, 1, '2018-10-22 13:37:40', '2018-10-22 11:37:40', '{\n    \"radiate::background_color\": {\n        \"value\": \"#eded9a\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-22 11:37:40\"\n    },\n    \"radiate::radiate_color_scheme\": {\n        \"value\": \"#efe637\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-22 11:37:40\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '11c3be8b-ebdf-4efc-b67c-d878330a5bb0', '', '', '2018-10-22 13:37:40', '2018-10-22 11:37:40', '', 0, 'http://localhost:8080/chanter.ch/2018/10/22/11c3be8b-ebdf-4efc-b67c-d878330a5bb0/', 0, 'customize_changeset', '', 0),
(229, 1, '2018-10-22 13:38:24', '2018-10-22 11:38:24', '{\n    \"radiate::background_color\": {\n        \"value\": \"#ededd3\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-22 11:38:24\"\n    },\n    \"radiate::radiate_color_scheme\": {\n        \"value\": \"#dba800\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-22 11:38:24\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'b755a2d3-1ae2-48b3-b745-e9c4adbd78f9', '', '', '2018-10-22 13:38:24', '2018-10-22 11:38:24', '', 0, 'http://localhost:8080/chanter.ch/2018/10/22/b755a2d3-1ae2-48b3-b745-e9c4adbd78f9/', 0, 'customize_changeset', '', 0),
(230, 1, '2018-10-22 13:38:41', '2018-10-22 11:38:41', '{\n    \"radiate::background_color\": {\n        \"value\": \"#ffffff\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-22 11:38:41\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'b83333dc-83a0-4aba-8272-334b9b1a3df0', '', '', '2018-10-22 13:38:41', '2018-10-22 11:38:41', '', 0, 'http://localhost:8080/chanter.ch/2018/10/22/b83333dc-83a0-4aba-8272-334b9b1a3df0/', 0, 'customize_changeset', '', 0),
(231, 1, '2018-10-22 13:39:06', '2018-10-22 11:39:06', '{\n    \"radiate::background_color\": {\n        \"value\": \"#eaeaea\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-22 11:39:06\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'f8663c85-656c-4485-b9ff-b7250a5f59f0', '', '', '2018-10-22 13:39:06', '2018-10-22 11:39:06', '', 0, 'http://localhost:8080/chanter.ch/2018/10/22/f8663c85-656c-4485-b9ff-b7250a5f59f0/', 0, 'customize_changeset', '', 0),
(232, 1, '2018-10-22 13:39:48', '2018-10-22 11:39:48', '{\n    \"radiate::background_color\": {\n        \"value\": \"#f7f7f7\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-22 11:39:48\"\n    },\n    \"radiate::radiate_color_scheme\": {\n        \"value\": \"#d1b17b\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-22 11:39:48\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'e74c75d3-873d-4510-8ff5-5f8220586859', '', '', '2018-10-22 13:39:48', '2018-10-22 11:39:48', '', 0, 'http://localhost:8080/chanter.ch/2018/10/22/e74c75d3-873d-4510-8ff5-5f8220586859/', 0, 'customize_changeset', '', 0),
(236, 1, '2018-10-22 13:43:12', '2018-10-22 11:43:12', '', 'Kalendar', '', 'publish', 'closed', 'closed', '', 'kalendar', '', '', '2018-10-22 13:45:41', '2018-10-22 11:45:41', '', 0, 'http://localhost:8080/chanter.ch/?p=236', 8, 'nav_menu_item', '', 0),
(237, 1, '2018-10-22 13:45:42', '2018-10-22 11:45:42', ' ', '', '', 'publish', 'closed', 'closed', '', '237', '', '', '2018-10-22 13:45:42', '2018-10-22 11:45:42', '', 0, 'http://localhost:8080/chanter.ch/?p=237', 12, 'nav_menu_item', '', 0),
(238, 1, '2018-10-22 13:45:41', '2018-10-22 11:45:41', ' ', '', '', 'publish', 'closed', 'closed', '', '238', '', '', '2018-10-22 13:45:41', '2018-10-22 11:45:41', '', 0, 'http://localhost:8080/chanter.ch/?p=238', 11, 'nav_menu_item', '', 0),
(239, 1, '2018-10-22 13:45:41', '2018-10-22 11:45:41', ' ', '', '', 'publish', 'closed', 'closed', '', '239', '', '', '2018-10-22 13:45:41', '2018-10-22 11:45:41', '', 0, 'http://localhost:8080/chanter.ch/?p=239', 10, 'nav_menu_item', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Non classé', 'non-classe', 0),
(2, 'Haut-Valais', 'haut-valais', 0),
(3, 'Valais Central', 'valais-central', 0),
(4, 'Bas Valais', 'bas-valais', 0),
(5, 'Menu_principal_fr', 'menu_principal_fr', 0),
(6, 'Français', 'fr', 0),
(7, 'Français', 'pll_fr', 0),
(8, 'pll_5bc9ddcf993e7', 'pll_5bc9ddcf993e7', 0),
(9, 'Deutsch', 'de', 1),
(10, 'Deutsch', 'pll_de', 0),
(11, 'Non classé', 'non-classe-de', 0),
(13, 'pll_5bc9e3d0948cb', 'pll_5bc9e3d0948cb', 0),
(14, 'Hauptmenu_de', 'hauptmenu_de', 0),
(15, 'pll_5bc9e60570c15', 'pll_5bc9e60570c15', 0),
(16, 'pll_5bc9e6e823b42', 'pll_5bc9e6e823b42', 0),
(17, 'pll_5bc9e710c11a1', 'pll_5bc9e710c11a1', 0),
(18, 'pll_5bc9e74e90726', 'pll_5bc9e74e90726', 0),
(19, 'pll_5bc9e778aec98', 'pll_5bc9e778aec98', 0),
(20, 'pll_5bc9ed1bf279d', 'pll_5bc9ed1bf279d', 0),
(21, 'pll_5bcda4e28c86f', 'pll_5bcda4e28c86f', 0),
(22, 'pll_5bcda5d94dbcb', 'pll_5bcda5d94dbcb', 0),
(23, 'pll_5bcda673798a1', 'pll_5bcda673798a1', 0),
(24, 'pll_5bcda831a7a59', 'pll_5bcda831a7a59', 0),
(25, 'pll_5bcda8699a0c6', 'pll_5bcda8699a0c6', 0),
(26, 'pll_5bcda93031cf9', 'pll_5bcda93031cf9', 0),
(27, 'Concert', 'concert', 0),
(28, 'pll_5bcdae4e91b8a', 'pll_5bcdae4e91b8a', 0),
(29, 'Conférence', 'conference', 0),
(30, 'pll_5bcdae6510892', 'pll_5bcdae6510892', 0),
(31, 'Festival', 'festival', 0),
(32, 'pll_5bcdae772f790', 'pll_5bcdae772f790', 0),
(33, 'pll_5bcdb19a10715', 'pll_5bcdb19a10715', 0),
(34, 'Konzert', 'konzert', 0),
(36, 'Konferenz', 'konferenz', 0),
(38, 'Fest', 'fest', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(1, 7, 0),
(1, 8, 0),
(5, 1, 0),
(11, 8, 0),
(11, 10, 0),
(27, 7, 0),
(27, 28, 0),
(29, 7, 0),
(29, 30, 0),
(31, 7, 0),
(31, 32, 0),
(34, 10, 0),
(34, 28, 0),
(36, 10, 0),
(36, 30, 0),
(38, 10, 0),
(38, 32, 0),
(53, 6, 0),
(53, 20, 0),
(58, 3, 0),
(63, 3, 0),
(65, 6, 0),
(76, 6, 0),
(76, 13, 0),
(77, 6, 0),
(78, 6, 0),
(79, 6, 0),
(81, 9, 0),
(81, 13, 0),
(82, 9, 0),
(83, 9, 0),
(84, 9, 0),
(87, 6, 0),
(87, 16, 0),
(89, 6, 0),
(89, 17, 0),
(91, 6, 0),
(91, 19, 0),
(93, 6, 0),
(93, 18, 0),
(95, 5, 0),
(96, 5, 0),
(97, 5, 0),
(98, 5, 0),
(100, 5, 0),
(101, 5, 0),
(102, 14, 0),
(103, 6, 0),
(103, 15, 0),
(105, 9, 0),
(105, 15, 0),
(108, 6, 0),
(109, 9, 0),
(109, 16, 0),
(111, 9, 0),
(111, 17, 0),
(113, 9, 0),
(113, 18, 0),
(115, 9, 0),
(115, 19, 0),
(118, 14, 0),
(119, 14, 0),
(120, 14, 0),
(121, 14, 0),
(128, 9, 0),
(128, 20, 0),
(131, 14, 0),
(137, 6, 0),
(137, 21, 0),
(139, 9, 0),
(139, 21, 0),
(141, 5, 0),
(142, 6, 0),
(142, 22, 0),
(144, 9, 0),
(144, 22, 0),
(146, 6, 0),
(146, 23, 0),
(148, 9, 0),
(148, 23, 0),
(150, 6, 0),
(151, 5, 0),
(152, 6, 0),
(156, 9, 0),
(158, 6, 0),
(158, 24, 0),
(160, 9, 0),
(161, 9, 0),
(161, 24, 0),
(163, 6, 0),
(163, 25, 0),
(165, 9, 0),
(165, 25, 0),
(167, 6, 0),
(169, 9, 0),
(170, 9, 0),
(172, 9, 0),
(172, 26, 0),
(174, 6, 0),
(175, 6, 0),
(175, 26, 0),
(177, 6, 0),
(179, 6, 0),
(181, 6, 0),
(183, 6, 0),
(185, 6, 0),
(187, 6, 0),
(190, 5, 0),
(191, 5, 0),
(192, 5, 0),
(193, 5, 0),
(194, 5, 0),
(195, 5, 0),
(197, 5, 0),
(198, 5, 0),
(199, 5, 0),
(200, 5, 0),
(201, 5, 0),
(202, 5, 0),
(203, 14, 0),
(204, 14, 0),
(205, 14, 0),
(206, 14, 0),
(207, 14, 0),
(208, 14, 0),
(209, 14, 0),
(210, 14, 0),
(211, 14, 0),
(212, 14, 0),
(213, 5, 0),
(214, 5, 0),
(215, 5, 0),
(216, 5, 0),
(217, 5, 0),
(219, 6, 0),
(219, 33, 0),
(220, 9, 0),
(220, 33, 0),
(223, 6, 0),
(224, 6, 0),
(225, 6, 0),
(226, 6, 0),
(236, 14, 0),
(237, 14, 0),
(238, 14, 0),
(239, 14, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'category', '', 0, 0),
(3, 3, 'category', '', 0, 1),
(4, 4, 'category', '', 0, 0),
(5, 5, 'nav_menu', '', 0, 25),
(6, 6, 'language', 'a:3:{s:6:\"locale\";s:5:\"fr_FR\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"fr\";}', 0, 25),
(7, 7, 'term_language', '', 0, 4),
(8, 8, 'term_translations', 'a:2:{s:2:\"fr\";i:1;s:2:\"de\";i:11;}', 0, 2),
(9, 9, 'language', 'a:3:{s:6:\"locale\";s:5:\"de_DE\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"de\";}', 0, 19),
(10, 10, 'term_language', '', 0, 4),
(11, 11, 'category', '', 0, 0),
(13, 13, 'post_translations', 'a:2:{s:2:\"de\";i:81;s:2:\"fr\";i:76;}', 0, 2),
(14, 14, 'nav_menu', '', 0, 20),
(15, 15, 'post_translations', 'a:2:{s:2:\"de\";i:105;s:2:\"fr\";i:103;}', 0, 2),
(16, 16, 'post_translations', 'a:2:{s:2:\"de\";i:109;s:2:\"fr\";i:87;}', 0, 2),
(17, 17, 'post_translations', 'a:2:{s:2:\"de\";i:111;s:2:\"fr\";i:89;}', 0, 2),
(18, 18, 'post_translations', 'a:2:{s:2:\"de\";i:113;s:2:\"fr\";i:93;}', 0, 2),
(19, 19, 'post_translations', 'a:2:{s:2:\"de\";i:115;s:2:\"fr\";i:91;}', 0, 2),
(20, 20, 'post_translations', 'a:2:{s:2:\"de\";i:128;s:2:\"fr\";i:53;}', 0, 2),
(21, 21, 'post_translations', 'a:2:{s:2:\"de\";i:139;s:2:\"fr\";i:137;}', 0, 2),
(22, 22, 'post_translations', 'a:2:{s:2:\"de\";i:144;s:2:\"fr\";i:142;}', 0, 2),
(23, 23, 'post_translations', 'a:2:{s:2:\"de\";i:148;s:2:\"fr\";i:146;}', 0, 2),
(24, 24, 'post_translations', 'a:2:{s:2:\"de\";i:161;s:2:\"fr\";i:158;}', 0, 2),
(25, 25, 'post_translations', 'a:2:{s:2:\"de\";i:165;s:2:\"fr\";i:163;}', 0, 2),
(26, 26, 'post_translations', 'a:2:{s:2:\"fr\";i:175;s:2:\"de\";i:172;}', 0, 2),
(27, 27, 'tribe_events_cat', '', 0, 0),
(28, 28, 'term_translations', 'a:2:{s:2:\"fr\";i:27;s:2:\"de\";i:34;}', 0, 2),
(29, 29, 'tribe_events_cat', '', 0, 0),
(30, 30, 'term_translations', 'a:2:{s:2:\"fr\";i:29;s:2:\"de\";i:36;}', 0, 2),
(31, 31, 'tribe_events_cat', '', 0, 0),
(32, 32, 'term_translations', 'a:2:{s:2:\"fr\";i:31;s:2:\"de\";i:38;}', 0, 2),
(33, 33, 'post_translations', 'a:2:{s:2:\"de\";i:220;s:2:\"fr\";i:219;}', 0, 2),
(34, 34, 'tribe_events_cat', '', 0, 0),
(36, 36, 'tribe_events_cat', '', 0, 0),
(38, 38, 'tribe_events_cat', '', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', 'fr_FR'),
(12, 1, 'wp_capabilities', 'a:2:{s:13:\"administrator\";b:1;s:18:\"wpsp_administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy,config_knews,plugin_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:2:{s:64:\"98b3be5e2f5753509297007aea3eb69ac9f0dcada7d66ea446b89def0e581e14\";a:4:{s:10:\"expiration\";i:1540300201;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539090601;}s:64:\"0f8c20ca337cf19ec373c1b51dd2de3f0ed9231d1eedd54d7995f0dbd7943063\";a:4:{s:10:\"expiration\";i:1540376112;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1540203312;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '52'),
(18, 1, 'closedpostboxes_dashboard', 'a:2:{i:0;s:21:\"dashboard_quick_press\";i:1;s:17:\"dashboard_primary\";}'),
(19, 1, 'metaboxhidden_dashboard', 'a:0:{}'),
(20, 1, 'show_try_gutenberg_panel', '0'),
(21, 1, 'meta-box-order_dashboard', 'a:4:{s:6:\"normal\";s:38:\"dashboard_right_now,dashboard_activity\";s:4:\"side\";s:21:\"dashboard_quick_press\";s:7:\"column3\";s:17:\"dashboard_primary\";s:7:\"column4\";s:0:\"\";}'),
(22, 1, 'wp_user-settings', 'editor=html&hidetb=1&libraryContent=browse&mfold=o&widgets_access=off'),
(23, 1, 'wp_user-settings-time', '1540230267'),
(38, 1, 'meta-box-order_page', 'a:3:{s:4:\"side\";s:36:\"submitdiv,pageparentdiv,postimagediv\";s:6:\"normal\";s:67:\"User_specific_content,postcustom,commentstatusdiv,slugdiv,authordiv\";s:8:\"advanced\";s:0:\"\";}'),
(39, 1, 'screen_layout_page', '2'),
(42, 3, 'nickname', 'FSCVAdmin'),
(43, 3, 'first_name', ''),
(44, 3, 'last_name', ''),
(45, 3, 'description', ''),
(46, 3, 'rich_editing', 'true'),
(47, 3, 'syntax_highlighting', 'true'),
(48, 3, 'comment_shortcuts', 'false'),
(49, 3, 'admin_color', 'fresh'),
(50, 3, 'use_ssl', '0'),
(51, 3, 'show_admin_bar_front', 'true'),
(52, 3, 'locale', ''),
(53, 3, 'wp_capabilities', 'a:1:{s:9:\"fscvadmin\";b:1;}'),
(54, 3, 'wp_user_level', '0'),
(55, 3, 'dismissed_wp_pointers', 'wp496_privacy'),
(56, 4, 'nickname', 'GroupsAdmin'),
(57, 4, 'first_name', ''),
(58, 4, 'last_name', ''),
(59, 4, 'description', ''),
(60, 4, 'rich_editing', 'true'),
(61, 4, 'syntax_highlighting', 'true'),
(62, 4, 'comment_shortcuts', 'false'),
(63, 4, 'admin_color', 'fresh'),
(64, 4, 'use_ssl', '0'),
(65, 4, 'show_admin_bar_front', 'true'),
(66, 4, 'locale', ''),
(67, 4, 'wp_capabilities', 'a:1:{s:11:\"groupsadmin\";b:1;}'),
(68, 4, 'wp_user_level', '0'),
(69, 4, 'dismissed_wp_pointers', 'wp496_privacy'),
(70, 5, 'nickname', 'ChoeurAdmin'),
(71, 5, 'first_name', ''),
(72, 5, 'last_name', ''),
(73, 5, 'description', ''),
(74, 5, 'rich_editing', 'true'),
(75, 5, 'syntax_highlighting', 'true'),
(76, 5, 'comment_shortcuts', 'false'),
(77, 5, 'admin_color', 'fresh'),
(78, 5, 'use_ssl', '0'),
(79, 5, 'show_admin_bar_front', 'true'),
(80, 5, 'locale', ''),
(81, 5, 'wp_capabilities', 'a:1:{s:11:\"choeuradmin\";b:1;}'),
(82, 5, 'wp_user_level', '0'),
(83, 5, 'dismissed_wp_pointers', 'wp496_privacy,config_knews'),
(84, 6, 'nickname', 'Webmaster'),
(85, 6, 'first_name', ''),
(86, 6, 'last_name', ''),
(87, 6, 'description', ''),
(88, 6, 'rich_editing', 'true'),
(89, 6, 'syntax_highlighting', 'true'),
(90, 6, 'comment_shortcuts', 'false'),
(91, 6, 'admin_color', 'fresh'),
(92, 6, 'use_ssl', '0'),
(93, 6, 'show_admin_bar_front', 'true'),
(94, 6, 'locale', ''),
(95, 6, 'wp_capabilities', 'a:1:{s:9:\"webmaster\";b:1;}'),
(96, 6, 'wp_user_level', '0'),
(97, 6, 'dismissed_wp_pointers', 'wp496_privacy,config_knews'),
(99, 7, 'nickname', 'Editeur'),
(100, 7, 'first_name', ''),
(101, 7, 'last_name', ''),
(102, 7, 'description', ''),
(103, 7, 'rich_editing', 'true'),
(104, 7, 'syntax_highlighting', 'true'),
(105, 7, 'comment_shortcuts', 'false'),
(106, 7, 'admin_color', 'fresh'),
(107, 7, 'use_ssl', '0'),
(108, 7, 'show_admin_bar_front', 'true'),
(109, 7, 'locale', ''),
(110, 7, 'wp_capabilities', 'a:1:{s:6:\"editor\";b:1;}'),
(111, 7, 'wp_user_level', '7'),
(112, 7, 'dismissed_wp_pointers', 'wp496_privacy'),
(113, 8, 'nickname', 'Traducteur'),
(114, 8, 'first_name', ''),
(115, 8, 'last_name', ''),
(116, 8, 'description', ''),
(117, 8, 'rich_editing', 'true'),
(118, 8, 'syntax_highlighting', 'true'),
(119, 8, 'comment_shortcuts', 'false'),
(120, 8, 'admin_color', 'fresh'),
(121, 8, 'use_ssl', '0'),
(122, 8, 'show_admin_bar_front', 'true'),
(123, 8, 'locale', ''),
(124, 8, 'wp_capabilities', 'a:1:{s:10:\"traducteur\";b:1;}'),
(125, 8, 'wp_user_level', '0'),
(126, 8, 'dismissed_wp_pointers', 'wp496_privacy'),
(127, 9, 'nickname', 'GestionNL'),
(128, 9, 'first_name', ''),
(129, 9, 'last_name', ''),
(130, 9, 'description', ''),
(131, 9, 'rich_editing', 'true'),
(132, 9, 'syntax_highlighting', 'true'),
(133, 9, 'comment_shortcuts', 'false'),
(134, 9, 'admin_color', 'fresh'),
(135, 9, 'use_ssl', '0'),
(136, 9, 'show_admin_bar_front', 'true'),
(137, 9, 'locale', ''),
(138, 9, 'wp_capabilities', 'a:1:{s:9:\"gestionnl\";b:1;}'),
(139, 9, 'wp_user_level', '0'),
(140, 9, 'dismissed_wp_pointers', 'wp496_privacy'),
(141, 10, 'nickname', 'GestionListe'),
(142, 10, 'first_name', ''),
(143, 10, 'last_name', ''),
(144, 10, 'description', ''),
(145, 10, 'rich_editing', 'true'),
(146, 10, 'syntax_highlighting', 'true'),
(147, 10, 'comment_shortcuts', 'false'),
(148, 10, 'admin_color', 'fresh'),
(149, 10, 'use_ssl', '0'),
(150, 10, 'show_admin_bar_front', 'true'),
(151, 10, 'locale', ''),
(152, 10, 'wp_capabilities', 'a:1:{s:12:\"gestionliste\";b:1;}'),
(153, 10, 'wp_user_level', '0'),
(154, 10, 'dismissed_wp_pointers', 'wp496_privacy'),
(155, 5, '_author_cat', 'a:1:{i:0;s:1:\"3\";}'),
(156, 7, '_author_cat', NULL),
(157, 3, '_author_cat', NULL),
(158, 10, '_author_cat', NULL),
(159, 9, '_author_cat', NULL),
(160, 4, '_author_cat', NULL),
(161, 8, '_author_cat', NULL),
(162, 6, '_author_cat', NULL),
(163, 5, 'session_tokens', 'a:1:{s:64:\"d6d5d74e3e72de33a48d412e69f759e3d254304c5086d4230c0156910956180d\";a:4:{s:10:\"expiration\";i:1540114261;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0\";s:5:\"login\";i:1539941461;}}'),
(164, 5, 'wp_dashboard_quick_press_last_post_id', '57'),
(165, 5, 'meta-box-order_post', 'a:3:{s:4:\"side\";s:79:\"knews_post_options,author_cat,submitdiv,formatdiv,tagsdiv-post_tag,postimagediv\";s:6:\"normal\";s:30:\"postexcerpt,postcustom,slugdiv\";s:8:\"advanced\";s:0:\"\";}'),
(166, 5, 'screen_layout_post', '2'),
(168, 6, 'wp_dashboard_quick_press_last_post_id', '62'),
(170, 5, 'wp_user-settings', 'tribe_events_cat_tab=pop'),
(171, 5, 'wp_user-settings-time', '1539955559'),
(172, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(173, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:26:\"add-post-type-tribe_events\";i:1;s:12:\"add-post_tag\";i:2;s:15:\"add-post_format\";}'),
(174, 1, 'tribe_setDefaultNavMenuBoxes', '1'),
(175, 1, 'nav_menu_recently_edited', '14'),
(176, 1, 'pll_filter_content', ''),
(177, 1, '_author_cat', NULL),
(178, 1, 'description_de', ''),
(179, 1, 'tgmpa_dismissed_notice_radiate', '1');

-- --------------------------------------------------------

--
-- Structure de la table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BoCvUExav96iLRqrjjDSCqLICMTxPd1', 'admin', 'julien.reichenbach@students.hevs.ch', '', '2018-10-09 13:08:19', '', 0, 'admin'),
(3, 'FSCVAdmin', '$P$BarUZ9wl6nQX.vlH3O4lbZ03h6WfWH0', 'fscvadmin', 'fscv@hotmail.fr', '', '2018-10-19 06:53:08', '', 0, 'FSCVAdmin'),
(4, 'GroupsAdmin', '$P$BxCzytld7q9OJcoUC6PZjJ73dp60iR/', 'groupsadmin', 'groupsadmin@caramail.fr', '', '2018-10-19 06:53:42', '1539932024:$P$BaAK8cQG698t99iQjh6znobSCTjz3a/', 0, 'GroupsAdmin'),
(5, 'ChoeurAdmin', '$P$By2jPI.3TzHHBdU7ii1xQtRmNyqjob1', 'choeuradmin', 'choeur@admin.ch', '', '2018-10-19 06:54:06', '', 0, 'ChoeurAdmin'),
(6, 'Webmaster', '$P$BHbieuWjNnZUtvkIgAv62MNhkcFGfD1', 'webmaster', 'web@master.ch', '', '2018-10-19 06:54:33', '', 0, 'Webmaster'),
(7, 'Editeur', '$P$B41DpYSZQlu/AyWAJ9XJHoja.NuupB.', 'editeur', 'edith@heure.ch', '', '2018-10-19 06:55:51', '', 0, 'Editeur'),
(8, 'Traducteur', '$P$BdXMIKfAMFMmELtC4FXxPgeRcqPZ950', 'traducteur', 'trad@trad.ch', '', '2018-10-19 06:56:26', '', 0, 'Traducteur'),
(9, 'GestionNL', '$P$BMXa6uVLtxYqvcsg7w.QbpjDYA4d1J1', 'gestionnl', 'n@l.ch', '', '2018-10-19 06:56:49', '', 0, 'GestionNL'),
(10, 'GestionListe', '$P$B9FBYa6U7q2q/CnOMnddjiXtskST791', 'gestionliste', 'ges@lis.ch', '', '2018-10-19 06:57:19', '1539932240:$P$BCMqoPjK.Guj0fFg4vdtvSKQTZZNUd.', 0, 'GestionListe');

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpsp_agent_assign_data`
--

CREATE TABLE `wp_wpsp_agent_assign_data` (
  `id` bigint(20) NOT NULL,
  `ticket_id` bigint(20) NOT NULL,
  `agent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpsp_attachments`
--

CREATE TABLE `wp_wpsp_attachments` (
  `id` bigint(20) NOT NULL,
  `filename` tinytext,
  `filetype` tinytext,
  `filepath` tinytext,
  `active` int(2) DEFAULT '1',
  `upload_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpsp_catagories`
--

CREATE TABLE `wp_wpsp_catagories` (
  `id` int(11) NOT NULL,
  `name` tinytext,
  `supervisor` text,
  `load_order` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `wp_wpsp_catagories`
--

INSERT INTO `wp_wpsp_catagories` (`id`, `name`, `supervisor`, `load_order`) VALUES
(1, 'Autre', 'a:0:{}', 5),
(2, 'Proposition d\\\'événement', 'a:0:{}', 1),
(3, 'Création de petite annonce', 'a:0:{}', 2),
(4, 'Paiement', 'a:0:{}', 4),
(5, 'Dépanage', 'a:0:{}', 3);

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpsp_custom_fields`
--

CREATE TABLE `wp_wpsp_custom_fields` (
  `id` int(11) NOT NULL,
  `label` varchar(200) DEFAULT NULL,
  `required` int(11) DEFAULT '0',
  `field_type` int(11) DEFAULT '1',
  `field_options` text,
  `field_categories` varchar(100) DEFAULT '0',
  `isVarFeild` int(11) DEFAULT '0',
  `instructions` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpsp_custom_priority`
--

CREATE TABLE `wp_wpsp_custom_priority` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `load_order` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `wp_wpsp_custom_priority`
--

INSERT INTO `wp_wpsp_custom_priority` (`id`, `name`, `color`, `load_order`) VALUES
(1, 'Normal', '#5cb85c', 1),
(2, 'High', '#d9534f', 2),
(3, 'Medium', '#f0ad4e', 3),
(4, 'Low', '#5bc0de', 4);

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpsp_custom_status`
--

CREATE TABLE `wp_wpsp_custom_status` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `load_order` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `wp_wpsp_custom_status`
--

INSERT INTO `wp_wpsp_custom_status` (`id`, `name`, `color`, `load_order`) VALUES
(1, 'Open', '#d9534f', 1),
(2, 'Pending', '#f0ad4e', 2),
(3, 'Closed', '#5cb85c', 3);

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpsp_panel_custom_menu`
--

CREATE TABLE `wp_wpsp_panel_custom_menu` (
  `id` int(11) NOT NULL,
  `menu_text` varchar(50) DEFAULT NULL,
  `menu_icon` varchar(200) DEFAULT NULL,
  `redirect_url` varchar(200) DEFAULT NULL,
  `load_order` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `wp_wpsp_panel_custom_menu`
--

INSERT INTO `wp_wpsp_panel_custom_menu` (`id`, `menu_text`, `menu_icon`, `redirect_url`, `load_order`) VALUES
(1, 'Tickets', 'http://localhost:8080/chanter.ch/wp-content/plugins/wp-support-plus-responsive-ticket-system/asset/images/icons/agent.png', 'http://localhost:8080/chanter.ch/support/', 1);

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpsp_support_menu`
--

CREATE TABLE `wp_wpsp_support_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `redirect_url` varchar(200) DEFAULT NULL,
  `load_order` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `wp_wpsp_support_menu`
--

INSERT INTO `wp_wpsp_support_menu` (`id`, `name`, `icon`, `redirect_url`, `load_order`) VALUES
(1, 'Tickets', 'http://localhost:8080/chanter.ch/wp-content/plugins/wp-support-plus-responsive-ticket-system/asset/images/icons/agent.png', 'http://localhost:8080/chanter.ch/support/', 1);

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpsp_ticket`
--

CREATE TABLE `wp_wpsp_ticket` (
  `id` bigint(20) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `guest_name` tinytext,
  `guest_email` tinytext,
  `type` varchar(30) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `assigned_to` varchar(30) DEFAULT '0',
  `priority_id` int(11) DEFAULT NULL,
  `ip_address` varchar(30) DEFAULT NULL,
  `agent_created` int(11) DEFAULT '0',
  `active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpsp_ticket_form_order`
--

CREATE TABLE `wp_wpsp_ticket_form_order` (
  `id` int(11) NOT NULL,
  `field_key` tinytext,
  `status` tinyint(4) NOT NULL,
  `full_width` tinyint(4) NOT NULL,
  `load_order` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `wp_wpsp_ticket_form_order`
--

INSERT INTO `wp_wpsp_ticket_form_order` (`id`, `field_key`, `status`, `full_width`, `load_order`) VALUES
(1, 'ds', 1, 1, 1),
(2, 'dd', 1, 1, 3),
(3, 'dc', 1, 1, 2),
(4, 'dp', 0, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpsp_ticket_list_order`
--

CREATE TABLE `wp_wpsp_ticket_list_order` (
  `id` int(11) NOT NULL,
  `field_key` tinytext,
  `join_match` tinytext,
  `join_compare` tinytext,
  `join_relation` tinytext,
  `customer_visible` tinyint(4) NOT NULL DEFAULT '0',
  `agent_visible` tinyint(4) NOT NULL DEFAULT '0',
  `customer_filter` tinyint(4) NOT NULL DEFAULT '0',
  `agent_filter` tinyint(4) NOT NULL DEFAULT '0',
  `load_order` smallint(6) NOT NULL DEFAULT '0',
  `customer_ticket` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `wp_wpsp_ticket_list_order`
--

INSERT INTO `wp_wpsp_ticket_list_order` (`id`, `field_key`, `join_match`, `join_compare`, `join_relation`, `customer_visible`, `agent_visible`, `customer_filter`, `agent_filter`, `load_order`, `customer_ticket`) VALUES
(1, 'id', 't.id', 't.id', 'LIKE', 1, 1, 0, 1, 1, 1),
(2, 'status', 's.id', 's.name', 'LIKE', 1, 1, 1, 1, 2, 1),
(3, 'subject', 't.subject', 't.subject', NULL, 1, 1, 0, 0, 3, 1),
(4, 'raised_by', 't.guest_email', 't.guest_name', 'LIKE', 0, 1, 0, 1, 4, 0),
(5, 'user_type', 't.type', 't.type', 'LIKE', 0, 0, 0, 0, 4, 0),
(6, 'category', 'c.id', 'c.name', 'LIKE', 1, 1, 1, 1, 5, 1),
(7, 'assigned_agent', 't.assigned_to', 't.assigned_to', 'LIKE', 0, 1, 0, 1, 6, 0),
(8, 'priority', 'p.id', 'p.name', 'LIKE', 1, 1, 1, 1, 7, 0),
(9, 'date_created', 't.create_time', 't.create_time', 'BETWEEN', 0, 0, 1, 1, 8, 0),
(10, 'date_updated', 't.update_time', 't.update_time', 'BETWEEN', 1, 1, 0, 0, 9, 0),
(11, 'created_agent', 't.agent_created', 'u.user_login,u.display_name,u.user_email', 'LIKE', 0, 0, 0, 0, 10, 0),
(12, 'deleted_ticket', 'NULL', 'NULL', 'LIKE', 0, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpsp_ticket_thread`
--

CREATE TABLE `wp_wpsp_ticket_thread` (
  `id` bigint(20) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `body` longtext,
  `attachment_ids` tinytext,
  `create_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `guest_name` tinytext,
  `guest_email` tinytext,
  `is_note` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpsp_users`
--

CREATE TABLE `wp_wpsp_users` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `role` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `wp_wpsp_users`
--

INSERT INTO `wp_wpsp_users` (`id`, `user_id`, `role`) VALUES
(1, 1, 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`IdAddress`);

--
-- Index pour la table `attribution`
--
ALTER TABLE `attribution`
  ADD PRIMARY KEY (`IdAttribution`);

--
-- Index pour la table `choir`
--
ALTER TABLE `choir`
  ADD PRIMARY KEY (`IdChoir`),
  ADD KEY `FKChoir488676` (`AddressIdAddress`);

--
-- Index pour la table `choir_person_attribution`
--
ALTER TABLE `choir_person_attribution`
  ADD PRIMARY KEY (`ChoirIdChoir`,`AttributionIdAttribution`,`PersonIdPerson`),
  ADD KEY `FKChoir_Pers330676` (`PersonIdPerson`),
  ADD KEY `FKChoir_Pers485004` (`AttributionIdAttribution`);

--
-- Index pour la table `organisation`
--
ALTER TABLE `organisation`
  ADD PRIMARY KEY (`IdOrganisation`),
  ADD KEY `FKOrganisati268331` (`AddressidAddress`);

--
-- Index pour la table `organisation_choir`
--
ALTER TABLE `organisation_choir`
  ADD PRIMARY KEY (`OrganisationIdOrganisation`,`ChoirIdChoir`),
  ADD KEY `FKOrganisati971261` (`ChoirIdChoir`);

--
-- Index pour la table `organisation_person_attribution`
--
ALTER TABLE `organisation_person_attribution`
  ADD PRIMARY KEY (`OrganisationIdOrganisation`,`AttributionIdAttribution`,`PersonIdPerson`),
  ADD KEY `FKOrganisati966238` (`PersonIdPerson`),
  ADD KEY `FKOrganisati811910` (`AttributionIdAttribution`);

--
-- Index pour la table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`idPerson`),
  ADD KEY `FKPerson547375` (`AddressIdAddress`);

--
-- Index pour la table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Index pour la table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Index pour la table `wp_knewsautomated`
--
ALTER TABLE `wp_knewsautomated`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_knewsautomatedposts`
--
ALTER TABLE `wp_knewsautomatedposts`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_knewsautomatedsel`
--
ALTER TABLE `wp_knewsautomatedsel`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_knewsextrafields`
--
ALTER TABLE `wp_knewsextrafields`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_knewskeys`
--
ALTER TABLE `wp_knewskeys`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_knewsletters`
--
ALTER TABLE `wp_knewsletters`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_knewslists`
--
ALTER TABLE `wp_knewslists`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_knewstats`
--
ALTER TABLE `wp_knewstats`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_knewsubmits`
--
ALTER TABLE `wp_knewsubmits`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_knewsubmitsdetails`
--
ALTER TABLE `wp_knewsubmitsdetails`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_knewsusers`
--
ALTER TABLE `wp_knewsusers`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_knewsusersevents`
--
ALTER TABLE `wp_knewsusersevents`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_knewsusersextra`
--
ALTER TABLE `wp_knewsusersextra`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_knewsuserslists`
--
ALTER TABLE `wp_knewsuserslists`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Index pour la table `wp_newsletter`
--
ALTER TABLE `wp_newsletter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `wp_user_id` (`wp_user_id`);

--
-- Index pour la table `wp_newsletter_emails`
--
ALTER TABLE `wp_newsletter_emails`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wp_newsletter_sent`
--
ALTER TABLE `wp_newsletter_sent`
  ADD PRIMARY KEY (`email_id`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `email_id` (`email_id`);

--
-- Index pour la table `wp_newsletter_stats`
--
ALTER TABLE `wp_newsletter_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `wp_newsletter_user_logs`
--
ALTER TABLE `wp_newsletter_user_logs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Index pour la table `wp_podsrel`
--
ALTER TABLE `wp_podsrel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_item_idx` (`field_id`,`item_id`),
  ADD KEY `rel_field_rel_item_idx` (`related_field_id`,`related_item_id`),
  ADD KEY `field_rel_item_idx` (`field_id`,`related_item_id`),
  ADD KEY `rel_field_item_idx` (`related_field_id`,`item_id`);

--
-- Index pour la table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Index pour la table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Index pour la table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Index pour la table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Index pour la table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Index pour la table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Index pour la table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Index pour la table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Index pour la table `wp_wpsp_agent_assign_data`
--
ALTER TABLE `wp_wpsp_agent_assign_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Index pour la table `wp_wpsp_attachments`
--
ALTER TABLE `wp_wpsp_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wp_wpsp_catagories`
--
ALTER TABLE `wp_wpsp_catagories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wp_wpsp_custom_fields`
--
ALTER TABLE `wp_wpsp_custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wp_wpsp_custom_priority`
--
ALTER TABLE `wp_wpsp_custom_priority`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wp_wpsp_custom_status`
--
ALTER TABLE `wp_wpsp_custom_status`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wp_wpsp_panel_custom_menu`
--
ALTER TABLE `wp_wpsp_panel_custom_menu`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wp_wpsp_support_menu`
--
ALTER TABLE `wp_wpsp_support_menu`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wp_wpsp_ticket`
--
ALTER TABLE `wp_wpsp_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `active` (`active`);

--
-- Index pour la table `wp_wpsp_ticket_form_order`
--
ALTER TABLE `wp_wpsp_ticket_form_order`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wp_wpsp_ticket_list_order`
--
ALTER TABLE `wp_wpsp_ticket_list_order`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wp_wpsp_ticket_thread`
--
ALTER TABLE `wp_wpsp_ticket_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `create_time` (`create_time`),
  ADD KEY `created_by` (`created_by`);

--
-- Index pour la table `wp_wpsp_users`
--
ALTER TABLE `wp_wpsp_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `IdAddress` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `attribution`
--
ALTER TABLE `attribution`
  MODIFY `IdAttribution` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `choir`
--
ALTER TABLE `choir`
  MODIFY `IdChoir` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `organisation`
--
ALTER TABLE `organisation`
  MODIFY `IdOrganisation` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `person`
--
ALTER TABLE `person`
  MODIFY `idPerson` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_knewsautomated`
--
ALTER TABLE `wp_knewsautomated`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_knewsautomatedposts`
--
ALTER TABLE `wp_knewsautomatedposts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_knewsautomatedsel`
--
ALTER TABLE `wp_knewsautomatedsel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_knewsextrafields`
--
ALTER TABLE `wp_knewsextrafields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `wp_knewskeys`
--
ALTER TABLE `wp_knewskeys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_knewsletters`
--
ALTER TABLE `wp_knewsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_knewslists`
--
ALTER TABLE `wp_knewslists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `wp_knewstats`
--
ALTER TABLE `wp_knewstats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_knewsubmits`
--
ALTER TABLE `wp_knewsubmits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_knewsubmitsdetails`
--
ALTER TABLE `wp_knewsubmitsdetails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_knewsusers`
--
ALTER TABLE `wp_knewsusers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_knewsusersevents`
--
ALTER TABLE `wp_knewsusersevents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_knewsusersextra`
--
ALTER TABLE `wp_knewsusersextra`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_knewsuserslists`
--
ALTER TABLE `wp_knewsuserslists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_newsletter`
--
ALTER TABLE `wp_newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_newsletter_emails`
--
ALTER TABLE `wp_newsletter_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_newsletter_stats`
--
ALTER TABLE `wp_newsletter_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_newsletter_user_logs`
--
ALTER TABLE `wp_newsletter_user_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1075;

--
-- AUTO_INCREMENT pour la table `wp_podsrel`
--
ALTER TABLE `wp_podsrel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1122;

--
-- AUTO_INCREMENT pour la table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT pour la table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT pour la table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `wp_wpsp_agent_assign_data`
--
ALTER TABLE `wp_wpsp_agent_assign_data`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_wpsp_attachments`
--
ALTER TABLE `wp_wpsp_attachments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_wpsp_catagories`
--
ALTER TABLE `wp_wpsp_catagories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `wp_wpsp_custom_fields`
--
ALTER TABLE `wp_wpsp_custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_wpsp_custom_priority`
--
ALTER TABLE `wp_wpsp_custom_priority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `wp_wpsp_custom_status`
--
ALTER TABLE `wp_wpsp_custom_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `wp_wpsp_panel_custom_menu`
--
ALTER TABLE `wp_wpsp_panel_custom_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `wp_wpsp_support_menu`
--
ALTER TABLE `wp_wpsp_support_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `wp_wpsp_ticket`
--
ALTER TABLE `wp_wpsp_ticket`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_wpsp_ticket_form_order`
--
ALTER TABLE `wp_wpsp_ticket_form_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `wp_wpsp_ticket_list_order`
--
ALTER TABLE `wp_wpsp_ticket_list_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `wp_wpsp_ticket_thread`
--
ALTER TABLE `wp_wpsp_ticket_thread`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wp_wpsp_users`
--
ALTER TABLE `wp_wpsp_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `choir`
--
ALTER TABLE `choir`
  ADD CONSTRAINT `FKChoir488676` FOREIGN KEY (`AddressIdAddress`) REFERENCES `address` (`IdAddress`);

--
-- Contraintes pour la table `choir_person_attribution`
--
ALTER TABLE `choir_person_attribution`
  ADD CONSTRAINT `FKChoir_Pers330676` FOREIGN KEY (`PersonIdPerson`) REFERENCES `person` (`idPerson`),
  ADD CONSTRAINT `FKChoir_Pers485004` FOREIGN KEY (`AttributionIdAttribution`) REFERENCES `attribution` (`IdAttribution`),
  ADD CONSTRAINT `FKChoir_Pers941136` FOREIGN KEY (`ChoirIdChoir`) REFERENCES `choir` (`IdChoir`);

--
-- Contraintes pour la table `organisation`
--
ALTER TABLE `organisation`
  ADD CONSTRAINT `FKOrganisati268331` FOREIGN KEY (`AddressidAddress`) REFERENCES `address` (`IdAddress`);

--
-- Contraintes pour la table `organisation_choir`
--
ALTER TABLE `organisation_choir`
  ADD CONSTRAINT `FKOrganisati256136` FOREIGN KEY (`OrganisationIdOrganisation`) REFERENCES `organisation` (`IdOrganisation`),
  ADD CONSTRAINT `FKOrganisati971261` FOREIGN KEY (`ChoirIdChoir`) REFERENCES `choir` (`IdChoir`);

--
-- Contraintes pour la table `organisation_person_attribution`
--
ALTER TABLE `organisation_person_attribution`
  ADD CONSTRAINT `FKOrganisati669061` FOREIGN KEY (`OrganisationIdOrganisation`) REFERENCES `organisation` (`IdOrganisation`),
  ADD CONSTRAINT `FKOrganisati811910` FOREIGN KEY (`AttributionIdAttribution`) REFERENCES `attribution` (`IdAttribution`),
  ADD CONSTRAINT `FKOrganisati966238` FOREIGN KEY (`PersonIdPerson`) REFERENCES `person` (`idPerson`);

--
-- Contraintes pour la table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `FKPerson547375` FOREIGN KEY (`AddressIdAddress`) REFERENCES `address` (`IdAddress`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
