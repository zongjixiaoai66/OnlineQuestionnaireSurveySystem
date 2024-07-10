/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t148`;
CREATE DATABASE IF NOT EXISTS `t148` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t148`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, 'picture1', 'http://localhost:8080/zaixianwenjuandiaocha/upload/1638238942609.jpg'),
	(2, 'picture2', 'http://localhost:8080/zaixianwenjuandiaocha/upload/1638238950169.jpg'),
	(3, 'picture3', 'http://localhost:8080/zaixianwenjuandiaocha/upload/1638238959682.jpg'),
	(6, 'homepage', NULL);

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_types` int DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='字典表';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_types`, `create_time`) VALUES
	(1, 'sex_types', '性别', 1, '男', NULL, '2022-09-22 02:09:07'),
	(2, 'sex_types', '性别', 2, '女', NULL, '2022-09-22 02:09:07'),
	(3, 'exampaper_types', '问卷状态', 1, '启用', NULL, '2022-09-22 02:09:07'),
	(4, 'exampaper_types', '问卷状态', 2, '禁用', NULL, '2022-09-22 02:09:07'),
	(5, 'examquestion_types', '试题类型', 1, '单选', NULL, '2022-02-08 09:02:57'),
	(6, 'examquestion_types', '试题类型', 2, '多选', NULL, '2022-02-08 09:02:57'),
	(9, 'examredetails_types', '审核结果', 1, '正确', NULL, '2022-02-08 09:02:57'),
	(10, 'examredetails_types', '审核结果', 2, '错误', NULL, '2022-02-08 09:02:57'),
	(11, 'news_types', '新闻类型名称', 1, '新闻类型1', NULL, '2022-02-08 09:02:57'),
	(12, 'news_types', '新闻类型名称', 2, '新闻类型2', NULL, '2022-02-08 09:02:57');

DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE IF NOT EXISTS `exampaper` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_name` varchar(200) NOT NULL COMMENT '问卷名称 Search111',
  `exampaper_date` int NOT NULL COMMENT '时长(分钟)',
  `exampaper_jieshuyu` varchar(255) DEFAULT NULL COMMENT '结束语',
  `exampaper_types` int NOT NULL DEFAULT '0' COMMENT '问卷状态 Search111',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='问卷表';

DELETE FROM `exampaper`;
INSERT INTO `exampaper` (`id`, `exampaper_name`, `exampaper_date`, `exampaper_jieshuyu`, `exampaper_types`, `create_time`) VALUES
	(2, '《永劫无间》调查问卷', 60, '非常感谢您的参与！希望您能够继续关注《永劫无间》的游戏以及周边产品哦！', 1, '2022-02-08 01:35:59');

DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE IF NOT EXISTS `examquestion` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_id` int NOT NULL COMMENT '所属问卷id（外键）',
  `examquestion_name` varchar(200) NOT NULL COMMENT '试题名称 Search111',
  `examquestion_options` longtext COMMENT '选项',
  `examquestion_types` int DEFAULT '0' COMMENT '试题类型',
  `examquestion_sequence` int DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COMMENT='试题表';

