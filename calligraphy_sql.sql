/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : calligraphy_sql

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 21/03/2023 02:35:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `uId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addressDetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isDefault` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `areaCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (35, '15917403442', '表面书生', '15917403442', '天津市', '天津市', '和平区', '啊飒飒', '0', '120101');
INSERT INTO `address` VALUES (36, '15917403442', '李四五', '15917403442', '浙江省', '杭州市', '滨江区', 'aaa', '0', '330108');
INSERT INTO `address` VALUES (37, '15917403442', 'goods', '14739711183', '天津市', '天津市', '西青区', 'asasas', '0', '120111');
INSERT INTO `address` VALUES (38, '14739711183', 'goodall', '14739711183', '北京市', '北京市', '东城区', '天安门广场', '1', '000000');
INSERT INTO `address` VALUES (39, '14739711183', '表面书生', '14739711183', '天津市', '天津市', '和平区', 'xxx', '0', '000000');

-- ----------------------------
-- Table structure for goods_cart
-- ----------------------------
DROP TABLE IF EXISTS `goods_cart`;
CREATE TABLE `goods_cart`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `uId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_id` int NULL DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_cart
-- ----------------------------

-- ----------------------------
-- Table structure for goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `goods_detail`;
CREATE TABLE `goods_detail`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `detail_id` int NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_detail
-- ----------------------------
INSERT INTO `goods_detail` VALUES (1, 8659019, 'hots/5a720b265d36926f.jpg', '荣宝斋 全绫精裱空白书画卷轴 复古横幅挂画立轴 书法国画手工宣纸空白挂轴 四开竖挂轴', '22.90', 'dImg/6cfaafd2771f6897.jpg', 'dImg/733b0f745649c3ea.jpg', 'dImg/c95be678e413710f.jpg');
INSERT INTO `goods_detail` VALUES (2, 1002775, 'hots/0ca1ca2899cfee48.jpg', '善琏湖笔 水写布加厚仿宣水写书法布练习纸毛笔字帖初学者入门临摹清水练字文房四宝用品万次 米字格水写布', '46.00', 'dImg/94fbb4c52a422e8e.jpg', 'dImg/da55dea0e9745756.jpg', 'dImg/ba45badf8a182414.jpg');
INSERT INTO `goods_detail` VALUES (3, 1003295, 'hots/fd2ed4673866b369.jpg', '善琏湖笔 兼毫毛笔竹竿简约文房四宝毛笔初学者入门楷书行草写意工笔写经国画书法笔 简兮', '36.00', 'dImg/fd10df3918202b9c.jpg', 'dImg/2bad8e90a6173d29.jpg', 'dImg/4880a27f3a533fd8.jpg');
INSERT INTO `goods_detail` VALUES (4, 1000101, 'like/0b4d71bc9d51e3ee.jpg', '荣宝斋 墨锭 文房四宝 墨条墨块 胡开文徽墨毛笔书法国画用品 金不换', '18.90', 'dImg/4f6c214c17d1d42a.jpg', 'dImg/4d00acd5b8f3b2cc.jpg', 'dImg/20f922ce1305ddba.jpg');
INSERT INTO `goods_detail` VALUES (5, 1002536, 'like/1bb42b57cf99bdbb.jpg', '善琏湖笔 印章寿山石貔貅印刻字姓名印章私章古风书法落款篆刻闲章中国风硬笔书法印章雅致高档商务礼品定制 寿山石貔貅2.5', '159.00', 'dImg/1fabe7aea539c62f.jpg', 'dImg/1ebbe0d75b963b58.jpg', 'dImg/50733eb9a09f9fb6.jpg');
INSERT INTO `goods_detail` VALUES (6, 1004697, 'like/b94832e1ddd4c7fb.jpg', '善琏湖笔 狼毫小楷毛笔文房四宝国画书法楷书行草写意工笔写经蝇头小楷抄经笔书法软笔 净狼毫小楷三支装带礼盒', '103.00', 'dImg/bc924ebc8cf99059.jpg', 'dImg/a5dc98770733c90b.jpg', 'dImg/704ca6433bcb94be.jpg');
INSERT INTO `goods_detail` VALUES (7, 1002978, 'like/675997e3116daf80.jpg', '善琏湖笔 毛笔书法毛毡学生国画灰色书法画毡文房四宝毛笔毛毡书法用毛毡垫布 50*70cm灰色毛毡', '32.00', 'dImg/9efe4dedd39a1391.jpg', 'dImg/edcae04cca3124d6.jpg', 'dImg/6d358e5b6ac6cf1c.jpg');
INSERT INTO `goods_detail` VALUES (8, 7204153, 'news/836cf485bfdd0f45.jpg', '得力(deli)文房四宝书法套装 学生成人(毛笔/墨水/墨碟/葫芦型笔搁/字帖) 练字帖毛笔 初学入门款74290', '30.80', 'dImg/7aac3aa9dff54443.jpg', 'dImg/5dc62cc1228980ed.jpg', 'dImg/8ad4afa97662c45a.jpg');
INSERT INTO `goods_detail` VALUES (9, 1000390, 'news/25e9ea630074b873.jpg', '天天练(Tiantianlian)青云梅花墨碟 陶瓷水碟搁笔盛墨笔掭文房书法用品 TN-0744', '8.90', 'dImg/56876a55c9f4acef.jpg', 'dImg/4ad2f86edbf6a282.jpg', 'dImg/a8c720e517520c1e.jpg');
INSERT INTO `goods_detail` VALUES (10, 1000017, 'news/2c2fad3e05764137.jpg', '六品堂 文房四宝书法镇尺镇纸 黑梓木红木书枕 国画用品', '36.00', 'dImg/4f1b2803e2b26e37.jpg', 'dImg/6a8ffacaa4f94037.jpg', 'dImg/501a6e594229d739.jpg');
INSERT INTO `goods_detail` VALUES (11, 1000100, 'news/bf30585aac752d0d.jpg', '六品堂 文房四宝 笔山笔架 毛笔书法用品 笔搁 毛笔架-五指山红木山叉', '11.20', 'dImg/1fc4ecf29198db9f.jpg', 'dImg/9dc03a75d894de85.jpg', 'dImg/1bf04f08e11691ed.jpg');
INSERT INTO `goods_detail` VALUES (12, 5162977, 'news/c8b1605886deff8f.jpg', '善琏湖笔 砚台端砚火锅砚 澄泥砚歙砚成人学生书法绘画用品文房四宝墨条磨墨墨池墨海墨盒初学者书法练习 澄泥砚砚台1个', '49.80', 'dImg/6d5e6a9d887070ca.jpg', 'dImg/f840520765122c80.jpg', 'dImg/932edbba118d4a96.jpg');
INSERT INTO `goods_detail` VALUES (13, 1000061, 'recoms/b93d9703d31c5996.jpg', '一得阁宣纸仿古色四尺四开半生半熟宣纸毛笔书法国画专用纸练习初学者创作作品用纸仿古色半熟宣100张', '28.40', 'dImg/0a949c36ce02da9f.jpg', 'dImg/bf98d37fb619c607.jpg', 'dImg/2597f55043f7c01f.jpg');
INSERT INTO `goods_detail` VALUES (14, 5934475, 'recoms/bad8b91d49325a1c.jpg', '成竹堂 毛笔套装初学者文房四宝套装笔墨纸砚书法笔成人狼毫大中小楷砚台毛笔架国画工具箱小学生儿童练字 入门款:18件套(无工具箱、笔架、印章))', '59.80', 'dImg/6f04d3978f0303b9.jpg', 'dImg/c0e75b79e6e97d8e.jpg', 'dImg/68f9df2598a3f940.jpg');
INSERT INTO `goods_detail` VALUES (15, 1000065, 'recoms/f998aac4996b41f6.jpg', '六品堂半生半熟宣纸100张书法专用纸作品纸国画工笔画初学者书法专用练习生宣纸熟宣纸写毛笔字四尺练字对开', '68.80', 'dImg/a1a30f86e1902d51.jpg', 'dImg/ebbc91665935c05c.jpg', 'dImg/03e8dca8c4bba347.jpg');
INSERT INTO `goods_detail` VALUES (16, 1000109, 'recoms/69e3333e793a3967.jpg', '荣宝斋 毛笔套装 文房四宝 大中小三支装兼毫毛笔套装 初学学生儿童书画行楷书行书毛笔 初学书画练习笔三支', '28.40', 'dImg/b6acda3b0aac53ee.jpg', 'dImg/f9df9f5b3881e03b.jpg', 'dImg/713f11f7056b05f0.jpg');

-- ----------------------------
-- Table structure for goods_hots
-- ----------------------------
DROP TABLE IF EXISTS `goods_hots`;
CREATE TABLE `goods_hots`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_id` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_hots
-- ----------------------------
INSERT INTO `goods_hots` VALUES (1, '荣宝斋挂轴', '全绫精裱空白书画卷轴 复古横幅挂画立轴 书法国画手工宣纸空白挂轴 四开竖挂轴', '22.90', '10', 'hots/5a720b265d36926f.jpg', 8659019);
INSERT INTO `goods_hots` VALUES (2, '善琏湖笔水写布', '水写布加厚仿宣水写书法布练习纸毛笔字帖初学者入门临摹清水练字文房四宝用品万次 空白水写布', '46.00', '3', 'hots/0ca1ca2899cfee48.jpg', 1002775);
INSERT INTO `goods_hots` VALUES (3, '善琏湖笔毛笔', '兼毫毛笔竹竿简约文房四宝毛笔初学者入门楷书行草写意工笔写经国画书法笔 简兮', '36.00', '8', 'hots/fd2ed4673866b369.jpg', 1003295);

