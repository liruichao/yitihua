/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-02-26 11:06:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `menu_id` varchar(32) NOT NULL,
  `parent_menu_id` varchar(32) DEFAULT NULL,
  `menu_no` varchar(50) DEFAULT NULL,
  `menu_title` varchar(50) DEFAULT NULL,
  `menu_description` varchar(1000) DEFAULT NULL,
  `open_flag` varchar(4) DEFAULT NULL,
  `menu_url` varchar(500) DEFAULT NULL,
  `sort_no` varchar(4) DEFAULT NULL,
  `delete_flag` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', null, '1', '系统管理', '系统管理描述', '1', '/menu/menu', '1', '0');
INSERT INTO `tb_menu` VALUES ('2', null, '1', '订单管理', '订单管理描述', '1', '/menu/menu', '2', '0');
INSERT INTO `tb_menu` VALUES ('3', '1', '1', '角色管理', '管理角色', '1', '/user/toViewRoleList', '2', '0');
INSERT INTO `tb_menu` VALUES ('4', '1', '1', '菜单管理', '管理菜单', '1', '/menu/viewMenuList', '2', '0');
INSERT INTO `tb_menu` VALUES ('5', '2', '1', '订单查询', '查询订单', '1', '/menu/menu', '2', '0');
INSERT INTO `tb_menu` VALUES ('6', '2', '1', '订单余额查询', '查询订单余额', '1', 'menu/module2', '2', '0');
INSERT INTO `tb_menu` VALUES ('7', null, '1', '安全管理', '管理安全', '1', '/user/toViewRoleList', '2', '0');
INSERT INTO `tb_menu` VALUES ('8', '1', '1', '用户管理', '管理用户', '1', '/user/toViewUserList', '1', '0');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `role_id` varchar(32) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `open_flag` varchar(4) DEFAULT NULL,
  `enterprise_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '管理员', '管理', null, null);
INSERT INTO `tb_role` VALUES ('2', '超级管理员', '超级管理', null, null);
INSERT INTO `tb_role` VALUES ('3', '总经理', '总经理', null, null);
INSERT INTO `tb_role` VALUES ('4', '财务', '财务', null, null);
INSERT INTO `tb_role` VALUES ('8a8fe04952f25d2b0152f71e09dd0004', '2', null, null, null);
INSERT INTO `tb_role` VALUES ('8a8fe04952f25d2b0152f72645020005', '3', null, null, null);
INSERT INTO `tb_role` VALUES ('8a8fe04952f783a90152f78568ea0003', '4', null, null, null);

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu` (
  `role_id` varchar(32) NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES ('1', '1');
INSERT INTO `tb_role_menu` VALUES ('1', '11');
INSERT INTO `tb_role_menu` VALUES ('1', '3');
INSERT INTO `tb_role_menu` VALUES ('1', '4');
INSERT INTO `tb_role_menu` VALUES ('3', '1');
INSERT INTO `tb_role_menu` VALUES ('3', '2');
INSERT INTO `tb_role_menu` VALUES ('3', '6');
INSERT INTO `tb_role_menu` VALUES ('3', '7');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` varchar(32) NOT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `user_password` varchar(32) DEFAULT NULL,
  `user_state` varchar(1) DEFAULT NULL,
  `locked_state` varchar(1) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `user_real_name` varchar(32) DEFAULT NULL,
  `user_description` varchar(1000) DEFAULT NULL,
  `user_grade` varchar(4) DEFAULT NULL,
  `user_role_ids` varchar(1000) DEFAULT NULL,
  `user_role_names` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', 'ceshi', '1', '1', '3232322qq.com', '15620634393', null, 'admin', null, null, '1,3', '管理员,总经理');
INSERT INTO `tb_user` VALUES ('2', 'hello', '222', '1', '1', '414242142@qq.com', '174849309391', null, 'hello', null, null, null, null);
INSERT INTO `tb_user` VALUES ('3', 'world', '333', '1', '1', '41241342', '421415414', null, 'world', null, null, null, null);
INSERT INTO `tb_user` VALUES ('8a8fe04952e41c130152e41d1c580000', '11', '11', null, null, '', '', null, '', '', '1', '1,3', '管理员,总经理');
INSERT INTO `tb_user` VALUES ('8a8fe04952e421b30152e4220e010000', '22', '22', null, null, '', '', null, '', '', '1', '2,4', '超级管理员,财务');
INSERT INTO `tb_user` VALUES ('8a8fe04952e42bfa0152e42e1e050000', '33', '1', null, null, '', '', null, '', '', '1', '1,2', '管理员,超级管理员');

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role` (
  `user_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES ('8a8fe04952e41c130152e41d1c580000', '1');
INSERT INTO `tb_user_role` VALUES ('8a8fe04952e41c130152e41d1c580000', '3');
INSERT INTO `tb_user_role` VALUES ('8a8fe04952e421b30152e4220e010000', '2');
INSERT INTO `tb_user_role` VALUES ('8a8fe04952e42bfa0152e42e1e050000', '1');
