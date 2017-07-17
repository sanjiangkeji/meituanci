/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100113
 Source Host           : localhost
 Source Database       : meituan

 Target Server Type    : MySQL
 Target Server Version : 100113
 File Encoding         : utf-8

 Date: 07/14/2017 16:20:33 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_collect`
-- ----------------------------
DROP TABLE IF EXISTS `meituan`.`t_collect`;
CREATE TABLE `meituan`.`t_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `is_delete` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `t_collect`
-- ----------------------------
BEGIN;
INSERT INTO `meituan`.`t_collect` VALUES ('6', '1', '2', '0');
COMMIT;

-- ----------------------------
--  Table structure for `t_business`
-- ----------------------------
DROP TABLE IF EXISTS `meituan`.`t_business`;
CREATE TABLE `meituan`.`t_business` (
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `business_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `business_tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `t_business`
-- ----------------------------
BEGIN;
INSERT INTO `meituan`.`t_business` VALUES ('1', '鲜芋仙', '道外区东直路118号百盛购物中心太平桥店1层', '0451-88888888'), ('2', '麦当劳', '东北林业大学', '010-666');
COMMIT;

-- ----------------------------
--  Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `meituan`.`t_order`;
CREATE TABLE `meituan`.`t_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_price` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`),
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_order`
-- ----------------------------
BEGIN;
INSERT INTO `meituan`.`t_order` VALUES ('1', '1', '1', '5', '2'), ('2', '1', '1', '10', '3'), ('3', '1', '3', '8', '2');
COMMIT;

-- ----------------------------
--  Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `meituan`.`t_product`;
CREATE TABLE `meituan`.`t_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `discount_price` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_product`
-- ----------------------------
BEGIN;
INSERT INTO `meituan`.`t_product` VALUES ('1', 'xianyuxian', '8', '[11店通用]10元代金券1份', '6', 'img/xianyuxian.jpg', '1'), ('2', 'KFC', '15', '[12店通用]10元代金券1份', '10', 'img/xianyuxian.jpg', '2'), ('3', '麦当劳', '2', '[13店通用]10元代金券1份', '1', 'img/xianyuxian.jpg', '2');
COMMIT;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `meituan`.`t_user`;
CREATE TABLE `meituan`.`t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名称',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `meituan`.`t_user` VALUES ('1', 'admin', '12345'), ('2', 'aa', 'aa'), ('8', 'abc', 'abc'), ('9', 'zz', 'zz'), ('11', 'xx', 'xx'), ('12', 'cc', 'cc'), ('13', 'nn', 'nn');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
