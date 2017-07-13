/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100124
 Source Host           : localhost
 Source Database       : meituan

 Target Server Type    : MySQL
 Target Server Version : 100124
 File Encoding         : utf-8

 Date: 07/13/2017 10:33:13 AM
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `meituan`.`t_order`;
CREATE TABLE `t_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`),
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_order`
-- ----------------------------
BEGIN;
INSERT INTO `meituan`.`t_order` VALUES ('1', '1', '1', '5'), ('2', '1', '2', '10');
COMMIT;

-- ----------------------------
--  Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `meituan`.`t_product`;
CREATE TABLE `meituan`.`t_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_product`
-- ----------------------------
BEGIN;
INSERT INTO `meituan`.`t_product` VALUES ('1', '鲜芋仙', '8'), ('2', '肯德基', '15');
COMMIT;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `meituan`.`t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名称',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `meituan`.`t_user` VALUES ('1', 'admin', '12345'), ('2', 'aa', 'aa'), ('8', 'abc', 'abc'), ('9', 'zz', 'zz'), ('11', 'xx', 'xx'), ('12', 'cc', 'cc');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
