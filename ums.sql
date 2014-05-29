-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2014 at 09:40 AM
-- Server version: 5.5.36
-- PHP Version: 5.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ums`
--

-- --------------------------------------------------------

--
-- Table structure for table `login_address_listings`
--

CREATE TABLE IF NOT EXISTS `login_address_listings` (
  `surveyor_id` int(11) NOT NULL,
  `case_number` int(11) NOT NULL,
  `respondent_name` varchar(50) NOT NULL,
  `block` int(10) NOT NULL,
  `road` varchar(100) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `postal_code` int(6) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `visit_count` int(3) NOT NULL,
  `visit_status` varchar(4) NOT NULL,
  `remarks` text NOT NULL,
  PRIMARY KEY (`surveyor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_address_listings`
--

INSERT INTO `login_address_listings` (`surveyor_id`, `case_number`, `respondent_name`, `block`, `road`, `unit`, `postal_code`, `age`, `gender`, `nationality`, `visit_count`, `visit_status`, `remarks`) VALUES
(1, 1, 'Felix', 33, 'Jalan Bahagia', '05-03', 320033, 24, 0, 'Vietnamese', 5, 'SC', 'This is a long remarks that will not be in one line');

-- --------------------------------------------------------

--
-- Table structure for table `login_confirm`
--

CREATE TABLE IF NOT EXISTS `login_confirm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_integration`
--

CREATE TABLE IF NOT EXISTS `login_integration` (
  `user_id` int(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `google` varchar(255) NOT NULL,
  `yahoo` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_levels`
--

