-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2017 at 09:22 PM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `china`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add site', 7, 'add_site'),
(20, 'Can change site', 7, 'change_site'),
(21, 'Can delete site', 7, 'delete_site'),
(22, 'Can add user social auth', 8, 'add_usersocialauth'),
(23, 'Can change user social auth', 8, 'change_usersocialauth'),
(24, 'Can delete user social auth', 8, 'delete_usersocialauth'),
(25, 'Can add nonce', 9, 'add_nonce'),
(26, 'Can change nonce', 9, 'change_nonce'),
(27, 'Can delete nonce', 9, 'delete_nonce'),
(28, 'Can add association', 10, 'add_association'),
(29, 'Can change association', 10, 'change_association'),
(30, 'Can delete association', 10, 'delete_association'),
(31, 'Can add code', 11, 'add_code'),
(32, 'Can change code', 11, 'change_code'),
(33, 'Can delete code', 11, 'delete_code'),
(34, 'Can add api access', 12, 'add_apiaccess'),
(35, 'Can change api access', 12, 'change_apiaccess'),
(36, 'Can delete api access', 12, 'delete_apiaccess'),
(37, 'Can add api key', 13, 'add_apikey'),
(38, 'Can change api key', 13, 'change_apikey'),
(39, 'Can delete api key', 13, 'delete_apikey'),
(40, 'Can add cors model', 14, 'add_corsmodel'),
(41, 'Can change cors model', 14, 'change_corsmodel'),
(42, 'Can delete cors model', 14, 'delete_corsmodel'),
(43, 'Can add my tagged item', 15, 'add_mytaggeditem'),
(44, 'Can change my tagged item', 15, 'change_mytaggeditem'),
(45, 'Can delete my tagged item', 15, 'delete_mytaggeditem'),
(46, 'Can add attachment', 16, 'add_attachment'),
(47, 'Can change attachment', 16, 'change_attachment'),
(48, 'Can delete attachment', 16, 'delete_attachment'),
(49, 'Can add admin division', 17, 'add_admindivision'),
(50, 'Can change admin division', 17, 'change_admindivision'),
(51, 'Can delete admin division', 17, 'delete_admindivision'),
(52, 'Can add grade', 18, 'add_grade'),
(53, 'Can change grade', 18, 'change_grade'),
(54, 'Can delete grade', 18, 'delete_grade'),
(55, 'Can add org', 19, 'add_org'),
(56, 'Can change org', 19, 'change_org'),
(57, 'Can delete org', 19, 'delete_org'),
(58, 'Can add title', 20, 'add_title'),
(59, 'Can change title', 20, 'change_title'),
(60, 'Can delete title', 20, 'delete_title'),
(61, 'Can add post', 21, 'add_post'),
(62, 'Can change post', 21, 'change_post'),
(63, 'Can delete post', 21, 'delete_post'),
(64, 'Can add person', 22, 'add_person'),
(65, 'Can change person', 22, 'change_person'),
(66, 'Can delete person', 22, 'delete_person'),
(67, 'Can add career', 23, 'add_career'),
(68, 'Can change career', 23, 'change_career'),
(69, 'Can delete career', 23, 'delete_career'),
(70, 'Can add connection', 24, 'add_connection'),
(71, 'Can change connection', 24, 'change_connection'),
(72, 'Can delete connection', 24, 'delete_connection');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$15000$2QlsH9MrbCsQ$6Tl5Y9VSrwX9MCyYMxBhdFSTEl4/3M2mEX/TT6XaxrY=', '2017-01-14 15:30:38', 1, 'fengxia', '', '', '', 1, 1, '2017-01-13 20:43:51');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `corsheaders_corsmodel`
--