-- ----------------------------
-- Table structure for goods_likes
-- ----------------------------
DROP TABLE IF EXISTS `goods_likes`;
CREATE TABLE `goods_likes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_id` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_likes
-- ----------------------------
INSERT INTO `goods_likes` VALUES (1, '荣宝斋墨锭', ' 墨锭 文房四宝 墨条墨块 胡开文徽墨毛笔书法国画用品 金不换', '18.90', '15', 'like/0b4d71bc9d51e3ee.jpg', 1000101);
INSERT INTO `goods_likes` VALUES (2, '善琏湖笔印章', '印章寿山石貔貅印刻字姓名印章私章古风书法落款篆刻闲章中国风硬笔书法印章雅致高档商务礼品定制 寿山石貔貅2.5', '168.00', '17', 'like/1bb42b57cf99bdbb.jpg', 1002536);
INSERT INTO `goods_likes` VALUES (3, '善琏湖笔毛笔', '狼毫小楷毛笔文房四宝国画书法楷书行草写意工笔写经蝇头小楷抄经笔书法软笔 净狼毫小楷三支装带礼盒', '103.00', '8', 'like/b94832e1ddd4c7fb.jpg', 1004697);
INSERT INTO `goods_likes` VALUES (4, '善琏湖笔毛毡', '毛笔书法毛毡学生国画灰色书法画毡文房四宝毛笔毛毡书法用毛毡垫布 50*70cm灰色毛毡', '32.00', '25', 'like/675997e3116daf80.jpg', 1002978);

