/*
 Navicat Premium Data Transfer

 Source Server         : mySQL
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 127.0.0.1:3306
 Source Schema         : nbapp2

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 23/02/2020 15:34:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add 短信验证', 5, 'add_verifycode');
INSERT INTO `auth_permission` VALUES (18, 'Can change 短信验证', 5, 'change_verifycode');
INSERT INTO `auth_permission` VALUES (19, 'Can delete 短信验证', 5, 'delete_verifycode');
INSERT INTO `auth_permission` VALUES (20, 'Can view 短信验证', 5, 'view_verifycode');
INSERT INTO `auth_permission` VALUES (21, 'Can add 用户信息', 6, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (22, 'Can change 用户信息', 6, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 用户信息', 6, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (24, 'Can view 用户信息', 6, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (25, 'Can add Token', 7, 'add_token');
INSERT INTO `auth_permission` VALUES (26, 'Can change Token', 7, 'change_token');
INSERT INTO `auth_permission` VALUES (27, 'Can delete Token', 7, 'delete_token');
INSERT INTO `auth_permission` VALUES (28, 'Can view Token', 7, 'view_token');
INSERT INTO `auth_permission` VALUES (29, 'Can add session', 8, 'add_session');
INSERT INTO `auth_permission` VALUES (30, 'Can change session', 8, 'change_session');
INSERT INTO `auth_permission` VALUES (31, 'Can delete session', 8, 'delete_session');
INSERT INTO `auth_permission` VALUES (32, 'Can view session', 8, 'view_session');
INSERT INTO `auth_permission` VALUES (33, 'Can add 共站分级', 9, 'add_cellslevel');
INSERT INTO `auth_permission` VALUES (34, 'Can change 共站分级', 9, 'change_cellslevel');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 共站分级', 9, 'delete_cellslevel');
INSERT INTO `auth_permission` VALUES (36, 'Can view 共站分级', 9, 'view_cellslevel');
INSERT INTO `auth_permission` VALUES (37, 'Can add 工参信息', 10, 'add_cellsinfo');
INSERT INTO `auth_permission` VALUES (38, 'Can change 工参信息', 10, 'change_cellsinfo');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 工参信息', 10, 'delete_cellsinfo');
INSERT INTO `auth_permission` VALUES (40, 'Can view 工参信息', 10, 'view_cellsinfo');
INSERT INTO `auth_permission` VALUES (41, 'Can add User Widget', 11, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (42, 'Can change User Widget', 11, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (43, 'Can delete User Widget', 11, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (44, 'Can view User Widget', 11, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (45, 'Can add User Setting', 12, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (46, 'Can change User Setting', 12, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (47, 'Can delete User Setting', 12, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (48, 'Can view User Setting', 12, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (49, 'Can add log entry', 13, 'add_log');
INSERT INTO `auth_permission` VALUES (50, 'Can change log entry', 13, 'change_log');
INSERT INTO `auth_permission` VALUES (51, 'Can delete log entry', 13, 'delete_log');
INSERT INTO `auth_permission` VALUES (52, 'Can view log entry', 13, 'view_log');
INSERT INTO `auth_permission` VALUES (53, 'Can add Bookmark', 14, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (54, 'Can change Bookmark', 14, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (55, 'Can delete Bookmark', 14, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (56, 'Can view Bookmark', 14, 'view_bookmark');
COMMIT;

-- ----------------------------
-- Table structure for authtoken_token
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (7, 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (10, 'ecels', 'cellsinfo');
INSERT INTO `django_content_type` VALUES (9, 'ecels', 'cellslevel');
INSERT INTO `django_content_type` VALUES (8, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (6, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (5, 'users', 'verifycode');
INSERT INTO `django_content_type` VALUES (14, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (13, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (12, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (11, 'xadmin', 'userwidget');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-02-22 11:46:57.175980');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2020-02-22 11:46:57.201383');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2020-02-22 11:46:57.229164');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2020-02-22 11:46:57.296523');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2020-02-22 11:46:57.301156');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2020-02-22 11:46:57.305705');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2020-02-22 11:46:57.311300');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2020-02-22 11:46:57.312683');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2020-02-22 11:46:57.317056');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2020-02-22 11:46:57.321524');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2020-02-22 11:46:57.327272');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2020-02-22 11:46:57.345180');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2020-02-22 11:46:57.349871');
INSERT INTO `django_migrations` VALUES (14, 'users', '0001_initial', '2020-02-22 11:46:57.394347');
INSERT INTO `django_migrations` VALUES (15, 'admin', '0001_initial', '2020-02-22 11:46:57.469241');
INSERT INTO `django_migrations` VALUES (16, 'authtoken', '0001_initial', '2020-02-22 11:46:57.507802');
INSERT INTO `django_migrations` VALUES (17, 'authtoken', '0002_auto_20160226_1747', '2020-02-22 11:46:57.575214');
INSERT INTO `django_migrations` VALUES (18, 'ecels', '0001_initial', '2020-02-22 11:47:07.421713');
INSERT INTO `django_migrations` VALUES (21, 'sessions', '0001_initial', '2020-02-22 15:04:11.766382');
INSERT INTO `django_migrations` VALUES (22, 'xadmin', '0001_initial', '2020-02-22 20:18:51.160101');
INSERT INTO `django_migrations` VALUES (23, 'ecels', '0002_auto_20200223_1156', '2020-02-23 11:56:30.886612');
INSERT INTO `django_migrations` VALUES (24, 'ecels', '0003_auto_20200223_1210', '2020-02-23 12:10:29.833628');
INSERT INTO `django_migrations` VALUES (25, 'users', '0002_auto_20200223_1210', '2020-02-23 12:10:29.839099');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('c7c9oj0armbqmi87k0k52h4yevbizuw0', 'MGMxM2QwZTI3YTU3YTcwNjQ4YTRjZDNmODUwZmZkOWFkOGUyODhlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjdiYTVlZDhiNjExZWQyMDJjZjk1NmI1MjQwMmFlOWJiYWVkNjA3MjgiLCJMSVNUX1FVRVJZIjpbWyJ1c2VycyIsInVzZXJwcm9maWxlIl0sIiJdfQ==', '2020-03-08 12:18:17.844486');
COMMIT;

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
BEGIN;
INSERT INTO `users_userprofile` VALUES (1, 'Richr00t$', '2020-02-23 12:17:59.736585', 1, 'admin', '', '', 1, 1, '2020-02-22 11:47:46.535097', NULL, NULL, 'female', NULL, '1@1.com');
INSERT INTO `users_userprofile` VALUES (6, 'pbkdf2_sha256$150000$derfl0B1mfTN$qcytxbx4tLkDG0VVk7xl9SWiZcRvA9dthX8/099uhpQ=', NULL, 0, 'Escapist', '', '', 0, 1, '2020-02-22 21:44:17.808685', NULL, NULL, 'male', '15669909922', NULL);
INSERT INTO `users_userprofile` VALUES (7, 'pbkdf2_sha256$150000$z3QTZKBmR8TI$2SBzjC0BhtzcWmR/HP7bpAUuCIB34jmgwWq9V2YVel8=', NULL, 0, '18888888888', '', '', 0, 1, '2020-02-23 11:34:54.021083', NULL, NULL, 'female', '18888888888', NULL);
COMMIT;

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `users_verifycode`;
CREATE TABLE `users_verifycode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_verifycode
-- ----------------------------
BEGIN;
INSERT INTO `users_verifycode` VALUES (1, '1626', '15669909922', '2020-02-22 11:32:00.000000');
INSERT INTO `users_verifycode` VALUES (2, '9377', '18888888888', '2020-02-23 11:32:00.000000');
COMMIT;

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
BEGIN;
INSERT INTO `xadmin_log` VALUES (1, '2020-02-22 20:46:02.801298', '127.0.0.1', '1', '1626', 'change', '修改 add_time', 5, 1);
INSERT INTO `xadmin_log` VALUES (2, '2020-02-22 20:52:04.836748', '127.0.0.1', '1', '1626', 'change', '修改 add_time', 5, 1);
INSERT INTO `xadmin_log` VALUES (3, '2020-02-22 20:58:57.715005', '127.0.0.1', '2', '15669909922', 'delete', '', 6, 1);
INSERT INTO `xadmin_log` VALUES (4, '2020-02-22 21:00:17.478416', '127.0.0.1', '1', '1626', 'change', '修改 add_time', 5, 1);
INSERT INTO `xadmin_log` VALUES (5, '2020-02-22 21:11:41.842314', '127.0.0.1', '3', '15669909922', 'delete', '', 6, 1);
INSERT INTO `xadmin_log` VALUES (6, '2020-02-22 21:14:50.596178', '127.0.0.1', '1', '1626', 'change', '修改 add_time', 5, 1);
INSERT INTO `xadmin_log` VALUES (7, '2020-02-22 21:41:49.763071', '127.0.0.1', '4', '15669909922', 'delete', '', 6, 1);
INSERT INTO `xadmin_log` VALUES (8, '2020-02-22 21:42:23.206028', '127.0.0.1', '1', '1626', 'change', '修改 add_time', 5, 1);
INSERT INTO `xadmin_log` VALUES (9, '2020-02-22 21:44:04.436341', '127.0.0.1', '5', '15669909922', 'delete', '', 6, 1);
INSERT INTO `xadmin_log` VALUES (10, '2020-02-23 11:32:15.122944', '127.0.0.1', '1', '1626', 'change', '修改 add_time', 5, 1);
INSERT INTO `xadmin_log` VALUES (11, '2020-02-23 11:32:43.637589', '127.0.0.1', '2', '9377', 'create', '已添加。', 5, 1);
COMMIT;

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
BEGIN;
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 1);
COMMIT;

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