CREATE TABLE IF NOT EXISTS `corsheaders_corsmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cors` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=146 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2017-01-13 20:44:48', '1', '中央', 1, '', 17, 1),
(2, '2017-01-13 20:46:04', '1', '习近平', 1, '', 22, 1),
(3, '2017-01-13 20:46:52', '2', '李克强', 1, '', 22, 1),
(4, '2017-01-13 20:47:30', '1', '国家级正职', 1, '', 18, 1),
(5, '2017-01-13 20:47:46', '2', '国家级副职', 1, '', 18, 1),
(6, '2017-01-13 20:47:55', '3', '省部级正职', 1, '', 18, 1),
(7, '2017-01-13 20:48:04', '4', '省部级副职', 1, '', 18, 1),
(8, '2017-01-13 20:48:16', '5', '厅局级正职', 1, '', 18, 1),
(9, '2017-01-13 20:48:24', '6', '厅局级副职', 1, '', 18, 1),
(10, '2017-01-13 20:48:34', '7', '县处级正职', 1, '', 18, 1),
(11, '2017-01-13 20:48:50', '8', '县处级副职', 1, '', 18, 1),
(12, '2017-01-13 20:49:45', '1', '国务院总理', 1, '', 20, 1),
(13, '2017-01-13 20:50:52', '2', '总书记', 1, '', 20, 1),
(14, '2017-01-13 20:51:57', '1', '中央委员会', 1, '', 19, 1),
(15, '2017-01-13 20:53:09', '2', '国务院', 1, '', 19, 1),
(16, '2017-01-13 20:53:39', '1', '国务院总理 (中央)', 1, '', 21, 1),
(17, '2017-01-13 20:53:52', '2', '总书记 (中央)', 1, '', 21, 1),
(18, '2017-01-13 20:55:30', '1', 'Career object', 1, '', 23, 1),
(19, '2017-01-13 20:56:21', '2', 'Career object', 1, '', 23, 1),
(20, '2017-01-13 21:09:21', '2', '国务院', 2, 'No fields changed.', 19, 1),
(21, '2017-01-13 21:09:59', '1', '中央委员会', 2, 'No fields changed.', 19, 1),
(22, '2017-01-14 01:55:55', '1', '习近平', 2, 'Changed photo.', 22, 1),
(23, '2017-01-14 01:58:17', '1', '习近平', 2, 'Changed photo.', 22, 1),
(24, '2017-01-14 02:01:22', '1', '习近平', 2, 'Changed eng_name.', 22, 1),
(25, '2017-01-14 02:01:46', '2', '李克强', 2, 'Changed eng_name.', 22, 1),
(26, '2017-01-14 02:37:41', '3', '国家主席', 1, '', 20, 1),
(27, '2017-01-14 02:40:44', '3', '中华人民共和国主席', 1, '', 19, 1),
(28, '2017-01-14 02:41:33', '3', '国家主席 (中央)', 1, '', 21, 1),
(29, '2017-01-14 02:42:35', '3', 'Career object', 1, '', 23, 1),
(30, '2017-01-14 02:45:49', '4', '政治局常委', 1, '', 20, 1),
(31, '2017-01-14 02:48:51', '4', '中国共产党中央政治局常务委员会', 1, '', 19, 1),
(32, '2017-01-14 02:49:03', '4', '政治局常委 (中央)', 1, '', 21, 1),
(33, '2017-01-14 02:50:02', '4', 'Career object', 1, '', 23, 1),
(34, '2017-01-14 02:59:12', '4', '中国共产党中央政治局常务委员会', 2, 'Changed branch.', 19, 1),
(35, '2017-01-14 02:59:39', '3', '中华人民共和国主席', 2, 'Changed branch.', 19, 1),
(36, '2017-01-14 03:00:07', '2', '国务院', 2, 'Changed branch.', 19, 1),
(37, '2017-01-14 03:00:38', '1', '中央委员会', 2, 'Changed branch.', 19, 1),
(38, '2017-01-14 15:19:39', '5', '省长', 1, '', 20, 1),
(39, '2017-01-14 15:21:23', '6', '副省长', 1, '', 20, 1),
(40, '2017-01-14 15:24:10', '2', '中共中央总书记', 2, 'Changed name and eng_name.', 20, 1),
(41, '2017-01-14 15:26:30', '3', '中华人民共和国主席', 2, 'Changed name and eng_name.', 20, 1),
(42, '2017-01-14 15:33:02', '7', '政治局委员', 1, '', 20, 1),
(43, '2017-01-14 15:35:07', '8', '省委书记', 1, '', 20, 1),
(44, '2017-01-14 15:35:46', '9', '部长', 1, '', 20, 1),
(45, '2017-01-14 15:36:11', '10', '司长 ', 1, '', 20, 1),
(46, '2017-01-14 15:36:32', '11', '局长 ', 1, '', 20, 1),
(47, '2017-01-14 15:36:57', '12', '代省长', 1, '', 20, 1),
(48, '2017-01-14 15:37:51', '13', '市长', 1, '', 20, 1),
(49, '2017-01-14 15:43:16', '5', '福建省政府', 1, '', 19, 1),
(50, '2017-01-14 15:43:42', '2', '福建', 1, '', 17, 1),
(51, '2017-01-14 15:43:48', '5', '省长 (福建)', 1, '', 21, 1),
(52, '2017-01-14 15:44:26', '5', 'Career object', 1, '', 23, 1),
(53, '2017-01-14 15:44:52', '6', '副省长 (福建)', 1, '', 21, 1),
(54, '2017-01-14 15:45:18', '6', 'Career object', 1, '', 23, 1),
(55, '2017-01-14 15:49:36', '14', '省委副书记', 1, '', 20, 1),
(56, '2017-01-14 15:50:16', '7', '省委书记 (福建)', 1, '', 21, 1),
(57, '2017-01-14 15:50:44', '7', 'Career object', 1, '', 23, 1),
(58, '2017-01-14 16:01:40', '1', '中央', 2, 'Changed level.', 17, 1),
(59, '2017-01-14 16:01:48', '2', '福建', 2, 'Changed level.', 17, 1),
(60, '2017-01-14 16:02:07', '3', '福州', 1, '', 17, 1),
(61, '2017-01-14 16:03:34', '14', '省委副书记', 2, 'Changed eng_name.', 20, 1),
(62, '2017-01-14 16:04:49', '8', '省委副书记 (福建)', 1, '', 21, 1),
(63, '2017-01-14 16:06:36', '5', '省政府', 2, 'Changed name and abbrev.', 19, 1),
(64, '2017-01-14 16:07:02', '6', '省党委', 1, '', 19, 1),
(65, '2017-01-14 16:07:34', '7', '省委书记 (福建)', 2, 'Changed org.', 21, 1),
(66, '2017-01-14 16:07:43', '8', '省委副书记 (福建)', 2, 'Changed org.', 21, 1),
(67, '2017-01-14 16:08:26', '7', 'Career object', 2, 'Changed post.', 23, 1),
(68, '2017-01-14 16:09:24', '7', '市党委', 1, '', 19, 1),
(69, '2017-01-14 16:10:57', '15', '市委书记', 1, '', 20, 1),
(70, '2017-01-14 16:11:11', '9', '市委书记 (福州)', 1, '', 21, 1),
(71, '2017-01-14 16:11:54', '16', '市委副书记', 1, '', 20, 1),
(72, '2017-01-14 16:12:01', '10', '市委副书记 (福州)', 1, '', 21, 1),
(73, '2017-01-14 16:12:36', '8', 'Career object', 1, '', 23, 1),
(74, '2017-01-14 16:13:30', '4', '宁德', 1, '', 17, 1),
(75, '2017-01-14 16:13:32', '11', '市委书记 (宁德)', 1, '', 21, 1),
(76, '2017-01-14 16:14:01', '9', 'Career object', 1, '', 23, 1),
(77, '2017-01-14 16:17:11', '17', '常务副市长', 1, '', 20, 1),
(78, '2017-01-14 16:18:08', '8', '市党委', 1, '', 19, 1),
(79, '2017-01-14 16:18:22', '12', '市委书记 (宁德)', 1, '', 21, 1),
(80, '2017-01-14 16:18:38', '12', '市委书记 (宁德)', 3, '', 21, 1),
(81, '2017-01-14 16:19:00', '8', '市党委', 3, '', 19, 1),
(82, '2017-01-14 16:19:19', '13', '市委副书记 (宁德)', 1, '', 21, 1),
(83, '2017-01-14 16:20:20', '9', '市政府', 1, '', 19, 1),
(84, '2017-01-14 16:21:08', '5', '厦门', 1, '', 17, 1),
(85, '2017-01-14 16:21:13', '14', '常务副市长 (厦门)', 1, '', 21, 1),
(86, '2017-01-14 16:21:40', '10', 'Career object', 1, '', 23, 1),
(87, '2017-01-14 16:37:21', '6', '浙江', 1, '', 17, 1),
(88, '2017-01-14 16:37:25', '15', '省委书记 (浙江)', 1, '', 21, 1),
(89, '2017-01-14 16:38:03', '11', 'Career object', 1, '', 23, 1),
(90, '2017-01-14 16:39:18', '18', '国家副主席', 1, '', 20, 1),
(91, '2017-01-14 16:39:53', '16', '国家副主席 (中央)', 1, '', 21, 1),
(92, '2017-01-14 16:40:26', '12', 'Career object', 1, '', 23, 1),
(93, '2017-01-14 16:41:14', '10', '党校', 1, '', 19, 1),
(94, '2017-01-14 16:44:52', '19', '党校校长', 1, '', 20, 1),
(95, '2017-01-14 16:45:16', '17', '党校校长 (中央)', 1, '', 21, 1),
(96, '2017-01-14 16:45:50', '13', 'Career object', 1, '', 23, 1),
(97, '2017-01-14 16:47:37', '10', '中央党校', 2, 'Changed name, abbrev and eng_name.', 19, 1),
(98, '2017-01-14 16:48:36', '19', '中央党校校长', 2, 'Changed name, abbrev, eng_name and grade.', 20, 1),
(99, '2017-01-14 17:01:12', '11', '中国共产党中央军事委员会', 1, '', 19, 1),
(100, '2017-01-14 17:01:36', '11', '中央军事委员会', 2, 'Changed name.', 19, 1),
(101, '2017-01-14 17:06:36', '9', '部队', 1, '', 18, 1),
(102, '2017-01-14 17:07:55', '20', '军委主席', 1, '', 20, 1),
(103, '2017-01-14 17:09:05', '21', '军委副主席', 1, '', 20, 1),
(104, '2017-01-14 17:09:13', '20', '军委主席', 2, 'Changed ref.', 20, 1),
(105, '2017-01-14 17:09:41', '18', '军委主席 (中央)', 1, '', 21, 1),
(106, '2017-01-14 17:09:55', '19', '军委副主席 (中央)', 1, '', 21, 1),
(107, '2017-01-14 17:10:27', '14', 'Career object', 1, '', 23, 1),
(108, '2017-01-14 17:11:16', '15', 'Career object', 1, '', 23, 1),
(109, '2017-01-14 18:03:59', '1', '习近平', 2, 'Changed birthday.', 22, 1),
(110, '2017-01-15 15:48:12', '7', '北京', 1, '', 17, 1),
(111, '2017-01-15 15:48:40', '8', '天津', 1, '', 17, 1),
(112, '2017-01-15 15:49:12', '9', '河北', 1, '', 17, 1),
(113, '2017-01-15 15:49:38', '10', '山西', 1, '', 17, 1),
(114, '2017-01-15 15:50:19', '11', '内蒙古', 1, '', 17, 1),
(115, '2017-01-15 15:50:41', '12', '辽宁', 1, '', 17, 1),
(116, '2017-01-15 15:51:00', '13', '吉林', 1, '', 17, 1),
(117, '2017-01-15 15:51:23', '14', '黑龙江', 1, '', 17, 1),
(118, '2017-01-15 15:52:04', '15', '上海', 1, '', 17, 1),
(119, '2017-01-15 15:52:22', '16', '江苏', 1, '', 17, 1),
(120, '2017-01-15 15:52:54', '17', '安徽', 1, '', 17, 1),
(121, '2017-01-15 15:53:14', '18', '江西', 1, '', 17, 1),
(122, '2017-01-15 15:53:37', '19', '山东', 1, '', 17, 1),
(123, '2017-01-15 15:53:57', '20', '河南', 1, '', 17, 1),
(124, '2017-01-15 15:54:41', '21', '湖北', 1, '', 17, 1),
(125, '2017-01-15 15:55:03', '22', '湖南', 1, '', 17, 1),
(126, '2017-01-15 15:55:22', '23', '广东', 1, '', 17, 1),
(127, '2017-01-15 15:55:41', '24', '广西', 1, '', 17, 1),
(128, '2017-01-15 15:56:01', '25', '海南', 1, '', 17, 1),
(129, '2017-01-15 15:56:31', '26', '重庆', 1, '', 17, 1),
(130, '2017-01-15 15:57:08', '27', '四川', 1, '', 17, 1),
(131, '2017-01-15 15:57:41', '28', '贵州', 1, '', 17, 1),
(132, '2017-01-15 15:58:02', '29', '云南', 1, '', 17, 1),
(133, '2017-01-15 15:58:26', '30', '西藏', 1, '', 17, 1),
(134, '2017-01-15 15:58:44', '31', '陕西', 1, '', 17, 1),
(135, '2017-01-15 15:59:03', '32', '甘肃', 1, '', 17, 1),
(136, '2017-01-15 15:59:23', '33', '青海', 1, '', 17, 1),
(137, '2017-01-15 15:59:50', '34', '宁夏', 1, '', 17, 1),
(138, '2017-01-15 16:00:15', '35', '新疆', 1, '', 17, 1),
(139, '2017-01-15 16:00:41', '36', '台湾', 1, '', 17, 1),
(140, '2017-01-15 16:09:35', '37', '香港', 1, '', 17, 1),
(141, '2017-01-15 16:10:13', '38', '澳门', 1, '', 17, 1),
(142, '2017-01-15 16:15:52', '38', '澳门', 2, 'Changed eng_name.', 17, 1),
(143, '2017-01-15 16:17:50', '2', '李克强', 2, 'Changed birthday and photo.', 22, 1),
(144, '2017-01-15 16:34:12', '4', '宁德', 2, 'Changed ref.', 17, 1),
(145, '2017-01-15 16:34:44', '4', '宁德', 2, 'Changed eng_name.', 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'site', 'sites', 'site'),
(8, 'user social auth', 'default', 'usersocialauth'),
(9, 'nonce', 'default', 'nonce'),
(10, 'association', 'default', 'association'),
(11, 'code', 'default', 'code'),
(12, 'api access', 'tastypie', 'apiaccess'),
(13, 'api key', 'tastypie', 'apikey'),
(14, 'cors model', 'corsheaders', 'corsmodel'),
(15, 'my tagged item', 'mandarin', 'mytaggeditem'),
(16, 'attachment', 'mandarin', 'attachment'),
(17, 'admin division', 'mandarin', 'admindivision'),
(18, 'grade', 'mandarin', 'grade'),
(19, 'org', 'mandarin', 'org'),
(20, 'title', 'mandarin', 'title'),
(21, 'post', 'mandarin', 'post'),
(22, 'person', 'mandarin', 'person'),
(23, 'career', 'mandarin', 'career'),
(24, 'connection', 'mandarin', 'connection');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-01-13 20:43:36'),
(2, 'auth', '0001_initial', '2017-01-13 20:43:36'),
(3, 'admin', '0001_initial', '2017-01-13 20:43:36'),
(4, 'default', '0001_initial', '2017-01-13 20:43:36'),
(5, 'mandarin', '0001_initial', '2017-01-13 20:43:37'),
(6, 'sessions', '0001_initial', '2017-01-13 20:43:37'),
(7, 'sites', '0001_initial', '2017-01-13 20:43:37'),
(8, 'tastypie', '0001_initial', '2017-01-13 20:43:37'),
(9, 'default', '0002_auto_20151006_0122', '2017-01-14 01:47:23'),
(10, 'default', '0003_auto_20151016_1515', '2017-01-14 01:47:23'),
(11, 'mandarin', '0002_person_photro_url', '2017-01-14 01:47:23'),
(12, 'mandarin', '0003_auto_20170114_0152', '2017-01-14 01:52:52'),
(13, 'mandarin', '0004_auto_20170114_0153', '2017-01-14 01:53:53'),
(14, 'mandarin', '0005_person_eng_name', '2017-01-14 02:01:02'),
(15, 'mandarin', '0006_auto_20170114_0258', '2017-01-14 02:58:32'),
(16, 'mandarin', '0007_auto_20170114_1559', '2017-01-14 16:00:11'),
(17, 'mandarin', '0008_auto_20170114_1601', '2017-01-14 16:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('bfooxlcp44l2dmozen9rmjxfojmq6r50', 'N2RmMGJkMzEzYjVjYWE1ZjYyYzZkNjFjMGE4YzkyMmFlNGFhOTJjYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM3ZTM5YmI4OTMyMmY1Y2Q1M2RjMzk1YmY3NzcxMWIzNjExYzJmMWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2017-01-27 20:44:09'),
('j5lsisyh8udfzxrjm6kmxinled3j5yaz', 'N2RmMGJkMzEzYjVjYWE1ZjYyYzZkNjFjMGE4YzkyMmFlNGFhOTJjYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM3ZTM5YmI4OTMyMmY1Y2Q1M2RjMzk1YmY3NzcxMWIzNjExYzJmMWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2017-01-28 01:33:35'),
('revlva2kk2dx9021fg0z4e0y6gr0gjld', 'N2RmMGJkMzEzYjVjYWE1ZjYyYzZkNjFjMGE4YzkyMmFlNGFhOTJjYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM3ZTM5YmI4OTMyMmY1Y2Q1M2RjMzk1YmY3NzcxMWIzNjExYzJmMWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2017-01-28 15:23:29'),
('x1fqv5usybho6mneynyrqd0izdvg1aka', 'N2RmMGJkMzEzYjVjYWE1ZjYyYzZkNjFjMGE4YzkyMmFlNGFhOTJjYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM3ZTM5YmI4OTMyMmY1Y2Q1M2RjMzk1YmY3NzcxMWIzNjExYzJmMWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2017-01-28 15:30:38');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `mandarin_admindivision`
--

CREATE TABLE IF NOT EXISTS `mandarin_admindivision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `abbrev` varchar(128) NOT NULL,
  `eng_name` varchar(256) DEFAULT NULL,
  `description` longtext,
  `help_text` varchar(64) DEFAULT NULL,
  `ref` varchar(200) DEFAULT NULL,
  `level` varchar(8) NOT NULL,
  `code` varchar(12) DEFAULT NULL,
  `ISO_3166_2_CN` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `mandarin_admindivision`
--

INSERT INTO `mandarin_admindivision` (`id`, `name`, `abbrev`, `eng_name`, `description`, `help_text`, `ref`, `level`, `code`, `ISO_3166_2_CN`) VALUES
(1, '中央', '中央', 'Central government', '', '', '', '中央', '', ''),
(2, '福建', '福建', 'Fujian', '', '', '', '省', '', ''),
(3, '福州', '福州', 'Fuzhou', '', '', '', '市', '', ''),
(4, '宁德', '宁德', 'Mindong', '', '', 'https://en.wikipedia.org/wiki/Ningde', '市', '', ''),
(5, '厦门', '厦门', 'Xiamen', '', '', '', '市', '', ''),
(6, '浙江', '浙江', 'Zhejiang', '', '', '', '省', '', ''),
(7, '北京', '北京', 'Beijing', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '直辖市', '', 'CN-11'),
(8, '天津', '天津', 'Tianjin', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '直辖市', '', 'CN-12'),
(9, '河北', '河北', 'hebei', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-13'),
(10, '山西', '山西', 'Shanxi', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-14'),
(11, '内蒙古', '内蒙古', 'Inner Mongolia', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '自治区', '', 'CN-15'),
(12, '辽宁', '辽宁', 'Liaoning', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-21'),
(13, '吉林', '吉林', 'Jilin', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-22'),
(14, '黑龙江', '黑龙江', 'Heilongjiang', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-23'),
(15, '上海', '上海', 'Shanghai', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '直辖市', '', 'CN-31'),
(16, '江苏', '江苏', 'Jiangsu', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-32'),
(17, '安徽', '安徽', 'Anhui', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-34'),
(18, '江西', '江西', 'Jiangxi', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-36'),
(19, '山东', '山东', 'Shandong', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-37'),
(20, '河南', '河南', 'Henan', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-37'),
(21, '湖北', '湖北', 'Hubei', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-42'),
(22, '湖南', '湖南', 'Hunan', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-43'),
(23, '广东', '广东', 'Guangdong', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-44'),
(24, '广西', '广西', 'Guangxi', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-45'),
(25, '海南', '海南', 'Hainan', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-46'),
(26, '重庆', '重庆', 'Chongqing', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '直辖市', '', 'CN-50'),
(27, '四川', '四川', 'Sichuan', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-51'),
(28, '贵州', '贵州', 'Guizhou', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-52'),
(29, '云南', '云南', 'Yunnan', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-53'),
(30, '西藏', '西藏', 'Tibet', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '自治区', '', 'CN-54'),
(31, '陕西', '陕西', 'Shannxi', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-61'),
(32, '甘肃', '甘肃', 'Gansu', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-62'),
(33, '青海', '青海', 'Qinghai', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-63'),
(34, '宁夏', '宁夏', 'Ningxia', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '自治区', '', 'CN-64'),
(35, '新疆', '新疆', 'Xinjiang', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '自治区', '', 'CN-65'),
(36, '台湾', '台湾', 'Taiwan', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '省', '', 'CN-71'),
(37, '香港', '香港', 'Hongkong', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '特别行政区', '', 'CN-91'),
(38, '澳门', '澳门', 'Macao', '', '', 'https://en.wikipedia.org/wiki/ISO_3166-2:CN', '特别行政区', '', 'CN-92');

-- --------------------------------------------------------

--
-- Table structure for table `mandarin_attachment`
--

CREATE TABLE IF NOT EXISTS `mandarin_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(64) NOT NULL,
  `file` varchar(100) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mandarin_attachment_417f1b1c` (`content_type_id`),
  KEY `mandarin_attachment_e93cb7eb` (`created_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mandarin_career`
--

CREATE TABLE IF NOT EXISTS `mandarin_career` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` varchar(8) NOT NULL,
  `end` varchar(8) DEFAULT NULL,
  `ref` varchar(200) DEFAULT NULL,
  `person_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mandarin_career_a8452ca7` (`person_id`),
  KEY `mandarin_career_f3aa1999` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mandarin_career`
--

INSERT INTO `mandarin_career` (`id`, `start`, `end`, `ref`, `person_id`, `post_id`) VALUES
(1, '20121115', '', 'https://en.wikipedia.org/wiki/Xi_Jinping', 1, 2),
(2, '20130315', '', 'https://zh.wikipedia.org/wiki/%E6%9D%8E%E5%85%8B%E5%BC%BA', 2, 1),
(3, '20130314', '', 'http://www.cnn.com/2013/01/04/world/asia/xi-jinping---fast-facts/', 1, 3),
(4, '200710', '', 'http://www.cnn.com/2013/01/04/world/asia/xi-jinping---fast-facts/', 1, 4),
(5, '2000', '2002', 'http://www.cnn.com/2013/01/04/world/asia/xi-jinping---fast-facts/', 1, 5),
(6, '1999', '2000', 'http://www.cnn.com/2013/01/04/world/asia/xi-jinping---fast-facts/', 1, 6),
(7, '1996', '1999', 'http://www.cnn.com/2013/01/04/world/asia/xi-jinping---fast-facts/', 1, 8),
(8, '1990', '1996', 'http://www.cnn.com/2013/01/04/world/asia/xi-jinping---fast-facts/', 1, 9),
(9, '1988', '1990', '', 1, 11),
(10, '1985', '1988', 'http://www.cnn.com/2013/01/04/world/asia/xi-jinping---fast-facts/', 1, 14),
(11, '2002', '2007', 'http://www.cnn.com/2013/01/04/world/asia/xi-jinping---fast-facts/', 1, 15),
(12, '2008', '2013', 'http://www.cnn.com/2013/01/04/world/asia/xi-jinping---fast-facts/', 1, 16),
(13, '2007', '2013', 'http://www.cnn.com/2013/01/04/world/asia/xi-jinping---fast-facts/', 1, 17),
(14, '2010', '2012', 'http://www.cnn.com/2013/01/04/world/asia/xi-jinping---fast-facts/', 1, 19),
(15, '201202', '', 'http://www.cnn.com/2013/01/04/world/asia/xi-jinping---fast-facts/', 1, 18);

-- --------------------------------------------------------

--
-- Table structure for table `mandarin_connection`
--

CREATE TABLE IF NOT EXISTS `mandarin_connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nature` varchar(16) NOT NULL,
  `by_blood` tinyint(1) NOT NULL,
  `ref` varchar(200) DEFAULT NULL,
  `person_a_id` int(11) NOT NULL,
  `person_b_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mandarin_connection_795d8b82` (`person_a_id`),
  KEY `mandarin_connection_7b21b2d0` (`person_b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mandarin_grade`
--

CREATE TABLE IF NOT EXISTS `mandarin_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mandarin_grade`
--

INSERT INTO `mandarin_grade` (`id`, `name`) VALUES
(1, '国家级正职'),
(2, '国家级副职'),
(3, '省部级正职'),
(4, '省部级副职'),
(5, '厅局级正职'),
(6, '厅局级副职'),
(7, '县处级正职'),
(8, '县处级副职'),
(9, '部队');

-- --------------------------------------------------------

--
-- Table structure for table `mandarin_mytaggeditem`
--

CREATE TABLE IF NOT EXISTS `mandarin_mytaggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mandarin_mytaggeditem_e4d23e84` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mandarin_org`
--

CREATE TABLE IF NOT EXISTS `mandarin_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `abbrev` varchar(128) NOT NULL,
  `eng_name` varchar(256) DEFAULT NULL,
  `description` longtext,
  `help_text` varchar(64) DEFAULT NULL,
  `ref` varchar(200) DEFAULT NULL,
  `branch` varchar(32) DEFAULT NULL,
  `official_url` varchar(200) DEFAULT NULL,
  `report_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mandarin_org_b9970ed0` (`report_to_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mandarin_org`
--

INSERT INTO `mandarin_org` (`id`, `name`, `abbrev`, `eng_name`, `description`, `help_text`, `ref`, `branch`, `official_url`, `report_to_id`) VALUES
(1, '中央委员会', '中央委员会', 'Central Committee', '', '', '', 'party', '', NULL),
(2, '国务院', '国务院', 'State Council', '', '', '', 'executive', '', NULL),
(3, '中华人民共和国主席', '国家主席', 'the President', '', '', '', 'executive', '', NULL),
(4, '中国共产党中央政治局常务委员会', '政治局常务委员会', 'Standing Committee of the Politburo of CPC', '', '', '', 'party', '', NULL),
(5, '省政府', '省政府', '', '', '', '', 'executive', '', NULL),
(6, '省党委', '省党委', 'CPC Committee', '', '', '', 'party', '', NULL),
(7, '市党委', '市党委', 'CPC Committee', '', '', '', 'party', '', NULL),
(9, '市政府', '市政府', 'City government', '', '', '', 'executive', '', NULL),
(10, '中央党校', '中央党校', 'Centray Party School', '', '', '', 'party', '', NULL),
(11, '中央军事委员会', '中央军事委员会', 'Central Military Commission (CMC)', '', '', 'https://en.wikipedia.org/wiki/Central_Military_Commission_(China)', 'military', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mandarin_person`
--

CREATE TABLE IF NOT EXISTS `mandarin_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `birthday` date DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `eng_name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mandarin_person`
--

INSERT INTO `mandarin_person` (`id`, `name`, `sex`, `birthday`, `photo`, `eng_name`) VALUES
(1, '习近平', 'M', '1953-06-15', 'https://upload.wikimedia.org/wikipedia/commons/7/72/Xi_Jinping_October_2013_%28cropped%29.jpg', 'Xi Jinping'),
(2, '李克强', 'M', '1955-07-01', 'http://specials-images.forbesimg.com/imageserve/5637f0ade4b0ffa7afe6954e/320x486.jpg?fit=scale&background=000000', 'Li Keqiang');

-- --------------------------------------------------------

--
-- Table structure for table `mandarin_post`
--

CREATE TABLE IF NOT EXISTS `mandarin_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `org_id` int(11) DEFAULT NULL,
  `title_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mandarin_post_156f41ed` (`admin_id`),
  KEY `mandarin_post_9cf869aa` (`org_id`),
  KEY `mandarin_post_1f38f0e7` (`title_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `mandarin_post`
--

INSERT INTO `mandarin_post` (`id`, `admin_id`, `org_id`, `title_id`) VALUES
(1, 1, 2, 1),
(2, 1, 1, 2),
(3, 1, 3, 3),
(4, 1, 4, 4),
(5, 2, 5, 5),
(6, 2, 5, 6),
(7, 2, 6, 8),
(8, 2, 6, 14),
(9, 3, 7, 15),
(10, 3, 7, 16),
(11, 4, 7, 15),
(13, 4, 7, 16),
(14, 5, 9, 17),
(15, 6, 6, 8),
(16, 1, 3, 18),
(17, 1, 10, 19),
(18, 1, 11, 20),
(19, 1, 11, 21);

-- --------------------------------------------------------

--
-- Table structure for table `mandarin_title`
--

CREATE TABLE IF NOT EXISTS `mandarin_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `abbrev` varchar(128) NOT NULL,
  `eng_name` varchar(256) DEFAULT NULL,
  `description` longtext,
  `help_text` varchar(64) DEFAULT NULL,
  `ref` varchar(200) DEFAULT NULL,
  `grade_id` int(11) DEFAULT NULL,
  `report_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mandarin_title_5c853be8` (`grade_id`),
  KEY `mandarin_title_b9970ed0` (`report_to_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `mandarin_title`
--

INSERT INTO `mandarin_title` (`id`, `name`, `abbrev`, `eng_name`, `description`, `help_text`, `ref`, `grade_id`, `report_to_id`) VALUES
(1, '国务院总理', '国务院总理', '', '', '', 'http://news.xinhuanet.com/rwk/2013-02/06/c_124330585.htm', 1, NULL),
(2, '中共中央总书记', '总书记', 'General Secretary of the CPC Central Committee', '', '', '', 1, NULL),
(3, '中华人民共和国主席', '国家主席', 'President of the People''s Republic of China', '', '', 'https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%8D%8E%E4%BA%BA%E6%B0%91%E5%85%B1%E5%92%8C%E5%9B%BD%E4%B8%BB%E5%B8%AD', 1, NULL),
(4, '政治局常委', '政治局常委', 'Politburo Standing Committee member', '', '', '', 1, NULL),
(5, '省长', '省长', 'State governor', '', '', '', 3, NULL),
(6, '副省长', '副省长', 'Executive Vice Governor', '', '', '', 4, NULL),
(7, '政治局委员', '政治局委员', '', '', '', '', 2, NULL),
(8, '省委书记', '省委书记', 'Secretary of Provincial CPC Committee', '', '', '', 3, NULL),
(9, '部长', '部长', 'Minister', '', '', '', 3, NULL),
(10, '司长 ', '司长 ', 'Director', '', '', '', 5, NULL),
(11, '局长 ', '局长 ', 'Director General', '', '', '', 5, NULL),
(12, '代省长', '代省长', 'Acting governor', '', '', '', 3, NULL),
(13, '市长', '市长', 'Mayor', '', '', '', 5, NULL),
(14, '省委副书记', '省委副书记', 'Deputy Party Committee Secretary', '', '', '', 4, NULL),
(15, '市委书记', '市委书记', 'Secretary of CPC Committee', '', '', '', 5, NULL),
(16, '市委副书记', '市委副书记', 'Deputy Secretary of CPC Committee', '', '', '', 6, NULL),
(17, '常务副市长', '常务副市长', 'Executive vice mayor', '', '', 'http://baike.baidu.com/view/1359326.htm', 6, NULL),
(18, '国家副主席', '国家副主席', 'Vice President of the People''s Republic of China', '', '', '', 2, NULL),
(19, '中央党校校长', '中央党校校长', 'President of the Central Party School', '', '', '', 3, NULL),
(20, '军委主席', '军委主席', 'Chinaman of CMC', '', '', 'http://baike.baidu.com/view/1672894.htm', 1, NULL),
(21, '军委副主席', '军委副主席', 'Vice Chairman of the CMC', '', '', 'http://baike.baidu.com/view/1672894.htm', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_association`
--

CREATE TABLE IF NOT EXISTS `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_code`
--

CREATE TABLE IF NOT EXISTS `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(75) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_75f27066d057e3b6_uniq` (`email`,`code`),
  KEY `social_auth_code_c1336794` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_nonce`
--

CREATE TABLE IF NOT EXISTS `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_36601f978463b4_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_usersocialauth`
--

CREATE TABLE IF NOT EXISTS `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_2f763109e2c4a1fb_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_e8701ad4` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tastypie_apiaccess`
--

CREATE TABLE IF NOT EXISTS `tastypie_apiaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `request_method` varchar(10) NOT NULL,
  `accessed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tastypie_apikey`
--

CREATE TABLE IF NOT EXISTS `tastypie_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `tastypie_apikey_3c6e0b8a` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `mandarin_attachment`
--
ALTER TABLE `mandarin_attachment`
  ADD CONSTRAINT `mandarin_attachme_created_by_id_1d145a51240aef93_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `mandar_content_type_id_d08c20034263acf_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `mandarin_career`
--
ALTER TABLE `mandarin_career`
  ADD CONSTRAINT `mandarin_career_person_id_54e292184e4ddc8d_fk_mandarin_person_id` FOREIGN KEY (`person_id`) REFERENCES `mandarin_person` (`id`),
  ADD CONSTRAINT `mandarin_career_post_id_373c57ff298acce2_fk_mandarin_post_id` FOREIGN KEY (`post_id`) REFERENCES `mandarin_post` (`id`);

--
-- Constraints for table `mandarin_connection`
--
ALTER TABLE `mandarin_connection`
  ADD CONSTRAINT `mandarin_conne_person_b_id_3f6d90312cdd7aa_fk_mandarin_person_id` FOREIGN KEY (`person_b_id`) REFERENCES `mandarin_person` (`id`),
  ADD CONSTRAINT `mandarin_conn_person_a_id_29eeb7a190d62c95_fk_mandarin_person_id` FOREIGN KEY (`person_a_id`) REFERENCES `mandarin_person` (`id`);

--
-- Constraints for table `mandarin_org`
--
ALTER TABLE `mandarin_org`
  ADD CONSTRAINT `mandarin_org_report_to_id_1989178bb8da86b6_fk_mandarin_org_id` FOREIGN KEY (`report_to_id`) REFERENCES `mandarin_org` (`id`);

--
-- Constraints for table `mandarin_post`
--
ALTER TABLE `mandarin_post`
  ADD CONSTRAINT `mandarin_post_org_id_192a1444e10a9ba7_fk_mandarin_org_id` FOREIGN KEY (`org_id`) REFERENCES `mandarin_org` (`id`),
  ADD CONSTRAINT `mandarin_post_title_id_58c8903cc2526d6d_fk_mandarin_title_id` FOREIGN KEY (`title_id`) REFERENCES `mandarin_title` (`id`),
  ADD CONSTRAINT `mandarin__admin_id_1cadc29e4201b522_fk_mandarin_admindivision_id` FOREIGN KEY (`admin_id`) REFERENCES `mandarin_admindivision` (`id`);

--
-- Constraints for table `mandarin_title`
--
ALTER TABLE `mandarin_title`
  ADD CONSTRAINT `mandarin_title_grade_id_5efef4631312893_fk_mandarin_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `mandarin_grade` (`id`),
  ADD CONSTRAINT `mandarin_titl_report_to_id_66d2a0741ee3dbcc_fk_mandarin_title_id` FOREIGN KEY (`report_to_id`) REFERENCES `mandarin_title` (`id`);

--
-- Constraints for table `social_auth_usersocialauth`
--
ALTER TABLE `social_auth_usersocialauth`
  ADD CONSTRAINT `social_auth_usersociala_user_id_193b2d80880502b2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `tastypie_apikey`
--
ALTER TABLE `tastypie_apikey`
  ADD CONSTRAINT `tastypie_apikey_user_id_ffeb4840e0b406b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