-- ----------------------------
-- Table structure for goods_list
-- ----------------------------
DROP TABLE IF EXISTS `goods_list`;
CREATE TABLE `goods_list`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int UNSIGNED NULL DEFAULT NULL,
  `detail_id` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_list
-- ----------------------------
INSERT INTO `goods_list` VALUES (1, '荣宝斋挂轴', '全绫精裱空白书画卷轴 复古横幅挂画立轴 书法国画手工宣纸空白挂轴 四开竖挂轴', '22.90', '10', 'hots/5a720b265d36926f.jpg', '', 2, 8659019);
INSERT INTO `goods_list` VALUES (2, '善琏湖笔水写布', '水写布加厚仿宣水写书法布练习纸毛笔字帖初学者入门临摹清水练字文房四宝用品万次 空白水写布', '46.00', '3', 'hots/0ca1ca2899cfee48.jpg', '', 2, 1002775);
INSERT INTO `goods_list` VALUES (3, '善琏湖笔毛笔', '兼毫毛笔竹竿简约文房四宝毛笔初学者入门楷书行草写意工笔写经国画书法笔 简兮', '36.00', '8', 'hots/fd2ed4673866b369.jpg', '', 0, 1003295);
INSERT INTO `goods_list` VALUES (4, '一得阁四尺四开', '一得阁宣纸仿古色四尺四开半生半熟宣纸毛笔书法国画专用纸练习初学者创作作品用纸仿古色半熟宣100张', '28.40', '13', 'recoms/b93d9703d31c5996.jpg', NULL, 3, 1000061);
INSERT INTO `goods_list` VALUES (5, '成竹堂 毛笔套装初学者', '毛笔套装初学者文房四宝套装笔墨纸砚书法笔成人狼毫大中小楷砚台毛笔架国画工具箱小学生儿童练字 学生推荐款：22件套带工具箱款(无笔架印章)', '59.80', '30', 'recoms/bad8b91d49325a1c.jpg', NULL, 4, 5934475);
INSERT INTO `goods_list` VALUES (6, '六品堂半生半熟宣纸', '100张书法专用纸作品纸国画工笔画初学者书法专用练习生宣纸熟宣纸写毛笔字四尺练字对开', '68.80', '18', 'recoms/f998aac4996b41f6.jpg', NULL, 5, 1000065);
INSERT INTO `goods_list` VALUES (7, '荣宝斋毛笔', '毛笔套装 文房四宝 大中小三支装兼毫毛笔套装 初学学生儿童书画行楷书行书毛笔 初学书画练习笔三支', '28.40', '24', 'recoms/69e3333e793a3967.jpg', NULL, 6, 1000109);
INSERT INTO `goods_list` VALUES (8, '得力文房四宝书法套装', '学生成人(毛笔/墨水/墨碟/葫芦型笔搁/字帖) 练字帖毛笔 初学入门款74290', '30.80', '11', 'news/836cf485bfdd0f45.jpg', NULL, 7, 7204153);
INSERT INTO `goods_list` VALUES (9, '天天练青云梅花墨碟', '陶瓷水碟搁笔盛墨笔掭文房书法用品 TN-0744', '8.90', '30', 'news/25e9ea630074b873.jpg', NULL, 8, 1000390);
INSERT INTO `goods_list` VALUES (10, '六品堂镇尺', '文房四宝书法镇尺镇纸 黑梓木红木书枕 国画用品', '36.00', '8', 'news/2c2fad3e05764137.jpg', NULL, 8, 1000017);
INSERT INTO `goods_list` VALUES (11, '六品堂笔山笔架', '文房四宝 笔山笔架 毛笔书法用品 笔搁 毛笔架-五指山红木山叉', '11.20', '15', 'news/bf30585aac752d0d.jpg', NULL, 7, 1000100);
INSERT INTO `goods_list` VALUES (12, '善琏湖笔澄泥砚', '砚台端砚火锅砚 澄泥砚歙砚成人学生书法绘画用品文房四宝墨条磨墨墨池墨海墨盒初学者书法练习 澄泥砚砚台1个', '49.80', '20', 'news/c8b1605886deff8f.jpg', NULL, 6, 5162977);
INSERT INTO `goods_list` VALUES (13, '荣宝斋墨锭', ' 墨锭 文房四宝 墨条墨块 胡开文徽墨毛笔书法国画用品 金不换', '18.90', '15', 'like/0b4d71bc9d51e3ee.jpg', NULL, 5, 1000101);
INSERT INTO `goods_list` VALUES (14, '善琏湖笔印章', '印章寿山石貔貅印刻字姓名印章私章古风书法落款篆刻闲章中国风硬笔书法印章雅致高档商务礼品定制 寿山石貔貅2.5', '168.00', '17', 'like/1bb42b57cf99bdbb.jpg', NULL, 3, 1002536);
INSERT INTO `goods_list` VALUES (15, '善琏湖笔毛笔', '狼毫小楷毛笔文房四宝国画书法楷书行草写意工笔写经蝇头小楷抄经笔书法软笔 净狼毫小楷三支装带礼盒', '103.00', '8', 'like/b94832e1ddd4c7fb.jpg', NULL, 4, 1004697);
INSERT INTO `goods_list` VALUES (16, '善琏湖笔毛毡', '毛笔书法毛毡学生国画灰色书法画毡文房四宝毛笔毛毡书法用毛毡垫布 50*70cm灰色毛毡', '32.00', '25', 'like/675997e3116daf80.jpg', NULL, 2, 1002978);
INSERT INTO `goods_list` VALUES (17, '荣宝斋挂轴', '全绫精裱空白书画卷轴 复古横幅挂画立轴 书法国画手工宣纸空白挂轴 四开竖挂轴', '22.90', '10', 'hots/5a720b265d36926f.jpg', '', 1, 8659019);
INSERT INTO `goods_list` VALUES (18, '善琏湖笔水写布', '水写布加厚仿宣水写书法布练习纸毛笔字帖初学者入门临摹清水练字文房四宝用品万次 空白水写布', '46.00', '3', 'hots/0ca1ca2899cfee48.jpg', '', 0, 1002775);
INSERT INTO `goods_list` VALUES (19, '善琏湖笔毛笔', '兼毫毛笔竹竿简约文房四宝毛笔初学者入门楷书行草写意工笔写经国画书法笔 简兮', '36.00', '8', 'hots/fd2ed4673866b369.jpg', '', 4, 1003295);
INSERT INTO `goods_list` VALUES (20, '一得阁四尺四开', '一得阁宣纸仿古色四尺四开半生半熟宣纸毛笔书法国画专用纸练习初学者创作作品用纸仿古色半熟宣100张', '28.40', '13', 'recoms/b93d9703d31c5996.jpg', NULL, 5, 1000061);
INSERT INTO `goods_list` VALUES (21, '成竹堂 毛笔套装初学者', '毛笔套装初学者文房四宝套装笔墨纸砚书法笔成人狼毫大中小楷砚台毛笔架国画工具箱小学生儿童练字 学生推荐款：22件套带工具箱款(无笔架印章)', '59.80', '30', 'recoms/bad8b91d49325a1c.jpg', NULL, 3, 5934475);
INSERT INTO `goods_list` VALUES (22, '六品堂半生半熟宣纸', '100张书法专用纸作品纸国画工笔画初学者书法专用练习生宣纸熟宣纸写毛笔字四尺练字对开', '68.80', '18', 'recoms/f998aac4996b41f6.jpg', NULL, 6, 1000065);
INSERT INTO `goods_list` VALUES (23, '荣宝斋毛笔', '毛笔套装 文房四宝 大中小三支装兼毫毛笔套装 初学学生儿童书画行楷书行书毛笔 初学书画练习笔三支', '28.40', '24', 'recoms/69e3333e793a3967.jpg', NULL, 5, 1000109);
INSERT INTO `goods_list` VALUES (24, '得力文房四宝书法套装', '学生成人(毛笔/墨水/墨碟/葫芦型笔搁/字帖) 练字帖毛笔 初学入门款74290', '30.80', '11', 'news/836cf485bfdd0f45.jpg', NULL, 3, 7204153);
INSERT INTO `goods_list` VALUES (25, '天天练青云梅花墨碟', '陶瓷水碟搁笔盛墨笔掭文房书法用品 TN-0744', '8.90', '30', 'news/25e9ea630074b873.jpg', NULL, 1, 1000390);
INSERT INTO `goods_list` VALUES (26, '六品堂镇尺', '文房四宝书法镇尺镇纸 黑梓木红木书枕 国画用品', '36.00', '8', 'news/2c2fad3e05764137.jpg', NULL, 4, 1000017);
INSERT INTO `goods_list` VALUES (27, '六品堂笔山笔架', '文房四宝 笔山笔架 毛笔书法用品 笔搁 毛笔架-五指山红木山叉', '11.20', '15', 'news/bf30585aac752d0d.jpg', NULL, 3, 1000100);
INSERT INTO `goods_list` VALUES (28, '善琏湖笔澄泥砚', '砚台端砚火锅砚 澄泥砚歙砚成人学生书法绘画用品文房四宝墨条磨墨墨池墨海墨盒初学者书法练习 澄泥砚砚台1个', '49.80', '20', 'news/c8b1605886deff8f.jpg', NULL, 2, 5162977);
INSERT INTO `goods_list` VALUES (29, '荣宝斋墨锭', ' 墨锭 文房四宝 墨条墨块 胡开文徽墨毛笔书法国画用品 金不换', '18.90', '15', 'like/0b4d71bc9d51e3ee.jpg', NULL, 3, 1000101);
INSERT INTO `goods_list` VALUES (30, '善琏湖笔印章', '印章寿山石貔貅印刻字姓名印章私章古风书法落款篆刻闲章中国风硬笔书法印章雅致高档商务礼品定制 寿山石貔貅2.5', '168.00', '17', 'like/1bb42b57cf99bdbb.jpg', NULL, 4, 1002536);
INSERT INTO `goods_list` VALUES (31, '善琏湖笔毛笔', '狼毫小楷毛笔文房四宝国画书法楷书行草写意工笔写经蝇头小楷抄经笔书法软笔 净狼毫小楷三支装带礼盒', '103.00', '8', 'like/b94832e1ddd4c7fb.jpg', NULL, 5, 1004697);
INSERT INTO `goods_list` VALUES (32, '善琏湖笔毛笔', '兼毫毛笔竹竿简约文房四宝毛笔初学者入门楷书行草写意工笔写经国画书法笔 简兮', '36.00', '8', 'hots/fd2ed4673866b369.jpg', '', 7, 1003295);
INSERT INTO `goods_list` VALUES (71, '荣宝斋挂轴', '全绫精裱空白书画卷轴 复古横幅挂画立轴 书法国画手工宣纸空白挂轴 四开竖挂轴', '22.90', '10', 'hots/5a720b265d36926f.jpg', '', 0, 8659019);
INSERT INTO `goods_list` VALUES (72, '善琏湖笔水写布', '水写布加厚仿宣水写书法布练习纸毛笔字帖初学者入门临摹清水练字文房四宝用品万次 空白水写布', '46.00', '3', 'hots/0ca1ca2899cfee48.jpg', '', 1, 1002775);
INSERT INTO `goods_list` VALUES (73, '善琏湖笔毛笔', '兼毫毛笔竹竿简约文房四宝毛笔初学者入门楷书行草写意工笔写经国画书法笔 简兮', '36.00', '8', 'hots/fd2ed4673866b369.jpg', '', 2, 1003295);
INSERT INTO `goods_list` VALUES (74, '一得阁四尺四开', '一得阁宣纸仿古色四尺四开半生半熟宣纸毛笔书法国画专用纸练习初学者创作作品用纸仿古色半熟宣100张', '28.40', '13', 'recoms/b93d9703d31c5996.jpg', NULL, 3, 1000061);
INSERT INTO `goods_list` VALUES (75, '成竹堂 毛笔套装初学者', '毛笔套装初学者文房四宝套装笔墨纸砚书法笔成人狼毫大中小楷砚台毛笔架国画工具箱小学生儿童练字 学生推荐款：22件套带工具箱款(无笔架印章)', '59.80', '30', 'recoms/bad8b91d49325a1c.jpg', NULL, 4, 5934475);
INSERT INTO `goods_list` VALUES (76, '六品堂半生半熟宣纸', '100张书法专用纸作品纸国画工笔画初学者书法专用练习生宣纸熟宣纸写毛笔字四尺练字对开', '68.80', '18', 'recoms/f998aac4996b41f6.jpg', NULL, 5, 1000065);
INSERT INTO `goods_list` VALUES (77, '荣宝斋毛笔', '毛笔套装 文房四宝 大中小三支装兼毫毛笔套装 初学学生儿童书画行楷书行书毛笔 初学书画练习笔三支', '28.40', '24', 'recoms/69e3333e793a3967.jpg', NULL, 6, 1000109);
INSERT INTO `goods_list` VALUES (78, '得力文房四宝书法套装', '学生成人(毛笔/墨水/墨碟/葫芦型笔搁/字帖) 练字帖毛笔 初学入门款74290', '30.80', '11', 'news/836cf485bfdd0f45.jpg', NULL, 7, 7204153);
INSERT INTO `goods_list` VALUES (79, '天天练青云梅花墨碟', '陶瓷水碟搁笔盛墨笔掭文房书法用品 TN-0744', '8.90', '30', 'news/25e9ea630074b873.jpg', NULL, 0, 1000390);
INSERT INTO `goods_list` VALUES (80, '六品堂镇尺', '文房四宝书法镇尺镇纸 黑梓木红木书枕 国画用品', '36.00', '8', 'news/2c2fad3e05764137.jpg', NULL, 8, 1000017);
INSERT INTO `goods_list` VALUES (81, '六品堂笔山笔架', '文房四宝 笔山笔架 毛笔书法用品 笔搁 毛笔架-五指山红木山叉', '11.20', '15', 'news/bf30585aac752d0d.jpg', NULL, 1, 1000100);
INSERT INTO `goods_list` VALUES (82, '善琏湖笔澄泥砚', '砚台端砚火锅砚 澄泥砚歙砚成人学生书法绘画用品文房四宝墨条磨墨墨池墨海墨盒初学者书法练习 澄泥砚砚台1个', '49.80', '20', 'news/c8b1605886deff8f.jpg', NULL, 8, 5162977);
INSERT INTO `goods_list` VALUES (83, '荣宝斋墨锭', ' 墨锭 文房四宝 墨条墨块 胡开文徽墨毛笔书法国画用品 金不换', '18.90', '15', 'like/0b4d71bc9d51e3ee.jpg', NULL, 3, 1000101);
INSERT INTO `goods_list` VALUES (84, '善琏湖笔印章', '印章寿山石貔貅印刻字姓名印章私章古风书法落款篆刻闲章中国风硬笔书法印章雅致高档商务礼品定制 寿山石貔貅2.5', '168.00', '17', 'like/1bb42b57cf99bdbb.jpg', NULL, 4, 1002536);
INSERT INTO `goods_list` VALUES (85, '善琏湖笔毛笔', '狼毫小楷毛笔文房四宝国画书法楷书行草写意工笔写经蝇头小楷抄经笔书法软笔 净狼毫小楷三支装带礼盒', '103.00', '8', 'like/b94832e1ddd4c7fb.jpg', NULL, 5, 1004697);
INSERT INTO `goods_list` VALUES (86, '善琏湖笔毛毡', '毛笔书法毛毡学生国画灰色书法画毡文房四宝毛笔毛毡书法用毛毡垫布 50*70cm灰色毛毡', '32.00', '25', 'like/675997e3116daf80.jpg', NULL, 6, 1002978);
INSERT INTO `goods_list` VALUES (87, '荣宝斋挂轴', '全绫精裱空白书画卷轴 复古横幅挂画立轴 书法国画手工宣纸空白挂轴 四开竖挂轴', '22.90', '10', 'hots/5a720b265d36926f.jpg', '', 0, 8659019);
INSERT INTO `goods_list` VALUES (88, '善琏湖笔水写布', '水写布加厚仿宣水写书法布练习纸毛笔字帖初学者入门临摹清水练字文房四宝用品万次 空白水写布', '46.00', '3', 'hots/0ca1ca2899cfee48.jpg', '', 1, 1002775);
INSERT INTO `goods_list` VALUES (89, '善琏湖笔毛笔', '兼毫毛笔竹竿简约文房四宝毛笔初学者入门楷书行草写意工笔写经国画书法笔 简兮', '36.00', '8', 'hots/fd2ed4673866b369.jpg', '', 2, 1003295);
INSERT INTO `goods_list` VALUES (90, '一得阁四尺四开', '一得阁宣纸仿古色四尺四开半生半熟宣纸毛笔书法国画专用纸练习初学者创作作品用纸仿古色半熟宣100张', '28.40', '13', 'recoms/b93d9703d31c5996.jpg', NULL, 3, 1000061);
INSERT INTO `goods_list` VALUES (91, '成竹堂 毛笔套装初学者', '毛笔套装初学者文房四宝套装笔墨纸砚书法笔成人狼毫大中小楷砚台毛笔架国画工具箱小学生儿童练字 学生推荐款：22件套带工具箱款(无笔架印章)', '59.80', '30', 'recoms/bad8b91d49325a1c.jpg', NULL, 4, 5934475);
INSERT INTO `goods_list` VALUES (92, '六品堂半生半熟宣纸', '100张书法专用纸作品纸国画工笔画初学者书法专用练习生宣纸熟宣纸写毛笔字四尺练字对开', '68.80', '18', 'recoms/f998aac4996b41f6.jpg', NULL, 5, 1000065);
INSERT INTO `goods_list` VALUES (93, '荣宝斋毛笔', '毛笔套装 文房四宝 大中小三支装兼毫毛笔套装 初学学生儿童书画行楷书行书毛笔 初学书画练习笔三支', '28.40', '24', 'recoms/69e3333e793a3967.jpg', NULL, 6, 1000109);
INSERT INTO `goods_list` VALUES (94, '得力文房四宝书法套装', '学生成人(毛笔/墨水/墨碟/葫芦型笔搁/字帖) 练字帖毛笔 初学入门款74290', '30.80', '11', 'news/836cf485bfdd0f45.jpg', NULL, 7, 7204153);
INSERT INTO `goods_list` VALUES (95, '天天练青云梅花墨碟', '陶瓷水碟搁笔盛墨笔掭文房书法用品 TN-0744', '8.90', '30', 'news/25e9ea630074b873.jpg', NULL, 8, 1000390);
INSERT INTO `goods_list` VALUES (96, '六品堂镇尺', '文房四宝书法镇尺镇纸 黑梓木红木书枕 国画用品', '36.00', '8', 'news/2c2fad3e05764137.jpg', NULL, 0, 1000017);
INSERT INTO `goods_list` VALUES (97, '六品堂笔山笔架', '文房四宝 笔山笔架 毛笔书法用品 笔搁 毛笔架-五指山红木山叉', '11.20', '15', 'news/bf30585aac752d0d.jpg', NULL, 1, 1000100);
INSERT INTO `goods_list` VALUES (98, '善琏湖笔澄泥砚', '砚台端砚火锅砚 澄泥砚歙砚成人学生书法绘画用品文房四宝墨条磨墨墨池墨海墨盒初学者书法练习 澄泥砚砚台1个', '49.80', '20', 'news/c8b1605886deff8f.jpg', NULL, 2, 5162977);
INSERT INTO `goods_list` VALUES (99, '荣宝斋墨锭', ' 墨锭 文房四宝 墨条墨块 胡开文徽墨毛笔书法国画用品 金不换', '18.90', '15', 'like/0b4d71bc9d51e3ee.jpg', NULL, 3, 1000101);
INSERT INTO `goods_list` VALUES (100, '善琏湖笔印章', '印章寿山石貔貅印刻字姓名印章私章古风书法落款篆刻闲章中国风硬笔书法印章雅致高档商务礼品定制 寿山石貔貅2.5', '168.00', '17', 'like/1bb42b57cf99bdbb.jpg', NULL, 4, 1002536);
INSERT INTO `goods_list` VALUES (101, '善琏湖笔毛笔', '狼毫小楷毛笔文房四宝国画书法楷书行草写意工笔写经蝇头小楷抄经笔书法软笔 净狼毫小楷三支装带礼盒', '103.00', '8', 'like/b94832e1ddd4c7fb.jpg', NULL, 5, 1004697);
INSERT INTO `goods_list` VALUES (102, '善琏湖笔毛笔', '兼毫毛笔竹竿简约文房四宝毛笔初学者入门楷书行草写意工笔写经国画书法笔 简兮', '36.00', '8', 'hots/fd2ed4673866b369.jpg', '', 7, 1003295);

