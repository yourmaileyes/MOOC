/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : mooc

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2018-10-29 17:51:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(100) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `context` varchar(500) default NULL,
  `type` varchar(50) default NULL,
  `price` varchar(50) default NULL,
  `label` varchar(100) default NULL,
  `hour` char(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'Python', 'Python', '1', '1', '一般', '20');
INSERT INTO `course` VALUES ('2', 'Python入门', 'Python入门', '0', '0', '还行', '10');
INSERT INTO `course` VALUES ('3', '1024设计', '1024设计', '1', '0', '还行', '5');
INSERT INTO `course` VALUES ('4', 'Python爬虫', 'Python爬虫技巧', '0', '0', '还行', '12');
INSERT INTO `course` VALUES ('5', 'java', 'java基础入门', '1', '0', '一般', '14');
INSERT INTO `course` VALUES ('6', 'Python爬虫2', 'Python爬虫2', '0', '0', '一般', '15');
INSERT INTO `course` VALUES ('7', '123', '123123', '1', '1', null, null);
INSERT INTO `course` VALUES ('8', '12123', '123123', '1', '1', null, null);

-- ----------------------------
-- Table structure for `ipset`
-- ----------------------------
DROP TABLE IF EXISTS `ipset`;
CREATE TABLE `ipset` (
  `ip` varchar(255) NOT NULL default '',
  `type` varchar(255) default NULL,
  `mark` varchar(255) default NULL,
  `firsttime` datetime default NULL,
  `bantime` datetime default NULL,
  `totime` datetime default NULL,
  PRIMARY KEY  (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ipset
-- ----------------------------
INSERT INTO `ipset` VALUES ('0:0:0:0:0:0:0:1', null, null, '2018-10-27 20:00:34', null, '2018-10-27 20:02:33');
INSERT INTO `ipset` VALUES ('127.0.0.1', '0', '恶意登陆管理员账号！', '2018-10-16 11:57:36', '2117-10-16 19:16:14', '2018-10-29 16:09:50');
INSERT INTO `ipset` VALUES ('172.162.1.125', '0', '多次测试未知账户！', '2018-10-16 18:34:05', '2018-10-16 18:39:14', '2018-10-16 18:34:05');
INSERT INTO `ipset` VALUES ('172.162.1.40', '0', '恶意登陆管理员账号！', '2018-10-16 14:11:35', '2117-10-16 19:00:29', '2018-10-16 19:05:29');
INSERT INTO `ipset` VALUES ('172.162.1.41', '1', '多次测试未知账户！', '2018-10-16 12:00:48', '2018-10-17 19:21:21', '2018-10-16 19:20:43');
INSERT INTO `ipset` VALUES ('172.162.1.42', '0', '多次测试未知账户！', '2018-10-16 14:09:01', '2018-10-17 18:57:18', '2018-10-17 19:22:21');
INSERT INTO `ipset` VALUES ('172.162.1.43', '0', '多次测试未知账户！', '2018-10-16 12:00:30', '2018-10-16 19:24:00', '2018-10-16 14:04:47');
INSERT INTO `ipset` VALUES ('172.162.1.44', '1', '多次测试未知账户！', '2018-10-16 15:09:06', '2018-10-16 19:26:04', '2018-10-16 19:19:24');
INSERT INTO `ipset` VALUES ('172.162.1.87', '1', '多次测试未知账户！', '2018-10-16 19:08:26', '2018-10-16 19:25:58', '2018-10-16 19:09:36');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(255) NOT NULL auto_increment,
  `userid` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `ip` varchar(255) default NULL,
  `time` datetime default NULL,
  `executor` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2018-10-15 15:13:46', null);
INSERT INTO `log` VALUES ('2', '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2018-10-15 15:15:57', 'admin');
INSERT INTO `log` VALUES ('3', '20151612204', 'admin', '充值500元', '0:0:0:0:0:0:0:1', '2018-10-15 15:16:53', 'admin');
INSERT INTO `log` VALUES ('4', '201808231058301205', '1823544517', '充值10000元', '0:0:0:0:0:0:0:1', '2018-10-15 15:18:02', 'admin');
INSERT INTO `log` VALUES ('5', '201808231058301205', '1823544517', '屏蔽用户登录', '0:0:0:0:0:0:0:1', '2018-10-15 15:18:12', 'admin');
INSERT INTO `log` VALUES ('6', '201808231058301205', '1823544517', '恢复用户登录', '0:0:0:0:0:0:0:1', '2018-10-15 15:19:10', 'admin');
INSERT INTO `log` VALUES ('7', '201808231058301205', '1823544517', '登录', '127.0.0.1', '2018-10-15 15:19:15', null);
INSERT INTO `log` VALUES ('8', '201808231058301205', '1823544517', '订阅课程:1024设计', '127.0.0.1', '2018-10-15 15:19:20', null);
INSERT INTO `log` VALUES ('9', '201808231058301205', '1823544517', '购买会员：一年', '127.0.0.1', '2018-10-15 15:31:58', null);
INSERT INTO `log` VALUES ('10', '201808231058301205', '1823544517', '登录', '127.0.0.1', '2018-10-15 16:12:09', null);
INSERT INTO `log` VALUES ('11', '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2018-10-15 21:45:02', 'admin');
INSERT INTO `log` VALUES ('12', '201808231058301205', '1823544517', '登录', '127.0.0.1', '2018-10-15 21:49:02', null);
INSERT INTO `log` VALUES ('13', null, null, '下架课程：Python', '0:0:0:0:0:0:0:1', '2018-10-15 21:49:27', 'admin');
INSERT INTO `log` VALUES ('14', null, null, '上架课程：Python', '0:0:0:0:0:0:0:1', '2018-10-15 21:49:37', 'admin');
INSERT INTO `log` VALUES ('15', null, null, '下架课程：Python', '0:0:0:0:0:0:0:1', '2018-10-15 21:49:44', 'admin');
INSERT INTO `log` VALUES ('16', null, null, '尝试登录账号:asdawdasdwqweqwrqwe，密码错误', '127.0.0.1', '2018-10-16 10:08:03', null);
INSERT INTO `log` VALUES ('17', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 10:08:48', 'admin');
INSERT INTO `log` VALUES ('18', '201808231058301205', '1823544517', '登录', '127.0.0.1', '2018-10-16 10:10:17', null);
INSERT INTO `log` VALUES ('19', '201810161045371069', 'abc', '普通注册', '172.162.1.44', '2018-10-16 10:37:45', null);
INSERT INTO `log` VALUES ('20', '201810161045371069', 'abc', '登录', '172.162.1.44', '2018-10-16 10:38:12', null);
INSERT INTO `log` VALUES ('21', '201810161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2018-10-16 10:38:27', null);
INSERT INTO `log` VALUES ('22', '201810161045371069', 'abc', '订阅课程:1024设计', '172.162.1.44', '2018-10-16 10:39:07', null);
INSERT INTO `log` VALUES ('23', '201810161045371069', 'abc', '个人信息更改', '172.162.1.44', '2018-10-16 10:40:49', null);
INSERT INTO `log` VALUES ('24', '201810161045371069', 'abc', '个人信息更改', '172.162.1.44', '2018-10-16 10:40:57', null);
INSERT INTO `log` VALUES ('25', '201808231058301205', '1823544517', '登录', '127.0.0.1', '2018-10-16 10:41:17', null);
INSERT INTO `log` VALUES ('26', '201810161045371069', 'abc', '取消课程：1024设计', '172.162.1.44', '2018-10-16 10:41:32', null);
INSERT INTO `log` VALUES ('27', '201810161045371069', 'abc', '个人信息更改', '172.162.1.44', '2018-10-16 10:43:15', null);
INSERT INTO `log` VALUES ('28', '201810161045371069', 'abc', '充值10000元', '127.0.0.1', '2018-10-16 10:44:50', 'admin');
INSERT INTO `log` VALUES ('29', '201810161045371069', 'abc', '购买会员：一年', '172.162.1.44', '2018-10-16 10:45:04', null);
INSERT INTO `log` VALUES ('30', '201810161045371069', 'abc', '购买会员：半年', '172.162.1.44', '2018-10-16 10:45:07', null);
INSERT INTO `log` VALUES ('31', '201810161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2018-10-16 10:45:11', null);
INSERT INTO `log` VALUES ('32', '201810161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2018-10-16 10:45:13', null);
INSERT INTO `log` VALUES ('33', '201810161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2018-10-16 10:45:15', null);
INSERT INTO `log` VALUES ('34', '201810161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2018-10-16 10:45:16', null);
INSERT INTO `log` VALUES ('35', '201810161045371069', 'abc', '购买会员：半年', '172.162.1.44', '2018-10-16 10:46:02', null);
INSERT INTO `log` VALUES ('36', '201810161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2018-10-16 10:46:05', null);
INSERT INTO `log` VALUES ('37', '201810161045371069', 'abc', '购买会员：一个月', '172.162.1.44', '2018-10-16 10:46:07', null);
INSERT INTO `log` VALUES ('38', '201810161045371069', 'abc', '注销', '172.162.1.44', '2018-10-16 10:46:24', null);
INSERT INTO `log` VALUES ('39', null, null, '尝试登录账号:admin，密码错误', '172.162.1.44', '2018-10-16 10:46:52', null);
INSERT INTO `log` VALUES ('40', '20151612204', 'admin', '注销', '127.0.0.1', '2018-10-16 10:47:40', 'admin');
INSERT INTO `log` VALUES ('41', null, null, '尝试登录账号:admin，密码错误', '127.0.0.1', '2018-10-16 10:47:50', null);
INSERT INTO `log` VALUES ('42', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 10:48:09', 'admin');
INSERT INTO `log` VALUES ('43', '201808231058301205', '1823544517', '登录', '172.162.1.42', '2018-10-16 14:09:19', null);
INSERT INTO `log` VALUES ('44', '201808231058301205', '1823544517', '订阅课程:Python爬虫', '172.162.1.42', '2018-10-16 14:09:32', null);
INSERT INTO `log` VALUES ('45', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 14:34:55', 'admin');
INSERT INTO `log` VALUES ('46', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 14:47:31', 'admin');
INSERT INTO `log` VALUES ('47', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 15:02:14', 'admin');
INSERT INTO `log` VALUES ('48', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 15:06:45', 'admin');
INSERT INTO `log` VALUES ('49', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 15:07:24', 'admin');
INSERT INTO `log` VALUES ('50', '201808231058301205', '1823544517', '登录', '127.0.0.1', '2018-10-16 15:22:23', null);
INSERT INTO `log` VALUES ('51', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 15:27:01', 'admin');
INSERT INTO `log` VALUES ('52', '201808231058301205', '1823544517', '登录', '127.0.0.1', '2018-10-16 15:27:30', null);
INSERT INTO `log` VALUES ('53', '201808231058301205', '1823544517', '发表评论，在\'null\'', '127.0.0.1', '2018-10-16 15:27:45', null);
INSERT INTO `log` VALUES ('54', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 15:29:20', 'admin');
INSERT INTO `log` VALUES ('55', '201808231058301205', '1823544517', '登录', '127.0.0.1', '2018-10-16 15:30:13', null);
INSERT INTO `log` VALUES ('56', '201808231058301205', '1823544517', '发表评论，在\'Python爬虫\'', '127.0.0.1', '2018-10-16 15:30:22', null);
INSERT INTO `log` VALUES ('57', '201810161045371069', 'abc', '登录', '172.162.1.44', '2018-10-16 15:34:59', null);
INSERT INTO `log` VALUES ('58', '201810161045371069', 'abc', '订阅课程:1024设计', '172.162.1.44', '2018-10-16 15:35:05', null);
INSERT INTO `log` VALUES ('59', '201810161045371069', 'abc', '发表评论，在\'1024设计\'', '172.162.1.44', '2018-10-16 15:35:30', null);
INSERT INTO `log` VALUES ('60', '201810161045371069', 'abc', '取消课程：1024设计', '172.162.1.44', '2018-10-16 15:36:28', null);
INSERT INTO `log` VALUES ('61', '201810161045371069', 'abc', '屏蔽用户登录', '127.0.0.1', '2018-10-16 15:36:47', 'admin');
INSERT INTO `log` VALUES ('62', '201810161045371069', 'abc', '订阅课程:Python入门', '172.162.1.44', '2018-10-16 15:37:03', null);
INSERT INTO `log` VALUES ('63', '201810161045371069', 'abc', '注销', '172.162.1.44', '2018-10-16 15:37:11', null);
INSERT INTO `log` VALUES ('64', '201810161045371069', 'abc', '恢复用户登录', '127.0.0.1', '2018-10-16 15:37:22', 'admin');
INSERT INTO `log` VALUES ('65', '201810161045371069', 'abc', '登录', '172.162.1.44', '2018-10-16 15:37:27', null);
INSERT INTO `log` VALUES ('66', '201808231058301205', '1823544517', '注销', '127.0.0.1', '2018-10-16 15:42:47', null);
INSERT INTO `log` VALUES ('67', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 17:11:30', 'admin');
INSERT INTO `log` VALUES ('68', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 17:12:28', 'admin');
INSERT INTO `log` VALUES ('69', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 17:27:45', 'admin');
INSERT INTO `log` VALUES ('70', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 17:28:48', 'admin');
INSERT INTO `log` VALUES ('71', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 17:29:32', 'admin');
INSERT INTO `log` VALUES ('72', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 17:31:06', 'admin');
INSERT INTO `log` VALUES ('73', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 17:40:19', 'admin');
INSERT INTO `log` VALUES ('74', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 17:44:57', 'admin');
INSERT INTO `log` VALUES ('75', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 17:47:35', 'admin');
INSERT INTO `log` VALUES ('76', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 17:48:23', 'admin');
INSERT INTO `log` VALUES ('77', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 18:18:24', 'admin');
INSERT INTO `log` VALUES ('78', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 18:21:29', 'admin');
INSERT INTO `log` VALUES ('79', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 18:27:53', 'admin');
INSERT INTO `log` VALUES ('80', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 18:53:35', 'admin');
INSERT INTO `log` VALUES ('81', null, null, '尝试登录账号:96321，密码错误', '172.162.1.40', '2018-10-16 19:01:02', null);
INSERT INTO `log` VALUES ('82', null, null, '尝试登录账号:96321，密码错误', '172.162.1.40', '2018-10-16 19:01:24', null);
INSERT INTO `log` VALUES ('83', '201810161901381601', '96321', '普通注册', '172.162.1.40', '2018-10-16 19:01:38', null);
INSERT INTO `log` VALUES ('84', '201810161901381601', '96321', '屏蔽用户登录', '127.0.0.1', '2018-10-16 19:01:50', 'admin');
INSERT INTO `log` VALUES ('85', '201810161901381601', '96321', '恢复用户登录', '127.0.0.1', '2018-10-16 19:01:55', 'admin');
INSERT INTO `log` VALUES ('86', '201810161901381601', '96321', '登录', '172.162.1.40', '2018-10-16 19:02:03', null);
INSERT INTO `log` VALUES ('87', '201810161901381601', '96321', '个人信息更改', '172.162.1.40', '2018-10-16 19:02:33', null);
INSERT INTO `log` VALUES ('88', '201810161901381601', '96321', '订阅课程:Python入门', '172.162.1.40', '2018-10-16 19:02:41', null);
INSERT INTO `log` VALUES ('89', '201810161901381601', '96321', '发表评论，在\'Python入门\'', '172.162.1.40', '2018-10-16 19:02:56', null);
INSERT INTO `log` VALUES ('90', '201810161901381601', '96321', '取消课程：Python入门', '172.162.1.40', '2018-10-16 19:03:08', null);
INSERT INTO `log` VALUES ('91', '201810161901381601', '96321', '购买会员：一个月', '172.162.1.40', '2018-10-16 19:03:40', null);
INSERT INTO `log` VALUES ('92', '201810161901381601', '96321', '订阅课程:Python爬虫2', '172.162.1.40', '2018-10-16 19:03:46', null);
INSERT INTO `log` VALUES ('93', '201810161901381601', '96321', '发表评论，在\'Python爬虫2\'', '172.162.1.40', '2018-10-16 19:03:55', null);
INSERT INTO `log` VALUES ('94', '201810161901381601', '96321', '个人信息更改', '172.162.1.40', '2018-10-16 19:04:36', null);
INSERT INTO `log` VALUES ('95', '201810161901381601', '96321', '注销', '172.162.1.40', '2018-10-16 19:05:29', null);
INSERT INTO `log` VALUES ('96', '20151612204', 'admin', '登录', '172.162.1.44', '2018-10-16 19:15:49', 'admin');
INSERT INTO `log` VALUES ('97', '20151612204', 'admin', '登录', '172.162.1.44', '2018-10-16 19:18:37', 'admin');
INSERT INTO `log` VALUES ('98', '20151612204', 'admin', '登录', '172.162.1.44', '2018-10-16 19:19:04', 'admin');
INSERT INTO `log` VALUES ('99', '20151612204', 'admin', '登录', '172.162.1.41', '2018-10-16 19:20:27', 'admin');
INSERT INTO `log` VALUES ('100', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-16 19:20:55', 'admin');
INSERT INTO `log` VALUES ('101', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-17 15:50:41', null);
INSERT INTO `log` VALUES ('102', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-17 15:51:46', 'admin');
INSERT INTO `log` VALUES ('103', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-17 15:52:31', null);
INSERT INTO `log` VALUES ('104', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-17 18:55:21', 'admin');
INSERT INTO `log` VALUES ('105', null, null, '尝试登录账号:admin，密码错误', '0:0:0:0:0:0:0:1', '2018-10-27 20:01:49', null);
INSERT INTO `log` VALUES ('106', '20151612204', 'admin', '登录', '0:0:0:0:0:0:0:1', '2018-10-27 20:01:57', 'admin');
INSERT INTO `log` VALUES ('107', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-29 10:30:06', 'admin');
INSERT INTO `log` VALUES ('108', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-29 10:46:37', 'admin');
INSERT INTO `log` VALUES ('109', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-29 14:30:47', 'admin');
INSERT INTO `log` VALUES ('110', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-29 14:35:21', 'admin');
INSERT INTO `log` VALUES ('111', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-29 14:48:57', 'admin');
INSERT INTO `log` VALUES ('112', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-29 14:51:52', 'admin');
INSERT INTO `log` VALUES ('113', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-29 14:52:54', 'admin');
INSERT INTO `log` VALUES ('114', null, null, '删除课程：张三', '127.0.0.1', '2018-10-29 14:53:07', 'admin');
INSERT INTO `log` VALUES ('115', null, null, '删除课程：张三', '127.0.0.1', '2018-10-29 14:53:16', 'admin');
INSERT INTO `log` VALUES ('116', null, null, '删除课程：张三', '127.0.0.1', '2018-10-29 14:53:22', 'admin');
INSERT INTO `log` VALUES ('117', null, null, '删除课程：张三', '127.0.0.1', '2018-10-29 14:53:29', 'admin');
INSERT INTO `log` VALUES ('118', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-29 15:22:11', 'admin');
INSERT INTO `log` VALUES ('119', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-29 15:23:42', 'admin');
INSERT INTO `log` VALUES ('120', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-29 15:24:57', 'admin');
INSERT INTO `log` VALUES ('121', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-29 15:51:24', 'admin');
INSERT INTO `log` VALUES ('122', '20151612204', 'admin', '登录', '127.0.0.1', '2018-10-29 15:53:23', 'admin');
INSERT INTO `log` VALUES ('123', null, null, '上架课程：123123', '127.0.0.1', '2018-10-29 15:54:04', 'admin');
INSERT INTO `log` VALUES ('124', null, null, '下架课程：123123', '127.0.0.1', '2018-10-29 15:54:17', 'admin');
INSERT INTO `log` VALUES ('125', null, null, '删除课程：123123', '127.0.0.1', '2018-10-29 15:54:34', 'admin');
INSERT INTO `log` VALUES ('126', '20151612204', 'admin', '发表评论，在\'Python入门\'', '127.0.0.1', '2018-10-29 16:09:50', null);

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `courseid` int(100) NOT NULL default '0',
  `userid` varchar(100) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '20151612204');
INSERT INTO `message` VALUES ('3', '201808240857431128');
INSERT INTO `message` VALUES ('6', '201808231058301205');
INSERT INTO `message` VALUES ('4', '20151612204');
INSERT INTO `message` VALUES ('5', '20151612204');
INSERT INTO `message` VALUES ('2', '201809030750151429');
INSERT INTO `message` VALUES ('2', '20151612204');
INSERT INTO `message` VALUES ('2', '201809061049051592');
INSERT INTO `message` VALUES ('2', '201808240857431128');
INSERT INTO `message` VALUES ('6', '201808240857431128');
INSERT INTO `message` VALUES ('4', '201809030750151429');
INSERT INTO `message` VALUES ('5', '201808240857431128');
INSERT INTO `message` VALUES ('1', '201809061049051592');
INSERT INTO `message` VALUES ('3', '201808231058301205');
INSERT INTO `message` VALUES ('4', '201808231058301205');
INSERT INTO `message` VALUES ('2', '201810161045371069');
INSERT INTO `message` VALUES ('6', '201810161901381601');

-- ----------------------------
-- Table structure for `review`
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `reviewid` char(255) NOT NULL,
  `context` char(255) default NULL,
  `courseid` int(50) default NULL,
  `username` char(255) default NULL,
  `time` datetime default NULL,
  `lable` char(255) default NULL,
  `sex` char(50) default NULL,
  `vip` int(50) default NULL,
  PRIMARY KEY  (`reviewid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('201809060327341776', 'fgfdgdsgg', '2', 'zzz', '2018-09-06 15:34:27', '4', 'Female', '1');
INSERT INTO `review` VALUES ('201809060414381493', '钱花的有点多', '1', '雷宇锋', '2018-09-06 16:38:14', '0', null, '1');
INSERT INTO `review` VALUES ('201809060423031483', '这课不错', '4', 'admin', '2018-09-06 16:03:23', '2', 'Male', '1');
INSERT INTO `review` VALUES ('201809060444041617', '刷好评', '4', 'adm', '2018-09-06 16:04:44', '4', null, '0');
INSERT INTO `review` VALUES ('201809060450041302', '刷好评', '4', 'adm', '2018-09-06 16:04:50', '4', null, '0');
INSERT INTO `review` VALUES ('201809060452031217', '这还不错', '4', 'adm', '2018-09-06 16:03:52', '3', null, '0');
INSERT INTO `review` VALUES ('201809060457021559', '这课不错', '5', 'admin', '2018-09-06 16:02:57', '2', 'Male', '1');
INSERT INTO `review` VALUES ('201810151532321876', '测试测试！！！', '6', '1823544517', '2018-10-15 15:32:32', '3', 'Male', '1');
INSERT INTO `review` VALUES ('201810151554191404', 'en ?', '3', '1823544517', '2018-10-15 15:19:54', '2', 'Male', '1');
INSERT INTO `review` VALUES ('201810161036391342', '美太太', '3', 'abc', '2018-10-16 10:39:36', '4', 'Female', '1');
INSERT INTO `review` VALUES ('201810161522301059', '测试', '4', '1823544517', '2018-10-16 15:30:22', '4', 'Male', '1');
INSERT INTO `review` VALUES ('201810161530351701', 'en    很不错', '3', 'abc', '2018-10-16 15:35:30', '0', 'Female', '1');
INSERT INTO `review` VALUES ('201810161545271907', '测试测试', '4', '1823544517', '2018-10-16 15:27:45', '4', 'Male', '1');
INSERT INTO `review` VALUES ('201810161902561206', '', '2', '96321', '2018-10-16 19:02:56', '4', 'Male', '1');
INSERT INTO `review` VALUES ('201810161903551373', '6666', '6', '96321', '2018-10-16 19:03:55', '4', 'Male', '1');
INSERT INTO `review` VALUES ('201810291609501589', '还行', '2', 'admin', '2018-10-29 16:09:50', '4', 'Male', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(100) NOT NULL default '',
  `sex` varchar(50) default NULL,
  `phone` varchar(200) default NULL,
  `mail` varchar(200) default NULL,
  `vx` varchar(200) default NULL,
  `nickname` varchar(200) default NULL,
  `username` varchar(200) default NULL,
  `password` varchar(200) default NULL,
  `mission` varchar(500) default NULL,
  `buycase` varchar(200) default NULL,
  `mycase` varchar(200) default NULL,
  `collect` varchar(200) default NULL,
  `education` varchar(200) default NULL,
  `vip` datetime default NULL,
  `fristtime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('20151612204', 'Male', '18235447109', '591284209@qq.com', '1111', '杨式人', 'admin', 'admin', 'admin', null, null, '458500', '高中/中专', '2033-10-01 19:57:53', null);
INSERT INTO `user` VALUES ('201808100710171565', 'Female', '18235447109', '591284209@qq.com', null, null, 'admin1', 'admin', null, null, null, '500', null, null, '2018-08-10 19:17:10');
INSERT INTO `user` VALUES ('201808100930501831', 'Male', '18235447109', '591284209@qq.com', '1111111111111111111', '张三', 'zhangsan', 'asdasd', null, null, null, '0', '本科/大专', '2019-09-01 20:41:04', '2018-08-10 09:50:30');
INSERT INTO `user` VALUES ('201808101154331492', 'Female', '1111111111111', '1447883900@qq.com', null, null, 'zhazhabi', 'zxcvbnm', null, null, null, '500', null, null, '2018-08-10 11:33:54');
INSERT INTO `user` VALUES ('201808230425131682', null, '123456789', '125486', '15846', 'bad', 'bb', '123456', null, null, null, '500', '研究生以上', null, '2018-08-23 16:13:25');
INSERT INTO `user` VALUES ('201808230439101712', null, null, null, null, null, '18235445172', '1111', null, null, null, '500', null, null, '2018-08-23 16:10:39');
INSERT INTO `user` VALUES ('201808231058301205', 'Male', '12345689', '789@qq.com', '784554asdd', '雷', '1823544517', '123654', null, '0', null, '7000', '本科/大专', '2019-10-15 15:31:58', '2018-08-23 10:30:58');
INSERT INTO `user` VALUES ('201808240857431128', 'Female', '12345678907assa', '345424354@qq.com', '4dgde', 'zzzgf', 'zzz', '12345', null, null, null, '0', '研究生以上', '2023-01-06 15:33:03', '2018-08-24 08:43:57');
INSERT INTO `user` VALUES ('201808241105291520', null, null, null, null, null, '1823544517111111111111', '123456', null, null, null, '500', null, null, '2018-08-24 11:29:05');
INSERT INTO `user` VALUES ('201808241117291016', null, null, null, null, null, '182354451722222222222', '123456', null, null, null, '500', null, null, '2018-08-24 11:29:17');
INSERT INTO `user` VALUES ('201808241149281125', null, null, null, null, null, '18235445171111', '123456', null, null, null, '500', null, null, '2018-08-24 11:28:49');
INSERT INTO `user` VALUES ('201809030750151429', null, null, null, null, null, 'adm', '123', null, null, null, '500', null, null, '2018-09-03 19:15:50');
INSERT INTO `user` VALUES ('201809061018111546', 'Male', '110', '373254553@qq.com', 'js666', 'js', 'js', 'js666', null, null, null, '10000', '研究生以上', '2020-03-06 10:15:16', '2018-09-06 10:11:18');
INSERT INTO `user` VALUES ('201809061049051592', null, null, null, null, null, '雷宇锋', '110', null, null, null, '0', null, '2018-12-06 16:37:39', '2018-09-06 10:05:49');
INSERT INTO `user` VALUES ('201809061051011416', null, null, null, null, null, 'sdsd', '123', null, null, null, '500', null, null, '2018-09-06 10:01:51');
INSERT INTO `user` VALUES ('201809061055001264', null, null, null, null, null, 'aaa', '123', null, null, null, '500', null, null, '2018-09-06 10:00:55');
INSERT INTO `user` VALUES ('201809061108071033', 'Female', '12123', '1447883900@qq.com', null, null, '111', 'qweqwe', null, null, null, '500', null, null, '2018-09-06 11:07:08');
INSERT INTO `user` VALUES ('201810161045371069', 'Female', '13096613748', '872486471', '1223', '去玩儿', 'abc', '123456', null, '0', null, '0', '研究生以上', '2021-05-16 10:38:27', '2018-10-16 10:37:45');
INSERT INTO `user` VALUES ('201810161901381601', 'Male', '96321', '96321', '96321', '96321', '96321', '96321', null, '0', null, '0', '研究生以上', '2018-11-16 19:03:40', '2018-10-16 19:01:38');