DELETE FROM `examquestion`;
INSERT INTO `examquestion` (`id`, `exampaper_id`, `examquestion_name`, `examquestion_options`, `examquestion_types`, `examquestion_sequence`, `create_time`) VALUES
	(20, 2, '您对于《永劫无间》这款游戏的体验程度是？', '[{"text":"玩过","code":"A"},{"text":"没玩过但看过直播/录播","code":"B"},{"text":"其他","code":"C"}]', 1, 1, '2022-02-08 01:41:07'),
	(21, 2, '您比较喜欢下列哪些种类的游戏？', '[{"text":"卡牌类（炉石传说、明日方舟，皇室战争）","code":"A"},{"text":"养成类（宝可梦，奇迹暖暖，阴阳师）","code":"B"},{"text":"竞速类（qq飞车，跑跑卡丁车等）","code":"C"},{"text":"moba类（王者荣耀，lol，虚荣）","code":"D"}]', 2, 2, '2022-02-08 01:42:18'),
	(22, 2, '您的年龄段是？', '[{"text":"16-18岁","code":"A"},{"text":"19-24岁","code":"B"},{"text":"25-30岁","code":"C"},{"text":"30岁以上","code":"D"}]', 1, 3, '2022-02-08 01:43:26'),
	(23, 2, '您的性别是？', '[{"text":"男","code":"A"},{"text":"女","code":"B"},{"text":"其他","code":"C"}]', 1, 4, '2022-02-08 01:44:00'),
	(24, 2, '您的职业或身份是？', '[{"text":"学生","code":"A"},{"text":"公职人员（教师，医生，公务员等）","code":"B"},{"text":"公司员工（主要是指定期上班的员工等）","code":"C"},{"text":"个体经营者（比如个体经营户，自由插画师等等）","code":"D"}]', 1, 5, '2022-02-08 01:44:42'),
	(25, 2, 'test', '[{"text":"测试","code":"A"},{"text":"测试2","code":"B"},{"text":"测试3","code":"C"}]', 2, 1111, '2022-02-08 06:50:00'),
	(26, 2, '1111111', '[{"text":"123","code":"A"},{"text":"321","code":"B"},{"text":"312","code":"C"},{"text":"231","code":"D"}]', 2, 1111, '2022-02-08 09:54:11');

DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE IF NOT EXISTS `examrecord` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examrecord_uuid_number` varchar(200) DEFAULT NULL COMMENT '问卷调查编号',
  `yonghu_id` int NOT NULL COMMENT '问卷调查用户',
  `exampaper_id` int NOT NULL COMMENT '所属问卷id（外键）',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '问卷调查时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COMMENT='问卷调查记录表';

DELETE FROM `examrecord`;
INSERT INTO `examrecord` (`id`, `examrecord_uuid_number`, `yonghu_id`, `exampaper_id`, `insert_time`, `create_time`) VALUES
	(21, '1638238591293', 2, 2, '2022-02-08 02:16:31', '2022-02-08 02:16:31'),
	(22, '1638239123796', 2, 2, '2022-02-08 02:25:24', '2022-02-08 02:25:24'),
	(23, '1638241520089', 2, 2, '2022-02-08 03:05:20', '2022-02-08 03:05:20'),
	(28, '1638253662630', 3, 2, '2022-02-08 06:27:43', '2022-02-08 06:27:43'),
	(29, '1638255075263', 2, 2, '2022-02-08 06:51:15', '2022-02-08 06:51:15'),
	(30, '1638841594276', 2, 2, '2022-02-08 01:46:34', '2022-02-08 01:46:34'),
	(31, '1638842379989', 2, 2, '2022-02-08 01:59:40', '2022-02-08 01:59:40'),
	(32, '1638842537045', 2, 2, '2022-02-08 02:02:17', '2022-02-08 02:02:17'),
	(33, '1644313967343', 2, 2, '2022-02-08 09:52:47', '2022-02-08 09:52:47'),
	(34, '1644314075973', 2, 2, '2022-02-08 09:54:36', '2022-02-08 09:54:36'),
	(35, '1713534155355', 2, 2, '2024-04-19 13:42:35', '2024-04-19 13:42:35');

DROP TABLE IF EXISTS `examredetails`;
CREATE TABLE IF NOT EXISTS `examredetails` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examredetails_uuid_number` varchar(200) DEFAULT NULL COMMENT '问卷编号',
  `yonghu_id` int NOT NULL COMMENT '用户id',
  `examquestion_id` int NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '用户选项',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb3 COMMENT='答题详情表';

