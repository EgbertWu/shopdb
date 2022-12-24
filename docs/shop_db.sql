/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.97.100
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 192.168.97.100:3306
 Source Schema         : shop_db

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 08/03/2023 14:01:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问对象id',
  `title` varchar(50) NOT NULL COMMENT '角色名',
  `urls` varchar(1000) NOT NULL COMMENT '可授权的url',
  `status` int NOT NULL COMMENT '状态',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='访问授权表';

-- ----------------------------
-- Records of access
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for app_access_log
-- ----------------------------
DROP TABLE IF EXISTS `app_access_log`;
CREATE TABLE `app_access_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL DEFAULT '0' COMMENT 'uid',
  `referer_url` varchar(255) NOT NULL DEFAULT '' COMMENT '当前访问的refer',
  `target_url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问的url',
  `query_params` text NOT NULL COMMENT 'get和post参数',
  `ua` varchar(255) NOT NULL DEFAULT '' COMMENT '访问ua',
  `ip` varchar(32) NOT NULL DEFAULT '' COMMENT '访问ip',
  `note` varchar(1000) NOT NULL DEFAULT '' COMMENT 'json格式备注字段',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户访问记录表';

-- ----------------------------
-- Records of app_access_log
-- ----------------------------
BEGIN;
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (1, 0, '', 'http://192.168.97.100:8888/', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 01:57:19');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (2, 0, '', 'http://192.168.97.100:8888/user/login', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 01:57:19');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (3, 0, 'http://192.168.97.100:8888/user/login', 'http://192.168.97.100:8888/user/login', '{\"login_name\": \"egbert\", \"login_pwd\": \"123456\"}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 01:58:21');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (4, 0, '', 'http://192.168.97.100:8888/user/login', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:25:10');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (5, 0, 'http://192.168.97.100:8888/user/login', 'http://192.168.97.100:8888/user/login', '{\"login_name\": \"egbert\", \"login_pwd\": \"123456\"}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:25:20');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (6, 0, '', 'http://192.168.97.100:8888/user/login', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:29:39');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (7, 0, 'http://192.168.97.100:8888/user/login', 'http://192.168.97.100:8888/user/login', '{\"login_name\": \"egbert\", \"login_pwd\": \"123456\"}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:29:46');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (8, 1, 'http://192.168.97.100:8888/user/login', 'http://192.168.97.100:8888/', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:29:47');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (9, 1, 'http://192.168.97.100:8888/', 'http://192.168.97.100:8888/chart/dashboard', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:29:47');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (10, 1, 'http://192.168.97.100:8888/', 'http://192.168.97.100:8888/chart/finance', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:29:47');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (11, 1, 'http://192.168.97.100:8888/', 'http://192.168.97.100:8888/account/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:29:55');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (12, 1, 'http://192.168.97.100:8888/account/index', 'http://192.168.97.100:8888/food/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:29:57');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (13, 1, 'http://192.168.97.100:8888/account/index', 'http://192.168.97.100:8888/member/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:30:03');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (14, 1, 'http://192.168.97.100:8888/member/index', 'http://192.168.97.100:8888/finance/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:30:05');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (15, 1, 'http://192.168.97.100:8888/finance/index', 'http://192.168.97.100:8888/stat/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:30:07');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (16, 1, 'http://192.168.97.100:8888/stat/index', 'http://192.168.97.100:8888/chart/finance', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:30:07');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (17, 1, 'http://192.168.97.100:8888/stat/index', 'http://192.168.97.100:8888/stat/food', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:30:08');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (18, 1, 'http://192.168.97.100:8888/stat/food', 'http://192.168.97.100:8888/stat/member', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:30:09');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (19, 1, 'http://192.168.97.100:8888/stat/member', 'http://192.168.97.100:8888/stat/food', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:30:10');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (20, 1, 'http://192.168.97.100:8888/stat/food', 'http://192.168.97.100:8888/stat/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:30:10');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (21, 1, 'http://192.168.97.100:8888/stat/index', 'http://192.168.97.100:8888/chart/finance', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:30:11');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (22, 1, 'http://192.168.97.100:8888/stat/index', 'http://192.168.97.100:8888/account/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:30:11');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (23, 1, 'http://192.168.97.100:8888/account/index', 'http://192.168.97.100:8888/role/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:30:17');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (24, 1, 'http://192.168.97.100:8888/role/index', 'http://192.168.97.100:8888/access/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:30:19');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (25, 1, '', 'http://192.168.97.100:8888/access/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:31:37');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (26, 1, 'http://192.168.97.100:8888/access/index', 'http://192.168.97.100:8888/role/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:31:40');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (27, 1, 'http://192.168.97.100:8888/role/index', 'http://192.168.97.100:8888/account/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:31:41');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (28, 1, 'http://192.168.97.100:8888/account/index', 'http://192.168.97.100:8888/role/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:31:41');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (29, 1, 'http://192.168.97.100:8888/role/index', 'http://192.168.97.100:8888/access/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:31:42');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (30, 1, 'http://192.168.97.100:8888/access/index', 'http://192.168.97.100:8888/food/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:31:43');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (31, 1, '', 'http://192.168.97.100:8888/food/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:36:29');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (32, 1, '', 'http://192.168.97.100:8888/food/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:36:56');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (33, 1, 'http://192.168.97.100:8888/access/index', 'http://192.168.97.100:8888/food/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:17');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (34, 1, 'http://192.168.97.100:8888/food/index', 'http://192.168.97.100:8888/food/cat', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:19');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (35, 1, 'http://192.168.97.100:8888/food/cat', 'http://192.168.97.100:8888/food/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:20');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (36, 1, 'http://192.168.97.100:8888/food/index', 'http://192.168.97.100:8888/food/cat', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:22');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (37, 1, 'http://192.168.97.100:8888/food/cat', 'http://192.168.97.100:8888/food/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:23');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (38, 1, 'http://192.168.97.100:8888/food/index', 'http://192.168.97.100:8888/member/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:33');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (39, 1, 'http://192.168.97.100:8888/member/index', 'http://192.168.97.100:8888/finance/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:34');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (40, 1, 'http://192.168.97.100:8888/finance/index', 'http://192.168.97.100:8888/stat/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:35');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (41, 1, 'http://192.168.97.100:8888/stat/index', 'http://192.168.97.100:8888/chart/finance', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:35');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (42, 1, 'http://192.168.97.100:8888/stat/index', 'http://192.168.97.100:8888/', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:40');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (43, 1, 'http://192.168.97.100:8888/', 'http://192.168.97.100:8888/chart/dashboard', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:40');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (44, 1, 'http://192.168.97.100:8888/', 'http://192.168.97.100:8888/chart/finance', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:40');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (45, 1, 'http://192.168.97.100:8888/', 'http://192.168.97.100:8888/account/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:44');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (46, 1, 'http://192.168.97.100:8888/account/index', 'http://192.168.97.100:8888/food/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:45');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (47, 1, 'http://192.168.97.100:8888/food/index', 'http://192.168.97.100:8888/member/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:46');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (48, 1, 'http://192.168.97.100:8888/member/index', 'http://192.168.97.100:8888/finance/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:46');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (49, 1, 'http://192.168.97.100:8888/finance/index', 'http://192.168.97.100:8888/stat/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:47');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (50, 1, 'http://192.168.97.100:8888/stat/index', 'http://192.168.97.100:8888/chart/finance', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:47');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (51, 1, 'http://192.168.97.100:8888/stat/index', 'http://192.168.97.100:8888/food/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:52');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (52, 1, 'http://192.168.97.100:8888/food/index', 'http://192.168.97.100:8888/food/set', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:59');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (53, 1, 'http://192.168.97.100:8888/food/set', 'http://192.168.97.100:8888/upload/ueditor?action=config&&noCache=1678251999129', '{\"action\": \"config\", \"noCache\": \"1678251999129\"}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:37:59');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (54, 1, 'http://192.168.97.100:8888/food/set', 'http://192.168.97.100:8888/food/cat', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:21');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (55, 1, 'http://192.168.97.100:8888/food/cat', 'http://192.168.97.100:8888/account/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:23');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (56, 1, 'http://192.168.97.100:8888/account/index', 'http://192.168.97.100:8888/stat/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:25');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (57, 1, 'http://192.168.97.100:8888/stat/index', 'http://192.168.97.100:8888/chart/finance', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:25');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (58, 1, 'http://192.168.97.100:8888/stat/index', 'http://192.168.97.100:8888/stat/food', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:27');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (59, 1, 'http://192.168.97.100:8888/stat/food', 'http://192.168.97.100:8888/stat/member', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:28');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (60, 1, 'http://192.168.97.100:8888/stat/member', 'http://192.168.97.100:8888/stat/share', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:29');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (61, 1, 'http://192.168.97.100:8888/stat/share', 'http://192.168.97.100:8888/chart/share', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:29');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (62, 1, 'http://192.168.97.100:8888/stat/share', 'http://192.168.97.100:8888/stat/share', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:32');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (63, 1, 'http://192.168.97.100:8888/stat/share', 'http://192.168.97.100:8888/chart/share', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:32');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (64, 1, 'http://192.168.97.100:8888/stat/share', 'http://192.168.97.100:8888/stat/share', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:33');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (65, 1, 'http://192.168.97.100:8888/stat/share', 'http://192.168.97.100:8888/chart/share', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:34');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (66, 1, 'http://192.168.97.100:8888/stat/share', 'http://192.168.97.100:8888/stat/share', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:34');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (67, 1, 'http://192.168.97.100:8888/stat/share', 'http://192.168.97.100:8888/chart/share', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:34');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (68, 1, 'http://192.168.97.100:8888/stat/share', 'http://192.168.97.100:8888/food/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:41');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (69, 1, 'http://192.168.97.100:8888/food/index', 'http://192.168.97.100:8888/', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:45');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (70, 1, 'http://192.168.97.100:8888/', 'http://192.168.97.100:8888/chart/dashboard', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:45');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (71, 1, 'http://192.168.97.100:8888/', 'http://192.168.97.100:8888/chart/finance', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:38:45');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (72, 1, 'http://192.168.97.100:8888/', 'http://192.168.97.100:8888/food/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:39:22');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (73, 1, 'http://192.168.97.100:8888/food/index', 'http://192.168.97.100:8888/member/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:39:29');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (74, 1, 'http://192.168.97.100:8888/member/index', 'http://192.168.97.100:8888/member/comment', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:39:33');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (75, 1, 'http://192.168.97.100:8888/member/comment', 'http://192.168.97.100:8888/member/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:39:34');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (76, 1, 'http://192.168.97.100:8888/member/index', 'http://192.168.97.100:8888/food/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:39:38');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (77, 1, 'http://192.168.97.100:8888/food/index', 'http://192.168.97.100:8888/food/set', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:39:40');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (78, 1, 'http://192.168.97.100:8888/food/set', 'http://192.168.97.100:8888/upload/ueditor?action=config&&noCache=1678252100878', '{\"action\": \"config\", \"noCache\": \"1678252100878\"}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:39:40');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (79, 1, 'http://192.168.97.100:8888/food/set', 'http://192.168.97.100:8888/finance/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:40:16');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (80, 1, 'http://192.168.97.100:8888/finance/index', 'http://192.168.97.100:8888/finance/account', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:40:19');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (81, 1, 'http://192.168.97.100:8888/finance/account', 'http://192.168.97.100:8888/finance/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:40:20');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (82, 1, 'http://192.168.97.100:8888/finance/index', 'http://192.168.97.100:8888/finance/account', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:40:20');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (83, 1, 'http://192.168.97.100:8888/finance/account', 'http://192.168.97.100:8888/finance/index', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:40:21');
INSERT INTO `app_access_log` (`id`, `uid`, `referer_url`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES (84, 1, 'http://192.168.97.100:8888/finance/index', 'http://192.168.97.100:8888/finance/account', '{}', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '192.168.97.1', '', '2022-12-25 03:40:24');
COMMIT;

-- ----------------------------
-- Table structure for app_error_log
-- ----------------------------
DROP TABLE IF EXISTS `app_error_log`;
CREATE TABLE `app_error_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `referer_url` varchar(255) NOT NULL DEFAULT '' COMMENT '当前访问的refer',
  `target_url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问的url',
  `query_params` text NOT NULL COMMENT 'get和post参数',
  `content` longtext NOT NULL COMMENT '日志内容',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='app错误日表';

-- ----------------------------
-- Records of app_error_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` int NOT NULL DEFAULT '0' COMMENT '分类id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '书籍名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售卖金额',
  `main_image` varchar(100) NOT NULL DEFAULT '' COMMENT '主图',
  `summary` varchar(10000) NOT NULL DEFAULT '' COMMENT '描述',
  `stock` int NOT NULL DEFAULT '0' COMMENT '库存量',
  `tags` varchar(200) NOT NULL DEFAULT '' COMMENT 'tag关键字，以","连接',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  `month_count` int NOT NULL DEFAULT '0' COMMENT '月销售数量',
  `total_count` int NOT NULL DEFAULT '0' COMMENT '总销售量',
  `view_count` int NOT NULL DEFAULT '0' COMMENT '总浏览次数',
  `comment_count` int NOT NULL DEFAULT '0' COMMENT '总评论量',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后插入时间',
  `recomm` int NOT NULL COMMENT '产品是否参与推广',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='食品表';

-- ----------------------------
-- Records of food
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for food_cat
-- ----------------------------
DROP TABLE IF EXISTS `food_cat`;
CREATE TABLE `food_cat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '类别名称',
  `weight` tinyint NOT NULL DEFAULT '1' COMMENT '权重',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='食品分类';

-- ----------------------------
-- Records of food_cat
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for food_sale_change_log
-- ----------------------------
DROP TABLE IF EXISTS `food_sale_change_log`;
CREATE TABLE `food_sale_change_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `food_id` int NOT NULL DEFAULT '0' COMMENT '商品id',
  `quantity` int NOT NULL DEFAULT '0' COMMENT '售卖数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售卖金额',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '会员id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '售卖时间',
  PRIMARY KEY (`id`),
  KEY `idx_food_id_id` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品销售情况';

-- ----------------------------
-- Records of food_sale_change_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for food_stock_change_log
-- ----------------------------
DROP TABLE IF EXISTS `food_stock_change_log`;
CREATE TABLE `food_stock_change_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `food_id` int NOT NULL COMMENT '商品id',
  `unit` int NOT NULL DEFAULT '0' COMMENT '变更多少',
  `total_stock` int NOT NULL DEFAULT '0' COMMENT '变更之后总量',
  `note` varchar(100) NOT NULL DEFAULT '' COMMENT '备注字段',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_food_id` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数据库存变更表';

-- ----------------------------
-- Records of food_stock_change_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_key` varchar(60) NOT NULL DEFAULT '' COMMENT '文件名',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of images
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '会员名',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '会员手机号码',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别 1：男 2：女',
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '会员头像',
  `salt` varchar(32) NOT NULL DEFAULT '' COMMENT '随机salt',
  `reg_ip` varchar(100) NOT NULL DEFAULT '' COMMENT '注册ip',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员表';

-- ----------------------------
-- Records of member
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for member_address
-- ----------------------------
DROP TABLE IF EXISTS `member_address`;
CREATE TABLE `member_address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT '会员id',
  `nickname` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人手机号码',
  `province_id` int NOT NULL DEFAULT '0' COMMENT '省id',
  `province_str` varchar(50) NOT NULL DEFAULT '' COMMENT '省名称',
  `city_id` int NOT NULL DEFAULT '0' COMMENT '城市id',
  `city_str` varchar(50) NOT NULL DEFAULT '' COMMENT '市名称',
  `area_id` int NOT NULL DEFAULT '0' COMMENT '区域id',
  `area_str` varchar(50) NOT NULL DEFAULT '' COMMENT '区域名称',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1：有效 0：无效',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认地址',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_member_id_status` (`member_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员收货地址';

-- ----------------------------
-- Records of member_address
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for member_cart
-- ----------------------------
DROP TABLE IF EXISTS `member_cart`;
CREATE TABLE `member_cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint NOT NULL DEFAULT '0' COMMENT '会员id',
  `food_id` int NOT NULL DEFAULT '0' COMMENT '商品id',
  `quantity` int NOT NULL DEFAULT '0' COMMENT '数量',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='购物车';

-- ----------------------------
-- Records of member_cart
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for member_comments
-- ----------------------------
DROP TABLE IF EXISTS `member_comments`;
CREATE TABLE `member_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT '会员id',
  `food_ids` varchar(200) NOT NULL DEFAULT '' COMMENT '商品ids',
  `pay_order_id` int NOT NULL DEFAULT '0' COMMENT '订单id',
  `score` tinyint NOT NULL DEFAULT '0' COMMENT '评分',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '评论内容',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员评论表';

-- ----------------------------
-- Records of member_comments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `access_token` varchar(600) NOT NULL DEFAULT '',
  `expired_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_expired_time` (`expired_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='微信的access_token 用户调用其他接口的';

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oauth_member_bind
-- ----------------------------
DROP TABLE IF EXISTS `oauth_member_bind`;
CREATE TABLE `oauth_member_bind` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT '会员id',
  `client_type` varchar(20) NOT NULL DEFAULT '' COMMENT '客户端来源类型。qq,weibo,weixin',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '类型 type 1:wechat ',
  `openid` varchar(80) NOT NULL DEFAULT '' COMMENT '第三方id',
  `unionid` varchar(100) NOT NULL DEFAULT '',
  `extra` text NOT NULL COMMENT '额外字段',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_type_openid` (`type`,`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='第三方登录绑定关系';

-- ----------------------------
-- Records of oauth_member_bind
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pay_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_order`;
CREATE TABLE `pay_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(40) NOT NULL DEFAULT '' COMMENT '随机订单号',
  `member_id` bigint NOT NULL DEFAULT '0' COMMENT '会员id',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单应付金额',
  `yun_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费金额',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单实付金额',
  `pay_sn` varchar(128) NOT NULL DEFAULT '' COMMENT '第三方流水号',
  `prepay_id` varchar(128) NOT NULL DEFAULT '' COMMENT '第三方预付id',
  `note` text NOT NULL COMMENT '备注信息',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1：支付完成 0 无效 -1 申请退款 -2 退款中 -9 退款成功  -8 待支付  -7 完成支付待确认',
  `express_status` tinyint NOT NULL DEFAULT '0' COMMENT '快递状态，-8 待支付 -7 已付款待发货 1：确认收货 0：失败',
  `express_address_id` int NOT NULL DEFAULT '0' COMMENT '快递地址id',
  `express_info` varchar(1000) NOT NULL DEFAULT '' COMMENT '快递信息',
  `comment_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评论状态',
  `pay_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '付款到账时间',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_sn` (`order_sn`),
  KEY `idx_member_id_status` (`member_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='在线购买订单表';

-- ----------------------------
-- Records of pay_order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pay_order_callback_data
-- ----------------------------
DROP TABLE IF EXISTS `pay_order_callback_data`;
CREATE TABLE `pay_order_callback_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pay_order_id` int NOT NULL DEFAULT '0' COMMENT '支付订单id',
  `pay_data` text NOT NULL COMMENT '支付回调信息',
  `refund_data` text NOT NULL COMMENT '退款回调信息',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pay_order_id` (`pay_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pay_order_callback_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pay_order_item
-- ----------------------------
DROP TABLE IF EXISTS `pay_order_item`;
CREATE TABLE `pay_order_item` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pay_order_id` int NOT NULL DEFAULT '0' COMMENT '订单id',
  `member_id` bigint NOT NULL DEFAULT '0' COMMENT '会员id',
  `quantity` int NOT NULL DEFAULT '1' COMMENT '购买数量 默认1份',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价格，售价 * 数量',
  `food_id` int NOT NULL DEFAULT '0' COMMENT '美食表id',
  `note` text NOT NULL COMMENT '备注信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1：成功 0 失败',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `id_order_id` (`pay_order_id`),
  KEY `idx_food_id` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单详情表';

-- ----------------------------
-- Records of pay_order_item
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for queue_list
-- ----------------------------
DROP TABLE IF EXISTS `queue_list`;
CREATE TABLE `queue_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `queue_name` varchar(30) NOT NULL DEFAULT '' COMMENT '队列名字',
  `data` varchar(500) NOT NULL DEFAULT '' COMMENT '队列数据',
  `status` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '状态 -1 待处理 1 已处理',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='事件队列表';

-- ----------------------------
-- Records of queue_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户角色关联id',
  `rolename` varchar(100) NOT NULL COMMENT '角色名',
  `status` int NOT NULL COMMENT '状态',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolename` (`rolename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for role_access
-- ----------------------------
DROP TABLE IF EXISTS `role_access`;
CREATE TABLE `role_access` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问和角色关联id',
  `role_id` int NOT NULL COMMENT '角色id',
  `access_id` int NOT NULL COMMENT '角色id',
  `status` int NOT NULL COMMENT '状态',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='访问和角色关联表';

-- ----------------------------
-- Records of role_access
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for stat_daily_food
-- ----------------------------
DROP TABLE IF EXISTS `stat_daily_food`;
CREATE TABLE `stat_daily_food` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `food_id` int NOT NULL DEFAULT '0' COMMENT '菜品id',
  `total_count` int NOT NULL DEFAULT '0' COMMENT '售卖总数量',
  `total_pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总售卖金额',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `date_food_id` (`date`,`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍售卖日统计';

-- ----------------------------
-- Records of stat_daily_food
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for stat_daily_member
-- ----------------------------
DROP TABLE IF EXISTS `stat_daily_member`;
CREATE TABLE `stat_daily_member` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL COMMENT '日期',
  `member_id` int NOT NULL DEFAULT '0' COMMENT '会员id',
  `total_shared_count` int NOT NULL DEFAULT '0' COMMENT '当日分享总次数',
  `total_pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当日付款总金额',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_date_member_id` (`date`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员日统计';

-- ----------------------------
-- Records of stat_daily_member
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for stat_daily_site
-- ----------------------------
DROP TABLE IF EXISTS `stat_daily_site`;
CREATE TABLE `stat_daily_site` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL COMMENT '日期',
  `total_pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当日应收总金额',
  `total_member_count` int NOT NULL COMMENT '会员总数',
  `total_new_member_count` int NOT NULL COMMENT '当日新增会员数',
  `total_order_count` int NOT NULL COMMENT '当日订单数',
  `total_shared_count` int NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='全站日统计';

-- ----------------------------
-- Records of stat_daily_site
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` bigint NOT NULL AUTO_INCREMENT COMMENT '用户uid',
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：男 2：女 0：没填写',
  `avatar` varchar(64) NOT NULL DEFAULT '' COMMENT '头像',
  `login_name` varchar(20) NOT NULL DEFAULT '' COMMENT '登录用户名',
  `login_pwd` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `login_salt` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码的随机加密秘钥',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：有效 0：无效',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `is_admin` tinyint(1) NOT NULL COMMENT '是否为管理员',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表（管理员）';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`uid`, `nickname`, `mobile`, `email`, `sex`, `avatar`, `login_name`, `login_pwd`, `login_salt`, `status`, `updated_time`, `created_time`, `is_admin`) VALUES (1, 'egbertwu', '12345678901', 'egbertwu@163.com', 1, '', 'egbert', '816440c40b7a9d55ff9eb7b20760862c', 'cF3JfH5FJfQ8B2Ba', 1, '2023-03-08 00:00:00', '2023-03-08 00:00:00', 1);
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户角色关联id',
  `uid` bigint NOT NULL COMMENT '用户uid',
  `role_id` bigint NOT NULL COMMENT '角色id',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户角色关联表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wx_share_history
-- ----------------------------
DROP TABLE IF EXISTS `wx_share_history`;
CREATE TABLE `wx_share_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL DEFAULT '0' COMMENT '会员id',
  `share_url` varchar(200) NOT NULL DEFAULT '' COMMENT '分享的页面url',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='微信分享记录';

-- ----------------------------
-- Records of wx_share_history
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
