/*
 Navicat Premium Data Transfer

 Source Server         : group
 Source Server Type    : MySQL
 Source Server Version : 50646
 Source Host           : 47.110.13.254:3306
 Source Schema         : group

 Target Server Type    : MySQL
 Target Server Version : 50646
 File Encoding         : 65001

 Date: 24/12/2020 18:51:31
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add bookmark', 1, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (2, 'Can change bookmark', 1, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (3, 'Can delete bookmark', 1, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (4, 'Can view bookmark', 1, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (5, 'Can add pinned application', 2, 'add_pinnedapplication');
INSERT INTO `auth_permission` VALUES (6, 'Can change pinned application', 2, 'change_pinnedapplication');
INSERT INTO `auth_permission` VALUES (7, 'Can delete pinned application', 2, 'delete_pinnedapplication');
INSERT INTO `auth_permission` VALUES (8, 'Can view pinned application', 2, 'view_pinnedapplication');
INSERT INTO `auth_permission` VALUES (9, 'Can add log entry', 3, 'add_logentry');
INSERT INTO `auth_permission` VALUES (10, 'Can change log entry', 3, 'change_logentry');
INSERT INTO `auth_permission` VALUES (11, 'Can delete log entry', 3, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (12, 'Can view log entry', 3, 'view_logentry');
INSERT INTO `auth_permission` VALUES (13, 'Can add permission', 4, 'add_permission');
INSERT INTO `auth_permission` VALUES (14, 'Can change permission', 4, 'change_permission');
INSERT INTO `auth_permission` VALUES (15, 'Can delete permission', 4, 'delete_permission');
INSERT INTO `auth_permission` VALUES (16, 'Can view permission', 4, 'view_permission');
INSERT INTO `auth_permission` VALUES (17, 'Can add group', 5, 'add_group');
INSERT INTO `auth_permission` VALUES (18, 'Can change group', 5, 'change_group');
INSERT INTO `auth_permission` VALUES (19, 'Can delete group', 5, 'delete_group');
INSERT INTO `auth_permission` VALUES (20, 'Can view group', 5, 'view_group');
INSERT INTO `auth_permission` VALUES (21, 'Can add user', 6, 'add_user');
INSERT INTO `auth_permission` VALUES (22, 'Can change user', 6, 'change_user');
INSERT INTO `auth_permission` VALUES (23, 'Can delete user', 6, 'delete_user');
INSERT INTO `auth_permission` VALUES (24, 'Can view user', 6, 'view_user');
INSERT INTO `auth_permission` VALUES (25, 'Can add content type', 7, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (26, 'Can change content type', 7, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (27, 'Can delete content type', 7, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (28, 'Can view content type', 7, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (29, 'Can add session', 8, 'add_session');
INSERT INTO `auth_permission` VALUES (30, 'Can change session', 8, 'change_session');
INSERT INTO `auth_permission` VALUES (31, 'Can delete session', 8, 'delete_session');
INSERT INTO `auth_permission` VALUES (32, 'Can view session', 8, 'view_session');
INSERT INTO `auth_permission` VALUES (33, 'Can add 评论', 9, 'add_card');
INSERT INTO `auth_permission` VALUES (34, 'Can change 评论', 9, 'change_card');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 评论', 9, 'delete_card');
INSERT INTO `auth_permission` VALUES (36, 'Can view 评论', 9, 'view_card');
INSERT INTO `auth_permission` VALUES (37, 'Can add 目录', 10, 'add_list');
INSERT INTO `auth_permission` VALUES (38, 'Can change 目录', 10, 'change_list');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 目录', 10, 'delete_list');
INSERT INTO `auth_permission` VALUES (40, 'Can view 目录', 10, 'view_list');
INSERT INTO `auth_permission` VALUES (41, 'Can add 课程类型', 11, 'add_sort');
INSERT INTO `auth_permission` VALUES (42, 'Can change 课程类型', 11, 'change_sort');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 课程类型', 11, 'delete_sort');
INSERT INTO `auth_permission` VALUES (44, 'Can view 课程类型', 11, 'view_sort');
INSERT INTO `auth_permission` VALUES (45, 'Can add 教师', 12, 'add_teacher');
INSERT INTO `auth_permission` VALUES (46, 'Can change 教师', 12, 'change_teacher');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 教师', 12, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (48, 'Can view 教师', 12, 'view_teacher');
INSERT INTO `auth_permission` VALUES (49, 'Can add 客户', 13, 'add_user');
INSERT INTO `auth_permission` VALUES (50, 'Can change 客户', 13, 'change_user');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 客户', 13, 'delete_user');
INSERT INTO `auth_permission` VALUES (52, 'Can view 客户', 13, 'view_user');
INSERT INTO `auth_permission` VALUES (53, 'Can add 用户详情', 14, 'add_userdetail');
INSERT INTO `auth_permission` VALUES (54, 'Can change 用户详情', 14, 'change_userdetail');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 用户详情', 14, 'delete_userdetail');
INSERT INTO `auth_permission` VALUES (56, 'Can view 用户详情', 14, 'view_userdetail');
INSERT INTO `auth_permission` VALUES (57, 'Can add 用户classin', 15, 'add_uaccount');
INSERT INTO `auth_permission` VALUES (58, 'Can change 用户classin', 15, 'change_uaccount');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 用户classin', 15, 'delete_uaccount');
INSERT INTO `auth_permission` VALUES (60, 'Can view 用户classin', 15, 'view_uaccount');
INSERT INTO `auth_permission` VALUES (61, 'Can add 教师详情', 16, 'add_tchdetail');
INSERT INTO `auth_permission` VALUES (62, 'Can change 教师详情', 16, 'change_tchdetail');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 教师详情', 16, 'delete_tchdetail');
INSERT INTO `auth_permission` VALUES (64, 'Can view 教师详情', 16, 'view_tchdetail');
INSERT INTO `auth_permission` VALUES (65, 'Can add 教师classin', 17, 'add_taccount');
INSERT INTO `auth_permission` VALUES (66, 'Can change 教师classin', 17, 'change_taccount');
INSERT INTO `auth_permission` VALUES (67, 'Can delete 教师classin', 17, 'delete_taccount');
INSERT INTO `auth_permission` VALUES (68, 'Can view 教师classin', 17, 'view_taccount');
INSERT INTO `auth_permission` VALUES (69, 'Can add 课程', 18, 'add_subject');
INSERT INTO `auth_permission` VALUES (70, 'Can change 课程', 18, 'change_subject');
INSERT INTO `auth_permission` VALUES (71, 'Can delete 课程', 18, 'delete_subject');
INSERT INTO `auth_permission` VALUES (72, 'Can view 课程', 18, 'view_subject');
INSERT INTO `auth_permission` VALUES (73, 'Can add 用户关系', 19, 'add_relation');
INSERT INTO `auth_permission` VALUES (74, 'Can change 用户关系', 19, 'change_relation');
INSERT INTO `auth_permission` VALUES (75, 'Can delete 用户关系', 19, 'delete_relation');
INSERT INTO `auth_permission` VALUES (76, 'Can view 用户关系', 19, 'view_relation');
INSERT INTO `auth_permission` VALUES (77, 'Can add 评论', 20, 'add_order');
INSERT INTO `auth_permission` VALUES (78, 'Can change 评论', 20, 'change_order');
INSERT INTO `auth_permission` VALUES (79, 'Can delete 评论', 20, 'delete_order');
INSERT INTO `auth_permission` VALUES (80, 'Can view 评论', 20, 'view_order');
INSERT INTO `auth_permission` VALUES (81, 'Can add 空闲时间', 21, 'add_freetime');
INSERT INTO `auth_permission` VALUES (82, 'Can change 空闲时间', 21, 'change_freetime');
INSERT INTO `auth_permission` VALUES (83, 'Can delete 空闲时间', 21, 'delete_freetime');
INSERT INTO `auth_permission` VALUES (84, 'Can view 空闲时间', 21, 'view_freetime');
INSERT INTO `auth_permission` VALUES (85, 'Can add 课程详情', 22, 'add_detail');
INSERT INTO `auth_permission` VALUES (86, 'Can change 课程详情', 22, 'change_detail');
INSERT INTO `auth_permission` VALUES (87, 'Can delete 课程详情', 22, 'delete_detail');
INSERT INTO `auth_permission` VALUES (88, 'Can view 课程详情', 22, 'view_detail');
INSERT INTO `auth_permission` VALUES (89, 'Can add 会员卡订单', 23, 'add_corder');
INSERT INTO `auth_permission` VALUES (90, 'Can change 会员卡订单', 23, 'change_corder');
INSERT INTO `auth_permission` VALUES (91, 'Can delete 会员卡订单', 23, 'delete_corder');
INSERT INTO `auth_permission` VALUES (92, 'Can view 会员卡订单', 23, 'view_corder');
INSERT INTO `auth_permission` VALUES (93, 'Can add 评论', 24, 'add_comment');
INSERT INTO `auth_permission` VALUES (94, 'Can change 评论', 24, 'change_comment');
INSERT INTO `auth_permission` VALUES (95, 'Can delete 评论', 24, 'delete_comment');
INSERT INTO `auth_permission` VALUES (96, 'Can view 评论', 24, 'view_comment');
INSERT INTO `auth_permission` VALUES (97, 'Can add banner', 25, 'add_banner');
INSERT INTO `auth_permission` VALUES (98, 'Can change banner', 25, 'change_banner');
INSERT INTO `auth_permission` VALUES (99, 'Can delete banner', 25, 'delete_banner');
INSERT INTO `auth_permission` VALUES (100, 'Can view banner', 25, 'view_banner');
INSERT INTO `auth_permission` VALUES (101, 'Can add 评论', 10, 'add_card');
INSERT INTO `auth_permission` VALUES (102, 'Can change 评论', 10, 'change_card');
INSERT INTO `auth_permission` VALUES (103, 'Can delete 评论', 10, 'delete_card');
INSERT INTO `auth_permission` VALUES (104, 'Can view 评论', 10, 'view_card');
INSERT INTO `auth_permission` VALUES (105, 'Can add 目录', 11, 'add_list');
INSERT INTO `auth_permission` VALUES (106, 'Can change 目录', 11, 'change_list');
INSERT INTO `auth_permission` VALUES (107, 'Can delete 目录', 11, 'delete_list');
INSERT INTO `auth_permission` VALUES (108, 'Can view 目录', 11, 'view_list');
INSERT INTO `auth_permission` VALUES (109, 'Can add 课程类型', 12, 'add_sort');
INSERT INTO `auth_permission` VALUES (110, 'Can change 课程类型', 12, 'change_sort');
INSERT INTO `auth_permission` VALUES (111, 'Can delete 课程类型', 12, 'delete_sort');
INSERT INTO `auth_permission` VALUES (112, 'Can view 课程类型', 12, 'view_sort');
INSERT INTO `auth_permission` VALUES (113, 'Can add 教师', 13, 'add_teacher');
INSERT INTO `auth_permission` VALUES (114, 'Can change 教师', 13, 'change_teacher');
INSERT INTO `auth_permission` VALUES (115, 'Can delete 教师', 13, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (116, 'Can view 教师', 13, 'view_teacher');
INSERT INTO `auth_permission` VALUES (117, 'Can add 客户', 9, 'add_user');
INSERT INTO `auth_permission` VALUES (118, 'Can change 客户', 9, 'change_user');
INSERT INTO `auth_permission` VALUES (119, 'Can delete 客户', 9, 'delete_user');
INSERT INTO `auth_permission` VALUES (120, 'Can view 客户', 9, 'view_user');
INSERT INTO `auth_permission` VALUES (121, 'Can add 用户关系', 23, 'add_relation');
INSERT INTO `auth_permission` VALUES (122, 'Can change 用户关系', 23, 'change_relation');
INSERT INTO `auth_permission` VALUES (123, 'Can delete 用户关系', 23, 'delete_relation');
INSERT INTO `auth_permission` VALUES (124, 'Can view 用户关系', 23, 'view_relation');
INSERT INTO `auth_permission` VALUES (125, 'Can add 评论', 19, 'add_order');
INSERT INTO `auth_permission` VALUES (126, 'Can change 评论', 19, 'change_order');
INSERT INTO `auth_permission` VALUES (127, 'Can delete 评论', 19, 'delete_order');
INSERT INTO `auth_permission` VALUES (128, 'Can view 评论', 19, 'view_order');
INSERT INTO `auth_permission` VALUES (129, 'Can add 空闲时间', 25, 'add_freetime');
INSERT INTO `auth_permission` VALUES (130, 'Can change 空闲时间', 25, 'change_freetime');
INSERT INTO `auth_permission` VALUES (131, 'Can delete 空闲时间', 25, 'delete_freetime');
INSERT INTO `auth_permission` VALUES (132, 'Can view 空闲时间', 25, 'view_freetime');
INSERT INTO `auth_permission` VALUES (133, 'Can add 课程详情', 20, 'add_detail');
INSERT INTO `auth_permission` VALUES (134, 'Can change 课程详情', 20, 'change_detail');
INSERT INTO `auth_permission` VALUES (135, 'Can delete 课程详情', 20, 'delete_detail');
INSERT INTO `auth_permission` VALUES (136, 'Can view 课程详情', 20, 'view_detail');
INSERT INTO `auth_permission` VALUES (137, 'Can add 会员卡订单', 24, 'add_corder');
INSERT INTO `auth_permission` VALUES (138, 'Can change 会员卡订单', 24, 'change_corder');
INSERT INTO `auth_permission` VALUES (139, 'Can delete 会员卡订单', 24, 'delete_corder');
INSERT INTO `auth_permission` VALUES (140, 'Can view 会员卡订单', 24, 'view_corder');
INSERT INTO `auth_permission` VALUES (141, 'Can add 评论', 21, 'add_comment');
INSERT INTO `auth_permission` VALUES (142, 'Can change 评论', 21, 'change_comment');
INSERT INTO `auth_permission` VALUES (143, 'Can delete 评论', 21, 'delete_comment');
INSERT INTO `auth_permission` VALUES (144, 'Can view 评论', 21, 'view_comment');
INSERT INTO `auth_permission` VALUES (145, 'Can add banner', 22, 'add_banner');
INSERT INTO `auth_permission` VALUES (146, 'Can change banner', 22, 'change_banner');
INSERT INTO `auth_permission` VALUES (147, 'Can delete banner', 22, 'delete_banner');
INSERT INTO `auth_permission` VALUES (148, 'Can view banner', 22, 'view_banner');
INSERT INTO `auth_permission` VALUES (149, 'Can add 行业', 26, 'add_industry');
INSERT INTO `auth_permission` VALUES (150, 'Can change 行业', 26, 'change_industry');
INSERT INTO `auth_permission` VALUES (151, 'Can delete 行业', 26, 'delete_industry');
INSERT INTO `auth_permission` VALUES (152, 'Can view 行业', 26, 'view_industry');
INSERT INTO `auth_permission` VALUES (153, 'Can add 教师申请', 27, 'add_apply');
INSERT INTO `auth_permission` VALUES (154, 'Can change 教师申请', 27, 'change_apply');
INSERT INTO `auth_permission` VALUES (155, 'Can delete 教师申请', 27, 'delete_apply');
INSERT INTO `auth_permission` VALUES (156, 'Can view 教师申请', 27, 'view_apply');
INSERT INTO `auth_permission` VALUES (157, 'Can add 课程时间配置', 28, 'add_subtime');
INSERT INTO `auth_permission` VALUES (158, 'Can change 课程时间配置', 28, 'change_subtime');
INSERT INTO `auth_permission` VALUES (159, 'Can delete 课程时间配置', 28, 'delete_subtime');
INSERT INTO `auth_permission` VALUES (160, 'Can view 课程时间配置', 28, 'view_subtime');
INSERT INTO `auth_permission` VALUES (161, 'Can add 邀请条件', 29, 'add_searchtype');
INSERT INTO `auth_permission` VALUES (162, 'Can change 邀请条件', 29, 'change_searchtype');
INSERT INTO `auth_permission` VALUES (163, 'Can delete 邀请条件', 29, 'delete_searchtype');
INSERT INTO `auth_permission` VALUES (164, 'Can view 邀请条件', 29, 'view_searchtype');
INSERT INTO `auth_permission` VALUES (165, 'Can add 表单ID', 30, 'add_formid');
INSERT INTO `auth_permission` VALUES (166, 'Can change 表单ID', 30, 'change_formid');
INSERT INTO `auth_permission` VALUES (167, 'Can delete 表单ID', 30, 'delete_formid');
INSERT INTO `auth_permission` VALUES (168, 'Can view 表单ID', 30, 'view_formid');
INSERT INTO `auth_permission` VALUES (169, 'Can add 表单ID', 31, 'add_balance');
INSERT INTO `auth_permission` VALUES (170, 'Can change 表单ID', 31, 'change_balance');
INSERT INTO `auth_permission` VALUES (171, 'Can delete 表单ID', 31, 'delete_balance');
INSERT INTO `auth_permission` VALUES (172, 'Can view 表单ID', 31, 'view_balance');
INSERT INTO `auth_permission` VALUES (173, 'Can add 表单ID', 32, 'add_tchhour');
INSERT INTO `auth_permission` VALUES (174, 'Can change 表单ID', 32, 'change_tchhour');
INSERT INTO `auth_permission` VALUES (175, 'Can delete 表单ID', 32, 'delete_tchhour');
INSERT INTO `auth_permission` VALUES (176, 'Can view 表单ID', 32, 'view_tchhour');
INSERT INTO `auth_permission` VALUES (177, 'Can add 课程投诉', 33, 'add_complain');
INSERT INTO `auth_permission` VALUES (178, 'Can change 课程投诉', 33, 'change_complain');
INSERT INTO `auth_permission` VALUES (179, 'Can delete 课程投诉', 33, 'delete_complain');
INSERT INTO `auth_permission` VALUES (180, 'Can view 课程投诉', 33, 'view_complain');
INSERT INTO `auth_permission` VALUES (181, 'Can add 发送邀请', 34, 'add_send');
INSERT INTO `auth_permission` VALUES (182, 'Can change 发送邀请', 34, 'change_send');
INSERT INTO `auth_permission` VALUES (183, 'Can delete 发送邀请', 34, 'delete_send');
INSERT INTO `auth_permission` VALUES (184, 'Can view 发送邀请', 34, 'view_send');
INSERT INTO `auth_permission` VALUES (185, 'Can add 课程视频', 35, 'add_video');
INSERT INTO `auth_permission` VALUES (186, 'Can change 课程视频', 35, 'change_video');
INSERT INTO `auth_permission` VALUES (187, 'Can delete 课程视频', 35, 'delete_video');
INSERT INTO `auth_permission` VALUES (188, 'Can view 课程视频', 35, 'view_video');
INSERT INTO `auth_permission` VALUES (189, 'Can add 申请成为好友', 36, 'add_befriend');
INSERT INTO `auth_permission` VALUES (190, 'Can change 申请成为好友', 36, 'change_befriend');
INSERT INTO `auth_permission` VALUES (191, 'Can delete 申请成为好友', 36, 'delete_befriend');
INSERT INTO `auth_permission` VALUES (192, 'Can view 申请成为好友', 36, 'view_befriend');
INSERT INTO `auth_permission` VALUES (193, 'Can add 邀请好友分销', 37, 'add_invite');
INSERT INTO `auth_permission` VALUES (194, 'Can change 邀请好友分销', 37, 'change_invite');
INSERT INTO `auth_permission` VALUES (195, 'Can delete 邀请好友分销', 37, 'delete_invite');
INSERT INTO `auth_permission` VALUES (196, 'Can view 邀请好友分销', 37, 'view_invite');
INSERT INTO `auth_permission` VALUES (197, 'Can add 教师提现申请', 38, 'add_tchbeout');
INSERT INTO `auth_permission` VALUES (198, 'Can change 教师提现申请', 38, 'change_tchbeout');
INSERT INTO `auth_permission` VALUES (199, 'Can delete 教师提现申请', 38, 'delete_tchbeout');
INSERT INTO `auth_permission` VALUES (200, 'Can view 教师提现申请', 38, 'view_tchbeout');
INSERT INTO `auth_permission` VALUES (201, 'Can add 教师提现申请', 39, 'add_platform');
INSERT INTO `auth_permission` VALUES (202, 'Can change 教师提现申请', 39, 'change_platform');
INSERT INTO `auth_permission` VALUES (203, 'Can delete 教师提现申请', 39, 'delete_platform');
INSERT INTO `auth_permission` VALUES (204, 'Can view 教师提现申请', 39, 'view_platform');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$150000$mQauYmZV7zeG$EGlFst6MhULh3bARvfyoq4rHRqIJaE7/YKoAfRCsbHE=', '2020-12-24 16:06:18.771308', 1, 'admin', '', '', '', 1, 1, '2019-08-29 16:50:41.620756');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$150000$XNpHxK67BomI$FvpB+VUQObzPg2M1O0DJKRUMMuHGhJBHQmv+uaVQAzU=', '2020-01-18 16:25:12.850742', 0, 'aeclub', '', '', '', 1, 1, '2020-01-15 11:09:00.000000');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
BEGIN;
INSERT INTO `auth_user_user_permissions` VALUES (29, 2, 33);
INSERT INTO `auth_user_user_permissions` VALUES (30, 2, 34);
INSERT INTO `auth_user_user_permissions` VALUES (31, 2, 35);
INSERT INTO `auth_user_user_permissions` VALUES (32, 2, 36);
INSERT INTO `auth_user_user_permissions` VALUES (33, 2, 37);
INSERT INTO `auth_user_user_permissions` VALUES (34, 2, 38);
INSERT INTO `auth_user_user_permissions` VALUES (35, 2, 39);
INSERT INTO `auth_user_user_permissions` VALUES (36, 2, 40);
INSERT INTO `auth_user_user_permissions` VALUES (37, 2, 41);
INSERT INTO `auth_user_user_permissions` VALUES (38, 2, 42);
INSERT INTO `auth_user_user_permissions` VALUES (40, 2, 44);
INSERT INTO `auth_user_user_permissions` VALUES (41, 2, 45);
INSERT INTO `auth_user_user_permissions` VALUES (42, 2, 46);
INSERT INTO `auth_user_user_permissions` VALUES (43, 2, 47);
INSERT INTO `auth_user_user_permissions` VALUES (44, 2, 48);
INSERT INTO `auth_user_user_permissions` VALUES (45, 2, 49);
INSERT INTO `auth_user_user_permissions` VALUES (46, 2, 50);
INSERT INTO `auth_user_user_permissions` VALUES (47, 2, 51);
INSERT INTO `auth_user_user_permissions` VALUES (48, 2, 52);
INSERT INTO `auth_user_user_permissions` VALUES (49, 2, 53);
INSERT INTO `auth_user_user_permissions` VALUES (50, 2, 54);
INSERT INTO `auth_user_user_permissions` VALUES (51, 2, 55);
INSERT INTO `auth_user_user_permissions` VALUES (52, 2, 56);
INSERT INTO `auth_user_user_permissions` VALUES (53, 2, 57);
INSERT INTO `auth_user_user_permissions` VALUES (54, 2, 58);
INSERT INTO `auth_user_user_permissions` VALUES (55, 2, 59);
INSERT INTO `auth_user_user_permissions` VALUES (56, 2, 60);
INSERT INTO `auth_user_user_permissions` VALUES (57, 2, 61);
INSERT INTO `auth_user_user_permissions` VALUES (58, 2, 62);
INSERT INTO `auth_user_user_permissions` VALUES (59, 2, 63);
INSERT INTO `auth_user_user_permissions` VALUES (60, 2, 64);
INSERT INTO `auth_user_user_permissions` VALUES (61, 2, 65);
INSERT INTO `auth_user_user_permissions` VALUES (62, 2, 66);
INSERT INTO `auth_user_user_permissions` VALUES (63, 2, 67);
INSERT INTO `auth_user_user_permissions` VALUES (64, 2, 68);
INSERT INTO `auth_user_user_permissions` VALUES (65, 2, 69);
INSERT INTO `auth_user_user_permissions` VALUES (66, 2, 70);
INSERT INTO `auth_user_user_permissions` VALUES (67, 2, 71);
INSERT INTO `auth_user_user_permissions` VALUES (68, 2, 72);
INSERT INTO `auth_user_user_permissions` VALUES (69, 2, 73);
INSERT INTO `auth_user_user_permissions` VALUES (70, 2, 74);
INSERT INTO `auth_user_user_permissions` VALUES (72, 2, 76);
INSERT INTO `auth_user_user_permissions` VALUES (73, 2, 77);
INSERT INTO `auth_user_user_permissions` VALUES (74, 2, 78);
INSERT INTO `auth_user_user_permissions` VALUES (75, 2, 79);
INSERT INTO `auth_user_user_permissions` VALUES (76, 2, 80);
INSERT INTO `auth_user_user_permissions` VALUES (77, 2, 81);
INSERT INTO `auth_user_user_permissions` VALUES (78, 2, 82);
INSERT INTO `auth_user_user_permissions` VALUES (79, 2, 83);
INSERT INTO `auth_user_user_permissions` VALUES (80, 2, 84);
INSERT INTO `auth_user_user_permissions` VALUES (81, 2, 85);
INSERT INTO `auth_user_user_permissions` VALUES (82, 2, 86);
INSERT INTO `auth_user_user_permissions` VALUES (83, 2, 87);
INSERT INTO `auth_user_user_permissions` VALUES (84, 2, 88);
INSERT INTO `auth_user_user_permissions` VALUES (85, 2, 89);
INSERT INTO `auth_user_user_permissions` VALUES (86, 2, 90);
INSERT INTO `auth_user_user_permissions` VALUES (88, 2, 92);
INSERT INTO `auth_user_user_permissions` VALUES (89, 2, 93);
INSERT INTO `auth_user_user_permissions` VALUES (90, 2, 94);
INSERT INTO `auth_user_user_permissions` VALUES (91, 2, 95);
INSERT INTO `auth_user_user_permissions` VALUES (92, 2, 96);
INSERT INTO `auth_user_user_permissions` VALUES (93, 2, 97);
INSERT INTO `auth_user_user_permissions` VALUES (94, 2, 98);
INSERT INTO `auth_user_user_permissions` VALUES (95, 2, 99);
INSERT INTO `auth_user_user_permissions` VALUES (96, 2, 100);
INSERT INTO `auth_user_user_permissions` VALUES (97, 2, 101);
INSERT INTO `auth_user_user_permissions` VALUES (98, 2, 102);
INSERT INTO `auth_user_user_permissions` VALUES (99, 2, 103);
INSERT INTO `auth_user_user_permissions` VALUES (100, 2, 104);
INSERT INTO `auth_user_user_permissions` VALUES (101, 2, 105);
INSERT INTO `auth_user_user_permissions` VALUES (102, 2, 106);
INSERT INTO `auth_user_user_permissions` VALUES (103, 2, 107);
INSERT INTO `auth_user_user_permissions` VALUES (104, 2, 108);
INSERT INTO `auth_user_user_permissions` VALUES (105, 2, 109);
INSERT INTO `auth_user_user_permissions` VALUES (106, 2, 110);
INSERT INTO `auth_user_user_permissions` VALUES (107, 2, 111);
INSERT INTO `auth_user_user_permissions` VALUES (108, 2, 112);
INSERT INTO `auth_user_user_permissions` VALUES (109, 2, 113);
INSERT INTO `auth_user_user_permissions` VALUES (110, 2, 114);
INSERT INTO `auth_user_user_permissions` VALUES (111, 2, 115);
INSERT INTO `auth_user_user_permissions` VALUES (112, 2, 116);
INSERT INTO `auth_user_user_permissions` VALUES (114, 2, 118);
INSERT INTO `auth_user_user_permissions` VALUES (116, 2, 120);
INSERT INTO `auth_user_user_permissions` VALUES (117, 2, 121);
INSERT INTO `auth_user_user_permissions` VALUES (118, 2, 122);
INSERT INTO `auth_user_user_permissions` VALUES (119, 2, 123);
INSERT INTO `auth_user_user_permissions` VALUES (120, 2, 124);
INSERT INTO `auth_user_user_permissions` VALUES (121, 2, 125);
INSERT INTO `auth_user_user_permissions` VALUES (122, 2, 126);
INSERT INTO `auth_user_user_permissions` VALUES (124, 2, 128);
INSERT INTO `auth_user_user_permissions` VALUES (125, 2, 129);
INSERT INTO `auth_user_user_permissions` VALUES (126, 2, 130);
INSERT INTO `auth_user_user_permissions` VALUES (127, 2, 131);
INSERT INTO `auth_user_user_permissions` VALUES (128, 2, 132);
INSERT INTO `auth_user_user_permissions` VALUES (129, 2, 133);
INSERT INTO `auth_user_user_permissions` VALUES (130, 2, 134);
INSERT INTO `auth_user_user_permissions` VALUES (131, 2, 135);
INSERT INTO `auth_user_user_permissions` VALUES (132, 2, 136);
INSERT INTO `auth_user_user_permissions` VALUES (133, 2, 137);
INSERT INTO `auth_user_user_permissions` VALUES (134, 2, 138);
INSERT INTO `auth_user_user_permissions` VALUES (136, 2, 140);
INSERT INTO `auth_user_user_permissions` VALUES (137, 2, 142);
INSERT INTO `auth_user_user_permissions` VALUES (138, 2, 143);
INSERT INTO `auth_user_user_permissions` VALUES (139, 2, 144);
INSERT INTO `auth_user_user_permissions` VALUES (140, 2, 145);
INSERT INTO `auth_user_user_permissions` VALUES (141, 2, 146);
INSERT INTO `auth_user_user_permissions` VALUES (142, 2, 147);
INSERT INTO `auth_user_user_permissions` VALUES (143, 2, 148);
INSERT INTO `auth_user_user_permissions` VALUES (144, 2, 149);
INSERT INTO `auth_user_user_permissions` VALUES (145, 2, 150);
INSERT INTO `auth_user_user_permissions` VALUES (146, 2, 151);
INSERT INTO `auth_user_user_permissions` VALUES (147, 2, 152);
INSERT INTO `auth_user_user_permissions` VALUES (148, 2, 153);
INSERT INTO `auth_user_user_permissions` VALUES (149, 2, 154);
INSERT INTO `auth_user_user_permissions` VALUES (150, 2, 156);
INSERT INTO `auth_user_user_permissions` VALUES (151, 2, 157);
INSERT INTO `auth_user_user_permissions` VALUES (152, 2, 158);
INSERT INTO `auth_user_user_permissions` VALUES (153, 2, 159);
INSERT INTO `auth_user_user_permissions` VALUES (154, 2, 160);
INSERT INTO `auth_user_user_permissions` VALUES (155, 2, 161);
INSERT INTO `auth_user_user_permissions` VALUES (156, 2, 162);
INSERT INTO `auth_user_user_permissions` VALUES (157, 2, 163);
INSERT INTO `auth_user_user_permissions` VALUES (158, 2, 164);
INSERT INTO `auth_user_user_permissions` VALUES (159, 2, 165);
INSERT INTO `auth_user_user_permissions` VALUES (160, 2, 166);
INSERT INTO `auth_user_user_permissions` VALUES (161, 2, 167);
INSERT INTO `auth_user_user_permissions` VALUES (162, 2, 168);
INSERT INTO `auth_user_user_permissions` VALUES (163, 2, 173);
INSERT INTO `auth_user_user_permissions` VALUES (164, 2, 174);
INSERT INTO `auth_user_user_permissions` VALUES (165, 2, 175);
INSERT INTO `auth_user_user_permissions` VALUES (166, 2, 176);
INSERT INTO `auth_user_user_permissions` VALUES (167, 2, 177);
INSERT INTO `auth_user_user_permissions` VALUES (168, 2, 178);
INSERT INTO `auth_user_user_permissions` VALUES (170, 2, 180);
INSERT INTO `auth_user_user_permissions` VALUES (171, 2, 181);
INSERT INTO `auth_user_user_permissions` VALUES (172, 2, 182);
INSERT INTO `auth_user_user_permissions` VALUES (173, 2, 183);
INSERT INTO `auth_user_user_permissions` VALUES (174, 2, 184);
INSERT INTO `auth_user_user_permissions` VALUES (175, 2, 185);
INSERT INTO `auth_user_user_permissions` VALUES (176, 2, 186);
INSERT INTO `auth_user_user_permissions` VALUES (177, 2, 187);
INSERT INTO `auth_user_user_permissions` VALUES (178, 2, 188);
INSERT INTO `auth_user_user_permissions` VALUES (179, 2, 193);
INSERT INTO `auth_user_user_permissions` VALUES (180, 2, 194);
INSERT INTO `auth_user_user_permissions` VALUES (181, 2, 195);
INSERT INTO `auth_user_user_permissions` VALUES (182, 2, 196);
INSERT INTO `auth_user_user_permissions` VALUES (183, 2, 197);
INSERT INTO `auth_user_user_permissions` VALUES (184, 2, 198);
INSERT INTO `auth_user_user_permissions` VALUES (185, 2, 199);
INSERT INTO `auth_user_user_permissions` VALUES (186, 2, 200);
INSERT INTO `auth_user_user_permissions` VALUES (187, 2, 201);
INSERT INTO `auth_user_user_permissions` VALUES (188, 2, 202);
INSERT INTO `auth_user_user_permissions` VALUES (190, 2, 204);
COMMIT;

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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1127 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES (1, '2019-08-20 08:05:02.070475', '1', 'Banner object (1)', 1, '[{\"added\": {}}]', 22, 1);
INSERT INTO `django_admin_log` VALUES (2, '2019-08-20 08:07:38.460863', '1', 'Banner object (1)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (3, '2019-08-20 08:07:48.312884', '2', 'Banner object (2)', 1, '[{\"added\": {}}]', 22, 1);
INSERT INTO `django_admin_log` VALUES (4, '2019-08-20 08:10:20.785716', '3', 'Banner object (3)', 1, '[{\"added\": {}}]', 22, 1);
INSERT INTO `django_admin_log` VALUES (5, '2019-08-20 08:26:56.386590', '1', '商务英语', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (6, '2019-08-20 08:27:12.416136', '2', '职场英语', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (7, '2019-08-20 08:27:56.497099', '2', '面试英语', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (8, '2019-08-20 08:28:02.862776', '2', '办公英语', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (9, '2019-08-20 08:28:09.130367', '2', '旅行英语', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (10, '2019-08-20 08:35:12.164592', '1', '商务英语300句', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"\\u76ee\\u5f55\", \"object\": \"Telephone Calls \\u6253\\u7535\\u8bdd\"}}, {\"added\": {\"name\": \"\\u76ee\\u5f55\", \"object\": \"Price \\u4ef7\\u683c\"}}, {\"added\": {\"name\": \"\\u76ee\\u5f55\", \"object\": \"Counteroffer \\u8fd8\\u76d8\"}}, {\"added\": {\"name\": \"\\u76ee\\u5f55\", \"object\": \"Insurance \\u4fdd\\u9669\"}}, {\"added\": {\"name\": \"\\u76ee\\u5f55\", \"object\": \"Acceptance \\u63a5\\u53d7\"}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u8be6\\u60c5\", \"object\": \"1\"}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (11, '2019-08-20 08:38:37.766440', '2', 'Banner object (2)', 2, '[{\"changed\": {\"fields\": [\"sub\"]}}]', 22, 1);
INSERT INTO `django_admin_log` VALUES (12, '2019-08-20 08:38:42.276270', '3', 'Banner object (3)', 2, '[{\"changed\": {\"fields\": [\"sub\"]}}]', 22, 1);
INSERT INTO `django_admin_log` VALUES (13, '2019-08-31 10:54:33.829521', '1', '1', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (14, '2019-08-31 10:54:38.869834', '2', '2', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (15, '2019-08-31 10:54:46.106718', '3', '3', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (16, '2019-08-31 10:54:52.862130', '4', '4', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (17, '2019-08-31 10:55:01.200156', '5', '5', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (18, '2019-08-31 10:55:06.609005', '6', '6', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (19, '2019-08-31 10:55:13.046853', '7', '7', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (20, '2019-08-31 10:55:20.819505', '8', '8', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (21, '2019-08-31 10:55:26.172120', '9', '9', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (22, '2019-08-31 10:55:31.068425', '10', '10', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (23, '2019-08-31 10:55:39.478183', '11', '11', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (24, '2019-08-31 10:55:45.404112', '12', '12', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (25, '2019-08-31 10:55:51.353930', '13', '13', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (26, '2019-08-31 10:55:57.796360', '14', '14', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (27, '2019-08-31 10:56:05.365710', '15', '15', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (28, '2019-08-31 14:58:15.707303', '1', '500', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (29, '2019-08-31 14:58:56.797547', '1', '500.0', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (30, '2019-08-31 15:16:23.061345', '2', '500', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (31, '2019-08-31 15:17:03.133925', '3', '2000', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (32, '2019-08-31 15:17:18.166805', '2', '500.0', 2, '[]', 10, 1);
INSERT INTO `django_admin_log` VALUES (33, '2019-08-31 15:43:14.187707', '2', '500.0', 2, '[{\"changed\": {\"fields\": [\"back\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (34, '2019-08-31 15:43:22.490522', '3', '2000.0', 2, '[{\"changed\": {\"fields\": [\"back\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (35, '2019-09-01 06:35:05.654329', '3', '职场英语', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (36, '2019-09-07 16:36:01.983719', '1', 'Apply object (1)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (37, '2019-09-07 16:37:47.150471', '1', 'Apply object (1)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (38, '2019-09-07 16:44:01.626032', '1', 'Apply object (1)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (39, '2019-09-07 16:44:38.627906', '1', 'Apply object (1)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (40, '2019-09-07 16:45:43.852706', '1', 'Apply object (1)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (41, '2019-09-07 16:46:05.319908', 'None', 'Apply object (None)', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (42, '2019-09-07 16:46:39.101213', 'None', 'Apply object (None)', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (43, '2019-09-08 03:51:34.732458', '1', 'Apply object (1)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (44, '2019-09-08 03:53:16.936916', '1', 'Apply object (1)', 2, '[]', 27, 1);
INSERT INTO `django_admin_log` VALUES (45, '2019-09-14 17:08:19.174800', '1', 'SubTime object (1)', 1, '[{\"added\": {}}]', 28, 1);
INSERT INTO `django_admin_log` VALUES (46, '2019-09-14 18:33:49.078072', '1', 'SubTime object (1)', 2, '[{\"changed\": {\"fields\": [\"end\"]}}]', 28, 1);
INSERT INTO `django_admin_log` VALUES (47, '2019-09-14 18:37:08.816046', '1', 'SubTime object (1)', 2, '[{\"changed\": {\"fields\": [\"end\"]}}]', 28, 1);
INSERT INTO `django_admin_log` VALUES (48, '2019-09-14 18:46:16.084056', '1', 'SubTime object (1)', 2, '[{\"changed\": {\"fields\": [\"time\"]}}]', 28, 1);
INSERT INTO `django_admin_log` VALUES (49, '2019-09-15 03:03:57.119890', '1', 'SubTime object (1)', 2, '[{\"changed\": {\"fields\": [\"time\"]}}]', 28, 1);
INSERT INTO `django_admin_log` VALUES (50, '2019-09-15 03:13:39.664084', '41', 'FreeTime object (41)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (51, '2019-09-15 03:13:39.672131', '40', 'FreeTime object (40)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (52, '2019-09-15 03:13:39.679366', '39', 'FreeTime object (39)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (53, '2019-09-15 03:13:39.686616', '38', 'FreeTime object (38)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (54, '2019-09-15 03:13:39.695290', '37', 'FreeTime object (37)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (55, '2019-09-15 03:13:39.702329', '34', 'FreeTime object (34)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (56, '2019-09-15 03:13:39.708930', '33', 'FreeTime object (33)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (57, '2019-09-15 03:13:39.718161', '32', 'FreeTime object (32)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (58, '2019-09-15 03:13:59.818160', '41', 'FreeTime object (41)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (59, '2019-09-15 03:13:59.826415', '40', 'FreeTime object (40)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (60, '2019-09-15 03:13:59.833275', '39', 'FreeTime object (39)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (61, '2019-09-15 03:13:59.840729', '38', 'FreeTime object (38)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (62, '2019-09-15 03:13:59.849147', '37', 'FreeTime object (37)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (63, '2019-09-15 03:13:59.858236', '34', 'FreeTime object (34)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (64, '2019-09-15 03:13:59.865451', '33', 'FreeTime object (33)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (65, '2019-09-15 03:13:59.877848', '32', 'FreeTime object (32)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (66, '2019-09-15 03:15:52.761968', '2', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (67, '2019-09-15 03:15:52.770275', '1', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (68, '2019-09-15 03:16:14.530447', '41', 'FreeTime object (41)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (69, '2019-09-15 03:16:14.538679', '40', 'FreeTime object (40)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (70, '2019-09-15 03:16:14.546108', '39', 'FreeTime object (39)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (71, '2019-09-15 03:16:14.552962', '38', 'FreeTime object (38)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (72, '2019-09-15 03:16:14.559987', '37', 'FreeTime object (37)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (73, '2019-09-15 03:16:14.566733', '34', 'FreeTime object (34)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (74, '2019-09-15 03:16:14.575938', '33', 'FreeTime object (33)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (75, '2019-09-15 03:16:14.583475', '32', 'FreeTime object (32)', 3, '', 25, 1);
INSERT INTO `django_admin_log` VALUES (76, '2019-09-19 20:21:39.292482', '10', 'y2LSPJnGxNUk', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (77, '2019-09-19 20:21:39.300747', '9', '5co7da6VRfKZ', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (78, '2019-09-19 20:21:39.309082', '8', 'bFs6mulnxTSA', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (79, '2019-09-19 20:29:58.674052', '11', 'XFW3mbspyvxI', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (80, '2019-09-19 20:52:59.412869', '4', 'Balance object (4)', 3, '', 31, 1);
INSERT INTO `django_admin_log` VALUES (81, '2019-09-19 20:52:59.421776', '3', 'Balance object (3)', 3, '', 31, 1);
INSERT INTO `django_admin_log` VALUES (82, '2019-09-19 20:52:59.428716', '2', 'Balance object (2)', 3, '', 31, 1);
INSERT INTO `django_admin_log` VALUES (83, '2019-09-19 20:52:59.435594', '1', 'Balance object (1)', 3, '', 31, 1);
INSERT INTO `django_admin_log` VALUES (84, '2019-09-19 20:53:12.463975', '14', 'ADkGlZUdSNP3', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (85, '2019-09-19 20:53:12.471678', '13', 'kEfTmBdJa5rh', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (86, '2019-09-19 20:53:12.479090', '12', 'EaiMed5OQrzo', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (87, '2019-09-19 20:56:15.310916', '16', 'pnAF3iHQv2Xu', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (88, '2019-09-19 20:59:53.360009', '20', 'Xdc71ODqVweE', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (89, '2019-09-19 20:59:53.371592', '19', 'HX0Cp1laicz9', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (90, '2019-09-19 20:59:53.378745', '18', '1NhWkzK6ATLu', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (91, '2019-09-19 20:59:53.386029', '17', '8Er4A0UxBvNd', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (92, '2019-09-19 20:59:53.393219', '15', 'ZGkWjHapCYBS', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (93, '2019-09-19 21:00:00.700553', '5', 'Balance object (5)', 3, '', 31, 1);
INSERT INTO `django_admin_log` VALUES (94, '2019-09-22 19:45:54.302758', '23', '9p5VBlYNMOft', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (95, '2019-09-22 19:45:54.310693', '22', 'shdi2WqYuaUM', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (96, '2019-09-22 19:45:54.320445', '21', '4vEHBfnq5A0L', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (97, '2019-09-22 19:52:47.026150', '16', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (98, '2019-09-22 19:52:47.035688', '15', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (99, '2019-09-22 19:52:47.043477', '14', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (100, '2019-09-22 19:52:47.052833', '13', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (101, '2019-09-22 19:52:47.062798', '12', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (102, '2019-09-22 19:52:47.072090', '11', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (103, '2019-09-22 19:52:47.080828', '10', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (104, '2019-09-22 19:52:47.088255', '9', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (105, '2019-09-22 19:52:47.097204', '8', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (106, '2019-09-22 19:52:47.105884', '5', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (107, '2019-09-22 19:52:47.118340', '4', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (108, '2019-09-22 19:52:47.130156', '3', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (109, '2019-09-22 20:03:59.444397', '24', 'XQPCSsLpI0cb', 2, '[{\"changed\": {\"fields\": [\"have\"]}}]', 24, 1);
INSERT INTO `django_admin_log` VALUES (110, '2019-09-22 20:04:31.505052', '22', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (111, '2019-09-22 20:04:31.515493', '21', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (112, '2019-09-22 20:04:31.526001', '20', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (113, '2019-09-22 20:04:31.535242', '19', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (114, '2019-09-22 20:04:31.542275', '18', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (115, '2019-09-22 20:04:31.549438', '17', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (116, '2019-09-22 23:59:38.937994', '24', 'XQPCSsLpI0cb', 2, '[{\"changed\": {\"fields\": [\"have\"]}}]', 24, 1);
INSERT INTO `django_admin_log` VALUES (117, '2019-10-03 02:01:12.513073', '42', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (118, '2019-10-03 02:01:12.521596', '41', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (119, '2019-10-03 02:01:12.529967', '40', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (120, '2019-10-03 02:01:12.544535', '39', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (121, '2019-10-03 02:01:12.552166', '38', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (122, '2019-10-03 02:01:12.559627', '37', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (123, '2019-10-03 02:01:12.567713', '36', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (124, '2019-10-03 02:01:12.577566', '35', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (125, '2019-10-03 02:01:12.584759', '34', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (126, '2019-10-03 02:01:12.591647', '33', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (127, '2019-10-03 02:01:12.601215', '32', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (128, '2019-10-03 02:01:12.608285', '31', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (129, '2019-10-03 02:01:12.615134', '30', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (130, '2019-10-03 02:01:12.624579', '29', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (131, '2019-10-03 02:01:12.632243', '28', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (132, '2019-10-03 02:01:12.640002', '27', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (133, '2019-10-03 02:01:12.647751', '26', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (134, '2019-10-03 02:01:12.655717', '25', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (135, '2019-10-03 02:01:12.664242', '23', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (136, '2019-10-03 04:41:53.667867', '45', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (137, '2019-10-03 04:41:53.675396', '44', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (138, '2019-10-03 04:41:53.682296', '43', '商务英语300句-Telephone Calls 打电话-秦宇杰', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (139, '2019-10-04 23:47:09.725099', '1', 'UAccount object (1)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (140, '2019-10-05 10:57:10.233347', '68', '商务英语300句-Insurance 保险-秦宇杰', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (141, '2019-10-05 15:07:45.501154', '1', 'Relation object (1)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (142, '2019-10-05 15:09:45.091199', '4', 'job interview', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (143, '2019-10-05 15:10:14.015216', '5', 'office english', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (144, '2019-10-05 15:11:02.053903', '5', 'office english', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (145, '2019-10-05 15:12:44.749675', '2', 'job1', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (146, '2019-10-05 15:27:43.017496', '2', 'job1', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (147, '2019-10-29 19:50:54.136522', '4', 'job interview', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (148, '2019-10-29 19:52:18.897252', '5', 'cadscdscdsc', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (149, '2019-10-29 19:56:31.006115', '5', 'cadscdscdsc', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (150, '2019-10-29 19:56:46.841097', '6', 'csdcscds', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (151, '2019-10-29 20:04:07.639059', '7', 'csdcdscsdc', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (152, '2019-10-29 20:11:52.838092', '8', 'cdscdsc', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (153, '2019-10-29 20:13:16.293231', '8', 'cdscdsc', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (154, '2019-10-29 20:14:01.581861', '7', 'csdcdscsdc', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (155, '2019-10-29 20:15:29.732481', '9', 'cdscdscds', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (156, '2019-10-29 20:15:39.970881', '10', 'cdscdscds', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (157, '2019-10-29 20:15:53.709218', '11', 'cdcdcd', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (158, '2019-10-29 20:16:07.451262', '12', 'ccsccdscs', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (159, '2019-10-29 20:16:29.867384', '12', 'ccsccdscs', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (160, '2019-10-29 20:16:29.877044', '11', 'cdcdcd', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (161, '2019-10-29 20:16:29.884681', '10', 'cdscdscds', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (162, '2019-10-29 20:16:29.891219', '9', 'cdscdscds', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (163, '2019-10-29 20:16:29.900323', '6', 'csdcscds', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (164, '2019-10-30 17:04:36.443245', '2', 'Apply object (2)', 2, '[{\"changed\": {\"fields\": [\"sex\", \"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (165, '2019-11-04 04:45:27.081544', '3', '3', 2, '[{\"changed\": {\"fields\": [\"utype\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (166, '2019-11-04 04:53:19.435358', '3', '3', 2, '[{\"changed\": {\"fields\": [\"city\", \"ocp\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (167, '2019-11-15 11:53:11.597865', '3', 'Apply object (3)', 3, '', 27, 1);
INSERT INTO `django_admin_log` VALUES (168, '2019-11-15 15:01:04.531614', '4', 'Apply object (4)', 2, '[{\"changed\": {\"fields\": [\"status\", \"cause\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (169, '2019-11-15 15:21:20.174055', '4', 'Apply object (4)', 3, '', 27, 1);
INSERT INTO `django_admin_log` VALUES (170, '2019-11-15 15:38:02.459394', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (171, '2019-11-15 15:39:22.179605', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (172, '2019-11-15 15:40:19.739338', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (173, '2019-11-15 15:41:28.725364', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (174, '2019-11-15 15:44:14.327502', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (175, '2019-11-15 15:57:03.841784', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (176, '2019-11-15 15:59:35.274567', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (177, '2019-11-15 15:59:43.207488', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (178, '2019-11-15 16:00:43.092240', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (179, '2019-11-15 16:00:48.796484', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (180, '2019-11-17 03:14:27.626753', '110', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (181, '2019-11-17 03:14:27.635946', '109', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (182, '2019-11-17 03:14:27.642789', '108', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (183, '2019-11-17 03:14:27.650752', '106', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (184, '2019-11-17 03:14:27.657446', '105', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (185, '2019-11-17 03:14:44.869529', '100', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (186, '2019-11-17 03:14:44.884257', '99', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (187, '2019-11-17 03:14:44.895445', '98', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (188, '2019-11-17 03:14:44.903749', '97', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (189, '2019-11-17 03:14:44.910792', '96', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (190, '2019-11-17 03:14:44.918066', '95', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (191, '2019-11-17 03:14:44.925659', '75', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (192, '2019-11-17 03:14:44.934121', '74', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (193, '2019-11-17 03:14:44.943143', '90', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (194, '2019-11-19 23:35:31.103012', '10', 'Complain object (10)', 2, '[{\"changed\": {\"fields\": [\"status\", \"reason\"]}}]', 33, 1);
INSERT INTO `django_admin_log` VALUES (195, '2019-11-19 23:46:39.952795', '9', 'Complain object (9)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 33, 1);
INSERT INTO `django_admin_log` VALUES (196, '2019-11-20 00:12:44.122787', '1', 'Video object (1)', 1, '[{\"added\": {}}]', 35, 1);
INSERT INTO `django_admin_log` VALUES (197, '2019-11-20 02:42:36.749621', '1', 'csdcsdcd', 3, '', 21, 1);
INSERT INTO `django_admin_log` VALUES (198, '2019-11-25 01:09:17.331661', '33', 'tEDIFBKnlZRM', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (199, '2019-11-25 01:20:01.746334', '34', 'wK8XEx593rgu', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (200, '2019-11-26 14:42:36.345900', '2', 'Complain object (2)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 33, 1);
INSERT INTO `django_admin_log` VALUES (201, '2019-11-26 14:54:42.928887', '77', '商务英语300句-Price 价格', 2, '[{\"changed\": {\"fields\": [\"cashout\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (202, '2019-11-26 15:39:42.342926', '1', 'TchbeOut object (1)', 2, '[{\"changed\": {\"fields\": [\"type\"]}}]', 38, 1);
INSERT INTO `django_admin_log` VALUES (203, '2019-11-27 02:04:01.885016', '5', 'fvds', 3, '', 21, 1);
INSERT INTO `django_admin_log` VALUES (204, '2019-11-27 11:13:05.809385', '136', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (205, '2019-11-27 11:13:05.816921', '135', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (206, '2019-11-27 11:13:05.827823', '134', '商务英语300句-Acceptance 接受', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (207, '2019-11-27 11:13:05.834435', '133', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (208, '2019-11-27 11:13:05.840482', '132', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (209, '2019-11-27 11:13:05.849804', '131', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (210, '2019-11-27 11:13:05.857000', '130', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (211, '2019-11-27 11:13:05.863650', '129', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (212, '2019-11-27 11:13:05.871111', '128', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (213, '2019-11-27 11:13:05.879318', '127', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (214, '2019-11-27 11:13:05.885361', '126', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (215, '2019-11-27 11:13:05.892175', '125', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (216, '2019-11-27 11:13:05.898539', '124', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (217, '2019-11-27 11:13:05.904091', '123', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (218, '2019-11-27 11:13:05.909977', '122', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (219, '2019-11-27 11:13:05.920281', '121', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (220, '2019-11-27 11:13:05.929570', '120', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (221, '2019-11-27 11:13:05.935524', '119', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (222, '2019-11-27 11:13:05.943406', '118', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (223, '2019-11-27 11:13:05.951448', '117', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (224, '2019-11-27 11:13:05.959424', '116', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (225, '2019-11-27 11:13:05.965379', '115', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (226, '2019-11-27 11:13:05.971074', '114', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (227, '2019-11-27 11:13:05.976539', '113', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (228, '2019-11-27 11:13:05.982332', '112', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (229, '2019-11-27 11:13:05.988052', '111', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (230, '2019-11-27 11:13:05.993572', '107', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (231, '2019-11-27 11:13:05.999219', '104', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (232, '2019-11-27 11:13:06.005326', '103', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (233, '2019-11-27 11:13:06.012302', '102', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (234, '2019-11-27 11:13:06.018623', '101', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (235, '2019-11-27 11:13:06.064920', '100', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (236, '2019-11-27 11:13:06.072230', '99', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (237, '2019-11-27 11:13:06.078794', '98', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (238, '2019-11-27 11:13:06.093532', '97', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (239, '2019-11-27 11:13:06.100013', '96', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (240, '2019-11-27 11:13:06.107526', '95', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (241, '2019-11-27 11:13:06.113733', '94', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (242, '2019-11-27 11:13:06.119023', '93', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (243, '2019-11-27 11:13:06.124760', '92', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (244, '2019-11-27 11:13:06.135583', '91', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (245, '2019-11-27 11:13:06.142372', '90', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (246, '2019-11-27 11:13:06.150655', '89', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (247, '2019-11-27 11:13:06.157441', '88', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (248, '2019-11-27 11:13:06.164165', '87', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (249, '2019-11-27 11:13:06.171407', '86', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (250, '2019-11-27 11:13:06.177516', '85', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (251, '2019-11-27 11:13:06.185418', '84', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (252, '2019-11-27 11:13:06.191232', '83', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (253, '2019-11-27 11:13:06.196846', '82', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (254, '2019-11-27 11:13:06.203131', '81', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (255, '2019-11-27 11:13:06.210071', '80', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (256, '2019-11-27 11:13:06.216738', '79', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (257, '2019-11-27 11:13:06.224944', '78', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (258, '2019-11-27 11:13:06.233763', '77', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (259, '2019-11-27 11:13:06.242234', '76', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (260, '2019-11-27 11:13:06.248348', '75', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (261, '2019-11-27 11:13:06.255031', '74', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (262, '2019-11-27 11:13:06.263331', '73', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (263, '2019-11-27 11:13:06.272310', '72', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (264, '2019-11-27 11:13:06.278526', '71', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (265, '2019-11-27 11:13:06.285138', '70', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (266, '2019-11-27 11:13:06.291978', '69', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (267, '2019-11-27 11:13:06.300839', '68', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (268, '2019-11-27 11:13:06.308511', '67', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (269, '2019-11-27 11:13:06.315867', '66', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (270, '2019-11-27 11:13:06.346158', '65', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (271, '2019-11-27 11:13:06.367410', '64', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (272, '2019-11-27 11:13:06.376558', '63', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (273, '2019-11-27 11:13:06.382822', '62', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (274, '2019-11-27 11:13:06.391909', '61', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (275, '2019-11-27 11:13:06.398390', '60', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (276, '2019-11-27 11:13:06.405163', '59', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (277, '2019-11-27 11:13:06.412362', '58', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (278, '2019-11-27 11:13:06.418739', '57', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (279, '2019-11-27 11:13:06.425565', '56', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (280, '2019-11-27 11:13:06.432810', '55', '商务英语300句-Acceptance 接受', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (281, '2019-11-27 11:13:06.443598', '54', '商务英语300句-Acceptance 接受', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (282, '2019-11-27 11:13:06.451004', '53', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (283, '2019-11-27 11:13:06.457106', '52', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (284, '2019-11-27 11:14:01.788908', '6', 'cdscds', 3, '', 21, 1);
INSERT INTO `django_admin_log` VALUES (285, '2019-11-27 11:14:36.308721', '136', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (286, '2019-11-27 11:14:36.317598', '135', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (287, '2019-11-27 11:14:36.323686', '134', '商务英语300句-Acceptance 接受', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (288, '2019-11-27 11:14:36.330032', '133', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (289, '2019-11-27 11:14:36.335775', '132', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (290, '2019-11-27 11:14:36.341507', '131', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (291, '2019-11-27 11:14:36.347315', '130', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (292, '2019-11-27 11:14:36.353101', '129', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (293, '2019-11-27 11:14:36.358746', '128', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (294, '2019-11-27 11:14:36.370929', '127', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (295, '2019-11-27 11:14:36.382548', '126', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (296, '2019-11-27 11:14:36.395504', '125', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (297, '2019-11-27 11:14:36.404757', '124', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (298, '2019-11-27 11:14:36.415326', '123', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (299, '2019-11-27 11:14:36.421687', '122', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (300, '2019-11-27 11:14:36.429430', '121', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (301, '2019-11-27 11:14:36.448811', '120', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (302, '2019-11-27 11:14:36.465025', '119', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (303, '2019-11-27 11:14:36.472111', '118', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (304, '2019-11-27 11:14:36.481232', '117', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (305, '2019-11-27 11:14:36.488416', '116', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (306, '2019-11-27 11:14:36.495260', '115', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (307, '2019-11-27 11:14:36.502830', '114', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (308, '2019-11-27 11:14:36.512988', '113', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (309, '2019-11-27 11:14:36.521024', '112', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (310, '2019-11-27 11:14:36.528279', '111', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (311, '2019-11-27 11:14:36.534641', '107', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (312, '2019-11-27 11:14:36.540577', '104', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (313, '2019-11-27 11:14:36.546836', '103', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (314, '2019-11-27 11:14:36.552570', '102', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (315, '2019-11-27 11:14:36.559376', '101', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (316, '2019-11-27 11:14:36.566148', '100', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (317, '2019-11-27 11:14:36.573213', '99', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (318, '2019-11-27 11:14:36.579732', '98', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (319, '2019-11-27 11:14:36.586257', '97', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (320, '2019-11-27 11:14:36.592779', '96', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (321, '2019-11-27 11:14:36.600165', '95', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (322, '2019-11-27 11:14:36.616324', '94', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (323, '2019-11-27 11:14:36.622897', '93', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (324, '2019-11-27 11:14:36.629273', '92', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (325, '2019-11-27 11:14:36.638848', '91', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (326, '2019-11-27 11:14:36.644971', '90', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (327, '2019-11-27 11:14:36.653445', '89', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (328, '2019-11-27 11:14:36.660108', '88', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (329, '2019-11-27 11:14:36.666755', '87', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (330, '2019-11-27 11:14:36.673610', '86', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (331, '2019-11-27 11:14:36.679894', '85', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (332, '2019-11-27 11:14:36.687240', '84', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (333, '2019-11-27 11:14:36.692905', '83', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (334, '2019-11-27 11:14:36.699416', '82', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (335, '2019-11-27 11:14:36.707614', '81', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (336, '2019-11-27 11:14:36.714070', '80', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (337, '2019-11-27 11:14:36.724533', '79', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (338, '2019-11-27 11:14:36.733095', '78', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (339, '2019-11-27 11:14:36.745285', '77', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (340, '2019-11-27 11:14:36.755905', '76', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (341, '2019-11-27 11:14:36.764815', '75', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (342, '2019-11-27 11:14:36.771694', '74', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (343, '2019-11-27 11:14:36.781447', '73', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (344, '2019-11-27 11:14:36.789120', '72', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (345, '2019-11-27 11:14:36.797557', '71', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (346, '2019-11-27 11:14:36.804049', '70', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (347, '2019-11-27 11:14:36.822799', '69', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (348, '2019-11-27 11:14:36.829788', '68', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (349, '2019-11-27 11:14:36.836499', '67', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (350, '2019-11-27 11:14:36.842232', '66', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (351, '2019-11-27 11:14:36.848610', '65', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (352, '2019-11-27 11:14:36.854330', '64', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (353, '2019-11-27 11:14:36.863546', '63', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (354, '2019-11-27 11:14:36.871569', '62', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (355, '2019-11-27 11:14:36.878022', '61', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (356, '2019-11-27 11:14:36.885661', '60', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (357, '2019-11-27 11:14:36.899628', '59', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (358, '2019-11-27 11:14:36.906978', '58', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (359, '2019-11-27 11:14:36.914836', '57', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (360, '2019-11-27 11:14:36.926266', '56', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (361, '2019-11-27 11:14:36.932451', '55', '商务英语300句-Acceptance 接受', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (362, '2019-11-27 11:14:36.938539', '54', '商务英语300句-Acceptance 接受', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (363, '2019-11-27 11:14:36.944442', '53', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (364, '2019-11-27 11:14:36.949892', '52', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (365, '2019-11-27 11:15:26.939389', '136', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (366, '2019-11-27 11:15:26.946087', '135', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (367, '2019-11-27 11:15:26.953082', '134', '商务英语300句-Acceptance 接受', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (368, '2019-11-27 11:15:26.959197', '133', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (369, '2019-11-27 11:15:26.965583', '132', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (370, '2019-11-27 11:15:26.971298', '131', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (371, '2019-11-27 11:15:26.977182', '130', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (372, '2019-11-27 11:15:26.983224', '129', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (373, '2019-11-27 11:15:26.993900', '128', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (374, '2019-11-27 11:15:27.002449', '127', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (375, '2019-11-27 11:15:27.014801', '126', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (376, '2019-11-27 11:15:27.027185', '125', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (377, '2019-11-27 11:15:27.034593', '124', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (378, '2019-11-27 11:15:27.041717', '123', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (379, '2019-11-27 11:15:27.048068', '122', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (380, '2019-11-27 11:15:27.055658', '121', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (381, '2019-11-27 11:15:27.074455', '120', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (382, '2019-11-27 11:15:27.084836', '119', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (383, '2019-11-27 11:15:27.090530', '118', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (384, '2019-11-27 11:15:27.102165', '117', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (385, '2019-11-27 11:15:27.110692', '116', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (386, '2019-11-27 11:15:27.118760', '115', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (387, '2019-11-27 11:15:27.126348', '114', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (388, '2019-11-27 11:15:27.133524', '113', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (389, '2019-11-27 11:15:27.150930', '112', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (390, '2019-11-27 11:15:27.157026', '111', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (391, '2019-11-27 11:15:27.163526', '107', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (392, '2019-11-27 11:15:27.170128', '104', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (393, '2019-11-27 11:15:27.177382', '103', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (394, '2019-11-27 11:15:27.184096', '102', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (395, '2019-11-27 11:15:27.196235', '101', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (396, '2019-11-27 11:15:27.203320', '100', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (397, '2019-11-27 11:15:27.215359', '99', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (398, '2019-11-27 11:15:27.222078', '98', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (399, '2019-11-27 11:15:27.228121', '97', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (400, '2019-11-27 11:15:27.239389', '96', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (401, '2019-11-27 11:15:27.245568', '95', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (402, '2019-11-27 11:15:27.252317', '94', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (403, '2019-11-27 11:15:27.258632', '93', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (404, '2019-11-27 11:15:27.264679', '92', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (405, '2019-11-27 11:15:27.274003', '91', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (406, '2019-11-27 11:15:27.280196', '90', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (407, '2019-11-27 11:15:27.286788', '89', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (408, '2019-11-27 11:15:27.292021', '88', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (409, '2019-11-27 11:15:27.298110', '87', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (410, '2019-11-27 11:15:27.304032', '86', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (411, '2019-11-27 11:15:27.310317', '85', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (412, '2019-11-27 11:15:27.316854', '84', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (413, '2019-11-27 11:15:27.323812', '83', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (414, '2019-11-27 11:15:27.330472', '82', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (415, '2019-11-27 11:15:27.341736', '81', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (416, '2019-11-27 11:15:27.347985', '80', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (417, '2019-11-27 11:15:27.355431', '79', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (418, '2019-11-27 11:15:27.367361', '78', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (419, '2019-11-27 11:15:27.373240', '77', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (420, '2019-11-27 11:15:27.379072', '76', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (421, '2019-11-27 11:15:27.384457', '75', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (422, '2019-11-27 11:15:27.390478', '74', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (423, '2019-11-27 11:15:27.396754', '73', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (424, '2019-11-27 11:15:27.402345', '72', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (425, '2019-11-27 11:15:27.408254', '71', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (426, '2019-11-27 11:15:27.416158', '70', '商务英语300句-Price 价格', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (427, '2019-11-27 11:15:27.422065', '69', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (428, '2019-11-27 11:15:27.428316', '68', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (429, '2019-11-27 11:15:27.435195', '67', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (430, '2019-11-27 11:15:27.444208', '66', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (431, '2019-11-27 11:15:27.449890', '65', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (432, '2019-11-27 11:15:27.455652', '64', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (433, '2019-11-27 11:15:27.461929', '63', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (434, '2019-11-27 11:15:27.468752', '62', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (435, '2019-11-27 11:15:27.475283', '61', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (436, '2019-11-27 11:15:27.481446', '60', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (437, '2019-11-27 11:15:27.495399', '59', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (438, '2019-11-27 11:15:27.508454', '58', '商务英语300句-Telephone Calls 打电话', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (439, '2019-11-27 11:15:27.514865', '57', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (440, '2019-11-27 11:15:27.520565', '56', '商务英语300句-Insurance 保险', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (441, '2019-11-27 11:15:27.526421', '55', '商务英语300句-Acceptance 接受', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (442, '2019-11-27 11:15:27.537454', '54', '商务英语300句-Acceptance 接受', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (443, '2019-11-27 11:15:27.546569', '53', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (444, '2019-11-27 11:15:27.555510', '52', '商务英语300句-Counteroffer 还盘', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (445, '2019-11-27 17:19:12.750231', '9', 'cdscdscds', 3, '', 21, 1);
INSERT INTO `django_admin_log` VALUES (446, '2019-11-28 17:17:54.936610', '2', 'TchbeOut object (2)', 2, '[{\"changed\": {\"fields\": [\"type\"]}}]', 38, 1);
INSERT INTO `django_admin_log` VALUES (447, '2019-11-28 17:18:15.949787', '2', 'TchbeOut object (2)', 2, '[{\"changed\": {\"fields\": [\"reason\"]}}]', 38, 1);
INSERT INTO `django_admin_log` VALUES (448, '2019-11-28 17:47:38.943648', '1', 'Invite object (1)', 2, '[{\"changed\": {\"fields\": [\"fee\", \"task3_type\"]}}]', 37, 1);
INSERT INTO `django_admin_log` VALUES (449, '2019-12-07 13:52:10.331974', '2', '职场英语', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"class\"}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"class\"}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"class\"}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (450, '2019-12-07 13:54:39.986609', '3', '职场英语', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"class\"}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u8be6\\u60c5\", \"object\": \"2\"}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (451, '2019-12-16 19:23:31.612709', '2', '职场英语', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (452, '2019-12-16 19:46:32.758477', '2', '职场英语', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (453, '2019-12-16 19:57:27.666713', '2', '职场英语', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (454, '2019-12-16 20:09:17.780824', '1', '精听歌曲学英语', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (455, '2019-12-16 20:09:33.422480', '1', 'Lost stars (Introduction)', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (456, '2019-12-16 20:09:42.477047', '2', 'music terms in the lyrics 英文歌词里面的音乐术语', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (457, '2019-12-16 20:10:17.713977', '1', '精听歌曲学英语', 2, '[{\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"Verse 1-4\"}}, {\"changed\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"Verse 1-1\", \"fields\": [\"name\"]}}, {\"changed\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"Verse 1-2\", \"fields\": [\"name\"]}}, {\"changed\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"Verse 1-3\", \"fields\": [\"name\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (458, '2019-12-16 20:10:35.169862', '1', '精听歌曲学英语', 2, '[{\"changed\": {\"fields\": [\"main\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (459, '2019-12-16 20:11:35.975483', '3', '职场英语必备——一歌一词一习语（初级）', 2, '[{\"changed\": {\"fields\": [\"name\", \"main\"]}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"\\u611f\\u8c22\\u60a8\\u4ece\\u767e\\u5fd9\\u4e4b\\u4e2d\\u62bd\\u7a7a\\u5173\\u6ce8\\u6211\"}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"\\u660e\\u660e\\u767d\\u767d\\u505a\\u4eba\\uff0c\\u8f7b\\u8f7b\\u677e\\u677e\\u505a\\u4e8b\"}}, {\"changed\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"\\u804c\\u573a\\u4e00\\u5165\\u6df1\\u4f3c\\u6d77\\uff0c\\u56f0\\u96be\\u91cd\\u91cd\\u4f3c\\u65e0\\u8fb9\", \"fields\": [\"name\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (460, '2019-12-16 20:12:45.280222', '4', '和外教中教一起学英语口语', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"\\u82f1\\u8bed\\u53e3\\u8bed\\u9769\\u547d\\u96f6\\u57fa\\u78402018\"}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"Everyday conversation 2018\\u7248 \\u5916\\u6559\"}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (461, '2019-12-16 20:14:21.680880', '5', '旅游英语口语', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"\\u53e3\\u8bed1\"}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"\\u53e3\\u8bed2\"}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"\\u53e3\\u8bed3\"}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (462, '2019-12-16 20:26:06.279733', '2', 'Banner object (2)', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 22, 1);
INSERT INTO `django_admin_log` VALUES (463, '2019-12-16 20:26:42.708594', '4', 'jony', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (464, '2020-01-10 12:19:09.334492', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (465, '2020-01-13 16:06:11.554634', '6', 'Apply object (6)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (466, '2020-01-13 16:06:11.732492', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (467, '2020-01-13 16:09:38.757853', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (468, '2020-01-13 16:09:43.439114', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (469, '2020-01-13 16:13:24.924817', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (470, '2020-01-13 16:45:23.991701', '6', 'Apply object (6)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (471, '2020-01-14 16:36:39.458675', '13', 'Complain object (13)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 33, 1);
INSERT INTO `django_admin_log` VALUES (472, '2020-01-14 16:47:16.874889', '4', 'TchbeOut object (4)', 2, '[{\"changed\": {\"fields\": [\"type\"]}}]', 38, 1);
INSERT INTO `django_admin_log` VALUES (473, '2020-01-14 17:08:38.166601', '35', 'Q8KkauoqP5Et', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (474, '2020-01-14 17:54:29.421112', '1', 'Platform object (1)', 1, '[{\"added\": {}}]', 39, 1);
INSERT INTO `django_admin_log` VALUES (475, '2020-01-15 13:54:08.237725', '2', 'aeclub', 2, '[{\"changed\": {\"fields\": [\"is_superuser\", \"user_permissions\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (476, '2020-01-15 13:55:46.364600', '2', 'aeclub', 2, '[{\"changed\": {\"fields\": [\"user_permissions\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (477, '2020-01-15 13:57:30.666859', '2', 'aeclub', 2, '[{\"changed\": {\"fields\": [\"user_permissions\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (478, '2020-01-15 13:58:28.745580', '2', 'aeclub', 2, '[{\"changed\": {\"fields\": [\"user_permissions\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (479, '2020-01-15 13:59:34.951341', '191', '精听歌曲学英语-Verse 1-1', 3, '', 19, 2);
INSERT INTO `django_admin_log` VALUES (480, '2020-01-15 14:04:25.697526', '2', 'aeclub', 2, '[{\"changed\": {\"fields\": [\"user_permissions\", \"last_login\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (481, '2020-01-15 17:58:20.208821', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 2);
INSERT INTO `django_admin_log` VALUES (482, '2020-01-16 11:53:09.145984', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 2);
INSERT INTO `django_admin_log` VALUES (483, '2020-01-16 11:53:48.317004', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 2);
INSERT INTO `django_admin_log` VALUES (487, '2020-01-16 16:40:20.567448', '6', 'zheng qi', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"V\"}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (488, '2020-01-18 16:26:31.128893', '1', 'Platform object (1)', 3, '', 39, 1);
INSERT INTO `django_admin_log` VALUES (489, '2020-01-18 16:29:16.267021', '2', 'Platform object (2)', 1, '[{\"added\": {}}]', 39, 1);
INSERT INTO `django_admin_log` VALUES (490, '2020-01-18 16:39:43.085812', '7', 'Apply object (7)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (491, '2020-01-18 16:41:53.174580', '12', 'zhu', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (492, '2020-01-18 16:45:01.790004', '7', 'Apply object (7)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (493, '2020-01-18 16:51:07.917929', '2', 'Invite object (2)', 3, '', 37, 1);
INSERT INTO `django_admin_log` VALUES (494, '2020-01-18 16:51:07.921386', '1', 'Invite object (1)', 3, '', 37, 1);
INSERT INTO `django_admin_log` VALUES (495, '2020-01-18 16:52:41.387442', '3', '你', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (496, '2020-01-18 17:14:34.952800', '214', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 2, '[{\"changed\": {\"fields\": [\"classin\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (497, '2020-01-18 17:15:16.750103', '214', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 2, '[]', 19, 1);
INSERT INTO `django_admin_log` VALUES (498, '2020-01-18 17:31:51.052093', '14', 'Complain object (14)', 2, '[{\"changed\": {\"fields\": [\"status\", \"reason\"]}}]', 33, 1);
INSERT INTO `django_admin_log` VALUES (499, '2020-01-18 17:33:32.991274', '14', 'Complain object (14)', 2, '[{\"changed\": {\"fields\": [\"status\", \"reason\"]}}]', 33, 1);
INSERT INTO `django_admin_log` VALUES (500, '2020-01-18 17:49:09.647259', '4', 'TchbeOut object (4)', 2, '[{\"changed\": {\"fields\": [\"type\"]}}]', 38, 1);
INSERT INTO `django_admin_log` VALUES (501, '2020-01-18 17:52:24.379091', '1', 'Video object (1)', 2, '[]', 35, 1);
INSERT INTO `django_admin_log` VALUES (502, '2020-01-18 17:58:27.828720', '13', 'office english', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (503, '2020-01-18 18:01:00.674003', '7', 'office1', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"introduction\"}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u76ee\\u5f55\\u7ba1\\u7406\", \"object\": \"preface\"}}, {\"added\": {\"name\": \"\\u8bfe\\u7a0b\\u8be6\\u60c5\", \"object\": \"3\"}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (504, '2020-02-14 14:32:22.081872', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"content\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (505, '2020-02-14 14:32:36.649030', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"content\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (506, '2020-02-14 14:32:47.795436', '5', 'Apply object (5)', 2, '[{\"changed\": {\"fields\": [\"cause\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (507, '2020-05-30 21:07:09.667598', '7', 'Apply object (7)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (508, '2020-05-31 10:51:38.030649', '216', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (509, '2020-05-31 10:51:38.040004', '215', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (510, '2020-05-31 10:51:38.049062', '214', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (511, '2020-05-31 10:51:38.057127', '213', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (512, '2020-05-31 10:51:38.068068', '212', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (513, '2020-05-31 10:51:38.081309', '211', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (514, '2020-05-31 10:51:38.092105', '210', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (515, '2020-05-31 10:51:38.101164', '209', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (516, '2020-05-31 10:51:38.109876', '208', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (517, '2020-05-31 10:51:38.118120', '207', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (518, '2020-05-31 10:51:38.127230', '206', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (519, '2020-05-31 10:51:38.136215', '205', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (520, '2020-05-31 10:51:38.144822', '204', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (521, '2020-05-31 10:51:38.153856', '203', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (522, '2020-05-31 10:51:38.162527', '202', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (523, '2020-05-31 10:51:38.172408', '201', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (524, '2020-05-31 10:51:38.181138', '200', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (525, '2020-05-31 10:51:38.191931', '199', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (526, '2020-05-31 10:51:38.200238', '198', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (527, '2020-05-31 10:51:38.208591', '197', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (528, '2020-05-31 10:51:38.217963', '196', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (529, '2020-05-31 10:51:38.226916', '195', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (530, '2020-05-31 10:51:38.234794', '194', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (531, '2020-05-31 10:51:38.243350', '193', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (532, '2020-05-31 10:51:38.250995', '192', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (533, '2020-05-31 10:51:38.259158', '190', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (534, '2020-05-31 10:51:38.267794', '189', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (535, '2020-05-31 10:51:38.276163', '188', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (536, '2020-05-31 10:51:38.285065', '187', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (537, '2020-05-31 10:51:38.293144', '186', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (538, '2020-05-31 10:51:38.301802', '185', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (539, '2020-05-31 10:51:38.310138', '184', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (540, '2020-05-31 10:51:38.318758', '183', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (541, '2020-05-31 10:51:38.326843', '182', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (542, '2020-05-31 10:51:38.335217', '181', '旅游英语口语-口语1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (543, '2020-05-31 10:51:38.343853', '180', '旅游英语口语-口语1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (544, '2020-05-31 10:51:38.354173', '179', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (545, '2020-05-31 10:51:38.363164', '178', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (546, '2020-05-31 10:51:38.371443', '177', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (547, '2020-05-31 10:51:38.381455', '176', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (548, '2020-05-31 10:51:38.389467', '175', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (549, '2020-05-31 10:51:38.399484', '174', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (550, '2020-05-31 10:51:38.407624', '173', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (551, '2020-05-31 10:51:38.415737', '172', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (552, '2020-05-31 10:51:38.424520', '171', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (553, '2020-05-31 10:51:38.434719', '170', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (554, '2020-05-31 10:51:38.447060', '169', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (555, '2020-05-31 10:51:38.455532', '168', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (556, '2020-05-31 10:51:38.463838', '167', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (557, '2020-05-31 10:51:38.473270', '166', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (558, '2020-05-31 10:51:38.485209', '165', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (559, '2020-05-31 10:51:38.493586', '164', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (560, '2020-05-31 10:51:38.502035', '163', '旅游英语口语-口语2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (561, '2020-05-31 10:51:38.509828', '162', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (562, '2020-05-31 10:51:38.518290', '161', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (563, '2020-05-31 10:51:38.526449', '160', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (564, '2020-05-31 10:51:38.535615', '159', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (565, '2020-05-31 10:51:38.543709', '158', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (566, '2020-05-31 10:51:38.552397', '157', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (567, '2020-05-31 10:51:38.561016', '156', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (568, '2020-05-31 10:51:38.568895', '155', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (569, '2020-05-31 10:51:38.577902', '154', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (570, '2020-05-31 10:51:38.586000', '153', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (571, '2020-05-31 10:51:38.594492', '152', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (572, '2020-05-31 10:51:38.603072', '151', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (573, '2020-05-31 10:51:38.611534', '150', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (574, '2020-05-31 10:51:38.619019', '149', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (575, '2020-05-31 10:51:38.626478', '148', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (576, '2020-05-31 10:51:38.634396', '147', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (577, '2020-05-31 10:51:38.644488', '146', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (578, '2020-05-31 10:51:38.652457', '145', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (579, '2020-05-31 10:51:38.659936', '144', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (580, '2020-05-31 10:51:38.668299', '143', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (581, '2020-05-31 10:51:38.676074', '142', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (582, '2020-05-31 10:51:38.684001', '141', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (583, '2020-05-31 10:51:38.691860', '140', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (584, '2020-05-31 10:51:38.699452', '139', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (585, '2020-05-31 10:51:38.707259', '138', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (586, '2020-05-31 10:51:38.714879', '137', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (587, '2020-05-31 11:03:10.399565', '180', '旅游英语口语-口语1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (588, '2020-05-31 11:03:59.189136', '216', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (589, '2020-05-31 11:04:14.710999', '215', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (590, '2020-05-31 11:04:33.209855', '214', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (591, '2020-05-31 11:04:54.706939', '213', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (592, '2020-05-31 11:05:04.059458', '185', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (593, '2020-05-31 11:05:18.607675', '212', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (594, '2020-05-31 11:05:18.716472', '185', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (595, '2020-05-31 11:06:25.130166', '212', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (596, '2020-05-31 11:06:25.139742', '185', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (597, '2020-05-31 11:06:48.002872', '212', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (598, '2020-05-31 11:19:52.918074', '211', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (599, '2020-05-31 11:19:52.927707', '210', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (600, '2020-05-31 11:19:52.936362', '209', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (601, '2020-05-31 11:19:52.944772', '208', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (602, '2020-05-31 11:19:52.953545', '207', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (603, '2020-05-31 11:19:52.962135', '206', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (604, '2020-05-31 11:19:52.970543', '205', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (605, '2020-05-31 11:19:52.979092', '204', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (606, '2020-05-31 11:19:52.987986', '203', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (607, '2020-05-31 11:19:52.997581', '202', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (608, '2020-05-31 11:19:53.006301', '201', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (609, '2020-05-31 11:19:53.015463', '200', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (610, '2020-05-31 11:19:53.024815', '199', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (611, '2020-05-31 11:19:53.033190', '198', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (612, '2020-05-31 11:19:53.041338', '197', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (613, '2020-05-31 11:19:53.050789', '196', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (614, '2020-05-31 11:19:53.060296', '195', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (615, '2020-05-31 11:19:53.068828', '194', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (616, '2020-05-31 11:19:53.077729', '193', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (617, '2020-05-31 11:19:53.085893', '192', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (618, '2020-05-31 11:19:53.093947', '190', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (619, '2020-05-31 11:19:53.102381', '189', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (620, '2020-05-31 11:19:53.112675', '188', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (621, '2020-05-31 11:19:53.121118', '187', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (622, '2020-05-31 11:19:53.130066', '186', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (623, '2020-05-31 11:19:53.138478', '185', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (624, '2020-05-31 11:19:53.146466', '184', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (625, '2020-05-31 11:19:53.155341', '183', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (626, '2020-05-31 11:19:53.163232', '182', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (627, '2020-05-31 11:19:53.171205', '181', '旅游英语口语-口语1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (628, '2020-05-31 11:19:53.179477', '179', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (629, '2020-05-31 11:19:53.187578', '178', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (630, '2020-05-31 11:19:53.194891', '177', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (631, '2020-05-31 11:19:53.202055', '176', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (632, '2020-05-31 11:19:53.210189', '175', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (633, '2020-05-31 11:19:53.218257', '174', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (634, '2020-05-31 11:19:53.225737', '173', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (635, '2020-05-31 11:19:53.234288', '172', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (636, '2020-05-31 11:19:53.244500', '171', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (637, '2020-05-31 11:19:53.252676', '170', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (638, '2020-05-31 11:19:53.260890', '169', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (639, '2020-05-31 11:19:53.269607', '168', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (640, '2020-05-31 11:19:53.278125', '167', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (641, '2020-05-31 11:19:53.284621', '166', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (642, '2020-05-31 11:19:53.292522', '165', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (643, '2020-05-31 11:19:53.300676', '164', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (644, '2020-05-31 11:19:53.308865', '163', '旅游英语口语-口语2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (645, '2020-05-31 11:19:53.316845', '162', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (646, '2020-05-31 11:19:53.325748', '161', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (647, '2020-05-31 11:19:53.334891', '160', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (648, '2020-05-31 11:19:53.342917', '159', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (649, '2020-05-31 11:19:53.350905', '158', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (650, '2020-05-31 11:19:53.358916', '157', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (651, '2020-05-31 11:19:53.367929', '156', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (652, '2020-05-31 11:19:53.375623', '155', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (653, '2020-05-31 11:19:53.383803', '154', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (654, '2020-05-31 11:19:53.392696', '153', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (655, '2020-05-31 11:19:53.400232', '152', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (656, '2020-05-31 11:19:53.408110', '151', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (657, '2020-05-31 11:19:53.415529', '150', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (658, '2020-05-31 11:19:53.423500', '149', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (659, '2020-05-31 11:19:53.431928', '148', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (660, '2020-05-31 11:19:53.439760', '147', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (661, '2020-05-31 11:19:53.447540', '146', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (662, '2020-05-31 11:19:53.455314', '145', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (663, '2020-05-31 11:19:53.463336', '144', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (664, '2020-05-31 11:19:53.471086', '143', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (665, '2020-05-31 11:19:53.478589', '142', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (666, '2020-05-31 11:19:53.487041', '141', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (667, '2020-05-31 11:19:53.495372', '140', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (668, '2020-05-31 11:19:53.505017', '139', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (669, '2020-05-31 11:19:53.514408', '138', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (670, '2020-05-31 11:19:53.523047', '137', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (671, '2020-05-31 11:21:19.643586', '211', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (672, '2020-05-31 11:21:19.653524', '210', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (673, '2020-05-31 11:21:19.670859', '209', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (674, '2020-05-31 11:21:19.683605', '208', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (675, '2020-05-31 11:21:19.692998', '207', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (676, '2020-05-31 11:21:19.703611', '206', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (677, '2020-05-31 11:21:19.712249', '205', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (678, '2020-05-31 11:21:19.720077', '204', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (679, '2020-05-31 11:21:19.729046', '203', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (680, '2020-05-31 11:21:19.738603', '202', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (681, '2020-05-31 11:21:19.746945', '201', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (682, '2020-05-31 11:21:19.757371', '200', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (683, '2020-05-31 11:21:19.767237', '199', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (684, '2020-05-31 11:21:19.780067', '198', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (685, '2020-05-31 11:21:19.801969', '197', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (686, '2020-05-31 11:21:19.810015', '196', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (687, '2020-05-31 11:21:19.820234', '195', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (688, '2020-05-31 11:21:19.829614', '194', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (689, '2020-05-31 11:21:19.839531', '193', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (690, '2020-05-31 11:21:19.849776', '192', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (691, '2020-05-31 11:21:19.859278', '190', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (692, '2020-05-31 11:21:19.866676', '189', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (693, '2020-05-31 11:21:19.878304', '188', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (694, '2020-05-31 11:21:19.889311', '187', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (695, '2020-05-31 11:21:19.901231', '186', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (696, '2020-05-31 11:21:19.911983', '185', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (697, '2020-05-31 11:21:19.920057', '184', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (698, '2020-05-31 11:21:19.931967', '183', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (699, '2020-05-31 11:21:19.940979', '182', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (700, '2020-05-31 11:21:19.948924', '181', '旅游英语口语-口语1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (701, '2020-05-31 11:21:19.956764', '179', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (702, '2020-05-31 11:21:19.966106', '178', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (703, '2020-05-31 11:21:19.975571', '177', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (704, '2020-05-31 11:21:19.984362', '176', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (705, '2020-05-31 11:21:19.993369', '175', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (706, '2020-05-31 11:21:20.002045', '174', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (707, '2020-05-31 11:21:20.011366', '173', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (708, '2020-05-31 11:21:20.020756', '172', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (709, '2020-05-31 11:21:20.029197', '171', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (710, '2020-05-31 11:21:20.037140', '170', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (711, '2020-05-31 11:21:20.044859', '169', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (712, '2020-05-31 11:21:20.052654', '168', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (713, '2020-05-31 11:21:20.064118', '167', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (714, '2020-05-31 11:21:20.072214', '166', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (715, '2020-05-31 11:21:20.080366', '165', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (716, '2020-05-31 11:21:20.089391', '164', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (717, '2020-05-31 11:21:20.097454', '163', '旅游英语口语-口语2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (718, '2020-05-31 11:21:20.105247', '162', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (719, '2020-05-31 11:21:20.113190', '161', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (720, '2020-05-31 11:21:20.121296', '160', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (721, '2020-05-31 11:21:20.128952', '159', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (722, '2020-05-31 11:21:20.136997', '158', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (723, '2020-05-31 11:21:20.144878', '157', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (724, '2020-05-31 11:21:20.153205', '156', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (725, '2020-05-31 11:21:20.160501', '155', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (726, '2020-05-31 11:21:20.168527', '154', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (727, '2020-05-31 11:21:20.176111', '153', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (728, '2020-05-31 11:21:20.184077', '152', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (729, '2020-05-31 11:21:20.191351', '151', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (730, '2020-05-31 11:21:20.204122', '150', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (731, '2020-05-31 11:21:20.212078', '149', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (732, '2020-05-31 11:21:20.220534', '148', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (733, '2020-05-31 11:21:20.228843', '147', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (734, '2020-05-31 11:21:20.236527', '146', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (735, '2020-05-31 11:21:20.244119', '145', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (736, '2020-05-31 11:21:20.252288', '144', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (737, '2020-05-31 11:21:20.260183', '143', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (738, '2020-05-31 11:21:20.269701', '142', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (739, '2020-05-31 11:21:20.278594', '141', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (740, '2020-05-31 11:21:20.290067', '140', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (741, '2020-05-31 11:21:20.301124', '139', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (742, '2020-05-31 11:21:20.309737', '138', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (743, '2020-05-31 11:21:20.318090', '137', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (744, '2020-05-31 11:29:52.798495', '211', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (745, '2020-05-31 11:29:52.810752', '210', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (746, '2020-05-31 11:29:52.821795', '209', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (747, '2020-05-31 11:29:52.831371', '208', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (748, '2020-05-31 11:29:52.844581', '207', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (749, '2020-05-31 11:29:52.855035', '206', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (750, '2020-05-31 11:29:52.863958', '205', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (751, '2020-05-31 11:29:52.873041', '204', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (752, '2020-05-31 11:29:52.881669', '203', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (753, '2020-05-31 11:29:52.891008', '202', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (754, '2020-05-31 11:29:52.899996', '201', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (755, '2020-05-31 11:29:52.908555', '200', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (756, '2020-05-31 11:29:52.917199', '199', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (757, '2020-05-31 11:29:52.926010', '198', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (758, '2020-05-31 11:29:52.935215', '197', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (759, '2020-05-31 11:29:52.944865', '196', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (760, '2020-05-31 11:29:52.953045', '195', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (761, '2020-05-31 11:29:52.961285', '194', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (762, '2020-05-31 11:29:52.969414', '193', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (763, '2020-05-31 11:29:52.977153', '192', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (764, '2020-05-31 11:29:52.986697', '190', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (765, '2020-05-31 11:29:52.995996', '189', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (766, '2020-05-31 11:29:53.004915', '188', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (767, '2020-05-31 11:29:53.015274', '187', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (768, '2020-05-31 11:29:53.023716', '186', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (769, '2020-05-31 11:29:53.032361', '185', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (770, '2020-05-31 11:29:53.041307', '184', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (771, '2020-05-31 11:29:53.051137', '183', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (772, '2020-05-31 11:29:53.060566', '182', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (773, '2020-05-31 11:29:53.068949', '181', '旅游英语口语-口语1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (774, '2020-05-31 11:29:53.079419', '179', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (775, '2020-05-31 11:29:53.088120', '178', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (776, '2020-05-31 11:29:53.096727', '177', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (777, '2020-05-31 11:29:53.105759', '176', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (778, '2020-05-31 11:29:53.113951', '175', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (779, '2020-05-31 11:29:53.122279', '174', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (780, '2020-05-31 11:29:53.130665', '173', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (781, '2020-05-31 11:29:53.138732', '172', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (782, '2020-05-31 11:29:53.147351', '171', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (783, '2020-05-31 11:29:53.155700', '170', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (784, '2020-05-31 11:29:53.165610', '169', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (785, '2020-05-31 11:29:53.173189', '168', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (786, '2020-05-31 11:29:53.181308', '167', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (787, '2020-05-31 11:29:53.190763', '166', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (788, '2020-05-31 11:29:53.198562', '165', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (789, '2020-05-31 11:29:53.206663', '164', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (790, '2020-05-31 11:29:53.214590', '163', '旅游英语口语-口语2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (791, '2020-05-31 11:29:53.222678', '162', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (792, '2020-05-31 11:29:53.230726', '161', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (793, '2020-05-31 11:29:53.238659', '160', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (794, '2020-05-31 11:29:53.246070', '159', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (795, '2020-05-31 11:29:53.253981', '158', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (796, '2020-05-31 11:29:53.262090', '157', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (797, '2020-05-31 11:29:53.270343', '156', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (798, '2020-05-31 11:29:53.278646', '155', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (799, '2020-05-31 11:29:53.286935', '154', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (800, '2020-05-31 11:29:53.294893', '153', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (801, '2020-05-31 11:29:53.305339', '152', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (802, '2020-05-31 11:29:53.312260', '151', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (803, '2020-05-31 11:29:53.320137', '150', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (804, '2020-05-31 11:29:53.329413', '149', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (805, '2020-05-31 11:29:53.337870', '148', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (806, '2020-05-31 11:29:53.346520', '147', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (807, '2020-05-31 11:29:53.356980', '146', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (808, '2020-05-31 11:29:53.365089', '145', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (809, '2020-05-31 11:29:53.373051', '144', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (810, '2020-05-31 11:29:53.380445', '143', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (811, '2020-05-31 11:29:53.388365', '142', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (812, '2020-05-31 11:29:53.396175', '141', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (813, '2020-05-31 11:29:53.404571', '140', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (814, '2020-05-31 11:29:53.412148', '139', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (815, '2020-05-31 11:29:53.421100', '138', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (816, '2020-05-31 11:29:53.429051', '137', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (817, '2020-05-31 11:30:19.564627', '211', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (818, '2020-05-31 11:30:19.574624', '210', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (819, '2020-05-31 11:30:19.583684', '209', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (820, '2020-05-31 11:30:19.592092', '208', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (821, '2020-05-31 11:30:19.600871', '207', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (822, '2020-05-31 11:30:19.609957', '206', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (823, '2020-05-31 11:30:19.618360', '205', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (824, '2020-05-31 11:30:19.626653', '204', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (825, '2020-05-31 11:30:19.635939', '203', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (826, '2020-05-31 11:30:19.644831', '202', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (827, '2020-05-31 11:30:19.655505', '201', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (828, '2020-05-31 11:30:19.667207', '200', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (829, '2020-05-31 11:30:19.676199', '199', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (830, '2020-05-31 11:30:19.684617', '198', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (831, '2020-05-31 11:30:19.692381', '197', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (832, '2020-05-31 11:30:19.701409', '196', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (833, '2020-05-31 11:30:19.711395', '195', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (834, '2020-05-31 11:30:19.719586', '194', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (835, '2020-05-31 11:30:19.728078', '193', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (836, '2020-05-31 11:30:19.737333', '192', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (837, '2020-05-31 11:30:19.747039', '190', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (838, '2020-05-31 11:30:19.755756', '189', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (839, '2020-05-31 11:30:19.764176', '188', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (840, '2020-05-31 11:30:19.772473', '187', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (841, '2020-05-31 11:30:19.783445', '186', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (842, '2020-05-31 11:30:19.793116', '185', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (843, '2020-05-31 11:30:19.801464', '184', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (844, '2020-05-31 11:30:19.810067', '183', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (845, '2020-05-31 11:30:19.818263', '182', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (846, '2020-05-31 11:30:19.826434', '181', '旅游英语口语-口语1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (847, '2020-05-31 11:30:19.834241', '179', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (848, '2020-05-31 11:30:19.842377', '178', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (849, '2020-05-31 11:30:19.849754', '177', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (850, '2020-05-31 11:30:19.858525', '176', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (851, '2020-05-31 11:30:19.867908', '175', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (852, '2020-05-31 11:30:19.876554', '174', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (853, '2020-05-31 11:30:19.884762', '173', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (854, '2020-05-31 11:30:19.897339', '172', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (855, '2020-05-31 11:30:19.905646', '171', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (856, '2020-05-31 11:30:19.915752', '170', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (857, '2020-05-31 11:30:19.925707', '169', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (858, '2020-05-31 11:30:19.933649', '168', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (859, '2020-05-31 11:30:19.942815', '167', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (860, '2020-05-31 11:30:19.951827', '166', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (861, '2020-05-31 11:30:19.960936', '165', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (862, '2020-05-31 11:30:19.968804', '164', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (863, '2020-05-31 11:30:19.980433', '163', '旅游英语口语-口语2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (864, '2020-05-31 11:30:19.991665', '162', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (865, '2020-05-31 11:30:20.001185', '161', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (866, '2020-05-31 11:30:20.009684', '160', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (867, '2020-05-31 11:30:20.018282', '159', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (868, '2020-05-31 11:30:20.029255', '158', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (869, '2020-05-31 11:30:20.037323', '157', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (870, '2020-05-31 11:30:20.046256', '156', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (871, '2020-05-31 11:30:20.053779', '155', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (872, '2020-05-31 11:30:20.065570', '154', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (873, '2020-05-31 11:30:20.076679', '153', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (874, '2020-05-31 11:30:20.086484', '152', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (875, '2020-05-31 11:30:20.099262', '151', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (876, '2020-05-31 11:30:20.109089', '150', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (877, '2020-05-31 11:30:20.118133', '149', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (878, '2020-05-31 11:30:20.126984', '148', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (879, '2020-05-31 11:30:20.136635', '147', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (880, '2020-05-31 11:30:20.144711', '146', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (881, '2020-05-31 11:30:20.154140', '145', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (882, '2020-05-31 11:30:20.162638', '144', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (883, '2020-05-31 11:30:20.170675', '143', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (884, '2020-05-31 11:30:20.179600', '142', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (885, '2020-05-31 11:30:20.188606', '141', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (886, '2020-05-31 11:30:20.197735', '140', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (887, '2020-05-31 11:30:20.205388', '139', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (888, '2020-05-31 11:30:20.213883', '138', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (889, '2020-05-31 11:30:20.221496', '137', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (890, '2020-05-31 11:30:51.578793', '211', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (891, '2020-05-31 11:30:51.590617', '210', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (892, '2020-05-31 11:30:51.599820', '209', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (893, '2020-05-31 11:30:51.608307', '208', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (894, '2020-05-31 11:30:51.617394', '207', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (895, '2020-05-31 11:30:51.625544', '206', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (896, '2020-05-31 11:30:51.635029', '205', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (897, '2020-05-31 11:30:51.643353', '204', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (898, '2020-05-31 11:30:51.651924', '203', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (899, '2020-05-31 11:30:51.661115', '202', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (900, '2020-05-31 11:30:51.669482', '201', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (901, '2020-05-31 11:30:51.678099', '200', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (902, '2020-05-31 11:30:51.686479', '199', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (903, '2020-05-31 11:30:51.694928', '198', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (904, '2020-05-31 11:30:51.703950', '197', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (905, '2020-05-31 11:30:51.713256', '196', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (906, '2020-05-31 11:30:51.722138', '195', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (907, '2020-05-31 11:30:51.730255', '194', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (908, '2020-05-31 11:30:51.737839', '193', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (909, '2020-05-31 11:30:51.746085', '192', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (910, '2020-05-31 11:30:51.754084', '190', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (911, '2020-05-31 11:30:51.762211', '189', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (912, '2020-05-31 11:30:51.770483', '188', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (913, '2020-05-31 11:30:51.778653', '187', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (914, '2020-05-31 11:30:51.788865', '186', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (915, '2020-05-31 11:30:51.796964', '185', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (916, '2020-05-31 11:30:51.805094', '184', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (917, '2020-05-31 11:30:51.813303', '183', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (918, '2020-05-31 11:30:51.823573', '182', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (919, '2020-05-31 11:30:51.835338', '181', '旅游英语口语-口语1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (920, '2020-05-31 11:30:51.843384', '179', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (921, '2020-05-31 11:30:51.851521', '178', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (922, '2020-05-31 11:30:51.858879', '177', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (923, '2020-05-31 11:30:51.867214', '176', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (924, '2020-05-31 11:30:51.878844', '175', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (925, '2020-05-31 11:30:51.887614', '174', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (926, '2020-05-31 11:30:51.896038', '173', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (927, '2020-05-31 11:30:51.903729', '172', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (928, '2020-05-31 11:30:51.911899', '171', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (929, '2020-05-31 11:30:51.919800', '170', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (930, '2020-05-31 11:30:51.929398', '169', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (931, '2020-05-31 11:30:51.937694', '168', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (932, '2020-05-31 11:30:51.945478', '167', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (933, '2020-05-31 11:30:51.953165', '166', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (934, '2020-05-31 11:30:51.961386', '165', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (935, '2020-05-31 11:30:51.970469', '164', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (936, '2020-05-31 11:30:51.981380', '163', '旅游英语口语-口语2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (937, '2020-05-31 11:30:51.993819', '162', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (938, '2020-05-31 11:30:52.003937', '161', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (939, '2020-05-31 11:30:52.014561', '160', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (940, '2020-05-31 11:30:52.022471', '159', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (941, '2020-05-31 11:30:52.033177', '158', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (942, '2020-05-31 11:30:52.041400', '157', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (943, '2020-05-31 11:30:52.050242', '156', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (944, '2020-05-31 11:30:52.058167', '155', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (945, '2020-05-31 11:30:52.066309', '154', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (946, '2020-05-31 11:30:52.074284', '153', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (947, '2020-05-31 11:30:52.082426', '152', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (948, '2020-05-31 11:30:52.090264', '151', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (949, '2020-05-31 11:30:52.097775', '150', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (950, '2020-05-31 11:30:52.105580', '149', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (951, '2020-05-31 11:30:52.113327', '148', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (952, '2020-05-31 11:30:52.121680', '147', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (953, '2020-05-31 11:30:52.130181', '146', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (954, '2020-05-31 11:30:52.141008', '145', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (955, '2020-05-31 11:30:52.149486', '144', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (956, '2020-05-31 11:30:52.162975', '143', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (957, '2020-05-31 11:30:52.170738', '142', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (958, '2020-05-31 11:30:52.179593', '141', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (959, '2020-05-31 11:30:52.187988', '140', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (960, '2020-05-31 11:30:52.195678', '139', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (961, '2020-05-31 11:30:52.203432', '138', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (962, '2020-05-31 11:30:52.211024', '137', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (963, '2020-05-31 11:31:30.442795', '211', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (964, '2020-05-31 11:31:30.452981', '210', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (965, '2020-05-31 11:31:30.462269', '209', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (966, '2020-05-31 11:31:30.471233', '208', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (967, '2020-05-31 11:31:30.479944', '207', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (968, '2020-05-31 11:31:30.489465', '206', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (969, '2020-05-31 11:31:30.498112', '205', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (970, '2020-05-31 11:31:30.507317', '204', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (971, '2020-05-31 11:31:30.515930', '203', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (972, '2020-05-31 11:31:30.524592', '202', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (973, '2020-05-31 11:31:30.535225', '201', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (974, '2020-05-31 11:31:30.545158', '200', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (975, '2020-05-31 11:31:30.553973', '199', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (976, '2020-05-31 11:31:30.568208', '198', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (977, '2020-05-31 11:31:30.577573', '197', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (978, '2020-05-31 11:31:30.586270', '196', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (979, '2020-05-31 11:31:30.597930', '195', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (980, '2020-05-31 11:31:30.608783', '194', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (981, '2020-05-31 11:31:30.621765', '193', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (982, '2020-05-31 11:31:30.632125', '192', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (983, '2020-05-31 11:31:30.642341', '190', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (984, '2020-05-31 11:31:30.651783', '189', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (985, '2020-05-31 11:31:30.663615', '188', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (986, '2020-05-31 11:31:30.672835', '187', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (987, '2020-05-31 11:31:30.682003', '186', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (988, '2020-05-31 11:31:30.690772', '185', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (989, '2020-05-31 11:31:30.701938', '184', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (990, '2020-05-31 11:31:30.709978', '183', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (991, '2020-05-31 11:31:30.720857', '182', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (992, '2020-05-31 11:31:30.732886', '181', '旅游英语口语-口语1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (993, '2020-05-31 11:31:30.740946', '179', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (994, '2020-05-31 11:31:30.753179', '178', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (995, '2020-05-31 11:31:30.764215', '177', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (996, '2020-05-31 11:31:30.777295', '176', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (997, '2020-05-31 11:31:30.787762', '175', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (998, '2020-05-31 11:31:30.795691', '174', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (999, '2020-05-31 11:31:30.803852', '173', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1000, '2020-05-31 11:31:30.811107', '172', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1001, '2020-05-31 11:31:30.819575', '171', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1002, '2020-05-31 11:31:30.827662', '170', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1003, '2020-05-31 11:31:30.838357', '169', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1004, '2020-05-31 11:31:30.853642', '168', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1005, '2020-05-31 11:31:30.866000', '167', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1006, '2020-05-31 11:31:30.874417', '166', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1007, '2020-05-31 11:31:30.882762', '165', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1008, '2020-05-31 11:31:30.890699', '164', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1009, '2020-05-31 11:31:30.898497', '163', '旅游英语口语-口语2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1010, '2020-05-31 11:31:30.905816', '162', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1011, '2020-05-31 11:31:30.913678', '161', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1012, '2020-05-31 11:31:30.922185', '160', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1013, '2020-05-31 11:31:30.938263', '159', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1014, '2020-05-31 11:31:30.948981', '158', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1015, '2020-05-31 11:31:30.958185', '157', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1016, '2020-05-31 11:31:30.968536', '156', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1017, '2020-05-31 11:31:30.978833', '155', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1018, '2020-05-31 11:31:30.986659', '154', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1019, '2020-05-31 11:31:30.994608', '153', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1020, '2020-05-31 11:31:31.002486', '152', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1021, '2020-05-31 11:31:31.011105', '151', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1022, '2020-05-31 11:31:31.018910', '150', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1023, '2020-05-31 11:31:31.033258', '149', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1024, '2020-05-31 11:31:31.041142', '148', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1025, '2020-05-31 11:31:31.048916', '147', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1026, '2020-05-31 11:31:31.058666', '146', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1027, '2020-05-31 11:31:31.067028', '145', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1028, '2020-05-31 11:31:31.075135', '144', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1029, '2020-05-31 11:31:31.082748', '143', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1030, '2020-05-31 11:31:31.092151', '142', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1031, '2020-05-31 11:31:31.100012', '141', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1032, '2020-05-31 11:31:31.107515', '140', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1033, '2020-05-31 11:31:31.117358', '139', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1034, '2020-05-31 11:31:31.125769', '138', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1035, '2020-05-31 11:31:31.135424', '137', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1036, '2020-05-31 11:33:30.500172', '211', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1037, '2020-05-31 11:33:30.515201', '210', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1038, '2020-05-31 11:33:30.525791', '209', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1039, '2020-05-31 11:33:30.534404', '208', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1040, '2020-05-31 11:33:30.546272', '207', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1041, '2020-05-31 11:33:30.555621', '206', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1042, '2020-05-31 11:33:30.563713', '205', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1043, '2020-05-31 11:33:30.573038', '204', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1044, '2020-05-31 11:33:30.581984', '203', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1045, '2020-05-31 11:33:30.590440', '202', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1046, '2020-05-31 11:33:30.598960', '201', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1047, '2020-05-31 11:33:30.606993', '200', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1048, '2020-05-31 11:33:30.616565', '199', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1049, '2020-05-31 11:33:30.626155', '198', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1050, '2020-05-31 11:33:30.634831', '197', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1051, '2020-05-31 11:33:30.647038', '196', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1052, '2020-05-31 11:33:30.655977', '195', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1053, '2020-05-31 11:33:30.664684', '194', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1054, '2020-05-31 11:33:30.673163', '193', '职场英语必备——一歌一词一习语（初级）-明明白白做人，轻轻松松做事', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1055, '2020-05-31 11:33:30.683661', '192', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1056, '2020-05-31 11:33:30.691890', '190', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1057, '2020-05-31 11:33:30.700227', '189', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1058, '2020-05-31 11:33:30.708210', '188', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1059, '2020-05-31 11:33:30.717059', '187', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1060, '2020-05-31 11:33:30.728010', '186', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1061, '2020-05-31 11:33:30.738909', '185', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1062, '2020-05-31 11:33:30.747605', '184', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1063, '2020-05-31 11:33:30.757063', '183', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1064, '2020-05-31 11:33:30.766543', '182', '和外教中教一起学英语口语-英语口语革命零基础2018', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1065, '2020-05-31 11:33:30.777887', '181', '旅游英语口语-口语1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1066, '2020-05-31 11:33:30.787190', '179', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1067, '2020-05-31 11:33:30.795654', '178', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1068, '2020-05-31 11:33:30.803894', '177', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1069, '2020-05-31 11:33:30.812353', '176', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1070, '2020-05-31 11:33:30.820699', '175', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1071, '2020-05-31 11:33:30.828103', '174', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1072, '2020-05-31 11:33:30.836348', '173', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1073, '2020-05-31 11:33:30.844793', '172', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1074, '2020-05-31 11:33:30.852598', '171', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1075, '2020-05-31 11:33:30.860230', '170', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1076, '2020-05-31 11:33:30.868728', '169', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1077, '2020-05-31 11:33:30.877331', '168', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1078, '2020-05-31 11:33:30.885711', '167', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1079, '2020-05-31 11:33:30.893393', '166', '和外教中教一起学英语口语-Everyday conversation 2018版 外教', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1080, '2020-05-31 11:33:30.905300', '165', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1081, '2020-05-31 11:33:30.914831', '164', '职场英语必备——一歌一词一习语（初级）-感谢您从百忙之中抽空关注我', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1082, '2020-05-31 11:33:30.923546', '163', '旅游英语口语-口语2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1083, '2020-05-31 11:33:30.932119', '162', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1084, '2020-05-31 11:33:30.940036', '161', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1085, '2020-05-31 11:33:30.947763', '160', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1086, '2020-05-31 11:33:30.955981', '159', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1087, '2020-05-31 11:33:30.963826', '158', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1088, '2020-05-31 11:33:30.972513', '157', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1089, '2020-05-31 11:33:30.980325', '156', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1090, '2020-05-31 11:33:30.988466', '155', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1091, '2020-05-31 11:33:30.996216', '154', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1092, '2020-05-31 11:33:31.004448', '153', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1093, '2020-05-31 11:33:31.011891', '152', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1094, '2020-05-31 11:33:31.019475', '151', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1095, '2020-05-31 11:33:31.028916', '150', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1096, '2020-05-31 11:33:31.036956', '149', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1097, '2020-05-31 11:33:31.044805', '148', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1098, '2020-05-31 11:33:31.052296', '147', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1099, '2020-05-31 11:33:31.062390', '146', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1100, '2020-05-31 11:33:31.072824', '145', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1101, '2020-05-31 11:33:31.080571', '144', '精听歌曲学英语-Verse 1-2', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1102, '2020-05-31 11:33:31.088612', '143', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1103, '2020-05-31 11:33:31.096012', '142', '精听歌曲学英语-Verse 1-1', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1104, '2020-05-31 11:33:31.104101', '141', '精听歌曲学英语-music terms in the lyrics 英文歌词里面的音乐术语', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1105, '2020-05-31 11:33:31.111823', '140', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1106, '2020-05-31 11:33:31.119202', '139', '精听歌曲学英语-Verse 1-3', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1107, '2020-05-31 11:33:31.127286', '138', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1108, '2020-05-31 11:33:31.135065', '137', '精听歌曲学英语-Lost stars (Introduction)', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1110, '2020-05-31 11:36:54.064331', '217', '职场英语必备——一歌一词一习语（初级）-职场一入深似海，困难重重似无边', 3, '', 19, 1);
INSERT INTO `django_admin_log` VALUES (1111, '2020-05-31 12:35:40.488941', '15', 'Complain object (15)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 33, 1);
INSERT INTO `django_admin_log` VALUES (1112, '2020-05-31 16:19:13.852694', '5', 'Apply object (5)', 3, '', 27, 1);
INSERT INTO `django_admin_log` VALUES (1113, '2020-05-31 16:19:57.633356', '4', '秦宇杰', 2, '[{\"changed\": {\"fields\": [\"utype\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (1114, '2020-05-31 16:39:54.084723', '8', 'Apply object (8)', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 27, 1);
INSERT INTO `django_admin_log` VALUES (1115, '2020-05-31 16:51:14.818652', '4', 'aeclub', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (1116, '2020-06-04 09:08:04.106473', '3', '学生', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (1117, '2020-06-04 09:08:15.766310', '3', 'Invite object (3)', 3, '', 37, 1);
INSERT INTO `django_admin_log` VALUES (1118, '2020-06-04 09:08:23.800789', '3', '学生', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (1119, '2020-06-04 09:09:20.350841', '6', 'Apply object (6)', 3, '', 27, 1);
INSERT INTO `django_admin_log` VALUES (1120, '2020-06-04 09:09:32.111053', '3', '学生', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (1121, '2020-06-04 09:10:42.189800', '3', '学生', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (1122, '2020-06-04 09:10:55.296184', '3', '学生', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (1123, '2020-06-04 09:11:07.704641', '3', '学生', 3, '', 9, 1);
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (3, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (27, 'app', 'apply');
INSERT INTO `django_content_type` VALUES (31, 'app', 'balance');
INSERT INTO `django_content_type` VALUES (22, 'app', 'banner');
INSERT INTO `django_content_type` VALUES (36, 'app', 'befriend');
INSERT INTO `django_content_type` VALUES (10, 'app', 'card');
INSERT INTO `django_content_type` VALUES (21, 'app', 'comment');
INSERT INTO `django_content_type` VALUES (33, 'app', 'complain');
INSERT INTO `django_content_type` VALUES (24, 'app', 'corder');
INSERT INTO `django_content_type` VALUES (20, 'app', 'detail');
INSERT INTO `django_content_type` VALUES (30, 'app', 'formid');
INSERT INTO `django_content_type` VALUES (25, 'app', 'freetime');
INSERT INTO `django_content_type` VALUES (26, 'app', 'industry');
INSERT INTO `django_content_type` VALUES (37, 'app', 'invite');
INSERT INTO `django_content_type` VALUES (11, 'app', 'list');
INSERT INTO `django_content_type` VALUES (19, 'app', 'order');
INSERT INTO `django_content_type` VALUES (39, 'app', 'platform');
INSERT INTO `django_content_type` VALUES (23, 'app', 'relation');
INSERT INTO `django_content_type` VALUES (29, 'app', 'searchtype');
INSERT INTO `django_content_type` VALUES (34, 'app', 'send');
INSERT INTO `django_content_type` VALUES (12, 'app', 'sort');
INSERT INTO `django_content_type` VALUES (18, 'app', 'subject');
INSERT INTO `django_content_type` VALUES (28, 'app', 'subtime');
INSERT INTO `django_content_type` VALUES (17, 'app', 'taccount');
INSERT INTO `django_content_type` VALUES (38, 'app', 'tchbeout');
INSERT INTO `django_content_type` VALUES (16, 'app', 'tchdetail');
INSERT INTO `django_content_type` VALUES (32, 'app', 'tchhour');
INSERT INTO `django_content_type` VALUES (13, 'app', 'teacher');
INSERT INTO `django_content_type` VALUES (15, 'app', 'uaccount');
INSERT INTO `django_content_type` VALUES (9, 'app', 'user');
INSERT INTO `django_content_type` VALUES (14, 'app', 'userdetail');
INSERT INTO `django_content_type` VALUES (35, 'app', 'video');
INSERT INTO `django_content_type` VALUES (5, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (6, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (7, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (1, 'jet', 'bookmark');
INSERT INTO `django_content_type` VALUES (2, 'jet', 'pinnedapplication');
INSERT INTO `django_content_type` VALUES (8, 'sessions', 'session');
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-08-13 11:29:35.617085');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-08-13 11:29:35.775047');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-08-13 11:29:36.114546');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-08-13 11:29:36.221172');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-08-13 11:29:36.239183');
INSERT INTO `django_migrations` VALUES (6, 'app', '0001_initial', '2019-08-13 11:29:36.289386');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2019-08-13 11:29:36.409459');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2019-08-13 11:29:36.477943');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2019-08-13 11:29:36.551175');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2019-08-13 11:29:36.561139');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2019-08-13 11:29:36.620076');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2019-08-13 11:29:36.623250');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2019-08-13 11:29:36.634062');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2019-08-13 11:29:36.716814');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2019-08-13 11:29:36.785431');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0010_alter_group_name_max_length', '2019-08-13 11:29:36.806574');
INSERT INTO `django_migrations` VALUES (18, 'jet', '0001_initial', '2019-08-13 11:29:36.966171');
INSERT INTO `django_migrations` VALUES (19, 'jet', '0002_delete_userdashboardmodule', '2019-08-13 11:29:36.999440');
INSERT INTO `django_migrations` VALUES (20, 'sessions', '0001_initial', '2019-08-13 11:29:37.075142');
INSERT INTO `django_migrations` VALUES (21, 'app', '0002_auto_20190813_1130', '2019-08-13 11:30:24.796251');
INSERT INTO `django_migrations` VALUES (22, 'app', '0003_auto_20190820_0616', '2019-08-20 06:17:03.535707');
INSERT INTO `django_migrations` VALUES (23, 'app', '0004_auto_20190820_0617', '2019-08-20 06:17:27.015084');
INSERT INTO `django_migrations` VALUES (24, 'app', '0005_auto_20190820_0617', '2019-08-20 06:17:44.170039');
INSERT INTO `django_migrations` VALUES (25, 'app', '0006_auto_20190820_0619', '2019-08-20 06:19:41.291461');
INSERT INTO `django_migrations` VALUES (26, 'app', '0007_relation', '2019-08-20 06:25:05.236218');
INSERT INTO `django_migrations` VALUES (27, 'app', '0008_auto_20190820_0759', '2019-08-20 07:59:31.375137');
INSERT INTO `django_migrations` VALUES (28, 'app', '0009_auto_20190820_0803', '2019-08-20 08:03:54.553492');
INSERT INTO `django_migrations` VALUES (29, 'app', '0002_auto_20190829_1539', '2019-08-29 15:39:32.692286');
INSERT INTO `django_migrations` VALUES (30, 'app', '0003_auto_20190831_1050', '2019-08-31 10:50:50.835673');
INSERT INTO `django_migrations` VALUES (31, 'app', '0004_auto_20190831_1307', '2019-08-31 13:07:22.320040');
INSERT INTO `django_migrations` VALUES (32, 'app', '0005_auto_20190831_1320', '2019-08-31 13:20:25.649889');
INSERT INTO `django_migrations` VALUES (33, 'app', '0006_auto_20190831_1330', '2019-08-31 13:30:24.859643');
INSERT INTO `django_migrations` VALUES (34, 'app', '0007_auto_20190831_1457', '2019-08-31 14:57:39.070465');
INSERT INTO `django_migrations` VALUES (35, 'app', '0008_card_name', '2019-08-31 15:10:54.344008');
INSERT INTO `django_migrations` VALUES (36, 'app', '0009_card_valid', '2019-08-31 15:15:18.659298');
INSERT INTO `django_migrations` VALUES (37, 'app', '0010_card_back', '2019-08-31 15:43:00.518120');
INSERT INTO `django_migrations` VALUES (39, 'app', '0011_auto_20190907_1242', '2019-09-07 16:07:29.576874');
INSERT INTO `django_migrations` VALUES (40, 'auth', '0011_update_proxy_permissions', '2019-09-07 16:07:29.610133');
INSERT INTO `django_migrations` VALUES (41, 'app', '0012_apply_cause', '2019-09-07 16:29:17.041087');
INSERT INTO `django_migrations` VALUES (42, 'app', '0013_subtime', '2019-09-14 17:07:20.991831');
INSERT INTO `django_migrations` VALUES (43, 'app', '0014_auto_20190914_2119', '2019-09-14 21:19:59.686205');
INSERT INTO `django_migrations` VALUES (44, 'app', '0015_order_time', '2019-09-15 00:58:31.640007');
INSERT INTO `django_migrations` VALUES (45, 'app', '0016_auto_20190915_0246', '2019-09-15 02:46:36.592003');
INSERT INTO `django_migrations` VALUES (46, 'app', '0017_auto_20190916_1551', '2019-09-16 15:51:46.123097');
INSERT INTO `django_migrations` VALUES (47, 'app', '0018_auto_20190916_1555', '2019-09-16 15:55:54.901064');
INSERT INTO `django_migrations` VALUES (48, 'app', '0019_auto_20190917_1506', '2019-09-17 15:06:26.238089');
INSERT INTO `django_migrations` VALUES (49, 'app', '0020_corder_have', '2019-09-22 19:45:51.099013');
INSERT INTO `django_migrations` VALUES (50, 'app', '0021_auto_20190922_1951', '2019-09-22 19:51:49.685433');
INSERT INTO `django_migrations` VALUES (51, 'app', '0022_auto_20190922_2002', '2019-09-22 20:02:58.540999');
INSERT INTO `django_migrations` VALUES (52, 'app', '0023_auto_20191005_0004', '2019-10-05 00:04:12.355475');
INSERT INTO `django_migrations` VALUES (53, 'app', '0024_order_oid', '2019-10-05 03:40:22.532834');
INSERT INTO `django_migrations` VALUES (54, 'app', '0025_auto_20191005_0345', '2019-10-05 03:45:32.863614');
INSERT INTO `django_migrations` VALUES (55, 'app', '0026_complain', '2019-10-05 08:09:04.496807');
INSERT INTO `django_migrations` VALUES (56, 'app', '0027_auto_20191005_0832', '2019-10-05 08:32:59.191533');
INSERT INTO `django_migrations` VALUES (57, 'app', '0028_auto_20191005_1324', '2019-10-05 13:24:50.297436');
INSERT INTO `django_migrations` VALUES (58, 'app', '0029_auto_20191115_1056', '2019-11-15 10:56:47.898711');
INSERT INTO `django_migrations` VALUES (59, 'app', '0030_auto_20191116_1620', '2019-11-16 16:20:47.336134');
INSERT INTO `django_migrations` VALUES (60, 'app', '0031_auto_20191119_2332', '2019-11-19 23:32:32.789854');
INSERT INTO `django_migrations` VALUES (61, 'app', '0032_auto_20191119_2335', '2019-11-19 23:35:04.468276');
INSERT INTO `django_migrations` VALUES (62, 'app', '0033_video', '2019-11-20 00:10:54.525856');
INSERT INTO `django_migrations` VALUES (63, 'app', '0034_auto_20191120_0218', '2019-11-20 02:18:34.765143');
INSERT INTO `django_migrations` VALUES (64, 'app', '0035_comment_type', '2019-11-20 02:22:12.509669');
INSERT INTO `django_migrations` VALUES (65, 'app', '0036_befriend', '2019-11-21 01:29:14.511521');
INSERT INTO `django_migrations` VALUES (66, 'app', '0037_auto_20191121_0132', '2019-11-21 01:32:21.475268');
INSERT INTO `django_migrations` VALUES (67, 'app', '0038_invite', '2019-11-24 04:34:53.951719');
INSERT INTO `django_migrations` VALUES (68, 'app', '0039_auto_20191125_0039', '2019-11-25 00:39:39.017596');
INSERT INTO `django_migrations` VALUES (69, 'app', '0040_auto_20191125_0042', '2019-11-25 00:42:16.200121');
INSERT INTO `django_migrations` VALUES (70, 'app', '0041_auto_20191125_1648', '2019-11-25 16:48:24.899622');
INSERT INTO `django_migrations` VALUES (71, 'app', '0042_auto_20191125_1707', '2019-11-25 17:07:56.876114');
INSERT INTO `django_migrations` VALUES (72, 'app', '0043_auto_20191126_1452', '2019-11-26 14:52:32.531656');
INSERT INTO `django_migrations` VALUES (73, 'app', '0044_auto_20191126_1507', '2019-11-26 15:07:36.215716');
INSERT INTO `django_migrations` VALUES (74, 'app', '0045_tchbeout_tch', '2019-11-26 15:10:32.901104');
INSERT INTO `django_migrations` VALUES (75, 'app', '0046_auto_20191126_1719', '2019-11-26 17:19:46.072448');
INSERT INTO `django_migrations` VALUES (76, 'app', '0047_auto_20191127_0153', '2019-11-27 01:57:31.243676');
INSERT INTO `django_migrations` VALUES (77, 'app', '0048_auto_20191127_0155', '2019-11-27 01:57:31.263608');
INSERT INTO `django_migrations` VALUES (78, 'app', '0049_auto_20191127_0159', '2019-11-27 02:01:21.019834');
INSERT INTO `django_migrations` VALUES (79, 'app', '0050_auto_20191128_0039', '2019-11-28 00:39:59.785894');
INSERT INTO `django_migrations` VALUES (80, 'app', '0051_auto_20191128_0042', '2019-11-28 00:42:29.051998');
INSERT INTO `django_migrations` VALUES (81, 'app', '0052_auto_20191216_1956', '2019-12-16 19:56:38.772914');
INSERT INTO `django_migrations` VALUES (82, 'app', '0053_auto_20200113_2054', '2020-01-13 20:54:56.813420');
INSERT INTO `django_migrations` VALUES (83, 'app', '0054_platform', '2020-01-14 17:43:44.778012');
INSERT INTO `django_migrations` VALUES (84, 'app', '0055_auto_20200116_1541', '2020-01-16 15:41:54.209728');
INSERT INTO `django_migrations` VALUES (85, 'app', '0056_auto_20200128_1410', '2020-01-28 14:10:40.517751');
INSERT INTO `django_migrations` VALUES (86, 'app', '0057_order_sub_time', '2020-05-31 10:27:25.394381');
INSERT INTO `django_migrations` VALUES (87, 'app', '0058_order_is_delete', '2020-05-31 10:55:53.146353');
INSERT INTO `django_migrations` VALUES (88, 'app', '0059_auto_20200531_1316', '2020-05-31 13:16:10.635278');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('1dkg9tgyd31ykvhwjlc2g1w6bibn5u84', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2020-02-01 16:26:05.919802');
INSERT INTO `django_session` VALUES ('1ec4x44rq08njg53x9d473cr53qs3a74', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-10-19 14:28:45.378978');
INSERT INTO `django_session` VALUES ('446a7nnqsxd2755lz5qvvg4kc81p3bwn', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-11-29 11:35:16.714859');
INSERT INTO `django_session` VALUES ('4p98pjtxvkp1mp1spyq0uvresogst1xz', 'YTRlZGMyNGNhMjc3MzI3MzAwOTM3YTQ2ZjdlZGE1YTMzNmI1ZmM3ODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlODVlZDljYWJkMmRiMTMxNmM4NmU4NzFkN2FhMjkyOTEyZmQ1YzcwIn0=', '2020-01-29 14:04:39.604727');
INSERT INTO `django_session` VALUES ('6dbo80dmeb5egnl2p967rvmx0eem7m80', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-09-14 14:46:50.123412');
INSERT INTO `django_session` VALUES ('6dq5rgut7ui8sqoq2cbjh1o3ve39josy', 'MTJlMWRhZTQ4ODY4OWNhNzQzMjdhNWI4ZGEzZjliMzQ2MDM1YTg0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTYyNDc1ZDNmMWU0OTllMzRjNWRkOWY0ZDNjZDc1OWRkYTk3ODAzIn0=', '2019-09-03 06:26:13.909838');
INSERT INTO `django_session` VALUES ('6neg9a7dpb8uvt1w96z4ylexdu6atlt7', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2020-01-27 16:21:12.765183');
INSERT INTO `django_session` VALUES ('6v7fc7qsi85tx5piz2nw3xuys3nuhf1j', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-09-21 11:55:14.029828');
INSERT INTO `django_session` VALUES ('c1xk3gnv0zs66zi7r8yve494gpoe1o8f', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-12-04 22:51:50.968938');
INSERT INTO `django_session` VALUES ('c9xn6h55fl1qp5uq3kyongp1jezou2mj', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2021-01-07 13:17:14.371710');
INSERT INTO `django_session` VALUES ('cqyjcltrssl6wsc86hnzq3jz7psaafrb', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-12-12 15:55:09.349339');
INSERT INTO `django_session` VALUES ('d484lg8e1euj83kt789wjzbd3n78mlox', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-11-26 14:49:30.537886');
INSERT INTO `django_session` VALUES ('eer624czm5cwloy922dvk22vcol7s1jj', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-10-19 13:29:22.866821');
INSERT INTO `django_session` VALUES ('ehh1mtug2n89nt6lhi88rg8aq7mo8bsz', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-10-06 04:54:25.756696');
INSERT INTO `django_session` VALUES ('gyjumm2svhcqos7q5d0acqqkmg0wzhg9', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2020-06-13 21:01:10.212705');
INSERT INTO `django_session` VALUES ('kpnwx0ejypllbzo8ch2xfioi4y0i4xxo', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-11-29 11:37:57.456429');
INSERT INTO `django_session` VALUES ('l0m8eus20jv1n6d9q1btnd5nv0nsgryp', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-11-12 19:37:09.900922');
INSERT INTO `django_session` VALUES ('l0xnqsb1khwq42zfwiu7r2wx0g6hiucg', 'MTJlMWRhZTQ4ODY4OWNhNzQzMjdhNWI4ZGEzZjliMzQ2MDM1YTg0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTYyNDc1ZDNmMWU0OTllMzRjNWRkOWY0ZDNjZDc1OWRkYTk3ODAzIn0=', '2019-09-12 01:28:28.395595');
INSERT INTO `django_session` VALUES ('nwgvvjlhs0wqwtcoxsipbo4cc0zvsnve', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-10-17 04:39:16.568078');
INSERT INTO `django_session` VALUES ('o6gp0iu4brejj0j8mzpkoeh9zixv4cp6', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-12-21 13:55:21.784492');
INSERT INTO `django_session` VALUES ('os137rwrgplpi7dyqpkb8dzbj4h1x2x5', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-09-14 10:51:09.687236');
INSERT INTO `django_session` VALUES ('p1t2vn1n7slp21i9lquplh9q6xqf3mno', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-12-18 15:40:44.752430');
INSERT INTO `django_session` VALUES ('q49ozpnywvkhki80eb07bvuux8zb9hqz', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2020-06-14 10:09:09.388044');
INSERT INTO `django_session` VALUES ('tj6vp8lui2bpneydmbafdg1mhumy9jwu', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2020-06-30 17:27:50.235202');
INSERT INTO `django_session` VALUES ('tprativvz2y4jgoks4ba1lmx8zn964gx', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-09-12 16:50:46.888788');
INSERT INTO `django_session` VALUES ('u25kv8s08ai2ao8yup6xgynaxn28udpx', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-12-30 19:46:18.967193');
INSERT INTO `django_session` VALUES ('vxqzi1zf48oprsgdrh6jb1vehj2o8kc4', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2020-01-24 12:18:55.875847');
INSERT INTO `django_session` VALUES ('xjsnx0u79ex1dek5cvk8czmqyx9giw3r', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2021-01-07 16:06:18.777410');
INSERT INTO `django_session` VALUES ('xzxyh18ctzuwznc3j96p6sjcx176u0vx', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2019-09-29 02:48:04.874690');
INSERT INTO `django_session` VALUES ('ysz9g6hv9yhi3vq9f90ng1dnrvwm87wx', 'ZTc4ODg1YmFjOGRmYzZmZTYyNTc5ZDA5MTUyNTliZGQ2ZGRiNTIxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWI2MzEwMmFlNTM3YjQyMTZlZmE0MTZiZmNiM2UxZjc5ZWRjNjQ3In0=', '2020-02-28 14:31:11.443434');
COMMIT;

-- ----------------------------
-- Table structure for group_Befriend
-- ----------------------------
DROP TABLE IF EXISTS `group_Befriend`;
CREATE TABLE `group_Befriend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `parnter` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_Befriend
-- ----------------------------
BEGIN;
INSERT INTO `group_Befriend` VALUES (28, 3, 4, 3);
INSERT INTO `group_Befriend` VALUES (29, 4, 3, 2);
INSERT INTO `group_Befriend` VALUES (30, 3, 4, 2);
INSERT INTO `group_Befriend` VALUES (31, 4, 4, 2);
INSERT INTO `group_Befriend` VALUES (32, 3, 3, 2);
INSERT INTO `group_Befriend` VALUES (33, 12, 3, 2);
INSERT INTO `group_Befriend` VALUES (34, 3, 12, 2);
COMMIT;

-- ----------------------------
-- Table structure for group_Complain
-- ----------------------------
DROP TABLE IF EXISTS `group_Complain`;
CREATE TABLE `group_Complain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `label` int(11) DEFAULT NULL,
  `content` longtext,
  `user_id` int(11) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_Complain_user_id_9e215a0f_fk_group_user_id` (`user_id`),
  CONSTRAINT `group_Complain_user_id_9e215a0f_fk_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `group_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_Complain
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for group_Invite
-- ----------------------------
DROP TABLE IF EXISTS `group_Invite`;
CREATE TABLE `group_Invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `parnter_id` int(11) DEFAULT NULL,
  `task1` tinyint(1) NOT NULL,
  `task2` tinyint(1) NOT NULL,
  `task3` tinyint(1) NOT NULL,
  `task1_type` int(11) NOT NULL,
  `task2_type` int(11) NOT NULL,
  `task3_type` int(11) NOT NULL,
  `fee` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_Invite_parnter_843dfc85_uniq` (`parnter_id`),
  KEY `group_Invite_parnter_id_1752d4a2` (`parnter_id`),
  CONSTRAINT `group_Invite_parnter_id_1752d4a2_fk_group_user_id` FOREIGN KEY (`parnter_id`) REFERENCES `group_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_Invite
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for group_Platform
-- ----------------------------
DROP TABLE IF EXISTS `group_Platform`;
CREATE TABLE `group_Platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `brief` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_Platform
-- ----------------------------
BEGIN;
INSERT INTO `group_Platform` VALUES (2, 'hello', '652552545.jpg', 'hello,hello', '13456888141');
COMMIT;

-- ----------------------------
-- Table structure for group_SearchType
-- ----------------------------
DROP TABLE IF EXISTS `group_SearchType`;
CREATE TABLE `group_SearchType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `ord_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_SearchType_ord_id_dbfcf2f7_fk_group_order_id` (`ord_id`),
  CONSTRAINT `group_SearchType_ord_id_dbfcf2f7_fk_group_order_id` FOREIGN KEY (`ord_id`) REFERENCES `group_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_SearchType
-- ----------------------------
BEGIN;
INSERT INTO `group_SearchType` VALUES (28, 1, 'True', 141);
INSERT INTO `group_SearchType` VALUES (29, 2, '1', 141);
INSERT INTO `group_SearchType` VALUES (30, 3, '19-30', 141);
INSERT INTO `group_SearchType` VALUES (31, 1, 'False', 142);
INSERT INTO `group_SearchType` VALUES (32, 2, '1', 142);
INSERT INTO `group_SearchType` VALUES (33, 3, '19-30', 142);
INSERT INTO `group_SearchType` VALUES (34, 1, 'True', 149);
INSERT INTO `group_SearchType` VALUES (35, 2, '3', 149);
INSERT INTO `group_SearchType` VALUES (36, 3, '19-30', 149);
INSERT INTO `group_SearchType` VALUES (37, 1, 'True', 168);
INSERT INTO `group_SearchType` VALUES (38, 2, '3', 168);
INSERT INTO `group_SearchType` VALUES (39, 3, '19-30', 168);
INSERT INTO `group_SearchType` VALUES (40, 1, 'True', 185);
INSERT INTO `group_SearchType` VALUES (41, 2, '1', 185);
INSERT INTO `group_SearchType` VALUES (42, 3, '19-30', 185);
INSERT INTO `group_SearchType` VALUES (43, 1, 'True', 189);
INSERT INTO `group_SearchType` VALUES (44, 2, '1', 189);
INSERT INTO `group_SearchType` VALUES (45, 3, '0-18', 189);
INSERT INTO `group_SearchType` VALUES (46, 1, 'True', 190);
INSERT INTO `group_SearchType` VALUES (47, 2, '1', 190);
INSERT INTO `group_SearchType` VALUES (48, 3, '0-18', 190);
INSERT INTO `group_SearchType` VALUES (49, 1, 'True', 219);
INSERT INTO `group_SearchType` VALUES (50, 2, '1', 219);
INSERT INTO `group_SearchType` VALUES (51, 3, '31-40', 219);
COMMIT;

-- ----------------------------
-- Table structure for group_Send
-- ----------------------------
DROP TABLE IF EXISTS `group_Send`;
CREATE TABLE `group_Send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `send` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_Send
-- ----------------------------
BEGIN;
INSERT INTO `group_Send` VALUES (7, 128, 4, 3);
INSERT INTO `group_Send` VALUES (8, 133, 4, 3);
INSERT INTO `group_Send` VALUES (9, 144, 4, 3);
INSERT INTO `group_Send` VALUES (10, 175, 3, 3);
INSERT INTO `group_Send` VALUES (11, 176, 3, 3);
INSERT INTO `group_Send` VALUES (12, 176, 3, 18);
INSERT INTO `group_Send` VALUES (13, 176, 3, 19);
INSERT INTO `group_Send` VALUES (14, 174, 3, 3);
INSERT INTO `group_Send` VALUES (15, 182, 4, 4);
INSERT INTO `group_Send` VALUES (16, 182, 4, 6);
INSERT INTO `group_Send` VALUES (17, 182, 4, 9);
INSERT INTO `group_Send` VALUES (18, 182, 4, 13);
INSERT INTO `group_Send` VALUES (19, 182, 4, 23);
INSERT INTO `group_Send` VALUES (20, 182, 4, 3);
INSERT INTO `group_Send` VALUES (21, 193, 4, 3);
INSERT INTO `group_Send` VALUES (22, 193, 4, 4);
INSERT INTO `group_Send` VALUES (23, 194, 4, 4);
INSERT INTO `group_Send` VALUES (24, 195, 4, 4);
INSERT INTO `group_Send` VALUES (25, 196, 4, 4);
INSERT INTO `group_Send` VALUES (26, 197, 4, 4);
INSERT INTO `group_Send` VALUES (27, 198, 4, 4);
INSERT INTO `group_Send` VALUES (28, 199, 4, 4);
INSERT INTO `group_Send` VALUES (29, 200, 4, 4);
INSERT INTO `group_Send` VALUES (30, 201, 4, 4);
INSERT INTO `group_Send` VALUES (31, 202, 4, 4);
INSERT INTO `group_Send` VALUES (32, 203, 4, 4);
INSERT INTO `group_Send` VALUES (33, 204, 4, 4);
INSERT INTO `group_Send` VALUES (34, 205, 4, 4);
INSERT INTO `group_Send` VALUES (35, 206, 4, 4);
INSERT INTO `group_Send` VALUES (36, 207, 4, 4);
INSERT INTO `group_Send` VALUES (37, 200, 4, 13);
INSERT INTO `group_Send` VALUES (38, 200, 4, 9);
INSERT INTO `group_Send` VALUES (39, 200, 4, 6);
INSERT INTO `group_Send` VALUES (40, 200, 4, 23);
INSERT INTO `group_Send` VALUES (41, 200, 4, 3);
INSERT INTO `group_Send` VALUES (42, 213, 3, 4);
COMMIT;

-- ----------------------------
-- Table structure for group_SubTime
-- ----------------------------
DROP TABLE IF EXISTS `group_SubTime`;
CREATE TABLE `group_SubTime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` time(6) NOT NULL,
  `end` time(6) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_SubTime
-- ----------------------------
BEGIN;
INSERT INTO `group_SubTime` VALUES (1, '08:00:00.000000', '00:00:00.000000', 60);
COMMIT;

-- ----------------------------
-- Table structure for group_TchHour
-- ----------------------------
DROP TABLE IF EXISTS `group_TchHour`;
CREATE TABLE `group_TchHour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tch` int(11) NOT NULL,
  `num` decimal(11,1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_TchHour
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for group_TchbeOut
-- ----------------------------
DROP TABLE IF EXISTS `group_TchbeOut`;
CREATE TABLE `group_TchbeOut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kes` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `reason` longtext,
  `tch_id` int(11) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_TchbeOut_tch_id_b45af540_fk_group_user_id` (`tch_id`),
  CONSTRAINT `group_TchbeOut_tch_id_b45af540_fk_group_user_id` FOREIGN KEY (`tch_id`) REFERENCES `group_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_TchbeOut
-- ----------------------------
BEGIN;
INSERT INTO `group_TchbeOut` VALUES (1, 65, 1, NULL, 4, '2019-11-26 17:19:45.990344');
INSERT INTO `group_TchbeOut` VALUES (2, 6, 2, 'buzho', 4, '2019-11-28 17:17:30.121869');
INSERT INTO `group_TchbeOut` VALUES (3, 5, 0, NULL, 4, '2020-01-10 11:59:03.548759');
INSERT INTO `group_TchbeOut` VALUES (4, 15, 1, NULL, 4, '2020-01-14 16:46:54.303243');
INSERT INTO `group_TchbeOut` VALUES (5, 27, 0, NULL, 4, '2020-05-30 21:13:58.385393');
COMMIT;

-- ----------------------------
-- Table structure for group_Video
-- ----------------------------
DROP TABLE IF EXISTS `group_Video`;
CREATE TABLE `group_Video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_Video
-- ----------------------------
BEGIN;
INSERT INTO `group_Video` VALUES (1, '争棋_2019-11-11_00.12.31.mp4');
COMMIT;

-- ----------------------------
-- Table structure for group_apply
-- ----------------------------
DROP TABLE IF EXISTS `group_apply`;
CREATE TABLE `group_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cause` varchar(200) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `acert` varchar(200) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `content` longtext,
  `edu` int(11) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `tcert` int(11) DEFAULT NULL,
  `voice` varchar(200) DEFAULT NULL,
  `wsk` int(11),
  PRIMARY KEY (`id`),
  KEY `group_apply_user_id_30011686_fk_group_user_id` (`user_id`),
  CONSTRAINT `group_apply_user_id_30011686_fk_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `group_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_apply
-- ----------------------------
BEGIN;
INSERT INTO `group_apply` VALUES (7, 2, 12, NULL, '2020-01-18 16:38:55.537459', 'image/Flq3E_20C-1me6QcOLuu5rQEk8Tf.jpg', 'hz', 'hellohelo', 5, 'hzxl.zhu@gmail.com', 'zhu', '13456888141', 'image/FimnPb3WC7envrcja-vyx-n5gUf0.jpg', 1, 0, 'image/FrhQbcH26gLyTjZquWvXm1TxZpfc.mp3', 4);
INSERT INTO `group_apply` VALUES (8, 2, 4, NULL, '2020-05-31 16:22:36.132796', 'image/FqFNI8I0XXWHjHzhiaqUuOyOSQiS.jpeg', '杭州', '我是一个特别喜欢英语的老师，曾经出国留学4年多，能保证正常交流，希望我把我的歇息才打开手机才看到路上从 成都市从上档次看德川家康的好处跨境电商查看从打开市场跨境电商', 4, '11@zhengqi1995.com', 'aeclub', '1826881324', 'image/FqFNI8I0XXWHjHzhiaqUuOyOSQiS.jpeg', 1, 0, 'image/FlQySxFnnd5SjMRmkj3Uhi7WBG44.mp3', 3);
COMMIT;

-- ----------------------------
-- Table structure for group_balance
-- ----------------------------
DROP TABLE IF EXISTS `group_balance`;
CREATE TABLE `group_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `num` decimal(11,1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_balance
-- ----------------------------
BEGIN;
INSERT INTO `group_balance` VALUES (6, 3, 10.0);
INSERT INTO `group_balance` VALUES (7, 3, -1.5);
INSERT INTO `group_balance` VALUES (8, 3, -1.0);
INSERT INTO `group_balance` VALUES (9, 3, -1.5);
INSERT INTO `group_balance` VALUES (10, 3, -1.5);
INSERT INTO `group_balance` VALUES (11, 3, -1.5);
INSERT INTO `group_balance` VALUES (12, 3, -1.5);
INSERT INTO `group_balance` VALUES (13, 3, -1.5);
INSERT INTO `group_balance` VALUES (14, 3, 10.0);
INSERT INTO `group_balance` VALUES (15, 3, -1.5);
INSERT INTO `group_balance` VALUES (16, 3, -1.5);
INSERT INTO `group_balance` VALUES (17, 3, -1.5);
INSERT INTO `group_balance` VALUES (18, 3, -1.5);
INSERT INTO `group_balance` VALUES (19, 3, -1.5);
INSERT INTO `group_balance` VALUES (20, 3, -1.5);
INSERT INTO `group_balance` VALUES (21, 3, -1.0);
INSERT INTO `group_balance` VALUES (22, 3, 50.0);
INSERT INTO `group_balance` VALUES (23, 3, -1.5);
INSERT INTO `group_balance` VALUES (24, 3, 1.5);
INSERT INTO `group_balance` VALUES (25, 3, 1.5);
INSERT INTO `group_balance` VALUES (26, 3, 1.5);
INSERT INTO `group_balance` VALUES (27, 3, 1.5);
INSERT INTO `group_balance` VALUES (28, 3, 1.5);
INSERT INTO `group_balance` VALUES (29, 3, 1.5);
INSERT INTO `group_balance` VALUES (30, 3, 1.5);
INSERT INTO `group_balance` VALUES (31, 3, 1.5);
INSERT INTO `group_balance` VALUES (32, 3, 1.5);
INSERT INTO `group_balance` VALUES (33, 3, 1.5);
INSERT INTO `group_balance` VALUES (34, 3, 1.5);
INSERT INTO `group_balance` VALUES (35, 3, 1.5);
INSERT INTO `group_balance` VALUES (36, 3, 1.5);
INSERT INTO `group_balance` VALUES (37, 3, 1.5);
INSERT INTO `group_balance` VALUES (38, 3, 1.5);
INSERT INTO `group_balance` VALUES (39, 3, 1.5);
INSERT INTO `group_balance` VALUES (40, 3, 1.5);
INSERT INTO `group_balance` VALUES (41, 3, 1.0);
INSERT INTO `group_balance` VALUES (42, 3, 1.5);
INSERT INTO `group_balance` VALUES (43, 3, 1.0);
INSERT INTO `group_balance` VALUES (44, 3, 1.0);
INSERT INTO `group_balance` VALUES (45, 3, 1.0);
INSERT INTO `group_balance` VALUES (46, 3, 1.0);
INSERT INTO `group_balance` VALUES (47, 3, 1.0);
INSERT INTO `group_balance` VALUES (48, 3, 1.0);
INSERT INTO `group_balance` VALUES (49, 3, 1.0);
INSERT INTO `group_balance` VALUES (51, 3, 1.0);
INSERT INTO `group_balance` VALUES (52, 3, 1.0);
INSERT INTO `group_balance` VALUES (53, 3, 1.0);
INSERT INTO `group_balance` VALUES (59, 3, 1.0);
INSERT INTO `group_balance` VALUES (60, 3, 1.0);
INSERT INTO `group_balance` VALUES (61, 3, 1.0);
INSERT INTO `group_balance` VALUES (62, 3, 1.0);
INSERT INTO `group_balance` VALUES (63, 3, 1.0);
INSERT INTO `group_balance` VALUES (64, 3, 1.0);
INSERT INTO `group_balance` VALUES (65, 3, 1.0);
INSERT INTO `group_balance` VALUES (66, 3, 1.0);
INSERT INTO `group_balance` VALUES (67, 3, 1.0);
INSERT INTO `group_balance` VALUES (68, 3, 1.0);
INSERT INTO `group_balance` VALUES (69, 3, 1.0);
INSERT INTO `group_balance` VALUES (70, 3, 1.0);
INSERT INTO `group_balance` VALUES (71, 3, 1.0);
INSERT INTO `group_balance` VALUES (72, 3, 1.0);
INSERT INTO `group_balance` VALUES (73, 3, 1.0);
INSERT INTO `group_balance` VALUES (74, 3, 1.0);
INSERT INTO `group_balance` VALUES (75, 3, 1.0);
INSERT INTO `group_balance` VALUES (76, 3, 1.0);
INSERT INTO `group_balance` VALUES (77, 3, 1.0);
INSERT INTO `group_balance` VALUES (78, 3, 1.0);
INSERT INTO `group_balance` VALUES (79, 3, 1.0);
INSERT INTO `group_balance` VALUES (80, 3, 1.0);
INSERT INTO `group_balance` VALUES (81, 3, 1.0);
INSERT INTO `group_balance` VALUES (82, 3, 1.0);
INSERT INTO `group_balance` VALUES (83, 3, 1.0);
INSERT INTO `group_balance` VALUES (84, 3, 1.0);
INSERT INTO `group_balance` VALUES (85, 3, 1.0);
INSERT INTO `group_balance` VALUES (86, 3, 1.0);
INSERT INTO `group_balance` VALUES (87, 3, 1.5);
INSERT INTO `group_balance` VALUES (88, 3, 1.5);
INSERT INTO `group_balance` VALUES (89, 3, 1.5);
INSERT INTO `group_balance` VALUES (90, 3, 1.0);
INSERT INTO `group_balance` VALUES (91, 3, 1.0);
INSERT INTO `group_balance` VALUES (92, 3, 1.0);
INSERT INTO `group_balance` VALUES (93, 3, 1.0);
INSERT INTO `group_balance` VALUES (94, 3, 1.5);
INSERT INTO `group_balance` VALUES (95, 4, 10.0);
INSERT INTO `group_balance` VALUES (96, 4, 1.0);
INSERT INTO `group_balance` VALUES (97, 4, 1.0);
INSERT INTO `group_balance` VALUES (98, 4, 1.0);
INSERT INTO `group_balance` VALUES (99, 4, 1.0);
INSERT INTO `group_balance` VALUES (100, 4, 1.0);
INSERT INTO `group_balance` VALUES (101, 4, 1.0);
INSERT INTO `group_balance` VALUES (102, 4, 1.0);
INSERT INTO `group_balance` VALUES (103, 4, 1.0);
INSERT INTO `group_balance` VALUES (104, 4, 1.0);
INSERT INTO `group_balance` VALUES (105, 4, 10.0);
INSERT INTO `group_balance` VALUES (106, 4, 10.0);
INSERT INTO `group_balance` VALUES (107, 4, 10.0);
INSERT INTO `group_balance` VALUES (108, 4, 1.5);
INSERT INTO `group_balance` VALUES (109, 4, 1.0);
INSERT INTO `group_balance` VALUES (110, 4, 1.0);
INSERT INTO `group_balance` VALUES (111, 4, 1.0);
INSERT INTO `group_balance` VALUES (112, 4, 1.5);
INSERT INTO `group_balance` VALUES (113, 4, 1.5);
INSERT INTO `group_balance` VALUES (114, 4, 1.5);
INSERT INTO `group_balance` VALUES (115, 4, 1.5);
INSERT INTO `group_balance` VALUES (116, 4, 1.5);
INSERT INTO `group_balance` VALUES (117, 4, 1.5);
INSERT INTO `group_balance` VALUES (118, 4, 1.5);
INSERT INTO `group_balance` VALUES (119, 4, 1.5);
INSERT INTO `group_balance` VALUES (120, 4, 1.5);
INSERT INTO `group_balance` VALUES (121, 4, 1.5);
INSERT INTO `group_balance` VALUES (122, 4, 1.5);
INSERT INTO `group_balance` VALUES (123, 4, 1.5);
INSERT INTO `group_balance` VALUES (124, 4, 1.5);
INSERT INTO `group_balance` VALUES (125, 4, 2.2);
INSERT INTO `group_balance` VALUES (126, 4, 2.2);
INSERT INTO `group_balance` VALUES (127, 4, 1.5);
INSERT INTO `group_balance` VALUES (128, 4, 2.2);
INSERT INTO `group_balance` VALUES (129, 4, 2.2);
INSERT INTO `group_balance` VALUES (130, 4, 2.2);
INSERT INTO `group_balance` VALUES (131, 4, 2.2);
INSERT INTO `group_balance` VALUES (132, 4, 2.2);
INSERT INTO `group_balance` VALUES (133, 4, 1.0);
INSERT INTO `group_balance` VALUES (134, 4, 1.0);
INSERT INTO `group_balance` VALUES (135, 4, 10.0);
INSERT INTO `group_balance` VALUES (136, 4, 1.0);
INSERT INTO `group_balance` VALUES (137, 4, 1.0);
INSERT INTO `group_balance` VALUES (138, 4, 1.0);
INSERT INTO `group_balance` VALUES (139, 4, 1.0);
INSERT INTO `group_balance` VALUES (140, 4, 1.0);
INSERT INTO `group_balance` VALUES (141, 4, 1.0);
INSERT INTO `group_balance` VALUES (142, 4, 1.0);
INSERT INTO `group_balance` VALUES (143, 4, 1.0);
INSERT INTO `group_balance` VALUES (144, 4, 1.0);
INSERT INTO `group_balance` VALUES (145, 4, 1.0);
INSERT INTO `group_balance` VALUES (146, 4, 50.0);
INSERT INTO `group_balance` VALUES (147, 4, 1.5);
INSERT INTO `group_balance` VALUES (148, 4, 1.5);
INSERT INTO `group_balance` VALUES (149, 4, 1.5);
INSERT INTO `group_balance` VALUES (150, 4, 1.5);
INSERT INTO `group_balance` VALUES (151, 4, 1.5);
INSERT INTO `group_balance` VALUES (152, 3, 2.2);
INSERT INTO `group_balance` VALUES (153, 3, 2.2);
INSERT INTO `group_balance` VALUES (154, 4, 1.5);
INSERT INTO `group_balance` VALUES (155, 4, 1.0);
INSERT INTO `group_balance` VALUES (156, 4, 1.0);
INSERT INTO `group_balance` VALUES (157, 4, 1.0);
INSERT INTO `group_balance` VALUES (158, 4, 1.5);
INSERT INTO `group_balance` VALUES (159, 4, 1.0);
INSERT INTO `group_balance` VALUES (160, 4, 1.0);
INSERT INTO `group_balance` VALUES (161, 3, 1.0);
INSERT INTO `group_balance` VALUES (162, 4, 1.0);
INSERT INTO `group_balance` VALUES (163, 3, 1.0);
INSERT INTO `group_balance` VALUES (164, 4, 1.0);
INSERT INTO `group_balance` VALUES (165, 4, 1.0);
INSERT INTO `group_balance` VALUES (166, 4, 1.0);
INSERT INTO `group_balance` VALUES (167, 3, 1.0);
INSERT INTO `group_balance` VALUES (168, 4, 1.5);
INSERT INTO `group_balance` VALUES (169, 3, 2.2);
INSERT INTO `group_balance` VALUES (170, 3, 1.5);
INSERT INTO `group_balance` VALUES (171, 3, 2.2);
INSERT INTO `group_balance` VALUES (172, 3, 10.0);
INSERT INTO `group_balance` VALUES (173, 4, 1.0);
INSERT INTO `group_balance` VALUES (174, 4, 1.0);
INSERT INTO `group_balance` VALUES (175, 4, 1.0);
INSERT INTO `group_balance` VALUES (176, 4, 1.0);
INSERT INTO `group_balance` VALUES (177, 4, 1.0);
INSERT INTO `group_balance` VALUES (178, 4, 1.0);
INSERT INTO `group_balance` VALUES (179, 4, 1.0);
INSERT INTO `group_balance` VALUES (180, 4, 1.0);
INSERT INTO `group_balance` VALUES (181, 4, 1.0);
INSERT INTO `group_balance` VALUES (182, 4, 1.0);
INSERT INTO `group_balance` VALUES (183, 4, 1.0);
INSERT INTO `group_balance` VALUES (184, 4, 1.0);
INSERT INTO `group_balance` VALUES (185, 4, 1.0);
INSERT INTO `group_balance` VALUES (186, 4, 1.0);
INSERT INTO `group_balance` VALUES (187, 4, 1.0);
INSERT INTO `group_balance` VALUES (188, 3, 1.0);
INSERT INTO `group_balance` VALUES (189, 4, 1.0);
INSERT INTO `group_balance` VALUES (190, 3, 1.0);
INSERT INTO `group_balance` VALUES (191, 3, 1.0);
INSERT INTO `group_balance` VALUES (192, 3, 1.0);
INSERT INTO `group_balance` VALUES (193, 3, 1.0);
INSERT INTO `group_balance` VALUES (194, 3, 1.0);
INSERT INTO `group_balance` VALUES (195, 4, 1.0);
INSERT INTO `group_balance` VALUES (196, 3, 1.0);
INSERT INTO `group_balance` VALUES (197, 3, 1.0);
INSERT INTO `group_balance` VALUES (198, 3, 1.0);
INSERT INTO `group_balance` VALUES (199, 3, 1.0);
INSERT INTO `group_balance` VALUES (200, 4, 1.0);
INSERT INTO `group_balance` VALUES (201, 3, 1.0);
INSERT INTO `group_balance` VALUES (202, 4, 1.0);
INSERT INTO `group_balance` VALUES (203, 3, 1.5);
INSERT INTO `group_balance` VALUES (204, 3, 1.5);
INSERT INTO `group_balance` VALUES (205, 3, 1.5);
INSERT INTO `group_balance` VALUES (206, 3, 1.5);
INSERT INTO `group_balance` VALUES (207, 3, 1.5);
INSERT INTO `group_balance` VALUES (208, 3, 1.5);
INSERT INTO `group_balance` VALUES (209, 3, 1.5);
INSERT INTO `group_balance` VALUES (210, 3, 1.5);
INSERT INTO `group_balance` VALUES (211, 3, 1.5);
INSERT INTO `group_balance` VALUES (212, 3, 2.2);
INSERT INTO `group_balance` VALUES (213, 3, 2.2);
INSERT INTO `group_balance` VALUES (214, 3, 1.5);
INSERT INTO `group_balance` VALUES (215, 3, 2.2);
INSERT INTO `group_balance` VALUES (216, 4, 1.5);
INSERT INTO `group_balance` VALUES (217, 4, 1.0);
INSERT INTO `group_balance` VALUES (218, 4, 1.0);
INSERT INTO `group_balance` VALUES (219, 4, 1.5);
INSERT INTO `group_balance` VALUES (220, 4, 1.0);
INSERT INTO `group_balance` VALUES (221, 4, 0.8);
INSERT INTO `group_balance` VALUES (222, 4, 1.0);
INSERT INTO `group_balance` VALUES (223, 4, 1.0);
INSERT INTO `group_balance` VALUES (224, 4, 1.0);
INSERT INTO `group_balance` VALUES (225, 4, 1.0);
INSERT INTO `group_balance` VALUES (226, 4, 1.0);
INSERT INTO `group_balance` VALUES (227, 4, 1.0);
INSERT INTO `group_balance` VALUES (228, 4, 1.5);
INSERT INTO `group_balance` VALUES (229, 4, 1.0);
INSERT INTO `group_balance` VALUES (230, 4, 1.5);
INSERT INTO `group_balance` VALUES (231, 4, 1.5);
INSERT INTO `group_balance` VALUES (232, 4, 1.5);
INSERT INTO `group_balance` VALUES (233, 4, 1.5);
INSERT INTO `group_balance` VALUES (234, 4, 1.5);
INSERT INTO `group_balance` VALUES (235, 4, 1.5);
INSERT INTO `group_balance` VALUES (236, 4, 1.5);
INSERT INTO `group_balance` VALUES (237, 4, 1.5);
INSERT INTO `group_balance` VALUES (238, 4, 1.0);
INSERT INTO `group_balance` VALUES (239, 4, 1.0);
INSERT INTO `group_balance` VALUES (240, 4, 1.5);
INSERT INTO `group_balance` VALUES (241, 4, 1.0);
INSERT INTO `group_balance` VALUES (242, 4, 1.0);
INSERT INTO `group_balance` VALUES (243, 4, 1.5);
INSERT INTO `group_balance` VALUES (244, 4, 1.5);
INSERT INTO `group_balance` VALUES (245, 4, 1.5);
INSERT INTO `group_balance` VALUES (246, 4, 1.5);
INSERT INTO `group_balance` VALUES (247, 4, 1.5);
INSERT INTO `group_balance` VALUES (248, 4, 1.5);
INSERT INTO `group_balance` VALUES (249, 4, 1.5);
INSERT INTO `group_balance` VALUES (250, 4, 1.5);
INSERT INTO `group_balance` VALUES (251, 4, 1.5);
INSERT INTO `group_balance` VALUES (252, 4, 1.5);
INSERT INTO `group_balance` VALUES (253, 4, 1.5);
INSERT INTO `group_balance` VALUES (254, 4, 1.5);
INSERT INTO `group_balance` VALUES (255, 4, 1.5);
INSERT INTO `group_balance` VALUES (256, 4, 1.5);
INSERT INTO `group_balance` VALUES (257, 4, 1.5);
INSERT INTO `group_balance` VALUES (258, 4, 1.5);
INSERT INTO `group_balance` VALUES (259, 4, 1.5);
INSERT INTO `group_balance` VALUES (260, 12, 1.0);
INSERT INTO `group_balance` VALUES (261, 12, 1.0);
INSERT INTO `group_balance` VALUES (262, 12, 1.0);
INSERT INTO `group_balance` VALUES (263, 3, 1.0);
INSERT INTO `group_balance` VALUES (264, 3, 1.0);
INSERT INTO `group_balance` VALUES (265, 3, 1.5);
INSERT INTO `group_balance` VALUES (266, 12, 10.0);
INSERT INTO `group_balance` VALUES (267, 12, 0.8);
INSERT INTO `group_balance` VALUES (268, 4, 1.0);
INSERT INTO `group_balance` VALUES (269, 4, 1.0);
INSERT INTO `group_balance` VALUES (270, 4, 10.0);
INSERT INTO `group_balance` VALUES (271, 4, 1.0);
INSERT INTO `group_balance` VALUES (272, 4, 1.0);
INSERT INTO `group_balance` VALUES (273, 4, 1.0);
INSERT INTO `group_balance` VALUES (274, 4, 1.0);
INSERT INTO `group_balance` VALUES (275, 4, 1.0);
INSERT INTO `group_balance` VALUES (276, 4, 1.0);
INSERT INTO `group_balance` VALUES (277, 4, 50.0);
INSERT INTO `group_balance` VALUES (278, 4, 10.0);
INSERT INTO `group_balance` VALUES (279, 3, 1.0);
INSERT INTO `group_balance` VALUES (280, 4, 1.0);
INSERT INTO `group_balance` VALUES (281, 3, 1.0);
INSERT INTO `group_balance` VALUES (282, 3, 1.0);
INSERT INTO `group_balance` VALUES (283, 4, 1.0);
INSERT INTO `group_balance` VALUES (284, 4, 1.0);
INSERT INTO `group_balance` VALUES (285, 4, 1.0);
INSERT INTO `group_balance` VALUES (286, 55, 10.0);
INSERT INTO `group_balance` VALUES (287, 4, 1.0);
INSERT INTO `group_balance` VALUES (288, 4, 1.0);
INSERT INTO `group_balance` VALUES (289, 4, 1.0);
INSERT INTO `group_balance` VALUES (290, 4, 1.0);
COMMIT;

-- ----------------------------
-- Table structure for group_banner
-- ----------------------------
DROP TABLE IF EXISTS `group_banner`;
CREATE TABLE `group_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `sub_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_banner_sub_id_9cabbc93_fk_group_subject_id` (`sub_id`),
  CONSTRAINT `group_banner_sub_id_9cabbc93_fk_group_subject_id` FOREIGN KEY (`sub_id`) REFERENCES `group_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_banner
-- ----------------------------
BEGIN;
INSERT INTO `group_banner` VALUES (2, '461D518C088AAECC7035CACB95B5737E_NPFYMYP.jpg', 1);
INSERT INTO `group_banner` VALUES (3, 'banner12x.png', 1);
COMMIT;

-- ----------------------------
-- Table structure for group_card
-- ----------------------------
DROP TABLE IF EXISTS `group_card`;
CREATE TABLE `group_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `price` decimal(8,1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(200) NOT NULL,
  `valid` int(11) NOT NULL,
  `back` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_card
-- ----------------------------
BEGIN;
INSERT INTO `group_card` VALUES (2, 10, 500.0, '2019-08-31 15:16:22.881111', '普通会员卡', 2, '会员卡背景32x.png');
INSERT INTO `group_card` VALUES (3, 50, 2000.0, '2019-08-31 15:17:03.128984', '超值会员', 10, '会员卡背景2x.png');
COMMIT;

-- ----------------------------
-- Table structure for group_card_order
-- ----------------------------
DROP TABLE IF EXISTS `group_card_order`;
CREATE TABLE `group_card_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(20) NOT NULL,
  `tradeNo` varchar(20) DEFAULT NULL,
  `payNoti` smallint(6) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `fee` decimal(11,2) NOT NULL,
  `status` smallint(6) NOT NULL,
  `payTime` datetime(6) NOT NULL,
  `card_id` int(11) DEFAULT NULL,
  `have` decimal(11,1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tradeNo` (`tradeNo`),
  KEY `group_card_order_card_id_a5189ecc_fk_group_card_id` (`card_id`),
  CONSTRAINT `group_card_order_card_id_a5189ecc_fk_group_card_id` FOREIGN KEY (`card_id`) REFERENCES `group_card` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_card_order
-- ----------------------------
BEGIN;
INSERT INTO `group_card_order` VALUES (24, 'XQPCSsLpI0cb', '1909220003139', 0, 3, 0.01, 2, '2019-09-22 19:46:05.670912', 2, 0.0);
INSERT INTO `group_card_order` VALUES (25, 'RlOtVFn8h6DC', '1909220003571', 0, 3, 0.01, 2, '2019-09-22 20:18:26.290760', 3, 0.0);
INSERT INTO `group_card_order` VALUES (26, 'Bmi7gqXZNovK', '1910300004467', 0, 4, 0.01, 2, '2019-10-30 16:13:59.312554', 2, 0.0);
INSERT INTO `group_card_order` VALUES (27, 'vI3w6NHnmP4W', '1910300004689', 0, 4, 0.01, 2, '2019-10-30 19:45:10.997011', 2, 0.0);
INSERT INTO `group_card_order` VALUES (28, 'zREPawU1xpNd', '1910300004293', 0, 4, 0.01, 2, '2019-10-30 19:52:44.208370', 2, 0.0);
INSERT INTO `group_card_order` VALUES (29, 'CXsiJdPSr8Zo', '1910300004425', 0, 4, 0.01, 2, '2019-10-30 20:17:36.387809', 2, 0.0);
INSERT INTO `group_card_order` VALUES (30, '6Tt19g8drOaY', '1910300004827', 0, 4, 0.01, 0, '2019-10-30 20:18:59.535736', 2, 10.0);
INSERT INTO `group_card_order` VALUES (31, 'OFajix3mcDtP', '1911170004352', 0, 4, 0.01, 2, '2019-11-17 03:40:51.507391', 2, 0.0);
INSERT INTO `group_card_order` VALUES (32, 'mnH1BFl93jNv', '1911180004431', 0, 4, 0.01, 2, '2019-11-18 00:15:11.134544', 3, 0.0);
INSERT INTO `group_card_order` VALUES (36, 'kuEgfIYlxOWp', NULL, 0, 3, 0.00, 2, '2019-11-28 15:59:27.111387', NULL, 0.0);
INSERT INTO `group_card_order` VALUES (37, 'aWYfF09N2Jlk', '1911280003490', 0, 3, 500.00, 0, '2019-11-28 17:45:26.141441', 2, 10.0);
INSERT INTO `group_card_order` VALUES (38, 'IfY6S4jkRqDt', '1911280003089', 0, 3, 0.01, 1, '2019-11-28 17:46:27.150637', 2, 5.1);
INSERT INTO `group_card_order` VALUES (39, 'p9REUXwGxgbi', '1911280006319', 0, 6, 500.00, 0, '2019-11-28 20:41:36.933929', 2, 10.0);
INSERT INTO `group_card_order` VALUES (40, 'vGzRYrm0KVbt', '1911280004851', 0, 4, 500.00, 0, '2019-11-28 21:04:43.192541', 2, 10.0);
INSERT INTO `group_card_order` VALUES (41, 'ugtnW9ZmjP7V', '1911290009260', 0, 9, 500.00, 0, '2019-11-29 09:33:47.250995', 2, 10.0);
INSERT INTO `group_card_order` VALUES (42, 'kxa4f6W5XFbU', '1912160013538', 0, 13, 500.00, 0, '2019-12-16 20:06:34.084192', 2, 10.0);
INSERT INTO `group_card_order` VALUES (43, '3Sju5gkNdwMX', '1912160006430', 0, 6, 500.00, 0, '2019-12-16 20:29:52.807626', 2, 10.0);
INSERT INTO `group_card_order` VALUES (44, 'LfITOHgalbed', '2001140004132', 0, 4, 500.00, 0, '2020-01-14 17:01:01.547093', 2, 10.0);
INSERT INTO `group_card_order` VALUES (45, 'APecB4ahORFE', NULL, 0, 4, 0.00, 2, '2020-01-14 17:12:52.905149', NULL, 0.0);
INSERT INTO `group_card_order` VALUES (46, 'qgant2QIju0c', '2001160005561', 0, 5, 500.00, 0, '2020-01-16 15:53:42.044071', 2, 10.0);
INSERT INTO `group_card_order` VALUES (47, 'tRFNjnXhWdHT', NULL, 0, 12, 0.00, 2, '2020-01-18 16:48:16.519090', NULL, 0.0);
INSERT INTO `group_card_order` VALUES (48, 'pQaKV8Ar0Nxh', '2001180012164', 0, 12, 500.00, 0, '2020-01-18 17:08:44.767221', 2, 10.0);
INSERT INTO `group_card_order` VALUES (49, '3rqEWLA7RCkm', '2001180012048', 0, 12, 0.01, 1, '2020-01-18 17:10:26.593406', 2, 9.2);
INSERT INTO `group_card_order` VALUES (50, 'ag84oFrkmAiY', '2002030032183', 0, 32, 0.01, 0, '2020-02-03 22:11:51.047941', 2, 10.0);
INSERT INTO `group_card_order` VALUES (51, 'ZMOXB6ecCsPi', '2005300004217', 0, 4, 0.01, 0, '2020-05-30 21:17:59.504376', 3, 50.0);
INSERT INTO `group_card_order` VALUES (52, 'JSXwzxtsR4b0', '2005300004237', 0, 4, 0.01, 1, '2020-05-30 21:23:44.510818', 2, 0.9);
INSERT INTO `group_card_order` VALUES (53, 'fiAbYFkudmvK', '2005310004935', 0, 4, 0.01, 1, '2020-05-31 12:37:00.866565', 3, 50.0);
INSERT INTO `group_card_order` VALUES (54, 'ergDyEAfJpk3', '2005310004690', 0, 4, 0.01, 1, '2020-05-31 13:07:34.726417', 2, 10.0);
INSERT INTO `group_card_order` VALUES (57, 'H5XCbsNTDno1', NULL, 0, 3, 0.00, 1, '2020-05-31 13:16:24.943897', NULL, 1.0);
INSERT INTO `group_card_order` VALUES (58, 'H5XCbsNTDno1', NULL, 0, 4, 0.00, 1, '2020-05-31 13:16:24.949603', NULL, 1.0);
INSERT INTO `group_card_order` VALUES (59, 'SQsgk3ZmNot1', '2005310003079', 0, 3, 0.01, 0, '2020-05-31 13:21:13.595510', 3, 50.0);
INSERT INTO `group_card_order` VALUES (60, 'l0XVHZBnkU7D', '2005310052549', 0, 52, 0.01, 0, '2020-05-31 16:43:37.098831', 2, 10.0);
INSERT INTO `group_card_order` VALUES (61, '8lgvbisyHjkc', '2006030004810', 0, 4, 0.01, 0, '2020-06-03 08:26:42.681080', 3, 50.0);
INSERT INTO `group_card_order` VALUES (62, 'SoMftazHQJcr', '2006040055459', 0, 55, 0.01, 1, '2020-06-04 15:23:55.901144', 2, 10.0);
COMMIT;

-- ----------------------------
-- Table structure for group_comment
-- ----------------------------
DROP TABLE IF EXISTS `group_comment`;
CREATE TABLE `group_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` longtext,
  `tch_star` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sub_star` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `oid` longtext,
  PRIMARY KEY (`id`),
  KEY `group_comment_list_id_41f5aa39_fk_group_list_id` (`list_id`),
  KEY `group_comment_user_id_58f4cffd_fk_group_user_id` (`user_id`),
  KEY `group_comment_sub_id_589105ec` (`sub_id`),
  CONSTRAINT `group_comment_list_id_41f5aa39_fk_group_list_id` FOREIGN KEY (`list_id`) REFERENCES `group_list` (`id`),
  CONSTRAINT `group_comment_sub_id_589105ec_fk_group_subject_id` FOREIGN KEY (`sub_id`) REFERENCES `group_subject` (`id`),
  CONSTRAINT `group_comment_user_id_58f4cffd_fk_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `group_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_comment
-- ----------------------------
BEGIN;
INSERT INTO `group_comment` VALUES (7, '老师特别好！！！！', 5, 1, 1, 4, '2019-11-27 16:01:42.951751', 5, 0, '1911270004695');
INSERT INTO `group_comment` VALUES (8, '两位学生都很棒', 5, 1, 1, 4, '2019-11-27 16:40:03.894017', 5, 1, '1911270004695');
INSERT INTO `group_comment` VALUES (10, '我很喜欢', 5, 1, 1, 5, '2019-11-27 17:19:43.841279', 5, 0, '1911270004695');
INSERT INTO `group_comment` VALUES (11, '很好', 5, 1, 5, 4, '2019-11-28 15:49:12.009212', 5, 0, '1911270004140');
INSERT INTO `group_comment` VALUES (12, '老师特别好', 5, 1, 3, 4, '2019-11-28 17:06:13.339453', 5, 0, '1911280004017');
INSERT INTO `group_comment` VALUES (13, '看个剧', 5, 1, 3, 5, '2019-11-28 17:07:03.661611', 5, 0, '1911280004017');
INSERT INTO `group_comment` VALUES (14, '都好', 5, 1, 3, 4, '2019-11-28 17:07:32.448128', 5, 1, '1911280004017');
INSERT INTO `group_comment` VALUES (15, '爸爸👨！你说了不到你电话怎么一直关机', 5, 1, 5, 5, '2020-01-10 16:00:14.766025', 5, 0, '1911270004140');
INSERT INTO `group_comment` VALUES (16, 'cd出大事了；乘客单身；c但是；穿了；但是c', 5, 1, 1, 4, '2020-01-13 16:15:17.680450', 5, 1, '2001130004630');
INSERT INTO `group_comment` VALUES (17, 'cdsacs', 5, 1, 2, 4, '2020-01-13 16:15:24.631096', 5, 1, '2001100004584');
INSERT INTO `group_comment` VALUES (18, '很好', 5, 4, 13, 4, '2020-01-14 16:54:48.337765', 5, 0, '2001130004859');
INSERT INTO `group_comment` VALUES (19, '很棒', 5, 4, 13, 4, '2020-01-14 16:55:28.556801', 5, 1, '2001130004859');
INSERT INTO `group_comment` VALUES (20, 'sdacs', 5, 1, 4, 4, '2020-01-14 16:56:22.247580', 5, 0, '1911280004401');
INSERT INTO `group_comment` VALUES (21, 'cds', 1, 1, 1, 4, '2020-01-14 16:59:09.112913', 1, 0, '2001130004630');
INSERT INTO `group_comment` VALUES (22, '很好用', 1, 1, 2, 4, '2020-01-14 17:00:11.381864', 1, 0, '2001100004584');
INSERT INTO `group_comment` VALUES (23, '很好', 5, 4, 14, 12, '2020-01-18 17:25:01.785401', 5, 0, '2001180003387');
INSERT INTO `group_comment` VALUES (24, '老师很棒', 4, 3, 9, 5, '2020-01-18 17:25:16.209886', 4, 0, '2001180012096');
INSERT INTO `group_comment` VALUES (25, 'cdscds', 5, 1, 2, 4, '2020-05-31 16:17:45.238284', 5, 0, '2001140004934');
COMMIT;

-- ----------------------------
-- Table structure for group_detail
-- ----------------------------
DROP TABLE IF EXISTS `group_detail`;
CREATE TABLE `group_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  `image` varchar(100) DEFAULT NULL,
  `sub_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_detail_sub_id_388f968f_fk_group_subject_id` (`sub_id`),
  CONSTRAINT `group_detail_sub_id_388f968f_fk_group_subject_id` FOREIGN KEY (`sub_id`) REFERENCES `group_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_detail
-- ----------------------------
BEGIN;
INSERT INTO `group_detail` VALUES (1, '本栏目涵盖商务英语口语交流的绝大部分“场景”和“功能”，语言难度从低到高逐步提升；字斟句酌、浓缩精华，每个句型都体现了现代英语口语特点。熟练掌握，即可实现日常工作中的口语交流，在任何场景下，都可以用英语毫无忌惮地说', 'banner32x_iTODyOj.png', 1);
INSERT INTO `group_detail` VALUES (2, '大商场', '', 3);
INSERT INTO `group_detail` VALUES (3, 'office good！', 'qrcode-1.jpg', 7);
COMMIT;

-- ----------------------------
-- Table structure for group_formid
-- ----------------------------
DROP TABLE IF EXISTS `group_formid`;
CREATE TABLE `group_formid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formid` varchar(48) NOT NULL,
  `used` smallint(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_formid_user_id_61709b3f_fk_group_user_id` (`user_id`),
  CONSTRAINT `group_formid_user_id_61709b3f_fk_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `group_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_formid
-- ----------------------------
BEGIN;
INSERT INTO `group_formid` VALUES (156, 'e407fa2336bb4a528e6b439295bc0193', 0, '2019-11-29 12:53:50.139220', 12);
INSERT INTO `group_formid` VALUES (157, 'b7ef4907660440bb9cba00ce33249e02', 0, '2019-12-01 01:26:21.246630', 12);
INSERT INTO `group_formid` VALUES (165, '5f44ddd218c74c0bb3dbb005d538973b', 0, '2019-12-19 08:54:06.357367', 12);
INSERT INTO `group_formid` VALUES (166, '40faffbf4fc2496b9b239112100a0355', 0, '2019-12-25 20:19:20.945770', 12);
INSERT INTO `group_formid` VALUES (167, '30db0d836a674656b486a70e53e69d7c', 0, '2019-12-25 20:20:31.626519', 12);
INSERT INTO `group_formid` VALUES (168, '76a8ec9f80b6438f8ae8a59c57b12f70', 0, '2019-12-25 20:20:39.461556', 12);
INSERT INTO `group_formid` VALUES (169, '68e3cff304b64bbeb5a7d593f64ce988', 0, '2019-12-26 10:14:36.678776', 19);
INSERT INTO `group_formid` VALUES (170, '34d851130e484e31bcd14869f4efd7be', 0, '2019-12-26 10:15:34.150065', 19);
INSERT INTO `group_formid` VALUES (171, '2f4ac2ee5ed44171b62727ad78be9398', 0, '2019-12-26 10:21:17.585712', 19);
INSERT INTO `group_formid` VALUES (177, 'b44c7cfffdd24ee7b556807bc036163f', 0, '2020-01-07 13:08:48.913188', 21);
INSERT INTO `group_formid` VALUES (178, 'c45333812dd142ea9865b7c029ecc098', 0, '2020-01-09 15:27:35.931484', 21);
INSERT INTO `group_formid` VALUES (181, 'f5222f5aec974a928c77ff6b29222c33', 0, '2020-01-15 14:13:20.489025', 12);
INSERT INTO `group_formid` VALUES (182, '387cf598f1e34a35bb81479ca2f3ca49', 0, '2020-01-18 17:59:33.586507', 4);
INSERT INTO `group_formid` VALUES (183, '99a6caaf55c74d3389ae36e715327ae1', 0, '2020-01-18 17:59:49.497599', 4);
INSERT INTO `group_formid` VALUES (184, 'f3a569d79c094bc4a7aa593f8001546d', 0, '2020-01-18 18:01:16.029800', 4);
INSERT INTO `group_formid` VALUES (185, 'f9295730a9c44f7d822ce1cd1fac0fc0', 0, '2020-01-21 19:54:52.936449', 29);
INSERT INTO `group_formid` VALUES (186, 'f038df4b84be4c0380a27864ce6d907a', 0, '2020-01-21 19:54:58.836129', 29);
INSERT INTO `group_formid` VALUES (187, '3c9e86d9f21444249c4cc70c2bb92a19', 0, '2020-01-21 19:55:11.156396', 29);
INSERT INTO `group_formid` VALUES (188, 'f6b2b336d77c46ef814aab73a327e657', 0, '2020-01-21 20:28:20.251146', 28);
INSERT INTO `group_formid` VALUES (189, '17cc2e2b980005c0d692c791b579854a', 0, '2020-02-03 22:01:38.678258', 32);
INSERT INTO `group_formid` VALUES (190, '41c0e83c9a3a8322368a25f60d6b2967', 0, '2020-02-03 22:06:22.507291', 32);
INSERT INTO `group_formid` VALUES (191, '05e35782fd754960811b70f7052fc65b', 0, '2020-02-10 21:48:47.809719', 12);
INSERT INTO `group_formid` VALUES (192, 'c928fea49a244c23b1b363e05f412620', 0, '2020-02-10 21:52:04.787274', 34);
INSERT INTO `group_formid` VALUES (193, '328e2507ad0a42ac86069963ef308f11', 0, '2020-05-30 20:44:15.063306', 12);
INSERT INTO `group_formid` VALUES (194, '1440e96e56df4be48911654609c3bb21', 0, '2020-05-30 20:44:19.114161', 12);
INSERT INTO `group_formid` VALUES (195, 'fa38e23c89f347e28380fa007317ac78', 0, '2020-05-30 21:31:10.803872', 12);
INSERT INTO `group_formid` VALUES (196, 'd5e83110bce54fbd90d5cd13ac543a6d', 0, '2020-05-31 22:13:33.212274', 4);
INSERT INTO `group_formid` VALUES (197, 'fdfe2cdc43e14513bddc376891dbfb30', 0, '2020-06-03 08:27:12.816161', 4);
INSERT INTO `group_formid` VALUES (198, '42590f30f75f4af2870706417d568860', 0, '2020-06-04 15:24:19.619448', 55);
INSERT INTO `group_formid` VALUES (199, 'c25022ef5dda4a12bc4d8bc1e5c6abb2', 0, '2020-06-04 15:24:46.910057', 55);
INSERT INTO `group_formid` VALUES (200, 'b97aeaa5e7f0463fabf9f065f7709bd4', 0, '2020-06-04 15:24:46.910121', 55);
INSERT INTO `group_formid` VALUES (201, 'b35c8ed3a1c74ca482c3450285ff7733', 0, '2020-07-06 15:39:50.426389', 4);
INSERT INTO `group_formid` VALUES (202, '2a2019d6283e4a26898f3d74855e1930', 0, '2020-07-06 15:40:07.611490', 4);
INSERT INTO `group_formid` VALUES (203, '91e51386672a4440b03f94d11c571164', 0, '2020-07-06 18:23:19.886235', 4);
INSERT INTO `group_formid` VALUES (204, '7de54b324b5a448a8db61762f1d40d5e', 0, '2020-07-06 18:23:27.381739', 4);
INSERT INTO `group_formid` VALUES (205, 'dff00e9e269942f99b36023089697762', 0, '2020-07-09 16:45:57.716475', 4);
INSERT INTO `group_formid` VALUES (206, '4b1a226eaafc47d08dac63b728740664', 0, '2020-07-21 16:04:08.140772', 63);
INSERT INTO `group_formid` VALUES (207, '06cf61c2ec4d4d5aa2217d14b56db572', 0, '2020-07-21 16:21:12.602265', 12);
COMMIT;

-- ----------------------------
-- Table structure for group_freeTime
-- ----------------------------
DROP TABLE IF EXISTS `group_freeTime`;
CREATE TABLE `group_freeTime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tch_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `end` time(6) DEFAULT NULL,
  `start` time(6) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_FreeTime_tch_id_43dfc98b_fk_group_user_id` (`tch_id`),
  CONSTRAINT `group_FreeTime_tch_id_43dfc98b_fk_group_user_id` FOREIGN KEY (`tch_id`) REFERENCES `group_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=473 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_freeTime
-- ----------------------------
BEGIN;
INSERT INTO `group_freeTime` VALUES (89, 4, '2019-10-30', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (90, 4, '2019-10-30', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (91, 4, '2019-10-30', '22:00:00.000000', '21:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (92, 4, '2019-10-30', '23:00:00.000000', '22:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (93, 4, '2019-10-31', '18:00:00.000000', '17:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (94, 4, '2019-10-31', '19:00:00.000000', '18:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (95, 4, '2019-10-31', '20:00:00.000000', '19:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (96, 4, '2019-11-02', '17:00:00.000000', '16:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (97, 4, '2019-11-02', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (98, 4, '2019-11-02', '19:00:00.000000', '18:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (99, 4, '2019-11-02', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (100, 4, '2019-11-02', '21:00:00.000000', '20:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (101, 4, '2019-11-02', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (102, 4, '2019-11-02', '23:00:00.000000', '22:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (103, 4, '2019-11-02', '00:00:00.000000', '23:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (104, 4, '2019-11-03', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (105, 4, '2019-11-03', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (106, 4, '2019-11-03', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (107, 4, '2019-11-03', '21:00:00.000000', '20:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (108, 4, '2019-11-03', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (109, 4, '2019-11-07', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (110, 4, '2019-11-07', '10:00:00.000000', '09:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (111, 4, '2019-11-07', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (112, 4, '2019-11-07', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (113, 4, '2019-11-07', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (114, 4, '2019-11-07', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (115, 4, '2019-11-07', '15:00:00.000000', '14:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (116, 4, '2019-11-07', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (117, 4, '2019-11-07', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (118, 4, '2019-11-07', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (119, 4, '2019-11-07', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (120, 4, '2019-11-07', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (121, 4, '2019-11-22', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (122, 4, '2019-11-22', '12:00:00.000000', '11:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (123, 4, '2019-11-22', '13:00:00.000000', '12:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (124, 4, '2019-11-22', '16:00:00.000000', '15:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (125, 4, '2019-11-22', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (126, 4, '2019-11-18', '09:00:00.000000', '08:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (127, 4, '2019-11-18', '10:00:00.000000', '09:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (128, 4, '2019-11-18', '11:00:00.000000', '10:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (129, 4, '2019-11-18', '12:00:00.000000', '11:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (130, 4, '2019-11-18', '13:00:00.000000', '12:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (131, 4, '2019-11-18', '14:00:00.000000', '13:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (132, 4, '2019-11-18', '15:00:00.000000', '14:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (133, 4, '2019-11-18', '16:00:00.000000', '15:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (134, 4, '2019-11-18', '17:00:00.000000', '16:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (135, 4, '2019-11-18', '18:00:00.000000', '17:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (136, 4, '2019-11-18', '19:00:00.000000', '18:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (137, 4, '2019-11-18', '20:00:00.000000', '19:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (138, 4, '2019-11-19', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (139, 4, '2019-11-19', '10:00:00.000000', '09:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (140, 4, '2019-11-19', '11:00:00.000000', '10:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (141, 4, '2019-11-19', '12:00:00.000000', '11:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (142, 4, '2019-11-19', '13:00:00.000000', '12:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (143, 4, '2019-11-19', '14:00:00.000000', '13:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (144, 4, '2019-11-19', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (145, 4, '2019-11-19', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (146, 4, '2019-11-19', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (147, 4, '2019-11-19', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (148, 4, '2019-11-20', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (149, 4, '2019-11-20', '10:00:00.000000', '09:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (150, 4, '2019-11-20', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (151, 4, '2019-11-20', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (152, 4, '2019-11-20', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (153, 4, '2019-11-20', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (154, 4, '2019-11-20', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (155, 4, '2019-11-20', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (156, 4, '2019-11-20', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (157, 4, '2019-11-21', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (158, 4, '2019-11-21', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (159, 4, '2019-11-21', '11:00:00.000000', '10:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (160, 4, '2019-11-21', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (161, 4, '2019-11-21', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (162, 4, '2019-11-21', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (163, 4, '2019-11-21', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (164, 4, '2019-11-21', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (165, 4, '2019-11-26', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (166, 4, '2019-11-26', '10:00:00.000000', '09:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (167, 4, '2019-11-26', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (168, 4, '2019-11-26', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (169, 4, '2019-11-26', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (170, 4, '2019-11-26', '15:00:00.000000', '14:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (173, 4, '2019-11-24', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (174, 4, '2019-11-24', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (175, 4, '2019-11-25', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (176, 4, '2019-11-25', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (181, 4, '2019-11-27', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (182, 4, '2019-11-27', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (183, 4, '2019-11-27', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (184, 4, '2019-11-27', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (185, 4, '2019-11-27', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (186, 4, '2019-11-27', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (187, 4, '2019-11-27', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (188, 4, '2019-11-27', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (189, 4, '2019-11-27', '23:00:00.000000', '22:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (190, 4, '2019-11-27', '00:00:00.000000', '23:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (191, 4, '2019-11-30', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (192, 4, '2019-11-30', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (193, 4, '2019-11-30', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (194, 4, '2019-11-30', '20:00:00.000000', '19:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (195, 4, '2019-11-30', '21:00:00.000000', '20:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (196, 4, '2019-11-30', '22:00:00.000000', '21:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (197, 4, '2019-11-30', '23:00:00.000000', '22:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (198, 4, '2019-11-30', '00:00:00.000000', '23:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (199, 6, '2019-12-14', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (200, 6, '2019-12-14', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (201, 6, '2019-12-14', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (202, 6, '2019-12-14', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (203, 6, '2019-12-14', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (204, 6, '2019-12-14', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (205, 6, '2019-12-14', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (206, 6, '2019-12-14', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (207, 6, '2019-12-14', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (208, 6, '2019-12-14', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (209, 6, '2019-12-14', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (210, 6, '2019-12-14', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (211, 6, '2019-12-14', '21:00:00.000000', '20:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (212, 6, '2019-12-14', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (213, 6, '2019-12-14', '23:00:00.000000', '22:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (214, 6, '2019-12-14', '00:00:00.000000', '23:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (215, 9, '2019-12-14', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (216, 9, '2019-12-14', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (217, 9, '2019-12-14', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (218, 9, '2019-12-14', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (219, 9, '2019-12-14', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (220, 9, '2019-12-14', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (221, 9, '2019-12-14', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (222, 9, '2019-12-14', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (223, 9, '2019-12-14', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (224, 9, '2019-12-14', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (225, 9, '2019-12-14', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (226, 9, '2019-12-14', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (227, 9, '2019-12-14', '21:00:00.000000', '20:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (228, 9, '2019-12-14', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (229, 9, '2019-12-14', '23:00:00.000000', '22:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (230, 9, '2019-12-14', '00:00:00.000000', '23:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (231, 4, '2019-12-28', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (232, 4, '2019-12-28', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (233, 4, '2019-12-28', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (234, 4, '2019-12-28', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (235, 4, '2019-12-28', '13:00:00.000000', '12:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (236, 4, '2019-12-28', '14:00:00.000000', '13:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (237, 4, '2019-12-28', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (238, 4, '2019-12-28', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (239, 4, '2019-12-28', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (240, 4, '2019-12-28', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (241, 4, '2019-12-28', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (242, 4, '2019-12-28', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (243, 4, '2019-12-28', '21:00:00.000000', '20:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (244, 4, '2019-12-28', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (245, 4, '2019-12-28', '23:00:00.000000', '22:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (246, 4, '2019-12-28', '00:00:00.000000', '23:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (247, 13, '2020-01-04', '09:00:00.000000', '08:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (248, 13, '2020-01-04', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (249, 13, '2020-01-04', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (250, 13, '2020-01-04', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (251, 13, '2020-01-04', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (252, 13, '2020-01-04', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (253, 13, '2020-01-04', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (254, 13, '2020-01-04', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (255, 13, '2020-01-04', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (256, 13, '2020-01-04', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (257, 13, '2020-01-04', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (258, 13, '2020-01-04', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (259, 13, '2020-01-04', '21:00:00.000000', '20:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (260, 13, '2020-01-04', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (261, 13, '2020-01-04', '23:00:00.000000', '22:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (262, 13, '2020-01-04', '00:00:00.000000', '23:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (263, 6, '2020-01-04', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (264, 6, '2020-01-04', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (265, 6, '2020-01-04', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (266, 6, '2020-01-04', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (267, 6, '2020-01-04', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (268, 6, '2020-01-04', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (269, 6, '2020-01-04', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (270, 6, '2020-01-04', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (271, 6, '2020-01-04', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (272, 6, '2020-01-04', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (273, 6, '2020-01-04', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (274, 6, '2020-01-04', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (275, 6, '2020-01-04', '21:00:00.000000', '20:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (276, 6, '2020-01-04', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (277, 6, '2020-01-04', '23:00:00.000000', '22:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (278, 6, '2020-01-04', '00:00:00.000000', '23:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (279, 17, '2019-12-20', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (280, 4, '2020-01-18', '09:00:00.000000', '08:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (281, 4, '2020-01-18', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (282, 4, '2020-01-18', '11:00:00.000000', '10:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (283, 4, '2020-01-18', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (284, 4, '2020-01-18', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (285, 4, '2020-01-18', '14:00:00.000000', '13:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (286, 4, '2020-01-18', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (287, 4, '2020-01-18', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (288, 4, '2020-01-18', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (289, 4, '2020-01-18', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (290, 4, '2020-01-18', '19:00:00.000000', '18:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (291, 4, '2020-01-18', '20:00:00.000000', '19:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (292, 4, '2020-01-18', '21:00:00.000000', '20:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (293, 4, '2020-01-18', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (294, 4, '2020-01-18', '23:00:00.000000', '22:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (295, 4, '2020-01-18', '00:00:00.000000', '23:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (296, 4, '2020-01-10', '19:00:00.000000', '18:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (297, 4, '2020-01-10', '20:00:00.000000', '19:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (298, 4, '2020-01-10', '21:00:00.000000', '20:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (299, 4, '2020-01-10', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (300, 4, '2020-01-10', '23:00:00.000000', '22:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (301, 4, '2020-01-10', '00:00:00.000000', '23:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (302, 4, '2020-01-11', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (303, 4, '2020-01-11', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (304, 4, '2020-01-11', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (305, 4, '2020-01-11', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (306, 4, '2020-01-11', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (307, 4, '2020-01-11', '21:00:00.000000', '20:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (308, 4, '2020-01-11', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (309, 4, '2020-01-11', '23:00:00.000000', '22:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (310, 4, '2020-01-11', '00:00:00.000000', '23:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (311, 4, '2020-01-17', '15:00:00.000000', '14:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (312, 4, '2020-01-17', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (313, 4, '2020-01-17', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (314, 4, '2020-01-17', '18:00:00.000000', '17:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (315, 4, '2020-01-17', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (316, 4, '2020-01-17', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (317, 4, '2020-01-17', '21:00:00.000000', '20:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (318, 4, '2020-01-17', '22:00:00.000000', '21:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (319, 4, '2020-01-17', '23:00:00.000000', '22:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (320, 4, '2020-01-17', '00:00:00.000000', '23:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (330, 4, '2020-01-23', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (331, 4, '2020-01-23', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (332, 4, '2020-01-23', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (333, 4, '2020-01-23', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (334, 4, '2020-01-23', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (335, 4, '2020-01-23', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (336, 4, '2020-01-23', '21:00:00.000000', '20:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (337, 4, '2020-01-23', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (338, 4, '2020-01-23', '23:00:00.000000', '22:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (339, 4, '2020-01-23', '00:00:00.000000', '23:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (340, 4, '2020-01-24', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (341, 4, '2020-01-24', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (342, 4, '2020-01-24', '17:00:00.000000', '16:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (343, 5, '2020-02-01', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (344, 5, '2020-02-01', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (345, 5, '2020-02-01', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (346, 5, '2020-02-01', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (347, 5, '2020-02-01', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (348, 5, '2020-02-01', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (349, 5, '2020-02-01', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (350, 5, '2020-02-01', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (351, 5, '2020-02-01', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (352, 5, '2020-02-01', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (353, 5, '2020-02-01', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (354, 5, '2020-02-01', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (355, 5, '2020-02-01', '21:00:00.000000', '20:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (356, 5, '2020-02-01', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (357, 5, '2020-02-01', '23:00:00.000000', '22:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (358, 5, '2020-02-01', '00:00:00.000000', '23:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (359, 4, '2020-06-04', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (360, 4, '2020-06-04', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (361, 4, '2020-06-04', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (362, 4, '2020-05-30', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (363, 4, '2020-06-06', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (364, 4, '2020-06-06', '17:00:00.000000', '16:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (365, 4, '2020-06-06', '18:00:00.000000', '17:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (366, 4, '2020-06-06', '19:00:00.000000', '18:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (367, 4, '2020-06-06', '20:00:00.000000', '19:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (368, 4, '2020-06-06', '21:00:00.000000', '20:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (369, 4, '2020-06-01', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (370, 4, '2020-06-01', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (371, 4, '2020-06-01', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (372, 4, '2020-06-01', '12:00:00.000000', '11:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (373, 4, '2020-06-01', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (374, 4, '2020-06-01', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (375, 4, '2020-06-01', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (376, 4, '2020-06-01', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (377, 4, '2020-06-01', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (378, 4, '2020-06-01', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (379, 4, '2020-06-01', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (380, 4, '2020-06-01', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (381, 4, '2020-06-01', '21:00:00.000000', '20:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (382, 4, '2020-06-01', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (383, 4, '2020-06-01', '23:00:00.000000', '22:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (384, 4, '2020-06-01', '00:00:00.000000', '23:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (385, 4, '2020-06-02', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (386, 4, '2020-06-02', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (387, 4, '2020-06-02', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (388, 4, '2020-06-02', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (389, 4, '2020-06-02', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (390, 4, '2020-06-02', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (391, 4, '2020-06-02', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (392, 4, '2020-06-02', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (393, 4, '2020-06-02', '21:00:00.000000', '20:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (394, 4, '2020-06-02', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (395, 4, '2020-06-02', '23:00:00.000000', '22:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (396, 4, '2020-06-02', '00:00:00.000000', '23:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (397, 4, '2020-05-31', '23:00:00.000000', '22:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (398, 4, '2020-05-31', '22:00:00.000000', '21:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (399, 4, '2020-07-10', '14:00:00.000000', '13:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (400, 4, '2020-07-10', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (401, 4, '2020-12-24', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (402, 4, '2020-12-24', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (403, 4, '2020-12-24', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (404, 4, '2020-12-24', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (405, 4, '2020-12-24', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (406, 4, '2020-12-24', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (407, 4, '2020-12-24', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (408, 4, '2020-12-24', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (409, 4, '2020-12-24', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (410, 4, '2020-12-24', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (411, 4, '2020-12-24', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (412, 4, '2020-12-24', '20:00:00.000000', '19:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (423, 4, '2020-12-27', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (424, 4, '2020-12-27', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (425, 4, '2020-12-27', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (426, 4, '2020-12-31', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (427, 4, '2020-12-31', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (428, 4, '2020-12-31', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (429, 4, '2020-12-31', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (430, 4, '2020-12-31', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (431, 4, '2020-12-31', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (432, 4, '2020-12-31', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (433, 4, '2021-01-02', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (434, 4, '2021-01-02', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (435, 4, '2021-01-02', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (436, 4, '2021-01-02', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (437, 4, '2021-01-09', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (438, 4, '2021-01-09', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (439, 4, '2021-01-09', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (440, 4, '2021-01-09', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (441, 4, '2021-01-09', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (442, 4, '2021-01-09', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (443, 4, '2021-01-09', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (444, 4, '2021-01-09', '16:00:00.000000', '15:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (445, 4, '2021-01-09', '17:00:00.000000', '16:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (446, 4, '2021-01-09', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (447, 4, '2021-01-09', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (448, 4, '2021-01-09', '20:00:00.000000', '19:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (449, 4, '2021-01-08', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (450, 4, '2021-01-08', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (451, 4, '2021-01-08', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (452, 4, '2021-01-08', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (453, 4, '2021-01-08', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (454, 4, '2021-01-08', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (455, 4, '2021-01-08', '15:00:00.000000', '14:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (456, 4, '2021-01-08', '16:00:00.000000', '15:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (457, 4, '2021-01-08', '17:00:00.000000', '16:00:00.000000', 1);
INSERT INTO `group_freeTime` VALUES (458, 4, '2021-01-08', '18:00:00.000000', '17:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (459, 4, '2021-01-08', '19:00:00.000000', '18:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (460, 4, '2021-01-06', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (461, 4, '2021-01-06', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (462, 4, '2020-12-25', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (463, 4, '2020-12-25', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (464, 4, '2020-12-25', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (465, 4, '2020-12-25', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (466, 4, '2020-12-25', '13:00:00.000000', '12:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (467, 4, '2020-12-25', '14:00:00.000000', '13:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (468, 4, '2020-12-26', '09:00:00.000000', '08:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (469, 4, '2020-12-26', '10:00:00.000000', '09:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (470, 4, '2020-12-26', '11:00:00.000000', '10:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (471, 4, '2020-12-26', '12:00:00.000000', '11:00:00.000000', 0);
INSERT INTO `group_freeTime` VALUES (472, 4, '2020-12-26', '13:00:00.000000', '12:00:00.000000', 0);
COMMIT;

-- ----------------------------
-- Table structure for group_industry
-- ----------------------------
DROP TABLE IF EXISTS `group_industry`;
CREATE TABLE `group_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_industry
-- ----------------------------
BEGIN;
INSERT INTO `group_industry` VALUES (1, '政府、公共事业');
INSERT INTO `group_industry` VALUES (2, '金融、商业、保险业');
INSERT INTO `group_industry` VALUES (3, '法律行业');
INSERT INTO `group_industry` VALUES (4, 'IT技术行业');
INSERT INTO `group_industry` VALUES (5, '教育、科研');
INSERT INTO `group_industry` VALUES (6, '医疗、卫生业');
INSERT INTO `group_industry` VALUES (7, '新闻、广告业');
INSERT INTO `group_industry` VALUES (8, '建筑业');
INSERT INTO `group_industry` VALUES (9, '旅游、餐饮、服务业');
INSERT INTO `group_industry` VALUES (10, '文化、娱乐业');
INSERT INTO `group_industry` VALUES (11, '体育运动');
INSERT INTO `group_industry` VALUES (12, '交通运输业');
INSERT INTO `group_industry` VALUES (13, '工业制造业');
INSERT INTO `group_industry` VALUES (14, '农、林、渔、矿业');
INSERT INTO `group_industry` VALUES (15, '军人');
COMMIT;

-- ----------------------------
-- Table structure for group_list
-- ----------------------------
DROP TABLE IF EXISTS `group_list`;
CREATE TABLE `group_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `time` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `sale` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_list_sub_id_58e619ae_fk_group_subject_id` (`sub_id`),
  CONSTRAINT `group_list_sub_id_58e619ae_fk_group_subject_id` FOREIGN KEY (`sub_id`) REFERENCES `group_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_list
-- ----------------------------
BEGIN;
INSERT INTO `group_list` VALUES (1, 'Lost stars (Introduction)', 60, 1, 53, 1);
INSERT INTO `group_list` VALUES (2, 'music terms in the lyrics 英文歌词里面的音乐术语', 60, 1, 12, 1);
INSERT INTO `group_list` VALUES (3, 'Verse 1-1', 60, 1, 20, 1);
INSERT INTO `group_list` VALUES (4, 'Verse 1-2', 60, 1, 10, 1);
INSERT INTO `group_list` VALUES (5, 'Verse 1-3', 60, 1, 7, 1);
INSERT INTO `group_list` VALUES (9, '职场一入深似海，困难重重似无边', 60, 1, -1, 3);
INSERT INTO `group_list` VALUES (10, 'Verse 1-4', 60, 1, 1, 1);
INSERT INTO `group_list` VALUES (11, '感谢您从百忙之中抽空关注我', 60, 1, 3, 3);
INSERT INTO `group_list` VALUES (12, '明明白白做人，轻轻松松做事', 60, 1, 6, 3);
INSERT INTO `group_list` VALUES (13, '英语口语革命零基础2018', 60, 1, -1, 4);
INSERT INTO `group_list` VALUES (14, 'Everyday conversation 2018版 外教', 60, 1, 6, 4);
INSERT INTO `group_list` VALUES (15, '口语1', 60, 1, 1, 5);
INSERT INTO `group_list` VALUES (16, '口语2', 60, 1, 1, 5);
INSERT INTO `group_list` VALUES (17, '口语3', 60, 1, 0, 5);
INSERT INTO `group_list` VALUES (18, 'V', 60, 1, 0, 6);
INSERT INTO `group_list` VALUES (19, 'introduction', 60, 1, 8, 7);
INSERT INTO `group_list` VALUES (20, 'preface', 60, 2, 8, 7);
COMMIT;

-- ----------------------------
-- Table structure for group_order
-- ----------------------------
DROP TABLE IF EXISTS `group_order`;
CREATE TABLE `group_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(8,1) NOT NULL,
  `status` int(11) NOT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `list_id` int(11) NOT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `sub_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time_id` int(11) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `team_type` int(11) NOT NULL,
  `cashout` int(11) DEFAULT NULL,
  `tcmted` tinyint(1) NOT NULL,
  `ucmted` tinyint(1) NOT NULL,
  `oid` varchar(50) DEFAULT NULL,
  `cash_id` int(11) DEFAULT NULL,
  `classin` tinyint(1) NOT NULL,
  `sub_time` datetime(6) DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_order_list_id_b9bf38a1_fk_group_list_id` (`list_id`),
  KEY `group_order_partner_id_bf9374c9_fk_group_user_id` (`partner_id`),
  KEY `group_order_sub_id_d68a690b_fk_group_subject_id` (`sub_id`),
  KEY `group_order_teacher_id_d29fbafc_fk_group_user_id` (`teacher_id`),
  KEY `group_order_user_id_9cf7f697_fk_group_user_id` (`user_id`),
  KEY `group_order_time_id_fe3b5cbf_fk_group_freeTime_id` (`time_id`),
  CONSTRAINT `group_order_list_id_b9bf38a1_fk_group_list_id` FOREIGN KEY (`list_id`) REFERENCES `group_list` (`id`),
  CONSTRAINT `group_order_partner_id_bf9374c9_fk_group_user_id` FOREIGN KEY (`partner_id`) REFERENCES `group_user` (`id`),
  CONSTRAINT `group_order_sub_id_d68a690b_fk_group_subject_id` FOREIGN KEY (`sub_id`) REFERENCES `group_subject` (`id`),
  CONSTRAINT `group_order_teacher_id_d29fbafc_fk_group_user_id` FOREIGN KEY (`teacher_id`) REFERENCES `group_user` (`id`),
  CONSTRAINT `group_order_time_id_fe3b5cbf_fk_group_freeTime_id` FOREIGN KEY (`time_id`) REFERENCES `group_freeTime` (`id`),
  CONSTRAINT `group_order_user_id_9cf7f697_fk_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `group_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_order
-- ----------------------------
BEGIN;
INSERT INTO `group_order` VALUES (137, 1.0, 2, NULL, 1, 3, 1, 4, 4, 189, '2019-11-27 13:57:55.470323', 0, 3, 1, 1, '1911270004695', 2, 0, NULL, 1);
INSERT INTO `group_order` VALUES (138, 1.0, 2, NULL, 1, 4, 1, 4, 3, 189, '2019-11-27 15:49:24.596662', 0, 3, 1, 1, '1911270004695', 2, 0, NULL, 1);
INSERT INTO `group_order` VALUES (139, 1.0, 2, NULL, 5, 3, 1, 4, 4, 190, '2019-11-27 16:58:37.918648', 0, 3, 1, 1, '1911270004140', 2, 0, NULL, 1);
INSERT INTO `group_order` VALUES (140, 1.0, 2, NULL, 5, 4, 1, 4, 3, 190, '2019-11-27 17:01:31.957836', 0, 3, 1, 1, '1911270004140', 2, 0, NULL, 1);
INSERT INTO `group_order` VALUES (141, 1.0, 4, NULL, 2, NULL, 1, 4, 4, 198, '2019-11-28 17:02:02.055572', 1, 0, 0, 0, '1911280004617', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (142, 1.0, 2, NULL, 3, 3, 1, 4, 4, 198, '2019-11-28 17:02:44.335412', 1, 3, 1, 1, '1911280004017', 2, 0, NULL, 1);
INSERT INTO `group_order` VALUES (143, 1.0, 2, NULL, 3, 4, 1, 4, 3, 198, '2019-11-28 17:05:27.498261', 1, 3, 1, 1, '1911280004017', 2, 0, NULL, 1);
INSERT INTO `group_order` VALUES (144, 1.5, 2, NULL, 4, 3, 1, 4, 4, 196, '2019-11-28 17:21:42.546016', 2, 1, 0, 1, '1911280004401', 3, 0, NULL, 1);
INSERT INTO `group_order` VALUES (145, 2.2, 2, NULL, 4, 4, 1, 4, 3, 196, '2019-11-28 17:25:32.183849', 2, 2, 0, 0, '1911280004401', 4, 0, NULL, 1);
INSERT INTO `group_order` VALUES (146, 1.5, 2, NULL, 5, 3, 1, 4, 3, 197, '2019-11-28 17:40:17.337161', 2, 2, 0, 0, '1911280003582', 4, 0, NULL, 1);
INSERT INTO `group_order` VALUES (147, 2.2, 2, NULL, 5, 3, 1, 4, 3, 197, '2019-11-28 17:40:33.269829', 2, 2, 0, 0, '1911280003582', 4, 0, NULL, 1);
INSERT INTO `group_order` VALUES (148, 1.0, 6, NULL, 2, NULL, 1, 4, 4, 195, '2019-11-28 20:33:42.880663', 0, 1, 0, 0, '1911280004596', 3, 0, NULL, 1);
INSERT INTO `group_order` VALUES (149, 1.0, 6, NULL, 2, NULL, 1, 4, 4, 194, '2019-11-28 20:34:45.643896', 1, 1, 0, 0, '1911280004812', 3, 0, NULL, 1);
INSERT INTO `group_order` VALUES (150, 1.0, 6, NULL, 1, NULL, 1, 4, 4, 235, '2019-12-16 19:58:23.164295', 0, 1, 0, 0, '1912160004061', 3, 0, NULL, 1);
INSERT INTO `group_order` VALUES (151, 1.0, 6, NULL, 4, NULL, 1, 4, 4, 236, '2019-12-16 19:59:11.465572', 0, 1, 0, 0, '1912160004740', 3, 0, NULL, 1);
INSERT INTO `group_order` VALUES (152, 1.0, 6, NULL, 1, NULL, 1, 13, 4, 247, '2019-12-30 20:05:55.106592', 0, 0, 0, 0, '1912300004058', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (153, 1.0, 2, NULL, 2, 4, 1, 4, 4, 296, '2020-01-10 12:05:05.343936', 0, 2, 1, 1, '2001100004584', 4, 0, NULL, 1);
INSERT INTO `group_order` VALUES (154, 1.0, 6, NULL, 2, NULL, 1, 4, 4, 301, '2020-01-10 12:20:24.809401', 0, 2, 0, 0, '2001100004374', 4, 0, NULL, 1);
INSERT INTO `group_order` VALUES (155, 1.0, 6, NULL, 1, NULL, 1, 4, 4, 297, '2020-01-10 12:23:23.915499', 0, 2, 0, 0, '2001100004861', 4, 0, NULL, 1);
INSERT INTO `group_order` VALUES (156, 1.0, 6, NULL, 5, NULL, 1, 4, 4, 300, '2020-01-10 12:23:43.125481', 0, 2, 0, 0, '2001100004573', 4, 0, NULL, 1);
INSERT INTO `group_order` VALUES (157, 1.0, 2, NULL, 2, 4, 1, 4, 4, 296, '2020-01-10 15:49:31.606518', 0, 2, 1, 1, '2001100004584', 4, 0, NULL, 1);
INSERT INTO `group_order` VALUES (158, 1.0, 2, NULL, 1, 4, 1, 4, 4, 311, '2020-01-13 16:13:54.678755', 0, 2, 1, 1, '2001130004630', 4, 0, NULL, 1);
INSERT INTO `group_order` VALUES (159, 1.0, 2, NULL, 1, 4, 1, 4, 4, 311, '2020-01-13 16:14:06.373913', 0, 2, 1, 1, '2001130004630', 4, 0, NULL, 1);
INSERT INTO `group_order` VALUES (160, 1.0, 4, NULL, 1, NULL, 1, 4, 4, 312, '2020-01-13 16:16:00.494929', 0, 0, 0, 0, '2001130004439', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (161, 1.0, 4, NULL, 3, 3, 1, 4, 4, 316, '2020-01-13 16:17:21.325353', 0, 0, 0, 0, '2001130004927', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (162, 1.0, 4, NULL, 3, 4, 1, 4, 3, 316, '2020-01-13 16:18:14.299422', 0, 0, 0, 0, '2001130004927', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (163, 1.0, 4, NULL, 16, NULL, 5, 4, 3, 316, '2020-01-13 16:36:39.393376', 0, 0, 0, 0, '2001130003502', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (164, 1.0, 4, NULL, 11, NULL, 3, 4, 3, 316, '2020-01-13 16:38:08.088271', 0, 0, 0, 0, '2001130003389', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (165, 1.0, 4, NULL, 11, 3, 3, 4, 4, 316, '2020-01-13 17:15:09.257571', 0, 0, 0, 0, '2001130004104', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (166, 1.0, 4, NULL, 14, NULL, 4, 4, 3, 317, '2020-01-13 17:17:21.942952', 0, 0, 0, 0, '2001130003026', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (167, 1.0, 4, NULL, 11, 4, 3, 4, 3, 316, '2020-01-13 17:20:34.795723', 0, 0, 0, 0, '2001130004104', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (168, 1.0, 2, NULL, 14, 4, 4, 4, 3, 317, '2020-01-13 17:21:59.130474', 1, 1, 0, 0, '2001130003690', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (169, 1.0, 5, NULL, 14, 3, 4, 4, 4, 317, '2020-01-13 17:23:07.403657', 1, 0, 0, 0, '2001130003690', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (170, 1.5, 4, NULL, 9, NULL, 3, 4, 3, 315, '2020-01-13 17:26:22.832306', 2, 0, 0, 0, '2001130003052', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (171, 1.5, 4, NULL, 9, NULL, 3, 4, 3, 315, '2020-01-13 17:27:48.974014', 2, 0, 0, 0, '2001130003785', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (172, 1.5, 6, NULL, 9, NULL, 3, 4, 3, 315, '2020-01-13 17:29:41.530991', 2, 1, 0, 0, '2001130003548', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (173, 1.5, 6, NULL, 9, NULL, 3, 4, 3, 315, '2020-01-13 17:32:43.195715', 2, 1, 0, 0, '2001130003628', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (174, 1.5, 4, NULL, 9, 3, 3, 4, 3, 315, '2020-01-13 17:33:58.355592', 2, 0, 0, 0, '2001130003758', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (175, 1.5, 6, NULL, 9, NULL, 3, 4, 3, 315, '2020-01-13 17:35:12.770524', 2, 1, 0, 0, '2001130003526', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (176, 1.5, 2, NULL, 9, 3, 3, 4, 3, 315, '2020-01-13 17:35:40.359025', 2, 1, 0, 0, '2001130003724', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (177, 2.2, 4, NULL, 9, 3, 3, 4, 3, 315, '2020-01-13 17:38:32.967806', 2, 0, 0, 0, '2001130003758', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (178, 2.2, 2, NULL, 9, 3, 3, 4, 3, 315, '2020-01-13 17:40:03.888395', 2, 1, 0, 0, '2001130003724', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (179, 1.5, 4, NULL, 14, NULL, 4, 4, 4, 318, '2020-01-13 17:40:49.364391', 2, 0, 0, 0, '2001130004702', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (181, 1.0, 4, NULL, 15, 4, 5, 4, 4, 314, '2020-01-13 18:53:27.749208', 0, 0, 0, 0, '2001130004812', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (182, 1.5, 2, NULL, 13, 4, 4, 4, 4, 320, '2020-01-13 19:01:55.352667', 2, 2, 1, 1, '2001130004859', 4, 0, NULL, 1);
INSERT INTO `group_order` VALUES (183, 1.0, 4, NULL, 2, 4, 1, 4, 4, 316, '2020-01-14 16:27:21.550638', 0, 0, 0, 1, '2001140004934', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (184, 0.8, 2, NULL, 13, 4, 4, 4, 4, 320, '2020-01-14 16:44:15.381393', 2, 2, 1, 1, '2001130004859', 4, 0, NULL, 1);
INSERT INTO `group_order` VALUES (185, 1.0, 6, NULL, 1, NULL, 1, 4, 4, 342, '2020-01-14 17:02:13.873309', 1, 1, 0, 0, '2001140004248', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (186, 1.0, 2, NULL, 2, 4, 1, 4, 4, 316, '2020-01-14 17:03:30.571336', 0, 1, 0, 1, '2001140004934', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (187, 1.0, 4, NULL, 1, 4, 1, 4, 4, 280, '2020-01-14 17:16:35.695541', 0, 0, 0, 0, '2001140004741', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (188, 1.0, 6, NULL, 1, NULL, 1, 4, 4, 282, '2020-01-14 17:21:38.064698', 0, 1, 0, 0, '2001140004327', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (189, 1.0, 6, NULL, 1, NULL, 1, 4, 4, 282, '2020-01-14 17:22:51.813376', 1, 1, 0, 0, '2001140004135', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (190, 1.0, 6, NULL, 1, NULL, 1, 4, 4, 282, '2020-01-14 17:23:12.070289', 1, 1, 0, 0, '2001140004095', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (192, 1.0, 4, NULL, 1, 4, 1, 4, 4, 280, '2020-01-15 14:54:24.145251', 0, 0, 0, 0, '2001140004741', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (193, 1.5, 6, NULL, 12, NULL, 3, 4, 4, 281, '2020-01-15 14:57:21.486140', 2, 1, 0, 0, '2001150004490', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (194, 1.5, 4, NULL, 12, NULL, 3, 4, 4, 281, '2020-01-15 15:00:13.069704', 2, 0, 0, 0, '2001150004284', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (195, 1.5, 4, NULL, 12, NULL, 3, 4, 4, 281, '2020-01-15 15:00:53.486416', 2, 0, 0, 0, '2001150004901', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (196, 1.5, 4, NULL, 12, NULL, 3, 4, 4, 281, '2020-01-15 15:03:40.503634', 2, 0, 0, 0, '2001150004431', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (197, 1.5, 4, NULL, 12, NULL, 3, 4, 4, 281, '2020-01-15 15:04:33.191115', 2, 0, 0, 0, '2001150004159', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (198, 1.5, 6, NULL, 3, NULL, 1, 4, 4, 280, '2020-01-15 15:08:29.135846', 2, 1, 0, 0, '2001150004256', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (199, 1.5, 6, NULL, 3, NULL, 1, 4, 4, 316, '2020-01-15 15:10:19.848569', 2, 1, 0, 0, '2001150004578', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (200, 1.5, 6, NULL, 3, NULL, 1, 4, 4, 315, '2020-01-15 15:12:23.581062', 2, 1, 0, 0, '2001150004895', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (201, 1.5, 6, NULL, 3, NULL, 1, 4, 4, 318, '2020-01-15 15:13:40.994070', 2, 1, 0, 0, '2001150004831', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (202, 1.5, 4, NULL, 3, NULL, 1, 4, 4, 316, '2020-01-15 15:15:20.527355', 2, 0, 0, 0, '2001150004359', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (203, 1.5, 4, NULL, 3, NULL, 1, 4, 4, 315, '2020-01-15 15:16:38.763827', 2, 0, 0, 0, '2001150004026', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (204, 1.5, 4, NULL, 3, NULL, 1, 4, 4, 313, '2020-01-15 15:18:10.896754', 2, 0, 0, 0, '2001150004725', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (205, 1.5, 6, NULL, 3, NULL, 1, 4, 4, 283, '2020-01-15 15:20:51.992952', 2, 1, 0, 0, '2001150004654', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (206, 1.5, 4, NULL, 3, NULL, 1, 4, 4, 316, '2020-01-15 15:21:33.364732', 2, 0, 0, 0, '2001150004827', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (207, 1.5, 4, NULL, 3, NULL, 1, 4, 4, 283, '2020-01-15 15:22:14.808172', 2, 0, 0, 0, '2001150004852', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (208, 1.5, 6, NULL, 1, NULL, 1, 4, 4, 285, '2020-01-16 15:34:27.190503', 2, 1, 0, 0, '2001160004754', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (209, 1.0, 4, NULL, 1, NULL, 1, 4, 12, 289, '2020-01-18 16:55:29.486621', 0, 0, 0, 0, '2001180012046', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (210, 1.0, 4, NULL, 9, 3, 3, 4, 12, 290, '2020-01-18 16:58:32.678585', 0, 0, 0, 0, '2001180012096', NULL, 0, NULL, 1);
INSERT INTO `group_order` VALUES (211, 1.0, 2, NULL, 9, 12, 3, 4, 3, 290, '2020-01-18 17:02:25.499255', 0, 1, 0, 1, '2001180012096', 5, 0, NULL, 1);
INSERT INTO `group_order` VALUES (217, 1.0, 5, NULL, 9, 4, 3, 4, 4, 364, '2020-05-31 11:36:09.230645', 0, 0, 0, 0, '2005310004394', NULL, 0, '2020-06-06 16:00:00.000000', 1);
INSERT INTO `group_order` VALUES (218, 1.0, 2, NULL, 15, 3, 5, 4, 4, 365, '2020-05-31 12:33:43.000161', 0, 0, 0, 0, '2005310004231', NULL, 0, '2020-06-06 17:00:00.000000', 0);
INSERT INTO `group_order` VALUES (219, 1.0, 6, NULL, 14, NULL, 4, 4, 4, 366, '2020-05-31 12:34:09.066259', 1, 0, 0, 0, '2005310004802', NULL, 0, '2020-06-06 18:00:00.000000', 0);
INSERT INTO `group_order` VALUES (220, 1.0, 2, NULL, 9, 4, 3, 4, 4, 364, '2020-05-31 12:34:30.694309', 0, 0, 0, 0, '2005310004394', NULL, 0, NULL, 0);
INSERT INTO `group_order` VALUES (221, 1.0, 2, NULL, 1, 4, 1, 4, 3, 367, '2020-05-31 13:08:57.515612', 0, 0, 0, 0, '2005310003264', NULL, 0, '2020-06-06 19:00:00.000000', 0);
INSERT INTO `group_order` VALUES (222, 1.0, 2, NULL, 1, 3, 1, 4, 4, 367, '2020-05-31 13:09:17.043268', 0, 0, 0, 0, '2005310003264', NULL, 0, NULL, 0);
INSERT INTO `group_order` VALUES (223, 1.0, 1, NULL, 15, 4, 5, 4, 3, 365, '2020-05-31 13:40:55.100730', 0, 0, 0, 0, '2005310004231', NULL, 0, NULL, 0);
INSERT INTO `group_order` VALUES (224, 1.0, 1, NULL, 14, 4, 4, 4, 3, 368, '2020-05-31 13:42:53.597171', 0, 0, 0, 0, '2005310003417', NULL, 0, '2020-06-06 20:00:00.000000', 0);
INSERT INTO `group_order` VALUES (225, 1.0, 6, NULL, 9, NULL, 3, 4, 4, 397, '2020-05-31 15:31:18.908357', 0, 0, 0, 0, '2005310004743', NULL, 0, '2020-05-31 22:00:00.000000', 0);
INSERT INTO `group_order` VALUES (226, 1.0, 2, NULL, 14, 3, 4, 4, 4, 368, '2020-05-31 16:35:57.741776', 0, 0, 0, 0, '2005310003417', NULL, 0, NULL, 0);
INSERT INTO `group_order` VALUES (227, 1.0, 6, NULL, 2, NULL, 1, 4, 4, 372, '2020-05-31 22:13:46.890380', 0, 0, 0, 0, '2005310004504', NULL, 0, '2020-06-01 11:00:00.000000', 0);
INSERT INTO `group_order` VALUES (228, 1.0, 6, NULL, 3, NULL, 1, 4, 4, 399, '2020-07-06 15:40:19.142857', 0, 0, 0, 0, '2007060004925', NULL, 0, '2020-07-10 13:00:00.000000', 0);
INSERT INTO `group_order` VALUES (229, 1.0, 0, NULL, 1, NULL, 1, 4, 4, 444, '2020-12-24 18:47:32.877213', 0, 0, 0, 0, '2012240004895', NULL, 0, '2021-01-09 15:00:00.000000', 0);
INSERT INTO `group_order` VALUES (230, 1.0, 0, NULL, 10, NULL, 1, 4, 4, 457, '2020-12-24 18:47:53.734191', 0, 0, 0, 0, '2012240004350', NULL, 0, '2021-01-08 16:00:00.000000', 0);
INSERT INTO `group_order` VALUES (231, 1.0, 0, NULL, 12, NULL, 3, 4, 4, 448, '2020-12-24 18:48:16.512878', 0, 0, 0, 0, '2012240004049', NULL, 0, '2021-01-09 19:00:00.000000', 0);
COMMIT;

-- ----------------------------
-- Table structure for group_relation
-- ----------------------------
DROP TABLE IF EXISTS `group_relation`;
CREATE TABLE `group_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` int(11) NOT NULL,
  `u_id_id` int(11) NOT NULL,
  `is_card` tinyint(1) NOT NULL,
  `is_sub` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_relation_reference_id_052890ad_fk_group_user_id` (`reference_id`),
  KEY `group_relation_u_id_id_fcb78fe9_fk_group_user_id` (`u_id_id`),
  CONSTRAINT `group_relation_reference_id_052890ad_fk_group_user_id` FOREIGN KEY (`reference_id`) REFERENCES `group_user` (`id`),
  CONSTRAINT `group_relation_u_id_id_fcb78fe9_fk_group_user_id` FOREIGN KEY (`u_id_id`) REFERENCES `group_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_relation
-- ----------------------------
BEGIN;
INSERT INTO `group_relation` VALUES (1, 2, 3, 0, 0, '2019-10-05 15:07:45.499519');
COMMIT;

-- ----------------------------
-- Table structure for group_sort
-- ----------------------------
DROP TABLE IF EXISTS `group_sort`;
CREATE TABLE `group_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_sort
-- ----------------------------
BEGIN;
INSERT INTO `group_sort` VALUES (1, '商务英语');
INSERT INTO `group_sort` VALUES (2, '旅行英语');
INSERT INTO `group_sort` VALUES (3, '职场英语');
INSERT INTO `group_sort` VALUES (13, 'office english');
COMMIT;

-- ----------------------------
-- Table structure for group_subject
-- ----------------------------
DROP TABLE IF EXISTS `group_subject`;
CREATE TABLE `group_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `main` varchar(200) NOT NULL,
  `sort_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_subject_sort_id_9453b140_fk_group_sort_id` (`sort_id`),
  CONSTRAINT `group_subject_sort_id_9453b140_fk_group_sort_id` FOREIGN KEY (`sort_id`) REFERENCES `group_sort` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_subject
-- ----------------------------
BEGIN;
INSERT INTO `group_subject` VALUES (1, '精听歌曲学英语', 'D51DF16EA03474B26D8B33A1B4C3909F.jpg', 1);
INSERT INTO `group_subject` VALUES (3, '职场英语必备——一歌一词一习语（初级）', '6840B63281595DC256073DD9AE8A31EA.jpg', 1);
INSERT INTO `group_subject` VALUES (4, '和外教中教一起学英语口语', '461D518C088AAECC7035CACB95B5737E.jpg', 1);
INSERT INTO `group_subject` VALUES (5, '旅游英语口语', 'DF35DAB4B8018B38BE90A541DABE5DE2.jpg', 1);
INSERT INTO `group_subject` VALUES (6, 'zheng qi', 'psb_41dY57I.jpeg', 1);
INSERT INTO `group_subject` VALUES (7, 'office1', 'qrcode.jpg', 13);
COMMIT;

-- ----------------------------
-- Table structure for group_user
-- ----------------------------
DROP TABLE IF EXISTS `group_user`;
CREATE TABLE `group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(200) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `wx_name` varchar(32) NOT NULL,
  `openid` varchar(32) NOT NULL,
  `key` varchar(50) NOT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `wx_num` varchar(100) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `edu` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `ocp` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `wsk` int(11) DEFAULT NULL,
  `industry_id` int(11) DEFAULT NULL,
  `content` longtext,
  `sign` varchar(100) DEFAULT NULL,
  `utype` smallint(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`),
  KEY `group_user_industry_id_a847320b_fk_group_occupation_id` (`industry_id`),
  CONSTRAINT `group_user_industry_id_a847320b_fk_group_occupation_id` FOREIGN KEY (`industry_id`) REFERENCES `group_industry` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_user
-- ----------------------------
BEGIN;
INSERT INTO `group_user` VALUES (1, '', NULL, NULL, NULL, NULL, '', 'oPx4Q5QFEiKEtyTHtHQjvlCNMN9M', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2019-09-15 02:46:36.411078');
INSERT INTO `group_user` VALUES (2, '', NULL, NULL, NULL, NULL, '', 'oPx4Q5ULNkbtllBiWT27RwD_z-S4', 'vZKwG2WkyDcB/NvzEzVX/Q==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2019-09-15 02:46:36.411078');
INSERT INTO `group_user` VALUES (3, 'a4f3afaa35e111ea9fd800163e0e1f4f.png', '15088661324', '1995-08-31', 1, '学生', 'VIE_chess', 'o8h_F5NTTRWY7zkgWaHN2ToDV2Zo', 'MVYUFHl+pNZU7PK0FTEr3A==', '001@w.com', 'somnus', '', 5, 7, 1, 2, 4, 10, 'R', '生命不息!学习不惜！', 1, '2019-09-15 02:46:36.411078');
INSERT INTO `group_user` VALUES (4, 'a3054bf211df11ea990200163e0e1f4f.png', '18268891324', '1995-01-13', 1, 'aeclub', '争棋🖤', 'o8h_F5OMduuWtMw7EPaJ_MSgHwgI', 'ZI+7wVxGkMMM0f8LcY64pQ==', '11@zhengqi1995.com', 'cdscd', 'Hangzhou', 4, 12, 2, 2, 3, 15, '我是一个特别喜欢英语的老师，曾经出国留学4年多，能保证正常交流，希望我把我的歇息才打开手机才看到路上从 成都市从上档次看德川家康的好处跨境电商查看从打开市场跨境电商', 'cdscsd', 2, '2019-10-29 19:38:11.412786');
INSERT INTO `group_user` VALUES (5, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5N9RUq7vw8004H50DlXBm5w', '+qNZJ5+kBTzKdJQ+whoxuA==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-11-28 20:40:17.715995');
INSERT INTO `group_user` VALUES (6, 'b99d4f3a1fff11eab88100163e0e1f4f.png', NULL, NULL, 0, NULL, '超_越梦想', 'o8h_F5AzjLbbDLd8AEOip66937-U', 'LKQw5YcgWDidPAF6g/lZzQ==', NULL, NULL, 'Yantai', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-11-28 20:40:18.636315');
INSERT INTO `group_user` VALUES (7, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5LNhr05mJpqywxEHv13eaOU', '+cXe9oJVSO3UZuJPM8aBsw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-11-28 22:04:06.795389');
INSERT INTO `group_user` VALUES (8, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5FhAhTTJVyhvZO9WDEMzt94', 'XeQV/Vw47yuSy73ZdwdJZg==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-11-28 22:45:31.189438');
INSERT INTO `group_user` VALUES (9, '41041a3c124811eab5f200163e0e1f4f.png', NULL, NULL, 0, NULL, '满天星', 'o8h_F5INWQy-0ek6HdgFOOD7qI04', '901l/lHD5nmyquMQvn7Eyw==', NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-11-29 09:32:28.110926');
INSERT INTO `group_user` VALUES (10, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5C9JkbxI981bDI8NQPR85w4', '4kz727dl3BtaGl0j3aE2Bg==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-11-29 09:32:28.121661');
INSERT INTO `group_user` VALUES (11, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5NHDYl1HhtzbI07xV6JXATs', '0AyTISqXlgjo5qu1rlJDnw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-11-29 10:19:45.212310');
INSERT INTO `group_user` VALUES (12, '', '13456888141', '1995-01-18', 1, 'zhu', 'AECLUB默认用户', 'o8h_F5PXJYNXDAKMM3M3YeJrVn-8', 'U920dosVEPusqqOA2uKIIg==', 'hzxl.zhu@gmail.com', '', NULL, 5, NULL, NULL, NULL, 4, NULL, 'hellohelo', '', 2, '2019-11-29 12:53:34.900841');
INSERT INTO `group_user` VALUES (13, '77cc23221ffc11ea9a8a00163e0e1f4f.png', NULL, NULL, 0, NULL, 'nick', 'o8h_F5Of6qJyFLhJ8FuM0vdTCWx4', 'Hi7nwu7GKs3jPa2BlY0BlQ==', NULL, NULL, 'Qingdao', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-12-16 20:05:04.525213');
INSERT INTO `group_user` VALUES (14, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5EZGPlPgosqN7StE4eP9QGE', 'KecrfuHIPPP0BU5jxBizcg==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-12-16 20:05:04.589387');
INSERT INTO `group_user` VALUES (15, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5ImsgYiFVuTrsQ0vRXth8_s', '3/zcpA9RyeXbSG0j5rNpIg==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-12-16 20:28:23.432828');
INSERT INTO `group_user` VALUES (16, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5C3mD3Yz-qRHgVrKVXNaH7Q', 'ETO3HcbXBIsEG/wxQiZGNw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-12-17 13:04:47.152069');
INSERT INTO `group_user` VALUES (17, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5JGtgw3UzobkNl_o68jpo3I', 'j6hPIHDE7fwUJdK7jt30ww==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-12-18 10:26:20.631724');
INSERT INTO `group_user` VALUES (18, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5ME1TsaJ_5QMUPgD9GpOGeU', '+qfiPdRqBrOSzUsKdzsimA==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-12-21 07:15:36.927818');
INSERT INTO `group_user` VALUES (19, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5FZyXmmEI0GnSYqzbtWRAVM', '5ejF9mGE/2Am69EI6E7I8g==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-12-26 10:14:14.603242');
INSERT INTO `group_user` VALUES (20, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5M-7JU6QAwLYJ1IDRThODCQ', 'aH7tpVut/lGlOUld/sTmTw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2019-12-28 04:12:20.655649');
INSERT INTO `group_user` VALUES (21, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5D9Z47WhRk161cT3f_bn4Lk', 'VnrD9hcC0NPGh0MMyzVXZQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-01-07 13:05:38.842326');
INSERT INTO `group_user` VALUES (22, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5Mtbo-xNX26bPUCeQFtGDh8', 'Jf0aygxVxutVdtNWVCbY3w==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-01-11 07:30:58.922486');
INSERT INTO `group_user` VALUES (23, 'aea7ff2c344411eabbcf00163e0e1f4f.png', NULL, NULL, 1, NULL, '泡泡', 'o8h_F5J3JLMKQztCM571RPj1v4co', '+mYP93S7AL/QFk4Cft8EQw==', NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-01-11 15:33:36.455350');
INSERT INTO `group_user` VALUES (24, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5G6otC6p19skpODK198K9IE', 'fAbZPC45b/4PleZB4NInQA==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-01-16 15:53:19.677803');
INSERT INTO `group_user` VALUES (25, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5E9PT_YmSzFhqWsdCZMj_4w', 'XBqDycs8GhnjlhavgoMPWQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-01-17 11:09:45.306208');
INSERT INTO `group_user` VALUES (26, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5GukueVywEo8vCWPwZAFEzg', 'p8qTDX2I9Lw9pM7ljOA0KQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-01-18 05:21:22.246270');
INSERT INTO `group_user` VALUES (27, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5DmssiJUP_8EpYzd9HF9UPY', 'Y1rBPXxvpB0ItS5krVeHPw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-01-20 01:36:42.912436');
INSERT INTO `group_user` VALUES (28, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5ORuZUJ3loHUdXNjpkyJImw', 'rTPYKXKaFg3Ru23icNL6Pw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-01-21 19:54:36.214446');
INSERT INTO `group_user` VALUES (29, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5BXnlOeZlBtiEJ--ACuL6IY', 'mWyta9X7s8+XgnvK8CtYKg==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-01-21 19:54:40.839749');
INSERT INTO `group_user` VALUES (30, '', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5HYX1jTSzWaPnDY3YCgM0Ac', '2xW5PSYnaK4d7+PnifxeKw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-01-25 03:40:21.882861');
INSERT INTO `group_user` VALUES (31, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5Ayd3ocC7DIyqSBvT3m_kJk', 'K2HaBe6j/X81VviueIJKFA==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-02-01 08:28:03.587838');
INSERT INTO `group_user` VALUES (32, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5ODGtl0SWiyVUWOwsMIfilA', 'k3K8xijyz1lihNH4QJfilg==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-02-03 22:01:24.763403');
INSERT INTO `group_user` VALUES (33, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5D131nzECl0VvObn7C_ID2Y', 'NazcPr6k6ZhrIw1FSc5dDQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-02-08 07:35:06.211434');
INSERT INTO `group_user` VALUES (34, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5MYii2EKi5Bi_PmbF7lpzrI', 'o4a2C/RV+JZEI5FgkOHYYg==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-02-10 21:48:36.498766');
INSERT INTO `group_user` VALUES (35, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5LO-zoz_S5etpbN9gBdvU2g', 'OVid/OwuiVzKk/2j7fUxaQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-02-29 20:28:05.863534');
INSERT INTO `group_user` VALUES (36, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5D2fTQ6Hv0lA1FlBjy2UKKk', 'YXvpq+rNJ1UmR9xxb+cM/w==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-03-08 23:20:24.428762');
INSERT INTO `group_user` VALUES (37, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5HymoN1RIStCRYXGf_BNAbI', 'Xpswweq3GfXuTuQhohpN6w==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-03-10 09:22:54.147086');
INSERT INTO `group_user` VALUES (38, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5G9X47Z6IejiJQ4kT_zrlVg', 'THJhV8BK1OxZEl+2Ba6P2w==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-03-14 05:24:48.540446');
INSERT INTO `group_user` VALUES (39, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5NlzXv39_NdyF8ESqXCX4zE', 'cVm+YKVwg+KZbrpV4fDzRA==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-03-21 08:50:52.730050');
INSERT INTO `group_user` VALUES (40, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5ItLcmdqnRuLq_l3JcbyMeQ', 'av9ukbKDk7+rN0yWy17Q3w==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-03-28 13:41:23.757100');
INSERT INTO `group_user` VALUES (41, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5Fkum8of7_-G_bcCkVum-Tg', 'oqF+fFmq2wy6tlA1JPL99g==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-04-04 21:32:12.797309');
INSERT INTO `group_user` VALUES (42, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5MFGs95QHYHfyltiCTy2-Cw', '6/9PWIOZIgUs6dF9YYh1nA==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-04-11 19:04:15.185363');
INSERT INTO `group_user` VALUES (43, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5MrlbC2ymAZsLhZYLxavnog', '/lGjmZwJA1zLFjFTxWQF3A==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-04-12 01:18:22.721916');
INSERT INTO `group_user` VALUES (44, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5FP01Lhfh1mJmjcF6tNaVEU', 'iS0FJsJgnzA95vG9PvcgJQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-04-18 18:15:50.177064');
INSERT INTO `group_user` VALUES (45, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5CtUyTLNUJnLi4K2Ohqy-SA', 'fPBsmtEA9kwEO/1KOCrkEw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-04-27 04:44:30.717171');
INSERT INTO `group_user` VALUES (46, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5NVi2RzZqAWY1qZGCVNwy64', 'VGFL74DPlWFDoH3pGfELgQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-04-27 19:24:09.883731');
INSERT INTO `group_user` VALUES (47, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5N-b1sslUOpOnshjaLxj9xs', 'uLRCFW578Uf5C2r3tu42Zw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-05-02 14:59:38.538174');
INSERT INTO `group_user` VALUES (48, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5EFdDtPkt95QT6rSjmB8wVM', 'KWUKtgxssQGJN2JweYU9vQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-05-10 17:07:51.175022');
INSERT INTO `group_user` VALUES (49, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5DrNx7RQfQW35UqJU6gSLF8', 'Zy2i0lI7UARPzLt9D8oZLg==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-05-16 16:15:40.919995');
INSERT INTO `group_user` VALUES (50, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5IGUh1sjin-RYEqb7r84Lo4', 'xoP2ggZk32JK4nvfbNdPPQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-05-23 08:45:53.635043');
INSERT INTO `group_user` VALUES (51, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5NKDyaSXx4SzlqeNYXeyf6k', 'fwEALcZsHVrko+N58SGWiw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-05-30 19:19:23.713620');
INSERT INTO `group_user` VALUES (52, 'basicprofile.jpeg', '', NULL, NULL, '', 'AECLUB默认用户', 'o8h_F5EHyVh9UQnUmCCbj2NldB30', 'WmjHNZ2iyrhwE9cBM0ujtQ==', '', '', NULL, NULL, NULL, NULL, NULL, 0, 1, '', '', 1, '2020-05-31 16:42:13.445609');
INSERT INTO `group_user` VALUES (53, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5MMXFqgT5VZPnH-PUYUJ3Oo', 'xG4ukbP7sHWo+ySnI9xCxA==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-05-31 16:42:23.024528');
INSERT INTO `group_user` VALUES (54, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5MqOpFadTRWSl4vyVRV2vbI', '1ZCkOciEzpAz2+OwHGIyrw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-06-01 08:41:23.871915');
INSERT INTO `group_user` VALUES (55, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5GW1eUIpxNsQ-tmLL_6wEMk', '1ttQgUCPV9ojC2JO/PrXAw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-06-04 15:22:47.854391');
INSERT INTO `group_user` VALUES (56, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5DlrWlUEkWCk29FWJS8VEjM', 'yDDfTCFrKNf+uyzqT/s+qw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-06-06 18:25:37.720024');
INSERT INTO `group_user` VALUES (57, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5Af7mEwMJ44yeZsbfQ6wywQ', '+dUPKAHAbgG5qw9I4Hy8FA==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-06-13 12:11:04.818544');
INSERT INTO `group_user` VALUES (58, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5NncvhrP0rPjCnPIUfUCk5I', 'OelDkkmpjIt2a1WE/qPsxw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-06-20 02:10:58.883098');
INSERT INTO `group_user` VALUES (59, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5H8K4PGF2_LQU7YT45i0cWI', 'O6qusp2pQN1r3muaefkpJQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-06-27 04:18:52.090164');
INSERT INTO `group_user` VALUES (60, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5KTQL0LoFGvH9yeZak80TfE', 'QF5VYYk/uVCFtyHXbuLJDA==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-07-04 04:06:38.794884');
INSERT INTO `group_user` VALUES (61, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5AD609__xdlIpHNqDR8rLlE', 'NRmzeUQaGWLoTrAoZrqIOA==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-07-11 16:39:17.970001');
INSERT INTO `group_user` VALUES (62, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5NJo7pVTyhgg0_Mwr6rx0Vw', 'ULLF6uelXIjf3h9yc/M2Dg==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-07-18 16:56:13.648378');
INSERT INTO `group_user` VALUES (63, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5BXpk-KQt80iRgnQ2wGeIP4', 'IuqLkJ5xFvukoOHrJjVDSg==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-07-21 16:03:51.145714');
INSERT INTO `group_user` VALUES (64, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5JJdly8PFYeWadypT7x3Vyg', '3aGmjWXX7iz3pesZMPydvA==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-07-25 13:47:03.130762');
INSERT INTO `group_user` VALUES (65, 'basicprofile.jpeg', NULL, NULL, NULL, NULL, 'AECLUB默认用户', 'o8h_F5DodLNQhBoLLBWXxiZ_dwYQ', '3Zf+2ORO6NyF3l0Y+8fifQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2020-08-03 14:58:54.730087');
COMMIT;

-- ----------------------------
-- Table structure for group_user_account
-- ----------------------------
DROP TABLE IF EXISTS `group_user_account`;
CREATE TABLE `group_user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_user_account_user_id_1f1510f7_fk_group_user_id` (`user_id`),
  CONSTRAINT `group_user_account_user_id_1f1510f7_fk_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `group_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_user_account
-- ----------------------------
BEGIN;
INSERT INTO `group_user_account` VALUES (1, 'text', '123456', 3);
COMMIT;

-- ----------------------------
-- Table structure for group_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `group_user_detail`;
CREATE TABLE `group_user_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_user_detail_user_id_f9f11900_fk_group_user_id` (`user_id`),
  CONSTRAINT `group_user_detail_user_id_f9f11900_fk_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `group_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_user_detail
-- ----------------------------
BEGIN;
INSERT INTO `group_user_detail` VALUES (1, 'image/Fj4MALa7zOIAaSypMotlnA7KuZJU.png', 3);
INSERT INTO `group_user_detail` VALUES (14, 'image/FplfL1IdfGPyvOqFblPTI3UD2ItV.jpeg', 4);
COMMIT;

-- ----------------------------
-- Table structure for jet_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `jet_bookmark`;
CREATE TABLE `jet_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date_add` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jet_bookmark
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jet_pinnedapplication
-- ----------------------------
DROP TABLE IF EXISTS `jet_pinnedapplication`;
CREATE TABLE `jet_pinnedapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(255) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date_add` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jet_pinnedapplication
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
