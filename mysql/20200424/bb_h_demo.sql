/*
 Navicat Premium Data Transfer

 Source Server         : 101.132.243.52(ali)
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 101.132.243.52:33060
 Source Schema         : bb_h_demo

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 24/04/2020 12:29:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `full` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `mobilephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '详细地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '111', '111', '11111111');
INSERT INTO `address` VALUES (2, '张三2', '上海陆家嘴', '13524523888');
INSERT INTO `address` VALUES (3, '张三3', '上海陆家嘴', '13524523888');
INSERT INTO `address` VALUES (4, '张三4', '上海陆家嘴', '13524523888');
INSERT INTO `address` VALUES (100, '1111111111111', '11111', '11111111111111');
INSERT INTO `address` VALUES (107, '11', '1', '111');
INSERT INTO `address` VALUES (108, '1111', '111', '11');
INSERT INTO `address` VALUES (109, '王麻子', '王麻子', '王麻子');
INSERT INTO `address` VALUES (110, '王麻子1', '王麻子1', '王麻子1');
INSERT INTO `address` VALUES (111, '1111', '2222', '111111111111111');
INSERT INTO `address` VALUES (112, '1', '1', '1');
INSERT INTO `address` VALUES (113, '11', '1111111', '11111111111111');
INSERT INTO `address` VALUES (114, '111', '111', '111');
INSERT INTO `address` VALUES (115, '111', '111', '111');
INSERT INTO `address` VALUES (116, '111', '111', '111');
INSERT INTO `address` VALUES (117, '1', '111111', '11111111111111');
INSERT INTO `address` VALUES (123, '111', '111111', '11111111111111');
INSERT INTO `address` VALUES (124, '55555555', '555555555', '5555555');
INSERT INTO `address` VALUES (125, '111', '111', '111');

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `pid` int(11) NOT NULL COMMENT '父级',
  `lv` int(11) NOT NULL COMMENT '级别：0=中国,1=省,2=市,3=区',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid_index`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3411 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, '中国', 0, 0);
INSERT INTO `area` VALUES (2, '北京', 1, 1);
INSERT INTO `area` VALUES (3, '安徽', 1, 1);
INSERT INTO `area` VALUES (4, '福建', 1, 1);
INSERT INTO `area` VALUES (5, '甘肃', 1, 1);
INSERT INTO `area` VALUES (6, '广东', 1, 1);
INSERT INTO `area` VALUES (7, '广西', 1, 1);
INSERT INTO `area` VALUES (8, '贵州', 1, 1);
INSERT INTO `area` VALUES (9, '海南', 1, 1);
INSERT INTO `area` VALUES (10, '河北', 1, 1);
INSERT INTO `area` VALUES (11, '河南', 1, 1);
INSERT INTO `area` VALUES (12, '黑龙江', 1, 1);
INSERT INTO `area` VALUES (13, '湖北', 1, 1);
INSERT INTO `area` VALUES (14, '湖南', 1, 1);
INSERT INTO `area` VALUES (15, '吉林', 1, 1);
INSERT INTO `area` VALUES (16, '江苏', 1, 1);
INSERT INTO `area` VALUES (17, '江西', 1, 1);
INSERT INTO `area` VALUES (18, '辽宁', 1, 1);
INSERT INTO `area` VALUES (19, '内蒙古', 1, 1);
INSERT INTO `area` VALUES (20, '宁夏', 1, 1);
INSERT INTO `area` VALUES (21, '青海', 1, 1);
INSERT INTO `area` VALUES (22, '山东', 1, 1);
INSERT INTO `area` VALUES (23, '山西', 1, 1);
INSERT INTO `area` VALUES (24, '陕西', 1, 1);
INSERT INTO `area` VALUES (25, '上海', 1, 1);
INSERT INTO `area` VALUES (26, '四川', 1, 1);
INSERT INTO `area` VALUES (27, '天津', 1, 1);
INSERT INTO `area` VALUES (28, '西藏', 1, 1);
INSERT INTO `area` VALUES (29, '新疆', 1, 1);
INSERT INTO `area` VALUES (30, '云南', 1, 1);
INSERT INTO `area` VALUES (31, '浙江', 1, 1);
INSERT INTO `area` VALUES (32, '重庆', 1, 1);
INSERT INTO `area` VALUES (33, '香港', 1, 1);
INSERT INTO `area` VALUES (34, '澳门', 1, 1);
INSERT INTO `area` VALUES (35, '台湾', 1, 1);
INSERT INTO `area` VALUES (36, '安庆', 3, 2);
INSERT INTO `area` VALUES (37, '蚌埠', 3, 2);
INSERT INTO `area` VALUES (38, '巢湖', 3, 2);
INSERT INTO `area` VALUES (39, '池州', 3, 2);
INSERT INTO `area` VALUES (40, '滁州', 3, 2);
INSERT INTO `area` VALUES (41, '阜阳', 3, 2);
INSERT INTO `area` VALUES (42, '淮北', 3, 2);
INSERT INTO `area` VALUES (43, '淮南', 3, 2);
INSERT INTO `area` VALUES (44, '黄山', 3, 2);
INSERT INTO `area` VALUES (45, '六安', 3, 2);
INSERT INTO `area` VALUES (46, '马鞍山', 3, 2);
INSERT INTO `area` VALUES (47, '宿州', 3, 2);
INSERT INTO `area` VALUES (48, '铜陵', 3, 2);
INSERT INTO `area` VALUES (49, '芜湖', 3, 2);
INSERT INTO `area` VALUES (50, '宣城', 3, 2);
INSERT INTO `area` VALUES (51, '亳州', 3, 2);
INSERT INTO `area` VALUES (53, '福州', 4, 2);
INSERT INTO `area` VALUES (54, '龙岩', 4, 2);
INSERT INTO `area` VALUES (55, '南平', 4, 2);
INSERT INTO `area` VALUES (56, '宁德', 4, 2);
INSERT INTO `area` VALUES (57, '莆田', 4, 2);
INSERT INTO `area` VALUES (58, '泉州', 4, 2);
INSERT INTO `area` VALUES (59, '三明', 4, 2);
INSERT INTO `area` VALUES (60, '厦门', 4, 2);
INSERT INTO `area` VALUES (61, '漳州', 4, 2);
INSERT INTO `area` VALUES (62, '兰州', 5, 2);
INSERT INTO `area` VALUES (63, '白银', 5, 2);
INSERT INTO `area` VALUES (64, '定西', 5, 2);
INSERT INTO `area` VALUES (65, '甘南', 5, 2);
INSERT INTO `area` VALUES (66, '嘉峪关', 5, 2);
INSERT INTO `area` VALUES (67, '金昌', 5, 2);
INSERT INTO `area` VALUES (68, '酒泉', 5, 2);
INSERT INTO `area` VALUES (69, '临夏', 5, 2);
INSERT INTO `area` VALUES (70, '陇南', 5, 2);
INSERT INTO `area` VALUES (71, '平凉', 5, 2);
INSERT INTO `area` VALUES (72, '庆阳', 5, 2);
INSERT INTO `area` VALUES (73, '天水', 5, 2);
INSERT INTO `area` VALUES (74, '武威', 5, 2);
INSERT INTO `area` VALUES (75, '张掖', 5, 2);
INSERT INTO `area` VALUES (76, '广州', 6, 2);
INSERT INTO `area` VALUES (77, '深圳', 6, 2);
INSERT INTO `area` VALUES (78, '潮州', 6, 2);
INSERT INTO `area` VALUES (79, '东莞', 6, 2);
INSERT INTO `area` VALUES (80, '佛山', 6, 2);
INSERT INTO `area` VALUES (81, '河源', 6, 2);
INSERT INTO `area` VALUES (82, '惠州', 6, 2);
INSERT INTO `area` VALUES (83, '江门', 6, 2);
INSERT INTO `area` VALUES (84, '揭阳', 6, 2);
INSERT INTO `area` VALUES (85, '茂名', 6, 2);
INSERT INTO `area` VALUES (86, '梅州', 6, 2);
INSERT INTO `area` VALUES (87, '清远', 6, 2);
INSERT INTO `area` VALUES (88, '汕头', 6, 2);
INSERT INTO `area` VALUES (89, '汕尾', 6, 2);
INSERT INTO `area` VALUES (90, '韶关', 6, 2);
INSERT INTO `area` VALUES (91, '阳江', 6, 2);
INSERT INTO `area` VALUES (92, '云浮', 6, 2);
INSERT INTO `area` VALUES (93, '湛江', 6, 2);
INSERT INTO `area` VALUES (94, '肇庆', 6, 2);
INSERT INTO `area` VALUES (95, '中山', 6, 2);
INSERT INTO `area` VALUES (96, '珠海', 6, 2);
INSERT INTO `area` VALUES (97, '南宁', 7, 2);
INSERT INTO `area` VALUES (98, '桂林', 7, 2);
INSERT INTO `area` VALUES (99, '百色', 7, 2);
INSERT INTO `area` VALUES (100, '北海', 7, 2);
INSERT INTO `area` VALUES (101, '崇左', 7, 2);
INSERT INTO `area` VALUES (102, '防城港', 7, 2);
INSERT INTO `area` VALUES (103, '贵港', 7, 2);
INSERT INTO `area` VALUES (104, '河池', 7, 2);
INSERT INTO `area` VALUES (105, '贺州', 7, 2);
INSERT INTO `area` VALUES (106, '来宾', 7, 2);
INSERT INTO `area` VALUES (107, '柳州', 7, 2);
INSERT INTO `area` VALUES (108, '钦州', 7, 2);
INSERT INTO `area` VALUES (109, '梧州', 7, 2);
INSERT INTO `area` VALUES (110, '玉林', 7, 2);
INSERT INTO `area` VALUES (111, '贵阳', 8, 2);
INSERT INTO `area` VALUES (112, '安顺', 8, 2);
INSERT INTO `area` VALUES (113, '毕节', 8, 2);
INSERT INTO `area` VALUES (114, '六盘水', 8, 2);
INSERT INTO `area` VALUES (115, '黔东南', 8, 2);
INSERT INTO `area` VALUES (116, '黔南', 8, 2);
INSERT INTO `area` VALUES (117, '黔西南', 8, 2);
INSERT INTO `area` VALUES (118, '铜仁', 8, 2);
INSERT INTO `area` VALUES (119, '遵义', 8, 2);
INSERT INTO `area` VALUES (120, '海口', 9, 2);
INSERT INTO `area` VALUES (121, '三亚', 9, 2);
INSERT INTO `area` VALUES (122, '白沙', 9, 2);
INSERT INTO `area` VALUES (123, '保亭', 9, 2);
INSERT INTO `area` VALUES (124, '昌江', 9, 2);
INSERT INTO `area` VALUES (125, '澄迈县', 9, 2);
INSERT INTO `area` VALUES (126, '定安县', 9, 2);
INSERT INTO `area` VALUES (127, '东方', 9, 2);
INSERT INTO `area` VALUES (128, '乐东', 9, 2);
INSERT INTO `area` VALUES (129, '临高县', 9, 2);
INSERT INTO `area` VALUES (130, '陵水', 9, 2);
INSERT INTO `area` VALUES (131, '琼海', 9, 2);
INSERT INTO `area` VALUES (132, '琼中', 9, 2);
INSERT INTO `area` VALUES (133, '屯昌县', 9, 2);
INSERT INTO `area` VALUES (134, '万宁', 9, 2);
INSERT INTO `area` VALUES (135, '文昌', 9, 2);
INSERT INTO `area` VALUES (136, '五指山', 9, 2);
INSERT INTO `area` VALUES (137, '儋州', 9, 2);
INSERT INTO `area` VALUES (138, '石家庄', 10, 2);
INSERT INTO `area` VALUES (139, '保定', 10, 2);
INSERT INTO `area` VALUES (140, '沧州', 10, 2);
INSERT INTO `area` VALUES (141, '承德', 10, 2);
INSERT INTO `area` VALUES (142, '邯郸', 10, 2);
INSERT INTO `area` VALUES (143, '衡水', 10, 2);
INSERT INTO `area` VALUES (144, '廊坊', 10, 2);
INSERT INTO `area` VALUES (145, '秦皇岛', 10, 2);
INSERT INTO `area` VALUES (146, '唐山', 10, 2);
INSERT INTO `area` VALUES (147, '邢台', 10, 2);
INSERT INTO `area` VALUES (148, '张家口', 10, 2);
INSERT INTO `area` VALUES (149, '郑州', 11, 2);
INSERT INTO `area` VALUES (150, '洛阳', 11, 2);
INSERT INTO `area` VALUES (151, '开封', 11, 2);
INSERT INTO `area` VALUES (152, '安阳', 11, 2);
INSERT INTO `area` VALUES (153, '鹤壁', 11, 2);
INSERT INTO `area` VALUES (154, '济源', 11, 2);
INSERT INTO `area` VALUES (155, '焦作', 11, 2);
INSERT INTO `area` VALUES (156, '南阳', 11, 2);
INSERT INTO `area` VALUES (157, '平顶山', 11, 2);
INSERT INTO `area` VALUES (158, '三门峡', 11, 2);
INSERT INTO `area` VALUES (159, '商丘', 11, 2);
INSERT INTO `area` VALUES (160, '新乡', 11, 2);
INSERT INTO `area` VALUES (161, '信阳', 11, 2);
INSERT INTO `area` VALUES (162, '许昌', 11, 2);
INSERT INTO `area` VALUES (163, '周口', 11, 2);
INSERT INTO `area` VALUES (164, '驻马店', 11, 2);
INSERT INTO `area` VALUES (165, '漯河', 11, 2);
INSERT INTO `area` VALUES (166, '濮阳', 11, 2);
INSERT INTO `area` VALUES (167, '哈尔滨', 12, 2);
INSERT INTO `area` VALUES (168, '大庆', 12, 2);
INSERT INTO `area` VALUES (169, '大兴安岭', 12, 2);
INSERT INTO `area` VALUES (170, '鹤岗', 12, 2);
INSERT INTO `area` VALUES (171, '黑河', 12, 2);
INSERT INTO `area` VALUES (172, '鸡西', 12, 2);
INSERT INTO `area` VALUES (173, '佳木斯', 12, 2);
INSERT INTO `area` VALUES (174, '牡丹江', 12, 2);
INSERT INTO `area` VALUES (175, '七台河', 12, 2);
INSERT INTO `area` VALUES (176, '齐齐哈尔', 12, 2);
INSERT INTO `area` VALUES (177, '双鸭山', 12, 2);
INSERT INTO `area` VALUES (178, '绥化', 12, 2);
INSERT INTO `area` VALUES (179, '伊春', 12, 2);
INSERT INTO `area` VALUES (180, '武汉', 13, 2);
INSERT INTO `area` VALUES (181, '仙桃', 13, 2);
INSERT INTO `area` VALUES (182, '鄂州', 13, 2);
INSERT INTO `area` VALUES (183, '黄冈', 13, 2);
INSERT INTO `area` VALUES (184, '黄石', 13, 2);
INSERT INTO `area` VALUES (185, '荆门', 13, 2);
INSERT INTO `area` VALUES (186, '荆州', 13, 2);
INSERT INTO `area` VALUES (187, '潜江', 13, 2);
INSERT INTO `area` VALUES (188, '神农架林区', 13, 2);
INSERT INTO `area` VALUES (189, '十堰', 13, 2);
INSERT INTO `area` VALUES (190, '随州', 13, 2);
INSERT INTO `area` VALUES (191, '天门', 13, 2);
INSERT INTO `area` VALUES (192, '咸宁', 13, 2);
INSERT INTO `area` VALUES (193, '襄樊', 13, 2);
INSERT INTO `area` VALUES (194, '孝感', 13, 2);
INSERT INTO `area` VALUES (195, '宜昌', 13, 2);
INSERT INTO `area` VALUES (196, '恩施', 13, 2);
INSERT INTO `area` VALUES (197, '长沙', 14, 2);
INSERT INTO `area` VALUES (198, '张家界', 14, 2);
INSERT INTO `area` VALUES (199, '常德', 14, 2);
INSERT INTO `area` VALUES (200, '郴州', 14, 2);
INSERT INTO `area` VALUES (201, '衡阳', 14, 2);
INSERT INTO `area` VALUES (202, '怀化', 14, 2);
INSERT INTO `area` VALUES (203, '娄底', 14, 2);
INSERT INTO `area` VALUES (204, '邵阳', 14, 2);
INSERT INTO `area` VALUES (205, '湘潭', 14, 2);
INSERT INTO `area` VALUES (206, '湘西', 14, 2);
INSERT INTO `area` VALUES (207, '益阳', 14, 2);
INSERT INTO `area` VALUES (208, '永州', 14, 2);
INSERT INTO `area` VALUES (209, '岳阳', 14, 2);
INSERT INTO `area` VALUES (210, '株洲', 14, 2);
INSERT INTO `area` VALUES (211, '长春', 15, 2);
INSERT INTO `area` VALUES (212, '吉林', 15, 2);
INSERT INTO `area` VALUES (213, '白城', 15, 2);
INSERT INTO `area` VALUES (214, '白山', 15, 2);
INSERT INTO `area` VALUES (215, '辽源', 15, 2);
INSERT INTO `area` VALUES (216, '四平', 15, 2);
INSERT INTO `area` VALUES (217, '松原', 15, 2);
INSERT INTO `area` VALUES (218, '通化', 15, 2);
INSERT INTO `area` VALUES (219, '延边', 15, 2);
INSERT INTO `area` VALUES (220, '南京', 16, 2);
INSERT INTO `area` VALUES (221, '苏州', 16, 2);
INSERT INTO `area` VALUES (222, '无锡', 16, 2);
INSERT INTO `area` VALUES (223, '常州', 16, 2);
INSERT INTO `area` VALUES (224, '淮安', 16, 2);
INSERT INTO `area` VALUES (225, '连云港', 16, 2);
INSERT INTO `area` VALUES (226, '南通', 16, 2);
INSERT INTO `area` VALUES (227, '宿迁', 16, 2);
INSERT INTO `area` VALUES (228, '泰州', 16, 2);
INSERT INTO `area` VALUES (229, '徐州', 16, 2);
INSERT INTO `area` VALUES (230, '盐城', 16, 2);
INSERT INTO `area` VALUES (231, '扬州', 16, 2);
INSERT INTO `area` VALUES (232, '镇江', 16, 2);
INSERT INTO `area` VALUES (233, '南昌', 17, 2);
INSERT INTO `area` VALUES (234, '抚州', 17, 2);
INSERT INTO `area` VALUES (235, '赣州', 17, 2);
INSERT INTO `area` VALUES (236, '吉安', 17, 2);
INSERT INTO `area` VALUES (237, '景德镇', 17, 2);
INSERT INTO `area` VALUES (238, '九江', 17, 2);
INSERT INTO `area` VALUES (239, '萍乡', 17, 2);
INSERT INTO `area` VALUES (240, '上饶', 17, 2);
INSERT INTO `area` VALUES (241, '新余', 17, 2);
INSERT INTO `area` VALUES (242, '宜春', 17, 2);
INSERT INTO `area` VALUES (243, '鹰潭', 17, 2);
INSERT INTO `area` VALUES (244, '沈阳', 18, 2);
INSERT INTO `area` VALUES (245, '大连', 18, 2);
INSERT INTO `area` VALUES (246, '鞍山', 18, 2);
INSERT INTO `area` VALUES (247, '本溪', 18, 2);
INSERT INTO `area` VALUES (248, '朝阳', 18, 2);
INSERT INTO `area` VALUES (249, '丹东', 18, 2);
INSERT INTO `area` VALUES (250, '抚顺', 18, 2);
INSERT INTO `area` VALUES (251, '阜新', 18, 2);
INSERT INTO `area` VALUES (252, '葫芦岛', 18, 2);
INSERT INTO `area` VALUES (253, '锦州', 18, 2);
INSERT INTO `area` VALUES (254, '辽阳', 18, 2);
INSERT INTO `area` VALUES (255, '盘锦', 18, 2);
INSERT INTO `area` VALUES (256, '铁岭', 18, 2);
INSERT INTO `area` VALUES (257, '营口', 18, 2);
INSERT INTO `area` VALUES (258, '呼和浩特', 19, 2);
INSERT INTO `area` VALUES (259, '阿拉善盟', 19, 2);
INSERT INTO `area` VALUES (260, '巴彦淖尔盟', 19, 2);
INSERT INTO `area` VALUES (261, '包头', 19, 2);
INSERT INTO `area` VALUES (262, '赤峰', 19, 2);
INSERT INTO `area` VALUES (263, '鄂尔多斯', 19, 2);
INSERT INTO `area` VALUES (264, '呼伦贝尔', 19, 2);
INSERT INTO `area` VALUES (265, '通辽', 19, 2);
INSERT INTO `area` VALUES (266, '乌海', 19, 2);
INSERT INTO `area` VALUES (267, '乌兰察布市', 19, 2);
INSERT INTO `area` VALUES (268, '锡林郭勒盟', 19, 2);
INSERT INTO `area` VALUES (269, '兴安盟', 19, 2);
INSERT INTO `area` VALUES (270, '银川', 20, 2);
INSERT INTO `area` VALUES (271, '固原', 20, 2);
INSERT INTO `area` VALUES (272, '石嘴山', 20, 2);
INSERT INTO `area` VALUES (273, '吴忠', 20, 2);
INSERT INTO `area` VALUES (274, '中卫', 20, 2);
INSERT INTO `area` VALUES (275, '西宁', 21, 2);
INSERT INTO `area` VALUES (276, '果洛', 21, 2);
INSERT INTO `area` VALUES (277, '海北', 21, 2);
INSERT INTO `area` VALUES (278, '海东', 21, 2);
INSERT INTO `area` VALUES (279, '海南', 21, 2);
INSERT INTO `area` VALUES (280, '海西', 21, 2);
INSERT INTO `area` VALUES (281, '黄南', 21, 2);
INSERT INTO `area` VALUES (282, '玉树', 21, 2);
INSERT INTO `area` VALUES (283, '济南', 22, 2);
INSERT INTO `area` VALUES (284, '青岛', 22, 2);
INSERT INTO `area` VALUES (285, '滨州', 22, 2);
INSERT INTO `area` VALUES (286, '德州', 22, 2);
INSERT INTO `area` VALUES (287, '东营', 22, 2);
INSERT INTO `area` VALUES (288, '菏泽', 22, 2);
INSERT INTO `area` VALUES (289, '济宁', 22, 2);
INSERT INTO `area` VALUES (290, '莱芜', 22, 2);
INSERT INTO `area` VALUES (291, '聊城', 22, 2);
INSERT INTO `area` VALUES (292, '临沂', 22, 2);
INSERT INTO `area` VALUES (293, '日照', 22, 2);
INSERT INTO `area` VALUES (294, '泰安', 22, 2);
INSERT INTO `area` VALUES (295, '威海', 22, 2);
INSERT INTO `area` VALUES (296, '潍坊', 22, 2);
INSERT INTO `area` VALUES (297, '烟台', 22, 2);
INSERT INTO `area` VALUES (298, '枣庄', 22, 2);
INSERT INTO `area` VALUES (299, '淄博', 22, 2);
INSERT INTO `area` VALUES (300, '太原', 23, 2);
INSERT INTO `area` VALUES (301, '长治', 23, 2);
INSERT INTO `area` VALUES (302, '大同', 23, 2);
INSERT INTO `area` VALUES (303, '晋城', 23, 2);
INSERT INTO `area` VALUES (304, '晋中', 23, 2);
INSERT INTO `area` VALUES (305, '临汾', 23, 2);
INSERT INTO `area` VALUES (306, '吕梁', 23, 2);
INSERT INTO `area` VALUES (307, '朔州', 23, 2);
INSERT INTO `area` VALUES (308, '忻州', 23, 2);
INSERT INTO `area` VALUES (309, '阳泉', 23, 2);
INSERT INTO `area` VALUES (310, '运城', 23, 2);
INSERT INTO `area` VALUES (311, '西安', 24, 2);
INSERT INTO `area` VALUES (312, '安康', 24, 2);
INSERT INTO `area` VALUES (313, '宝鸡', 24, 2);
INSERT INTO `area` VALUES (314, '汉中', 24, 2);
INSERT INTO `area` VALUES (315, '商洛', 24, 2);
INSERT INTO `area` VALUES (316, '铜川', 24, 2);
INSERT INTO `area` VALUES (317, '渭南', 24, 2);
INSERT INTO `area` VALUES (318, '咸阳', 24, 2);
INSERT INTO `area` VALUES (319, '延安', 24, 2);
INSERT INTO `area` VALUES (320, '榆林', 24, 2);
INSERT INTO `area` VALUES (321, '上海', 25, 2);
INSERT INTO `area` VALUES (322, '成都', 26, 2);
INSERT INTO `area` VALUES (323, '绵阳', 26, 2);
INSERT INTO `area` VALUES (324, '阿坝', 26, 2);
INSERT INTO `area` VALUES (325, '巴中', 26, 2);
INSERT INTO `area` VALUES (326, '达州', 26, 2);
INSERT INTO `area` VALUES (327, '德阳', 26, 2);
INSERT INTO `area` VALUES (328, '甘孜', 26, 2);
INSERT INTO `area` VALUES (329, '广安', 26, 2);
INSERT INTO `area` VALUES (330, '广元', 26, 2);
INSERT INTO `area` VALUES (331, '乐山', 26, 2);
INSERT INTO `area` VALUES (332, '凉山', 26, 2);
INSERT INTO `area` VALUES (333, '眉山', 26, 2);
INSERT INTO `area` VALUES (334, '南充', 26, 2);
INSERT INTO `area` VALUES (335, '内江', 26, 2);
INSERT INTO `area` VALUES (336, '攀枝花', 26, 2);
INSERT INTO `area` VALUES (337, '遂宁', 26, 2);
INSERT INTO `area` VALUES (338, '雅安', 26, 2);
INSERT INTO `area` VALUES (339, '宜宾', 26, 2);
INSERT INTO `area` VALUES (340, '资阳', 26, 2);
INSERT INTO `area` VALUES (341, '自贡', 26, 2);
INSERT INTO `area` VALUES (342, '泸州', 26, 2);
INSERT INTO `area` VALUES (343, '天津', 27, 2);
INSERT INTO `area` VALUES (344, '拉萨', 28, 2);
INSERT INTO `area` VALUES (345, '阿里', 28, 2);
INSERT INTO `area` VALUES (346, '昌都', 28, 2);
INSERT INTO `area` VALUES (347, '林芝', 28, 2);
INSERT INTO `area` VALUES (348, '那曲', 28, 2);
INSERT INTO `area` VALUES (349, '日喀则', 28, 2);
INSERT INTO `area` VALUES (350, '山南', 28, 2);
INSERT INTO `area` VALUES (351, '乌鲁木齐', 29, 2);
INSERT INTO `area` VALUES (352, '阿克苏', 29, 2);
INSERT INTO `area` VALUES (353, '阿拉尔', 29, 2);
INSERT INTO `area` VALUES (354, '巴音郭楞', 29, 2);
INSERT INTO `area` VALUES (355, '博尔塔拉', 29, 2);
INSERT INTO `area` VALUES (356, '昌吉', 29, 2);
INSERT INTO `area` VALUES (357, '哈密', 29, 2);
INSERT INTO `area` VALUES (358, '和田', 29, 2);
INSERT INTO `area` VALUES (359, '喀什', 29, 2);
INSERT INTO `area` VALUES (360, '克拉玛依', 29, 2);
INSERT INTO `area` VALUES (361, '克孜勒苏', 29, 2);
INSERT INTO `area` VALUES (362, '石河子', 29, 2);
INSERT INTO `area` VALUES (363, '图木舒克', 29, 2);
INSERT INTO `area` VALUES (364, '吐鲁番', 29, 2);
INSERT INTO `area` VALUES (365, '五家渠', 29, 2);
INSERT INTO `area` VALUES (366, '伊犁', 29, 2);
INSERT INTO `area` VALUES (367, '昆明', 30, 2);
INSERT INTO `area` VALUES (368, '怒江', 30, 2);
INSERT INTO `area` VALUES (369, '普洱', 30, 2);
INSERT INTO `area` VALUES (370, '丽江', 30, 2);
INSERT INTO `area` VALUES (371, '保山', 30, 2);
INSERT INTO `area` VALUES (372, '楚雄', 30, 2);
INSERT INTO `area` VALUES (373, '大理', 30, 2);
INSERT INTO `area` VALUES (374, '德宏', 30, 2);
INSERT INTO `area` VALUES (375, '迪庆', 30, 2);
INSERT INTO `area` VALUES (376, '红河', 30, 2);
INSERT INTO `area` VALUES (377, '临沧', 30, 2);
INSERT INTO `area` VALUES (378, '曲靖', 30, 2);
INSERT INTO `area` VALUES (379, '文山', 30, 2);
INSERT INTO `area` VALUES (380, '西双版纳', 30, 2);
INSERT INTO `area` VALUES (381, '玉溪', 30, 2);
INSERT INTO `area` VALUES (382, '昭通', 30, 2);
INSERT INTO `area` VALUES (383, '杭州', 31, 2);
INSERT INTO `area` VALUES (384, '湖州', 31, 2);
INSERT INTO `area` VALUES (385, '嘉兴', 31, 2);
INSERT INTO `area` VALUES (386, '金华', 31, 2);
INSERT INTO `area` VALUES (387, '丽水', 31, 2);
INSERT INTO `area` VALUES (388, '宁波', 31, 2);
INSERT INTO `area` VALUES (389, '绍兴', 31, 2);
INSERT INTO `area` VALUES (390, '台州', 31, 2);
INSERT INTO `area` VALUES (391, '温州', 31, 2);
INSERT INTO `area` VALUES (392, '舟山', 31, 2);
INSERT INTO `area` VALUES (393, '衢州', 31, 2);
INSERT INTO `area` VALUES (394, '重庆', 32, 2);
INSERT INTO `area` VALUES (395, '香港', 33, 2);
INSERT INTO `area` VALUES (396, '澳门', 34, 2);
INSERT INTO `area` VALUES (397, '台湾', 35, 2);
INSERT INTO `area` VALUES (398, '迎江区', 36, 3);
INSERT INTO `area` VALUES (399, '大观区', 36, 3);
INSERT INTO `area` VALUES (400, '宜秀区', 36, 3);
INSERT INTO `area` VALUES (401, '桐城市', 36, 3);
INSERT INTO `area` VALUES (402, '怀宁县', 36, 3);
INSERT INTO `area` VALUES (403, '枞阳县', 36, 3);
INSERT INTO `area` VALUES (404, '潜山县', 36, 3);
INSERT INTO `area` VALUES (405, '太湖县', 36, 3);
INSERT INTO `area` VALUES (406, '宿松县', 36, 3);
INSERT INTO `area` VALUES (407, '望江县', 36, 3);
INSERT INTO `area` VALUES (408, '岳西县', 36, 3);
INSERT INTO `area` VALUES (409, '中市区', 37, 3);
INSERT INTO `area` VALUES (410, '东市区', 37, 3);
INSERT INTO `area` VALUES (411, '西市区', 37, 3);
INSERT INTO `area` VALUES (412, '郊区', 37, 3);
INSERT INTO `area` VALUES (413, '怀远县', 37, 3);
INSERT INTO `area` VALUES (414, '五河县', 37, 3);
INSERT INTO `area` VALUES (415, '固镇县', 37, 3);
INSERT INTO `area` VALUES (416, '居巢区', 38, 3);
INSERT INTO `area` VALUES (417, '庐江县', 38, 3);
INSERT INTO `area` VALUES (418, '无为县', 38, 3);
INSERT INTO `area` VALUES (419, '含山县', 38, 3);
INSERT INTO `area` VALUES (420, '和县', 38, 3);
INSERT INTO `area` VALUES (421, '贵池区', 39, 3);
INSERT INTO `area` VALUES (422, '东至县', 39, 3);
INSERT INTO `area` VALUES (423, '石台县', 39, 3);
INSERT INTO `area` VALUES (424, '青阳县', 39, 3);
INSERT INTO `area` VALUES (425, '琅琊区', 40, 3);
INSERT INTO `area` VALUES (426, '南谯区', 40, 3);
INSERT INTO `area` VALUES (427, '天长市', 40, 3);
INSERT INTO `area` VALUES (428, '明光市', 40, 3);
INSERT INTO `area` VALUES (429, '来安县', 40, 3);
INSERT INTO `area` VALUES (430, '全椒县', 40, 3);
INSERT INTO `area` VALUES (431, '定远县', 40, 3);
INSERT INTO `area` VALUES (432, '凤阳县', 40, 3);
INSERT INTO `area` VALUES (433, '蚌山区', 41, 3);
INSERT INTO `area` VALUES (434, '龙子湖区', 41, 3);
INSERT INTO `area` VALUES (435, '禹会区', 41, 3);
INSERT INTO `area` VALUES (436, '淮上区', 41, 3);
INSERT INTO `area` VALUES (437, '颍州区', 41, 3);
INSERT INTO `area` VALUES (438, '颍东区', 41, 3);
INSERT INTO `area` VALUES (439, '颍泉区', 41, 3);
INSERT INTO `area` VALUES (440, '界首市', 41, 3);
INSERT INTO `area` VALUES (441, '临泉县', 41, 3);
INSERT INTO `area` VALUES (442, '太和县', 41, 3);
INSERT INTO `area` VALUES (443, '阜南县', 41, 3);
INSERT INTO `area` VALUES (444, '颖上县', 41, 3);
INSERT INTO `area` VALUES (445, '相山区', 42, 3);
INSERT INTO `area` VALUES (446, '杜集区', 42, 3);
INSERT INTO `area` VALUES (447, '烈山区', 42, 3);
INSERT INTO `area` VALUES (448, '濉溪县', 42, 3);
INSERT INTO `area` VALUES (449, '田家庵区', 43, 3);
INSERT INTO `area` VALUES (450, '大通区', 43, 3);
INSERT INTO `area` VALUES (451, '谢家集区', 43, 3);
INSERT INTO `area` VALUES (452, '八公山区', 43, 3);
INSERT INTO `area` VALUES (453, '潘集区', 43, 3);
INSERT INTO `area` VALUES (454, '凤台县', 43, 3);
INSERT INTO `area` VALUES (455, '屯溪区', 44, 3);
INSERT INTO `area` VALUES (456, '黄山区', 44, 3);
INSERT INTO `area` VALUES (457, '徽州区', 44, 3);
INSERT INTO `area` VALUES (458, '歙县', 44, 3);
INSERT INTO `area` VALUES (459, '休宁县', 44, 3);
INSERT INTO `area` VALUES (460, '黟县', 44, 3);
INSERT INTO `area` VALUES (461, '祁门县', 44, 3);
INSERT INTO `area` VALUES (462, '金安区', 45, 3);
INSERT INTO `area` VALUES (463, '裕安区', 45, 3);
INSERT INTO `area` VALUES (464, '寿县', 45, 3);
INSERT INTO `area` VALUES (465, '霍邱县', 45, 3);
INSERT INTO `area` VALUES (466, '舒城县', 45, 3);
INSERT INTO `area` VALUES (467, '金寨县', 45, 3);
INSERT INTO `area` VALUES (468, '霍山县', 45, 3);
INSERT INTO `area` VALUES (469, '雨山区', 46, 3);
INSERT INTO `area` VALUES (470, '花山区', 46, 3);
INSERT INTO `area` VALUES (471, '金家庄区', 46, 3);
INSERT INTO `area` VALUES (472, '当涂县', 46, 3);
INSERT INTO `area` VALUES (473, '埇桥区', 47, 3);
INSERT INTO `area` VALUES (474, '砀山县', 47, 3);
INSERT INTO `area` VALUES (475, '萧县', 47, 3);
INSERT INTO `area` VALUES (476, '灵璧县', 47, 3);
INSERT INTO `area` VALUES (477, '泗县', 47, 3);
INSERT INTO `area` VALUES (478, '铜官山区', 48, 3);
INSERT INTO `area` VALUES (479, '狮子山区', 48, 3);
INSERT INTO `area` VALUES (480, '郊区', 48, 3);
INSERT INTO `area` VALUES (481, '铜陵县', 48, 3);
INSERT INTO `area` VALUES (482, '镜湖区', 49, 3);
INSERT INTO `area` VALUES (483, '弋江区', 49, 3);
INSERT INTO `area` VALUES (484, '鸠江区', 49, 3);
INSERT INTO `area` VALUES (485, '三山区', 49, 3);
INSERT INTO `area` VALUES (486, '芜湖县', 49, 3);
INSERT INTO `area` VALUES (487, '繁昌县', 49, 3);
INSERT INTO `area` VALUES (488, '南陵县', 49, 3);
INSERT INTO `area` VALUES (489, '宣州区', 50, 3);
INSERT INTO `area` VALUES (490, '宁国市', 50, 3);
INSERT INTO `area` VALUES (491, '郎溪县', 50, 3);
INSERT INTO `area` VALUES (492, '广德县', 50, 3);
INSERT INTO `area` VALUES (493, '泾县', 50, 3);
INSERT INTO `area` VALUES (494, '绩溪县', 50, 3);
INSERT INTO `area` VALUES (495, '旌德县', 50, 3);
INSERT INTO `area` VALUES (496, '涡阳县', 51, 3);
INSERT INTO `area` VALUES (497, '蒙城县', 51, 3);
INSERT INTO `area` VALUES (498, '利辛县', 51, 3);
INSERT INTO `area` VALUES (499, '谯城区', 51, 3);
INSERT INTO `area` VALUES (500, '东城区', 52, 3);
INSERT INTO `area` VALUES (501, '西城区', 52, 3);
INSERT INTO `area` VALUES (502, '海淀区', 52, 3);
INSERT INTO `area` VALUES (503, '朝阳区', 52, 3);
INSERT INTO `area` VALUES (504, '崇文区', 52, 3);
INSERT INTO `area` VALUES (505, '宣武区', 52, 3);
INSERT INTO `area` VALUES (506, '丰台区', 52, 3);
INSERT INTO `area` VALUES (507, '石景山区', 52, 3);
INSERT INTO `area` VALUES (508, '房山区', 52, 3);
INSERT INTO `area` VALUES (509, '门头沟区', 52, 3);
INSERT INTO `area` VALUES (510, '通州区', 52, 3);
INSERT INTO `area` VALUES (511, '顺义区', 52, 3);
INSERT INTO `area` VALUES (512, '昌平区', 52, 3);
INSERT INTO `area` VALUES (513, '怀柔区', 52, 3);
INSERT INTO `area` VALUES (514, '平谷区', 52, 3);
INSERT INTO `area` VALUES (515, '大兴区', 52, 3);
INSERT INTO `area` VALUES (516, '密云县', 52, 3);
INSERT INTO `area` VALUES (517, '延庆县', 52, 3);
INSERT INTO `area` VALUES (518, '鼓楼区', 53, 3);
INSERT INTO `area` VALUES (519, '台江区', 53, 3);
INSERT INTO `area` VALUES (520, '仓山区', 53, 3);
INSERT INTO `area` VALUES (521, '马尾区', 53, 3);
INSERT INTO `area` VALUES (522, '晋安区', 53, 3);
INSERT INTO `area` VALUES (523, '福清市', 53, 3);
INSERT INTO `area` VALUES (524, '长乐市', 53, 3);
INSERT INTO `area` VALUES (525, '闽侯县', 53, 3);
INSERT INTO `area` VALUES (526, '连江县', 53, 3);
INSERT INTO `area` VALUES (527, '罗源县', 53, 3);
INSERT INTO `area` VALUES (528, '闽清县', 53, 3);
INSERT INTO `area` VALUES (529, '永泰县', 53, 3);
INSERT INTO `area` VALUES (530, '平潭县', 53, 3);
INSERT INTO `area` VALUES (531, '新罗区', 54, 3);
INSERT INTO `area` VALUES (532, '漳平市', 54, 3);
INSERT INTO `area` VALUES (533, '长汀县', 54, 3);
INSERT INTO `area` VALUES (534, '永定县', 54, 3);
INSERT INTO `area` VALUES (535, '上杭县', 54, 3);
INSERT INTO `area` VALUES (536, '武平县', 54, 3);
INSERT INTO `area` VALUES (537, '连城县', 54, 3);
INSERT INTO `area` VALUES (538, '延平区', 55, 3);
INSERT INTO `area` VALUES (539, '邵武市', 55, 3);
INSERT INTO `area` VALUES (540, '武夷山市', 55, 3);
INSERT INTO `area` VALUES (541, '建瓯市', 55, 3);
INSERT INTO `area` VALUES (542, '建阳市', 55, 3);
INSERT INTO `area` VALUES (543, '顺昌县', 55, 3);
INSERT INTO `area` VALUES (544, '浦城县', 55, 3);
INSERT INTO `area` VALUES (545, '光泽县', 55, 3);
INSERT INTO `area` VALUES (546, '松溪县', 55, 3);
INSERT INTO `area` VALUES (547, '政和县', 55, 3);
INSERT INTO `area` VALUES (548, '蕉城区', 56, 3);
INSERT INTO `area` VALUES (549, '福安市', 56, 3);
INSERT INTO `area` VALUES (550, '福鼎市', 56, 3);
INSERT INTO `area` VALUES (551, '霞浦县', 56, 3);
INSERT INTO `area` VALUES (552, '古田县', 56, 3);
INSERT INTO `area` VALUES (553, '屏南县', 56, 3);
INSERT INTO `area` VALUES (554, '寿宁县', 56, 3);
INSERT INTO `area` VALUES (555, '周宁县', 56, 3);
INSERT INTO `area` VALUES (556, '柘荣县', 56, 3);
INSERT INTO `area` VALUES (557, '城厢区', 57, 3);
INSERT INTO `area` VALUES (558, '涵江区', 57, 3);
INSERT INTO `area` VALUES (559, '荔城区', 57, 3);
INSERT INTO `area` VALUES (560, '秀屿区', 57, 3);
INSERT INTO `area` VALUES (561, '仙游县', 57, 3);
INSERT INTO `area` VALUES (562, '鲤城区', 58, 3);
INSERT INTO `area` VALUES (563, '丰泽区', 58, 3);
INSERT INTO `area` VALUES (564, '洛江区', 58, 3);
INSERT INTO `area` VALUES (565, '清濛开发区', 58, 3);
INSERT INTO `area` VALUES (566, '泉港区', 58, 3);
INSERT INTO `area` VALUES (567, '石狮市', 58, 3);
INSERT INTO `area` VALUES (568, '晋江市', 58, 3);
INSERT INTO `area` VALUES (569, '南安市', 58, 3);
INSERT INTO `area` VALUES (570, '惠安县', 58, 3);
INSERT INTO `area` VALUES (571, '安溪县', 58, 3);
INSERT INTO `area` VALUES (572, '永春县', 58, 3);
INSERT INTO `area` VALUES (573, '德化县', 58, 3);
INSERT INTO `area` VALUES (574, '金门县', 58, 3);
INSERT INTO `area` VALUES (575, '梅列区', 59, 3);
INSERT INTO `area` VALUES (576, '三元区', 59, 3);
INSERT INTO `area` VALUES (577, '永安市', 59, 3);
INSERT INTO `area` VALUES (578, '明溪县', 59, 3);
INSERT INTO `area` VALUES (579, '清流县', 59, 3);
INSERT INTO `area` VALUES (580, '宁化县', 59, 3);
INSERT INTO `area` VALUES (581, '大田县', 59, 3);
INSERT INTO `area` VALUES (582, '尤溪县', 59, 3);
INSERT INTO `area` VALUES (583, '沙县', 59, 3);
INSERT INTO `area` VALUES (584, '将乐县', 59, 3);
INSERT INTO `area` VALUES (585, '泰宁县', 59, 3);
INSERT INTO `area` VALUES (586, '建宁县', 59, 3);
INSERT INTO `area` VALUES (587, '思明区', 60, 3);
INSERT INTO `area` VALUES (588, '海沧区', 60, 3);
INSERT INTO `area` VALUES (589, '湖里区', 60, 3);
INSERT INTO `area` VALUES (590, '集美区', 60, 3);
INSERT INTO `area` VALUES (591, '同安区', 60, 3);
INSERT INTO `area` VALUES (592, '翔安区', 60, 3);
INSERT INTO `area` VALUES (593, '芗城区', 61, 3);
INSERT INTO `area` VALUES (594, '龙文区', 61, 3);
INSERT INTO `area` VALUES (595, '龙海市', 61, 3);
INSERT INTO `area` VALUES (596, '云霄县', 61, 3);
INSERT INTO `area` VALUES (597, '漳浦县', 61, 3);
INSERT INTO `area` VALUES (598, '诏安县', 61, 3);
INSERT INTO `area` VALUES (599, '长泰县', 61, 3);
INSERT INTO `area` VALUES (600, '东山县', 61, 3);
INSERT INTO `area` VALUES (601, '南靖县', 61, 3);
INSERT INTO `area` VALUES (602, '平和县', 61, 3);
INSERT INTO `area` VALUES (603, '华安县', 61, 3);
INSERT INTO `area` VALUES (604, '皋兰县', 62, 3);
INSERT INTO `area` VALUES (605, '城关区', 62, 3);
INSERT INTO `area` VALUES (606, '七里河区', 62, 3);
INSERT INTO `area` VALUES (607, '西固区', 62, 3);
INSERT INTO `area` VALUES (608, '安宁区', 62, 3);
INSERT INTO `area` VALUES (609, '红古区', 62, 3);
INSERT INTO `area` VALUES (610, '永登县', 62, 3);
INSERT INTO `area` VALUES (611, '榆中县', 62, 3);
INSERT INTO `area` VALUES (612, '白银区', 63, 3);
INSERT INTO `area` VALUES (613, '平川区', 63, 3);
INSERT INTO `area` VALUES (614, '会宁县', 63, 3);
INSERT INTO `area` VALUES (615, '景泰县', 63, 3);
INSERT INTO `area` VALUES (616, '靖远县', 63, 3);
INSERT INTO `area` VALUES (617, '临洮县', 64, 3);
INSERT INTO `area` VALUES (618, '陇西县', 64, 3);
INSERT INTO `area` VALUES (619, '通渭县', 64, 3);
INSERT INTO `area` VALUES (620, '渭源县', 64, 3);
INSERT INTO `area` VALUES (621, '漳县', 64, 3);
INSERT INTO `area` VALUES (622, '岷县', 64, 3);
INSERT INTO `area` VALUES (623, '安定区', 64, 3);
INSERT INTO `area` VALUES (624, '安定区', 64, 3);
INSERT INTO `area` VALUES (625, '合作市', 65, 3);
INSERT INTO `area` VALUES (626, '临潭县', 65, 3);
INSERT INTO `area` VALUES (627, '卓尼县', 65, 3);
INSERT INTO `area` VALUES (628, '舟曲县', 65, 3);
INSERT INTO `area` VALUES (629, '迭部县', 65, 3);
INSERT INTO `area` VALUES (630, '玛曲县', 65, 3);
INSERT INTO `area` VALUES (631, '碌曲县', 65, 3);
INSERT INTO `area` VALUES (632, '夏河县', 65, 3);
INSERT INTO `area` VALUES (633, '嘉峪关市', 66, 3);
INSERT INTO `area` VALUES (634, '金川区', 67, 3);
INSERT INTO `area` VALUES (635, '永昌县', 67, 3);
INSERT INTO `area` VALUES (636, '肃州区', 68, 3);
INSERT INTO `area` VALUES (637, '玉门市', 68, 3);
INSERT INTO `area` VALUES (638, '敦煌市', 68, 3);
INSERT INTO `area` VALUES (639, '金塔县', 68, 3);
INSERT INTO `area` VALUES (640, '瓜州县', 68, 3);
INSERT INTO `area` VALUES (641, '肃北', 68, 3);
INSERT INTO `area` VALUES (642, '阿克塞', 68, 3);
INSERT INTO `area` VALUES (643, '临夏市', 69, 3);
INSERT INTO `area` VALUES (644, '临夏县', 69, 3);
INSERT INTO `area` VALUES (645, '康乐县', 69, 3);
INSERT INTO `area` VALUES (646, '永靖县', 69, 3);
INSERT INTO `area` VALUES (647, '广河县', 69, 3);
INSERT INTO `area` VALUES (648, '和政县', 69, 3);
INSERT INTO `area` VALUES (649, '东乡族自治县', 69, 3);
INSERT INTO `area` VALUES (650, '积石山', 69, 3);
INSERT INTO `area` VALUES (651, '成县', 70, 3);
INSERT INTO `area` VALUES (652, '徽县', 70, 3);
INSERT INTO `area` VALUES (653, '康县', 70, 3);
INSERT INTO `area` VALUES (654, '礼县', 70, 3);
INSERT INTO `area` VALUES (655, '两当县', 70, 3);
INSERT INTO `area` VALUES (656, '文县', 70, 3);
INSERT INTO `area` VALUES (657, '西和县', 70, 3);
INSERT INTO `area` VALUES (658, '宕昌县', 70, 3);
INSERT INTO `area` VALUES (659, '武都区', 70, 3);
INSERT INTO `area` VALUES (660, '崇信县', 71, 3);
INSERT INTO `area` VALUES (661, '华亭县', 71, 3);
INSERT INTO `area` VALUES (662, '静宁县', 71, 3);
INSERT INTO `area` VALUES (663, '灵台县', 71, 3);
INSERT INTO `area` VALUES (664, '崆峒区', 71, 3);
INSERT INTO `area` VALUES (665, '庄浪县', 71, 3);
INSERT INTO `area` VALUES (666, '泾川县', 71, 3);
INSERT INTO `area` VALUES (667, '合水县', 72, 3);
INSERT INTO `area` VALUES (668, '华池县', 72, 3);
INSERT INTO `area` VALUES (669, '环县', 72, 3);
INSERT INTO `area` VALUES (670, '宁县', 72, 3);
INSERT INTO `area` VALUES (671, '庆城县', 72, 3);
INSERT INTO `area` VALUES (672, '西峰区', 72, 3);
INSERT INTO `area` VALUES (673, '镇原县', 72, 3);
INSERT INTO `area` VALUES (674, '正宁县', 72, 3);
INSERT INTO `area` VALUES (675, '甘谷县', 73, 3);
INSERT INTO `area` VALUES (676, '秦安县', 73, 3);
INSERT INTO `area` VALUES (677, '清水县', 73, 3);
INSERT INTO `area` VALUES (678, '秦州区', 73, 3);
INSERT INTO `area` VALUES (679, '麦积区', 73, 3);
INSERT INTO `area` VALUES (680, '武山县', 73, 3);
INSERT INTO `area` VALUES (681, '张家川', 73, 3);
INSERT INTO `area` VALUES (682, '古浪县', 74, 3);
INSERT INTO `area` VALUES (683, '民勤县', 74, 3);
INSERT INTO `area` VALUES (684, '天祝', 74, 3);
INSERT INTO `area` VALUES (685, '凉州区', 74, 3);
INSERT INTO `area` VALUES (686, '高台县', 75, 3);
INSERT INTO `area` VALUES (687, '临泽县', 75, 3);
INSERT INTO `area` VALUES (688, '民乐县', 75, 3);
INSERT INTO `area` VALUES (689, '山丹县', 75, 3);
INSERT INTO `area` VALUES (690, '肃南', 75, 3);
INSERT INTO `area` VALUES (691, '甘州区', 75, 3);
INSERT INTO `area` VALUES (692, '从化市', 76, 3);
INSERT INTO `area` VALUES (693, '天河区', 76, 3);
INSERT INTO `area` VALUES (694, '东山区', 76, 3);
INSERT INTO `area` VALUES (695, '白云区', 76, 3);
INSERT INTO `area` VALUES (696, '海珠区', 76, 3);
INSERT INTO `area` VALUES (697, '荔湾区', 76, 3);
INSERT INTO `area` VALUES (698, '越秀区', 76, 3);
INSERT INTO `area` VALUES (699, '黄埔区', 76, 3);
INSERT INTO `area` VALUES (700, '番禺区', 76, 3);
INSERT INTO `area` VALUES (701, '花都区', 76, 3);
INSERT INTO `area` VALUES (702, '增城区', 76, 3);
INSERT INTO `area` VALUES (703, '从化区', 76, 3);
INSERT INTO `area` VALUES (704, '市郊', 76, 3);
INSERT INTO `area` VALUES (705, '福田区', 77, 3);
INSERT INTO `area` VALUES (706, '罗湖区', 77, 3);
INSERT INTO `area` VALUES (707, '南山区', 77, 3);
INSERT INTO `area` VALUES (708, '宝安区', 77, 3);
INSERT INTO `area` VALUES (709, '龙岗区', 77, 3);
INSERT INTO `area` VALUES (710, '盐田区', 77, 3);
INSERT INTO `area` VALUES (711, '湘桥区', 78, 3);
INSERT INTO `area` VALUES (712, '潮安县', 78, 3);
INSERT INTO `area` VALUES (713, '饶平县', 78, 3);
INSERT INTO `area` VALUES (714, '南城区', 79, 3);
INSERT INTO `area` VALUES (715, '东城区', 79, 3);
INSERT INTO `area` VALUES (716, '万江区', 79, 3);
INSERT INTO `area` VALUES (717, '莞城区', 79, 3);
INSERT INTO `area` VALUES (718, '石龙镇', 79, 3);
INSERT INTO `area` VALUES (719, '虎门镇', 79, 3);
INSERT INTO `area` VALUES (720, '麻涌镇', 79, 3);
INSERT INTO `area` VALUES (721, '道滘镇', 79, 3);
INSERT INTO `area` VALUES (722, '石碣镇', 79, 3);
INSERT INTO `area` VALUES (723, '沙田镇', 79, 3);
INSERT INTO `area` VALUES (724, '望牛墩镇', 79, 3);
INSERT INTO `area` VALUES (725, '洪梅镇', 79, 3);
INSERT INTO `area` VALUES (726, '茶山镇', 79, 3);
INSERT INTO `area` VALUES (727, '寮步镇', 79, 3);
INSERT INTO `area` VALUES (728, '大岭山镇', 79, 3);
INSERT INTO `area` VALUES (729, '大朗镇', 79, 3);
INSERT INTO `area` VALUES (730, '黄江镇', 79, 3);
INSERT INTO `area` VALUES (731, '樟木头', 79, 3);
INSERT INTO `area` VALUES (732, '凤岗镇', 79, 3);
INSERT INTO `area` VALUES (733, '塘厦镇', 79, 3);
INSERT INTO `area` VALUES (734, '谢岗镇', 79, 3);
INSERT INTO `area` VALUES (735, '厚街镇', 79, 3);
INSERT INTO `area` VALUES (736, '清溪镇', 79, 3);
INSERT INTO `area` VALUES (737, '常平镇', 79, 3);
INSERT INTO `area` VALUES (738, '桥头镇', 79, 3);
INSERT INTO `area` VALUES (739, '横沥镇', 79, 3);
INSERT INTO `area` VALUES (740, '东坑镇', 79, 3);
INSERT INTO `area` VALUES (741, '企石镇', 79, 3);
INSERT INTO `area` VALUES (742, '石排镇', 79, 3);
INSERT INTO `area` VALUES (743, '长安镇', 79, 3);
INSERT INTO `area` VALUES (744, '中堂镇', 79, 3);
INSERT INTO `area` VALUES (745, '高埗镇', 79, 3);
INSERT INTO `area` VALUES (746, '禅城区', 80, 3);
INSERT INTO `area` VALUES (747, '南海区', 80, 3);
INSERT INTO `area` VALUES (748, '顺德区', 80, 3);
INSERT INTO `area` VALUES (749, '三水区', 80, 3);
INSERT INTO `area` VALUES (750, '高明区', 80, 3);
INSERT INTO `area` VALUES (751, '东源县', 81, 3);
INSERT INTO `area` VALUES (752, '和平县', 81, 3);
INSERT INTO `area` VALUES (753, '源城区', 81, 3);
INSERT INTO `area` VALUES (754, '连平县', 81, 3);
INSERT INTO `area` VALUES (755, '龙川县', 81, 3);
INSERT INTO `area` VALUES (756, '紫金县', 81, 3);
INSERT INTO `area` VALUES (757, '惠阳区', 82, 3);
INSERT INTO `area` VALUES (758, '惠城区', 82, 3);
INSERT INTO `area` VALUES (759, '大亚湾', 82, 3);
INSERT INTO `area` VALUES (760, '博罗县', 82, 3);
INSERT INTO `area` VALUES (761, '惠东县', 82, 3);
INSERT INTO `area` VALUES (762, '龙门县', 82, 3);
INSERT INTO `area` VALUES (763, '江海区', 83, 3);
INSERT INTO `area` VALUES (764, '蓬江区', 83, 3);
INSERT INTO `area` VALUES (765, '新会区', 83, 3);
INSERT INTO `area` VALUES (766, '台山市', 83, 3);
INSERT INTO `area` VALUES (767, '开平市', 83, 3);
INSERT INTO `area` VALUES (768, '鹤山市', 83, 3);
INSERT INTO `area` VALUES (769, '恩平市', 83, 3);
INSERT INTO `area` VALUES (770, '榕城区', 84, 3);
INSERT INTO `area` VALUES (771, '普宁市', 84, 3);
INSERT INTO `area` VALUES (772, '揭东县', 84, 3);
INSERT INTO `area` VALUES (773, '揭西县', 84, 3);
INSERT INTO `area` VALUES (774, '惠来县', 84, 3);
INSERT INTO `area` VALUES (775, '茂南区', 85, 3);
INSERT INTO `area` VALUES (776, '茂港区', 85, 3);
INSERT INTO `area` VALUES (777, '高州市', 85, 3);
INSERT INTO `area` VALUES (778, '化州市', 85, 3);
INSERT INTO `area` VALUES (779, '信宜市', 85, 3);
INSERT INTO `area` VALUES (780, '电白县', 85, 3);
INSERT INTO `area` VALUES (781, '梅县', 86, 3);
INSERT INTO `area` VALUES (782, '梅江区', 86, 3);
INSERT INTO `area` VALUES (783, '兴宁市', 86, 3);
INSERT INTO `area` VALUES (784, '大埔县', 86, 3);
INSERT INTO `area` VALUES (785, '丰顺县', 86, 3);
INSERT INTO `area` VALUES (786, '五华县', 86, 3);
INSERT INTO `area` VALUES (787, '平远县', 86, 3);
INSERT INTO `area` VALUES (788, '蕉岭县', 86, 3);
INSERT INTO `area` VALUES (789, '清城区', 87, 3);
INSERT INTO `area` VALUES (790, '英德市', 87, 3);
INSERT INTO `area` VALUES (791, '连州市', 87, 3);
INSERT INTO `area` VALUES (792, '佛冈县', 87, 3);
INSERT INTO `area` VALUES (793, '阳山县', 87, 3);
INSERT INTO `area` VALUES (794, '清新县', 87, 3);
INSERT INTO `area` VALUES (795, '连山', 87, 3);
INSERT INTO `area` VALUES (796, '连南', 87, 3);
INSERT INTO `area` VALUES (797, '南澳县', 88, 3);
INSERT INTO `area` VALUES (798, '潮阳区', 88, 3);
INSERT INTO `area` VALUES (799, '澄海区', 88, 3);
INSERT INTO `area` VALUES (800, '龙湖区', 88, 3);
INSERT INTO `area` VALUES (801, '金平区', 88, 3);
INSERT INTO `area` VALUES (802, '濠江区', 88, 3);
INSERT INTO `area` VALUES (803, '潮南区', 88, 3);
INSERT INTO `area` VALUES (804, '城区', 89, 3);
INSERT INTO `area` VALUES (805, '陆丰市', 89, 3);
INSERT INTO `area` VALUES (806, '海丰县', 89, 3);
INSERT INTO `area` VALUES (807, '陆河县', 89, 3);
INSERT INTO `area` VALUES (808, '曲江县', 90, 3);
INSERT INTO `area` VALUES (809, '浈江区', 90, 3);
INSERT INTO `area` VALUES (810, '武江区', 90, 3);
INSERT INTO `area` VALUES (811, '曲江区', 90, 3);
INSERT INTO `area` VALUES (812, '乐昌市', 90, 3);
INSERT INTO `area` VALUES (813, '南雄市', 90, 3);
INSERT INTO `area` VALUES (814, '始兴县', 90, 3);
INSERT INTO `area` VALUES (815, '仁化县', 90, 3);
INSERT INTO `area` VALUES (816, '翁源县', 90, 3);
INSERT INTO `area` VALUES (817, '新丰县', 90, 3);
INSERT INTO `area` VALUES (818, '乳源', 90, 3);
INSERT INTO `area` VALUES (819, '江城区', 91, 3);
INSERT INTO `area` VALUES (820, '阳春市', 91, 3);
INSERT INTO `area` VALUES (821, '阳西县', 91, 3);
INSERT INTO `area` VALUES (822, '阳东县', 91, 3);
INSERT INTO `area` VALUES (823, '云城区', 92, 3);
INSERT INTO `area` VALUES (824, '罗定市', 92, 3);
INSERT INTO `area` VALUES (825, '新兴县', 92, 3);
INSERT INTO `area` VALUES (826, '郁南县', 92, 3);
INSERT INTO `area` VALUES (827, '云安县', 92, 3);
INSERT INTO `area` VALUES (828, '赤坎区', 93, 3);
INSERT INTO `area` VALUES (829, '霞山区', 93, 3);
INSERT INTO `area` VALUES (830, '坡头区', 93, 3);
INSERT INTO `area` VALUES (831, '麻章区', 93, 3);
INSERT INTO `area` VALUES (832, '廉江市', 93, 3);
INSERT INTO `area` VALUES (833, '雷州市', 93, 3);
INSERT INTO `area` VALUES (834, '吴川市', 93, 3);
INSERT INTO `area` VALUES (835, '遂溪县', 93, 3);
INSERT INTO `area` VALUES (836, '徐闻县', 93, 3);
INSERT INTO `area` VALUES (837, '肇庆市', 94, 3);
INSERT INTO `area` VALUES (838, '高要市', 94, 3);
INSERT INTO `area` VALUES (839, '四会市', 94, 3);
INSERT INTO `area` VALUES (840, '广宁县', 94, 3);
INSERT INTO `area` VALUES (841, '怀集县', 94, 3);
INSERT INTO `area` VALUES (842, '封开县', 94, 3);
INSERT INTO `area` VALUES (843, '德庆县', 94, 3);
INSERT INTO `area` VALUES (844, '石岐街道', 95, 3);
INSERT INTO `area` VALUES (845, '东区街道', 95, 3);
INSERT INTO `area` VALUES (846, '西区街道', 95, 3);
INSERT INTO `area` VALUES (847, '环城街道', 95, 3);
INSERT INTO `area` VALUES (848, '中山港街道', 95, 3);
INSERT INTO `area` VALUES (849, '五桂山街道', 95, 3);
INSERT INTO `area` VALUES (850, '香洲区', 96, 3);
INSERT INTO `area` VALUES (851, '斗门区', 96, 3);
INSERT INTO `area` VALUES (852, '金湾区', 96, 3);
INSERT INTO `area` VALUES (853, '邕宁区', 97, 3);
INSERT INTO `area` VALUES (854, '青秀区', 97, 3);
INSERT INTO `area` VALUES (855, '兴宁区', 97, 3);
INSERT INTO `area` VALUES (856, '良庆区', 97, 3);
INSERT INTO `area` VALUES (857, '西乡塘区', 97, 3);
INSERT INTO `area` VALUES (858, '江南区', 97, 3);
INSERT INTO `area` VALUES (859, '武鸣县', 97, 3);
INSERT INTO `area` VALUES (860, '隆安县', 97, 3);
INSERT INTO `area` VALUES (861, '马山县', 97, 3);
INSERT INTO `area` VALUES (862, '上林县', 97, 3);
INSERT INTO `area` VALUES (863, '宾阳县', 97, 3);
INSERT INTO `area` VALUES (864, '横县', 97, 3);
INSERT INTO `area` VALUES (865, '秀峰区', 98, 3);
INSERT INTO `area` VALUES (866, '叠彩区', 98, 3);
INSERT INTO `area` VALUES (867, '象山区', 98, 3);
INSERT INTO `area` VALUES (868, '七星区', 98, 3);
INSERT INTO `area` VALUES (869, '雁山区', 98, 3);
INSERT INTO `area` VALUES (870, '阳朔县', 98, 3);
INSERT INTO `area` VALUES (871, '临桂县', 98, 3);
INSERT INTO `area` VALUES (872, '灵川县', 98, 3);
INSERT INTO `area` VALUES (873, '全州县', 98, 3);
INSERT INTO `area` VALUES (874, '平乐县', 98, 3);
INSERT INTO `area` VALUES (875, '兴安县', 98, 3);
INSERT INTO `area` VALUES (876, '灌阳县', 98, 3);
INSERT INTO `area` VALUES (877, '荔浦县', 98, 3);
INSERT INTO `area` VALUES (878, '资源县', 98, 3);
INSERT INTO `area` VALUES (879, '永福县', 98, 3);
INSERT INTO `area` VALUES (880, '龙胜', 98, 3);
INSERT INTO `area` VALUES (881, '恭城', 98, 3);
INSERT INTO `area` VALUES (882, '右江区', 99, 3);
INSERT INTO `area` VALUES (883, '凌云县', 99, 3);
INSERT INTO `area` VALUES (884, '平果县', 99, 3);
INSERT INTO `area` VALUES (885, '西林县', 99, 3);
INSERT INTO `area` VALUES (886, '乐业县', 99, 3);
INSERT INTO `area` VALUES (887, '德保县', 99, 3);
INSERT INTO `area` VALUES (888, '田林县', 99, 3);
INSERT INTO `area` VALUES (889, '田阳县', 99, 3);
INSERT INTO `area` VALUES (890, '靖西县', 99, 3);
INSERT INTO `area` VALUES (891, '田东县', 99, 3);
INSERT INTO `area` VALUES (892, '那坡县', 99, 3);
INSERT INTO `area` VALUES (893, '隆林', 99, 3);
INSERT INTO `area` VALUES (894, '海城区', 100, 3);
INSERT INTO `area` VALUES (895, '银海区', 100, 3);
INSERT INTO `area` VALUES (896, '铁山港区', 100, 3);
INSERT INTO `area` VALUES (897, '合浦县', 100, 3);
INSERT INTO `area` VALUES (898, '江州区', 101, 3);
INSERT INTO `area` VALUES (899, '凭祥市', 101, 3);
INSERT INTO `area` VALUES (900, '宁明县', 101, 3);
INSERT INTO `area` VALUES (901, '扶绥县', 101, 3);
INSERT INTO `area` VALUES (902, '龙州县', 101, 3);
INSERT INTO `area` VALUES (903, '大新县', 101, 3);
INSERT INTO `area` VALUES (904, '天等县', 101, 3);
INSERT INTO `area` VALUES (905, '港口区', 102, 3);
INSERT INTO `area` VALUES (906, '防城区', 102, 3);
INSERT INTO `area` VALUES (907, '东兴市', 102, 3);
INSERT INTO `area` VALUES (908, '上思县', 102, 3);
INSERT INTO `area` VALUES (909, '港北区', 103, 3);
INSERT INTO `area` VALUES (910, '港南区', 103, 3);
INSERT INTO `area` VALUES (911, '覃塘区', 103, 3);
INSERT INTO `area` VALUES (912, '桂平市', 103, 3);
INSERT INTO `area` VALUES (913, '平南县', 103, 3);
INSERT INTO `area` VALUES (914, '金城江区', 104, 3);
INSERT INTO `area` VALUES (915, '宜州市', 104, 3);
INSERT INTO `area` VALUES (916, '天峨县', 104, 3);
INSERT INTO `area` VALUES (917, '凤山县', 104, 3);
INSERT INTO `area` VALUES (918, '南丹县', 104, 3);
INSERT INTO `area` VALUES (919, '东兰县', 104, 3);
INSERT INTO `area` VALUES (920, '都安', 104, 3);
INSERT INTO `area` VALUES (921, '罗城', 104, 3);
INSERT INTO `area` VALUES (922, '巴马', 104, 3);
INSERT INTO `area` VALUES (923, '环江', 104, 3);
INSERT INTO `area` VALUES (924, '大化', 104, 3);
INSERT INTO `area` VALUES (925, '八步区', 105, 3);
INSERT INTO `area` VALUES (926, '钟山县', 105, 3);
INSERT INTO `area` VALUES (927, '昭平县', 105, 3);
INSERT INTO `area` VALUES (928, '富川', 105, 3);
INSERT INTO `area` VALUES (929, '兴宾区', 106, 3);
INSERT INTO `area` VALUES (930, '合山市', 106, 3);
INSERT INTO `area` VALUES (931, '象州县', 106, 3);
INSERT INTO `area` VALUES (932, '武宣县', 106, 3);
INSERT INTO `area` VALUES (933, '忻城县', 106, 3);
INSERT INTO `area` VALUES (934, '金秀', 106, 3);
INSERT INTO `area` VALUES (935, '城中区', 107, 3);
INSERT INTO `area` VALUES (936, '鱼峰区', 107, 3);
INSERT INTO `area` VALUES (937, '柳北区', 107, 3);
INSERT INTO `area` VALUES (938, '柳南区', 107, 3);
INSERT INTO `area` VALUES (939, '柳江县', 107, 3);
INSERT INTO `area` VALUES (940, '柳城县', 107, 3);
INSERT INTO `area` VALUES (941, '鹿寨县', 107, 3);
INSERT INTO `area` VALUES (942, '融安县', 107, 3);
INSERT INTO `area` VALUES (943, '融水', 107, 3);
INSERT INTO `area` VALUES (944, '三江', 107, 3);
INSERT INTO `area` VALUES (945, '钦南区', 108, 3);
INSERT INTO `area` VALUES (946, '钦北区', 108, 3);
INSERT INTO `area` VALUES (947, '灵山县', 108, 3);
INSERT INTO `area` VALUES (948, '浦北县', 108, 3);
INSERT INTO `area` VALUES (949, '万秀区', 109, 3);
INSERT INTO `area` VALUES (950, '蝶山区', 109, 3);
INSERT INTO `area` VALUES (951, '长洲区', 109, 3);
INSERT INTO `area` VALUES (952, '岑溪市', 109, 3);
INSERT INTO `area` VALUES (953, '苍梧县', 109, 3);
INSERT INTO `area` VALUES (954, '藤县', 109, 3);
INSERT INTO `area` VALUES (955, '蒙山县', 109, 3);
INSERT INTO `area` VALUES (956, '玉州区', 110, 3);
INSERT INTO `area` VALUES (957, '北流市', 110, 3);
INSERT INTO `area` VALUES (958, '容县', 110, 3);
INSERT INTO `area` VALUES (959, '陆川县', 110, 3);
INSERT INTO `area` VALUES (960, '博白县', 110, 3);
INSERT INTO `area` VALUES (961, '兴业县', 110, 3);
INSERT INTO `area` VALUES (962, '南明区', 111, 3);
INSERT INTO `area` VALUES (963, '云岩区', 111, 3);
INSERT INTO `area` VALUES (964, '花溪区', 111, 3);
INSERT INTO `area` VALUES (965, '乌当区', 111, 3);
INSERT INTO `area` VALUES (966, '白云区', 111, 3);
INSERT INTO `area` VALUES (967, '小河区', 111, 3);
INSERT INTO `area` VALUES (968, '金阳新区', 111, 3);
INSERT INTO `area` VALUES (969, '新天园区', 111, 3);
INSERT INTO `area` VALUES (970, '清镇市', 111, 3);
INSERT INTO `area` VALUES (971, '开阳县', 111, 3);
INSERT INTO `area` VALUES (972, '修文县', 111, 3);
INSERT INTO `area` VALUES (973, '息烽县', 111, 3);
INSERT INTO `area` VALUES (974, '西秀区', 112, 3);
INSERT INTO `area` VALUES (975, '关岭', 112, 3);
INSERT INTO `area` VALUES (976, '镇宁', 112, 3);
INSERT INTO `area` VALUES (977, '紫云', 112, 3);
INSERT INTO `area` VALUES (978, '平坝县', 112, 3);
INSERT INTO `area` VALUES (979, '普定县', 112, 3);
INSERT INTO `area` VALUES (980, '毕节市', 113, 3);
INSERT INTO `area` VALUES (981, '大方县', 113, 3);
INSERT INTO `area` VALUES (982, '黔西县', 113, 3);
INSERT INTO `area` VALUES (983, '金沙县', 113, 3);
INSERT INTO `area` VALUES (984, '织金县', 113, 3);
INSERT INTO `area` VALUES (985, '纳雍县', 113, 3);
INSERT INTO `area` VALUES (986, '赫章县', 113, 3);
INSERT INTO `area` VALUES (987, '威宁', 113, 3);
INSERT INTO `area` VALUES (988, '钟山区', 114, 3);
INSERT INTO `area` VALUES (989, '六枝特区', 114, 3);
INSERT INTO `area` VALUES (990, '水城县', 114, 3);
INSERT INTO `area` VALUES (991, '盘县', 114, 3);
INSERT INTO `area` VALUES (992, '凯里市', 115, 3);
INSERT INTO `area` VALUES (993, '黄平县', 115, 3);
INSERT INTO `area` VALUES (994, '施秉县', 115, 3);
INSERT INTO `area` VALUES (995, '三穗县', 115, 3);
INSERT INTO `area` VALUES (996, '镇远县', 115, 3);
INSERT INTO `area` VALUES (997, '岑巩县', 115, 3);
INSERT INTO `area` VALUES (998, '天柱县', 115, 3);
INSERT INTO `area` VALUES (999, '锦屏县', 115, 3);
INSERT INTO `area` VALUES (1000, '剑河县', 115, 3);
INSERT INTO `area` VALUES (1001, '台江县', 115, 3);
INSERT INTO `area` VALUES (1002, '黎平县', 115, 3);
INSERT INTO `area` VALUES (1003, '榕江县', 115, 3);
INSERT INTO `area` VALUES (1004, '从江县', 115, 3);
INSERT INTO `area` VALUES (1005, '雷山县', 115, 3);
INSERT INTO `area` VALUES (1006, '麻江县', 115, 3);
INSERT INTO `area` VALUES (1007, '丹寨县', 115, 3);
INSERT INTO `area` VALUES (1008, '都匀市', 116, 3);
INSERT INTO `area` VALUES (1009, '福泉市', 116, 3);
INSERT INTO `area` VALUES (1010, '荔波县', 116, 3);
INSERT INTO `area` VALUES (1011, '贵定县', 116, 3);
INSERT INTO `area` VALUES (1012, '瓮安县', 116, 3);
INSERT INTO `area` VALUES (1013, '独山县', 116, 3);
INSERT INTO `area` VALUES (1014, '平塘县', 116, 3);
INSERT INTO `area` VALUES (1015, '罗甸县', 116, 3);
INSERT INTO `area` VALUES (1016, '长顺县', 116, 3);
INSERT INTO `area` VALUES (1017, '龙里县', 116, 3);
INSERT INTO `area` VALUES (1018, '惠水县', 116, 3);
INSERT INTO `area` VALUES (1019, '三都', 116, 3);
INSERT INTO `area` VALUES (1020, '兴义市', 117, 3);
INSERT INTO `area` VALUES (1021, '兴仁县', 117, 3);
INSERT INTO `area` VALUES (1022, '普安县', 117, 3);
INSERT INTO `area` VALUES (1023, '晴隆县', 117, 3);
INSERT INTO `area` VALUES (1024, '贞丰县', 117, 3);
INSERT INTO `area` VALUES (1025, '望谟县', 117, 3);
INSERT INTO `area` VALUES (1026, '册亨县', 117, 3);
INSERT INTO `area` VALUES (1027, '安龙县', 117, 3);
INSERT INTO `area` VALUES (1028, '铜仁市', 118, 3);
INSERT INTO `area` VALUES (1029, '江口县', 118, 3);
INSERT INTO `area` VALUES (1030, '石阡县', 118, 3);
INSERT INTO `area` VALUES (1031, '思南县', 118, 3);
INSERT INTO `area` VALUES (1032, '德江县', 118, 3);
INSERT INTO `area` VALUES (1033, '玉屏', 118, 3);
INSERT INTO `area` VALUES (1034, '印江', 118, 3);
INSERT INTO `area` VALUES (1035, '沿河', 118, 3);
INSERT INTO `area` VALUES (1036, '松桃', 118, 3);
INSERT INTO `area` VALUES (1037, '万山特区', 118, 3);
INSERT INTO `area` VALUES (1038, '红花岗区', 119, 3);
INSERT INTO `area` VALUES (1039, '务川县', 119, 3);
INSERT INTO `area` VALUES (1040, '道真县', 119, 3);
INSERT INTO `area` VALUES (1041, '汇川区', 119, 3);
INSERT INTO `area` VALUES (1042, '赤水市', 119, 3);
INSERT INTO `area` VALUES (1043, '仁怀市', 119, 3);
INSERT INTO `area` VALUES (1044, '遵义县', 119, 3);
INSERT INTO `area` VALUES (1045, '桐梓县', 119, 3);
INSERT INTO `area` VALUES (1046, '绥阳县', 119, 3);
INSERT INTO `area` VALUES (1047, '正安县', 119, 3);
INSERT INTO `area` VALUES (1048, '凤冈县', 119, 3);
INSERT INTO `area` VALUES (1049, '湄潭县', 119, 3);
INSERT INTO `area` VALUES (1050, '余庆县', 119, 3);
INSERT INTO `area` VALUES (1051, '习水县', 119, 3);
INSERT INTO `area` VALUES (1052, '道真', 119, 3);
INSERT INTO `area` VALUES (1053, '务川', 119, 3);
INSERT INTO `area` VALUES (1054, '秀英区', 120, 3);
INSERT INTO `area` VALUES (1055, '龙华区', 120, 3);
INSERT INTO `area` VALUES (1056, '琼山区', 120, 3);
INSERT INTO `area` VALUES (1057, '美兰区', 120, 3);
INSERT INTO `area` VALUES (1058, '市区', 137, 3);
INSERT INTO `area` VALUES (1059, '洋浦开发区', 137, 3);
INSERT INTO `area` VALUES (1060, '那大镇', 137, 3);
INSERT INTO `area` VALUES (1061, '王五镇', 137, 3);
INSERT INTO `area` VALUES (1062, '雅星镇', 137, 3);
INSERT INTO `area` VALUES (1063, '大成镇', 137, 3);
INSERT INTO `area` VALUES (1064, '中和镇', 137, 3);
INSERT INTO `area` VALUES (1065, '峨蔓镇', 137, 3);
INSERT INTO `area` VALUES (1066, '南丰镇', 137, 3);
INSERT INTO `area` VALUES (1067, '白马井镇', 137, 3);
INSERT INTO `area` VALUES (1068, '兰洋镇', 137, 3);
INSERT INTO `area` VALUES (1069, '和庆镇', 137, 3);
INSERT INTO `area` VALUES (1070, '海头镇', 137, 3);
INSERT INTO `area` VALUES (1071, '排浦镇', 137, 3);
INSERT INTO `area` VALUES (1072, '东成镇', 137, 3);
INSERT INTO `area` VALUES (1073, '光村镇', 137, 3);
INSERT INTO `area` VALUES (1074, '木棠镇', 137, 3);
INSERT INTO `area` VALUES (1075, '新州镇', 137, 3);
INSERT INTO `area` VALUES (1076, '三都镇', 137, 3);
INSERT INTO `area` VALUES (1077, '其他', 137, 3);
INSERT INTO `area` VALUES (1078, '长安区', 138, 3);
INSERT INTO `area` VALUES (1079, '桥东区', 138, 3);
INSERT INTO `area` VALUES (1080, '桥西区', 138, 3);
INSERT INTO `area` VALUES (1081, '新华区', 138, 3);
INSERT INTO `area` VALUES (1082, '裕华区', 138, 3);
INSERT INTO `area` VALUES (1083, '井陉矿区', 138, 3);
INSERT INTO `area` VALUES (1084, '高新区', 138, 3);
INSERT INTO `area` VALUES (1085, '辛集市', 138, 3);
INSERT INTO `area` VALUES (1086, '藁城市', 138, 3);
INSERT INTO `area` VALUES (1087, '晋州市', 138, 3);
INSERT INTO `area` VALUES (1088, '新乐市', 138, 3);
INSERT INTO `area` VALUES (1089, '鹿泉市', 138, 3);
INSERT INTO `area` VALUES (1090, '井陉县', 138, 3);
INSERT INTO `area` VALUES (1091, '正定县', 138, 3);
INSERT INTO `area` VALUES (1092, '栾城县', 138, 3);
INSERT INTO `area` VALUES (1093, '行唐县', 138, 3);
INSERT INTO `area` VALUES (1094, '灵寿县', 138, 3);
INSERT INTO `area` VALUES (1095, '高邑县', 138, 3);
INSERT INTO `area` VALUES (1096, '深泽县', 138, 3);
INSERT INTO `area` VALUES (1097, '赞皇县', 138, 3);
INSERT INTO `area` VALUES (1098, '无极县', 138, 3);
INSERT INTO `area` VALUES (1099, '平山县', 138, 3);
INSERT INTO `area` VALUES (1100, '元氏县', 138, 3);
INSERT INTO `area` VALUES (1101, '赵县', 138, 3);
INSERT INTO `area` VALUES (1102, '新市区', 139, 3);
INSERT INTO `area` VALUES (1103, '南市区', 139, 3);
INSERT INTO `area` VALUES (1104, '北市区', 139, 3);
INSERT INTO `area` VALUES (1105, '涿州市', 139, 3);
INSERT INTO `area` VALUES (1106, '定州市', 139, 3);
INSERT INTO `area` VALUES (1107, '安国市', 139, 3);
INSERT INTO `area` VALUES (1108, '高碑店市', 139, 3);
INSERT INTO `area` VALUES (1109, '满城县', 139, 3);
INSERT INTO `area` VALUES (1110, '清苑县', 139, 3);
INSERT INTO `area` VALUES (1111, '涞水县', 139, 3);
INSERT INTO `area` VALUES (1112, '阜平县', 139, 3);
INSERT INTO `area` VALUES (1113, '徐水县', 139, 3);
INSERT INTO `area` VALUES (1114, '定兴县', 139, 3);
INSERT INTO `area` VALUES (1115, '唐县', 139, 3);
INSERT INTO `area` VALUES (1116, '高阳县', 139, 3);
INSERT INTO `area` VALUES (1117, '容城县', 139, 3);
INSERT INTO `area` VALUES (1118, '涞源县', 139, 3);
INSERT INTO `area` VALUES (1119, '望都县', 139, 3);
INSERT INTO `area` VALUES (1120, '安新县', 139, 3);
INSERT INTO `area` VALUES (1121, '易县', 139, 3);
INSERT INTO `area` VALUES (1122, '曲阳县', 139, 3);
INSERT INTO `area` VALUES (1123, '蠡县', 139, 3);
INSERT INTO `area` VALUES (1124, '顺平县', 139, 3);
INSERT INTO `area` VALUES (1125, '博野县', 139, 3);
INSERT INTO `area` VALUES (1126, '雄县', 139, 3);
INSERT INTO `area` VALUES (1127, '运河区', 140, 3);
INSERT INTO `area` VALUES (1128, '新华区', 140, 3);
INSERT INTO `area` VALUES (1129, '泊头市', 140, 3);
INSERT INTO `area` VALUES (1130, '任丘市', 140, 3);
INSERT INTO `area` VALUES (1131, '黄骅市', 140, 3);
INSERT INTO `area` VALUES (1132, '河间市', 140, 3);
INSERT INTO `area` VALUES (1133, '沧县', 140, 3);
INSERT INTO `area` VALUES (1134, '青县', 140, 3);
INSERT INTO `area` VALUES (1135, '东光县', 140, 3);
INSERT INTO `area` VALUES (1136, '海兴县', 140, 3);
INSERT INTO `area` VALUES (1137, '盐山县', 140, 3);
INSERT INTO `area` VALUES (1138, '肃宁县', 140, 3);
INSERT INTO `area` VALUES (1139, '南皮县', 140, 3);
INSERT INTO `area` VALUES (1140, '吴桥县', 140, 3);
INSERT INTO `area` VALUES (1141, '献县', 140, 3);
INSERT INTO `area` VALUES (1142, '孟村', 140, 3);
INSERT INTO `area` VALUES (1143, '双桥区', 141, 3);
INSERT INTO `area` VALUES (1144, '双滦区', 141, 3);
INSERT INTO `area` VALUES (1145, '鹰手营子矿区', 141, 3);
INSERT INTO `area` VALUES (1146, '承德县', 141, 3);
INSERT INTO `area` VALUES (1147, '兴隆县', 141, 3);
INSERT INTO `area` VALUES (1148, '平泉县', 141, 3);
INSERT INTO `area` VALUES (1149, '滦平县', 141, 3);
INSERT INTO `area` VALUES (1150, '隆化县', 141, 3);
INSERT INTO `area` VALUES (1151, '丰宁', 141, 3);
INSERT INTO `area` VALUES (1152, '宽城', 141, 3);
INSERT INTO `area` VALUES (1153, '围场', 141, 3);
INSERT INTO `area` VALUES (1154, '从台区', 142, 3);
INSERT INTO `area` VALUES (1155, '复兴区', 142, 3);
INSERT INTO `area` VALUES (1156, '邯山区', 142, 3);
INSERT INTO `area` VALUES (1157, '峰峰矿区', 142, 3);
INSERT INTO `area` VALUES (1158, '武安市', 142, 3);
INSERT INTO `area` VALUES (1159, '邯郸县', 142, 3);
INSERT INTO `area` VALUES (1160, '临漳县', 142, 3);
INSERT INTO `area` VALUES (1161, '成安县', 142, 3);
INSERT INTO `area` VALUES (1162, '大名县', 142, 3);
INSERT INTO `area` VALUES (1163, '涉县', 142, 3);
INSERT INTO `area` VALUES (1164, '磁县', 142, 3);
INSERT INTO `area` VALUES (1165, '肥乡县', 142, 3);
INSERT INTO `area` VALUES (1166, '永年县', 142, 3);
INSERT INTO `area` VALUES (1167, '邱县', 142, 3);
INSERT INTO `area` VALUES (1168, '鸡泽县', 142, 3);
INSERT INTO `area` VALUES (1169, '广平县', 142, 3);
INSERT INTO `area` VALUES (1170, '馆陶县', 142, 3);
INSERT INTO `area` VALUES (1171, '魏县', 142, 3);
INSERT INTO `area` VALUES (1172, '曲周县', 142, 3);
INSERT INTO `area` VALUES (1173, '桃城区', 143, 3);
INSERT INTO `area` VALUES (1174, '冀州市', 143, 3);
INSERT INTO `area` VALUES (1175, '深州市', 143, 3);
INSERT INTO `area` VALUES (1176, '枣强县', 143, 3);
INSERT INTO `area` VALUES (1177, '武邑县', 143, 3);
INSERT INTO `area` VALUES (1178, '武强县', 143, 3);
INSERT INTO `area` VALUES (1179, '饶阳县', 143, 3);
INSERT INTO `area` VALUES (1180, '安平县', 143, 3);
INSERT INTO `area` VALUES (1181, '故城县', 143, 3);
INSERT INTO `area` VALUES (1182, '景县', 143, 3);
INSERT INTO `area` VALUES (1183, '阜城县', 143, 3);
INSERT INTO `area` VALUES (1184, '安次区', 144, 3);
INSERT INTO `area` VALUES (1185, '广阳区', 144, 3);
INSERT INTO `area` VALUES (1186, '霸州市', 144, 3);
INSERT INTO `area` VALUES (1187, '三河市', 144, 3);
INSERT INTO `area` VALUES (1188, '固安县', 144, 3);
INSERT INTO `area` VALUES (1189, '永清县', 144, 3);
INSERT INTO `area` VALUES (1190, '香河县', 144, 3);
INSERT INTO `area` VALUES (1191, '大城县', 144, 3);
INSERT INTO `area` VALUES (1192, '文安县', 144, 3);
INSERT INTO `area` VALUES (1193, '大厂', 144, 3);
INSERT INTO `area` VALUES (1194, '海港区', 145, 3);
INSERT INTO `area` VALUES (1195, '山海关区', 145, 3);
INSERT INTO `area` VALUES (1196, '北戴河区', 145, 3);
INSERT INTO `area` VALUES (1197, '昌黎县', 145, 3);
INSERT INTO `area` VALUES (1198, '抚宁县', 145, 3);
INSERT INTO `area` VALUES (1199, '卢龙县', 145, 3);
INSERT INTO `area` VALUES (1200, '青龙', 145, 3);
INSERT INTO `area` VALUES (1201, '路北区', 146, 3);
INSERT INTO `area` VALUES (1202, '路南区', 146, 3);
INSERT INTO `area` VALUES (1203, '古冶区', 146, 3);
INSERT INTO `area` VALUES (1204, '开平区', 146, 3);
INSERT INTO `area` VALUES (1205, '丰南区', 146, 3);
INSERT INTO `area` VALUES (1206, '丰润区', 146, 3);
INSERT INTO `area` VALUES (1207, '遵化市', 146, 3);
INSERT INTO `area` VALUES (1208, '迁安市', 146, 3);
INSERT INTO `area` VALUES (1209, '滦县', 146, 3);
INSERT INTO `area` VALUES (1210, '滦南县', 146, 3);
INSERT INTO `area` VALUES (1211, '乐亭县', 146, 3);
INSERT INTO `area` VALUES (1212, '迁西县', 146, 3);
INSERT INTO `area` VALUES (1213, '玉田县', 146, 3);
INSERT INTO `area` VALUES (1214, '唐海县', 146, 3);
INSERT INTO `area` VALUES (1215, '桥东区', 147, 3);
INSERT INTO `area` VALUES (1216, '桥西区', 147, 3);
INSERT INTO `area` VALUES (1217, '南宫市', 147, 3);
INSERT INTO `area` VALUES (1218, '沙河市', 147, 3);
INSERT INTO `area` VALUES (1219, '邢台县', 147, 3);
INSERT INTO `area` VALUES (1220, '临城县', 147, 3);
INSERT INTO `area` VALUES (1221, '内丘县', 147, 3);
INSERT INTO `area` VALUES (1222, '柏乡县', 147, 3);
INSERT INTO `area` VALUES (1223, '隆尧县', 147, 3);
INSERT INTO `area` VALUES (1224, '任县', 147, 3);
INSERT INTO `area` VALUES (1225, '南和县', 147, 3);
INSERT INTO `area` VALUES (1226, '宁晋县', 147, 3);
INSERT INTO `area` VALUES (1227, '巨鹿县', 147, 3);
INSERT INTO `area` VALUES (1228, '新河县', 147, 3);
INSERT INTO `area` VALUES (1229, '广宗县', 147, 3);
INSERT INTO `area` VALUES (1230, '平乡县', 147, 3);
INSERT INTO `area` VALUES (1231, '威县', 147, 3);
INSERT INTO `area` VALUES (1232, '清河县', 147, 3);
INSERT INTO `area` VALUES (1233, '临西县', 147, 3);
INSERT INTO `area` VALUES (1234, '桥西区', 148, 3);
INSERT INTO `area` VALUES (1235, '桥东区', 148, 3);
INSERT INTO `area` VALUES (1236, '宣化区', 148, 3);
INSERT INTO `area` VALUES (1237, '下花园区', 148, 3);
INSERT INTO `area` VALUES (1238, '宣化县', 148, 3);
INSERT INTO `area` VALUES (1239, '张北县', 148, 3);
INSERT INTO `area` VALUES (1240, '康保县', 148, 3);
INSERT INTO `area` VALUES (1241, '沽源县', 148, 3);
INSERT INTO `area` VALUES (1242, '尚义县', 148, 3);
INSERT INTO `area` VALUES (1243, '蔚县', 148, 3);
INSERT INTO `area` VALUES (1244, '阳原县', 148, 3);
INSERT INTO `area` VALUES (1245, '怀安县', 148, 3);
INSERT INTO `area` VALUES (1246, '万全县', 148, 3);
INSERT INTO `area` VALUES (1247, '怀来县', 148, 3);
INSERT INTO `area` VALUES (1248, '涿鹿县', 148, 3);
INSERT INTO `area` VALUES (1249, '赤城县', 148, 3);
INSERT INTO `area` VALUES (1250, '崇礼县', 148, 3);
INSERT INTO `area` VALUES (1251, '金水区', 149, 3);
INSERT INTO `area` VALUES (1252, '邙山区', 149, 3);
INSERT INTO `area` VALUES (1253, '二七区', 149, 3);
INSERT INTO `area` VALUES (1254, '管城区', 149, 3);
INSERT INTO `area` VALUES (1255, '中原区', 149, 3);
INSERT INTO `area` VALUES (1256, '上街区', 149, 3);
INSERT INTO `area` VALUES (1257, '惠济区', 149, 3);
INSERT INTO `area` VALUES (1258, '郑东新区', 149, 3);
INSERT INTO `area` VALUES (1259, '经济技术开发区', 149, 3);
INSERT INTO `area` VALUES (1260, '高新开发区', 149, 3);
INSERT INTO `area` VALUES (1261, '出口加工区', 149, 3);
INSERT INTO `area` VALUES (1262, '巩义市', 149, 3);
INSERT INTO `area` VALUES (1263, '荥阳市', 149, 3);
INSERT INTO `area` VALUES (1264, '新密市', 149, 3);
INSERT INTO `area` VALUES (1265, '新郑市', 149, 3);
INSERT INTO `area` VALUES (1266, '登封市', 149, 3);
INSERT INTO `area` VALUES (1267, '中牟县', 149, 3);
INSERT INTO `area` VALUES (1268, '西工区', 150, 3);
INSERT INTO `area` VALUES (1269, '老城区', 150, 3);
INSERT INTO `area` VALUES (1270, '涧西区', 150, 3);
INSERT INTO `area` VALUES (1271, '瀍河回族区', 150, 3);
INSERT INTO `area` VALUES (1272, '洛龙区', 150, 3);
INSERT INTO `area` VALUES (1273, '吉利区', 150, 3);
INSERT INTO `area` VALUES (1274, '偃师市', 150, 3);
INSERT INTO `area` VALUES (1275, '孟津县', 150, 3);
INSERT INTO `area` VALUES (1276, '新安县', 150, 3);
INSERT INTO `area` VALUES (1277, '栾川县', 150, 3);
INSERT INTO `area` VALUES (1278, '嵩县', 150, 3);
INSERT INTO `area` VALUES (1279, '汝阳县', 150, 3);
INSERT INTO `area` VALUES (1280, '宜阳县', 150, 3);
INSERT INTO `area` VALUES (1281, '洛宁县', 150, 3);
INSERT INTO `area` VALUES (1282, '伊川县', 150, 3);
INSERT INTO `area` VALUES (1283, '鼓楼区', 151, 3);
INSERT INTO `area` VALUES (1284, '龙亭区', 151, 3);
INSERT INTO `area` VALUES (1285, '顺河回族区', 151, 3);
INSERT INTO `area` VALUES (1286, '金明区', 151, 3);
INSERT INTO `area` VALUES (1287, '禹王台区', 151, 3);
INSERT INTO `area` VALUES (1288, '杞县', 151, 3);
INSERT INTO `area` VALUES (1289, '通许县', 151, 3);
INSERT INTO `area` VALUES (1290, '尉氏县', 151, 3);
INSERT INTO `area` VALUES (1291, '开封县', 151, 3);
INSERT INTO `area` VALUES (1292, '兰考县', 151, 3);
INSERT INTO `area` VALUES (1293, '北关区', 152, 3);
INSERT INTO `area` VALUES (1294, '文峰区', 152, 3);
INSERT INTO `area` VALUES (1295, '殷都区', 152, 3);
INSERT INTO `area` VALUES (1296, '龙安区', 152, 3);
INSERT INTO `area` VALUES (1297, '林州市', 152, 3);
INSERT INTO `area` VALUES (1298, '安阳县', 152, 3);
INSERT INTO `area` VALUES (1299, '汤阴县', 152, 3);
INSERT INTO `area` VALUES (1300, '滑县', 152, 3);
INSERT INTO `area` VALUES (1301, '内黄县', 152, 3);
INSERT INTO `area` VALUES (1302, '淇滨区', 153, 3);
INSERT INTO `area` VALUES (1303, '山城区', 153, 3);
INSERT INTO `area` VALUES (1304, '鹤山区', 153, 3);
INSERT INTO `area` VALUES (1305, '浚县', 153, 3);
INSERT INTO `area` VALUES (1306, '淇县', 153, 3);
INSERT INTO `area` VALUES (1307, '济源市', 154, 3);
INSERT INTO `area` VALUES (1308, '解放区', 155, 3);
INSERT INTO `area` VALUES (1309, '中站区', 155, 3);
INSERT INTO `area` VALUES (1310, '马村区', 155, 3);
INSERT INTO `area` VALUES (1311, '山阳区', 155, 3);
INSERT INTO `area` VALUES (1312, '沁阳市', 155, 3);
INSERT INTO `area` VALUES (1313, '孟州市', 155, 3);
INSERT INTO `area` VALUES (1314, '修武县', 155, 3);
INSERT INTO `area` VALUES (1315, '博爱县', 155, 3);
INSERT INTO `area` VALUES (1316, '武陟县', 155, 3);
INSERT INTO `area` VALUES (1317, '温县', 155, 3);
INSERT INTO `area` VALUES (1318, '卧龙区', 156, 3);
INSERT INTO `area` VALUES (1319, '宛城区', 156, 3);
INSERT INTO `area` VALUES (1320, '邓州市', 156, 3);
INSERT INTO `area` VALUES (1321, '南召县', 156, 3);
INSERT INTO `area` VALUES (1322, '方城县', 156, 3);
INSERT INTO `area` VALUES (1323, '西峡县', 156, 3);
INSERT INTO `area` VALUES (1324, '镇平县', 156, 3);
INSERT INTO `area` VALUES (1325, '内乡县', 156, 3);
INSERT INTO `area` VALUES (1326, '淅川县', 156, 3);
INSERT INTO `area` VALUES (1327, '社旗县', 156, 3);
INSERT INTO `area` VALUES (1328, '唐河县', 156, 3);
INSERT INTO `area` VALUES (1329, '新野县', 156, 3);
INSERT INTO `area` VALUES (1330, '桐柏县', 156, 3);
INSERT INTO `area` VALUES (1331, '新华区', 157, 3);
INSERT INTO `area` VALUES (1332, '卫东区', 157, 3);
INSERT INTO `area` VALUES (1333, '湛河区', 157, 3);
INSERT INTO `area` VALUES (1334, '石龙区', 157, 3);
INSERT INTO `area` VALUES (1335, '舞钢市', 157, 3);
INSERT INTO `area` VALUES (1336, '汝州市', 157, 3);
INSERT INTO `area` VALUES (1337, '宝丰县', 157, 3);
INSERT INTO `area` VALUES (1338, '叶县', 157, 3);
INSERT INTO `area` VALUES (1339, '鲁山县', 157, 3);
INSERT INTO `area` VALUES (1340, '郏县', 157, 3);
INSERT INTO `area` VALUES (1341, '湖滨区', 158, 3);
INSERT INTO `area` VALUES (1342, '义马市', 158, 3);
INSERT INTO `area` VALUES (1343, '灵宝市', 158, 3);
INSERT INTO `area` VALUES (1344, '渑池县', 158, 3);
INSERT INTO `area` VALUES (1345, '陕县', 158, 3);
INSERT INTO `area` VALUES (1346, '卢氏县', 158, 3);
INSERT INTO `area` VALUES (1347, '梁园区', 159, 3);
INSERT INTO `area` VALUES (1348, '睢阳区', 159, 3);
INSERT INTO `area` VALUES (1349, '永城市', 159, 3);
INSERT INTO `area` VALUES (1350, '民权县', 159, 3);
INSERT INTO `area` VALUES (1351, '睢县', 159, 3);
INSERT INTO `area` VALUES (1352, '宁陵县', 159, 3);
INSERT INTO `area` VALUES (1353, '虞城县', 159, 3);
INSERT INTO `area` VALUES (1354, '柘城县', 159, 3);
INSERT INTO `area` VALUES (1355, '夏邑县', 159, 3);
INSERT INTO `area` VALUES (1356, '卫滨区', 160, 3);
INSERT INTO `area` VALUES (1357, '红旗区', 160, 3);
INSERT INTO `area` VALUES (1358, '凤泉区', 160, 3);
INSERT INTO `area` VALUES (1359, '牧野区', 160, 3);
INSERT INTO `area` VALUES (1360, '卫辉市', 160, 3);
INSERT INTO `area` VALUES (1361, '辉县市', 160, 3);
INSERT INTO `area` VALUES (1362, '新乡县', 160, 3);
INSERT INTO `area` VALUES (1363, '获嘉县', 160, 3);
INSERT INTO `area` VALUES (1364, '原阳县', 160, 3);
INSERT INTO `area` VALUES (1365, '延津县', 160, 3);
INSERT INTO `area` VALUES (1366, '封丘县', 160, 3);
INSERT INTO `area` VALUES (1367, '长垣县', 160, 3);
INSERT INTO `area` VALUES (1368, '浉河区', 161, 3);
INSERT INTO `area` VALUES (1369, '平桥区', 161, 3);
INSERT INTO `area` VALUES (1370, '罗山县', 161, 3);
INSERT INTO `area` VALUES (1371, '光山县', 161, 3);
INSERT INTO `area` VALUES (1372, '新县', 161, 3);
INSERT INTO `area` VALUES (1373, '商城县', 161, 3);
INSERT INTO `area` VALUES (1374, '固始县', 161, 3);
INSERT INTO `area` VALUES (1375, '潢川县', 161, 3);
INSERT INTO `area` VALUES (1376, '淮滨县', 161, 3);
INSERT INTO `area` VALUES (1377, '息县', 161, 3);
INSERT INTO `area` VALUES (1378, '魏都区', 162, 3);
INSERT INTO `area` VALUES (1379, '禹州市', 162, 3);
INSERT INTO `area` VALUES (1380, '长葛市', 162, 3);
INSERT INTO `area` VALUES (1381, '许昌县', 162, 3);
INSERT INTO `area` VALUES (1382, '鄢陵县', 162, 3);
INSERT INTO `area` VALUES (1383, '襄城县', 162, 3);
INSERT INTO `area` VALUES (1384, '川汇区', 163, 3);
INSERT INTO `area` VALUES (1385, '项城市', 163, 3);
INSERT INTO `area` VALUES (1386, '扶沟县', 163, 3);
INSERT INTO `area` VALUES (1387, '西华县', 163, 3);
INSERT INTO `area` VALUES (1388, '商水县', 163, 3);
INSERT INTO `area` VALUES (1389, '沈丘县', 163, 3);
INSERT INTO `area` VALUES (1390, '郸城县', 163, 3);
INSERT INTO `area` VALUES (1391, '淮阳县', 163, 3);
INSERT INTO `area` VALUES (1392, '太康县', 163, 3);
INSERT INTO `area` VALUES (1393, '鹿邑县', 163, 3);
INSERT INTO `area` VALUES (1394, '驿城区', 164, 3);
INSERT INTO `area` VALUES (1395, '西平县', 164, 3);
INSERT INTO `area` VALUES (1396, '上蔡县', 164, 3);
INSERT INTO `area` VALUES (1397, '平舆县', 164, 3);
INSERT INTO `area` VALUES (1398, '正阳县', 164, 3);
INSERT INTO `area` VALUES (1399, '确山县', 164, 3);
INSERT INTO `area` VALUES (1400, '泌阳县', 164, 3);
INSERT INTO `area` VALUES (1401, '汝南县', 164, 3);
INSERT INTO `area` VALUES (1402, '遂平县', 164, 3);
INSERT INTO `area` VALUES (1403, '新蔡县', 164, 3);
INSERT INTO `area` VALUES (1404, '郾城区', 165, 3);
INSERT INTO `area` VALUES (1405, '源汇区', 165, 3);
INSERT INTO `area` VALUES (1406, '召陵区', 165, 3);
INSERT INTO `area` VALUES (1407, '舞阳县', 165, 3);
INSERT INTO `area` VALUES (1408, '临颍县', 165, 3);
INSERT INTO `area` VALUES (1409, '华龙区', 166, 3);
INSERT INTO `area` VALUES (1410, '清丰县', 166, 3);
INSERT INTO `area` VALUES (1411, '南乐县', 166, 3);
INSERT INTO `area` VALUES (1412, '范县', 166, 3);
INSERT INTO `area` VALUES (1413, '台前县', 166, 3);
INSERT INTO `area` VALUES (1414, '濮阳县', 166, 3);
INSERT INTO `area` VALUES (1415, '道里区', 167, 3);
INSERT INTO `area` VALUES (1416, '南岗区', 167, 3);
INSERT INTO `area` VALUES (1417, '动力区', 167, 3);
INSERT INTO `area` VALUES (1418, '平房区', 167, 3);
INSERT INTO `area` VALUES (1419, '香坊区', 167, 3);
INSERT INTO `area` VALUES (1420, '太平区', 167, 3);
INSERT INTO `area` VALUES (1421, '道外区', 167, 3);
INSERT INTO `area` VALUES (1422, '阿城区', 167, 3);
INSERT INTO `area` VALUES (1423, '呼兰区', 167, 3);
INSERT INTO `area` VALUES (1424, '松北区', 167, 3);
INSERT INTO `area` VALUES (1425, '尚志市', 167, 3);
INSERT INTO `area` VALUES (1426, '双城市', 167, 3);
INSERT INTO `area` VALUES (1427, '五常市', 167, 3);
INSERT INTO `area` VALUES (1428, '方正县', 167, 3);
INSERT INTO `area` VALUES (1429, '宾县', 167, 3);
INSERT INTO `area` VALUES (1430, '依兰县', 167, 3);
INSERT INTO `area` VALUES (1431, '巴彦县', 167, 3);
INSERT INTO `area` VALUES (1432, '通河县', 167, 3);
INSERT INTO `area` VALUES (1433, '木兰县', 167, 3);
INSERT INTO `area` VALUES (1434, '延寿县', 167, 3);
INSERT INTO `area` VALUES (1435, '萨尔图区', 168, 3);
INSERT INTO `area` VALUES (1436, '红岗区', 168, 3);
INSERT INTO `area` VALUES (1437, '龙凤区', 168, 3);
INSERT INTO `area` VALUES (1438, '让胡路区', 168, 3);
INSERT INTO `area` VALUES (1439, '大同区', 168, 3);
INSERT INTO `area` VALUES (1440, '肇州县', 168, 3);
INSERT INTO `area` VALUES (1441, '肇源县', 168, 3);
INSERT INTO `area` VALUES (1442, '林甸县', 168, 3);
INSERT INTO `area` VALUES (1443, '杜尔伯特', 168, 3);
INSERT INTO `area` VALUES (1444, '呼玛县', 169, 3);
INSERT INTO `area` VALUES (1445, '漠河县', 169, 3);
INSERT INTO `area` VALUES (1446, '塔河县', 169, 3);
INSERT INTO `area` VALUES (1447, '兴山区', 170, 3);
INSERT INTO `area` VALUES (1448, '工农区', 170, 3);
INSERT INTO `area` VALUES (1449, '南山区', 170, 3);
INSERT INTO `area` VALUES (1450, '兴安区', 170, 3);
INSERT INTO `area` VALUES (1451, '向阳区', 170, 3);
INSERT INTO `area` VALUES (1452, '东山区', 170, 3);
INSERT INTO `area` VALUES (1453, '萝北县', 170, 3);
INSERT INTO `area` VALUES (1454, '绥滨县', 170, 3);
INSERT INTO `area` VALUES (1455, '爱辉区', 171, 3);
INSERT INTO `area` VALUES (1456, '五大连池市', 171, 3);
INSERT INTO `area` VALUES (1457, '北安市', 171, 3);
INSERT INTO `area` VALUES (1458, '嫩江县', 171, 3);
INSERT INTO `area` VALUES (1459, '逊克县', 171, 3);
INSERT INTO `area` VALUES (1460, '孙吴县', 171, 3);
INSERT INTO `area` VALUES (1461, '鸡冠区', 172, 3);
INSERT INTO `area` VALUES (1462, '恒山区', 172, 3);
INSERT INTO `area` VALUES (1463, '城子河区', 172, 3);
INSERT INTO `area` VALUES (1464, '滴道区', 172, 3);
INSERT INTO `area` VALUES (1465, '梨树区', 172, 3);
INSERT INTO `area` VALUES (1466, '虎林市', 172, 3);
INSERT INTO `area` VALUES (1467, '密山市', 172, 3);
INSERT INTO `area` VALUES (1468, '鸡东县', 172, 3);
INSERT INTO `area` VALUES (1469, '前进区', 173, 3);
INSERT INTO `area` VALUES (1470, '郊区', 173, 3);
INSERT INTO `area` VALUES (1471, '向阳区', 173, 3);
INSERT INTO `area` VALUES (1472, '东风区', 173, 3);
INSERT INTO `area` VALUES (1473, '同江市', 173, 3);
INSERT INTO `area` VALUES (1474, '富锦市', 173, 3);
INSERT INTO `area` VALUES (1475, '桦南县', 173, 3);
INSERT INTO `area` VALUES (1476, '桦川县', 173, 3);
INSERT INTO `area` VALUES (1477, '汤原县', 173, 3);
INSERT INTO `area` VALUES (1478, '抚远县', 173, 3);
INSERT INTO `area` VALUES (1479, '爱民区', 174, 3);
INSERT INTO `area` VALUES (1480, '东安区', 174, 3);
INSERT INTO `area` VALUES (1481, '阳明区', 174, 3);
INSERT INTO `area` VALUES (1482, '西安区', 174, 3);
INSERT INTO `area` VALUES (1483, '绥芬河市', 174, 3);
INSERT INTO `area` VALUES (1484, '海林市', 174, 3);
INSERT INTO `area` VALUES (1485, '宁安市', 174, 3);
INSERT INTO `area` VALUES (1486, '穆棱市', 174, 3);
INSERT INTO `area` VALUES (1487, '东宁县', 174, 3);
INSERT INTO `area` VALUES (1488, '林口县', 174, 3);
INSERT INTO `area` VALUES (1489, '桃山区', 175, 3);
INSERT INTO `area` VALUES (1490, '新兴区', 175, 3);
INSERT INTO `area` VALUES (1491, '茄子河区', 175, 3);
INSERT INTO `area` VALUES (1492, '勃利县', 175, 3);
INSERT INTO `area` VALUES (1493, '龙沙区', 176, 3);
INSERT INTO `area` VALUES (1494, '昂昂溪区', 176, 3);
INSERT INTO `area` VALUES (1495, '铁峰区', 176, 3);
INSERT INTO `area` VALUES (1496, '建华区', 176, 3);
INSERT INTO `area` VALUES (1497, '富拉尔基区', 176, 3);
INSERT INTO `area` VALUES (1498, '碾子山区', 176, 3);
INSERT INTO `area` VALUES (1499, '梅里斯达斡尔区', 176, 3);
INSERT INTO `area` VALUES (1500, '讷河市', 176, 3);
INSERT INTO `area` VALUES (1501, '龙江县', 176, 3);
INSERT INTO `area` VALUES (1502, '依安县', 176, 3);
INSERT INTO `area` VALUES (1503, '泰来县', 176, 3);
INSERT INTO `area` VALUES (1504, '甘南县', 176, 3);
INSERT INTO `area` VALUES (1505, '富裕县', 176, 3);
INSERT INTO `area` VALUES (1506, '克山县', 176, 3);
INSERT INTO `area` VALUES (1507, '克东县', 176, 3);
INSERT INTO `area` VALUES (1508, '拜泉县', 176, 3);
INSERT INTO `area` VALUES (1509, '尖山区', 177, 3);
INSERT INTO `area` VALUES (1510, '岭东区', 177, 3);
INSERT INTO `area` VALUES (1511, '四方台区', 177, 3);
INSERT INTO `area` VALUES (1512, '宝山区', 177, 3);
INSERT INTO `area` VALUES (1513, '集贤县', 177, 3);
INSERT INTO `area` VALUES (1514, '友谊县', 177, 3);
INSERT INTO `area` VALUES (1515, '宝清县', 177, 3);
INSERT INTO `area` VALUES (1516, '饶河县', 177, 3);
INSERT INTO `area` VALUES (1517, '北林区', 178, 3);
INSERT INTO `area` VALUES (1518, '安达市', 178, 3);
INSERT INTO `area` VALUES (1519, '肇东市', 178, 3);
INSERT INTO `area` VALUES (1520, '海伦市', 178, 3);
INSERT INTO `area` VALUES (1521, '望奎县', 178, 3);
INSERT INTO `area` VALUES (1522, '兰西县', 178, 3);
INSERT INTO `area` VALUES (1523, '青冈县', 178, 3);
INSERT INTO `area` VALUES (1524, '庆安县', 178, 3);
INSERT INTO `area` VALUES (1525, '明水县', 178, 3);
INSERT INTO `area` VALUES (1526, '绥棱县', 178, 3);
INSERT INTO `area` VALUES (1527, '伊春区', 179, 3);
INSERT INTO `area` VALUES (1528, '带岭区', 179, 3);
INSERT INTO `area` VALUES (1529, '南岔区', 179, 3);
INSERT INTO `area` VALUES (1530, '金山屯区', 179, 3);
INSERT INTO `area` VALUES (1531, '西林区', 179, 3);
INSERT INTO `area` VALUES (1532, '美溪区', 179, 3);
INSERT INTO `area` VALUES (1533, '乌马河区', 179, 3);
INSERT INTO `area` VALUES (1534, '翠峦区', 179, 3);
INSERT INTO `area` VALUES (1535, '友好区', 179, 3);
INSERT INTO `area` VALUES (1536, '上甘岭区', 179, 3);
INSERT INTO `area` VALUES (1537, '五营区', 179, 3);
INSERT INTO `area` VALUES (1538, '红星区', 179, 3);
INSERT INTO `area` VALUES (1539, '新青区', 179, 3);
INSERT INTO `area` VALUES (1540, '汤旺河区', 179, 3);
INSERT INTO `area` VALUES (1541, '乌伊岭区', 179, 3);
INSERT INTO `area` VALUES (1542, '铁力市', 179, 3);
INSERT INTO `area` VALUES (1543, '嘉荫县', 179, 3);
INSERT INTO `area` VALUES (1544, '江岸区', 180, 3);
INSERT INTO `area` VALUES (1545, '武昌区', 180, 3);
INSERT INTO `area` VALUES (1546, '江汉区', 180, 3);
INSERT INTO `area` VALUES (1547, '硚口区', 180, 3);
INSERT INTO `area` VALUES (1548, '汉阳区', 180, 3);
INSERT INTO `area` VALUES (1549, '青山区', 180, 3);
INSERT INTO `area` VALUES (1550, '洪山区', 180, 3);
INSERT INTO `area` VALUES (1551, '东西湖区', 180, 3);
INSERT INTO `area` VALUES (1552, '汉南区', 180, 3);
INSERT INTO `area` VALUES (1553, '蔡甸区', 180, 3);
INSERT INTO `area` VALUES (1554, '江夏区', 180, 3);
INSERT INTO `area` VALUES (1555, '黄陂区', 180, 3);
INSERT INTO `area` VALUES (1556, '新洲区', 180, 3);
INSERT INTO `area` VALUES (1557, '经济开发区', 180, 3);
INSERT INTO `area` VALUES (1558, '仙桃市', 181, 3);
INSERT INTO `area` VALUES (1559, '鄂城区', 182, 3);
INSERT INTO `area` VALUES (1560, '华容区', 182, 3);
INSERT INTO `area` VALUES (1561, '梁子湖区', 182, 3);
INSERT INTO `area` VALUES (1562, '黄州区', 183, 3);
INSERT INTO `area` VALUES (1563, '麻城市', 183, 3);
INSERT INTO `area` VALUES (1564, '武穴市', 183, 3);
INSERT INTO `area` VALUES (1565, '团风县', 183, 3);
INSERT INTO `area` VALUES (1566, '红安县', 183, 3);
INSERT INTO `area` VALUES (1567, '罗田县', 183, 3);
INSERT INTO `area` VALUES (1568, '英山县', 183, 3);
INSERT INTO `area` VALUES (1569, '浠水县', 183, 3);
INSERT INTO `area` VALUES (1570, '蕲春县', 183, 3);
INSERT INTO `area` VALUES (1571, '黄梅县', 183, 3);
INSERT INTO `area` VALUES (1572, '黄石港区', 184, 3);
INSERT INTO `area` VALUES (1573, '西塞山区', 184, 3);
INSERT INTO `area` VALUES (1574, '下陆区', 184, 3);
INSERT INTO `area` VALUES (1575, '铁山区', 184, 3);
INSERT INTO `area` VALUES (1576, '大冶市', 184, 3);
INSERT INTO `area` VALUES (1577, '阳新县', 184, 3);
INSERT INTO `area` VALUES (1578, '东宝区', 185, 3);
INSERT INTO `area` VALUES (1579, '掇刀区', 185, 3);
INSERT INTO `area` VALUES (1580, '钟祥市', 185, 3);
INSERT INTO `area` VALUES (1581, '京山县', 185, 3);
INSERT INTO `area` VALUES (1582, '沙洋县', 185, 3);
INSERT INTO `area` VALUES (1583, '沙市区', 186, 3);
INSERT INTO `area` VALUES (1584, '荆州区', 186, 3);
INSERT INTO `area` VALUES (1585, '石首市', 186, 3);
INSERT INTO `area` VALUES (1586, '洪湖市', 186, 3);
INSERT INTO `area` VALUES (1587, '松滋市', 186, 3);
INSERT INTO `area` VALUES (1588, '公安县', 186, 3);
INSERT INTO `area` VALUES (1589, '监利县', 186, 3);
INSERT INTO `area` VALUES (1590, '江陵县', 186, 3);
INSERT INTO `area` VALUES (1591, '潜江市', 187, 3);
INSERT INTO `area` VALUES (1592, '神农架林区', 188, 3);
INSERT INTO `area` VALUES (1593, '张湾区', 189, 3);
INSERT INTO `area` VALUES (1594, '茅箭区', 189, 3);
INSERT INTO `area` VALUES (1595, '丹江口市', 189, 3);
INSERT INTO `area` VALUES (1596, '郧县', 189, 3);
INSERT INTO `area` VALUES (1597, '郧西县', 189, 3);
INSERT INTO `area` VALUES (1598, '竹山县', 189, 3);
INSERT INTO `area` VALUES (1599, '竹溪县', 189, 3);
INSERT INTO `area` VALUES (1600, '房县', 189, 3);
INSERT INTO `area` VALUES (1601, '曾都区', 190, 3);
INSERT INTO `area` VALUES (1602, '广水市', 190, 3);
INSERT INTO `area` VALUES (1603, '天门市', 191, 3);
INSERT INTO `area` VALUES (1604, '咸安区', 192, 3);
INSERT INTO `area` VALUES (1605, '赤壁市', 192, 3);
INSERT INTO `area` VALUES (1606, '嘉鱼县', 192, 3);
INSERT INTO `area` VALUES (1607, '通城县', 192, 3);
INSERT INTO `area` VALUES (1608, '崇阳县', 192, 3);
INSERT INTO `area` VALUES (1609, '通山县', 192, 3);
INSERT INTO `area` VALUES (1610, '襄城区', 193, 3);
INSERT INTO `area` VALUES (1611, '樊城区', 193, 3);
INSERT INTO `area` VALUES (1612, '襄阳区', 193, 3);
INSERT INTO `area` VALUES (1613, '老河口市', 193, 3);
INSERT INTO `area` VALUES (1614, '枣阳市', 193, 3);
INSERT INTO `area` VALUES (1615, '宜城市', 193, 3);
INSERT INTO `area` VALUES (1616, '南漳县', 193, 3);
INSERT INTO `area` VALUES (1617, '谷城县', 193, 3);
INSERT INTO `area` VALUES (1618, '保康县', 193, 3);
INSERT INTO `area` VALUES (1619, '孝南区', 194, 3);
INSERT INTO `area` VALUES (1620, '应城市', 194, 3);
INSERT INTO `area` VALUES (1621, '安陆市', 194, 3);
INSERT INTO `area` VALUES (1622, '汉川市', 194, 3);
INSERT INTO `area` VALUES (1623, '孝昌县', 194, 3);
INSERT INTO `area` VALUES (1624, '大悟县', 194, 3);
INSERT INTO `area` VALUES (1625, '云梦县', 194, 3);
INSERT INTO `area` VALUES (1626, '长阳', 195, 3);
INSERT INTO `area` VALUES (1627, '五峰', 195, 3);
INSERT INTO `area` VALUES (1628, '西陵区', 195, 3);
INSERT INTO `area` VALUES (1629, '伍家岗区', 195, 3);
INSERT INTO `area` VALUES (1630, '点军区', 195, 3);
INSERT INTO `area` VALUES (1631, '猇亭区', 195, 3);
INSERT INTO `area` VALUES (1632, '夷陵区', 195, 3);
INSERT INTO `area` VALUES (1633, '宜都市', 195, 3);
INSERT INTO `area` VALUES (1634, '当阳市', 195, 3);
INSERT INTO `area` VALUES (1635, '枝江市', 195, 3);
INSERT INTO `area` VALUES (1636, '远安县', 195, 3);
INSERT INTO `area` VALUES (1637, '兴山县', 195, 3);
INSERT INTO `area` VALUES (1638, '秭归县', 195, 3);
INSERT INTO `area` VALUES (1639, '恩施市', 196, 3);
INSERT INTO `area` VALUES (1640, '利川市', 196, 3);
INSERT INTO `area` VALUES (1641, '建始县', 196, 3);
INSERT INTO `area` VALUES (1642, '巴东县', 196, 3);
INSERT INTO `area` VALUES (1643, '宣恩县', 196, 3);
INSERT INTO `area` VALUES (1644, '咸丰县', 196, 3);
INSERT INTO `area` VALUES (1645, '来凤县', 196, 3);
INSERT INTO `area` VALUES (1646, '鹤峰县', 196, 3);
INSERT INTO `area` VALUES (1647, '岳麓区', 197, 3);
INSERT INTO `area` VALUES (1648, '芙蓉区', 197, 3);
INSERT INTO `area` VALUES (1649, '天心区', 197, 3);
INSERT INTO `area` VALUES (1650, '开福区', 197, 3);
INSERT INTO `area` VALUES (1651, '雨花区', 197, 3);
INSERT INTO `area` VALUES (1652, '开发区', 197, 3);
INSERT INTO `area` VALUES (1653, '浏阳市', 197, 3);
INSERT INTO `area` VALUES (1654, '长沙县', 197, 3);
INSERT INTO `area` VALUES (1655, '望城县', 197, 3);
INSERT INTO `area` VALUES (1656, '宁乡县', 197, 3);
INSERT INTO `area` VALUES (1657, '永定区', 198, 3);
INSERT INTO `area` VALUES (1658, '武陵源区', 198, 3);
INSERT INTO `area` VALUES (1659, '慈利县', 198, 3);
INSERT INTO `area` VALUES (1660, '桑植县', 198, 3);
INSERT INTO `area` VALUES (1661, '武陵区', 199, 3);
INSERT INTO `area` VALUES (1662, '鼎城区', 199, 3);
INSERT INTO `area` VALUES (1663, '津市市', 199, 3);
INSERT INTO `area` VALUES (1664, '安乡县', 199, 3);
INSERT INTO `area` VALUES (1665, '汉寿县', 199, 3);
INSERT INTO `area` VALUES (1666, '澧县', 199, 3);
INSERT INTO `area` VALUES (1667, '临澧县', 199, 3);
INSERT INTO `area` VALUES (1668, '桃源县', 199, 3);
INSERT INTO `area` VALUES (1669, '石门县', 199, 3);
INSERT INTO `area` VALUES (1670, '北湖区', 200, 3);
INSERT INTO `area` VALUES (1671, '苏仙区', 200, 3);
INSERT INTO `area` VALUES (1672, '资兴市', 200, 3);
INSERT INTO `area` VALUES (1673, '桂阳县', 200, 3);
INSERT INTO `area` VALUES (1674, '宜章县', 200, 3);
INSERT INTO `area` VALUES (1675, '永兴县', 200, 3);
INSERT INTO `area` VALUES (1676, '嘉禾县', 200, 3);
INSERT INTO `area` VALUES (1677, '临武县', 200, 3);
INSERT INTO `area` VALUES (1678, '汝城县', 200, 3);
INSERT INTO `area` VALUES (1679, '桂东县', 200, 3);
INSERT INTO `area` VALUES (1680, '安仁县', 200, 3);
INSERT INTO `area` VALUES (1681, '雁峰区', 201, 3);
INSERT INTO `area` VALUES (1682, '珠晖区', 201, 3);
INSERT INTO `area` VALUES (1683, '石鼓区', 201, 3);
INSERT INTO `area` VALUES (1684, '蒸湘区', 201, 3);
INSERT INTO `area` VALUES (1685, '南岳区', 201, 3);
INSERT INTO `area` VALUES (1686, '耒阳市', 201, 3);
INSERT INTO `area` VALUES (1687, '常宁市', 201, 3);
INSERT INTO `area` VALUES (1688, '衡阳县', 201, 3);
INSERT INTO `area` VALUES (1689, '衡南县', 201, 3);
INSERT INTO `area` VALUES (1690, '衡山县', 201, 3);
INSERT INTO `area` VALUES (1691, '衡东县', 201, 3);
INSERT INTO `area` VALUES (1692, '祁东县', 201, 3);
INSERT INTO `area` VALUES (1693, '鹤城区', 202, 3);
INSERT INTO `area` VALUES (1694, '靖州', 202, 3);
INSERT INTO `area` VALUES (1695, '麻阳', 202, 3);
INSERT INTO `area` VALUES (1696, '通道', 202, 3);
INSERT INTO `area` VALUES (1697, '新晃', 202, 3);
INSERT INTO `area` VALUES (1698, '芷江', 202, 3);
INSERT INTO `area` VALUES (1699, '沅陵县', 202, 3);
INSERT INTO `area` VALUES (1700, '辰溪县', 202, 3);
INSERT INTO `area` VALUES (1701, '溆浦县', 202, 3);
INSERT INTO `area` VALUES (1702, '中方县', 202, 3);
INSERT INTO `area` VALUES (1703, '会同县', 202, 3);
INSERT INTO `area` VALUES (1704, '洪江市', 202, 3);
INSERT INTO `area` VALUES (1705, '娄星区', 203, 3);
INSERT INTO `area` VALUES (1706, '冷水江市', 203, 3);
INSERT INTO `area` VALUES (1707, '涟源市', 203, 3);
INSERT INTO `area` VALUES (1708, '双峰县', 203, 3);
INSERT INTO `area` VALUES (1709, '新化县', 203, 3);
INSERT INTO `area` VALUES (1710, '城步', 204, 3);
INSERT INTO `area` VALUES (1711, '双清区', 204, 3);
INSERT INTO `area` VALUES (1712, '大祥区', 204, 3);
INSERT INTO `area` VALUES (1713, '北塔区', 204, 3);
INSERT INTO `area` VALUES (1714, '武冈市', 204, 3);
INSERT INTO `area` VALUES (1715, '邵东县', 204, 3);
INSERT INTO `area` VALUES (1716, '新邵县', 204, 3);
INSERT INTO `area` VALUES (1717, '邵阳县', 204, 3);
INSERT INTO `area` VALUES (1718, '隆回县', 204, 3);
INSERT INTO `area` VALUES (1719, '洞口县', 204, 3);
INSERT INTO `area` VALUES (1720, '绥宁县', 204, 3);
INSERT INTO `area` VALUES (1721, '新宁县', 204, 3);
INSERT INTO `area` VALUES (1722, '岳塘区', 205, 3);
INSERT INTO `area` VALUES (1723, '雨湖区', 205, 3);
INSERT INTO `area` VALUES (1724, '湘乡市', 205, 3);
INSERT INTO `area` VALUES (1725, '韶山市', 205, 3);
INSERT INTO `area` VALUES (1726, '湘潭县', 205, 3);
INSERT INTO `area` VALUES (1727, '吉首市', 206, 3);
INSERT INTO `area` VALUES (1728, '泸溪县', 206, 3);
INSERT INTO `area` VALUES (1729, '凤凰县', 206, 3);
INSERT INTO `area` VALUES (1730, '花垣县', 206, 3);
INSERT INTO `area` VALUES (1731, '保靖县', 206, 3);
INSERT INTO `area` VALUES (1732, '古丈县', 206, 3);
INSERT INTO `area` VALUES (1733, '永顺县', 206, 3);
INSERT INTO `area` VALUES (1734, '龙山县', 206, 3);
INSERT INTO `area` VALUES (1735, '赫山区', 207, 3);
INSERT INTO `area` VALUES (1736, '资阳区', 207, 3);
INSERT INTO `area` VALUES (1737, '沅江市', 207, 3);
INSERT INTO `area` VALUES (1738, '南县', 207, 3);
INSERT INTO `area` VALUES (1739, '桃江县', 207, 3);
INSERT INTO `area` VALUES (1740, '安化县', 207, 3);
INSERT INTO `area` VALUES (1741, '江华', 208, 3);
INSERT INTO `area` VALUES (1742, '冷水滩区', 208, 3);
INSERT INTO `area` VALUES (1743, '零陵区', 208, 3);
INSERT INTO `area` VALUES (1744, '祁阳县', 208, 3);
INSERT INTO `area` VALUES (1745, '东安县', 208, 3);
INSERT INTO `area` VALUES (1746, '双牌县', 208, 3);
INSERT INTO `area` VALUES (1747, '道县', 208, 3);
INSERT INTO `area` VALUES (1748, '江永县', 208, 3);
INSERT INTO `area` VALUES (1749, '宁远县', 208, 3);
INSERT INTO `area` VALUES (1750, '蓝山县', 208, 3);
INSERT INTO `area` VALUES (1751, '新田县', 208, 3);
INSERT INTO `area` VALUES (1752, '岳阳楼区', 209, 3);
INSERT INTO `area` VALUES (1753, '君山区', 209, 3);
INSERT INTO `area` VALUES (1754, '云溪区', 209, 3);
INSERT INTO `area` VALUES (1755, '汨罗市', 209, 3);
INSERT INTO `area` VALUES (1756, '临湘市', 209, 3);
INSERT INTO `area` VALUES (1757, '岳阳县', 209, 3);
INSERT INTO `area` VALUES (1758, '华容县', 209, 3);
INSERT INTO `area` VALUES (1759, '湘阴县', 209, 3);
INSERT INTO `area` VALUES (1760, '平江县', 209, 3);
INSERT INTO `area` VALUES (1761, '天元区', 210, 3);
INSERT INTO `area` VALUES (1762, '荷塘区', 210, 3);
INSERT INTO `area` VALUES (1763, '芦淞区', 210, 3);
INSERT INTO `area` VALUES (1764, '石峰区', 210, 3);
INSERT INTO `area` VALUES (1765, '醴陵市', 210, 3);
INSERT INTO `area` VALUES (1766, '株洲县', 210, 3);
INSERT INTO `area` VALUES (1767, '攸县', 210, 3);
INSERT INTO `area` VALUES (1768, '茶陵县', 210, 3);
INSERT INTO `area` VALUES (1769, '炎陵县', 210, 3);
INSERT INTO `area` VALUES (1770, '朝阳区', 211, 3);
INSERT INTO `area` VALUES (1771, '宽城区', 211, 3);
INSERT INTO `area` VALUES (1772, '二道区', 211, 3);
INSERT INTO `area` VALUES (1773, '南关区', 211, 3);
INSERT INTO `area` VALUES (1774, '绿园区', 211, 3);
INSERT INTO `area` VALUES (1775, '双阳区', 211, 3);
INSERT INTO `area` VALUES (1776, '净月潭开发区', 211, 3);
INSERT INTO `area` VALUES (1777, '高新技术开发区', 211, 3);
INSERT INTO `area` VALUES (1778, '经济技术开发区', 211, 3);
INSERT INTO `area` VALUES (1779, '汽车产业开发区', 211, 3);
INSERT INTO `area` VALUES (1780, '德惠市', 211, 3);
INSERT INTO `area` VALUES (1781, '九台市', 211, 3);
INSERT INTO `area` VALUES (1782, '榆树市', 211, 3);
INSERT INTO `area` VALUES (1783, '农安县', 211, 3);
INSERT INTO `area` VALUES (1784, '船营区', 212, 3);
INSERT INTO `area` VALUES (1785, '昌邑区', 212, 3);
INSERT INTO `area` VALUES (1786, '龙潭区', 212, 3);
INSERT INTO `area` VALUES (1787, '丰满区', 212, 3);
INSERT INTO `area` VALUES (1788, '蛟河市', 212, 3);
INSERT INTO `area` VALUES (1789, '桦甸市', 212, 3);
INSERT INTO `area` VALUES (1790, '舒兰市', 212, 3);
INSERT INTO `area` VALUES (1791, '磐石市', 212, 3);
INSERT INTO `area` VALUES (1792, '永吉县', 212, 3);
INSERT INTO `area` VALUES (1793, '洮北区', 213, 3);
INSERT INTO `area` VALUES (1794, '洮南市', 213, 3);
INSERT INTO `area` VALUES (1795, '大安市', 213, 3);
INSERT INTO `area` VALUES (1796, '镇赉县', 213, 3);
INSERT INTO `area` VALUES (1797, '通榆县', 213, 3);
INSERT INTO `area` VALUES (1798, '江源区', 214, 3);
INSERT INTO `area` VALUES (1799, '八道江区', 214, 3);
INSERT INTO `area` VALUES (1800, '长白', 214, 3);
INSERT INTO `area` VALUES (1801, '临江市', 214, 3);
INSERT INTO `area` VALUES (1802, '抚松县', 214, 3);
INSERT INTO `area` VALUES (1803, '靖宇县', 214, 3);
INSERT INTO `area` VALUES (1804, '龙山区', 215, 3);
INSERT INTO `area` VALUES (1805, '西安区', 215, 3);
INSERT INTO `area` VALUES (1806, '东丰县', 215, 3);
INSERT INTO `area` VALUES (1807, '东辽县', 215, 3);
INSERT INTO `area` VALUES (1808, '铁西区', 216, 3);
INSERT INTO `area` VALUES (1809, '铁东区', 216, 3);
INSERT INTO `area` VALUES (1810, '伊通', 216, 3);
INSERT INTO `area` VALUES (1811, '公主岭市', 216, 3);
INSERT INTO `area` VALUES (1812, '双辽市', 216, 3);
INSERT INTO `area` VALUES (1813, '梨树县', 216, 3);
INSERT INTO `area` VALUES (1814, '前郭尔罗斯', 217, 3);
INSERT INTO `area` VALUES (1815, '宁江区', 217, 3);
INSERT INTO `area` VALUES (1816, '长岭县', 217, 3);
INSERT INTO `area` VALUES (1817, '乾安县', 217, 3);
INSERT INTO `area` VALUES (1818, '扶余县', 217, 3);
INSERT INTO `area` VALUES (1819, '东昌区', 218, 3);
INSERT INTO `area` VALUES (1820, '二道江区', 218, 3);
INSERT INTO `area` VALUES (1821, '梅河口市', 218, 3);
INSERT INTO `area` VALUES (1822, '集安市', 218, 3);
INSERT INTO `area` VALUES (1823, '通化县', 218, 3);
INSERT INTO `area` VALUES (1824, '辉南县', 218, 3);
INSERT INTO `area` VALUES (1825, '柳河县', 218, 3);
INSERT INTO `area` VALUES (1826, '延吉市', 219, 3);
INSERT INTO `area` VALUES (1827, '图们市', 219, 3);
INSERT INTO `area` VALUES (1828, '敦化市', 219, 3);
INSERT INTO `area` VALUES (1829, '珲春市', 219, 3);
INSERT INTO `area` VALUES (1830, '龙井市', 219, 3);
INSERT INTO `area` VALUES (1831, '和龙市', 219, 3);
INSERT INTO `area` VALUES (1832, '安图县', 219, 3);
INSERT INTO `area` VALUES (1833, '汪清县', 219, 3);
INSERT INTO `area` VALUES (1834, '玄武区', 220, 3);
INSERT INTO `area` VALUES (1835, '鼓楼区', 220, 3);
INSERT INTO `area` VALUES (1836, '白下区', 220, 3);
INSERT INTO `area` VALUES (1837, '建邺区', 220, 3);
INSERT INTO `area` VALUES (1838, '秦淮区', 220, 3);
INSERT INTO `area` VALUES (1839, '雨花台区', 220, 3);
INSERT INTO `area` VALUES (1840, '下关区', 220, 3);
INSERT INTO `area` VALUES (1841, '栖霞区', 220, 3);
INSERT INTO `area` VALUES (1842, '浦口区', 220, 3);
INSERT INTO `area` VALUES (1843, '江宁区', 220, 3);
INSERT INTO `area` VALUES (1844, '六合区', 220, 3);
INSERT INTO `area` VALUES (1845, '溧水县', 220, 3);
INSERT INTO `area` VALUES (1846, '高淳县', 220, 3);
INSERT INTO `area` VALUES (1847, '沧浪区', 221, 3);
INSERT INTO `area` VALUES (1848, '金阊区', 221, 3);
INSERT INTO `area` VALUES (1849, '平江区', 221, 3);
INSERT INTO `area` VALUES (1850, '虎丘区', 221, 3);
INSERT INTO `area` VALUES (1851, '吴中区', 221, 3);
INSERT INTO `area` VALUES (1852, '相城区', 221, 3);
INSERT INTO `area` VALUES (1853, '园区', 221, 3);
INSERT INTO `area` VALUES (1854, '新区', 221, 3);
INSERT INTO `area` VALUES (1855, '常熟市', 221, 3);
INSERT INTO `area` VALUES (1856, '张家港市', 221, 3);
INSERT INTO `area` VALUES (1857, '玉山镇', 221, 3);
INSERT INTO `area` VALUES (1858, '巴城镇', 221, 3);
INSERT INTO `area` VALUES (1859, '周市镇', 221, 3);
INSERT INTO `area` VALUES (1860, '陆家镇', 221, 3);
INSERT INTO `area` VALUES (1861, '花桥镇', 221, 3);
INSERT INTO `area` VALUES (1862, '淀山湖镇', 221, 3);
INSERT INTO `area` VALUES (1863, '张浦镇', 221, 3);
INSERT INTO `area` VALUES (1864, '周庄镇', 221, 3);
INSERT INTO `area` VALUES (1865, '千灯镇', 221, 3);
INSERT INTO `area` VALUES (1866, '锦溪镇', 221, 3);
INSERT INTO `area` VALUES (1867, '开发区', 221, 3);
INSERT INTO `area` VALUES (1868, '吴江市', 221, 3);
INSERT INTO `area` VALUES (1869, '太仓市', 221, 3);
INSERT INTO `area` VALUES (1870, '崇安区', 222, 3);
INSERT INTO `area` VALUES (1871, '北塘区', 222, 3);
INSERT INTO `area` VALUES (1872, '南长区', 222, 3);
INSERT INTO `area` VALUES (1873, '锡山区', 222, 3);
INSERT INTO `area` VALUES (1874, '惠山区', 222, 3);
INSERT INTO `area` VALUES (1875, '滨湖区', 222, 3);
INSERT INTO `area` VALUES (1876, '新区', 222, 3);
INSERT INTO `area` VALUES (1877, '江阴市', 222, 3);
INSERT INTO `area` VALUES (1878, '宜兴市', 222, 3);
INSERT INTO `area` VALUES (1879, '天宁区', 223, 3);
INSERT INTO `area` VALUES (1880, '钟楼区', 223, 3);
INSERT INTO `area` VALUES (1881, '戚墅堰区', 223, 3);
INSERT INTO `area` VALUES (1882, '郊区', 223, 3);
INSERT INTO `area` VALUES (1883, '新北区', 223, 3);
INSERT INTO `area` VALUES (1884, '武进区', 223, 3);
INSERT INTO `area` VALUES (1885, '溧阳市', 223, 3);
INSERT INTO `area` VALUES (1886, '金坛市', 223, 3);
INSERT INTO `area` VALUES (1887, '清河区', 224, 3);
INSERT INTO `area` VALUES (1888, '清浦区', 224, 3);
INSERT INTO `area` VALUES (1889, '楚州区', 224, 3);
INSERT INTO `area` VALUES (1890, '淮阴区', 224, 3);
INSERT INTO `area` VALUES (1891, '涟水县', 224, 3);
INSERT INTO `area` VALUES (1892, '洪泽县', 224, 3);
INSERT INTO `area` VALUES (1893, '盱眙县', 224, 3);
INSERT INTO `area` VALUES (1894, '金湖县', 224, 3);
INSERT INTO `area` VALUES (1895, '新浦区', 225, 3);
INSERT INTO `area` VALUES (1896, '连云区', 225, 3);
INSERT INTO `area` VALUES (1897, '海州区', 225, 3);
INSERT INTO `area` VALUES (1898, '赣榆县', 225, 3);
INSERT INTO `area` VALUES (1899, '东海县', 225, 3);
INSERT INTO `area` VALUES (1900, '灌云县', 225, 3);
INSERT INTO `area` VALUES (1901, '灌南县', 225, 3);
INSERT INTO `area` VALUES (1902, '崇川区', 226, 3);
INSERT INTO `area` VALUES (1903, '港闸区', 226, 3);
INSERT INTO `area` VALUES (1904, '经济开发区', 226, 3);
INSERT INTO `area` VALUES (1905, '启东市', 226, 3);
INSERT INTO `area` VALUES (1906, '如皋市', 226, 3);
INSERT INTO `area` VALUES (1907, '通州市', 226, 3);
INSERT INTO `area` VALUES (1908, '海门市', 226, 3);
INSERT INTO `area` VALUES (1909, '海安县', 226, 3);
INSERT INTO `area` VALUES (1910, '如东县', 226, 3);
INSERT INTO `area` VALUES (1911, '宿城区', 227, 3);
INSERT INTO `area` VALUES (1912, '宿豫区', 227, 3);
INSERT INTO `area` VALUES (1913, '宿豫县', 227, 3);
INSERT INTO `area` VALUES (1914, '沭阳县', 227, 3);
INSERT INTO `area` VALUES (1915, '泗阳县', 227, 3);
INSERT INTO `area` VALUES (1916, '泗洪县', 227, 3);
INSERT INTO `area` VALUES (1917, '海陵区', 228, 3);
INSERT INTO `area` VALUES (1918, '高港区', 228, 3);
INSERT INTO `area` VALUES (1919, '兴化市', 228, 3);
INSERT INTO `area` VALUES (1920, '靖江市', 228, 3);
INSERT INTO `area` VALUES (1921, '泰兴市', 228, 3);
INSERT INTO `area` VALUES (1922, '姜堰市', 228, 3);
INSERT INTO `area` VALUES (1923, '云龙区', 229, 3);
INSERT INTO `area` VALUES (1924, '鼓楼区', 229, 3);
INSERT INTO `area` VALUES (1925, '九里区', 229, 3);
INSERT INTO `area` VALUES (1926, '贾汪区', 229, 3);
INSERT INTO `area` VALUES (1927, '泉山区', 229, 3);
INSERT INTO `area` VALUES (1928, '新沂市', 229, 3);
INSERT INTO `area` VALUES (1929, '邳州市', 229, 3);
INSERT INTO `area` VALUES (1930, '丰县', 229, 3);
INSERT INTO `area` VALUES (1931, '沛县', 229, 3);
INSERT INTO `area` VALUES (1932, '铜山县', 229, 3);
INSERT INTO `area` VALUES (1933, '睢宁县', 229, 3);
INSERT INTO `area` VALUES (1934, '城区', 230, 3);
INSERT INTO `area` VALUES (1935, '亭湖区', 230, 3);
INSERT INTO `area` VALUES (1936, '盐都区', 230, 3);
INSERT INTO `area` VALUES (1937, '盐都县', 230, 3);
INSERT INTO `area` VALUES (1938, '东台市', 230, 3);
INSERT INTO `area` VALUES (1939, '大丰市', 230, 3);
INSERT INTO `area` VALUES (1940, '响水县', 230, 3);
INSERT INTO `area` VALUES (1941, '滨海县', 230, 3);
INSERT INTO `area` VALUES (1942, '阜宁县', 230, 3);
INSERT INTO `area` VALUES (1943, '射阳县', 230, 3);
INSERT INTO `area` VALUES (1944, '建湖县', 230, 3);
INSERT INTO `area` VALUES (1945, '广陵区', 231, 3);
INSERT INTO `area` VALUES (1946, '维扬区', 231, 3);
INSERT INTO `area` VALUES (1947, '邗江区', 231, 3);
INSERT INTO `area` VALUES (1948, '仪征市', 231, 3);
INSERT INTO `area` VALUES (1949, '高邮市', 231, 3);
INSERT INTO `area` VALUES (1950, '江都市', 231, 3);
INSERT INTO `area` VALUES (1951, '宝应县', 231, 3);
INSERT INTO `area` VALUES (1952, '京口区', 232, 3);
INSERT INTO `area` VALUES (1953, '润州区', 232, 3);
INSERT INTO `area` VALUES (1954, '丹徒区', 232, 3);
INSERT INTO `area` VALUES (1955, '丹阳市', 232, 3);
INSERT INTO `area` VALUES (1956, '扬中市', 232, 3);
INSERT INTO `area` VALUES (1957, '句容市', 232, 3);
INSERT INTO `area` VALUES (1958, '东湖区', 233, 3);
INSERT INTO `area` VALUES (1959, '西湖区', 233, 3);
INSERT INTO `area` VALUES (1960, '青云谱区', 233, 3);
INSERT INTO `area` VALUES (1961, '湾里区', 233, 3);
INSERT INTO `area` VALUES (1962, '青山湖区', 233, 3);
INSERT INTO `area` VALUES (1963, '红谷滩新区', 233, 3);
INSERT INTO `area` VALUES (1964, '昌北区', 233, 3);
INSERT INTO `area` VALUES (1965, '高新区', 233, 3);
INSERT INTO `area` VALUES (1966, '南昌县', 233, 3);
INSERT INTO `area` VALUES (1967, '新建县', 233, 3);
INSERT INTO `area` VALUES (1968, '安义县', 233, 3);
INSERT INTO `area` VALUES (1969, '进贤县', 233, 3);
INSERT INTO `area` VALUES (1970, '临川区', 234, 3);
INSERT INTO `area` VALUES (1971, '南城县', 234, 3);
INSERT INTO `area` VALUES (1972, '黎川县', 234, 3);
INSERT INTO `area` VALUES (1973, '南丰县', 234, 3);
INSERT INTO `area` VALUES (1974, '崇仁县', 234, 3);
INSERT INTO `area` VALUES (1975, '乐安县', 234, 3);
INSERT INTO `area` VALUES (1976, '宜黄县', 234, 3);
INSERT INTO `area` VALUES (1977, '金溪县', 234, 3);
INSERT INTO `area` VALUES (1978, '资溪县', 234, 3);
INSERT INTO `area` VALUES (1979, '东乡县', 234, 3);
INSERT INTO `area` VALUES (1980, '广昌县', 234, 3);
INSERT INTO `area` VALUES (1981, '章贡区', 235, 3);
INSERT INTO `area` VALUES (1982, '于都县', 235, 3);
INSERT INTO `area` VALUES (1983, '瑞金市', 235, 3);
INSERT INTO `area` VALUES (1984, '南康市', 235, 3);
INSERT INTO `area` VALUES (1985, '赣县', 235, 3);
INSERT INTO `area` VALUES (1986, '信丰县', 235, 3);
INSERT INTO `area` VALUES (1987, '大余县', 235, 3);
INSERT INTO `area` VALUES (1988, '上犹县', 235, 3);
INSERT INTO `area` VALUES (1989, '崇义县', 235, 3);
INSERT INTO `area` VALUES (1990, '安远县', 235, 3);
INSERT INTO `area` VALUES (1991, '龙南县', 235, 3);
INSERT INTO `area` VALUES (1992, '定南县', 235, 3);
INSERT INTO `area` VALUES (1993, '全南县', 235, 3);
INSERT INTO `area` VALUES (1994, '宁都县', 235, 3);
INSERT INTO `area` VALUES (1995, '兴国县', 235, 3);
INSERT INTO `area` VALUES (1996, '会昌县', 235, 3);
INSERT INTO `area` VALUES (1997, '寻乌县', 235, 3);
INSERT INTO `area` VALUES (1998, '石城县', 235, 3);
INSERT INTO `area` VALUES (1999, '安福县', 236, 3);
INSERT INTO `area` VALUES (2000, '吉州区', 236, 3);
INSERT INTO `area` VALUES (2001, '青原区', 236, 3);
INSERT INTO `area` VALUES (2002, '井冈山市', 236, 3);
INSERT INTO `area` VALUES (2003, '吉安县', 236, 3);
INSERT INTO `area` VALUES (2004, '吉水县', 236, 3);
INSERT INTO `area` VALUES (2005, '峡江县', 236, 3);
INSERT INTO `area` VALUES (2006, '新干县', 236, 3);
INSERT INTO `area` VALUES (2007, '永丰县', 236, 3);
INSERT INTO `area` VALUES (2008, '泰和县', 236, 3);
INSERT INTO `area` VALUES (2009, '遂川县', 236, 3);
INSERT INTO `area` VALUES (2010, '万安县', 236, 3);
INSERT INTO `area` VALUES (2011, '永新县', 236, 3);
INSERT INTO `area` VALUES (2012, '珠山区', 237, 3);
INSERT INTO `area` VALUES (2013, '昌江区', 237, 3);
INSERT INTO `area` VALUES (2014, '乐平市', 237, 3);
INSERT INTO `area` VALUES (2015, '浮梁县', 237, 3);
INSERT INTO `area` VALUES (2016, '浔阳区', 238, 3);
INSERT INTO `area` VALUES (2017, '庐山区', 238, 3);
INSERT INTO `area` VALUES (2018, '瑞昌市', 238, 3);
INSERT INTO `area` VALUES (2019, '九江县', 238, 3);
INSERT INTO `area` VALUES (2020, '武宁县', 238, 3);
INSERT INTO `area` VALUES (2021, '修水县', 238, 3);
INSERT INTO `area` VALUES (2022, '永修县', 238, 3);
INSERT INTO `area` VALUES (2023, '德安县', 238, 3);
INSERT INTO `area` VALUES (2024, '星子县', 238, 3);
INSERT INTO `area` VALUES (2025, '都昌县', 238, 3);
INSERT INTO `area` VALUES (2026, '湖口县', 238, 3);
INSERT INTO `area` VALUES (2027, '彭泽县', 238, 3);
INSERT INTO `area` VALUES (2028, '安源区', 239, 3);
INSERT INTO `area` VALUES (2029, '湘东区', 239, 3);
INSERT INTO `area` VALUES (2030, '莲花县', 239, 3);
INSERT INTO `area` VALUES (2031, '芦溪县', 239, 3);
INSERT INTO `area` VALUES (2032, '上栗县', 239, 3);
INSERT INTO `area` VALUES (2033, '信州区', 240, 3);
INSERT INTO `area` VALUES (2034, '德兴市', 240, 3);
INSERT INTO `area` VALUES (2035, '上饶县', 240, 3);
INSERT INTO `area` VALUES (2036, '广丰县', 240, 3);
INSERT INTO `area` VALUES (2037, '玉山县', 240, 3);
INSERT INTO `area` VALUES (2038, '铅山县', 240, 3);
INSERT INTO `area` VALUES (2039, '横峰县', 240, 3);
INSERT INTO `area` VALUES (2040, '弋阳县', 240, 3);
INSERT INTO `area` VALUES (2041, '余干县', 240, 3);
INSERT INTO `area` VALUES (2042, '波阳县', 240, 3);
INSERT INTO `area` VALUES (2043, '万年县', 240, 3);
INSERT INTO `area` VALUES (2044, '婺源县', 240, 3);
INSERT INTO `area` VALUES (2045, '渝水区', 241, 3);
INSERT INTO `area` VALUES (2046, '分宜县', 241, 3);
INSERT INTO `area` VALUES (2047, '袁州区', 242, 3);
INSERT INTO `area` VALUES (2048, '丰城市', 242, 3);
INSERT INTO `area` VALUES (2049, '樟树市', 242, 3);
INSERT INTO `area` VALUES (2050, '高安市', 242, 3);
INSERT INTO `area` VALUES (2051, '奉新县', 242, 3);
INSERT INTO `area` VALUES (2052, '万载县', 242, 3);
INSERT INTO `area` VALUES (2053, '上高县', 242, 3);
INSERT INTO `area` VALUES (2054, '宜丰县', 242, 3);
INSERT INTO `area` VALUES (2055, '靖安县', 242, 3);
INSERT INTO `area` VALUES (2056, '铜鼓县', 242, 3);
INSERT INTO `area` VALUES (2057, '月湖区', 243, 3);
INSERT INTO `area` VALUES (2058, '贵溪市', 243, 3);
INSERT INTO `area` VALUES (2059, '余江县', 243, 3);
INSERT INTO `area` VALUES (2060, '沈河区', 244, 3);
INSERT INTO `area` VALUES (2061, '皇姑区', 244, 3);
INSERT INTO `area` VALUES (2062, '和平区', 244, 3);
INSERT INTO `area` VALUES (2063, '大东区', 244, 3);
INSERT INTO `area` VALUES (2064, '铁西区', 244, 3);
INSERT INTO `area` VALUES (2065, '苏家屯区', 244, 3);
INSERT INTO `area` VALUES (2066, '东陵区', 244, 3);
INSERT INTO `area` VALUES (2067, '沈北新区', 244, 3);
INSERT INTO `area` VALUES (2068, '于洪区', 244, 3);
INSERT INTO `area` VALUES (2069, '浑南新区', 244, 3);
INSERT INTO `area` VALUES (2070, '新民市', 244, 3);
INSERT INTO `area` VALUES (2071, '辽中县', 244, 3);
INSERT INTO `area` VALUES (2072, '康平县', 244, 3);
INSERT INTO `area` VALUES (2073, '法库县', 244, 3);
INSERT INTO `area` VALUES (2074, '西岗区', 245, 3);
INSERT INTO `area` VALUES (2075, '中山区', 245, 3);
INSERT INTO `area` VALUES (2076, '沙河口区', 245, 3);
INSERT INTO `area` VALUES (2077, '甘井子区', 245, 3);
INSERT INTO `area` VALUES (2078, '旅顺口区', 245, 3);
INSERT INTO `area` VALUES (2079, '金州区', 245, 3);
INSERT INTO `area` VALUES (2080, '开发区', 245, 3);
INSERT INTO `area` VALUES (2081, '瓦房店市', 245, 3);
INSERT INTO `area` VALUES (2082, '普兰店市', 245, 3);
INSERT INTO `area` VALUES (2083, '庄河市', 245, 3);
INSERT INTO `area` VALUES (2084, '长海县', 245, 3);
INSERT INTO `area` VALUES (2085, '铁东区', 246, 3);
INSERT INTO `area` VALUES (2086, '铁西区', 246, 3);
INSERT INTO `area` VALUES (2087, '立山区', 246, 3);
INSERT INTO `area` VALUES (2088, '千山区', 246, 3);
INSERT INTO `area` VALUES (2089, '岫岩', 246, 3);
INSERT INTO `area` VALUES (2090, '海城市', 246, 3);
INSERT INTO `area` VALUES (2091, '台安县', 246, 3);
INSERT INTO `area` VALUES (2092, '本溪', 247, 3);
INSERT INTO `area` VALUES (2093, '平山区', 247, 3);
INSERT INTO `area` VALUES (2094, '明山区', 247, 3);
INSERT INTO `area` VALUES (2095, '溪湖区', 247, 3);
INSERT INTO `area` VALUES (2096, '南芬区', 247, 3);
INSERT INTO `area` VALUES (2097, '桓仁', 247, 3);
INSERT INTO `area` VALUES (2098, '双塔区', 248, 3);
INSERT INTO `area` VALUES (2099, '龙城区', 248, 3);
INSERT INTO `area` VALUES (2100, '喀喇沁左翼蒙古族自治县', 248, 3);
INSERT INTO `area` VALUES (2101, '北票市', 248, 3);
INSERT INTO `area` VALUES (2102, '凌源市', 248, 3);
INSERT INTO `area` VALUES (2103, '朝阳县', 248, 3);
INSERT INTO `area` VALUES (2104, '建平县', 248, 3);
INSERT INTO `area` VALUES (2105, '振兴区', 249, 3);
INSERT INTO `area` VALUES (2106, '元宝区', 249, 3);
INSERT INTO `area` VALUES (2107, '振安区', 249, 3);
INSERT INTO `area` VALUES (2108, '宽甸', 249, 3);
INSERT INTO `area` VALUES (2109, '东港市', 249, 3);
INSERT INTO `area` VALUES (2110, '凤城市', 249, 3);
INSERT INTO `area` VALUES (2111, '顺城区', 250, 3);
INSERT INTO `area` VALUES (2112, '新抚区', 250, 3);
INSERT INTO `area` VALUES (2113, '东洲区', 250, 3);
INSERT INTO `area` VALUES (2114, '望花区', 250, 3);
INSERT INTO `area` VALUES (2115, '清原', 250, 3);
INSERT INTO `area` VALUES (2116, '新宾', 250, 3);
INSERT INTO `area` VALUES (2117, '抚顺县', 250, 3);
INSERT INTO `area` VALUES (2118, '阜新', 251, 3);
INSERT INTO `area` VALUES (2119, '海州区', 251, 3);
INSERT INTO `area` VALUES (2120, '新邱区', 251, 3);
INSERT INTO `area` VALUES (2121, '太平区', 251, 3);
INSERT INTO `area` VALUES (2122, '清河门区', 251, 3);
INSERT INTO `area` VALUES (2123, '细河区', 251, 3);
INSERT INTO `area` VALUES (2124, '彰武县', 251, 3);
INSERT INTO `area` VALUES (2125, '龙港区', 252, 3);
INSERT INTO `area` VALUES (2126, '南票区', 252, 3);
INSERT INTO `area` VALUES (2127, '连山区', 252, 3);
INSERT INTO `area` VALUES (2128, '兴城市', 252, 3);
INSERT INTO `area` VALUES (2129, '绥中县', 252, 3);
INSERT INTO `area` VALUES (2130, '建昌县', 252, 3);
INSERT INTO `area` VALUES (2131, '太和区', 253, 3);
INSERT INTO `area` VALUES (2132, '古塔区', 253, 3);
INSERT INTO `area` VALUES (2133, '凌河区', 253, 3);
INSERT INTO `area` VALUES (2134, '凌海市', 253, 3);
INSERT INTO `area` VALUES (2135, '北镇市', 253, 3);
INSERT INTO `area` VALUES (2136, '黑山县', 253, 3);
INSERT INTO `area` VALUES (2137, '义县', 253, 3);
INSERT INTO `area` VALUES (2138, '白塔区', 254, 3);
INSERT INTO `area` VALUES (2139, '文圣区', 254, 3);
INSERT INTO `area` VALUES (2140, '宏伟区', 254, 3);
INSERT INTO `area` VALUES (2141, '太子河区', 254, 3);
INSERT INTO `area` VALUES (2142, '弓长岭区', 254, 3);
INSERT INTO `area` VALUES (2143, '灯塔市', 254, 3);
INSERT INTO `area` VALUES (2144, '辽阳县', 254, 3);
INSERT INTO `area` VALUES (2145, '双台子区', 255, 3);
INSERT INTO `area` VALUES (2146, '兴隆台区', 255, 3);
INSERT INTO `area` VALUES (2147, '大洼县', 255, 3);
INSERT INTO `area` VALUES (2148, '盘山县', 255, 3);
INSERT INTO `area` VALUES (2149, '银州区', 256, 3);
INSERT INTO `area` VALUES (2150, '清河区', 256, 3);
INSERT INTO `area` VALUES (2151, '调兵山市', 256, 3);
INSERT INTO `area` VALUES (2152, '开原市', 256, 3);
INSERT INTO `area` VALUES (2153, '铁岭县', 256, 3);
INSERT INTO `area` VALUES (2154, '西丰县', 256, 3);
INSERT INTO `area` VALUES (2155, '昌图县', 256, 3);
INSERT INTO `area` VALUES (2156, '站前区', 257, 3);
INSERT INTO `area` VALUES (2157, '西市区', 257, 3);
INSERT INTO `area` VALUES (2158, '鲅鱼圈区', 257, 3);
INSERT INTO `area` VALUES (2159, '老边区', 257, 3);
INSERT INTO `area` VALUES (2160, '盖州市', 257, 3);
INSERT INTO `area` VALUES (2161, '大石桥市', 257, 3);
INSERT INTO `area` VALUES (2162, '回民区', 258, 3);
INSERT INTO `area` VALUES (2163, '玉泉区', 258, 3);
INSERT INTO `area` VALUES (2164, '新城区', 258, 3);
INSERT INTO `area` VALUES (2165, '赛罕区', 258, 3);
INSERT INTO `area` VALUES (2166, '清水河县', 258, 3);
INSERT INTO `area` VALUES (2167, '土默特左旗', 258, 3);
INSERT INTO `area` VALUES (2168, '托克托县', 258, 3);
INSERT INTO `area` VALUES (2169, '和林格尔县', 258, 3);
INSERT INTO `area` VALUES (2170, '武川县', 258, 3);
INSERT INTO `area` VALUES (2171, '阿拉善左旗', 259, 3);
INSERT INTO `area` VALUES (2172, '阿拉善右旗', 259, 3);
INSERT INTO `area` VALUES (2173, '额济纳旗', 259, 3);
INSERT INTO `area` VALUES (2174, '临河区', 260, 3);
INSERT INTO `area` VALUES (2175, '五原县', 260, 3);
INSERT INTO `area` VALUES (2176, '磴口县', 260, 3);
INSERT INTO `area` VALUES (2177, '乌拉特前旗', 260, 3);
INSERT INTO `area` VALUES (2178, '乌拉特中旗', 260, 3);
INSERT INTO `area` VALUES (2179, '乌拉特后旗', 260, 3);
INSERT INTO `area` VALUES (2180, '杭锦后旗', 260, 3);
INSERT INTO `area` VALUES (2181, '昆都仑区', 261, 3);
INSERT INTO `area` VALUES (2182, '青山区', 261, 3);
INSERT INTO `area` VALUES (2183, '东河区', 261, 3);
INSERT INTO `area` VALUES (2184, '九原区', 261, 3);
INSERT INTO `area` VALUES (2185, '石拐区', 261, 3);
INSERT INTO `area` VALUES (2186, '白云矿区', 261, 3);
INSERT INTO `area` VALUES (2187, '土默特右旗', 261, 3);
INSERT INTO `area` VALUES (2188, '固阳县', 261, 3);
INSERT INTO `area` VALUES (2189, '达尔罕茂明安联合旗', 261, 3);
INSERT INTO `area` VALUES (2190, '红山区', 262, 3);
INSERT INTO `area` VALUES (2191, '元宝山区', 262, 3);
INSERT INTO `area` VALUES (2192, '松山区', 262, 3);
INSERT INTO `area` VALUES (2193, '阿鲁科尔沁旗', 262, 3);
INSERT INTO `area` VALUES (2194, '巴林左旗', 262, 3);
INSERT INTO `area` VALUES (2195, '巴林右旗', 262, 3);
INSERT INTO `area` VALUES (2196, '林西县', 262, 3);
INSERT INTO `area` VALUES (2197, '克什克腾旗', 262, 3);
INSERT INTO `area` VALUES (2198, '翁牛特旗', 262, 3);
INSERT INTO `area` VALUES (2199, '喀喇沁旗', 262, 3);
INSERT INTO `area` VALUES (2200, '宁城县', 262, 3);
INSERT INTO `area` VALUES (2201, '敖汉旗', 262, 3);
INSERT INTO `area` VALUES (2202, '东胜区', 263, 3);
INSERT INTO `area` VALUES (2203, '达拉特旗', 263, 3);
INSERT INTO `area` VALUES (2204, '准格尔旗', 263, 3);
INSERT INTO `area` VALUES (2205, '鄂托克前旗', 263, 3);
INSERT INTO `area` VALUES (2206, '鄂托克旗', 263, 3);
INSERT INTO `area` VALUES (2207, '杭锦旗', 263, 3);
INSERT INTO `area` VALUES (2208, '乌审旗', 263, 3);
INSERT INTO `area` VALUES (2209, '伊金霍洛旗', 263, 3);
INSERT INTO `area` VALUES (2210, '海拉尔区', 264, 3);
INSERT INTO `area` VALUES (2211, '莫力达瓦', 264, 3);
INSERT INTO `area` VALUES (2212, '满洲里市', 264, 3);
INSERT INTO `area` VALUES (2213, '牙克石市', 264, 3);
INSERT INTO `area` VALUES (2214, '扎兰屯市', 264, 3);
INSERT INTO `area` VALUES (2215, '额尔古纳市', 264, 3);
INSERT INTO `area` VALUES (2216, '根河市', 264, 3);
INSERT INTO `area` VALUES (2217, '阿荣旗', 264, 3);
INSERT INTO `area` VALUES (2218, '鄂伦春自治旗', 264, 3);
INSERT INTO `area` VALUES (2219, '鄂温克族自治旗', 264, 3);
INSERT INTO `area` VALUES (2220, '陈巴尔虎旗', 264, 3);
INSERT INTO `area` VALUES (2221, '新巴尔虎左旗', 264, 3);
INSERT INTO `area` VALUES (2222, '新巴尔虎右旗', 264, 3);
INSERT INTO `area` VALUES (2223, '科尔沁区', 265, 3);
INSERT INTO `area` VALUES (2224, '霍林郭勒市', 265, 3);
INSERT INTO `area` VALUES (2225, '科尔沁左翼中旗', 265, 3);
INSERT INTO `area` VALUES (2226, '科尔沁左翼后旗', 265, 3);
INSERT INTO `area` VALUES (2227, '开鲁县', 265, 3);
INSERT INTO `area` VALUES (2228, '库伦旗', 265, 3);
INSERT INTO `area` VALUES (2229, '奈曼旗', 265, 3);
INSERT INTO `area` VALUES (2230, '扎鲁特旗', 265, 3);
INSERT INTO `area` VALUES (2231, '海勃湾区', 266, 3);
INSERT INTO `area` VALUES (2232, '乌达区', 266, 3);
INSERT INTO `area` VALUES (2233, '海南区', 266, 3);
INSERT INTO `area` VALUES (2234, '化德县', 267, 3);
INSERT INTO `area` VALUES (2235, '集宁区', 267, 3);
INSERT INTO `area` VALUES (2236, '丰镇市', 267, 3);
INSERT INTO `area` VALUES (2237, '卓资县', 267, 3);
INSERT INTO `area` VALUES (2238, '商都县', 267, 3);
INSERT INTO `area` VALUES (2239, '兴和县', 267, 3);
INSERT INTO `area` VALUES (2240, '凉城县', 267, 3);
INSERT INTO `area` VALUES (2241, '察哈尔右翼前旗', 267, 3);
INSERT INTO `area` VALUES (2242, '察哈尔右翼中旗', 267, 3);
INSERT INTO `area` VALUES (2243, '察哈尔右翼后旗', 267, 3);
INSERT INTO `area` VALUES (2244, '四子王旗', 267, 3);
INSERT INTO `area` VALUES (2245, '二连浩特市', 268, 3);
INSERT INTO `area` VALUES (2246, '锡林浩特市', 268, 3);
INSERT INTO `area` VALUES (2247, '阿巴嘎旗', 268, 3);
INSERT INTO `area` VALUES (2248, '苏尼特左旗', 268, 3);
INSERT INTO `area` VALUES (2249, '苏尼特右旗', 268, 3);
INSERT INTO `area` VALUES (2250, '东乌珠穆沁旗', 268, 3);
INSERT INTO `area` VALUES (2251, '西乌珠穆沁旗', 268, 3);
INSERT INTO `area` VALUES (2252, '太仆寺旗', 268, 3);
INSERT INTO `area` VALUES (2253, '镶黄旗', 268, 3);
INSERT INTO `area` VALUES (2254, '正镶白旗', 268, 3);
INSERT INTO `area` VALUES (2255, '正蓝旗', 268, 3);
INSERT INTO `area` VALUES (2256, '多伦县', 268, 3);
INSERT INTO `area` VALUES (2257, '乌兰浩特市', 269, 3);
INSERT INTO `area` VALUES (2258, '阿尔山市', 269, 3);
INSERT INTO `area` VALUES (2259, '科尔沁右翼前旗', 269, 3);
INSERT INTO `area` VALUES (2260, '科尔沁右翼中旗', 269, 3);
INSERT INTO `area` VALUES (2261, '扎赉特旗', 269, 3);
INSERT INTO `area` VALUES (2262, '突泉县', 269, 3);
INSERT INTO `area` VALUES (2263, '西夏区', 270, 3);
INSERT INTO `area` VALUES (2264, '金凤区', 270, 3);
INSERT INTO `area` VALUES (2265, '兴庆区', 270, 3);
INSERT INTO `area` VALUES (2266, '灵武市', 270, 3);
INSERT INTO `area` VALUES (2267, '永宁县', 270, 3);
INSERT INTO `area` VALUES (2268, '贺兰县', 270, 3);
INSERT INTO `area` VALUES (2269, '原州区', 271, 3);
INSERT INTO `area` VALUES (2270, '海原县', 271, 3);
INSERT INTO `area` VALUES (2271, '西吉县', 271, 3);
INSERT INTO `area` VALUES (2272, '隆德县', 271, 3);
INSERT INTO `area` VALUES (2273, '泾源县', 271, 3);
INSERT INTO `area` VALUES (2274, '彭阳县', 271, 3);
INSERT INTO `area` VALUES (2275, '惠农县', 272, 3);
INSERT INTO `area` VALUES (2276, '大武口区', 272, 3);
INSERT INTO `area` VALUES (2277, '惠农区', 272, 3);
INSERT INTO `area` VALUES (2278, '陶乐县', 272, 3);
INSERT INTO `area` VALUES (2279, '平罗县', 272, 3);
INSERT INTO `area` VALUES (2280, '利通区', 273, 3);
INSERT INTO `area` VALUES (2281, '中卫县', 273, 3);
INSERT INTO `area` VALUES (2282, '青铜峡市', 273, 3);
INSERT INTO `area` VALUES (2283, '中宁县', 273, 3);
INSERT INTO `area` VALUES (2284, '盐池县', 273, 3);
INSERT INTO `area` VALUES (2285, '同心县', 273, 3);
INSERT INTO `area` VALUES (2286, '沙坡头区', 274, 3);
INSERT INTO `area` VALUES (2287, '海原县', 274, 3);
INSERT INTO `area` VALUES (2288, '中宁县', 274, 3);
INSERT INTO `area` VALUES (2289, '城中区', 275, 3);
INSERT INTO `area` VALUES (2290, '城东区', 275, 3);
INSERT INTO `area` VALUES (2291, '城西区', 275, 3);
INSERT INTO `area` VALUES (2292, '城北区', 275, 3);
INSERT INTO `area` VALUES (2293, '湟中县', 275, 3);
INSERT INTO `area` VALUES (2294, '湟源县', 275, 3);
INSERT INTO `area` VALUES (2295, '大通', 275, 3);
INSERT INTO `area` VALUES (2296, '玛沁县', 276, 3);
INSERT INTO `area` VALUES (2297, '班玛县', 276, 3);
INSERT INTO `area` VALUES (2298, '甘德县', 276, 3);
INSERT INTO `area` VALUES (2299, '达日县', 276, 3);
INSERT INTO `area` VALUES (2300, '久治县', 276, 3);
INSERT INTO `area` VALUES (2301, '玛多县', 276, 3);
INSERT INTO `area` VALUES (2302, '海晏县', 277, 3);
INSERT INTO `area` VALUES (2303, '祁连县', 277, 3);
INSERT INTO `area` VALUES (2304, '刚察县', 277, 3);
INSERT INTO `area` VALUES (2305, '门源', 277, 3);
INSERT INTO `area` VALUES (2306, '平安县', 278, 3);
INSERT INTO `area` VALUES (2307, '乐都县', 278, 3);
INSERT INTO `area` VALUES (2308, '民和', 278, 3);
INSERT INTO `area` VALUES (2309, '互助', 278, 3);
INSERT INTO `area` VALUES (2310, '化隆', 278, 3);
INSERT INTO `area` VALUES (2311, '循化', 278, 3);
INSERT INTO `area` VALUES (2312, '共和县', 279, 3);
INSERT INTO `area` VALUES (2313, '同德县', 279, 3);
INSERT INTO `area` VALUES (2314, '贵德县', 279, 3);
INSERT INTO `area` VALUES (2315, '兴海县', 279, 3);
INSERT INTO `area` VALUES (2316, '贵南县', 279, 3);
INSERT INTO `area` VALUES (2317, '德令哈市', 280, 3);
INSERT INTO `area` VALUES (2318, '格尔木市', 280, 3);
INSERT INTO `area` VALUES (2319, '乌兰县', 280, 3);
INSERT INTO `area` VALUES (2320, '都兰县', 280, 3);
INSERT INTO `area` VALUES (2321, '天峻县', 280, 3);
INSERT INTO `area` VALUES (2322, '同仁县', 281, 3);
INSERT INTO `area` VALUES (2323, '尖扎县', 281, 3);
INSERT INTO `area` VALUES (2324, '泽库县', 281, 3);
INSERT INTO `area` VALUES (2325, '河南蒙古族自治县', 281, 3);
INSERT INTO `area` VALUES (2326, '玉树县', 282, 3);
INSERT INTO `area` VALUES (2327, '杂多县', 282, 3);
INSERT INTO `area` VALUES (2328, '称多县', 282, 3);
INSERT INTO `area` VALUES (2329, '治多县', 282, 3);
INSERT INTO `area` VALUES (2330, '囊谦县', 282, 3);
INSERT INTO `area` VALUES (2331, '曲麻莱县', 282, 3);
INSERT INTO `area` VALUES (2332, '市中区', 283, 3);
INSERT INTO `area` VALUES (2333, '历下区', 283, 3);
INSERT INTO `area` VALUES (2334, '天桥区', 283, 3);
INSERT INTO `area` VALUES (2335, '槐荫区', 283, 3);
INSERT INTO `area` VALUES (2336, '历城区', 283, 3);
INSERT INTO `area` VALUES (2337, '长清区', 283, 3);
INSERT INTO `area` VALUES (2338, '章丘市', 283, 3);
INSERT INTO `area` VALUES (2339, '平阴县', 283, 3);
INSERT INTO `area` VALUES (2340, '济阳县', 283, 3);
INSERT INTO `area` VALUES (2341, '商河县', 283, 3);
INSERT INTO `area` VALUES (2342, '市南区', 284, 3);
INSERT INTO `area` VALUES (2343, '市北区', 284, 3);
INSERT INTO `area` VALUES (2344, '城阳区', 284, 3);
INSERT INTO `area` VALUES (2345, '四方区', 284, 3);
INSERT INTO `area` VALUES (2346, '李沧区', 284, 3);
INSERT INTO `area` VALUES (2347, '黄岛区', 284, 3);
INSERT INTO `area` VALUES (2348, '崂山区', 284, 3);
INSERT INTO `area` VALUES (2349, '胶州市', 284, 3);
INSERT INTO `area` VALUES (2350, '即墨市', 284, 3);
INSERT INTO `area` VALUES (2351, '平度市', 284, 3);
INSERT INTO `area` VALUES (2352, '胶南市', 284, 3);
INSERT INTO `area` VALUES (2353, '莱西市', 284, 3);
INSERT INTO `area` VALUES (2354, '滨城区', 285, 3);
INSERT INTO `area` VALUES (2355, '惠民县', 285, 3);
INSERT INTO `area` VALUES (2356, '阳信县', 285, 3);
INSERT INTO `area` VALUES (2357, '无棣县', 285, 3);
INSERT INTO `area` VALUES (2358, '沾化县', 285, 3);
INSERT INTO `area` VALUES (2359, '博兴县', 285, 3);
INSERT INTO `area` VALUES (2360, '邹平县', 285, 3);
INSERT INTO `area` VALUES (2361, '德城区', 286, 3);
INSERT INTO `area` VALUES (2362, '陵县', 286, 3);
INSERT INTO `area` VALUES (2363, '乐陵市', 286, 3);
INSERT INTO `area` VALUES (2364, '禹城市', 286, 3);
INSERT INTO `area` VALUES (2365, '宁津县', 286, 3);
INSERT INTO `area` VALUES (2366, '庆云县', 286, 3);
INSERT INTO `area` VALUES (2367, '临邑县', 286, 3);
INSERT INTO `area` VALUES (2368, '齐河县', 286, 3);
INSERT INTO `area` VALUES (2369, '平原县', 286, 3);
INSERT INTO `area` VALUES (2370, '夏津县', 286, 3);
INSERT INTO `area` VALUES (2371, '武城县', 286, 3);
INSERT INTO `area` VALUES (2372, '东营区', 287, 3);
INSERT INTO `area` VALUES (2373, '河口区', 287, 3);
INSERT INTO `area` VALUES (2374, '垦利县', 287, 3);
INSERT INTO `area` VALUES (2375, '利津县', 287, 3);
INSERT INTO `area` VALUES (2376, '广饶县', 287, 3);
INSERT INTO `area` VALUES (2377, '牡丹区', 288, 3);
INSERT INTO `area` VALUES (2378, '曹县', 288, 3);
INSERT INTO `area` VALUES (2379, '单县', 288, 3);
INSERT INTO `area` VALUES (2380, '成武县', 288, 3);
INSERT INTO `area` VALUES (2381, '巨野县', 288, 3);
INSERT INTO `area` VALUES (2382, '郓城县', 288, 3);
INSERT INTO `area` VALUES (2383, '鄄城县', 288, 3);
INSERT INTO `area` VALUES (2384, '定陶县', 288, 3);
INSERT INTO `area` VALUES (2385, '东明县', 288, 3);
INSERT INTO `area` VALUES (2386, '市中区', 289, 3);
INSERT INTO `area` VALUES (2387, '任城区', 289, 3);
INSERT INTO `area` VALUES (2388, '曲阜市', 289, 3);
INSERT INTO `area` VALUES (2389, '兖州市', 289, 3);
INSERT INTO `area` VALUES (2390, '邹城市', 289, 3);
INSERT INTO `area` VALUES (2391, '微山县', 289, 3);
INSERT INTO `area` VALUES (2392, '鱼台县', 289, 3);
INSERT INTO `area` VALUES (2393, '金乡县', 289, 3);
INSERT INTO `area` VALUES (2394, '嘉祥县', 289, 3);
INSERT INTO `area` VALUES (2395, '汶上县', 289, 3);
INSERT INTO `area` VALUES (2396, '泗水县', 289, 3);
INSERT INTO `area` VALUES (2397, '梁山县', 289, 3);
INSERT INTO `area` VALUES (2398, '莱城区', 290, 3);
INSERT INTO `area` VALUES (2399, '钢城区', 290, 3);
INSERT INTO `area` VALUES (2400, '东昌府区', 291, 3);
INSERT INTO `area` VALUES (2401, '临清市', 291, 3);
INSERT INTO `area` VALUES (2402, '阳谷县', 291, 3);
INSERT INTO `area` VALUES (2403, '莘县', 291, 3);
INSERT INTO `area` VALUES (2404, '茌平县', 291, 3);
INSERT INTO `area` VALUES (2405, '东阿县', 291, 3);
INSERT INTO `area` VALUES (2406, '冠县', 291, 3);
INSERT INTO `area` VALUES (2407, '高唐县', 291, 3);
INSERT INTO `area` VALUES (2408, '兰山区', 292, 3);
INSERT INTO `area` VALUES (2409, '罗庄区', 292, 3);
INSERT INTO `area` VALUES (2410, '河东区', 292, 3);
INSERT INTO `area` VALUES (2411, '沂南县', 292, 3);
INSERT INTO `area` VALUES (2412, '郯城县', 292, 3);
INSERT INTO `area` VALUES (2413, '沂水县', 292, 3);
INSERT INTO `area` VALUES (2414, '苍山县', 292, 3);
INSERT INTO `area` VALUES (2415, '费县', 292, 3);
INSERT INTO `area` VALUES (2416, '平邑县', 292, 3);
INSERT INTO `area` VALUES (2417, '莒南县', 292, 3);
INSERT INTO `area` VALUES (2418, '蒙阴县', 292, 3);
INSERT INTO `area` VALUES (2419, '临沭县', 292, 3);
INSERT INTO `area` VALUES (2420, '东港区', 293, 3);
INSERT INTO `area` VALUES (2421, '岚山区', 293, 3);
INSERT INTO `area` VALUES (2422, '五莲县', 293, 3);
INSERT INTO `area` VALUES (2423, '莒县', 293, 3);
INSERT INTO `area` VALUES (2424, '泰山区', 294, 3);
INSERT INTO `area` VALUES (2425, '岱岳区', 294, 3);
INSERT INTO `area` VALUES (2426, '新泰市', 294, 3);
INSERT INTO `area` VALUES (2427, '肥城市', 294, 3);
INSERT INTO `area` VALUES (2428, '宁阳县', 294, 3);
INSERT INTO `area` VALUES (2429, '东平县', 294, 3);
INSERT INTO `area` VALUES (2430, '荣成市', 295, 3);
INSERT INTO `area` VALUES (2431, '乳山市', 295, 3);
INSERT INTO `area` VALUES (2432, '环翠区', 295, 3);
INSERT INTO `area` VALUES (2433, '文登市', 295, 3);
INSERT INTO `area` VALUES (2434, '潍城区', 296, 3);
INSERT INTO `area` VALUES (2435, '寒亭区', 296, 3);
INSERT INTO `area` VALUES (2436, '坊子区', 296, 3);
INSERT INTO `area` VALUES (2437, '奎文区', 296, 3);
INSERT INTO `area` VALUES (2438, '青州市', 296, 3);
INSERT INTO `area` VALUES (2439, '诸城市', 296, 3);
INSERT INTO `area` VALUES (2440, '寿光市', 296, 3);
INSERT INTO `area` VALUES (2441, '安丘市', 296, 3);
INSERT INTO `area` VALUES (2442, '高密市', 296, 3);
INSERT INTO `area` VALUES (2443, '昌邑市', 296, 3);
INSERT INTO `area` VALUES (2444, '临朐县', 296, 3);
INSERT INTO `area` VALUES (2445, '昌乐县', 296, 3);
INSERT INTO `area` VALUES (2446, '芝罘区', 297, 3);
INSERT INTO `area` VALUES (2447, '福山区', 297, 3);
INSERT INTO `area` VALUES (2448, '牟平区', 297, 3);
INSERT INTO `area` VALUES (2449, '莱山区', 297, 3);
INSERT INTO `area` VALUES (2450, '开发区', 297, 3);
INSERT INTO `area` VALUES (2451, '龙口市', 297, 3);
INSERT INTO `area` VALUES (2452, '莱阳市', 297, 3);
INSERT INTO `area` VALUES (2453, '莱州市', 297, 3);
INSERT INTO `area` VALUES (2454, '蓬莱市', 297, 3);
INSERT INTO `area` VALUES (2455, '招远市', 297, 3);
INSERT INTO `area` VALUES (2456, '栖霞市', 297, 3);
INSERT INTO `area` VALUES (2457, '海阳市', 297, 3);
INSERT INTO `area` VALUES (2458, '长岛县', 297, 3);
INSERT INTO `area` VALUES (2459, '市中区', 298, 3);
INSERT INTO `area` VALUES (2460, '山亭区', 298, 3);
INSERT INTO `area` VALUES (2461, '峄城区', 298, 3);
INSERT INTO `area` VALUES (2462, '台儿庄区', 298, 3);
INSERT INTO `area` VALUES (2463, '薛城区', 298, 3);
INSERT INTO `area` VALUES (2464, '滕州市', 298, 3);
INSERT INTO `area` VALUES (2465, '张店区', 299, 3);
INSERT INTO `area` VALUES (2466, '临淄区', 299, 3);
INSERT INTO `area` VALUES (2467, '淄川区', 299, 3);
INSERT INTO `area` VALUES (2468, '博山区', 299, 3);
INSERT INTO `area` VALUES (2469, '周村区', 299, 3);
INSERT INTO `area` VALUES (2470, '桓台县', 299, 3);
INSERT INTO `area` VALUES (2471, '高青县', 299, 3);
INSERT INTO `area` VALUES (2472, '沂源县', 299, 3);
INSERT INTO `area` VALUES (2473, '杏花岭区', 300, 3);
INSERT INTO `area` VALUES (2474, '小店区', 300, 3);
INSERT INTO `area` VALUES (2475, '迎泽区', 300, 3);
INSERT INTO `area` VALUES (2476, '尖草坪区', 300, 3);
INSERT INTO `area` VALUES (2477, '万柏林区', 300, 3);
INSERT INTO `area` VALUES (2478, '晋源区', 300, 3);
INSERT INTO `area` VALUES (2479, '高新开发区', 300, 3);
INSERT INTO `area` VALUES (2480, '民营经济开发区', 300, 3);
INSERT INTO `area` VALUES (2481, '经济技术开发区', 300, 3);
INSERT INTO `area` VALUES (2482, '清徐县', 300, 3);
INSERT INTO `area` VALUES (2483, '阳曲县', 300, 3);
INSERT INTO `area` VALUES (2484, '娄烦县', 300, 3);
INSERT INTO `area` VALUES (2485, '古交市', 300, 3);
INSERT INTO `area` VALUES (2486, '城区', 301, 3);
INSERT INTO `area` VALUES (2487, '郊区', 301, 3);
INSERT INTO `area` VALUES (2488, '沁县', 301, 3);
INSERT INTO `area` VALUES (2489, '潞城市', 301, 3);
INSERT INTO `area` VALUES (2490, '长治县', 301, 3);
INSERT INTO `area` VALUES (2491, '襄垣县', 301, 3);
INSERT INTO `area` VALUES (2492, '屯留县', 301, 3);
INSERT INTO `area` VALUES (2493, '平顺县', 301, 3);
INSERT INTO `area` VALUES (2494, '黎城县', 301, 3);
INSERT INTO `area` VALUES (2495, '壶关县', 301, 3);
INSERT INTO `area` VALUES (2496, '长子县', 301, 3);
INSERT INTO `area` VALUES (2497, '武乡县', 301, 3);
INSERT INTO `area` VALUES (2498, '沁源县', 301, 3);
INSERT INTO `area` VALUES (2499, '城区', 302, 3);
INSERT INTO `area` VALUES (2500, '矿区', 302, 3);
INSERT INTO `area` VALUES (2501, '南郊区', 302, 3);
INSERT INTO `area` VALUES (2502, '新荣区', 302, 3);
INSERT INTO `area` VALUES (2503, '阳高县', 302, 3);
INSERT INTO `area` VALUES (2504, '天镇县', 302, 3);
INSERT INTO `area` VALUES (2505, '广灵县', 302, 3);
INSERT INTO `area` VALUES (2506, '灵丘县', 302, 3);
INSERT INTO `area` VALUES (2507, '浑源县', 302, 3);
INSERT INTO `area` VALUES (2508, '左云县', 302, 3);
INSERT INTO `area` VALUES (2509, '大同县', 302, 3);
INSERT INTO `area` VALUES (2510, '城区', 303, 3);
INSERT INTO `area` VALUES (2511, '高平市', 303, 3);
INSERT INTO `area` VALUES (2512, '沁水县', 303, 3);
INSERT INTO `area` VALUES (2513, '阳城县', 303, 3);
INSERT INTO `area` VALUES (2514, '陵川县', 303, 3);
INSERT INTO `area` VALUES (2515, '泽州县', 303, 3);
INSERT INTO `area` VALUES (2516, '榆次区', 304, 3);
INSERT INTO `area` VALUES (2517, '介休市', 304, 3);
INSERT INTO `area` VALUES (2518, '榆社县', 304, 3);
INSERT INTO `area` VALUES (2519, '左权县', 304, 3);
INSERT INTO `area` VALUES (2520, '和顺县', 304, 3);
INSERT INTO `area` VALUES (2521, '昔阳县', 304, 3);
INSERT INTO `area` VALUES (2522, '寿阳县', 304, 3);
INSERT INTO `area` VALUES (2523, '太谷县', 304, 3);
INSERT INTO `area` VALUES (2524, '祁县', 304, 3);
INSERT INTO `area` VALUES (2525, '平遥县', 304, 3);
INSERT INTO `area` VALUES (2526, '灵石县', 304, 3);
INSERT INTO `area` VALUES (2527, '尧都区', 305, 3);
INSERT INTO `area` VALUES (2528, '侯马市', 305, 3);
INSERT INTO `area` VALUES (2529, '霍州市', 305, 3);
INSERT INTO `area` VALUES (2530, '曲沃县', 305, 3);
INSERT INTO `area` VALUES (2531, '翼城县', 305, 3);
INSERT INTO `area` VALUES (2532, '襄汾县', 305, 3);
INSERT INTO `area` VALUES (2533, '洪洞县', 305, 3);
INSERT INTO `area` VALUES (2534, '吉县', 305, 3);
INSERT INTO `area` VALUES (2535, '安泽县', 305, 3);
INSERT INTO `area` VALUES (2536, '浮山县', 305, 3);
INSERT INTO `area` VALUES (2537, '古县', 305, 3);
INSERT INTO `area` VALUES (2538, '乡宁县', 305, 3);
INSERT INTO `area` VALUES (2539, '大宁县', 305, 3);
INSERT INTO `area` VALUES (2540, '隰县', 305, 3);
INSERT INTO `area` VALUES (2541, '永和县', 305, 3);
INSERT INTO `area` VALUES (2542, '蒲县', 305, 3);
INSERT INTO `area` VALUES (2543, '汾西县', 305, 3);
INSERT INTO `area` VALUES (2544, '离石市', 306, 3);
INSERT INTO `area` VALUES (2545, '离石区', 306, 3);
INSERT INTO `area` VALUES (2546, '孝义市', 306, 3);
INSERT INTO `area` VALUES (2547, '汾阳市', 306, 3);
INSERT INTO `area` VALUES (2548, '文水县', 306, 3);
INSERT INTO `area` VALUES (2549, '交城县', 306, 3);
INSERT INTO `area` VALUES (2550, '兴县', 306, 3);
INSERT INTO `area` VALUES (2551, '临县', 306, 3);
INSERT INTO `area` VALUES (2552, '柳林县', 306, 3);
INSERT INTO `area` VALUES (2553, '石楼县', 306, 3);
INSERT INTO `area` VALUES (2554, '岚县', 306, 3);
INSERT INTO `area` VALUES (2555, '方山县', 306, 3);
INSERT INTO `area` VALUES (2556, '中阳县', 306, 3);
INSERT INTO `area` VALUES (2557, '交口县', 306, 3);
INSERT INTO `area` VALUES (2558, '朔城区', 307, 3);
INSERT INTO `area` VALUES (2559, '平鲁区', 307, 3);
INSERT INTO `area` VALUES (2560, '山阴县', 307, 3);
INSERT INTO `area` VALUES (2561, '应县', 307, 3);
INSERT INTO `area` VALUES (2562, '右玉县', 307, 3);
INSERT INTO `area` VALUES (2563, '怀仁县', 307, 3);
INSERT INTO `area` VALUES (2564, '忻府区', 308, 3);
INSERT INTO `area` VALUES (2565, '原平市', 308, 3);
INSERT INTO `area` VALUES (2566, '定襄县', 308, 3);
INSERT INTO `area` VALUES (2567, '五台县', 308, 3);
INSERT INTO `area` VALUES (2568, '代县', 308, 3);
INSERT INTO `area` VALUES (2569, '繁峙县', 308, 3);
INSERT INTO `area` VALUES (2570, '宁武县', 308, 3);
INSERT INTO `area` VALUES (2571, '静乐县', 308, 3);
INSERT INTO `area` VALUES (2572, '神池县', 308, 3);
INSERT INTO `area` VALUES (2573, '五寨县', 308, 3);
INSERT INTO `area` VALUES (2574, '岢岚县', 308, 3);
INSERT INTO `area` VALUES (2575, '河曲县', 308, 3);
INSERT INTO `area` VALUES (2576, '保德县', 308, 3);
INSERT INTO `area` VALUES (2577, '偏关县', 308, 3);
INSERT INTO `area` VALUES (2578, '城区', 309, 3);
INSERT INTO `area` VALUES (2579, '矿区', 309, 3);
INSERT INTO `area` VALUES (2580, '郊区', 309, 3);
INSERT INTO `area` VALUES (2581, '平定县', 309, 3);
INSERT INTO `area` VALUES (2582, '盂县', 309, 3);
INSERT INTO `area` VALUES (2583, '盐湖区', 310, 3);
INSERT INTO `area` VALUES (2584, '永济市', 310, 3);
INSERT INTO `area` VALUES (2585, '河津市', 310, 3);
INSERT INTO `area` VALUES (2586, '临猗县', 310, 3);
INSERT INTO `area` VALUES (2587, '万荣县', 310, 3);
INSERT INTO `area` VALUES (2588, '闻喜县', 310, 3);
INSERT INTO `area` VALUES (2589, '稷山县', 310, 3);
INSERT INTO `area` VALUES (2590, '新绛县', 310, 3);
INSERT INTO `area` VALUES (2591, '绛县', 310, 3);
INSERT INTO `area` VALUES (2592, '垣曲县', 310, 3);
INSERT INTO `area` VALUES (2593, '夏县', 310, 3);
INSERT INTO `area` VALUES (2594, '平陆县', 310, 3);
INSERT INTO `area` VALUES (2595, '芮城县', 310, 3);
INSERT INTO `area` VALUES (2596, '莲湖区', 311, 3);
INSERT INTO `area` VALUES (2597, '新城区', 311, 3);
INSERT INTO `area` VALUES (2598, '碑林区', 311, 3);
INSERT INTO `area` VALUES (2599, '雁塔区', 311, 3);
INSERT INTO `area` VALUES (2600, '灞桥区', 311, 3);
INSERT INTO `area` VALUES (2601, '未央区', 311, 3);
INSERT INTO `area` VALUES (2602, '阎良区', 311, 3);
INSERT INTO `area` VALUES (2603, '临潼区', 311, 3);
INSERT INTO `area` VALUES (2604, '长安区', 311, 3);
INSERT INTO `area` VALUES (2605, '蓝田县', 311, 3);
INSERT INTO `area` VALUES (2606, '周至县', 311, 3);
INSERT INTO `area` VALUES (2607, '户县', 311, 3);
INSERT INTO `area` VALUES (2608, '高陵县', 311, 3);
INSERT INTO `area` VALUES (2609, '汉滨区', 312, 3);
INSERT INTO `area` VALUES (2610, '汉阴县', 312, 3);
INSERT INTO `area` VALUES (2611, '石泉县', 312, 3);
INSERT INTO `area` VALUES (2612, '宁陕县', 312, 3);
INSERT INTO `area` VALUES (2613, '紫阳县', 312, 3);
INSERT INTO `area` VALUES (2614, '岚皋县', 312, 3);
INSERT INTO `area` VALUES (2615, '平利县', 312, 3);
INSERT INTO `area` VALUES (2616, '镇坪县', 312, 3);
INSERT INTO `area` VALUES (2617, '旬阳县', 312, 3);
INSERT INTO `area` VALUES (2618, '白河县', 312, 3);
INSERT INTO `area` VALUES (2619, '陈仓区', 313, 3);
INSERT INTO `area` VALUES (2620, '渭滨区', 313, 3);
INSERT INTO `area` VALUES (2621, '金台区', 313, 3);
INSERT INTO `area` VALUES (2622, '凤翔县', 313, 3);
INSERT INTO `area` VALUES (2623, '岐山县', 313, 3);
INSERT INTO `area` VALUES (2624, '扶风县', 313, 3);
INSERT INTO `area` VALUES (2625, '眉县', 313, 3);
INSERT INTO `area` VALUES (2626, '陇县', 313, 3);
INSERT INTO `area` VALUES (2627, '千阳县', 313, 3);
INSERT INTO `area` VALUES (2628, '麟游县', 313, 3);
INSERT INTO `area` VALUES (2629, '凤县', 313, 3);
INSERT INTO `area` VALUES (2630, '太白县', 313, 3);
INSERT INTO `area` VALUES (2631, '汉台区', 314, 3);
INSERT INTO `area` VALUES (2632, '南郑县', 314, 3);
INSERT INTO `area` VALUES (2633, '城固县', 314, 3);
INSERT INTO `area` VALUES (2634, '洋县', 314, 3);
INSERT INTO `area` VALUES (2635, '西乡县', 314, 3);
INSERT INTO `area` VALUES (2636, '勉县', 314, 3);
INSERT INTO `area` VALUES (2637, '宁强县', 314, 3);
INSERT INTO `area` VALUES (2638, '略阳县', 314, 3);
INSERT INTO `area` VALUES (2639, '镇巴县', 314, 3);
INSERT INTO `area` VALUES (2640, '留坝县', 314, 3);
INSERT INTO `area` VALUES (2641, '佛坪县', 314, 3);
INSERT INTO `area` VALUES (2642, '商州区', 315, 3);
INSERT INTO `area` VALUES (2643, '洛南县', 315, 3);
INSERT INTO `area` VALUES (2644, '丹凤县', 315, 3);
INSERT INTO `area` VALUES (2645, '商南县', 315, 3);
INSERT INTO `area` VALUES (2646, '山阳县', 315, 3);
INSERT INTO `area` VALUES (2647, '镇安县', 315, 3);
INSERT INTO `area` VALUES (2648, '柞水县', 315, 3);
INSERT INTO `area` VALUES (2649, '耀州区', 316, 3);
INSERT INTO `area` VALUES (2650, '王益区', 316, 3);
INSERT INTO `area` VALUES (2651, '印台区', 316, 3);
INSERT INTO `area` VALUES (2652, '宜君县', 316, 3);
INSERT INTO `area` VALUES (2653, '临渭区', 317, 3);
INSERT INTO `area` VALUES (2654, '韩城市', 317, 3);
INSERT INTO `area` VALUES (2655, '华阴市', 317, 3);
INSERT INTO `area` VALUES (2656, '华县', 317, 3);
INSERT INTO `area` VALUES (2657, '潼关县', 317, 3);
INSERT INTO `area` VALUES (2658, '大荔县', 317, 3);
INSERT INTO `area` VALUES (2659, '合阳县', 317, 3);
INSERT INTO `area` VALUES (2660, '澄城县', 317, 3);
INSERT INTO `area` VALUES (2661, '蒲城县', 317, 3);
INSERT INTO `area` VALUES (2662, '白水县', 317, 3);
INSERT INTO `area` VALUES (2663, '富平县', 317, 3);
INSERT INTO `area` VALUES (2664, '秦都区', 318, 3);
INSERT INTO `area` VALUES (2665, '渭城区', 318, 3);
INSERT INTO `area` VALUES (2666, '杨陵区', 318, 3);
INSERT INTO `area` VALUES (2667, '兴平市', 318, 3);
INSERT INTO `area` VALUES (2668, '三原县', 318, 3);
INSERT INTO `area` VALUES (2669, '泾阳县', 318, 3);
INSERT INTO `area` VALUES (2670, '乾县', 318, 3);
INSERT INTO `area` VALUES (2671, '礼泉县', 318, 3);
INSERT INTO `area` VALUES (2672, '永寿县', 318, 3);
INSERT INTO `area` VALUES (2673, '彬县', 318, 3);
INSERT INTO `area` VALUES (2674, '长武县', 318, 3);
INSERT INTO `area` VALUES (2675, '旬邑县', 318, 3);
INSERT INTO `area` VALUES (2676, '淳化县', 318, 3);
INSERT INTO `area` VALUES (2677, '武功县', 318, 3);
INSERT INTO `area` VALUES (2678, '吴起县', 319, 3);
INSERT INTO `area` VALUES (2679, '宝塔区', 319, 3);
INSERT INTO `area` VALUES (2680, '延长县', 319, 3);
INSERT INTO `area` VALUES (2681, '延川县', 319, 3);
INSERT INTO `area` VALUES (2682, '子长县', 319, 3);
INSERT INTO `area` VALUES (2683, '安塞县', 319, 3);
INSERT INTO `area` VALUES (2684, '志丹县', 319, 3);
INSERT INTO `area` VALUES (2685, '甘泉县', 319, 3);
INSERT INTO `area` VALUES (2686, '富县', 319, 3);
INSERT INTO `area` VALUES (2687, '洛川县', 319, 3);
INSERT INTO `area` VALUES (2688, '宜川县', 319, 3);
INSERT INTO `area` VALUES (2689, '黄龙县', 319, 3);
INSERT INTO `area` VALUES (2690, '黄陵县', 319, 3);
INSERT INTO `area` VALUES (2691, '榆阳区', 320, 3);
INSERT INTO `area` VALUES (2692, '神木县', 320, 3);
INSERT INTO `area` VALUES (2693, '府谷县', 320, 3);
INSERT INTO `area` VALUES (2694, '横山县', 320, 3);
INSERT INTO `area` VALUES (2695, '靖边县', 320, 3);
INSERT INTO `area` VALUES (2696, '定边县', 320, 3);
INSERT INTO `area` VALUES (2697, '绥德县', 320, 3);
INSERT INTO `area` VALUES (2698, '米脂县', 320, 3);
INSERT INTO `area` VALUES (2699, '佳县', 320, 3);
INSERT INTO `area` VALUES (2700, '吴堡县', 320, 3);
INSERT INTO `area` VALUES (2701, '清涧县', 320, 3);
INSERT INTO `area` VALUES (2702, '子洲县', 320, 3);
INSERT INTO `area` VALUES (2703, '长宁区', 321, 3);
INSERT INTO `area` VALUES (2704, '闸北区', 321, 3);
INSERT INTO `area` VALUES (2705, '闵行区', 321, 3);
INSERT INTO `area` VALUES (2706, '徐汇区', 321, 3);
INSERT INTO `area` VALUES (2707, '浦东新区', 321, 3);
INSERT INTO `area` VALUES (2708, '杨浦区', 321, 3);
INSERT INTO `area` VALUES (2709, '普陀区', 321, 3);
INSERT INTO `area` VALUES (2710, '静安区', 321, 3);
INSERT INTO `area` VALUES (2711, '卢湾区', 321, 3);
INSERT INTO `area` VALUES (2712, '虹口区', 321, 3);
INSERT INTO `area` VALUES (2713, '黄浦区', 321, 3);
INSERT INTO `area` VALUES (2714, '南汇区', 321, 3);
INSERT INTO `area` VALUES (2715, '松江区', 321, 3);
INSERT INTO `area` VALUES (2716, '嘉定区', 321, 3);
INSERT INTO `area` VALUES (2717, '宝山区', 321, 3);
INSERT INTO `area` VALUES (2718, '青浦区', 321, 3);
INSERT INTO `area` VALUES (2719, '金山区', 321, 3);
INSERT INTO `area` VALUES (2720, '奉贤区', 321, 3);
INSERT INTO `area` VALUES (2721, '崇明县', 321, 3);
INSERT INTO `area` VALUES (2722, '青羊区', 322, 3);
INSERT INTO `area` VALUES (2723, '锦江区', 322, 3);
INSERT INTO `area` VALUES (2724, '金牛区', 322, 3);
INSERT INTO `area` VALUES (2725, '武侯区', 322, 3);
INSERT INTO `area` VALUES (2726, '成华区', 322, 3);
INSERT INTO `area` VALUES (2727, '龙泉驿区', 322, 3);
INSERT INTO `area` VALUES (2728, '青白江区', 322, 3);
INSERT INTO `area` VALUES (2729, '新都区', 322, 3);
INSERT INTO `area` VALUES (2730, '温江区', 322, 3);
INSERT INTO `area` VALUES (2731, '高新区', 322, 3);
INSERT INTO `area` VALUES (2732, '高新西区', 322, 3);
INSERT INTO `area` VALUES (2733, '都江堰市', 322, 3);
INSERT INTO `area` VALUES (2734, '彭州市', 322, 3);
INSERT INTO `area` VALUES (2735, '邛崃市', 322, 3);
INSERT INTO `area` VALUES (2736, '崇州市', 322, 3);
INSERT INTO `area` VALUES (2737, '金堂县', 322, 3);
INSERT INTO `area` VALUES (2738, '双流县', 322, 3);
INSERT INTO `area` VALUES (2739, '郫县', 322, 3);
INSERT INTO `area` VALUES (2740, '大邑县', 322, 3);
INSERT INTO `area` VALUES (2741, '蒲江县', 322, 3);
INSERT INTO `area` VALUES (2742, '新津县', 322, 3);
INSERT INTO `area` VALUES (2743, '都江堰市', 322, 3);
INSERT INTO `area` VALUES (2744, '彭州市', 322, 3);
INSERT INTO `area` VALUES (2745, '邛崃市', 322, 3);
INSERT INTO `area` VALUES (2746, '崇州市', 322, 3);
INSERT INTO `area` VALUES (2747, '金堂县', 322, 3);
INSERT INTO `area` VALUES (2748, '双流县', 322, 3);
INSERT INTO `area` VALUES (2749, '郫县', 322, 3);
INSERT INTO `area` VALUES (2750, '大邑县', 322, 3);
INSERT INTO `area` VALUES (2751, '蒲江县', 322, 3);
INSERT INTO `area` VALUES (2752, '新津县', 322, 3);
INSERT INTO `area` VALUES (2753, '涪城区', 323, 3);
INSERT INTO `area` VALUES (2754, '游仙区', 323, 3);
INSERT INTO `area` VALUES (2755, '江油市', 323, 3);
INSERT INTO `area` VALUES (2756, '盐亭县', 323, 3);
INSERT INTO `area` VALUES (2757, '三台县', 323, 3);
INSERT INTO `area` VALUES (2758, '平武县', 323, 3);
INSERT INTO `area` VALUES (2759, '安县', 323, 3);
INSERT INTO `area` VALUES (2760, '梓潼县', 323, 3);
INSERT INTO `area` VALUES (2761, '北川县', 323, 3);
INSERT INTO `area` VALUES (2762, '马尔康县', 324, 3);
INSERT INTO `area` VALUES (2763, '汶川县', 324, 3);
INSERT INTO `area` VALUES (2764, '理县', 324, 3);
INSERT INTO `area` VALUES (2765, '茂县', 324, 3);
INSERT INTO `area` VALUES (2766, '松潘县', 324, 3);
INSERT INTO `area` VALUES (2767, '九寨沟县', 324, 3);
INSERT INTO `area` VALUES (2768, '金川县', 324, 3);
INSERT INTO `area` VALUES (2769, '小金县', 324, 3);
INSERT INTO `area` VALUES (2770, '黑水县', 324, 3);
INSERT INTO `area` VALUES (2771, '壤塘县', 324, 3);
INSERT INTO `area` VALUES (2772, '阿坝县', 324, 3);
INSERT INTO `area` VALUES (2773, '若尔盖县', 324, 3);
INSERT INTO `area` VALUES (2774, '红原县', 324, 3);
INSERT INTO `area` VALUES (2775, '巴州区', 325, 3);
INSERT INTO `area` VALUES (2776, '通江县', 325, 3);
INSERT INTO `area` VALUES (2777, '南江县', 325, 3);
INSERT INTO `area` VALUES (2778, '平昌县', 325, 3);
INSERT INTO `area` VALUES (2779, '通川区', 326, 3);
INSERT INTO `area` VALUES (2780, '万源市', 326, 3);
INSERT INTO `area` VALUES (2781, '达县', 326, 3);
INSERT INTO `area` VALUES (2782, '宣汉县', 326, 3);
INSERT INTO `area` VALUES (2783, '开江县', 326, 3);
INSERT INTO `area` VALUES (2784, '大竹县', 326, 3);
INSERT INTO `area` VALUES (2785, '渠县', 326, 3);
INSERT INTO `area` VALUES (2786, '旌阳区', 327, 3);
INSERT INTO `area` VALUES (2787, '广汉市', 327, 3);
INSERT INTO `area` VALUES (2788, '什邡市', 327, 3);
INSERT INTO `area` VALUES (2789, '绵竹市', 327, 3);
INSERT INTO `area` VALUES (2790, '罗江县', 327, 3);
INSERT INTO `area` VALUES (2791, '中江县', 327, 3);
INSERT INTO `area` VALUES (2792, '康定县', 328, 3);
INSERT INTO `area` VALUES (2793, '丹巴县', 328, 3);
INSERT INTO `area` VALUES (2794, '泸定县', 328, 3);
INSERT INTO `area` VALUES (2795, '炉霍县', 328, 3);
INSERT INTO `area` VALUES (2796, '九龙县', 328, 3);
INSERT INTO `area` VALUES (2797, '甘孜县', 328, 3);
INSERT INTO `area` VALUES (2798, '雅江县', 328, 3);
INSERT INTO `area` VALUES (2799, '新龙县', 328, 3);
INSERT INTO `area` VALUES (2800, '道孚县', 328, 3);
INSERT INTO `area` VALUES (2801, '白玉县', 328, 3);
INSERT INTO `area` VALUES (2802, '理塘县', 328, 3);
INSERT INTO `area` VALUES (2803, '德格县', 328, 3);
INSERT INTO `area` VALUES (2804, '乡城县', 328, 3);
INSERT INTO `area` VALUES (2805, '石渠县', 328, 3);
INSERT INTO `area` VALUES (2806, '稻城县', 328, 3);
INSERT INTO `area` VALUES (2807, '色达县', 328, 3);
INSERT INTO `area` VALUES (2808, '巴塘县', 328, 3);
INSERT INTO `area` VALUES (2809, '得荣县', 328, 3);
INSERT INTO `area` VALUES (2810, '广安区', 329, 3);
INSERT INTO `area` VALUES (2811, '华蓥市', 329, 3);
INSERT INTO `area` VALUES (2812, '岳池县', 329, 3);
INSERT INTO `area` VALUES (2813, '武胜县', 329, 3);
INSERT INTO `area` VALUES (2814, '邻水县', 329, 3);
INSERT INTO `area` VALUES (2815, '利州区', 330, 3);
INSERT INTO `area` VALUES (2816, '元坝区', 330, 3);
INSERT INTO `area` VALUES (2817, '朝天区', 330, 3);
INSERT INTO `area` VALUES (2818, '旺苍县', 330, 3);
INSERT INTO `area` VALUES (2819, '青川县', 330, 3);
INSERT INTO `area` VALUES (2820, '剑阁县', 330, 3);
INSERT INTO `area` VALUES (2821, '苍溪县', 330, 3);
INSERT INTO `area` VALUES (2822, '峨眉山市', 331, 3);
INSERT INTO `area` VALUES (2823, '乐山市', 331, 3);
INSERT INTO `area` VALUES (2824, '犍为县', 331, 3);
INSERT INTO `area` VALUES (2825, '井研县', 331, 3);
INSERT INTO `area` VALUES (2826, '夹江县', 331, 3);
INSERT INTO `area` VALUES (2827, '沐川县', 331, 3);
INSERT INTO `area` VALUES (2828, '峨边', 331, 3);
INSERT INTO `area` VALUES (2829, '马边', 331, 3);
INSERT INTO `area` VALUES (2830, '西昌市', 332, 3);
INSERT INTO `area` VALUES (2831, '盐源县', 332, 3);
INSERT INTO `area` VALUES (2832, '德昌县', 332, 3);
INSERT INTO `area` VALUES (2833, '会理县', 332, 3);
INSERT INTO `area` VALUES (2834, '会东县', 332, 3);
INSERT INTO `area` VALUES (2835, '宁南县', 332, 3);
INSERT INTO `area` VALUES (2836, '普格县', 332, 3);
INSERT INTO `area` VALUES (2837, '布拖县', 332, 3);
INSERT INTO `area` VALUES (2838, '金阳县', 332, 3);
INSERT INTO `area` VALUES (2839, '昭觉县', 332, 3);
INSERT INTO `area` VALUES (2840, '喜德县', 332, 3);
INSERT INTO `area` VALUES (2841, '冕宁县', 332, 3);
INSERT INTO `area` VALUES (2842, '越西县', 332, 3);
INSERT INTO `area` VALUES (2843, '甘洛县', 332, 3);
INSERT INTO `area` VALUES (2844, '美姑县', 332, 3);
INSERT INTO `area` VALUES (2845, '雷波县', 332, 3);
INSERT INTO `area` VALUES (2846, '木里', 332, 3);
INSERT INTO `area` VALUES (2847, '东坡区', 333, 3);
INSERT INTO `area` VALUES (2848, '仁寿县', 333, 3);
INSERT INTO `area` VALUES (2849, '彭山县', 333, 3);
INSERT INTO `area` VALUES (2850, '洪雅县', 333, 3);
INSERT INTO `area` VALUES (2851, '丹棱县', 333, 3);
INSERT INTO `area` VALUES (2852, '青神县', 333, 3);
INSERT INTO `area` VALUES (2853, '阆中市', 334, 3);
INSERT INTO `area` VALUES (2854, '南部县', 334, 3);
INSERT INTO `area` VALUES (2855, '营山县', 334, 3);
INSERT INTO `area` VALUES (2856, '蓬安县', 334, 3);
INSERT INTO `area` VALUES (2857, '仪陇县', 334, 3);
INSERT INTO `area` VALUES (2858, '顺庆区', 334, 3);
INSERT INTO `area` VALUES (2859, '高坪区', 334, 3);
INSERT INTO `area` VALUES (2860, '嘉陵区', 334, 3);
INSERT INTO `area` VALUES (2861, '西充县', 334, 3);
INSERT INTO `area` VALUES (2862, '市中区', 335, 3);
INSERT INTO `area` VALUES (2863, '东兴区', 335, 3);
INSERT INTO `area` VALUES (2864, '威远县', 335, 3);
INSERT INTO `area` VALUES (2865, '资中县', 335, 3);
INSERT INTO `area` VALUES (2866, '隆昌县', 335, 3);
INSERT INTO `area` VALUES (2867, '东  区', 336, 3);
INSERT INTO `area` VALUES (2868, '西  区', 336, 3);
INSERT INTO `area` VALUES (2869, '仁和区', 336, 3);
INSERT INTO `area` VALUES (2870, '米易县', 336, 3);
INSERT INTO `area` VALUES (2871, '盐边县', 336, 3);
INSERT INTO `area` VALUES (2872, '船山区', 337, 3);
INSERT INTO `area` VALUES (2873, '安居区', 337, 3);
INSERT INTO `area` VALUES (2874, '蓬溪县', 337, 3);
INSERT INTO `area` VALUES (2875, '射洪县', 337, 3);
INSERT INTO `area` VALUES (2876, '大英县', 337, 3);
INSERT INTO `area` VALUES (2877, '雨城区', 338, 3);
INSERT INTO `area` VALUES (2878, '名山县', 338, 3);
INSERT INTO `area` VALUES (2879, '荥经县', 338, 3);
INSERT INTO `area` VALUES (2880, '汉源县', 338, 3);
INSERT INTO `area` VALUES (2881, '石棉县', 338, 3);
INSERT INTO `area` VALUES (2882, '天全县', 338, 3);
INSERT INTO `area` VALUES (2883, '芦山县', 338, 3);
INSERT INTO `area` VALUES (2884, '宝兴县', 338, 3);
INSERT INTO `area` VALUES (2885, '翠屏区', 339, 3);
INSERT INTO `area` VALUES (2886, '宜宾县', 339, 3);
INSERT INTO `area` VALUES (2887, '南溪县', 339, 3);
INSERT INTO `area` VALUES (2888, '江安县', 339, 3);
INSERT INTO `area` VALUES (2889, '长宁县', 339, 3);
INSERT INTO `area` VALUES (2890, '高县', 339, 3);
INSERT INTO `area` VALUES (2891, '珙县', 339, 3);
INSERT INTO `area` VALUES (2892, '筠连县', 339, 3);
INSERT INTO `area` VALUES (2893, '兴文县', 339, 3);
INSERT INTO `area` VALUES (2894, '屏山县', 339, 3);
INSERT INTO `area` VALUES (2895, '雁江区', 340, 3);
INSERT INTO `area` VALUES (2896, '简阳市', 340, 3);
INSERT INTO `area` VALUES (2897, '安岳县', 340, 3);
INSERT INTO `area` VALUES (2898, '乐至县', 340, 3);
INSERT INTO `area` VALUES (2899, '大安区', 341, 3);
INSERT INTO `area` VALUES (2900, '自流井区', 341, 3);
INSERT INTO `area` VALUES (2901, '贡井区', 341, 3);
INSERT INTO `area` VALUES (2902, '沿滩区', 341, 3);
INSERT INTO `area` VALUES (2903, '荣县', 341, 3);
INSERT INTO `area` VALUES (2904, '富顺县', 341, 3);
INSERT INTO `area` VALUES (2905, '江阳区', 342, 3);
INSERT INTO `area` VALUES (2906, '纳溪区', 342, 3);
INSERT INTO `area` VALUES (2907, '龙马潭区', 342, 3);
INSERT INTO `area` VALUES (2908, '泸县', 342, 3);
INSERT INTO `area` VALUES (2909, '合江县', 342, 3);
INSERT INTO `area` VALUES (2910, '叙永县', 342, 3);
INSERT INTO `area` VALUES (2911, '古蔺县', 342, 3);
INSERT INTO `area` VALUES (2912, '和平区', 343, 3);
INSERT INTO `area` VALUES (2913, '河西区', 343, 3);
INSERT INTO `area` VALUES (2914, '南开区', 343, 3);
INSERT INTO `area` VALUES (2915, '河北区', 343, 3);
INSERT INTO `area` VALUES (2916, '河东区', 343, 3);
INSERT INTO `area` VALUES (2917, '红桥区', 343, 3);
INSERT INTO `area` VALUES (2918, '东丽区', 343, 3);
INSERT INTO `area` VALUES (2919, '津南区', 343, 3);
INSERT INTO `area` VALUES (2920, '西青区', 343, 3);
INSERT INTO `area` VALUES (2921, '北辰区', 343, 3);
INSERT INTO `area` VALUES (2922, '塘沽区', 343, 3);
INSERT INTO `area` VALUES (2923, '汉沽区', 343, 3);
INSERT INTO `area` VALUES (2924, '大港区', 343, 3);
INSERT INTO `area` VALUES (2925, '武清区', 343, 3);
INSERT INTO `area` VALUES (2926, '宝坻区', 343, 3);
INSERT INTO `area` VALUES (2927, '经济开发区', 343, 3);
INSERT INTO `area` VALUES (2928, '宁河县', 343, 3);
INSERT INTO `area` VALUES (2929, '静海县', 343, 3);
INSERT INTO `area` VALUES (2930, '蓟县', 343, 3);
INSERT INTO `area` VALUES (2931, '城关区', 344, 3);
INSERT INTO `area` VALUES (2932, '林周县', 344, 3);
INSERT INTO `area` VALUES (2933, '当雄县', 344, 3);
INSERT INTO `area` VALUES (2934, '尼木县', 344, 3);
INSERT INTO `area` VALUES (2935, '曲水县', 344, 3);
INSERT INTO `area` VALUES (2936, '堆龙德庆县', 344, 3);
INSERT INTO `area` VALUES (2937, '达孜县', 344, 3);
INSERT INTO `area` VALUES (2938, '墨竹工卡县', 344, 3);
INSERT INTO `area` VALUES (2939, '噶尔县', 345, 3);
INSERT INTO `area` VALUES (2940, '普兰县', 345, 3);
INSERT INTO `area` VALUES (2941, '札达县', 345, 3);
INSERT INTO `area` VALUES (2942, '日土县', 345, 3);
INSERT INTO `area` VALUES (2943, '革吉县', 345, 3);
INSERT INTO `area` VALUES (2944, '改则县', 345, 3);
INSERT INTO `area` VALUES (2945, '措勤县', 345, 3);
INSERT INTO `area` VALUES (2946, '昌都县', 346, 3);
INSERT INTO `area` VALUES (2947, '江达县', 346, 3);
INSERT INTO `area` VALUES (2948, '贡觉县', 346, 3);
INSERT INTO `area` VALUES (2949, '类乌齐县', 346, 3);
INSERT INTO `area` VALUES (2950, '丁青县', 346, 3);
INSERT INTO `area` VALUES (2951, '察雅县', 346, 3);
INSERT INTO `area` VALUES (2952, '八宿县', 346, 3);
INSERT INTO `area` VALUES (2953, '左贡县', 346, 3);
INSERT INTO `area` VALUES (2954, '芒康县', 346, 3);
INSERT INTO `area` VALUES (2955, '洛隆县', 346, 3);
INSERT INTO `area` VALUES (2956, '边坝县', 346, 3);
INSERT INTO `area` VALUES (2957, '林芝县', 347, 3);
INSERT INTO `area` VALUES (2958, '工布江达县', 347, 3);
INSERT INTO `area` VALUES (2959, '米林县', 347, 3);
INSERT INTO `area` VALUES (2960, '墨脱县', 347, 3);
INSERT INTO `area` VALUES (2961, '波密县', 347, 3);
INSERT INTO `area` VALUES (2962, '察隅县', 347, 3);
INSERT INTO `area` VALUES (2963, '朗县', 347, 3);
INSERT INTO `area` VALUES (2964, '那曲县', 348, 3);
INSERT INTO `area` VALUES (2965, '嘉黎县', 348, 3);
INSERT INTO `area` VALUES (2966, '比如县', 348, 3);
INSERT INTO `area` VALUES (2967, '聂荣县', 348, 3);
INSERT INTO `area` VALUES (2968, '安多县', 348, 3);
INSERT INTO `area` VALUES (2969, '申扎县', 348, 3);
INSERT INTO `area` VALUES (2970, '索县', 348, 3);
INSERT INTO `area` VALUES (2971, '班戈县', 348, 3);
INSERT INTO `area` VALUES (2972, '巴青县', 348, 3);
INSERT INTO `area` VALUES (2973, '尼玛县', 348, 3);
INSERT INTO `area` VALUES (2974, '日喀则市', 349, 3);
INSERT INTO `area` VALUES (2975, '南木林县', 349, 3);
INSERT INTO `area` VALUES (2976, '江孜县', 349, 3);
INSERT INTO `area` VALUES (2977, '定日县', 349, 3);
INSERT INTO `area` VALUES (2978, '萨迦县', 349, 3);
INSERT INTO `area` VALUES (2979, '拉孜县', 349, 3);
INSERT INTO `area` VALUES (2980, '昂仁县', 349, 3);
INSERT INTO `area` VALUES (2981, '谢通门县', 349, 3);
INSERT INTO `area` VALUES (2982, '白朗县', 349, 3);
INSERT INTO `area` VALUES (2983, '仁布县', 349, 3);
INSERT INTO `area` VALUES (2984, '康马县', 349, 3);
INSERT INTO `area` VALUES (2985, '定结县', 349, 3);
INSERT INTO `area` VALUES (2986, '仲巴县', 349, 3);
INSERT INTO `area` VALUES (2987, '亚东县', 349, 3);
INSERT INTO `area` VALUES (2988, '吉隆县', 349, 3);
INSERT INTO `area` VALUES (2989, '聂拉木县', 349, 3);
INSERT INTO `area` VALUES (2990, '萨嘎县', 349, 3);
INSERT INTO `area` VALUES (2991, '岗巴县', 349, 3);
INSERT INTO `area` VALUES (2992, '乃东县', 350, 3);
INSERT INTO `area` VALUES (2993, '扎囊县', 350, 3);
INSERT INTO `area` VALUES (2994, '贡嘎县', 350, 3);
INSERT INTO `area` VALUES (2995, '桑日县', 350, 3);
INSERT INTO `area` VALUES (2996, '琼结县', 350, 3);
INSERT INTO `area` VALUES (2997, '曲松县', 350, 3);
INSERT INTO `area` VALUES (2998, '措美县', 350, 3);
INSERT INTO `area` VALUES (2999, '洛扎县', 350, 3);
INSERT INTO `area` VALUES (3000, '加查县', 350, 3);
INSERT INTO `area` VALUES (3001, '隆子县', 350, 3);
INSERT INTO `area` VALUES (3002, '错那县', 350, 3);
INSERT INTO `area` VALUES (3003, '浪卡子县', 350, 3);
INSERT INTO `area` VALUES (3004, '天山区', 351, 3);
INSERT INTO `area` VALUES (3005, '沙依巴克区', 351, 3);
INSERT INTO `area` VALUES (3006, '新市区', 351, 3);
INSERT INTO `area` VALUES (3007, '水磨沟区', 351, 3);
INSERT INTO `area` VALUES (3008, '头屯河区', 351, 3);
INSERT INTO `area` VALUES (3009, '达坂城区', 351, 3);
INSERT INTO `area` VALUES (3010, '米东区', 351, 3);
INSERT INTO `area` VALUES (3011, '乌鲁木齐县', 351, 3);
INSERT INTO `area` VALUES (3012, '阿克苏市', 352, 3);
INSERT INTO `area` VALUES (3013, '温宿县', 352, 3);
INSERT INTO `area` VALUES (3014, '库车县', 352, 3);
INSERT INTO `area` VALUES (3015, '沙雅县', 352, 3);
INSERT INTO `area` VALUES (3016, '新和县', 352, 3);
INSERT INTO `area` VALUES (3017, '拜城县', 352, 3);
INSERT INTO `area` VALUES (3018, '乌什县', 352, 3);
INSERT INTO `area` VALUES (3019, '阿瓦提县', 352, 3);
INSERT INTO `area` VALUES (3020, '柯坪县', 352, 3);
INSERT INTO `area` VALUES (3021, '阿拉尔市', 353, 3);
INSERT INTO `area` VALUES (3022, '库尔勒市', 354, 3);
INSERT INTO `area` VALUES (3023, '轮台县', 354, 3);
INSERT INTO `area` VALUES (3024, '尉犁县', 354, 3);
INSERT INTO `area` VALUES (3025, '若羌县', 354, 3);
INSERT INTO `area` VALUES (3026, '且末县', 354, 3);
INSERT INTO `area` VALUES (3027, '焉耆', 354, 3);
INSERT INTO `area` VALUES (3028, '和静县', 354, 3);
INSERT INTO `area` VALUES (3029, '和硕县', 354, 3);
INSERT INTO `area` VALUES (3030, '博湖县', 354, 3);
INSERT INTO `area` VALUES (3031, '博乐市', 355, 3);
INSERT INTO `area` VALUES (3032, '精河县', 355, 3);
INSERT INTO `area` VALUES (3033, '温泉县', 355, 3);
INSERT INTO `area` VALUES (3034, '呼图壁县', 356, 3);
INSERT INTO `area` VALUES (3035, '米泉市', 356, 3);
INSERT INTO `area` VALUES (3036, '昌吉市', 356, 3);
INSERT INTO `area` VALUES (3037, '阜康市', 356, 3);
INSERT INTO `area` VALUES (3038, '玛纳斯县', 356, 3);
INSERT INTO `area` VALUES (3039, '奇台县', 356, 3);
INSERT INTO `area` VALUES (3040, '吉木萨尔县', 356, 3);
INSERT INTO `area` VALUES (3041, '木垒', 356, 3);
INSERT INTO `area` VALUES (3042, '哈密市', 357, 3);
INSERT INTO `area` VALUES (3043, '伊吾县', 357, 3);
INSERT INTO `area` VALUES (3044, '巴里坤', 357, 3);
INSERT INTO `area` VALUES (3045, '和田市', 358, 3);
INSERT INTO `area` VALUES (3046, '和田县', 358, 3);
INSERT INTO `area` VALUES (3047, '墨玉县', 358, 3);
INSERT INTO `area` VALUES (3048, '皮山县', 358, 3);
INSERT INTO `area` VALUES (3049, '洛浦县', 358, 3);
INSERT INTO `area` VALUES (3050, '策勒县', 358, 3);
INSERT INTO `area` VALUES (3051, '于田县', 358, 3);
INSERT INTO `area` VALUES (3052, '民丰县', 358, 3);
INSERT INTO `area` VALUES (3053, '喀什市', 359, 3);
INSERT INTO `area` VALUES (3054, '疏附县', 359, 3);
INSERT INTO `area` VALUES (3055, '疏勒县', 359, 3);
INSERT INTO `area` VALUES (3056, '英吉沙县', 359, 3);
INSERT INTO `area` VALUES (3057, '泽普县', 359, 3);
INSERT INTO `area` VALUES (3058, '莎车县', 359, 3);
INSERT INTO `area` VALUES (3059, '叶城县', 359, 3);
INSERT INTO `area` VALUES (3060, '麦盖提县', 359, 3);
INSERT INTO `area` VALUES (3061, '岳普湖县', 359, 3);
INSERT INTO `area` VALUES (3062, '伽师县', 359, 3);
INSERT INTO `area` VALUES (3063, '巴楚县', 359, 3);
INSERT INTO `area` VALUES (3064, '塔什库尔干', 359, 3);
INSERT INTO `area` VALUES (3065, '克拉玛依市', 360, 3);
INSERT INTO `area` VALUES (3066, '阿图什市', 361, 3);
INSERT INTO `area` VALUES (3067, '阿克陶县', 361, 3);
INSERT INTO `area` VALUES (3068, '阿合奇县', 361, 3);
INSERT INTO `area` VALUES (3069, '乌恰县', 361, 3);
INSERT INTO `area` VALUES (3070, '石河子市', 362, 3);
INSERT INTO `area` VALUES (3071, '图木舒克市', 363, 3);
INSERT INTO `area` VALUES (3072, '吐鲁番市', 364, 3);
INSERT INTO `area` VALUES (3073, '鄯善县', 364, 3);
INSERT INTO `area` VALUES (3074, '托克逊县', 364, 3);
INSERT INTO `area` VALUES (3075, '五家渠市', 365, 3);
INSERT INTO `area` VALUES (3076, '阿勒泰市', 366, 3);
INSERT INTO `area` VALUES (3077, '布克赛尔', 366, 3);
INSERT INTO `area` VALUES (3078, '伊宁市', 366, 3);
INSERT INTO `area` VALUES (3079, '布尔津县', 366, 3);
INSERT INTO `area` VALUES (3080, '奎屯市', 366, 3);
INSERT INTO `area` VALUES (3081, '乌苏市', 366, 3);
INSERT INTO `area` VALUES (3082, '额敏县', 366, 3);
INSERT INTO `area` VALUES (3083, '富蕴县', 366, 3);
INSERT INTO `area` VALUES (3084, '伊宁县', 366, 3);
INSERT INTO `area` VALUES (3085, '福海县', 366, 3);
INSERT INTO `area` VALUES (3086, '霍城县', 366, 3);
INSERT INTO `area` VALUES (3087, '沙湾县', 366, 3);
INSERT INTO `area` VALUES (3088, '巩留县', 366, 3);
INSERT INTO `area` VALUES (3089, '哈巴河县', 366, 3);
INSERT INTO `area` VALUES (3090, '托里县', 366, 3);
INSERT INTO `area` VALUES (3091, '青河县', 366, 3);
INSERT INTO `area` VALUES (3092, '新源县', 366, 3);
INSERT INTO `area` VALUES (3093, '裕民县', 366, 3);
INSERT INTO `area` VALUES (3094, '和布克赛尔', 366, 3);
INSERT INTO `area` VALUES (3095, '吉木乃县', 366, 3);
INSERT INTO `area` VALUES (3096, '昭苏县', 366, 3);
INSERT INTO `area` VALUES (3097, '特克斯县', 366, 3);
INSERT INTO `area` VALUES (3098, '尼勒克县', 366, 3);
INSERT INTO `area` VALUES (3099, '察布查尔', 366, 3);
INSERT INTO `area` VALUES (3100, '盘龙区', 367, 3);
INSERT INTO `area` VALUES (3101, '五华区', 367, 3);
INSERT INTO `area` VALUES (3102, '官渡区', 367, 3);
INSERT INTO `area` VALUES (3103, '西山区', 367, 3);
INSERT INTO `area` VALUES (3104, '东川区', 367, 3);
INSERT INTO `area` VALUES (3105, '安宁市', 367, 3);
INSERT INTO `area` VALUES (3106, '呈贡县', 367, 3);
INSERT INTO `area` VALUES (3107, '晋宁县', 367, 3);
INSERT INTO `area` VALUES (3108, '富民县', 367, 3);
INSERT INTO `area` VALUES (3109, '宜良县', 367, 3);
INSERT INTO `area` VALUES (3110, '嵩明县', 367, 3);
INSERT INTO `area` VALUES (3111, '石林县', 367, 3);
INSERT INTO `area` VALUES (3112, '禄劝', 367, 3);
INSERT INTO `area` VALUES (3113, '寻甸', 367, 3);
INSERT INTO `area` VALUES (3114, '兰坪', 368, 3);
INSERT INTO `area` VALUES (3115, '泸水县', 368, 3);
INSERT INTO `area` VALUES (3116, '福贡县', 368, 3);
INSERT INTO `area` VALUES (3117, '贡山', 368, 3);
INSERT INTO `area` VALUES (3118, '宁洱', 369, 3);
INSERT INTO `area` VALUES (3119, '思茅区', 369, 3);
INSERT INTO `area` VALUES (3120, '墨江', 369, 3);
INSERT INTO `area` VALUES (3121, '景东', 369, 3);
INSERT INTO `area` VALUES (3122, '景谷', 369, 3);
INSERT INTO `area` VALUES (3123, '镇沅', 369, 3);
INSERT INTO `area` VALUES (3124, '江城', 369, 3);
INSERT INTO `area` VALUES (3125, '孟连', 369, 3);
INSERT INTO `area` VALUES (3126, '澜沧', 369, 3);
INSERT INTO `area` VALUES (3127, '西盟', 369, 3);
INSERT INTO `area` VALUES (3128, '古城区', 370, 3);
INSERT INTO `area` VALUES (3129, '宁蒗', 370, 3);
INSERT INTO `area` VALUES (3130, '玉龙', 370, 3);
INSERT INTO `area` VALUES (3131, '永胜县', 370, 3);
INSERT INTO `area` VALUES (3132, '华坪县', 370, 3);
INSERT INTO `area` VALUES (3133, '隆阳区', 371, 3);
INSERT INTO `area` VALUES (3134, '施甸县', 371, 3);
INSERT INTO `area` VALUES (3135, '腾冲县', 371, 3);
INSERT INTO `area` VALUES (3136, '龙陵县', 371, 3);
INSERT INTO `area` VALUES (3137, '昌宁县', 371, 3);
INSERT INTO `area` VALUES (3138, '楚雄市', 372, 3);
INSERT INTO `area` VALUES (3139, '双柏县', 372, 3);
INSERT INTO `area` VALUES (3140, '牟定县', 372, 3);
INSERT INTO `area` VALUES (3141, '南华县', 372, 3);
INSERT INTO `area` VALUES (3142, '姚安县', 372, 3);
INSERT INTO `area` VALUES (3143, '大姚县', 372, 3);
INSERT INTO `area` VALUES (3144, '永仁县', 372, 3);
INSERT INTO `area` VALUES (3145, '元谋县', 372, 3);
INSERT INTO `area` VALUES (3146, '武定县', 372, 3);
INSERT INTO `area` VALUES (3147, '禄丰县', 372, 3);
INSERT INTO `area` VALUES (3148, '大理市', 373, 3);
INSERT INTO `area` VALUES (3149, '祥云县', 373, 3);
INSERT INTO `area` VALUES (3150, '宾川县', 373, 3);
INSERT INTO `area` VALUES (3151, '弥渡县', 373, 3);
INSERT INTO `area` VALUES (3152, '永平县', 373, 3);
INSERT INTO `area` VALUES (3153, '云龙县', 373, 3);
INSERT INTO `area` VALUES (3154, '洱源县', 373, 3);
INSERT INTO `area` VALUES (3155, '剑川县', 373, 3);
INSERT INTO `area` VALUES (3156, '鹤庆县', 373, 3);
INSERT INTO `area` VALUES (3157, '漾濞', 373, 3);
INSERT INTO `area` VALUES (3158, '南涧', 373, 3);
INSERT INTO `area` VALUES (3159, '巍山', 373, 3);
INSERT INTO `area` VALUES (3160, '潞西市', 374, 3);
INSERT INTO `area` VALUES (3161, '瑞丽市', 374, 3);
INSERT INTO `area` VALUES (3162, '梁河县', 374, 3);
INSERT INTO `area` VALUES (3163, '盈江县', 374, 3);
INSERT INTO `area` VALUES (3164, '陇川县', 374, 3);
INSERT INTO `area` VALUES (3165, '香格里拉县', 375, 3);
INSERT INTO `area` VALUES (3166, '德钦县', 375, 3);
INSERT INTO `area` VALUES (3167, '维西', 375, 3);
INSERT INTO `area` VALUES (3168, '泸西县', 376, 3);
INSERT INTO `area` VALUES (3169, '蒙自县', 376, 3);
INSERT INTO `area` VALUES (3170, '个旧市', 376, 3);
INSERT INTO `area` VALUES (3171, '开远市', 376, 3);
INSERT INTO `area` VALUES (3172, '绿春县', 376, 3);
INSERT INTO `area` VALUES (3173, '建水县', 376, 3);
INSERT INTO `area` VALUES (3174, '石屏县', 376, 3);
INSERT INTO `area` VALUES (3175, '弥勒县', 376, 3);
INSERT INTO `area` VALUES (3176, '元阳县', 376, 3);
INSERT INTO `area` VALUES (3177, '红河县', 376, 3);
INSERT INTO `area` VALUES (3178, '金平', 376, 3);
INSERT INTO `area` VALUES (3179, '河口', 376, 3);
INSERT INTO `area` VALUES (3180, '屏边', 376, 3);
INSERT INTO `area` VALUES (3181, '临翔区', 377, 3);
INSERT INTO `area` VALUES (3182, '凤庆县', 377, 3);
INSERT INTO `area` VALUES (3183, '云县', 377, 3);
INSERT INTO `area` VALUES (3184, '永德县', 377, 3);
INSERT INTO `area` VALUES (3185, '镇康县', 377, 3);
INSERT INTO `area` VALUES (3186, '双江', 377, 3);
INSERT INTO `area` VALUES (3187, '耿马', 377, 3);
INSERT INTO `area` VALUES (3188, '沧源', 377, 3);
INSERT INTO `area` VALUES (3189, '麒麟区', 378, 3);
INSERT INTO `area` VALUES (3190, '宣威市', 378, 3);
INSERT INTO `area` VALUES (3191, '马龙县', 378, 3);
INSERT INTO `area` VALUES (3192, '陆良县', 378, 3);
INSERT INTO `area` VALUES (3193, '师宗县', 378, 3);
INSERT INTO `area` VALUES (3194, '罗平县', 378, 3);
INSERT INTO `area` VALUES (3195, '富源县', 378, 3);
INSERT INTO `area` VALUES (3196, '会泽县', 378, 3);
INSERT INTO `area` VALUES (3197, '沾益县', 378, 3);
INSERT INTO `area` VALUES (3198, '文山县', 379, 3);
INSERT INTO `area` VALUES (3199, '砚山县', 379, 3);
INSERT INTO `area` VALUES (3200, '西畴县', 379, 3);
INSERT INTO `area` VALUES (3201, '麻栗坡县', 379, 3);
INSERT INTO `area` VALUES (3202, '马关县', 379, 3);
INSERT INTO `area` VALUES (3203, '丘北县', 379, 3);
INSERT INTO `area` VALUES (3204, '广南县', 379, 3);
INSERT INTO `area` VALUES (3205, '富宁县', 379, 3);
INSERT INTO `area` VALUES (3206, '景洪市', 380, 3);
INSERT INTO `area` VALUES (3207, '勐海县', 380, 3);
INSERT INTO `area` VALUES (3208, '勐腊县', 380, 3);
INSERT INTO `area` VALUES (3209, '红塔区', 381, 3);
INSERT INTO `area` VALUES (3210, '江川县', 381, 3);
INSERT INTO `area` VALUES (3211, '澄江县', 381, 3);
INSERT INTO `area` VALUES (3212, '通海县', 381, 3);
INSERT INTO `area` VALUES (3213, '华宁县', 381, 3);
INSERT INTO `area` VALUES (3214, '易门县', 381, 3);
INSERT INTO `area` VALUES (3215, '峨山', 381, 3);
INSERT INTO `area` VALUES (3216, '新平', 381, 3);
INSERT INTO `area` VALUES (3217, '元江', 381, 3);
INSERT INTO `area` VALUES (3218, '昭阳区', 382, 3);
INSERT INTO `area` VALUES (3219, '鲁甸县', 382, 3);
INSERT INTO `area` VALUES (3220, '巧家县', 382, 3);
INSERT INTO `area` VALUES (3221, '盐津县', 382, 3);
INSERT INTO `area` VALUES (3222, '大关县', 382, 3);
INSERT INTO `area` VALUES (3223, '永善县', 382, 3);
INSERT INTO `area` VALUES (3224, '绥江县', 382, 3);
INSERT INTO `area` VALUES (3225, '镇雄县', 382, 3);
INSERT INTO `area` VALUES (3226, '彝良县', 382, 3);
INSERT INTO `area` VALUES (3227, '威信县', 382, 3);
INSERT INTO `area` VALUES (3228, '水富县', 382, 3);
INSERT INTO `area` VALUES (3229, '西湖区', 383, 3);
INSERT INTO `area` VALUES (3230, '上城区', 383, 3);
INSERT INTO `area` VALUES (3231, '下城区', 383, 3);
INSERT INTO `area` VALUES (3232, '拱墅区', 383, 3);
INSERT INTO `area` VALUES (3233, '滨江区', 383, 3);
INSERT INTO `area` VALUES (3234, '江干区', 383, 3);
INSERT INTO `area` VALUES (3235, '萧山区', 383, 3);
INSERT INTO `area` VALUES (3236, '余杭区', 383, 3);
INSERT INTO `area` VALUES (3237, '市郊', 383, 3);
INSERT INTO `area` VALUES (3238, '建德市', 383, 3);
INSERT INTO `area` VALUES (3239, '富阳市', 383, 3);
INSERT INTO `area` VALUES (3240, '临安市', 383, 3);
INSERT INTO `area` VALUES (3241, '桐庐县', 383, 3);
INSERT INTO `area` VALUES (3242, '淳安县', 383, 3);
INSERT INTO `area` VALUES (3243, '吴兴区', 384, 3);
INSERT INTO `area` VALUES (3244, '南浔区', 384, 3);
INSERT INTO `area` VALUES (3245, '德清县', 384, 3);
INSERT INTO `area` VALUES (3246, '长兴县', 384, 3);
INSERT INTO `area` VALUES (3247, '安吉县', 384, 3);
INSERT INTO `area` VALUES (3248, '南湖区', 385, 3);
INSERT INTO `area` VALUES (3249, '秀洲区', 385, 3);
INSERT INTO `area` VALUES (3250, '海宁市', 385, 3);
INSERT INTO `area` VALUES (3251, '嘉善县', 385, 3);
INSERT INTO `area` VALUES (3252, '平湖市', 385, 3);
INSERT INTO `area` VALUES (3253, '桐乡市', 385, 3);
INSERT INTO `area` VALUES (3254, '海盐县', 385, 3);
INSERT INTO `area` VALUES (3255, '婺城区', 386, 3);
INSERT INTO `area` VALUES (3256, '金东区', 386, 3);
INSERT INTO `area` VALUES (3257, '兰溪市', 386, 3);
INSERT INTO `area` VALUES (3258, '市区', 386, 3);
INSERT INTO `area` VALUES (3259, '佛堂镇', 386, 3);
INSERT INTO `area` VALUES (3260, '上溪镇', 386, 3);
INSERT INTO `area` VALUES (3261, '义亭镇', 386, 3);
INSERT INTO `area` VALUES (3262, '大陈镇', 386, 3);
INSERT INTO `area` VALUES (3263, '苏溪镇', 386, 3);
INSERT INTO `area` VALUES (3264, '赤岸镇', 386, 3);
INSERT INTO `area` VALUES (3265, '东阳市', 386, 3);
INSERT INTO `area` VALUES (3266, '永康市', 386, 3);
INSERT INTO `area` VALUES (3267, '武义县', 386, 3);
INSERT INTO `area` VALUES (3268, '浦江县', 386, 3);
INSERT INTO `area` VALUES (3269, '磐安县', 386, 3);
INSERT INTO `area` VALUES (3270, '莲都区', 387, 3);
INSERT INTO `area` VALUES (3271, '龙泉市', 387, 3);
INSERT INTO `area` VALUES (3272, '青田县', 387, 3);
INSERT INTO `area` VALUES (3273, '缙云县', 387, 3);
INSERT INTO `area` VALUES (3274, '遂昌县', 387, 3);
INSERT INTO `area` VALUES (3275, '松阳县', 387, 3);
INSERT INTO `area` VALUES (3276, '云和县', 387, 3);
INSERT INTO `area` VALUES (3277, '庆元县', 387, 3);
INSERT INTO `area` VALUES (3278, '景宁', 387, 3);
INSERT INTO `area` VALUES (3279, '海曙区', 388, 3);
INSERT INTO `area` VALUES (3280, '江东区', 388, 3);
INSERT INTO `area` VALUES (3281, '江北区', 388, 3);
INSERT INTO `area` VALUES (3282, '镇海区', 388, 3);
INSERT INTO `area` VALUES (3283, '北仑区', 388, 3);
INSERT INTO `area` VALUES (3284, '鄞州区', 388, 3);
INSERT INTO `area` VALUES (3285, '余姚市', 388, 3);
INSERT INTO `area` VALUES (3286, '慈溪市', 388, 3);
INSERT INTO `area` VALUES (3287, '奉化市', 388, 3);
INSERT INTO `area` VALUES (3288, '象山县', 388, 3);
INSERT INTO `area` VALUES (3289, '宁海县', 388, 3);
INSERT INTO `area` VALUES (3290, '越城区', 389, 3);
INSERT INTO `area` VALUES (3291, '上虞市', 389, 3);
INSERT INTO `area` VALUES (3292, '嵊州市', 389, 3);
INSERT INTO `area` VALUES (3293, '绍兴县', 389, 3);
INSERT INTO `area` VALUES (3294, '新昌县', 389, 3);
INSERT INTO `area` VALUES (3295, '诸暨市', 389, 3);
INSERT INTO `area` VALUES (3296, '椒江区', 390, 3);
INSERT INTO `area` VALUES (3297, '黄岩区', 390, 3);
INSERT INTO `area` VALUES (3298, '路桥区', 390, 3);
INSERT INTO `area` VALUES (3299, '温岭市', 390, 3);
INSERT INTO `area` VALUES (3300, '临海市', 390, 3);
INSERT INTO `area` VALUES (3301, '玉环县', 390, 3);
INSERT INTO `area` VALUES (3302, '三门县', 390, 3);
INSERT INTO `area` VALUES (3303, '天台县', 390, 3);
INSERT INTO `area` VALUES (3304, '仙居县', 390, 3);
INSERT INTO `area` VALUES (3305, '鹿城区', 391, 3);
INSERT INTO `area` VALUES (3306, '龙湾区', 391, 3);
INSERT INTO `area` VALUES (3307, '瓯海区', 391, 3);
INSERT INTO `area` VALUES (3308, '瑞安市', 391, 3);
INSERT INTO `area` VALUES (3309, '乐清市', 391, 3);
INSERT INTO `area` VALUES (3310, '洞头县', 391, 3);
INSERT INTO `area` VALUES (3311, '永嘉县', 391, 3);
INSERT INTO `area` VALUES (3312, '平阳县', 391, 3);
INSERT INTO `area` VALUES (3313, '苍南县', 391, 3);
INSERT INTO `area` VALUES (3314, '文成县', 391, 3);
INSERT INTO `area` VALUES (3315, '泰顺县', 391, 3);
INSERT INTO `area` VALUES (3316, '定海区', 392, 3);
INSERT INTO `area` VALUES (3317, '普陀区', 392, 3);
INSERT INTO `area` VALUES (3318, '岱山县', 392, 3);
INSERT INTO `area` VALUES (3319, '嵊泗县', 392, 3);
INSERT INTO `area` VALUES (3320, '衢州市', 393, 3);
INSERT INTO `area` VALUES (3321, '江山市', 393, 3);
INSERT INTO `area` VALUES (3322, '常山县', 393, 3);
INSERT INTO `area` VALUES (3323, '开化县', 393, 3);
INSERT INTO `area` VALUES (3324, '龙游县', 393, 3);
INSERT INTO `area` VALUES (3325, '合川区', 394, 3);
INSERT INTO `area` VALUES (3326, '江津区', 394, 3);
INSERT INTO `area` VALUES (3327, '南川区', 394, 3);
INSERT INTO `area` VALUES (3328, '永川区', 394, 3);
INSERT INTO `area` VALUES (3329, '南岸区', 394, 3);
INSERT INTO `area` VALUES (3330, '渝北区', 394, 3);
INSERT INTO `area` VALUES (3331, '万盛区', 394, 3);
INSERT INTO `area` VALUES (3332, '大渡口区', 394, 3);
INSERT INTO `area` VALUES (3333, '万州区', 394, 3);
INSERT INTO `area` VALUES (3334, '北碚区', 394, 3);
INSERT INTO `area` VALUES (3335, '沙坪坝区', 394, 3);
INSERT INTO `area` VALUES (3336, '巴南区', 394, 3);
INSERT INTO `area` VALUES (3337, '涪陵区', 394, 3);
INSERT INTO `area` VALUES (3338, '江北区', 394, 3);
INSERT INTO `area` VALUES (3339, '九龙坡区', 394, 3);
INSERT INTO `area` VALUES (3340, '渝中区', 394, 3);
INSERT INTO `area` VALUES (3341, '黔江开发区', 394, 3);
INSERT INTO `area` VALUES (3342, '长寿区', 394, 3);
INSERT INTO `area` VALUES (3343, '双桥区', 394, 3);
INSERT INTO `area` VALUES (3344, '綦江县', 394, 3);
INSERT INTO `area` VALUES (3345, '潼南县', 394, 3);
INSERT INTO `area` VALUES (3346, '铜梁县', 394, 3);
INSERT INTO `area` VALUES (3347, '大足县', 394, 3);
INSERT INTO `area` VALUES (3348, '荣昌县', 394, 3);
INSERT INTO `area` VALUES (3349, '璧山县', 394, 3);
INSERT INTO `area` VALUES (3350, '垫江县', 394, 3);
INSERT INTO `area` VALUES (3351, '武隆县', 394, 3);
INSERT INTO `area` VALUES (3352, '丰都县', 394, 3);
INSERT INTO `area` VALUES (3353, '城口县', 394, 3);
INSERT INTO `area` VALUES (3354, '梁平县', 394, 3);
INSERT INTO `area` VALUES (3355, '开县', 394, 3);
INSERT INTO `area` VALUES (3356, '巫溪县', 394, 3);
INSERT INTO `area` VALUES (3357, '巫山县', 394, 3);
INSERT INTO `area` VALUES (3358, '奉节县', 394, 3);
INSERT INTO `area` VALUES (3359, '云阳县', 394, 3);
INSERT INTO `area` VALUES (3360, '忠县', 394, 3);
INSERT INTO `area` VALUES (3361, '石柱', 394, 3);
INSERT INTO `area` VALUES (3362, '彭水', 394, 3);
INSERT INTO `area` VALUES (3363, '酉阳', 394, 3);
INSERT INTO `area` VALUES (3364, '秀山', 394, 3);
INSERT INTO `area` VALUES (3365, '沙田区', 395, 3);
INSERT INTO `area` VALUES (3366, '东区', 395, 3);
INSERT INTO `area` VALUES (3367, '观塘区', 395, 3);
INSERT INTO `area` VALUES (3368, '黄大仙区', 395, 3);
INSERT INTO `area` VALUES (3369, '九龙城区', 395, 3);
INSERT INTO `area` VALUES (3370, '屯门区', 395, 3);
INSERT INTO `area` VALUES (3371, '葵青区', 395, 3);
INSERT INTO `area` VALUES (3372, '元朗区', 395, 3);
INSERT INTO `area` VALUES (3373, '深水埗区', 395, 3);
INSERT INTO `area` VALUES (3374, '西贡区', 395, 3);
INSERT INTO `area` VALUES (3375, '大埔区', 395, 3);
INSERT INTO `area` VALUES (3376, '湾仔区', 395, 3);
INSERT INTO `area` VALUES (3377, '油尖旺区', 395, 3);
INSERT INTO `area` VALUES (3378, '北区', 395, 3);
INSERT INTO `area` VALUES (3379, '南区', 395, 3);
INSERT INTO `area` VALUES (3380, '荃湾区', 395, 3);
INSERT INTO `area` VALUES (3381, '中西区', 395, 3);
INSERT INTO `area` VALUES (3382, '离岛区', 395, 3);
INSERT INTO `area` VALUES (3383, '澳门', 396, 3);
INSERT INTO `area` VALUES (3384, '台北', 397, 3);
INSERT INTO `area` VALUES (3385, '高雄', 397, 3);
INSERT INTO `area` VALUES (3386, '基隆', 397, 3);
INSERT INTO `area` VALUES (3387, '台中', 397, 3);
INSERT INTO `area` VALUES (3388, '台南', 397, 3);
INSERT INTO `area` VALUES (3389, '新竹', 397, 3);
INSERT INTO `area` VALUES (3390, '嘉义', 397, 3);
INSERT INTO `area` VALUES (3391, '宜兰县', 397, 3);
INSERT INTO `area` VALUES (3392, '桃园县', 397, 3);
INSERT INTO `area` VALUES (3393, '苗栗县', 397, 3);
INSERT INTO `area` VALUES (3394, '彰化县', 397, 3);
INSERT INTO `area` VALUES (3395, '南投县', 397, 3);
INSERT INTO `area` VALUES (3396, '云林县', 397, 3);
INSERT INTO `area` VALUES (3397, '屏东县', 397, 3);
INSERT INTO `area` VALUES (3398, '台东县', 397, 3);
INSERT INTO `area` VALUES (3399, '花莲县', 397, 3);
INSERT INTO `area` VALUES (3400, '澎湖县', 397, 3);
INSERT INTO `area` VALUES (3401, '合肥', 3, 2);
INSERT INTO `area` VALUES (3402, '庐阳区', 3401, 3);
INSERT INTO `area` VALUES (3403, '瑶海区', 3401, 3);
INSERT INTO `area` VALUES (3404, '蜀山区', 3401, 3);
INSERT INTO `area` VALUES (3405, '包河区', 3401, 3);
INSERT INTO `area` VALUES (3406, '长丰县', 3401, 3);
INSERT INTO `area` VALUES (3407, '肥东县', 3401, 3);
INSERT INTO `area` VALUES (3408, '肥西县', 3401, 3);
INSERT INTO `area` VALUES (3410, '朝阳区', 2, 2);

-- ----------------------------
-- Table structure for area_city
-- ----------------------------
DROP TABLE IF EXISTS `area_city`;
CREATE TABLE `area_city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `code` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父级编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地区城市' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area_city
-- ----------------------------
INSERT INTO `area_city` VALUES (1, '中国', '0');
INSERT INTO `area_city` VALUES (2, '直辖市', '1');
INSERT INTO `area_city` VALUES (3, '安徽', '1');
INSERT INTO `area_city` VALUES (4, '福建', '1');
INSERT INTO `area_city` VALUES (5, '甘肃', '1');
INSERT INTO `area_city` VALUES (6, '广东', '1');
INSERT INTO `area_city` VALUES (7, '广西', '1');
INSERT INTO `area_city` VALUES (8, '贵州', '1');
INSERT INTO `area_city` VALUES (9, '海南', '1');
INSERT INTO `area_city` VALUES (10, '河北', '1');
INSERT INTO `area_city` VALUES (11, '河南', '1');
INSERT INTO `area_city` VALUES (12, '黑龙江', '1');
INSERT INTO `area_city` VALUES (13, '湖北', '1');
INSERT INTO `area_city` VALUES (14, '湖南', '1');
INSERT INTO `area_city` VALUES (15, '吉林', '1');
INSERT INTO `area_city` VALUES (16, '江苏', '1');
INSERT INTO `area_city` VALUES (17, '江西', '1');
INSERT INTO `area_city` VALUES (18, '辽宁', '1');
INSERT INTO `area_city` VALUES (19, '内蒙古', '1');
INSERT INTO `area_city` VALUES (20, '宁夏', '1');
INSERT INTO `area_city` VALUES (21, '青海', '1');
INSERT INTO `area_city` VALUES (22, '山东', '1');
INSERT INTO `area_city` VALUES (23, '山西', '1');
INSERT INTO `area_city` VALUES (24, '陕西', '1');
INSERT INTO `area_city` VALUES (25, '上海', '2');
INSERT INTO `area_city` VALUES (26, '四川', '1');
INSERT INTO `area_city` VALUES (27, '天津', '2');
INSERT INTO `area_city` VALUES (28, '西藏', '1');
INSERT INTO `area_city` VALUES (29, '新疆', '1');
INSERT INTO `area_city` VALUES (30, '云南', '1');
INSERT INTO `area_city` VALUES (31, '浙江', '1');
INSERT INTO `area_city` VALUES (32, '重庆', '2');
INSERT INTO `area_city` VALUES (33, '香港', '1');
INSERT INTO `area_city` VALUES (34, '澳门', '1');
INSERT INTO `area_city` VALUES (35, '台湾', '1');

-- ----------------------------
-- Table structure for data_login
-- ----------------------------
DROP TABLE IF EXISTS `data_login`;
CREATE TABLE `data_login`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date NULL DEFAULT NULL COMMENT '日期',
  `num` int(11) NULL DEFAULT NULL COMMENT '每日活跃数',
  `num1` int(11) NULL DEFAULT NULL COMMENT '每日登录数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_login
-- ----------------------------
INSERT INTO `data_login` VALUES (1, '2016-02-01', 50, 30);
INSERT INTO `data_login` VALUES (2, '2016-02-02', 55, 33);
INSERT INTO `data_login` VALUES (3, '2016-02-03', 60, 34);
INSERT INTO `data_login` VALUES (4, '2016-02-04', 65, 35);
INSERT INTO `data_login` VALUES (5, '2016-02-05', 70, 36);
INSERT INTO `data_login` VALUES (6, '2016-02-06', 75, 37);
INSERT INTO `data_login` VALUES (7, '2016-02-07', 80, 38);
INSERT INTO `data_login` VALUES (8, '2016-02-08', 85, 39);
INSERT INTO `data_login` VALUES (9, '2016-02-09', 90, 40);
INSERT INTO `data_login` VALUES (10, '2016-02-10', 95, 41);
INSERT INTO `data_login` VALUES (11, '2016-02-11', 100, 42);
INSERT INTO `data_login` VALUES (12, '2016-02-12', 105, 43);
INSERT INTO `data_login` VALUES (13, '2016-02-13', 110, 44);
INSERT INTO `data_login` VALUES (14, '2016-02-14', 115, 45);
INSERT INTO `data_login` VALUES (15, '2016-02-15', 120, 46);
INSERT INTO `data_login` VALUES (16, '2016-02-16', 125, 47);
INSERT INTO `data_login` VALUES (17, '2016-02-17', 130, 48);
INSERT INTO `data_login` VALUES (18, '2016-02-18', 135, 49);
INSERT INTO `data_login` VALUES (19, '2016-02-19', 140, 50);
INSERT INTO `data_login` VALUES (20, '2016-02-20', 145, 51);

-- ----------------------------
-- Table structure for data_money
-- ----------------------------
DROP TABLE IF EXISTS `data_money`;
CREATE TABLE `data_money`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moon` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月份',
  `num` int(11) NULL DEFAULT NULL COMMENT '手机销售额',
  `num1` int(11) NULL DEFAULT NULL COMMENT '电脑销售额',
  `num2` int(11) NULL DEFAULT NULL COMMENT '避孕套销售额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_money
-- ----------------------------
INSERT INTO `data_money` VALUES (3, '333', 33, 20000, 48000);
INSERT INTO `data_money` VALUES (6, '6月', 60000, 10000, 45000);
INSERT INTO `data_money` VALUES (8, '8月', 80000, 20000, 43000);
INSERT INTO `data_money` VALUES (9, '9月', 90000, 25000, 42000);
INSERT INTO `data_money` VALUES (10, '10月', 100000, 30000, 41000);

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `Sexy` int(11) NULL DEFAULT NULL COMMENT '性别：1=男，0=女',
  `Mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `Remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `Create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `tag1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '喜好1',
  `tag2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '喜好2',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `avatar` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `file` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件',
  `Relation_pro` int(11) NULL DEFAULT NULL COMMENT '产品',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo
-- ----------------------------
INSERT INTO `demo` VALUES (1, '赵金', 0, 'eova', '', '2018-06-27 18:14:34', '2018-06-27 18:16:27', '', '', '000000', '/upload/1530458859854.png', '/upload/1530458864160.pptx', 29);
INSERT INTO `demo` VALUES (2, '赵金2', 1, '1801470070', 'this is a。。。', '2018-06-27 18:16:17', '2018-06-27 18:18:09', '0', '0,1', '000000', '/upload/1530094526617.jpg', '/upload/1530094529530.jpg', 28);

-- ----------------------------
-- Table structure for demo2
-- ----------------------------
DROP TABLE IF EXISTS `demo2`;
CREATE TABLE `demo2`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `Sexy` int(11) NULL DEFAULT NULL COMMENT '性别：1=男，0=女',
  `Mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `Remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `Create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `tag1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '喜好1',
  `tag2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '喜好2',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `avatar` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `file` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件',
  `Relation_pro` int(11) NULL DEFAULT NULL COMMENT '产品',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo2
-- ----------------------------
INSERT INTO `demo2` VALUES (2, '赵金3', 0, '111125', '<p><span style=\"text-align: center;\">备注</span></p>', '2018-06-29 18:29:26', '2018-06-29 18:31:21', '1', '2,3', '123123', '/upload/1530268150126.png', '/upload/1530268162411.ppt', 30, 1);
INSERT INTO `demo2` VALUES (3, '赵金3', 1, '123', '', '2018-06-29 18:40:05', '2018-06-29 18:41:59', '0', '0', '123123', '/upload/1530268796824.png', '/upload/1530268800830.pptx', 29, 1);
INSERT INTO `demo2` VALUES (5, '赵金X', NULL, '11111', '<p><span style=\"text-align: center;\">备注</span></p>', '2018-06-29 20:48:35', '2018-06-29 20:50:29', '0', '0', '123456', '', '', NULL, 0);
INSERT INTO `demo2` VALUES (6, '赵金10', 1, '18014700708', '<p>备注18014700708</p>', '2018-06-29 20:49:33', '2018-06-29 20:51:27', '0', '', '123456', '/upload/1530276562897.png', '/upload/1530276566198.png', 28, 0);
INSERT INTO `demo2` VALUES (7, '', 0, '', '', '2018-07-02 14:14:55', '2018-07-02 14:14:55', '', '', '', '/upload/1530512093490.jpg', '', 0, 1);
INSERT INTO `demo2` VALUES (8, '', 0, '', '', '2018-07-02 14:15:11', '2018-07-02 14:15:11', '', '', '', '', '', 0, 1);
INSERT INTO `demo2` VALUES (9, '', NULL, '', '', '2018-07-02 14:20:00', '2018-07-02 14:20:00', '', '', '', '', '', NULL, 1);
INSERT INTO `demo2` VALUES (10, '', NULL, '', '', '2018-07-04 16:39:47', '2018-07-04 16:39:47', '', '', '', '', '', NULL, 1);
INSERT INTO `demo2` VALUES (11, '陈春波', 1, '15957514517', '', '2018-07-07 14:06:53', '2018-07-07 14:06:53', '2', '0,1,2,3', '123456', '/upload/1532165765249.jpg', '/upload/1532165720463.jpg', 28, 1);
INSERT INTO `demo2` VALUES (12, '', NULL, '', '<img src=\"http://pbsacitgr.bkt.clouddn.com/222950qk2n2x04fcxh8yc_1535035941050.jpg\" _src=\"http://pbsacitgr.bkt.clouddn.com/222950qk2n2x04fcxh8yc_1535035941050.jpg\"/><p><br/></p>', '2018-07-21 23:18:51', '2018-07-21 23:18:51', '', '', '', '', '', NULL, 1);

-- ----------------------------
-- Table structure for demo2_test
-- ----------------------------
DROP TABLE IF EXISTS `demo2_test`;
CREATE TABLE `demo2_test`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `Sexy` int(11) NULL DEFAULT NULL COMMENT '性别：1=男，0=女',
  `Mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `Remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `Create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `tag1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '喜好1',
  `tag2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '喜好2',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `avatar` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `file` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件',
  `Relation_pro` int(11) NULL DEFAULT NULL COMMENT '产品',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '是否有效',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '省',
  `c_id` int(11) NULL DEFAULT NULL COMMENT '市',
  `a_id` int(11) NULL DEFAULT NULL COMMENT '区',
  `shenhe_status` int(11) NULL DEFAULT NULL COMMENT '审核状态：1-未审核,2-审核通过,3-驳回',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人',
  `depart_id` int(11) NULL DEFAULT NULL COMMENT '部门',
  `file_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件文件名',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo2_test
-- ----------------------------
INSERT INTO `demo2_test` VALUES (2, '赵金2', 1, 'eova', '八辈祖宗', '2018-07-01 22:01:59', '2018-07-01 22:03:56', '2,3', '3', '123456', '/upload/1530453702015.png', '/upload/1530453705625.pptx', 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (3, '金', 1, '111', '111', '2018-07-05 15:12:43', '2018-07-05 15:14:46', '', '0', '000000', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (4, '照', NULL, 'eova', '', '2018-07-05 15:13:07', '2018-07-05 15:15:10', '2', '2', '000000', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (5, 'king', 0, 'eova', '', '2018-07-05 15:16:59', '2018-07-05 15:19:02', '', '', '000000', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (6, 'king', 0, 'eova', '', '2018-07-05 15:22:06', '2018-07-05 15:24:09', '', '', '000000', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (7, 'king', 0, 'eova', '', '2018-07-05 17:08:33', '2018-07-05 17:10:36', '', '', '000000', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (8, 'king', 0, 'eova', '', '2018-07-05 17:08:50', '2018-07-05 17:10:53', '', '', '000000', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (9, 'king', 0, 'eova', '', '2018-07-05 17:10:24', '2018-07-05 17:13:22', '', '', '000000', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (10, 'king', 0, 'eova', '', '2018-07-05 17:12:32', '2018-07-05 17:14:39', '', '', '000000', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (11, 'king', 0, 'eova', '', '2018-07-05 17:14:31', '2018-07-05 17:16:34', '', '', '000000', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (13, 'zj', 1, '18014700709', '', '2018-07-30 16:45:09', '2018-07-30 16:45:10', '0', '1', '000000', '/upload/1532953189987.jpg', '/upload/1532953192260.jpg', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (14, 'eova', NULL, NULL, '', '2018-08-02 17:58:19', '2018-08-02 17:58:19', '0,1', '0', '000000', '/upload/1533203883250.png', '/upload/1533203819225.doc', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (15, 'zj85', NULL, NULL, NULL, '2018-08-05 18:48:07', '2018-08-05 18:48:06', '0', '0', '000000', '/upload/1533466057749.jpg', '/upload/1533466086125.png', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (16, 'jj', NULL, NULL, NULL, '2018-08-07 11:27:43', '2018-08-07 11:27:43', '0', '0', '111111', '/upload/1533612400510.jpg', '/upload/1533612404973.doc', 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (17, '赵金', NULL, NULL, NULL, '2018-08-07 11:28:33', '2018-08-07 11:28:33', '0', '0', '123456', '/upload/1533612494377.jpg', '/upload/1533612512983.docx', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (18, 'zj', NULL, NULL, NULL, '2018-08-07 18:52:04', '2018-08-07 18:52:04', '0', '0', '111111', '/upload/1533639107398.jpg', '/upload/1533639114094.jpg', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (19, 'zj7', NULL, NULL, NULL, '2018-08-07 19:04:30', '2018-08-07 19:04:32', '0', '0', '000000', '/upload/1533639847394.jpg', '/upload/1533639854923.jpg', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (20, 'eova', NULL, '', '', '2018-08-08 17:02:57', '2018-08-08 17:02:57', NULL, '0', '000000', '/upload/1533718971282.jpg', '/upload/1533718976463.jpg', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (21, 'eova', NULL, '', '', '2018-08-08 17:02:59', '2018-08-08 17:02:59', NULL, '0', '000000', '/upload/1533718971282.jpg', '/upload/1533718976463.jpg', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (22, 'eova', NULL, '', '', '2018-08-08 17:02:59', '2018-08-08 17:02:59', NULL, '0', '000000', '/upload/1533718971282.jpg', '/upload/1533718976463.jpg', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (23, 'eova', NULL, '', '', '2018-08-08 17:02:59', '2018-08-08 17:02:59', NULL, '0', '000000', '/upload/1533718971282.jpg', '/upload/1533718976463.jpg', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (24, 'eova', NULL, '', '', '2018-08-08 17:02:59', '2018-08-08 17:02:59', NULL, '0', '000000', '/upload/1533718971282.jpg', '/upload/1533718976463.jpg', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (26, 'eova', NULL, '', '', '2018-08-08 17:02:59', '2018-08-08 17:03:00', NULL, '0', '000000', '/upload/1533718971282.jpg', '/upload/1533718976463.jpg', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (27, 'eova', NULL, '', '', '2018-08-08 17:03:10', '2018-08-08 17:03:10', NULL, '0', '000000', '/upload/1533718971282.jpg', '/upload/1533718976463.jpg', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (28, '0808', 1, '123', '123dddddddddddddddddddddd', '2018-08-08 17:03:58', '2018-08-08 17:03:58', NULL, '0', '000000', 'http://pbsacitgr.bkt.clouddn.com/未标题-_1534916654220.png', '/upload/1533719030649.jpg', 29, 1, 810, 811, 812, 3, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (29, 'mmm', 0, '222222', '121212112111', '2018-08-27 14:03:12', '2018-08-27 14:03:12', '0,1', '2', '12121212', 'http://pbsacitgr.bkt.clouddn.com/_1535349763655.jpg', 'http://pbsacitgr.bkt.clouddn.com/_1535349774996.jpg', 33, 1, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (31, 'eova2', NULL, '', '', '2018-09-06 19:38:01', '2018-12-22 00:08:36', '2', '2', '000000', 'http://pbsacitgr.bkt.clouddn.com/未标题-_1536233872205.png', 'http://pbsacitgr.bkt.clouddn.com/未标题-_1536233878120.jpg', 29, 1, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (33, 'zj913', NULL, '', '', '2018-09-13 23:03:46', '2019-06-19 11:49:11', '0', '0', '000000', 'http://pbsacitgr.bkt.clouddn.com/_1536850996795.png', 'http://pbsacitgr.bkt.clouddn.com/_1536851001217.png', 33, 1, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (35, 'zj913', NULL, '', '', '2018-09-13 23:03:47', '2019-07-17 11:10:32', '0', '0', '000000', 'http://pbsacitgr.bkt.clouddn.com/_1546173859055.png', 'http://img.bblocks.cn/706cc02a16274d1e9f7090c2a00035fe.ppt', 33, 1, NULL, NULL, NULL, 3, 1, NULL, '3.1图形的旋转--0917.ppt', NULL);
INSERT INTO `demo2_test` VALUES (38, 'zj91313', 1, '18014700708', '<p><span style=', '2018-09-13 23:03:48', '2020-03-18 10:20:01', '0', '0', '000000', 'http://pbsacitgr.bkt.clouddn.com/_1536850996795.png', 'http://pbsacitgr.bkt.clouddn.com/_1536851001217.png', 4, 0, 19, 20, 21, 1, 1, 73, NULL, NULL);
INSERT INTO `demo2_test` VALUES (54, '赵金0323', 0, '18014700000', '<p style=\"margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial;\"><span class=\"bjh-p\" style=\"display: block;\">全职猎人中的凯特戏份并不多，不过却是出场最早的角色之一，再加上实力很强，所以人气并不低。而在蚁王篇中，却早早领了盒饭，被猫女杀掉，甚至成为小杰黑化暴走的直接原因。不过之后却再次复活，化身为一个小女孩，然而剧情中并没有做过多的解释，所以凯特身上的疑点还是有很多的。</span></p><p style=\"margin-top: 26px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial;\"><span class=\"bjh-p\" style=\"display: block;\"></span></p><div class=\"img-container\" style=\"margin-top: 30px; font-family: arial; text-align: start;\"><img src=\"http://img.bblocks.cn/5d14ba6037224cc4b1d2b5b7b69d4f42.jpg\" style=\"width: 958px;\"><br></div>', '2020-03-23 17:44:54', '2020-03-24 11:08:58', '0,1', '0', '000000', 'http://img.bblocks.cn/b1eebf60716644609874a7689ec54a1e.jpg', 'http://h.bblocks.cn/000000.pdf', 4, 0, 1, 2, 3, 2, 1, 71, '', NULL);
INSERT INTO `demo2_test` VALUES (55, '照', 0, '18014700001', '<p style=\"margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial;\"><span class=\"bjh-p\" style=\"display: block;\"><span class=\"bjh-strong\" style=\"font-size: 18px; font-weight: 700;\">中央明确：以武汉为主战场的全国本土疫情传播基本阻断</span></span></p><p style=\"margin-top: 22px; margin-bottom: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial;\"><span class=\"bjh-p\" style=\"display: block;\">23日，中央应对新冠肺炎疫情工作领导小组召开会议，部署“外防输入、内防反弹”和有序推进复工复产相关措施。</span></p>', '2020-03-24 15:15:39', '2020-03-24 15:15:41', '1,2', '1', '', 'http://img.bblocks.cn/a42281bf1e9241de9cd7297f0c684fcc.jpg', 'http://img.bblocks.cn/2ea40a417d114c949497f4f1823aff39.xlsx', 4, 1, 37, 61, 63, 1, 1, 72, '', NULL);
INSERT INTO `demo2_test` VALUES (56, '照2', 0, '18014700002', '<h2 style=\"margin-top: 0px; margin-bottom: 0px; border-width: 0px; border-style: initial; font-weight: bold; font-size: 18px; color: rgb(63, 63, 63); font-family: 微软雅黑; background-color: rgb(253, 252, 248);\">实例</h2><h2 style=\"margin-top: 0px; margin-bottom: 0px; border-width: 0px; border-style: initial; font-weight: bold; font-size: 18px; color: rgb(63, 63, 63); font-family: 微软雅黑; background-color: rgb(253, 252, 248);\"><dl style=\"margin-top: 10px; margin-bottom: 0px; border-width: 0px; border-style: initial; color: rgb(0, 0, 0); font-family: PingFangSC-Regular, Verdana, Arial, 微软雅黑, 宋体; font-size: 14px; font-weight: 400;\"><dt style=\"margin-top: 15px; margin-bottom: 5px; border-width: 0px; border-style: initial;\"><a target=\"_blank\" href=\"https://www.w3school.com.cn/tiy/t.asp?f=jsrf_array\" style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(144, 11, 9); border-left-color: initial; border-image: initial; color: rgb(144, 11, 9);\">创建数组</a></dt><dd style=\"border-width: 0px; border-style: initial;\">创建数组，为其赋值，然后输出这些值。</dd><dt style=\"margin-top: 15px; margin-bottom: 5px; border-width: 0px; border-style: initial;\"><a target=\"_blank\" href=\"https://www.w3school.com.cn/tiy/t.asp?f=jsrf_array_for_in\" style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(144, 11, 9); border-left-color: initial; border-image: initial; color: rgb(144, 11, 9);\">For...In 声明</a></dt><dd style=\"border-width: 0px; border-style: initial;\">使用 for...in 声明来循环输出数组中的元素。</dd><dt style=\"margin-top: 15px; margin-bottom: 5px; border-width: 0px; border-style: initial;\"><a target=\"_blank\" href=\"https://www.w3school.com.cn/tiy/t.asp?f=jseg_concat_2\" style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(144, 11, 9); border-left-color: initial; border-image: initial; color: rgb(144, 11, 9);\">合并两个数组 - concat()</a></dt><dd style=\"border-width: 0px; border-style: initial;\">如何使用 concat() 方法来合并两个数组。</dd><dt style=\"margin-top: 15px; margin-bottom: 5px; border-width: 0px; border-style: initial;\"><a target=\"_blank\" href=\"https://www.w3school.com.cn/tiy/t.asp?f=jseg_join\" style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(144, 11, 9); border-left-color: initial; border-image: initial; color: rgb(144, 11, 9);\">用数组的元素组成字符串 - join()</a></dt><dd style=\"border-width: 0px; border-style: initial;\">如何使用 join() 方法将数组的所有元素组成一个字符串。</dd><dt style=\"margin-top: 15px; margin-bottom: 5px; border-width: 0px; border-style: initial;\"><a target=\"_blank\" href=\"https://www.w3school.com.cn/tiy/t.asp?f=jseg_sort_1\" style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(144, 11, 9); border-left-color: initial; border-image: initial; color: rgb(144, 11, 9);\">文字数组 - sort()</a></dt><dd style=\"border-width: 0px; border-style: initial;\">如何使用 sort() 方法从字面上对数组进行排序。</dd><dt style=\"margin-top: 15px; margin-bottom: 5px; border-width: 0px; border-style: initial;\"><a target=\"_blank\" href=\"https://www.w3school.com.cn/tiy/t.asp?f=jseg_sort_2\" style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(144, 11, 9); border-left-color: initial; border-image: initial; color: rgb(144, 11, 9);\">数字数组 - sort()</a></dt><dd style=\"border-width: 0px; border-style: initial;\">如何使用 sort() 方法从数值上对数组进行排序。</dd></dl></h2>', '2020-03-24 15:34:02', '2020-03-24 15:34:04', '2,3', '3', '123456', 'http://img.bblocks.cn/00c5765adf554edab6a08c704bcdc53f.jpg', 'http://img.bblocks.cn/1d6b2fa9915f4cd99a1849aa7ddce16a.xlsx', 5, 1, 810, 811, 816, 1, 1, 71, '10家电器店3.10.xlsx', NULL);
INSERT INTO `demo2_test` VALUES (57, '照3', 0, '18014700003', '<h2 style=\"margin-top: 0px; margin-bottom: 0px; border-width: 0px; border-style: initial; font-weight: bold; font-size: 18px; color: rgb(63, 63, 63); font-family: 微软雅黑; background-color: rgb(253, 252, 248);\">实例</h2><dl style=\"margin-top: 10px; margin-bottom: 0px; border-width: 0px; border-style: initial; font-family: PingFangSC-Regular, Verdana, Arial, 微软雅黑, 宋体; font-size: 14px; background-color: rgb(253, 252, 248);\"><dt style=\"margin-top: 15px; margin-bottom: 5px; border-width: 0px; border-style: initial;\"><a target=\"_blank\" href=\"https://www.w3school.com.cn/tiy/t.asp?f=jsrf_array\" style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(144, 11, 9); border-left-color: initial; border-image: initial; color: rgb(144, 11, 9);\">创建数组</a></dt><dd style=\"border-width: 0px; border-style: initial;\">创建数组，为其赋值，然后输出这些值。</dd><dt style=\"margin-top: 15px; margin-bottom: 5px; border-width: 0px; border-style: initial;\"><a target=\"_blank\" href=\"https://www.w3school.com.cn/tiy/t.asp?f=jsrf_array_for_in\" style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(144, 11, 9); border-left-color: initial; border-image: initial; color: rgb(144, 11, 9);\">For...In 声明</a></dt><dd style=\"border-width: 0px; border-style: initial;\">使用 for...in 声明来循环输出数组中的元素。</dd></dl>', '2020-03-24 16:04:28', '2020-03-24 16:04:30', '0,1,2', '2', '123456', 'http://img.bblocks.cn/68f850eaafe047ee9cfd8c785951472c.jpg', 'http://h.bblocks.cn/000000.pdf', 4, 1, 579, 621, 627, 1, 1, 72, 'xx.pdf', NULL);
INSERT INTO `demo2_test` VALUES (59, '照5', 0, '18014700005', '<p>123123123123123123123123123123</p><p>123123123123123123123123123123</p><p>123123123123123123123123123123<br></p>', '2020-03-25 21:48:00', '2020-04-08 09:32:12', '3,2,1,0', '1', '123456', 'http://img.bblocks.cn/92f9b1690e374fb6a33b8253e3ea3b72.jpg', 'http://img.bblocks.cn/4990ef4237ec433bbdd8a315efe5edea.zip', 4, 1, 19, 20, 27, 1, 1, 72, '首页.zip', 'fa fa-anchor');
INSERT INTO `demo2_test` VALUES (58, '照41', 1, '18014700004', '', '2020-03-24 20:32:53', '2020-03-27 09:14:29', '1', '1', '123456', 'http://img.bblocks.cn/76d862311cd048748936ccd118bf4814.jpg', 'http://img.bblocks.cn/2f09e7d348e548bf8c00e0d6cce9d8f0.jpg', NULL, 1, 19, 20, 22, 3, 1, 72, ',d06eb6a03205f61f.jpg', NULL);
INSERT INTO `demo2_test` VALUES (60, '照6', 0, '18014700006', '<p>66666666</p><p>7777777</p><p>888888</p><p>999999</p>', '2020-03-29 00:53:36', '2020-04-07 17:31:00', '1,2', '3', '123456', 'http://img.bblocks.cn/27fbae91780d4a9492a46dfac26d8948.jpg', 'http://img.bblocks.cn/faa519647e3340cf8ad97e36148d8ddd.pdf', 4, 1, 810, 811, 820, 1, 1, 71, '000000.pdf', 'fa fa-calendar-check-o');
INSERT INTO `demo2_test` VALUES (61, 'jzhao', NULL, NULL, NULL, '2020-04-11 20:23:28', '2020-04-11 20:23:28', '1', '0', '0000000000', NULL, NULL, 2229, 0, 1, 2, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (62, 'jzhao', NULL, NULL, NULL, '2020-04-11 20:28:51', '2020-04-11 20:28:51', '1', '0', '0000000000', NULL, NULL, 2229, 0, 1, 2, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `demo2_test` VALUES (63, 'jzhao001', NULL, NULL, NULL, '2020-04-11 20:50:11', '2020-04-11 20:50:11', '1', '0', '000000000', NULL, NULL, 2229, 1, 1, 2, 3, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for demo3_test
-- ----------------------------
DROP TABLE IF EXISTS `demo3_test`;
CREATE TABLE `demo3_test`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `Sexy` int(11) NULL DEFAULT NULL COMMENT '性别：1=男，0=女',
  `Mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `Remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `Create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `tag1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '喜好1',
  `tag2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '喜好2',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `avatar` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `file` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件',
  `Relation_pro` int(11) NULL DEFAULT NULL COMMENT '产品',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo3_test
-- ----------------------------
INSERT INTO `demo3_test` VALUES (13, 'ccc', 1, '12345678910', '1', '2018-07-07 15:16:36', '2018-07-07 15:16:22', '1', '1', '123456', '/upload/1530947803423.jpg', '1', 1, 1);

-- ----------------------------
-- Table structure for demo5_test
-- ----------------------------
DROP TABLE IF EXISTS `demo5_test`;
CREATE TABLE `demo5_test`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '是否有效',
  `Relation_pro` int(11) NULL DEFAULT NULL COMMENT '产品',
  `Relation_pros` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品',
  `price` decimal(11, 2) NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo5_test
-- ----------------------------
INSERT INTO `demo5_test` VALUES (15, '', 1, 30, '31', NULL);
INSERT INTO `demo5_test` VALUES (16, 'c', 1, NULL, '33', 12.20);

-- ----------------------------
-- Table structure for dicts
-- ----------------------------
DROP TABLE IF EXISTS `dicts`;
CREATE TABLE `dicts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典中文',
  `object` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名',
  `ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '扩展Json',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 282 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dicts
-- ----------------------------
INSERT INTO `dicts` VALUES (1, '1', '被套', 'product', 'category', '');
INSERT INTO `dicts` VALUES (2, '2', '床单', 'product', 'category', '');
INSERT INTO `dicts` VALUES (3, '3', '浴巾', 'product', 'category', '');
INSERT INTO `dicts` VALUES (4, '4', '毛巾', 'product', 'category', '');
INSERT INTO `dicts` VALUES (5, '5', '枕套', 'product', 'category', '');
INSERT INTO `dicts` VALUES (6, '1', '纯棉', 'product', 'stuff', '');
INSERT INTO `dicts` VALUES (7, '2', '涤纶', 'product', 'stuff', '');
INSERT INTO `dicts` VALUES (8, '3', '纺纱', 'product', 'stuff', '');
INSERT INTO `dicts` VALUES (9, '4', '轻纱', 'product', 'stuff', '');
INSERT INTO `dicts` VALUES (10, '1', '90', 'product', 'size', '');
INSERT INTO `dicts` VALUES (11, '2', '120', 'product', 'size', '');
INSERT INTO `dicts` VALUES (12, '3', '150', 'product', 'size', '');
INSERT INTO `dicts` VALUES (13, '4', '180', 'product', 'size', '');
INSERT INTO `dicts` VALUES (14, '10', '待支付', 'orders', 'state', '');
INSERT INTO `dicts` VALUES (15, '20', '已支付', 'orders', 'state', '');
INSERT INTO `dicts` VALUES (16, '30', '已发货', 'orders', 'state', '');
INSERT INTO `dicts` VALUES (17, '40', '已收货', 'orders', 'state', '');
INSERT INTO `dicts` VALUES (28, '1', '在线租赁', 'payment', 'pay_business', '');
INSERT INTO `dicts` VALUES (29, '1', '支付宝', 'payment', 'platform', '');
INSERT INTO `dicts` VALUES (30, '2', '微信', 'payment', 'platform', '');
INSERT INTO `dicts` VALUES (33, '0', '正常', 'users', 'status', '');
INSERT INTO `dicts` VALUES (34, '1', '封号', 'users', 'status', '');
INSERT INTO `dicts` VALUES (35, '2', '禁言', 'users', 'status', '');
INSERT INTO `dicts` VALUES (36, '3', '删除', 'users', 'status', '');
INSERT INTO `dicts` VALUES (54, '0', '坦克', 'users', 'tag', '');
INSERT INTO `dicts` VALUES (55, '1', 'ADC', 'users', 'tag', '');
INSERT INTO `dicts` VALUES (56, '2', '打野', 'users', 'tag', '');
INSERT INTO `dicts` VALUES (57, '3', 'AP', 'users', 'tag', '');
INSERT INTO `dicts` VALUES (58, '0', '普通', 'test_info', 'status', '');
INSERT INTO `dicts` VALUES (59, '1', '禁用', 'test_info', 'status', '');
INSERT INTO `dicts` VALUES (60, '1', '潜水', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (61, '2', '冒泡', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (62, '3', '活跃', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (63, '4', '水货', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (64, '5', '喷子', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (65, '6', '山炮', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (148, '10', '待支付', 'v_orders', 'state', '');
INSERT INTO `dicts` VALUES (149, '20', '已支付', 'v_orders', 'state', '');
INSERT INTO `dicts` VALUES (150, '30', '已发货', 'v_orders', 'state', '');
INSERT INTO `dicts` VALUES (151, '40', '已收货', 'v_orders', 'state', '');
INSERT INTO `dicts` VALUES (152, '1', '正常', 'links', 'status', '');
INSERT INTO `dicts` VALUES (153, '2', '禁用', 'links', 'status', '');
INSERT INTO `dicts` VALUES (158, '0', '国', 'area12331', 'lv', '');
INSERT INTO `dicts` VALUES (159, '1', '省', 'area111', 'lv333', '');
INSERT INTO `dicts` VALUES (160, '2', '市', 'area', 'lv', '');
INSERT INTO `dicts` VALUES (161, '3', '区', 'area', 'lv', '');
INSERT INTO `dicts` VALUES (200, '1', '租赁商品', 'product', 'type', '');
INSERT INTO `dicts` VALUES (201, '2', '积分商品', 'product', 'type', '');
INSERT INTO `dicts` VALUES (202, '7', '山炮2', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (203, '8', '山炮3', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (204, '9', '山炮4', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (205, '10', '山炮5', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (206, '11', '山炮6', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (207, '12', '山炮7', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (208, '13', '山炮8', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (209, '14', '山炮9', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (210, '15', '山炮10', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (211, '16', '山炮11', 'test_info', 'tag', '');
INSERT INTO `dicts` VALUES (212, '1', '男', 'demo', 'Sexy', '');
INSERT INTO `dicts` VALUES (213, '0', '女', 'demo', 'Sexy', '');
INSERT INTO `dicts` VALUES (224, '1', '男', 'demo3_test', 'Sexy', '');
INSERT INTO `dicts` VALUES (225, '0', '女', 'demo3_test', 'Sexy', '');
INSERT INTO `dicts` VALUES (231, 'ss', 'sss', 'sss', '', '');
INSERT INTO `dicts` VALUES (245, '1', '男', 'demo2_test', 'Sexy', '');
INSERT INTO `dicts` VALUES (246, '0', '女', 'demo2_test', 'Sexy', '');
INSERT INTO `dicts` VALUES (247, '1', '未审核', 'demo2_test', 'shenhe_status', '');
INSERT INTO `dicts` VALUES (248, '2', '审核通过', 'demo2_test', 'shenhe_status', '');
INSERT INTO `dicts` VALUES (249, '3', '驳回', 'demo2_test', 'shenhe_status', '');
INSERT INTO `dicts` VALUES (250, '1', '男', 'demo2', 'Sexy', '');
INSERT INTO `dicts` VALUES (251, '0', '女', 'demo2', 'Sexy', '');
INSERT INTO `dicts` VALUES (252, '0', '启用', 'v_bid_doc', 'state', '');
INSERT INTO `dicts` VALUES (253, '1', '停用', 'v_bid_doc', 'state', '');
INSERT INTO `dicts` VALUES (254, '0', '否', 'v_bid_doc', 'to_delete', '');
INSERT INTO `dicts` VALUES (255, '1', '是', 'v_bid_doc', 'to_delete', '');
INSERT INTO `dicts` VALUES (256, '1', '普通商户', 'hotel', 'state', '');
INSERT INTO `dicts` VALUES (257, '2', '签约商户', 'hotel', 'state', '');
INSERT INTO `dicts` VALUES (268, '7', '初一', 't_class', 'grade', '');
INSERT INTO `dicts` VALUES (269, '8', '初二', 't_class', 'grade', '');
INSERT INTO `dicts` VALUES (270, '9', '初三', 't_class', 'grade', '');
INSERT INTO `dicts` VALUES (271, '1', '有效', 't_class', 'status', '');
INSERT INTO `dicts` VALUES (272, '0', '无效', 't_class', 'status', '');
INSERT INTO `dicts` VALUES (273, '1', '有效', 'user', 'status', '');
INSERT INTO `dicts` VALUES (274, '0', '无效', 'user', 'status', '');
INSERT INTO `dicts` VALUES (275, '0', '初始', 't_notice', 'status', '');
INSERT INTO `dicts` VALUES (276, '1', '审核通过', 't_notice', 'status', '');
INSERT INTO `dicts` VALUES (277, '2', '驳回', 't_notice', 'status', '');
INSERT INTO `dicts` VALUES (278, '1', '黑色', 't_notice', 'color', '');
INSERT INTO `dicts` VALUES (279, '2', '红色', 't_notice', 'color', '');
INSERT INTO `dicts` VALUES (280, '1', '男', 't_user', 'sexy', '');
INSERT INTO `dicts` VALUES (281, '2', '女', 't_user', 'sexy', '');

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '酒店名',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `state` int(11) NULL DEFAULT 1 COMMENT '用户状态：1=普通商户，2=签约商户',
  `score` int(11) NULL DEFAULT 0 COMMENT '积分',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '市',
  `region_id` int(11) NULL DEFAULT NULL COMMENT '区',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES (9, '星期天', '13137940769', '我家', 1, 200, '2018-08-17 00:00:00', NULL, NULL, 401);
INSERT INTO `hotel` VALUES (10, '看一看', '13137940769', '我家', 1, 200, '2018-08-17 00:00:00', NULL, NULL, 401);
INSERT INTO `hotel` VALUES (11, '汉庭', '123321', '浙江省杭州市余杭区', 2, 20, '2018-08-28 00:00:00', 1, NULL, 26);
INSERT INTO `hotel` VALUES (14, 'aaaa', '', '', 1, 0, '2019-06-05 15:43:40', 37, 38, 43);
INSERT INTO `hotel` VALUES (15, '夏津酒店', '', '', 1, 10, '2019-07-05 20:39:01', 1, 2, 4);

-- ----------------------------
-- Table structure for hotel_bed
-- ----------------------------
DROP TABLE IF EXISTS `hotel_bed`;
CREATE TABLE `hotel_bed`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `hotel_id` int(11) NOT NULL COMMENT '酒店',
  `sizes` int(2) NOT NULL COMMENT '床铺尺码',
  `num` int(11) NULL DEFAULT 1 COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_bed
-- ----------------------------
INSERT INTO `hotel_bed` VALUES (3, 1, 3, 2);
INSERT INTO `hotel_bed` VALUES (5, 7, 3, 6);
INSERT INTO `hotel_bed` VALUES (6, 1, 3, 3);
INSERT INTO `hotel_bed` VALUES (7, 1, 4, 1);
INSERT INTO `hotel_bed` VALUES (8, 1, 1, 2);
INSERT INTO `hotel_bed` VALUES (9, 1, 2, 3);
INSERT INTO `hotel_bed` VALUES (10, 2, 2, 13);
INSERT INTO `hotel_bed` VALUES (11, 2, 1, 11);
INSERT INTO `hotel_bed` VALUES (15, 7, 2, 1);
INSERT INTO `hotel_bed` VALUES (16, 11, 9999, 1);
INSERT INTO `hotel_bed` VALUES (17, 8, 5, 1);
INSERT INTO `hotel_bed` VALUES (18, 8, 2, 1);
INSERT INTO `hotel_bed` VALUES (19, 10, 2, 1);
INSERT INTO `hotel_bed` VALUES (20, 10, 1, 1);
INSERT INTO `hotel_bed` VALUES (21, 2, 4, 111);
INSERT INTO `hotel_bed` VALUES (22, 14, 1, 25);
INSERT INTO `hotel_bed` VALUES (23, 14, 3, 22);
INSERT INTO `hotel_bed` VALUES (24, 2, 2, 1);

-- ----------------------------
-- Table structure for hotel_stock
-- ----------------------------
DROP TABLE IF EXISTS `hotel_stock`;
CREATE TABLE `hotel_stock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `hotel_id` int(11) NOT NULL COMMENT '酒店',
  `category` int(2) NOT NULL COMMENT '商品类型',
  `num` int(11) NULL DEFAULT 1 COMMENT '存货量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_stock
-- ----------------------------
INSERT INTO `hotel_stock` VALUES (1, 11, 1, 15);
INSERT INTO `hotel_stock` VALUES (2, 9, 1, 1);
INSERT INTO `hotel_stock` VALUES (3, 10, 2, 1);
INSERT INTO `hotel_stock` VALUES (4, 11, 3, 1);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `info` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物品图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (1, '灭世者的死亡之帽', '<p>+140点法术强度。唯一被动：提升30%法术强度。11111</p>', '1449027976244.jpg');
INSERT INTO `item` VALUES (2, '麦瑞德裂血手套', '<p>+40点攻击、+40%攻击速度、+25点护甲、唯一被动：物理攻击会造成目标最大生命值的4%的魔法伤害。</p>', NULL);
INSERT INTO `item` VALUES (3, '多兰之盾', '<p>+120点生命值、+10点护甲、+8点生命回复/5秒</p>', NULL);
INSERT INTO `item` VALUES (4, '黑色切割者', '<p>+55点攻击力、+30%攻击速度。唯一被动：物理攻击减少目标15点护甲，持续5秒（最多叠加3次）。</p>', NULL);
INSERT INTO `item` VALUES (5, '长剑', '<p>+10点攻击力</p>', '1437496392574.gif');
INSERT INTO `item` VALUES (6, '灵巧披风', '<p>+18%暴击几率</p>', '1437495216704.png');
INSERT INTO `item` VALUES (7, '多兰之刃', '<p>+80点生命值、+10点攻击力、+3%生命偷取</p>', '1437494908238.png');

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态:1=正常,2=禁用',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接文本',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'http://www..com' COMMENT '链接地址',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES (1, 1, '百度', 'http://www.baidu.com', '百度一下,你就知道');
INSERT INTO `links` VALUES (2, 1, 'EOVA简单开发', 'http://www.eova.cn', '最简单的快速开发平台');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int(11) NOT NULL,
  `rid` int(11) NULL DEFAULT 0 COMMENT '冗余角色ID',
  `status` int(2) NULL DEFAULT 0 COMMENT '状态',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '昵称',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系手机',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `phone2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应急电话',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  `province` int(11) NULL DEFAULT NULL COMMENT '省',
  `city` int(11) NULL DEFAULT NULL COMMENT '市',
  `region` int(11) NULL DEFAULT NULL COMMENT '区',
  `admin_province` int(11) NULL DEFAULT NULL COMMENT '管理省',
  `admin_city` int(11) NULL DEFAULT NULL COMMENT '管理市',
  `admin_region` int(11) NULL DEFAULT NULL COMMENT '管理区',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_nickname`(`nickname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, 1, 0, '超级管理员', '', '', '', '', '2016-04-03 14:16:52', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `member` VALUES (2, 2, 0, '系统管理员', '', '', '', '', '2016-04-03 14:16:52', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `member` VALUES (3, 3, 0, '新省主管', '我是省长', '13524523406', '', '', '2016-04-03 14:16:52', 29, 0, 0, NULL, NULL, NULL);
INSERT INTO `member` VALUES (4, 3, 0, '乌市主管', '我是市长', '13524523415', '', '', '2016-04-03 14:17:21', 29, 351, 0, NULL, NULL, NULL);
INSERT INTO `member` VALUES (5, 3, 0, '天山主管', '我是区长', '13524523410', '', '', '2016-04-03 14:17:21', 29, 351, 3004, NULL, NULL, NULL);
INSERT INTO `member` VALUES (10, 4, 0, '天山用户1', '上海静安小鲜肉', '13524523411', '', '', '2016-04-03 14:17:21', 29, 351, 3004, NULL, NULL, NULL);
INSERT INTO `member` VALUES (11, 4, 0, '天山用户2', '上海静安小鲜肉', '13524523427', '', '', '2016-04-03 14:17:21', 29, 351, 3004, NULL, NULL, NULL);
INSERT INTO `member` VALUES (12, 4, 0, '天山用户3', '上海小鲜肉', '13524523414', '', '', '2016-04-03 14:17:21', 29, 351, 3005, NULL, NULL, NULL);
INSERT INTO `member` VALUES (13, 4, 0, '天山用户4', '上海小鲜肉', '13524523414', NULL, NULL, '2016-04-03 16:10:17', 29, 351, 3005, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `product` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品',
  `price` double(10, 0) NOT NULL DEFAULT 0 COMMENT '单价',
  `num` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '购买数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES (1, 1, 3, '洹宾 40*40S店标大提花被套3', 10, 1);
INSERT INTO `order_item` VALUES (2, 2, 18, '120床型纯棉四件套', 3, 2);
INSERT INTO `order_item` VALUES (3, 2, 18, '120床型纯棉四件套', 3, 2);
INSERT INTO `order_item` VALUES (4, 2, 18, '120床型纯棉四件套', 3, 2);
INSERT INTO `order_item` VALUES (5, 3, 18, '120床型纯棉四件套', 3, 6);
INSERT INTO `order_item` VALUES (6, 4, 19, '150床型纯棉四件套', 2, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `hotel_id` int(11) NULL DEFAULT 0 COMMENT '所属酒店',
  `pay_id` int(10) NULL DEFAULT 0 COMMENT '支付ID',
  `state` int(3) UNSIGNED NULL DEFAULT 10 COMMENT '订单状态：10=待支付,20=已支付,30=已发货,40=已收货',
  `money` double(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '应付金额',
  `score` double(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '消耗积分',
  `memo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_user_id` int(11) NOT NULL COMMENT '创建用户ID',
  `update_user_id` int(11) NOT NULL COMMENT '最后更新用户ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `is_invoice` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否开票',
  `additional_info` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单补充信息(JSON格式)',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `consignee` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `address_id` int(11) NULL DEFAULT NULL COMMENT '收获地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 1, 30, 10.00, 0.00, '22222222222', 7, 7, '2015-10-11 21:46:12', '2015-10-11 21:46:12', 0, NULL, '上海市松江区西林北路950号', '松江锦江之星1', '(021)37621128', 1);
INSERT INTO `orders` VALUES (2, 1, 2, 10, 6.00, 0.00, '', 21, 21, '2015-11-06 23:49:02', '2015-11-06 23:49:02', 0, NULL, 'gongyi', 'gongyi', 'gongyi', 2);
INSERT INTO `orders` VALUES (3, 28, 3, 10, 18.00, 0.00, '', 24, 24, '2015-11-14 09:12:18', '2015-11-14 09:12:18', 0, NULL, '淮河路 ', '三系', '18155502888', 3);
INSERT INTO `orders` VALUES (4, 1, 4, 10, 2.40, 0.00, '', 7, 7, '2015-11-15 21:19:16', '2015-11-15 21:19:16', 0, NULL, '上海市松江区西林北路950号', '客栈1号', '(021)37621128', 4);
INSERT INTO `orders` VALUES (5, 0, 0, 10, 0.00, 0.00, '1', 100, 666, '2016-11-27 01:44:25', '2016-11-27 01:44:25', 0, NULL, NULL, NULL, NULL, 100);
INSERT INTO `orders` VALUES (6, 0, 0, 10, 0.00, 0.00, '1111', 108, 108, '2016-11-27 02:07:09', '2016-11-27 02:07:09', 0, NULL, NULL, NULL, NULL, 107);
INSERT INTO `orders` VALUES (7, 0, 0, 10, 0.00, 0.00, '21', 109, 109, '2016-11-27 02:07:55', '2016-11-27 02:07:55', 0, NULL, NULL, NULL, NULL, 108);
INSERT INTO `orders` VALUES (8, 0, 0, 10, 0.00, 0.00, '1', 113, 113, '2016-11-27 22:10:07', '2016-11-27 22:10:07', 0, NULL, NULL, NULL, NULL, 112);
INSERT INTO `orders` VALUES (9, 0, 0, 10, 0.00, 0.00, '11', 114, 114, '2016-11-27 22:14:33', '2016-11-27 22:14:33', 0, NULL, NULL, NULL, NULL, 113);
INSERT INTO `orders` VALUES (10, 0, 0, 10, 0.00, 0.00, '11', 116, 116, '2016-11-29 01:21:51', '2016-11-29 01:21:51', 0, NULL, NULL, NULL, NULL, 117);
INSERT INTO `orders` VALUES (11, 0, 0, 10, 0.00, 0.00, '1', 122, 122, '2016-11-29 01:42:41', '2016-11-29 01:42:41', 0, NULL, NULL, NULL, NULL, 123);
INSERT INTO `orders` VALUES (12, 0, 0, 10, 0.00, 0.00, '5', 123, 123, '2016-11-29 01:42:54', '2016-11-29 01:42:54', 0, NULL, NULL, NULL, NULL, 124);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` int(2) NULL DEFAULT 1 COMMENT '产品类型：1=租赁商品，2=积分商品',
  `category` int(2) NOT NULL COMMENT '分类',
  `stuff` int(2) NOT NULL COMMENT '材料',
  `sizes` int(2) NOT NULL COMMENT '尺码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `test_price` double NULL DEFAULT 0 COMMENT '试用单价',
  `price` double NULL DEFAULT 0 COMMENT '商品单价',
  `cost_score` int(11) NULL DEFAULT 0 COMMENT '消耗积分：购买商品需消耗的积分',
  `score` int(11) NULL DEFAULT 0 COMMENT '奖励积分',
  `stock` int(11) NULL DEFAULT 1 COMMENT '库存',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (38, 1, 3, 2, 3, 'G', '', 0, 0, 0, 0, 1, '2018-07-22 00:00:00', '2018-07-22 22:58:31');
INSERT INTO `product` VALUES (40, 1, 1, 1, 2, '啊啊啊多少', 'http://pbsacitgr.bkt.clouddn.com/78ca7fc6cfb64872a925e97d734daef3.jpg', 11, 11, 1, 1, 456154, '2019-01-21 00:00:00', '2019-01-21 09:23:23');
INSERT INTO `product` VALUES (41, 1, 4, 3, 3, 'SAAAAAAAA', 'http://pbsacitgr.bkt.clouddn.com/d8a6d56bd8c649c9aecde048d12156d3.jpg', 874894, 71451, 414, 1415, 9999, '2019-01-21 00:00:00', '2019-01-21 09:57:46');

-- ----------------------------
-- Table structure for sale_data
-- ----------------------------
DROP TABLE IF EXISTS `sale_data`;
CREATE TABLE `sale_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `city_id` int(11) NOT NULL COMMENT '城市ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品',
  `money` double NULL DEFAULT 0 COMMENT '销售额',
  `dep_id` int(11) NULL DEFAULT NULL COMMENT '部门',
  `profit` decimal(9, 2) NULL DEFAULT 0.00 COMMENT '利润',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_data
-- ----------------------------
INSERT INTO `sale_data` VALUES (4, 25, '三星', 13, 54, 0.00);
INSERT INTO `sale_data` VALUES (5, 25, '魅族', 14, 54, 0.00);
INSERT INTO `sale_data` VALUES (6, 25, '中兴', 15, 54, 0.00);
INSERT INTO `sale_data` VALUES (7, 25, '乐视', 16, 54, 0.00);
INSERT INTO `sale_data` VALUES (11, 42, '华为', 20, 54, 0.00);
INSERT INTO `sale_data` VALUES (12, 42, '苹果', 21, 54, 0.00);
INSERT INTO `sale_data` VALUES (13, 42, '小米', 22, 54, 0.00);
INSERT INTO `sale_data` VALUES (14, 42, '三星', 23, 54, 0.00);
INSERT INTO `sale_data` VALUES (15, 42, '魅族', 24, 54, 0.00);
INSERT INTO `sale_data` VALUES (18, 42, '联想', 27, 54, 0.00);
INSERT INTO `sale_data` VALUES (19, 42, '酷派', 28, 54, 0.00);
INSERT INTO `sale_data` VALUES (20, 42, '黑莓', 29, 54, 0.00);
INSERT INTO `sale_data` VALUES (22, 3, '苹果', 31, 54, 2.50);
INSERT INTO `sale_data` VALUES (23, 3, '小米', 32, 54, 0.00);
INSERT INTO `sale_data` VALUES (24, 3, '三星', 33, 54, 0.00);
INSERT INTO `sale_data` VALUES (28, 3, '联想', 37, 54, 0.00);
INSERT INTO `sale_data` VALUES (29, 3, '酷派', 38, 54, 0.00);
INSERT INTO `sale_data` VALUES (30, 3, '黑莓', 39, 54, 0.00);
INSERT INTO `sale_data` VALUES (31, 4, '华为', 40, 54, 0.00);
INSERT INTO `sale_data` VALUES (32, 4, '苹果1', 41, 54, 0.00);
INSERT INTO `sale_data` VALUES (33, 4, '小米', 42, 54, 0.00);
INSERT INTO `sale_data` VALUES (34, 4, '三星', 43, 54, 0.00);
INSERT INTO `sale_data` VALUES (35, 4, '魅族', 44, 54, 0.00);
INSERT INTO `sale_data` VALUES (36, 4, '中兴', 45, 54, 0.00);
INSERT INTO `sale_data` VALUES (37, 4, '乐视', 46, 54, 0.00);
INSERT INTO `sale_data` VALUES (38, 4, '联想', 47, 54, 0.00);
INSERT INTO `sale_data` VALUES (39, 4, '酷派', 48, 54, 0.00);
INSERT INTO `sale_data` VALUES (40, 4, '黑莓', 49, 54, 0.00);
INSERT INTO `sale_data` VALUES (41, 4, '火腿', 1000, 54, 0.00);
INSERT INTO `sale_data` VALUES (42, 27, '狗不理', 10000, 54, 0.00);
INSERT INTO `sale_data` VALUES (43, 25, '土豆', 20, 54, 0.00);
INSERT INTO `sale_data` VALUES (46, 3, '红米', 250, 55, 1.50);
INSERT INTO `sale_data` VALUES (47, 3, '小米2', 125, 68, 1.20);
INSERT INTO `sale_data` VALUES (48, 12, '4665', 0, 54, 0.00);
INSERT INTO `sale_data` VALUES (49, 6, 'test', 0, 54, 0.00);
INSERT INTO `sale_data` VALUES (50, 6, '酒店毛巾', 0, 54, 0.00);
INSERT INTO `sale_data` VALUES (51, 31, '大发发的', 0, 54, 0.00);
INSERT INTO `sale_data` VALUES (52, 31, '大的撒多', 0, 54, 12.00);
INSERT INTO `sale_data` VALUES (53, 3, '999', 0, 54, 0.00);

-- ----------------------------
-- Table structure for t_bid_doc
-- ----------------------------
DROP TABLE IF EXISTS `t_bid_doc`;
CREATE TABLE `t_bid_doc`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标书编号',
  `b_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标书类别',
  `b_title` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标书标题',
  `product_id` int(11) NOT NULL COMMENT '产品信息表主键',
  `pass_rate` decimal(8, 5) NOT NULL COMMENT '合格率/%：百分数，实际值=当前值/100',
  `b_bond` decimal(8, 5) NOT NULL COMMENT '投标保证金',
  `b_monetary_unit_id` int(11) NOT NULL COMMENT '投标保证金金额单位主键',
  `price` decimal(8, 5) NOT NULL COMMENT '价格',
  `p_monetary_unit_id` int(11) NOT NULL COMMENT '价格金额单位主键',
  `supply_cycle` decimal(4, 2) NOT NULL COMMENT '供货周期',
  `s_time_unit_id` int(11) NOT NULL COMMENT '供货周期时间单位',
  `after_sale_num` int(11) NOT NULL COMMENT '售后服务项目数量',
  `a_trading_unit_id` int(11) NOT NULL COMMENT '售后服务项目数量产品交易单位主键',
  `free_cycle` decimal(4, 2) NOT NULL COMMENT '免费周期',
  `f_time_unit_id` int(11) NOT NULL COMMENT '免费周期时间单位',
  `after_price` decimal(8, 5) NOT NULL COMMENT '后续价格',
  `a_monetary_unit_id` int(11) NOT NULL COMMENT '后续价格金额单位主键',
  `state` tinyint(4) NOT NULL COMMENT '状态：0-启用，1-停用',
  `user_id` int(11) NOT NULL COMMENT '填表人',
  `by_time` datetime(0) NOT NULL COMMENT '填表日期',
  `to_delete` tinyint(4) NULL DEFAULT NULL COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标书' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `class_no` int(11) NULL DEFAULT NULL COMMENT '班级号',
  `grade` int(11) NULL DEFAULT NULL COMMENT '年级:7-初一,8-初二,9-初三',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态:1-有效,0-无效',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2230 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES (4, '初二（4）', 14, 7, 1, 1);
INSERT INTO `t_class` VALUES (5, '初二（5）', 15, 8, 1, 1);
INSERT INTO `t_class` VALUES (6, '初二（6）', 6, 8, 0, 1);
INSERT INTO `t_class` VALUES (7, '初二（7）', 7, 8, 0, 1);
INSERT INTO `t_class` VALUES (2224, '初一（1）', 11, 7, 1, 1);
INSERT INTO `t_class` VALUES (2225, '初一（2）', 12, 7, 1, 1);
INSERT INTO `t_class` VALUES (2226, '初一（3）', 13, 7, 1, 1);
INSERT INTO `t_class` VALUES (2227, '初一（6）', 16, 7, 1, 1);
INSERT INTO `t_class` VALUES (2229, '初二（6）', 6, 8, 1, 1);

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `department` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门',
  `state` tinyint(1) NOT NULL COMMENT '是否启用：0——是，1——否',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '组织',
  `head` int(11) NULL DEFAULT NULL COMMENT '负责人',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '父节点',
  `dep_name` int(11) NULL DEFAULT NULL COMMENT '部门负责人主键',
  `head_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES (3, '商务部', 0, 1, NULL, 1, NULL, '赵3');
INSERT INTO `t_department` VALUES (5, '南京分公司', 0, 1, NULL, 1, NULL, '赵5');
INSERT INTO `t_department` VALUES (9, '财务部', 0, 1, NULL, 6, NULL, '赵9');
INSERT INTO `t_department` VALUES (10, '运输部', 0, 1, NULL, 6, NULL, '赵10');
INSERT INTO `t_department` VALUES (12, '财务子部门1', 0, 1, NULL, 4, NULL, '赵41');
INSERT INTO `t_department` VALUES (13, '财务子子', 0, 1, NULL, 12, NULL, '赵411');
INSERT INTO `t_department` VALUES (14, '财务子子子1', 0, 1, NULL, 13, NULL, '找找');
INSERT INTO `t_department` VALUES (15, '财务子子子2', 0, 1, NULL, 13, NULL, '找找找2');
INSERT INTO `t_department` VALUES (17, '创新部', 1, NULL, NULL, 6, NULL, '111');
INSERT INTO `t_department` VALUES (18, '运输部2', 1, NULL, NULL, 10, NULL, '老王');
INSERT INTO `t_department` VALUES (19, '1', 1, NULL, NULL, 18, NULL, '1');
INSERT INTO `t_department` VALUES (20, '运营部', 1, NULL, NULL, 6, NULL, 'Lucky');
INSERT INTO `t_department` VALUES (21, '反根倒舌', 1, NULL, NULL, 10, NULL, '');
INSERT INTO `t_department` VALUES (22, 'AAA', 1, NULL, NULL, 10, NULL, '');
INSERT INTO `t_department` VALUES (23, 'ertet', 1, NULL, NULL, 9, NULL, 'rf');
INSERT INTO `t_department` VALUES (24, 'wefwfAFE', 1, NULL, NULL, 17, NULL, 'sfsdafwef');
INSERT INTO `t_department` VALUES (25, 'test', 1, NULL, NULL, 12, NULL, '');
INSERT INTO `t_department` VALUES (26, 'test1', 1, NULL, NULL, 25, NULL, '');
INSERT INTO `t_department` VALUES (29, '阿迪发动', 1, NULL, NULL, 25, NULL, '调度');
INSERT INTO `t_department` VALUES (30, '0', 1, NULL, NULL, 3, NULL, '0');
INSERT INTO `t_department` VALUES (31, '1212', 1, NULL, NULL, 28, NULL, '21');
INSERT INTO `t_department` VALUES (32, '3123', 1, NULL, NULL, 28, NULL, '3123');
INSERT INTO `t_department` VALUES (33, '1', 1, NULL, NULL, 30, NULL, '');
INSERT INTO `t_department` VALUES (34, '111', 1, NULL, NULL, 33, NULL, '222');
INSERT INTO `t_department` VALUES (35, 'ccfxzcxzcxz', 1, NULL, NULL, 2, NULL, '');
INSERT INTO `t_department` VALUES (36, '21212', 1, NULL, NULL, 33, NULL, '');
INSERT INTO `t_department` VALUES (37, '123', 1, NULL, NULL, 5, NULL, '123');
INSERT INTO `t_department` VALUES (38, '111', 1, NULL, NULL, 30, NULL, '');
INSERT INTO `t_department` VALUES (39, '3233', 0, NULL, NULL, 222, NULL, '22');
INSERT INTO `t_department` VALUES (40, '1', 1, NULL, NULL, 30, NULL, '');
INSERT INTO `t_department` VALUES (41, '1', 1, NULL, NULL, 5, NULL, '1');
INSERT INTO `t_department` VALUES (42, '33', 1, NULL, NULL, 40, NULL, '');
INSERT INTO `t_department` VALUES (43, '6', 1, NULL, NULL, 5, NULL, '6');
INSERT INTO `t_department` VALUES (44, '31', 1, NULL, NULL, 3, NULL, '');
INSERT INTO `t_department` VALUES (45, 'lol', 1, NULL, NULL, 42, NULL, 'l');
INSERT INTO `t_department` VALUES (46, 'java', 1, NULL, NULL, 43, NULL, 'dd');
INSERT INTO `t_department` VALUES (47, 'jd', 1, NULL, NULL, 37, NULL, 'dd');
INSERT INTO `t_department` VALUES (48, 'ss', 1, NULL, NULL, 47, NULL, 'adsa');
INSERT INTO `t_department` VALUES (49, 'fdss', 1, NULL, NULL, 47, NULL, 'dfsfd');
INSERT INTO `t_department` VALUES (50, 'zzt', 1, NULL, NULL, 41, NULL, '');
INSERT INTO `t_department` VALUES (51, '技术部', 1, NULL, NULL, 2, NULL, '赵1');
INSERT INTO `t_department` VALUES (52, '技术部2', 1, NULL, NULL, 2, NULL, '事实上');
INSERT INTO `t_department` VALUES (53, '部门2', 1, NULL, NULL, 2, NULL, '22');
INSERT INTO `t_department` VALUES (54, 'XX总公司', 1, 1, 1, 0, NULL, '22');
INSERT INTO `t_department` VALUES (55, '南京分公司', 1, 1, 55, 54, NULL, '赵3');
INSERT INTO `t_department` VALUES (71, '技术部', 1, 1, NULL, 55, NULL, '122');
INSERT INTO `t_department` VALUES (73, '技术部门', 1, 1, 60, 68, NULL, NULL);
INSERT INTO `t_department` VALUES (74, '财务2部门', 1, 1, 55, 67, NULL, NULL);
INSERT INTO `t_department` VALUES (75, '234567890', 1, 1, 55, 55, NULL, NULL);
INSERT INTO `t_department` VALUES (76, '123', 1, 1, 55, 55, NULL, NULL);

-- ----------------------------
-- Table structure for t_myimg
-- ----------------------------
DROP TABLE IF EXISTS `t_myimg`;
CREATE TABLE `t_myimg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `tag1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签1',
  `tag2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签2',
  `tag3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签3',
  `tag4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签4',
  `tag5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签5',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_myimg
-- ----------------------------
INSERT INTO `t_myimg` VALUES (13, '+6+', '2019-01-18 15:12:19', 'http://img.bblocks.cn/b6ac494fcef14fcabb5f76a046caa02d.jpg', '', '', NULL, '', '');
INSERT INTO `t_myimg` VALUES (14, '+622', '2019-01-18 15:14:22', 'http://pbsacitgr.bkt.clouddn.com/e8c4c80e68bb44a88e2d141a37e369a6.jpeg', '230320', '122', NULL, '1000', '3210');
INSERT INTO `t_myimg` VALUES (15, '', '2019-01-25 17:35:07', 'http://pbsacitgr.bkt.clouddn.com/be57c31a42e348ec9fb189b721b3d78c.png', '', '', NULL, '', '');
INSERT INTO `t_myimg` VALUES (16, '', '2019-01-25 17:35:23', 'http://pbsacitgr.bkt.clouddn.com/8a01ab2f44d34237858531840bce137d.png', '', '', NULL, '', '');
INSERT INTO `t_myimg` VALUES (17, '测试', '2019-06-21 11:32:22', 'http://img.bblocks.cn/0fc3b2bbee1c4831b8d5f947d218d9db.png', '测试', '', NULL, '', '');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态:0-初始,1-审核通过,2-驳回',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '类型：1=某某通知',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `verify_user` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `verify_time` timestamp(0) NULL DEFAULT NULL COMMENT '审核时间',
  `color` tinyint(4) NULL DEFAULT NULL COMMENT '颜色:1-黑色,2-红色',
  `reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (66, '二号通知1-10', '通知内容~~~', 0, 1, 1, NULL, '2019-01-10 10:19:05', NULL, 2, NULL);
INSERT INTO `t_notice` VALUES (67, '老师的第一条通知', '通知通知通知X次', 0, 1, 60, NULL, '2019-01-10 16:54:29', NULL, 2, NULL);
INSERT INTO `t_notice` VALUES (68, 'testtest2', 'testtest', 1, 1, 1, 1, '2019-01-14 17:41:21', '2020-03-24 20:49:16', 2, '');
INSERT INTO `t_notice` VALUES (69, 'test222', 'WebUploader是由Baidu WebFE(FEX)团队开发的一个简单的以HTML5为主，FLASH为辅的现代文件上传组件。在现代的浏览器里面能充分发挥HTML5的优势，同时又不摒弃主流IE浏览器，沿用原来的FLASH运行时，兼容IE6+，iOS 6+, android 4+。两套运行时，同样的调用方式，可供用户任意选用。', 2, 1, 1, 1, '2019-01-25 17:36:16', '2020-03-24 20:49:34', 1, '啊啊啊');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `cmd_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `product_model_id` int(11) NOT NULL COMMENT '产品型号主键',
  `product_spe` int(11) NOT NULL COMMENT '产品规格主键',
  `quality_standard_id` int(11) NOT NULL COMMENT '质量标准',
  `manufacturer_id` int(11) NOT NULL COMMENT '生产厂商主键',
  `idea` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设计理念',
  `drawings_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设计图纸路径',
  `documents_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设计文档路劲',
  `by_process` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生产工序',
  `materials` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所需物料',
  `state` tinyint(1) NOT NULL COMMENT '状态：0-启用，1-停用',
  `user_id` int(11) NOT NULL COMMENT '填表人',
  `by_date` datetime(0) NULL DEFAULT NULL COMMENT '填表日期',
  `to_delete` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (1, '产品A', 1, 1, 1, 1, '产品idea', 'www.baidu.com', 'www.baidu.com', '10%', 'mate', 1, 1, NULL, 1);

-- ----------------------------
-- Table structure for t_test_move
-- ----------------------------
DROP TABLE IF EXISTS `t_test_move`;
CREATE TABLE `t_test_move`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `A` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'A',
  `B` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'B',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_test_move
-- ----------------------------
INSERT INTO `t_test_move` VALUES (1, '1', '1');
INSERT INTO `t_test_move` VALUES (2, '2', '2');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(2) NULL DEFAULT 0 COMMENT '状态',
  `login_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账户',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '昵称',
  `reg_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标签',
  `rid` int(2) NULL DEFAULT NULL COMMENT '角色（存第一角色iD）',
  `rids` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色(s)',
  `is_delete` int(5) NULL DEFAULT 0 COMMENT '是否删除',
  `dep_id` int(11) NULL DEFAULT NULL COMMENT '部门',
  `avatar` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `sexy` tinyint(2) NULL DEFAULT NULL COMMENT '性别：1=男,2=女',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 1, 'bb', '我就是超管', '2019-01-02 19:16:05', '', '', 1, '1', 0, 54, 'http://img.bblocks.cn/aa7fe35911a34185893761da66442f77.jpg', 'jzhao12@qq.com', '18014700912', 2);
INSERT INTO `t_user` VALUES (50, 0, 'ssr111', '111', '2018-08-01 00:00:00', '111', '1111', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (51, 0, '2222222222222', '', '2018-08-18 16:18:40', '1111111111', '222222222', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (52, 0, '', '', '2018-11-02 23:38:55', '', '', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (55, 1, 'jzhao', '赵金', '2018-11-18 18:04:38', '', '', 2, '2', 0, 74, 'http://img.bblocks.cn/3baa5eecf38346d3aa763498b80215b8.jpg', 'balance_jin@qq.com', '18014700000', 1);
INSERT INTO `t_user` VALUES (56, 0, 'jzhao3', 'zhaojin3', '2018-11-18 18:07:56', '', '', 2, '2', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (58, 1, 'jzhao6', '赵金6', '2018-11-18 19:46:11', '', '', 2, '2', 0, 68, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (59, 1, 'jzhao7', '赵金7', '2018-11-18 19:46:42', '', '', 2, '2', 0, 55, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (60, 1, 'jzhao8', '赵金8', '2018-11-18 19:48:06', '', '', 8, '8,9', 0, 54, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (62, 1, 'jzhao9', 'jin9', '2019-01-02 19:36:01', '', '', 2, '2', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (63, 1, 'jzhao10', '', '2019-01-02 19:43:05', '', '', 3, '3', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (64, 1, 'qqq', 'qqq', '2019-01-03 14:59:39', 'qqq', 'qqq', 7, '7', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (65, 1, '1212', '12121', '2019-01-03 15:00:05', '212121', '221212121', 2, '2', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (66, 1, 'zj65', '', '2019-06-05 17:38:25', '', '', 2, '2', 1, 55, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (67, 1, '18014700708', '', '2019-06-10 10:23:17', '', '', 2, '2,3', 0, 74, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (68, 1, 'ds', 'sd', '2019-07-11 21:52:46', '', '', 2, '2', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (69, 1, 'jzhao101', 'kin', '2020-04-03 10:39:38', '测试用账户', '', 7, '7', 0, 72, 'http://img.bblocks.cn/b27ac90a8fef4ec6af111bd0e07a0f2f.jpg', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_user_test
-- ----------------------------
DROP TABLE IF EXISTS `t_user_test`;
CREATE TABLE `t_user_test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_test
-- ----------------------------
INSERT INTO `t_user_test` VALUES (1, 'Jaycekon', '1234', '1234', '123');
INSERT INTO `t_user_test` VALUES (2, 'Jaycekon', '1234', '1234', '123');
INSERT INTO `t_user_test` VALUES (3, 'Jaycekon', '1234', '1234', '123');

-- ----------------------------
-- Table structure for test_1
-- ----------------------------
DROP TABLE IF EXISTS `test_1`;
CREATE TABLE `test_1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `createtime` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_1
-- ----------------------------
INSERT INTO `test_1` VALUES (1, 'ccb', '/upload/1530948823811.jpg', 1, '2018-07-07 15:33:49');

-- ----------------------------
-- Table structure for test_2
-- ----------------------------
DROP TABLE IF EXISTS `test_2`;
CREATE TABLE `test_2`  (
  `id` int(11) NOT NULL COMMENT 'id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for test_info
-- ----------------------------
DROP TABLE IF EXISTS `test_info`;
CREATE TABLE `test_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态：0=普通，1=禁用',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `memo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `delete_flag` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证图片',
  `update_time` date NULL DEFAULT NULL COMMENT '更新日期',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜值',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `json` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置信息',
  `test1` int(10) UNSIGNED NULL DEFAULT NULL,
  `test2` float NULL DEFAULT NULL,
  `test3` double NULL DEFAULT NULL,
  `test4` tinyint(1) NULL DEFAULT NULL,
  `test5` bigint(5) UNSIGNED NULL DEFAULT NULL,
  `test6` tinyint(10) UNSIGNED NULL DEFAULT NULL,
  `test7` datetime(0) NULL DEFAULT NULL COMMENT 'datetime',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_info
-- ----------------------------
INSERT INTO `test_info` VALUES (1, 1, 0, '123465', 17, '<p>上海虹口区足球场上海虹口666</p>', '/avatar/1529659525336.png', 0, 'eova20175201314', '/upload/1529663314829.png', '2016-05-26', '2018-06-24 19:03:02', '00000', '#000000', '1,2', '{', 0, NULL, 0, 1, 0, NULL, '2016-10-08 02:39:34');
INSERT INTO `test_info` VALUES (4, 2, 0, '4324342', 43423423, '<p>哎哟不错哟！ 发个表情试试&nbsp;<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6d/lovea_thumb.gif\"><br><img src=\"http://127.0.0.1/editor/1464193877187.png\" style=\"max-width: 100%; width: 100.8px; height: 100.8px;\" class=\"\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"http://127.0.0.1/editor/1464194237135.png\" style=\"max-width: 100%;\"><br></p><p><br></p>', '1475655648414.png', 0, '423432423', '1464193847117.png', '2016-05-26', '2016-05-26 00:30:40', '000000', '#000000', '3', NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `test_info` VALUES (7, 1, 1, '新增导入1', 17, '<p>222上海虹口区足球场上海虹口222</p><p><br></p>', '1477243093297.png', 0, '更新导入。。。。', '1464002566632.jpg', '2016-05-26', '2016-09-18 00:32:48', '00000', '#000000', '2,4', NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `test_info` VALUES (8, 2, 1, '新增导入2', 43423423, '<p>哎哟不错哟！ 发个表情试试 <img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6d/lovea_thumb.gif\"><br><img src=\"http://127.0.0.1:10086/editor/1464193877187.png\" style=\"max-width: 100%; width: 100.8px; height: 100.8px;\" class=\"\">        <img src=\"http://127.0.0.1:10086/editor/1464194237135.png\" style=\"max-width: 100%;\"><br></p><p><br></p>', '1475647089038.jpg', 0, '423432423', '1464193847117.png', '2016-05-26', '2016-05-26 00:30:40', '000000', '#000000', '3', NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `test_info` VALUES (9, 2, 0, '4324', 432, '<p>423</p>', '1475944038375.png', 1, '4322344', '1475862732716.png', '2016-10-08', '2016-10-08 01:52:39', '423', '#000000', '2', NULL, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `test_info` VALUES (10, NULL, 0, '123', 12, '', NULL, 0, '', '', NULL, '2018-05-09 22:44:54', '', '#000000', NULL, '123123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `test_info` VALUES (11, NULL, 0, '123', 1231, '', NULL, 0, '', '', NULL, '2018-05-09 22:44:54', '', '#000000', NULL, '123123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `test_info` VALUES (12, NULL, 0, '123', 12312, '', NULL, 0, '', '', NULL, '2018-05-09 22:44:55', '', '#000000', NULL, '123123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(11) NOT NULL,
  `rid` int(11) NULL DEFAULT 0 COMMENT '冗余角色ID',
  `status` int(2) NULL DEFAULT 0 COMMENT '状态',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '昵称',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系手机',
  `province` int(11) NULL DEFAULT NULL COMMENT '省',
  `city` int(11) NULL DEFAULT NULL COMMENT '市',
  `region` int(11) NULL DEFAULT NULL COMMENT '区',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户详细信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 1, 0, '超管', '1623736450', 0, 0, 0, '2016-04-03 14:16:52');
INSERT INTO `user_info` VALUES (2, 2, 0, '系统管理员', '', NULL, NULL, NULL, '2016-04-03 14:16:52');
INSERT INTO `user_info` VALUES (3, 3, 0, '专业测试', '13524523406', 25, 321, 2710, '2016-04-03 14:16:52');
INSERT INTO `user_info` VALUES (4, 4, 0, '测试小白', '13524523488', 25, 321, 2710, '2016-11-21 00:19:08');
INSERT INTO `user_info` VALUES (5, 2, 0, '', NULL, NULL, NULL, NULL, '2016-11-25 14:49:45');
INSERT INTO `user_info` VALUES (7, 2, 0, '', NULL, NULL, NULL, NULL, '2016-11-25 14:51:23');

-- ----------------------------
-- Table structure for users_exp
-- ----------------------------
DROP TABLE IF EXISTS `users_exp`;
CREATE TABLE `users_exp`  (
  `users_id` int(11) NOT NULL,
  `exp` int(11) NULL DEFAULT 0 COMMENT '经验值',
  `avg` int(11) NULL DEFAULT 0 COMMENT '年龄',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'QQ',
  PRIMARY KEY (`users_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_exp
-- ----------------------------
INSERT INTO `users_exp` VALUES (49, 10, 10, '125043151');
INSERT INTO `users_exp` VALUES (50, 0, 0, '');
INSERT INTO `users_exp` VALUES (51, 0, 0, '');
INSERT INTO `users_exp` VALUES (52, 0, 0, '');
INSERT INTO `users_exp` VALUES (53, 0, 0, '');

-- ----------------------------
-- Table structure for users_item
-- ----------------------------
DROP TABLE IF EXISTS `users_item`;
CREATE TABLE `users_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `users_id` int(11) NOT NULL COMMENT '艺人',
  `item_id` int(11) NOT NULL COMMENT '道具',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_item
-- ----------------------------
INSERT INTO `users_item` VALUES (1, 7, 3);
INSERT INTO `users_item` VALUES (2, 27, 2);
INSERT INTO `users_item` VALUES (3, 9, 5);
INSERT INTO `users_item` VALUES (4, 10, 2);
INSERT INTO `users_item` VALUES (5, 11, 3);
INSERT INTO `users_item` VALUES (6, 23, 4);

-- ----------------------------
-- View structure for v_bid_doc
-- ----------------------------
DROP VIEW IF EXISTS `v_bid_doc`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_bid_doc` AS select `d`.`id` AS `id`,`d`.`b_type` AS `b_type`,`d`.`b_title` AS `b_title`,`d`.`product_id` AS `product_id`,`d`.`pass_rate` AS `pass_rate`,`d`.`b_bond` AS `b_bond`,`d`.`b_monetary_unit_id` AS `b_monetary_unit_id`,`d`.`price` AS `price`,`d`.`p_monetary_unit_id` AS `p_monetary_unit_id`,`d`.`supply_cycle` AS `supply_cycle`,`d`.`s_time_unit_id` AS `s_time_unit_id`,`d`.`after_sale_num` AS `after_sale_num`,`d`.`a_trading_unit_id` AS `a_trading_unit_id`,`d`.`free_cycle` AS `free_cycle`,`d`.`f_time_unit_id` AS `f_time_unit_id`,`d`.`after_price` AS `after_price`,`d`.`a_monetary_unit_id` AS `a_monetary_unit_id`,`d`.`state` AS `state`,`d`.`user_id` AS `user_id`,`d`.`by_time` AS `by_time`,`d`.`to_delete` AS `to_delete`,`p`.`cmd_name` AS `cmd_name`,`p`.`product_model_id` AS `product_model_id`,`p`.`product_spe` AS `product_spe`,`p`.`quality_standard_id` AS `quality_standard_id`,`p`.`manufacturer_id` AS `manufacturer_id` from (`t_bid_doc` `d` left join `t_product` `p` on((`d`.`product_id` = `p`.`id`)));

-- ----------------------------
-- Function structure for getDepChild
-- ----------------------------
DROP FUNCTION IF EXISTS `getDepChild`;
delimiter ;;
CREATE FUNCTION `getDepChild`(rootId INT)
 RETURNS varchar(1000) CHARSET utf8
BEGIN
	DECLARE ptemp VARCHAR(1000);
	DECLARE ctemp VARCHAR(1000);
       SET ptemp = '#';
       SET ctemp =CAST(rootId AS CHAR);
       WHILE ctemp IS NOT NULL DO
             SET ptemp = CONCAT(ptemp,',',ctemp);
            SELECT GROUP_CONCAT(id) INTO ctemp FROM t_department   
            WHERE FIND_IN_SET(p_id,ctemp)>0; 
       END WHILE;  
       RETURN ptemp; 
    END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
