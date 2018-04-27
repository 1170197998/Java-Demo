/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost
 Source Database       : db_test

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : utf-8

 Date: 04/27/2018 23:06:58 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `shopping`
-- ----------------------------
DROP TABLE IF EXISTS `shopping`;
CREATE TABLE `shopping` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `number` smallint(6) DEFAULT NULL,
  `picture` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `shopping`
-- ----------------------------
BEGIN;
INSERT INTO `shopping` VALUES ('1', '沃特篮球鞋', '佛山', '180', '500', '001.jpg'), ('2', '安踏运动鞋', '福州', '120', '800', '002.jpg'), ('3', '耐克运动鞋', '广州', '500', '1000', '003.jpg'), ('4', '阿迪达斯T血衫', '上海', '388', '600', '004.jpg'), ('5', '李宁文化衫', '广州', '180', '900', '005.jpg'), ('6', '小米3', '北京', '1999', '3000', '006.jpg'), ('7', '小米2S', '北京', '1299', '1000', '007.jpg'), ('8', 'thinkpad笔记本', '北京', '6999', '500', '008.jpg'), ('9', 'dell笔记本', '北京', '3999', '500', '009.jpg'), ('10', 'ipad5', '北京', '5999', '500', '010.jpg');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