DELETE FROM `examredetails`;
INSERT INTO `examredetails` (`id`, `examredetails_uuid_number`, `yonghu_id`, `examquestion_id`, `examredetails_myanswer`, `create_time`) VALUES
	(54, '1638238591293', 2, 24, 'A', '2022-02-08 02:16:36'),
	(55, '1638238591293', 2, 23, 'B', '2022-02-08 02:16:38'),
	(56, '1638238591293', 2, 22, 'B', '2022-02-08 02:16:40'),
	(57, '1638238591293', 2, 21, 'A,C', '2022-02-08 02:16:45'),
	(58, '1638238591293', 2, 20, 'B', '2022-02-08 02:16:49'),
	(59, '1638239123796', 2, 24, 'D', '2022-02-08 02:25:27'),
	(60, '1638239123796', 2, 23, 'B', '2022-02-08 02:25:29'),
	(61, '1638239123796', 2, 22, 'D', '2022-02-08 02:25:32'),
	(62, '1638239123796', 2, 21, 'B,C', '2022-02-08 02:25:41'),
	(63, '1638239123796', 2, 20, 'C', '2022-02-08 02:25:44'),
	(64, '1638241520089', 2, 24, 'A', '2022-02-08 03:05:23'),
	(65, '1638241520089', 2, 23, 'C', '2022-02-08 03:05:25'),
	(66, '1638241520089', 2, 22, 'B', '2022-02-08 03:05:26'),
	(67, '1638241520089', 2, 21, 'C', '2022-02-08 03:05:28'),
	(68, '1638241520089', 2, 20, 'B', '2022-02-08 03:05:31'),
	(89, '1638253662630', 3, 24, 'A', '2022-02-08 06:27:46'),
	(90, '1638253662630', 3, 23, 'B', '2022-02-08 06:27:47'),
	(91, '1638253662630', 3, 22, 'C', '2022-02-08 06:27:50'),
	(92, '1638253662630', 3, 21, 'C,D', '2022-02-08 06:27:53'),
	(93, '1638253662630', 3, 20, 'C', '2022-02-08 06:27:56'),
	(94, '1638255075263', 2, 20, '未作答', '2022-02-08 06:51:18'),
	(95, '1638255075263', 2, 21, '未作答', '2022-02-08 06:51:18'),
	(96, '1638255075263', 2, 22, '未作答', '2022-02-08 06:51:18'),
	(97, '1638255075263', 2, 23, '未作答', '2022-02-08 06:51:18'),
	(98, '1638255075263', 2, 24, '未作答', '2022-02-08 06:51:18'),
	(99, '1638255075263', 2, 25, '未作答', '2022-02-08 06:51:18'),
	(100, '1638841594276', 2, 20, '未作答', '2022-02-08 01:46:37'),
	(101, '1638841594276', 2, 21, '未作答', '2022-02-08 01:46:37'),
	(102, '1638841594276', 2, 22, '未作答', '2022-02-08 01:46:37'),
	(103, '1638841594276', 2, 23, '未作答', '2022-02-08 01:46:37'),
	(104, '1638841594276', 2, 24, '未作答', '2022-02-08 01:46:37'),
	(105, '1638841594276', 2, 25, '未作答', '2022-02-08 01:46:37'),
	(106, '1638842379989', 2, 20, '未作答', '2022-02-08 01:59:42'),
	(107, '1638842379989', 2, 21, '未作答', '2022-02-08 01:59:42'),
	(108, '1638842379989', 2, 22, '未作答', '2022-02-08 01:59:42'),
	(109, '1638842379989', 2, 23, '未作答', '2022-02-08 01:59:42'),
	(110, '1638842379989', 2, 24, '未作答', '2022-02-08 01:59:42'),
	(111, '1638842379989', 2, 25, '未作答', '2022-02-08 01:59:42'),
	(112, '1638842537045', 2, 20, '未作答', '2022-02-08 02:02:20'),
	(113, '1638842537045', 2, 21, '未作答', '2022-02-08 02:02:20'),
	(114, '1638842537045', 2, 22, '未作答', '2022-02-08 02:02:20'),
	(115, '1638842537045', 2, 23, '未作答', '2022-02-08 02:02:20'),
	(116, '1638842537045', 2, 24, '未作答', '2022-02-08 02:02:20'),
	(117, '1638842537045', 2, 25, '未作答', '2022-02-08 02:02:20'),
	(118, '1644313967343', 2, 25, 'B,A,C', '2022-02-08 09:52:52'),
	(119, '1644313967343', 2, 24, 'B', '2022-02-08 09:52:54'),
	(120, '1644313967343', 2, 23, 'B', '2022-02-08 09:52:55'),
	(121, '1644313967343', 2, 22, 'A', '2022-02-08 09:52:56'),
	(122, '1644313967343', 2, 21, 'C', '2022-02-08 09:52:59'),
	(123, '1644313967343', 2, 20, 'B', '2022-02-08 09:53:01'),
	(124, '1644314075973', 2, 25, 'B,C,A', '2022-02-08 09:54:40'),
	(125, '1644314075973', 2, 26, 'B,C,D', '2022-02-08 09:54:45'),
	(126, '1644314075973', 2, 24, 'B', '2022-02-08 09:54:50'),
	(127, '1644314075973', 2, 23, 'B', '2022-02-08 09:54:52'),
	(128, '1644314075973', 2, 22, 'D', '2022-02-08 09:54:54'),
	(129, '1644314075973', 2, 21, 'C', '2022-02-08 09:54:57'),
	(130, '1644314075973', 2, 20, 'C', '2022-02-08 09:54:59'),
	(131, '1713534155355', 2, 25, 'A', '2024-04-19 13:42:39'),
	(132, '1713534155355', 2, 26, 'A', '2024-04-19 13:42:41'),
	(133, '1713534155355', 2, 24, NULL, '2024-04-19 13:42:41'),
	(134, '1713534155355', 2, 23, NULL, '2024-04-19 13:42:42'),
	(135, '1713534155355', 2, 22, NULL, '2024-04-19 13:42:42'),
	(136, '1713534155355', 2, 20, '未作答', '2024-04-19 13:42:48'),
	(137, '1713534155355', 2, 21, '未作答', '2024-04-19 13:42:48');

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '新闻资讯名称  Search111 ',
  `news_types` int DEFAULT NULL COMMENT '新闻类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '新闻资讯图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '新闻资讯时间',
  `news_content` text COMMENT '新闻资讯详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 show1 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='新闻资讯';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `news_name`, `news_types`, `news_photo`, `insert_time`, `news_content`, `create_time`) VALUES
	(1, '新闻资讯2', 2, 'http://localhost:8080/zaixianwenjuandiaocha/upload/1638238932640.jpg', '2022-02-08 02:21:59', '<p><span style="color: rgb(96, 98, 102);">新闻资讯22</span></p>', '2022-02-08 02:21:59'),
	(2, '新闻资讯1', 1, 'http://localhost:8080/zaixianwenjuandiaocha/upload/1638238915744.jpg', '2022-02-08 02:22:00', '<p><span style="color: rgb(96, 98, 102);">新闻资讯11</span></p>', '2022-02-08 02:22:00');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 1, 'admin', 'users', '管理员', 'iboquugr0ria2h9io85zj5oau24q309h', '2022-02-08 01:30:58', '2024-04-19 14:41:18'),
	(2, 2, '111', 'yonghu', '用户', 'yuqpjrdj6u2ghp7cmk029lbw5urs9vtj', '2022-02-08 02:09:49', '2024-04-19 14:42:25'),
	(3, 3, '222', 'yonghu', '用户', '926z8cwu8q8wljpmgj65wsytzybxrbnx', '2022-02-08 06:27:05', '2022-02-08 07:29:51');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2022-02-08 07:59:12');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名  Search111',
  `sex_types` int DEFAULT NULL COMMENT '性别 Search111',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '照片',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `sex_types`, `yonghu_id_number`, `yonghu_phone`, `yonghu_photo`, `create_time`) VALUES
	(2, '用户1', '123456', '用户1', 2, '410882199211261544', '17785544961', 'http://localhost:8080/zaixianwenjuandiaocha/upload/1638238202964.jpg', '2022-02-08 02:09:44'),
	(3, '用户2', '123456', '用户2', 1, '410882198911261244', '17785596968', 'http://localhost:8080/zaixianwenjuandiaocha/upload/1638253648945.jpg', '2022-02-08 06:26:59');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