-- ----------------------------
-- Table structure for goods_news
-- ----------------------------
DROP TABLE IF EXISTS `goods_news`;
CREATE TABLE `goods_news`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_id` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_news
-- ----------------------------
INSERT INTO `goods_news` VALUES (1, '得力文房四宝书法套装', '学生成人(毛笔/墨水/墨碟/葫芦型笔搁/字帖) 练字帖毛笔 初学入门款74290', '30.80', '11', 'news/836cf485bfdd0f45.jpg', 7204153);
INSERT INTO `goods_news` VALUES (2, '天天练青云梅花墨碟', '陶瓷水碟搁笔盛墨笔掭文房书法用品 TN-0744', '8.90', '30', 'news/25e9ea630074b873.jpg', 1000390);
INSERT INTO `goods_news` VALUES (3, '六品堂镇尺', '文房四宝书法镇尺镇纸 黑梓木红木书枕 国画用品', '36.00', '8', 'news/2c2fad3e05764137.jpg', 1000017);
INSERT INTO `goods_news` VALUES (4, '六品堂笔山笔架', '文房四宝 笔山笔架 毛笔书法用品 笔搁 毛笔架-五指山红木山叉', '11.20', '15', 'news/bf30585aac752d0d.jpg', 1000100);
INSERT INTO `goods_news` VALUES (5, '善琏湖笔澄泥砚', '砚台端砚火锅砚 澄泥砚歙砚成人学生书法绘画用品文房四宝墨条磨墨墨池墨海墨盒初学者书法练习 澄泥砚砚台1个', '49.80', '20', 'news/c8b1605886deff8f.jpg', 5162977);

-- ----------------------------
-- Table structure for goods_order
-- ----------------------------
DROP TABLE IF EXISTS `goods_order`;
CREATE TABLE `goods_order`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_num` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_order
-- ----------------------------
INSERT INTO `goods_order` VALUES (141, '20230314192225975835', '善琏湖笔 水写布加厚仿宣水写书法布练习纸毛笔字帖初学者入门临摹清水练字文房四宝用品万次 米字格水写布,荣宝斋 全绫精裱空白书画卷轴 复古横幅挂画立轴 书法国画手工宣纸空白挂轴 四开竖挂轴', '229.40', '8', '2', '14739711183', '2023-03-14 19:22:25', '2023-03-16 15:56:42');
INSERT INTO `goods_order` VALUES (145, '20230315174927662631', '荣宝斋 全绫精裱空白书画卷轴 复古横幅挂画立轴 书法国画手工宣纸空白挂轴 四开竖挂轴', '22.90', '1', '2', '15917403442', '2023-03-15 17:49:27', '2023-03-15 17:51:22');
INSERT INTO `goods_order` VALUES (146, '2023031517560280882', '善琏湖笔 水写布加厚仿宣水写书法布练习纸毛笔字帖初学者入门临摹清水练字文房四宝用品万次 米字格水写布', '46.00', '1', '2', '15917403442', '2023-03-15 17:56:02', '2023-03-15 17:56:08');
INSERT INTO `goods_order` VALUES (150, '20230315180607949429', '六品堂 文房四宝 笔山笔架 毛笔书法用品 笔搁 毛笔架-五指山红木山叉', '11.20', '1', '2', '15917403442', '2023-03-15 18:06:07', '2023-03-15 18:06:13');
INSERT INTO `goods_order` VALUES (152, '2023031518075041117', '得力(deli)文房四宝书法套装 学生成人(毛笔/墨水/墨碟/葫芦型笔搁/字帖) 练字帖毛笔 初学入门款74290', '30.80', '1', '2', '15917403442', '2023-03-15 18:07:50', '2023-03-15 18:07:56');
INSERT INTO `goods_order` VALUES (157, '20230315184453587592', '荣宝斋 全绫精裱空白书画卷轴 复古横幅挂画立轴 书法国画手工宣纸空白挂轴 四开竖挂轴', '22.90', '1', '2', '14739711183', '2023-03-15 18:44:53', '2023-03-20 13:43:47');
INSERT INTO `goods_order` VALUES (159, '20230316155610437492', '天天练(Tiantianlian)青云梅花墨碟 陶瓷水碟搁笔盛墨笔掭文房书法用品 TN-0744,六品堂 文房四宝 笔山笔架 毛笔书法用品 笔搁 毛笔架-五指山红木山叉', '20.10', '2', '2', '14739711183', '2023-03-16 15:56:10', '2023-03-16 16:30:02');
INSERT INTO `goods_order` VALUES (161, '20230316160431252532', '荣宝斋 全绫精裱空白书画卷轴 复古横幅挂画立轴 书法国画手工宣纸空白挂轴 四开竖挂轴', '22.90', '1', '2', '15917403442', '2023-03-16 16:04:31', '2023-03-16 16:06:29');
INSERT INTO `goods_order` VALUES (162, '20230316161004395595', '六品堂 文房四宝 笔山笔架 毛笔书法用品 笔搁 毛笔架-五指山红木山叉', '11.20', '1', '1', '15917403442', '2023-03-16 16:10:04', '2023-03-16 16:10:04');
INSERT INTO `goods_order` VALUES (163, '20230320140025698387', '天天练(Tiantianlian)青云梅花墨碟 陶瓷水碟搁笔盛墨笔掭文房书法用品 TN-0744,荣宝斋 全绫精裱空白书画卷轴 复古横幅挂画立轴 书法国画手工宣纸空白挂轴 四开竖挂轴', '31.80', '2', '1', '14739711183', '2023-03-20 14:00:25', '2023-03-20 14:00:25');
INSERT INTO `goods_order` VALUES (164, '20230320140913138428', '荣宝斋 全绫精裱空白书画卷轴 复古横幅挂画立轴 书法国画手工宣纸空白挂轴 四开竖挂轴', '22.90', '1', '2', '14739711183', '2023-03-20 14:09:13', '2023-03-20 14:09:46');
INSERT INTO `goods_order` VALUES (165, '20230320143225145643', '六品堂 文房四宝 笔山笔架 毛笔书法用品 笔搁 毛笔架-五指山红木山叉', '11.20', '1', '1', '14739711183', '2023-03-20 14:32:25', '2023-03-20 14:32:25');
INSERT INTO `goods_order` VALUES (166, '20230320170559657663', '荣宝斋 墨锭 文房四宝 墨条墨块 胡开文徽墨毛笔书法国画用品 金不换', '18.90', '1', '1', '14739711183', '2023-03-20 17:05:59', '2023-03-20 17:05:59');