CREATE TABLE IF NOT EXISTS `login_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) NOT NULL,
  `level_level` int(1) NOT NULL,
  `level_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `redirect` varchar(255) DEFAULT NULL,
  `welcome_email` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `level_level` (`level_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `login_levels`
--

INSERT INTO `login_levels` (`id`, `level_name`, `level_level`, `level_disabled`, `redirect`, `welcome_email`) VALUES
(1, 'Admin', 1, 0, NULL, 0),
(2, 'Special', 2, 0, NULL, 0),
(3, 'User', 3, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `login_profiles`
--

CREATE TABLE IF NOT EXISTS `login_profiles` (
  `p_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pfield_id` int(255) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `profile_value` longtext,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_profile_fields`
--

CREATE TABLE IF NOT EXISTS `login_profile_fields` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `section` varchar(255) NOT NULL,
  `type` varchar(25) NOT NULL,
  `label` varchar(255) NOT NULL,
  `public` tinyint(4) NOT NULL,
  `signup` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_settings`
--

CREATE TABLE IF NOT EXISTS `login_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(255) NOT NULL,
  `option_value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `login_settings`
--

INSERT INTO `login_settings` (`id`, `option_name`, `option_value`) VALUES
(1, 'site_address', 'http://localhost/ums/'),
(2, 'default_session', '0'),
(3, 'admin_email', 'felixnong1990@gmail.com'),
(4, 'block-msg-enable', '1'),
(5, 'block-msg', '<h1>Sorry, Hank.</h1>\r\n\r\n<p>We have detected that your user level does not entitle you to view the page requested.</p>\r\n\r\n<p>Please contact the website administrator if you feel this is in error.</p>\r\n\r\n<h5>What to do now?</h5>\r\n<p>To see this page you must <a href=''logout.php''>logout</a> and login with sufficiant privileges.</p>'),
(6, 'block-msg-out', 'You need to login to do that.'),
(7, 'block-msg-out-enable', '1'),
(8, 'email-welcome-msg', 'Hello {{full_name}} !\r\n\r\nThanks for registering at {{site_address}}. Here are your account details:\r\n\r\nName: {{full_name}}\r\nUsername: {{username}}\r\nEmail: {{email}}\r\nPassword: *hidden*\r\n\r\nYou will first have to activate your account by clicking on the following link:\r\n\r\n{{activate}}'),
(9, 'email-activate-msg', 'Hi there {{full_name}} !\r\n\r\nYour account at {{site_address}} has been successfully activated :). \r\n\r\nFor your reference, your username is <strong>{{username}}</strong>. \r\n\r\nSee you soon!'),
(10, 'email-activate-subj', 'You''ve activated your account at Jigowatt !'),
(11, 'email-activate-resend-subj', 'Here''s your activation link again for Jigowatt'),
(12, 'email-activate-resend-msg', 'Why hello, {{full_name}}. \r\n\r\nI believe you requested this:\r\n{{activate}}\r\n\r\nClick the link above to activate your account :)'),
(13, 'email-welcome-subj', 'Thanks for signing up with Jigowatt :)'),
(14, 'email-forgot-success-subj', 'Your password has been reset at Jigowatt'),
(15, 'email-forgot-success-msg', 'Welcome back, {{full_name}} !\r\n\r\nI''m just letting you know your password at {{site_address}} has been successfully changed. \r\n\r\nHopefully you were the one that requested this password reset !\r\n\r\nCheers'),
(16, 'email-forgot-subj', 'Lost your password at Jigowatt?'),
(17, 'email-forgot-msg', 'Hi {{full_name}},\r\n\r\nYour username is <strong>{{username}}</strong>.\r\n\r\nTo reset your password at Jigowatt, please click the following password reset link:\r\n{{reset}}\r\n\r\nSee you soon!'),
(18, 'email-add-user-subj', 'You''re registered with Jigowatt !'),
(19, 'email-add-user-msg', 'Hello {{full_name}} !\r\n\r\nYou''re now registered at {{site_address}}. Here are your account details:\r\n\r\nName: {{full_name}}\r\nUsername: {{username}}\r\nEmail: {{email}}\r\nPassword: {{password}}'),
(20, 'pw-encrypt-force-enable', '0'),
(21, 'pw-encryption', 'MD5'),
(22, 'phplogin_db_version', '1206210'),
(23, 'email-acct-update-subj', 'Confirm your account changes'),
(24, 'email-acct-update-msg', 'Hi {{full_name}} !\r\n\r\nYou ( {{username}} ) requested a change to update your password or email. Click the link below to confirm this change.\r\n\r\n{{confirm}}\r\n\r\nThanks!\r\n{{site_address}}'),
(25, 'email-acct-update-success-subj', 'Your account has been updated'),
(26, 'email-acct-update-success-msg', 'Hello {{full_name}},\r\n\r\nYour account details at {{site_address}} has been updated. \r\n\r\nYour username: {{username}}\r\n\r\nSee you around!'),
(27, 'guest-redirect', 'http://localhost/ums/login.php?e=1'),
(28, 'signout-redirect-referrer-enable', '1'),
(29, 'signin-redirect-referrer-enable', '1'),
(30, 'default-level', 'a:1:{i:0;s:1:"3";}'),
(31, 'new-user-redirect', 'http://localhost/ums/profile.php'),
(32, 'user-activation-enable', '1'),
(33, 'email-new-user-subj', 'A new user has registered !'),
(34, 'email-new-user-msg', 'Hello,\r\n\r\nThere''s been a new registration at &lt;a href=&quot;{{site_address}}&quot;&gt;your site&lt;/a&gt;.\r\n\r\nHere''s the user''s details:\r\n\r\nName: {{full_name}}\r\nUsername: {{username}}\r\nEmail: {{email}}');

-- --------------------------------------------------------

--
-- Table structure for table `login_timestamps`
--

CREATE TABLE IF NOT EXISTS `login_timestamps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_users`
--

CREATE TABLE IF NOT EXISTS `login_users` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_level` longtext NOT NULL,
  `restricted` int(1) NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `login_users`
--

INSERT INTO `login_users` (`user_id`, `user_level`, `restricted`, `username`, `name`, `email`, `password`, `timestamp`) VALUES
(1, 'a:3:{i:0;s:1:"3";i:1;s:1:"1";i:2;s:1:"2";}', 0, 'admin', 'Demo Admin', 'felixnong1990@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2014-05-29 07:25:54'),
(2, 'a:2:{i:0;s:1:"2";i:1;s:1:"3";}', 0, 'special', 'Demo Special', 'test.special@jigowatt.co.uk', '0bd6506986ec42e732ffb866d33bb14e', '2014-05-29 07:25:54'),
(3, 'a:1:{i:0;s:1:"3";}', 0, 'user', 'Demo User', 'test.user@jigowatt.co.uk', 'ee11cbb19052e40b07aac0ca060c23ee', '2014-05-29 07:25:54');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
