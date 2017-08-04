-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 02, 2017 at 12:51 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nmeict_angle`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submission`
--

CREATE TABLE `assignment_submission` (
  `id` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `submittedOn` datetime DEFAULT NULL,
  `submittedFile` text,
  `grade` text,
  `comment` text,
  `gradedBy` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ConferenceDetails`
--

CREATE TABLE `ConferenceDetails` (
  `cid` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `StartTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EndTime` timestamp NOT NULL,
  `NoOfParticipants` int(11) DEFAULT NULL,
  `Topic` text NOT NULL,
  `groupId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Feature`
--

CREATE TABLE `Feature` (
  `featureId` int(11) NOT NULL,
  `featureName` varchar(20) NOT NULL,
  `accessNameList` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GroupFeatures`
--

CREATE TABLE `GroupFeatures` (
  `groupId` int(11) NOT NULL,
  `featureList` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GroupInfo`
--

CREATE TABLE `GroupInfo` (
  `groupId` int(11) NOT NULL,
  `groupCode` varchar(8) NOT NULL,
  `groupType` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT 'name of group',
  `owner` int(11) NOT NULL COMMENT 'user id',
  `description` text COMMENT 'description about the group',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUsedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `groupState` tinyint(4) NOT NULL,
  `lockState` tinyint(1) NOT NULL,
  `defaultProfileId` int(11) DEFAULT NULL,
  `profileIdList` text,
  `parentId` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_assignment`
--

CREATE TABLE `group_assignment` (
  `id` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `name` text,
  `givenOn` datetime DEFAULT NULL,
  `lastSubmissionDate` datetime DEFAULT NULL,
  `attachment` text,
  `referenceLink` text,
  `description` text,
  `topicName` text,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_note`
--

CREATE TABLE `group_note` (
  `id` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `note` varchar(100) NOT NULL,
  `noteLink` varchar(300) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `noteFile` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `group_post`
--

CREATE TABLE `group_post` (
  `id` int(11) NOT NULL,
  `Toolid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `gid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_api`
--

CREATE TABLE `jforum_api` (
  `api_id` int(11) NOT NULL,
  `api_key` varchar(32) NOT NULL,
  `api_validity` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_attach`
--

CREATE TABLE `jforum_attach` (
  `attach_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `privmsgs_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_attach_desc`
--

CREATE TABLE `jforum_attach_desc` (
  `attach_desc_id` int(11) NOT NULL,
  `attach_id` int(11) NOT NULL,
  `physical_filename` varchar(255) NOT NULL,
  `real_filename` varchar(255) NOT NULL,
  `download_count` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `thumb` tinyint(1) DEFAULT '0',
  `extension_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_attach_quota`
--

CREATE TABLE `jforum_attach_quota` (
  `attach_quota_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `quota_limit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_banlist`
--

CREATE TABLE `jforum_banlist` (
  `banlist_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `banlist_ip` varchar(15) DEFAULT NULL,
  `banlist_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_banner`
--

CREATE TABLE `jforum_banner` (
  `banner_id` int(11) NOT NULL,
  `banner_name` varchar(90) DEFAULT NULL,
  `banner_placement` int(11) NOT NULL DEFAULT '0',
  `banner_description` varchar(250) DEFAULT NULL,
  `banner_clicks` int(11) NOT NULL DEFAULT '0',
  `banner_views` int(11) NOT NULL DEFAULT '0',
  `banner_url` varchar(250) DEFAULT NULL,
  `banner_weight` tinyint(1) NOT NULL DEFAULT '50',
  `banner_active` tinyint(1) NOT NULL DEFAULT '0',
  `banner_comment` varchar(250) DEFAULT NULL,
  `banner_type` int(11) NOT NULL DEFAULT '0',
  `banner_width` int(11) NOT NULL DEFAULT '0',
  `banner_height` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_bookmarks`
--

CREATE TABLE `jforum_bookmarks` (
  `bookmark_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `relation_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  `public_visible` int(11) DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_categories`
--

CREATE TABLE `jforum_categories` (
  `categories_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `moderated` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jforum_categories`
--

INSERT INTO `jforum_categories` (`categories_id`, `title`, `display_order`, `moderated`) VALUES
(1, 'Category Test', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jforum_config`
--

CREATE TABLE `jforum_config` (
  `config_name` varchar(255) NOT NULL DEFAULT '',
  `config_value` varchar(255) NOT NULL DEFAULT '',
  `config_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jforum_config`
--

INSERT INTO `jforum_config` (`config_name`, `config_value`, `config_id`) VALUES
('most.users.ever.online', '1', 1),
('most.users.ever.online.date', '1497596810260', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jforum_extensions`
--

CREATE TABLE `jforum_extensions` (
  `extension_id` int(11) NOT NULL,
  `extension_group_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `upload_icon` varchar(100) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_extension_groups`
--

CREATE TABLE `jforum_extension_groups` (
  `extension_group_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `allow` tinyint(1) DEFAULT '1',
  `upload_icon` varchar(100) DEFAULT NULL,
  `download_mode` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_forums`
--

CREATE TABLE `jforum_forums` (
  `forum_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL DEFAULT '1',
  `forum_name` varchar(150) NOT NULL DEFAULT '',
  `forum_desc` varchar(255) DEFAULT NULL,
  `forum_order` int(11) DEFAULT '1',
  `forum_topics` int(11) NOT NULL DEFAULT '0',
  `forum_last_post_id` int(11) NOT NULL DEFAULT '0',
  `moderated` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jforum_forums`
--

INSERT INTO `jforum_forums` (`forum_id`, `categories_id`, `forum_name`, `forum_desc`, `forum_order`, `forum_topics`, `forum_last_post_id`, `moderated`) VALUES
(1, 1, 'Test Forum', 'This is a test forum', 1, 2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jforum_forums_watch`
--

CREATE TABLE `jforum_forums_watch` (
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_groups`
--

CREATE TABLE `jforum_groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(40) NOT NULL DEFAULT '',
  `group_description` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jforum_groups`
--

INSERT INTO `jforum_groups` (`group_id`, `group_name`, `group_description`, `parent_id`) VALUES
(1, 'General', 'General Users', 0),
(2, 'Administration', 'Admin Users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jforum_karma`
--

CREATE TABLE `jforum_karma` (
  `karma_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `post_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `rate_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_mail_integration`
--

CREATE TABLE `jforum_mail_integration` (
  `forum_id` int(11) NOT NULL,
  `forum_email` varchar(100) NOT NULL,
  `pop_username` varchar(100) NOT NULL,
  `pop_password` varchar(100) NOT NULL,
  `pop_host` varchar(100) NOT NULL,
  `pop_port` int(11) DEFAULT '110',
  `pop_ssl` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_moderation_log`
--

CREATE TABLE `jforum_moderation_log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `log_description` text NOT NULL,
  `log_original_message` text,
  `log_date` datetime NOT NULL,
  `log_type` tinyint(4) DEFAULT '0',
  `post_id` int(11) DEFAULT '0',
  `topic_id` int(11) DEFAULT '0',
  `post_user_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_posts`
--

CREATE TABLE `jforum_posts` (
  `post_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `post_time` datetime DEFAULT NULL,
  `poster_ip` varchar(15) DEFAULT NULL,
  `enable_bbcode` tinyint(1) NOT NULL DEFAULT '1',
  `enable_html` tinyint(1) NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) NOT NULL DEFAULT '1',
  `post_edit_time` datetime DEFAULT NULL,
  `post_edit_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `attach` tinyint(1) DEFAULT '0',
  `need_moderate` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jforum_posts`
--

INSERT INTO `jforum_posts` (`post_id`, `topic_id`, `forum_id`, `user_id`, `post_time`, `poster_ip`, `enable_bbcode`, `enable_html`, `enable_smilies`, `enable_sig`, `post_edit_time`, `post_edit_count`, `status`, `attach`, `need_moderate`) VALUES
(1, 1, 1, 2, '2005-01-04 16:59:54', '127.0.0.1', 1, 0, 1, 1, NULL, 0, 1, 0, 0),
(2, 2, 1, 2, '2017-06-16 12:36:46', '127.0.0.1', 1, 1, 1, 1, '2017-06-16 12:36:46', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jforum_posts_text`
--

CREATE TABLE `jforum_posts_text` (
  `post_id` int(11) NOT NULL,
  `post_text` text,
  `post_subject` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jforum_posts_text`
--

INSERT INTO `jforum_posts_text` (`post_id`, `post_text`, `post_subject`) VALUES
(1, '[b][color=blue][size=18]Congratulations :!: [/size][/color][/b]\nYou have completed the installation, and JForum is up and running. \n\nTo start administering the board, login as [i]Admin / <the password you supplied in the installer>[/i] and access the [b][url=/admBase/login.page]Admin Control Panel[/url][/b] using the link that shows up in the bottom of the page. There you will be able to create Categories, Forums and much more  :D  \n\nFor more information and support, please refer to the following pages:\n\n:arrow: Community forum: http://www.jforum.net/community.jsp\n:arrow: Documentation: http://www.jforum.net/doc\n\nThank you for choosing JForum.\n\n[url=http://www.jforum.net/doc/Team]The JForum Team[/url]\n\n', 'Welcome to JForum'),
(2, '[color=#3AA315][size=18][b]Support JForum - Help the project[/b][/size][/color]<hr>This project is Open Source, and maintained by at least one full time Senior Developer, [i]which costs US$ 3,000.00 / month[/i]. If it helped you, please consider helping this project - especially with some [b][url=http://www.jforum.net/contribute.jsp]donation[/url][/b].\n\n[color=#137C9F][size=14][b]Why supporting this project is a good thing[/b][/size][/color]<hr>The JForum Project started four years ago as a completely free and Open Source program, initially entirely developed on my (Rafael Steil) free time. Today, with the help of some very valuable people, I can spend more time on JForum, to improve it and implement new features (lots of things, requested either on the [url=http://www.jforum.net/forums/list.page]forums[/url] or registered in the [url=http://www.jforum.net/jira]bug tracker[/url]).\nThat is why I am asking you to financially support this work. I love Open Source. I love to use good products without having to pay for it too. But when I see some program that is valuable to my work, that helps me making money, I think it is a good idea to support this project.\n\n[b]Some reasons to support open projects[/b]:<ul><li>Because Open Source is cool? Yes<li>To thank for a great tool? Yes<li>To help the project evolve because this will help my work and my earnings? Yes</ul>Also, as the project grows more and more, it would be great to, sometimes, reward some of the great people who help JForum.\n\nSo, that is what I am asking you: if JForum helps your work, saves your time (time is money, remember?) and increase your earnings, support this project. The simpler way is to make [url=http://www.jforum.net/contribute.jsp]any donation[/url] via PayPal.\n\nJForum has grown a lot every day, since four years ago, which is a great thing, and initially it was not my intention to fully work on this tool. Lately, I am spending a lot of time on it, specially to make JForum 3 a reality, to help users, to improve the program, to research about better solutions. So, your support is very welcome!\n\nThanks!\n\n:arrow: [size=16][b][url=http://www.jforum.net/contribute.jsp]Click here[/url][/b] to go to the [i][b][url=http://www.jforum.net/contribute.jsp]\"Support JForum\"[/url][/b][/i] page.[/size]\n\n', 'Support JForum - Please read');

-- --------------------------------------------------------

--
-- Table structure for table `jforum_privmsgs`
--

CREATE TABLE `jforum_privmsgs` (
  `privmsgs_id` int(11) NOT NULL,
  `privmsgs_type` tinyint(4) NOT NULL DEFAULT '0',
  `privmsgs_subject` varchar(255) NOT NULL DEFAULT '',
  `privmsgs_from_userid` int(11) NOT NULL DEFAULT '0',
  `privmsgs_to_userid` int(11) NOT NULL DEFAULT '0',
  `privmsgs_date` datetime DEFAULT NULL,
  `privmsgs_ip` varchar(15) NOT NULL DEFAULT '',
  `privmsgs_enable_bbcode` tinyint(1) NOT NULL DEFAULT '1',
  `privmsgs_enable_html` tinyint(1) NOT NULL DEFAULT '0',
  `privmsgs_enable_smilies` tinyint(1) NOT NULL DEFAULT '1',
  `privmsgs_attach_sig` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_privmsgs_text`
--

CREATE TABLE `jforum_privmsgs_text` (
  `privmsgs_id` int(11) NOT NULL,
  `privmsgs_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_quota_limit`
--

CREATE TABLE `jforum_quota_limit` (
  `quota_limit_id` int(11) NOT NULL,
  `quota_desc` varchar(50) NOT NULL,
  `quota_limit` int(11) NOT NULL,
  `quota_type` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_ranks`
--

CREATE TABLE `jforum_ranks` (
  `rank_id` int(11) NOT NULL,
  `rank_title` varchar(50) NOT NULL DEFAULT '',
  `rank_min` int(11) NOT NULL DEFAULT '0',
  `rank_special` tinyint(1) DEFAULT NULL,
  `rank_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_roles`
--

CREATE TABLE `jforum_roles` (
  `role_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jforum_roles`
--

INSERT INTO `jforum_roles` (`role_id`, `group_id`, `name`) VALUES
(1, 1, 'perm_vote'),
(2, 1, 'perm_karma_enabled'),
(3, 1, 'perm_anonymous_post'),
(4, 1, 'perm_create_poll'),
(5, 1, 'perm_bookmarks_enabled'),
(6, 1, 'perm_attachments_download'),
(7, 1, 'perm_create_sticky_announcement_topics'),
(8, 1, 'perm_moderation_log'),
(9, 2, 'perm_administration'),
(10, 2, 'perm_moderation'),
(11, 2, 'perm_moderation_post_remove'),
(12, 2, 'perm_moderation_post_edit'),
(13, 2, 'perm_moderation_topic_move'),
(14, 2, 'perm_moderation_topic_lockUnlock'),
(15, 2, 'perm_moderation_approve_messages'),
(16, 2, 'perm_create_sticky_announcement_topics'),
(17, 2, 'perm_vote'),
(18, 2, 'perm_create_poll'),
(19, 2, 'perm_karma_enabled'),
(20, 2, 'perm_bookmarks_enabled'),
(21, 2, 'perm_attachments_download'),
(22, 2, 'perm_moderation_log'),
(23, 2, 'perm_full_moderation_log'),
(24, 1, 'perm_forum'),
(25, 2, 'perm_forum'),
(26, 1, 'perm_anonymous_post'),
(27, 2, 'perm_anonymous_post'),
(28, 1, 'perm_category'),
(29, 2, 'perm_category'),
(30, 1, 'perm_read_only_forums'),
(31, 2, 'perm_read_only_forums'),
(32, 1, 'perm_html_disabled'),
(33, 2, 'perm_html_disabled'),
(34, 1, 'perm_attachments_enabled'),
(35, 2, 'perm_attachments_enabled'),
(36, 1, 'perm_reply_only'),
(37, 2, 'perm_reply_only'),
(38, 1, 'perm_reply_without_moderation'),
(39, 2, 'perm_reply_without_moderation'),
(40, 2, 'perm_moderation_forums');

-- --------------------------------------------------------

--
-- Table structure for table `jforum_role_values`
--

CREATE TABLE `jforum_role_values` (
  `role_id` int(11) NOT NULL,
  `role_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jforum_role_values`
--

INSERT INTO `jforum_role_values` (`role_id`, `role_value`) VALUES
(24, '1'),
(25, '1'),
(26, '1'),
(27, '1'),
(28, '1'),
(29, '1'),
(30, '1'),
(31, '1'),
(32, '1'),
(33, '1'),
(34, '1'),
(35, '1'),
(36, '1'),
(37, '1'),
(38, '1'),
(39, '1'),
(40, '1');

-- --------------------------------------------------------

--
-- Table structure for table `jforum_sessions`
--

CREATE TABLE `jforum_sessions` (
  `session_id` varchar(150) NOT NULL DEFAULT '',
  `session_user_id` int(11) NOT NULL DEFAULT '0',
  `session_start` datetime DEFAULT NULL,
  `session_time` bigint(20) DEFAULT '0',
  `session_ip` varchar(15) NOT NULL DEFAULT '',
  `session_page` int(11) NOT NULL DEFAULT '0',
  `session_logged_int` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_smilies`
--

CREATE TABLE `jforum_smilies` (
  `smilie_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(100) DEFAULT NULL,
  `disk_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jforum_smilies`
--

INSERT INTO `jforum_smilies` (`smilie_id`, `code`, `url`, `disk_name`) VALUES
(1, ':)', '<img src=\"#CONTEXT#/images/smilies/3b63d1616c5dfcf29f8a7a031aaa7cad.gif\" />', '3b63d1616c5dfcf29f8a7a031aaa7cad.gif'),
(2, ':-)', '<img src=\"#CONTEXT#/images/smilies/3b63d1616c5dfcf29f8a7a031aaa7cad.gif\"/>', '3b63d1616c5dfcf29f8a7a031aaa7cad.gif'),
(3, ':D', '<img src=\"#CONTEXT#/images/smilies/283a16da79f3aa23fe1025c96295f04f.gif\" />', '283a16da79f3aa23fe1025c96295f04f.gif'),
(4, ':-D', '<img src=\"#CONTEXT#/images/smilies/283a16da79f3aa23fe1025c96295f04f.gif\" />', '283a16da79f3aa23fe1025c96295f04f.gif'),
(5, ':(', '<img src=\"#CONTEXT#/images/smilies/9d71f0541cff0a302a0309c5079e8dee.gif\" />', '9d71f0541cff0a302a0309c5079e8dee.gif'),
(6, ':mrgreen:', '<img src=\"#CONTEXT#/images/smilies/ed515dbff23a0ee3241dcc0a601c9ed6.gif\" />', 'ed515dbff23a0ee3241dcc0a601c9ed6.gif'),
(7, ':-o', '<img src=\"#CONTEXT#/images/smilies/47941865eb7bbc2a777305b46cc059a2.gif\"  />', '47941865eb7bbc2a777305b46cc059a2.gif'),
(8, ':shock:', '<img src=\"#CONTEXT#/images/smilies/385970365b8ed7503b4294502a458efa.gif\" />', '385970365b8ed7503b4294502a458efa.gif'),
(9, ':?:', '<img src=\"#CONTEXT#/images/smilies/0a4d7238daa496a758252d0a2b1a1384.gif\" />', '0a4d7238daa496a758252d0a2b1a1384.gif'),
(10, '8)', '<img src=\"#CONTEXT#/images/smilies/b2eb59423fbf5fa39342041237025880.gif\"  />', 'b2eb59423fbf5fa39342041237025880.gif'),
(11, ':lol:', '<img src=\"#CONTEXT#/images/smilies/97ada74b88049a6d50a6ed40898a03d7.gif\" />', '97ada74b88049a6d50a6ed40898a03d7.gif'),
(12, ':x', '<img src=\"#CONTEXT#/images/smilies/1069449046bcd664c21db15b1dfedaee.gif\"  />', '1069449046bcd664c21db15b1dfedaee.gif'),
(13, ':P', '<img src=\"#CONTEXT#/images/smilies/69934afc394145350659cd7add244ca9.gif\" />', '69934afc394145350659cd7add244ca9.gif'),
(14, ':-P', '<img src=\"#CONTEXT#/images/smilies/69934afc394145350659cd7add244ca9.gif\" />', '69934afc394145350659cd7add244ca9.gif'),
(15, ':oops:', '<img src=\"#CONTEXT#/images/smilies/499fd50bc713bfcdf2ab5a23c00c2d62.gif\" />', '499fd50bc713bfcdf2ab5a23c00c2d62.gif'),
(16, ':cry:', '<img src=\"#CONTEXT#/images/smilies/c30b4198e0907b23b8246bdd52aa1c3c.gif\" />', 'c30b4198e0907b23b8246bdd52aa1c3c.gif'),
(17, ':evil:', '<img src=\"#CONTEXT#/images/smilies/2e207fad049d4d292f60607f80f05768.gif\" />', '2e207fad049d4d292f60607f80f05768.gif'),
(18, ':twisted:', '<img src=\"#CONTEXT#/images/smilies/908627bbe5e9f6a080977db8c365caff.gif\" />', '908627bbe5e9f6a080977db8c365caff.gif'),
(19, ':roll:', '<img src=\"#CONTEXT#/images/smilies/2786c5c8e1a8be796fb2f726cca5a0fe.gif\" />', '2786c5c8e1a8be796fb2f726cca5a0fe.gif'),
(20, ':wink:', '<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" />', '8a80c6485cd926be453217d59a84a888.gif'),
(21, ';)', '<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" />', '8a80c6485cd926be453217d59a84a888.gif'),
(22, ';-)', '<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" />', '8a80c6485cd926be453217d59a84a888.gif'),
(23, ':!:', '<img src=\"#CONTEXT#/images/smilies/9293feeb0183c67ea1ea8c52f0dbaf8c.gif\" />', '9293feeb0183c67ea1ea8c52f0dbaf8c.gif'),
(24, ':?', '<img src=\"#CONTEXT#/images/smilies/136dd33cba83140c7ce38db096d05aed.gif\" />', '136dd33cba83140c7ce38db096d05aed.gif'),
(25, ':idea:', '<img src=\"#CONTEXT#/images/smilies/8f7fb9dd46fb8ef86f81154a4feaada9.gif\" />', '8f7fb9dd46fb8ef86f81154a4feaada9.gif'),
(26, ':arrow:', '<img src=\"#CONTEXT#/images/smilies/d6741711aa045b812616853b5507fd2a.gif\" />', 'd6741711aa045b812616853b5507fd2a.gif'),
(27, ':hunf:', '<img src=\"#CONTEXT#/images/smilies/0320a00cb4bb5629ab9fc2bc1fcc4e9e.gif\" />', '0320a00cb4bb5629ab9fc2bc1fcc4e9e.gif'),
(28, ':-(', '<img src=\"#CONTEXT#/images/smilies/9d71f0541cff0a302a0309c5079e8dee.gif\"  />', '9d71f0541cff0a302a0309c5079e8dee.gif'),
(29, ':XD:', '<img src=\"#CONTEXT#/images/smilies/49869fe8223507d7223db3451e5321aa.gif\" />', '49869fe8223507d7223db3451e5321aa.gif'),
(30, ':thumbup:', '<img src=\"#CONTEXT#/images/smilies/e8a506dc4ad763aca51bec4ca7dc8560.gif\" />', 'e8a506dc4ad763aca51bec4ca7dc8560.gif'),
(31, ':thumbdown:', '<img src=\"#CONTEXT#/images/smilies/e78feac27fa924c4d0ad6cf5819f3554.gif\" />', 'e78feac27fa924c4d0ad6cf5819f3554.gif'),
(32, ':|', '<img src=\"#CONTEXT#/images/smilies/1cfd6e2a9a2c0cf8e74b49b35e2e46c7.gif\" />', '1cfd6e2a9a2c0cf8e74b49b35e2e46c7.gif');

-- --------------------------------------------------------

--
-- Table structure for table `jforum_themes`
--

CREATE TABLE `jforum_themes` (
  `themes_id` int(11) NOT NULL,
  `template_name` varchar(30) NOT NULL DEFAULT '',
  `style_name` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_topics`
--

CREATE TABLE `jforum_topics` (
  `topic_id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `topic_title` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_time` datetime DEFAULT NULL,
  `topic_views` int(11) DEFAULT '1',
  `topic_replies` int(11) DEFAULT '0',
  `topic_status` tinyint(3) DEFAULT '0',
  `topic_vote_id` int(11) NOT NULL DEFAULT '0',
  `topic_type` tinyint(3) DEFAULT '0',
  `topic_first_post_id` int(11) DEFAULT '0',
  `topic_last_post_id` int(11) NOT NULL DEFAULT '0',
  `topic_moved_id` int(11) DEFAULT '0',
  `moderated` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jforum_topics`
--

INSERT INTO `jforum_topics` (`topic_id`, `forum_id`, `topic_title`, `user_id`, `topic_time`, `topic_views`, `topic_replies`, `topic_status`, `topic_vote_id`, `topic_type`, `topic_first_post_id`, `topic_last_post_id`, `topic_moved_id`, `moderated`) VALUES
(1, 1, 'Welcome to JForum', 2, '2005-01-04 16:59:54', 1, 0, 0, 0, 0, 1, 1, 0, 0),
(2, 1, 'Support JForum - Please read', 2, '2017-06-16 12:36:46', 1, 0, 0, 0, 2, 2, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jforum_topics_watch`
--

CREATE TABLE `jforum_topics_watch` (
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_read` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_users`
--

CREATE TABLE `jforum_users` (
  `user_id` int(11) NOT NULL,
  `user_active` tinyint(1) DEFAULT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `user_password` varchar(32) NOT NULL DEFAULT '',
  `user_session_time` bigint(20) DEFAULT '0',
  `user_session_page` int(11) NOT NULL DEFAULT '0',
  `user_lastvisit` datetime DEFAULT NULL,
  `user_regdate` datetime DEFAULT NULL,
  `user_level` tinyint(4) DEFAULT NULL,
  `user_posts` int(11) NOT NULL DEFAULT '0',
  `user_timezone` varchar(5) NOT NULL DEFAULT '',
  `user_style` tinyint(4) DEFAULT NULL,
  `user_lang` varchar(255) NOT NULL DEFAULT '',
  `user_dateformat` varchar(20) NOT NULL DEFAULT '%d/%M/%Y %H:%i',
  `user_new_privmsg` int(11) NOT NULL DEFAULT '0',
  `user_unread_privmsg` int(11) NOT NULL DEFAULT '0',
  `user_last_privmsg` datetime DEFAULT NULL,
  `user_emailtime` datetime DEFAULT NULL,
  `user_viewemail` tinyint(1) DEFAULT '0',
  `user_attachsig` tinyint(1) DEFAULT '1',
  `user_allowhtml` tinyint(1) DEFAULT '0',
  `user_allowbbcode` tinyint(1) DEFAULT '1',
  `user_allowsmilies` tinyint(1) DEFAULT '1',
  `user_allowavatar` tinyint(1) DEFAULT '1',
  `user_allow_pm` tinyint(1) DEFAULT '1',
  `user_allow_viewonline` tinyint(1) DEFAULT '1',
  `user_notify` tinyint(1) DEFAULT '1',
  `user_notify_always` tinyint(1) DEFAULT '0',
  `user_notify_text` tinyint(1) DEFAULT '0',
  `user_notify_pm` tinyint(1) DEFAULT '1',
  `user_popup_pm` tinyint(1) DEFAULT '1',
  `rank_id` int(11) DEFAULT '0',
  `user_avatar` varchar(100) DEFAULT NULL,
  `user_avatar_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_email` varchar(255) NOT NULL DEFAULT '',
  `user_icq` varchar(15) DEFAULT NULL,
  `user_website` varchar(255) DEFAULT NULL,
  `user_from` varchar(100) DEFAULT NULL,
  `user_sig` text,
  `user_sig_bbcode_uid` varchar(10) DEFAULT NULL,
  `user_aim` varchar(255) DEFAULT NULL,
  `user_yim` varchar(255) DEFAULT NULL,
  `user_msnm` varchar(255) DEFAULT NULL,
  `user_occ` varchar(100) DEFAULT NULL,
  `user_interests` varchar(255) DEFAULT NULL,
  `user_biography` text,
  `user_actkey` varchar(32) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `themes_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_viewonline` tinyint(1) DEFAULT '1',
  `security_hash` varchar(32) DEFAULT NULL,
  `user_karma` double DEFAULT NULL,
  `user_authhash` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jforum_users`
--

INSERT INTO `jforum_users` (`user_id`, `user_active`, `username`, `user_password`, `user_session_time`, `user_session_page`, `user_lastvisit`, `user_regdate`, `user_level`, `user_posts`, `user_timezone`, `user_style`, `user_lang`, `user_dateformat`, `user_new_privmsg`, `user_unread_privmsg`, `user_last_privmsg`, `user_emailtime`, `user_viewemail`, `user_attachsig`, `user_allowhtml`, `user_allowbbcode`, `user_allowsmilies`, `user_allowavatar`, `user_allow_pm`, `user_allow_viewonline`, `user_notify`, `user_notify_always`, `user_notify_text`, `user_notify_pm`, `user_popup_pm`, `rank_id`, `user_avatar`, `user_avatar_type`, `user_email`, `user_icq`, `user_website`, `user_from`, `user_sig`, `user_sig_bbcode_uid`, `user_aim`, `user_yim`, `user_msnm`, `user_occ`, `user_interests`, `user_biography`, `user_actkey`, `gender`, `themes_id`, `deleted`, `user_viewonline`, `security_hash`, `user_karma`, `user_authhash`) VALUES
(1, NULL, 'Anonymous', 'nopass', 0, 0, NULL, '2017-06-16 12:36:46', NULL, 0, '', NULL, '', '%d/%M/%Y %H:%i', 0, 0, NULL, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(2, NULL, 'Admin', '21232f297a57a5a743894a0e4a801fc3', 0, 0, NULL, '2017-06-16 12:36:46', NULL, 1, '', NULL, '', '%d/%M/%Y %H:%i', 0, 0, NULL, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jforum_user_groups`
--

CREATE TABLE `jforum_user_groups` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jforum_user_groups`
--

INSERT INTO `jforum_user_groups` (`group_id`, `user_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jforum_vote_desc`
--

CREATE TABLE `jforum_vote_desc` (
  `vote_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `vote_text` varchar(255) NOT NULL DEFAULT '',
  `vote_start` datetime NOT NULL,
  `vote_length` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_vote_results`
--

CREATE TABLE `jforum_vote_results` (
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `vote_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `vote_option_text` varchar(255) NOT NULL DEFAULT '',
  `vote_result` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_vote_voters`
--

CREATE TABLE `jforum_vote_voters` (
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `vote_user_id` int(11) NOT NULL DEFAULT '0',
  `vote_user_ip` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jforum_words`
--

CREATE TABLE `jforum_words` (
  `word_id` int(11) NOT NULL,
  `word` varchar(100) NOT NULL DEFAULT '',
  `replacement` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `JoinConference`
--

CREATE TABLE `JoinConference` (
  `email` text,
  `NickName` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Login_Info`
--

CREATE TABLE `Login_Info` (
  `LoginId` int(11) NOT NULL,
  `name` text NOT NULL,
  `gender` enum('M','F','O') NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Login_Info`
--

INSERT INTO `Login_Info` (`LoginId`, `name`, `gender`, `createdOn`) VALUES
(2, 'Dummy', 'M', '2017-05-15 15:15:15');

-- --------------------------------------------------------

--
-- Table structure for table `Notification`
--

CREATE TABLE `Notification` (
  `notificationId` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `gid` int(11) DEFAULT NULL,
  `title` text NOT NULL,
  `content` text,
  `notificationType` int(11) NOT NULL,
  `viewedFlag` tinyint(1) NOT NULL,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ParticipantsDetail`
--

CREATE TABLE `ParticipantsDetail` (
  `Jid` varchar(100) NOT NULL,
  `email` text NOT NULL,
  `NickName` text NOT NULL,
  `StartTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TimeDifference` bigint(200) DEFAULT NULL,
  `Topic` text NOT NULL,
  `Message` text,
  `groupId` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PollData`
--

CREATE TABLE `PollData` (
  `pollId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `question` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `endDate` timestamp NOT NULL ,
  `createdBy` int(11) NOT NULL,
  `graphType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PollOptions`
--

CREATE TABLE `PollOptions` (
  `optionId` int(11) NOT NULL,
  `pollId` int(11) NOT NULL,
  `option` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PollVotes`
--

CREATE TABLE `PollVotes` (
  `voteId` int(11) NOT NULL,
  `pollId` int(11) NOT NULL,
  `optionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `voteTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Profile`
--

CREATE TABLE `Profile` (
  `profileId` int(11) NOT NULL,
  `profileName` text NOT NULL,
  `modifyGroup` tinyint(1) NOT NULL,
  `createTopic` tinyint(1) NOT NULL,
  `modifyTopic` tinyint(1) NOT NULL,
  `postingNote` tinyint(1) NOT NULL,
  `hideNote` tinyint(1) NOT NULL,
  `createAssignment` tinyint(1) NOT NULL,
  `viewAssignment` tinyint(1) NOT NULL,
  `submitAnswer` tinyint(1) NOT NULL,
  `gradeAssignment` tinyint(1) NOT NULL,
  `viewGrades` tinyint(1) NOT NULL,
  `createQuiz` tinyint(1) NOT NULL,
  `viewQuiz` tinyint(1) NOT NULL,
  `sendInvite` tinyint(1) NOT NULL,
  `submitQuiz` tinyint(1) NOT NULL,
  `gradeQuiz` tinyint(1) NOT NULL,
  `startVideoChat` tinyint(1) NOT NULL,
  `startDiscussionForum` tinyint(1) NOT NULL,
  `createPoll` tinyint(1) NOT NULL,
  `viewPoll` tinyint(1) NOT NULL,
  `acceptInvite` tinyint(1) NOT NULL COMMENT 'accept profile for the new user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Profile`
--

INSERT INTO `Profile` (`profileId`, `profileName`, `modifyGroup`, `createTopic`, `modifyTopic`, `postingNote`, `hideNote`, `createAssignment`, `viewAssignment`, `submitAnswer`, `gradeAssignment`, `viewGrades`, `createQuiz`, `viewQuiz`, `sendInvite`, `submitQuiz`, `gradeQuiz`, `startVideoChat`, `startDiscussionForum`, `createPoll`, `viewPoll`, `acceptInvite`) VALUES
(1, 'Admin', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 'Teacher', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1),
(3, 'Student', 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `QuizData`
--

CREATE TABLE `QuizData` (
  `quizId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `title` text NOT NULL,
  `qdate` timestamp NOT NULL ,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `QuizOption`
--

CREATE TABLE `QuizOption` (
  `optionId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `option` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `QuizQuesResponse`
--

CREATE TABLE `QuizQuesResponse` (
  `quesResponseId` int(11) NOT NULL,
  `quizResponseId` int(11) NOT NULL,
  `quesId` int(11) NOT NULL,
  `submission` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `QuizQuestion`
--

CREATE TABLE `QuizQuestion` (
  `questionId` int(11) NOT NULL,
  `quizId` int(11) NOT NULL,
  `question` text NOT NULL,
  `marks` int(11) NOT NULL,
  `answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `QuizResponse`
--

CREATE TABLE `QuizResponse` (
  `responseId` int(11) NOT NULL,
  `quizId` int(11) NOT NULL,
  `submitTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `marks` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `toDoList`
--

CREATE TABLE `toDoList` (
  `userId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `feature` text NOT NULL,
  `topic` text NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `topicList`
--

CREATE TABLE `topicList` (
  `topic_id` int(11) NOT NULL,
  `topic_name` varchar(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `topic_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserId` int(11) NOT NULL COMMENT 'Unique User Id',
  `email` text NOT NULL COMMENT 'email of the user',
  `password` text NOT NULL COMMENT 'password',
  `userIP` text NOT NULL COMMENT 'IP Address',
  `lastLoggedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loginStatus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`UserId`, `email`, `password`, `userIP`, `lastLoggedOn`, `loginStatus`) VALUES
(2, 'dummy@test.com', '12345678', '0', '2017-05-15 15:15:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `UserGroup`
--

CREATE TABLE `UserGroup` (
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `profileId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment_submission`
--
ALTER TABLE `assignment_submission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_assignment_submission_1_idx` (`aid`),
  ADD KEY `fk_assignment_submission_2_idx` (`uid`);

--
-- Indexes for table `ConferenceDetails`
--
ALTER TABLE `ConferenceDetails`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `Feature`
--
ALTER TABLE `Feature`
  ADD PRIMARY KEY (`featureId`);

--
-- Indexes for table `GroupFeatures`
--
ALTER TABLE `GroupFeatures`
  ADD KEY `fk_groupId2` (`groupId`);

--
-- Indexes for table `GroupInfo`
--
ALTER TABLE `GroupInfo`
  ADD PRIMARY KEY (`groupId`),
  ADD KEY `fk_uid` (`owner`),
  ADD KEY `fk_DefaultProfile_idx` (`defaultProfileId`);

--
-- Indexes for table `group_assignment`
--
ALTER TABLE `group_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_group_assignment_1_idx` (`gid`);

--
-- Indexes for table `group_note`
--
ALTER TABLE `group_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_group_note_1_idx` (`gid`),
  ADD KEY `fk_group_note_2_idx` (`createdBy`);

--
-- Indexes for table `group_post`
--
ALTER TABLE `group_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jforum_api`
--
ALTER TABLE `jforum_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Indexes for table `jforum_attach`
--
ALTER TABLE `jforum_attach`
  ADD PRIMARY KEY (`attach_id`),
  ADD KEY `idx_att_post` (`post_id`),
  ADD KEY `idx_att_priv` (`privmsgs_id`),
  ADD KEY `idx_att_user` (`user_id`);

--
-- Indexes for table `jforum_attach_desc`
--
ALTER TABLE `jforum_attach_desc`
  ADD PRIMARY KEY (`attach_desc_id`),
  ADD KEY `idx_att_d_att` (`attach_id`),
  ADD KEY `idx_att_d_ext` (`extension_id`);

--
-- Indexes for table `jforum_attach_quota`
--
ALTER TABLE `jforum_attach_quota`
  ADD PRIMARY KEY (`attach_quota_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `jforum_banlist`
--
ALTER TABLE `jforum_banlist`
  ADD PRIMARY KEY (`banlist_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `banlist_ip` (`banlist_ip`),
  ADD KEY `banlist_email` (`banlist_email`);

--
-- Indexes for table `jforum_banner`
--
ALTER TABLE `jforum_banner`
  ADD PRIMARY KEY (`banner_id`),
  ADD KEY `banner_id` (`banner_id`);

--
-- Indexes for table `jforum_bookmarks`
--
ALTER TABLE `jforum_bookmarks`
  ADD PRIMARY KEY (`bookmark_id`),
  ADD KEY `book_idx_relation` (`relation_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `jforum_categories`
--
ALTER TABLE `jforum_categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `jforum_config`
--
ALTER TABLE `jforum_config`
  ADD PRIMARY KEY (`config_id`);

--
-- Indexes for table `jforum_extensions`
--
ALTER TABLE `jforum_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD KEY `extension_group_id` (`extension_group_id`),
  ADD KEY `extension` (`extension`);

--
-- Indexes for table `jforum_extension_groups`
--
ALTER TABLE `jforum_extension_groups`
  ADD PRIMARY KEY (`extension_group_id`);

--
-- Indexes for table `jforum_forums`
--
ALTER TABLE `jforum_forums`
  ADD PRIMARY KEY (`forum_id`),
  ADD KEY `categories_id` (`categories_id`),
  ADD KEY `idx_forums_cats` (`categories_id`);

--
-- Indexes for table `jforum_forums_watch`
--
ALTER TABLE `jforum_forums_watch`
  ADD KEY `idx_fw_forum` (`forum_id`),
  ADD KEY `idx_fw_user` (`user_id`);

--
-- Indexes for table `jforum_groups`
--
ALTER TABLE `jforum_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `jforum_karma`
--
ALTER TABLE `jforum_karma`
  ADD PRIMARY KEY (`karma_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `post_user_id` (`post_user_id`),
  ADD KEY `from_user_id` (`from_user_id`);

--
-- Indexes for table `jforum_mail_integration`
--
ALTER TABLE `jforum_mail_integration`
  ADD KEY `forum_id` (`forum_id`);

--
-- Indexes for table `jforum_moderation_log`
--
ALTER TABLE `jforum_moderation_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_user_id` (`post_user_id`);

--
-- Indexes for table `jforum_posts`
--
ALTER TABLE `jforum_posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `forum_id` (`forum_id`),
  ADD KEY `post_time` (`post_time`),
  ADD KEY `need_moderate` (`need_moderate`);

--
-- Indexes for table `jforum_posts_text`
--
ALTER TABLE `jforum_posts_text`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `jforum_privmsgs`
--
ALTER TABLE `jforum_privmsgs`
  ADD PRIMARY KEY (`privmsgs_id`);

--
-- Indexes for table `jforum_privmsgs_text`
--
ALTER TABLE `jforum_privmsgs_text`
  ADD PRIMARY KEY (`privmsgs_id`);

--
-- Indexes for table `jforum_quota_limit`
--
ALTER TABLE `jforum_quota_limit`
  ADD PRIMARY KEY (`quota_limit_id`);

--
-- Indexes for table `jforum_ranks`
--
ALTER TABLE `jforum_ranks`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indexes for table `jforum_roles`
--
ALTER TABLE `jforum_roles`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `idx_group` (`group_id`),
  ADD KEY `idx_name` (`name`);

--
-- Indexes for table `jforum_role_values`
--
ALTER TABLE `jforum_role_values`
  ADD KEY `idx_role` (`role_id`);

--
-- Indexes for table `jforum_sessions`
--
ALTER TABLE `jforum_sessions`
  ADD KEY `idx_sessions_users` (`session_user_id`);

--
-- Indexes for table `jforum_smilies`
--
ALTER TABLE `jforum_smilies`
  ADD PRIMARY KEY (`smilie_id`);

--
-- Indexes for table `jforum_themes`
--
ALTER TABLE `jforum_themes`
  ADD PRIMARY KEY (`themes_id`);

--
-- Indexes for table `jforum_topics`
--
ALTER TABLE `jforum_topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `forum_id` (`forum_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `topic_first_post_id` (`topic_first_post_id`),
  ADD KEY `topic_last_post_id` (`topic_last_post_id`),
  ADD KEY `topic_moved_id` (`topic_moved_id`);

--
-- Indexes for table `jforum_topics_watch`
--
ALTER TABLE `jforum_topics_watch`
  ADD KEY `idx_topic` (`topic_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `jforum_users`
--
ALTER TABLE `jforum_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `jforum_user_groups`
--
ALTER TABLE `jforum_user_groups`
  ADD KEY `idx_group` (`group_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `jforum_vote_desc`
--
ALTER TABLE `jforum_vote_desc`
  ADD PRIMARY KEY (`vote_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `jforum_vote_results`
--
ALTER TABLE `jforum_vote_results`
  ADD KEY `vote_id` (`vote_id`);

--
-- Indexes for table `jforum_vote_voters`
--
ALTER TABLE `jforum_vote_voters`
  ADD KEY `vote_id` (`vote_id`),
  ADD KEY `vote_user_id` (`vote_user_id`);

--
-- Indexes for table `jforum_words`
--
ALTER TABLE `jforum_words`
  ADD PRIMARY KEY (`word_id`);

--
-- Indexes for table `Login_Info`
--
ALTER TABLE `Login_Info`
  ADD KEY `LoginId` (`LoginId`),
  ADD KEY `LoginId_2` (`LoginId`);

--
-- Indexes for table `Notification`
--
ALTER TABLE `Notification`
  ADD PRIMARY KEY (`notificationId`);

--
-- Indexes for table `PollData`
--
ALTER TABLE `PollData`
  ADD PRIMARY KEY (`pollId`);

--
-- Indexes for table `PollOptions`
--
ALTER TABLE `PollOptions`
  ADD PRIMARY KEY (`optionId`);

--
-- Indexes for table `PollVotes`
--
ALTER TABLE `PollVotes`
  ADD PRIMARY KEY (`voteId`);

--
-- Indexes for table `Profile`
--
ALTER TABLE `Profile`
  ADD PRIMARY KEY (`profileId`);

--
-- Indexes for table `QuizData`
--
ALTER TABLE `QuizData`
  ADD PRIMARY KEY (`quizId`);

--
-- Indexes for table `QuizOption`
--
ALTER TABLE `QuizOption`
  ADD PRIMARY KEY (`optionId`);

--
-- Indexes for table `QuizQuesResponse`
--
ALTER TABLE `QuizQuesResponse`
  ADD PRIMARY KEY (`quesResponseId`);

--
-- Indexes for table `QuizQuestion`
--
ALTER TABLE `QuizQuestion`
  ADD PRIMARY KEY (`questionId`);

--
-- Indexes for table `QuizResponse`
--
ALTER TABLE `QuizResponse`
  ADD PRIMARY KEY (`responseId`);

--
-- Indexes for table `toDoList`
--
ALTER TABLE `toDoList`
  ADD KEY `fk_groupid123` (`groupId`),
  ADD KEY `fk_userid12` (`userId`);

--
-- Indexes for table `topicList`
--
ALTER TABLE `topicList`
  ADD PRIMARY KEY (`topic_id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `UserGroup`
--
ALTER TABLE `UserGroup`
  ADD KEY `fk_userId` (`userId`),
  ADD KEY `fk_groupId` (`groupId`),
  ADD KEY `fk_profileId` (`profileId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment_submission`
--
ALTER TABLE `assignment_submission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ConferenceDetails`
--
ALTER TABLE `ConferenceDetails`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GroupInfo`
--
ALTER TABLE `GroupInfo`
  MODIFY `groupId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group_assignment`
--
ALTER TABLE `group_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `group_note`
--
ALTER TABLE `group_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `group_post`
--
ALTER TABLE `group_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `jforum_api`
--
ALTER TABLE `jforum_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_attach`
--
ALTER TABLE `jforum_attach`
  MODIFY `attach_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_attach_desc`
--
ALTER TABLE `jforum_attach_desc`
  MODIFY `attach_desc_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_attach_quota`
--
ALTER TABLE `jforum_attach_quota`
  MODIFY `attach_quota_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_banlist`
--
ALTER TABLE `jforum_banlist`
  MODIFY `banlist_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_banner`
--
ALTER TABLE `jforum_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_bookmarks`
--
ALTER TABLE `jforum_bookmarks`
  MODIFY `bookmark_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_categories`
--
ALTER TABLE `jforum_categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jforum_config`
--
ALTER TABLE `jforum_config`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jforum_extensions`
--
ALTER TABLE `jforum_extensions`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_extension_groups`
--
ALTER TABLE `jforum_extension_groups`
  MODIFY `extension_group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_forums`
--
ALTER TABLE `jforum_forums`
  MODIFY `forum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jforum_groups`
--
ALTER TABLE `jforum_groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jforum_karma`
--
ALTER TABLE `jforum_karma`
  MODIFY `karma_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_moderation_log`
--
ALTER TABLE `jforum_moderation_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_posts`
--
ALTER TABLE `jforum_posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jforum_privmsgs`
--
ALTER TABLE `jforum_privmsgs`
  MODIFY `privmsgs_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_quota_limit`
--
ALTER TABLE `jforum_quota_limit`
  MODIFY `quota_limit_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_ranks`
--
ALTER TABLE `jforum_ranks`
  MODIFY `rank_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_roles`
--
ALTER TABLE `jforum_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `jforum_smilies`
--
ALTER TABLE `jforum_smilies`
  MODIFY `smilie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `jforum_themes`
--
ALTER TABLE `jforum_themes`
  MODIFY `themes_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_topics`
--
ALTER TABLE `jforum_topics`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jforum_users`
--
ALTER TABLE `jforum_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jforum_vote_desc`
--
ALTER TABLE `jforum_vote_desc`
  MODIFY `vote_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jforum_words`
--
ALTER TABLE `jforum_words`
  MODIFY `word_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Profile`
--
ALTER TABLE `Profile`
  MODIFY `profileId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `topicList`
--
ALTER TABLE `topicList`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique User Id', AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignment_submission`
--
ALTER TABLE `assignment_submission`
  ADD CONSTRAINT `fk_assignment_submission_1` FOREIGN KEY (`aid`) REFERENCES `group_assignment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_assignment_submission_2` FOREIGN KEY (`uid`) REFERENCES `Login_Info` (`LoginId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `GroupFeatures`
--
ALTER TABLE `GroupFeatures`
  ADD CONSTRAINT `fk_groupId2` FOREIGN KEY (`groupId`) REFERENCES `GroupInfo` (`groupId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `GroupInfo`
--
ALTER TABLE `GroupInfo`
  ADD CONSTRAINT `fk_DefaultProfile` FOREIGN KEY (`defaultProfileId`) REFERENCES `Profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_uid` FOREIGN KEY (`owner`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_assignment`
--
ALTER TABLE `group_assignment`
  ADD CONSTRAINT `fk_group_assignment_1` FOREIGN KEY (`gid`) REFERENCES `GroupInfo` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `group_note`
--
ALTER TABLE `group_note`
  ADD CONSTRAINT `fk_group_note_1` FOREIGN KEY (`gid`) REFERENCES `GroupInfo` (`groupId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_group_note_2` FOREIGN KEY (`createdBy`) REFERENCES `User` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Login_Info`
--
ALTER TABLE `Login_Info`
  ADD CONSTRAINT `fk_loginid` FOREIGN KEY (`LoginId`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `toDoList`
--
ALTER TABLE `toDoList`
  ADD CONSTRAINT `fk_groupid123` FOREIGN KEY (`groupId`) REFERENCES `GroupInfo` (`groupId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_userid12` FOREIGN KEY (`userId`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `UserGroup`
--
ALTER TABLE `UserGroup`
  ADD CONSTRAINT `fk_groupId` FOREIGN KEY (`groupId`) REFERENCES `GroupInfo` (`groupId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profileId` FOREIGN KEY (`profileId`) REFERENCES `Profile` (`profileId`),
  ADD CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