-- ----------------------------
-- Table structure for goods_recoms
-- ----------------------------
DROP TABLE IF EXISTS `goods_recoms`;
CREATE TABLE `goods_recoms`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_id` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_recoms
-- ----------------------------
INSERT INTO `goods_recoms` VALUES (1, '一得阁四尺四开', '一得阁宣纸仿古色四尺四开半生半熟宣纸毛笔书法国画专用纸练习初学者创作作品用纸仿古色半熟宣100张', '28.40', '13', 'recoms/b93d9703d31c5996.jpg', 1000061);
INSERT INTO `goods_recoms` VALUES (2, '成竹堂 毛笔套装初学者', '毛笔套装初学者文房四宝套装笔墨纸砚书法笔成人狼毫大中小楷砚台毛笔架国画工具箱小学生儿童练字 学生推荐款：22件套带工具箱款(无笔架印章)', '59.80', '30', 'recoms/bad8b91d49325a1c.jpg', 5934475);
INSERT INTO `goods_recoms` VALUES (3, '六品堂半生半熟宣纸', '100张书法专用纸作品纸国画工笔画初学者书法专用练习生宣纸熟宣纸写毛笔字四尺练字对开', '68.80', '18', 'recoms/f998aac4996b41f6.jpg', 1000065);
INSERT INTO `goods_recoms` VALUES (4, '荣宝斋毛笔', '毛笔套装 文房四宝 大中小三支装兼毫毛笔套装 初学学生儿童书画行楷书行书毛笔 初学书画练习笔三支', '28.40', '24', 'recoms/69e3333e793a3967.jpg', 1000109);

-- ----------------------------
-- Table structure for goods_swiper
-- ----------------------------
DROP TABLE IF EXISTS `goods_swiper`;
CREATE TABLE `goods_swiper`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_swiper
-- ----------------------------
INSERT INTO `goods_swiper` VALUES (1, NULL, 'swipe/b4248aecac3141ae8b00758a781916a3.jpg');
INSERT INTO `goods_swiper` VALUES (2, NULL, 'swipe/2.jpg');
INSERT INTO `goods_swiper` VALUES (3, NULL, 'swipe/3.jpg');

-- ----------------------------
-- Table structure for list_title
-- ----------------------------
DROP TABLE IF EXISTS `list_title`;
CREATE TABLE `list_title`  (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_title
-- ----------------------------
INSERT INTO `list_title` VALUES (1, '墨水');
INSERT INTO `list_title` VALUES (2, '毛笔套装');
INSERT INTO `list_title` VALUES (3, '墨锭套装');
INSERT INTO `list_title` VALUES (4, '文房四宝套装');
INSERT INTO `list_title` VALUES (5, '镇尺套装');
INSERT INTO `list_title` VALUES (6, '笔筒套装');
INSERT INTO `list_title` VALUES (7, '钢笔套装');
INSERT INTO `list_title` VALUES (8, '其他');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `userTel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '14739711183', 'hlljj748', NULL);
INSERT INTO `user_info` VALUES (2, '15917403442', '654321', NULL);

SET FOREIGN_KEY_CHECKS = 1;
