/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : db_danzhao

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2019-04-12 11:51:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for d_department
-- ----------------------------
DROP TABLE IF EXISTS `d_department`;
CREATE TABLE `d_department` (
  `deptId` int(11) NOT NULL AUTO_INCREMENT COMMENT '系部编号',
  `deptName` varchar(40) DEFAULT NULL COMMENT '系部名称',
  `profClass` varchar(40) DEFAULT NULL COMMENT '专业大类（目前，一个系部对应一个专业大类）',
  PRIMARY KEY (`deptId`),
  UNIQUE KEY `deptName_unique` (`deptName`),
  UNIQUE KEY `profClass_uniqe` (`profClass`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_department
-- ----------------------------
INSERT INTO `d_department` VALUES ('3', '信息工程学院', '信息工程大类');
INSERT INTO `d_department` VALUES ('4', '经济管理学院', '经济管理类');
INSERT INTO `d_department` VALUES ('5', '机械工程学院', '机械工程大类');
INSERT INTO `d_department` VALUES ('6', '商贸', '商贸类');
INSERT INTO `d_department` VALUES ('7', '计算机几件事', '计算');

-- ----------------------------
-- Table structure for d_email
-- ----------------------------
DROP TABLE IF EXISTS `d_email`;
CREATE TABLE `d_email` (
  `emailUserId` int(11) NOT NULL AUTO_INCREMENT COMMENT '邮箱用户ID',
  `sendAccount` varchar(255) NOT NULL COMMENT '发件人',
  `recipientAccount` varchar(255) DEFAULT NULL COMMENT '收件人',
  `authorizationCode` varchar(255) NOT NULL COMMENT '账户授权码',
  `emailSMTPHost` varchar(255) NOT NULL DEFAULT 'smtp.qq.com' COMMENT '主机传输协议(服务器地址) 如：qq邮箱：smtp.qq.com',
  `emailSubject` varchar(255) DEFAULT NULL COMMENT '邮箱主题',
  `emailContent` varchar(255) DEFAULT NULL COMMENT '邮箱内容',
  PRIMARY KEY (`emailUserId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_email
-- ----------------------------
INSERT INTO `d_email` VALUES ('1', '154660165@qq.com', null, 'liefrgfxcruxbigg', 'smtp.qq.com', '【单独招生考试系统】验证码', '您的验证码是：');

-- ----------------------------
-- Table structure for d_examhistory
-- ----------------------------
DROP TABLE IF EXISTS `d_examhistory`;
CREATE TABLE `d_examhistory` (
  `ehId` int(11) NOT NULL AUTO_INCREMENT COMMENT '考试记录',
  `start` datetime DEFAULT NULL COMMENT '开始时间',
  `end` datetime DEFAULT NULL COMMENT '结束时间',
  `er` int(11) DEFAULT NULL COMMENT '考场',
  PRIMARY KEY (`ehId`),
  KEY `FKq46c9n0eq2jdfpnh91pigrgl5` (`er`),
  CONSTRAINT `FKq46c9n0eq2jdfpnh91pigrgl5` FOREIGN KEY (`er`) REFERENCES `d_examroom` (`erId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_examhistory
-- ----------------------------

-- ----------------------------
-- Table structure for d_examination
-- ----------------------------
DROP TABLE IF EXISTS `d_examination`;
CREATE TABLE `d_examination` (
  `exatId` int(11) NOT NULL AUTO_INCREMENT,
  `exatSimpleContent` varchar(255) DEFAULT NULL COMMENT '试题的简略信息',
  `exatContent` text COMMENT '试题内容',
  `exatAnswer` text COMMENT '试题答案',
  `exatType` int(11) DEFAULT NULL COMMENT '试题类型\r\n1：职业素质测试题\r\n2：技能测试题',
  `deptid` int(11) DEFAULT NULL COMMENT '系部编号\r\n外键，参照d_department表的的deptid字',
  PRIMARY KEY (`exatId`),
  KEY `FK5cukmynv64tnrrl1sb6u0avgd` (`deptid`),
  CONSTRAINT `FK5cukmynv64tnrrl1sb6u0avgd` FOREIGN KEY (`deptid`) REFERENCES `d_department` (`deptId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_examination
-- ----------------------------
INSERT INTO `d_examination` VALUES ('4', '自我介绍', '<p><span style=\"font-size: 24px;\">做一个三分钟的自我介绍</span></p>', '<p><strong><span style=\"font-size: 20px;\">无</span></strong></p>', '1', '3');
INSERT INTO `d_examination` VALUES ('5', '计算机基础', '<p><strong><span style=\"font-size: 24px;\">计算机系统由____系统和_____系统两部分组成</span></strong></p>', '<p><strong><span style=\"font-size: 20px;\">硬件&nbsp; &nbsp; 软件</span></strong></p>', '2', '3');
INSERT INTO `d_examination` VALUES ('6', '当用户请求jsp页面时，JSP引擎就会执行该页面的字节码文件响应客户的请求，执行字节码文件的结果', '<p><strong><span style=\"font-family: 宋体; font-size: 24px;\">当用户请求jsp页面时，JSP引擎就会执行该页面的字节码文件响应客户的请求，执行字节码文件的结果是（）</span></strong></p><p><strong><span style=\"font-family: 宋体; font-size: 24px;\"><br/></span></strong></p><p style=\"text-indent:14px\"><span style=\"font-family: 宋体; font-size: 20px;\">A、发送一个JSP源文件到客户端 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B、发送一个Java文件到客户端</span></p><p style=\"text-indent:14px\"><span style=\"font-family: 宋体; font-size: 20px;\"><br/></span></p><p style=\"text-indent:14px\"><span style=\"font-family: 宋体; font-size: 20px;\">C、发送一个HTML页面到客户端 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; D、什么都不做。</span></p><p><br/></p>', '<p><strong><span style=\"font-size: 24px;\">C</span></strong></p>', '2', '3');
INSERT INTO `d_examination` VALUES ('7', '下列动态网页和静态网页的根本区别描述错误的是', '<p><strong><span style=\"font-family: 宋体; font-size: 24px;\">下列动态网页和静态网页的根本区别描述错误的是（）</span></strong></p><p><strong><span style=\"font-family: 宋体; font-size: 24px;\"><br/></span></strong></p><p style=\"text-indent:21px\"><span style=\"font-family: 宋体; font-size: 20px;\">A、静态网页服务器端返回的HTML文件是事先存储好的。</span></p><p style=\"text-indent:21px\"><span style=\"font-family: 宋体; font-size: 20px;\"><br/></span></p><p style=\"text-indent:21px\"><span style=\"font-family: 宋体; font-size: 20px;\">B、动态网页服务器端返回的HTML文件是程序生成的。</span></p><p style=\"text-indent:21px\"><span style=\"font-family: 宋体; font-size: 20px;\"><br/></span></p><p style=\"text-indent:21px\"><span style=\"font-family: 宋体; font-size: 20px;\">C、静态网页文件里只有HTML标记，没有程序代码。</span></p><p style=\"text-indent:21px\"><span style=\"font-family: 宋体; font-size: 20px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 20px;\">&nbsp;D、动态网页中只有程序，不能有HTML代码。</span></p><p><br/></p>', '<p><strong>D<span style=\"font-size: 20px;\"></span></strong></p>', '2', '3');
INSERT INTO `d_examination` VALUES ('8', '下列关于SQL Server 2008数据库日志的说法错误是（ ）', '<p><strong><span style=\"font-size: 24px; font-family: 宋体;\"></span></strong></p><p><span style=\"font-size: 24px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\"><span style=\"font-family: 宋体;\">下列关于</span>SQL Server 200</span><span style=\"font-family: 宋体;\">8</span><span style=\"font-family: &quot;Times New Roman&quot;;\"><span style=\"font-family: 宋体;\">数据库日志的说法错误是（</span> <span style=\"font-family: 宋体;\">）</span></span></span></p><p><span style=\"font-size: 24px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\"><span style=\"font-family: 宋体;\"><br/></span></span></span></p><p><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 20px;\">&nbsp;&nbsp;&nbsp;&nbsp;A<span style=\"font-family: 宋体;\">、日志文件是维护数据库完整性的重要工具。</span></span></p><p><font face=\"宋体\"><span style=\"font-size: 20px;\"><br/></span></font><font face=\"Times New Roman\"><span style=\"font-size: 20px;\">&nbsp;&nbsp;&nbsp;&nbsp;B</span></font><span style=\"font-size: 20px;\"><span style=\"font-family: 宋体; font-size: 20px;\">、所有的对</span><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 20px;\">SQL</span><span style=\"font-family: 宋体; font-size: 20px;\">数据库的操作都需要写日志。</span></span></p><p><font face=\"宋体\"><span style=\"font-size: 20px;\"><br/></span></font><font face=\"Times New Roman\"><span style=\"font-size: 20px;\">&nbsp;&nbsp;&nbsp;&nbsp;C</span></font><span style=\"font-family: 宋体; font-size: 20px;\">、当日志文件的空间占满时，将无法写日志。 </span></p><p><span style=\"font-family: 宋体; font-size: 20px;\"><br/></span></p><p><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 20px;\">&nbsp;&nbsp;&nbsp;&nbsp;D<span style=\"font-size: 20px; font-family: 宋体;\">、当修改数据库时，必先写日志。</span></span><span style=\";font-family:&#39;Times New Roman&#39;;font-size:14px\"><br/></span></p><p><br/></p>', '<p><span style=\"font-size: 20px;\"><strong>A</strong></span><br/></p>', '1', '3');
INSERT INTO `d_examination` VALUES ('9', 'SQL Server 2008个人版不能安装在下列那个操作系统上(    )', '<p><strong><span style=\"font-size: 24px;\"></span></strong></p><p><strong><span style=\"font-family: 宋体; font-size: 24px;\">SQL Server 2008个人版不能安装在下列那个操作系统上<span style=\"font-size: 24px; font-family: &quot;Times New Roman&quot;;\">( &nbsp;&nbsp;&nbsp;)</span></span></strong></p><p><span style=\"font-size: 24px;\"></span><br/></p><p><span style=\"font-family: 宋体; font-size: 20px;\">A、<span style=\"font-family: &quot;Times New Roman&quot;;\">Windows 2000/XP&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;B</span>、<span style=\"font-family: &quot;Times New Roman&quot;;\">Windows 98 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C</span>、<span style=\"font-family: &quot;Times New Roman&quot;;\">Unix &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D</span>、<span style=\"font-family: &quot;Times New Roman&quot;;\">Windows NT</span></span></p><p><br/></p>', '<p><span style=\"font-size: 20px;\"><strong>C</strong></span><br/></p>', '1', '3');
INSERT INTO `d_examination` VALUES ('10', '数据库概念模式', '<p><strong><span style=\"font-family: 宋体; font-size: 24px;\">&nbsp;数据库概念模式产生于数据库系统设计的 _______ 阶段。</span></strong></p><p><br/></p><p><span style=\"font-family: 宋体; font-size: 20px;\">A 、规划 &nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 20px; font-family: &quot;Times New Roman&quot;;\">B </span>、需求分析 &nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 20px; font-family: &quot;Times New Roman&quot;;\">C </span>、概念设计 &nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 20px; font-family: &quot;Times New Roman&quot;;\">D </span>、逻辑设计</span></p><p><br/></p>', '<p><span style=\"font-size: 20px;\"><strong>C</strong></span><br/></p>', '1', '3');

-- ----------------------------
-- Table structure for d_examinergrade
-- ----------------------------
DROP TABLE IF EXISTS `d_examinergrade`;
CREATE TABLE `d_examinergrade` (
  `examinerGardeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '考官评分表ID',
  `examinerId` int(11) NOT NULL COMMENT '考官id 外键',
  `stuid` int(11) NOT NULL COMMENT '学生id 外键',
  `Result` varchar(100) NOT NULL COMMENT '考官的测试结果字符串\r\n格式：权重Id1:等级id1; 权重Id2:等级id2;…|权重Id1:等级id1; 权重Id2:等级id2;…\r\n说明：测试结果字符串分为：面试和职业技能基础素质测试两部分，以｜分隔',
  `score` float(10,2) NOT NULL COMMENT '考官的测试结果\r\n由Result字段的存储结果计算得出',
  PRIMARY KEY (`examinerGardeId`),
  KEY `FK_examinergrade_examiner_id` (`examinerId`),
  KEY `FK_examinergrade_student_id` (`stuid`),
  CONSTRAINT `FK_examinergrade_examiner_id` FOREIGN KEY (`examinerId`) REFERENCES `d_user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_examinergrade_student_id` FOREIGN KEY (`stuid`) REFERENCES `d_student` (`stuId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_examinergrade
-- ----------------------------
INSERT INTO `d_examinergrade` VALUES ('1', '6', '4', '4:2;6:3|8:3;9:2', '172.00');
INSERT INTO `d_examinergrade` VALUES ('2', '15', '4', '4:2;6:2|8:2;9:2', '94.00');

-- ----------------------------
-- Table structure for d_examroom
-- ----------------------------
DROP TABLE IF EXISTS `d_examroom`;
CREATE TABLE `d_examroom` (
  `erId` int(11) NOT NULL AUTO_INCREMENT COMMENT '考场编号',
  `erName` varchar(20) DEFAULT NULL COMMENT '考场名称',
  `erType` int(11) DEFAULT NULL COMMENT '0：表示候考室\r\n1：表示测试考场',
  `deptid` int(11) DEFAULT NULL COMMENT '外键，参照d_department表的的deptid字段',
  `test_room_list` varchar(100) DEFAULT NULL COMMENT '候考的测试考场列表\r\n当该考场类型字段为“候考室”时，用于保存在该候考室候考的对应测试考场，各专业之间以冒号分隔；每个值为专业信息表(d_examroom)中的考场id；若为“测试考场”，则为空。',
  PRIMARY KEY (`erId`),
  UNIQUE KEY `erName_unique` (`erName`),
  KEY `FKem9j2mall8xe1584btlepcxod` (`deptid`),
  CONSTRAINT `FKem9j2mall8xe1584btlepcxod` FOREIGN KEY (`deptid`) REFERENCES `d_department` (`deptId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_examroom
-- ----------------------------
INSERT INTO `d_examroom` VALUES ('21', '1504', '1', '3', null);
INSERT INTO `d_examroom` VALUES ('22', '1304', '1', '3', null);
INSERT INTO `d_examroom` VALUES ('23', '1505', '1', '3', '');
INSERT INTO `d_examroom` VALUES ('24', '1512', '0', '3', '21:23');
INSERT INTO `d_examroom` VALUES ('25', '1312', '0', '3', '22');

-- ----------------------------
-- Table structure for d_levelright
-- ----------------------------
DROP TABLE IF EXISTS `d_levelright`;
CREATE TABLE `d_levelright` (
  `levelrightid` int(11) NOT NULL AUTO_INCREMENT COMMENT '权重编号',
  `deptid` int(11) DEFAULT NULL COMMENT '系部编号 \r\n外键，参照d_department表的deptid字段',
  `levelname` varchar(20) DEFAULT NULL COMMENT '等级名称\r\n如优秀、合格等；\r\n也可如A、B、C、D等',
  `levelvalue` int(11) DEFAULT NULL COMMENT '等级对应权重',
  `remark` varchar(255) DEFAULT '' COMMENT '备注(此评定等级的评定标准，此等级的分数值)',
  PRIMARY KEY (`levelrightid`),
  KEY `deptid` (`deptid`),
  CONSTRAINT `d_levelright_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `d_department` (`deptId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_levelright
-- ----------------------------
INSERT INTO `d_levelright` VALUES ('2', '3', 'A', '100', '优秀');
INSERT INTO `d_levelright` VALUES ('3', '3', 'B', '80', '良好');
INSERT INTO `d_levelright` VALUES ('6', '3', 'C', '60', '及格');
INSERT INTO `d_levelright` VALUES ('7', '3', 'D', '40', '较差');

-- ----------------------------
-- Table structure for d_menu
-- ----------------------------
DROP TABLE IF EXISTS `d_menu`;
CREATE TABLE `d_menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(20) NOT NULL COMMENT '菜单名',
  `menuLink` varchar(255) NOT NULL COMMENT '菜单链接',
  `parentId` int(11) DEFAULT NULL COMMENT '父级ID',
  `roleId` int(11) NOT NULL COMMENT '所属角色ID',
  PRIMARY KEY (`menuId`),
  KEY `fk_menu_role` (`roleId`),
  CONSTRAINT `fk_menu_role` FOREIGN KEY (`roleId`) REFERENCES `d_role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_menu
-- ----------------------------
INSERT INTO `d_menu` VALUES ('1', '系部信息管理', '', null, '1');
INSERT INTO `d_menu` VALUES ('2', '个人信息设置', '', null, '1');
INSERT INTO `d_menu` VALUES ('4', '系部信息管理', 'user/UserSkip?page=superAdmin/deptInfoMGT', '1', '1');
INSERT INTO `d_menu` VALUES ('5', '系部专业信息管理', 'user/UserSkip?page=superAdmin/professionalInfoMGT', '1', '1');
INSERT INTO `d_menu` VALUES ('6', '系部管理员信息管理', 'user/UserSkip?page=superAdmin/deptAdminInfoMGT', '1', '1');
INSERT INTO `d_menu` VALUES ('7', '基本信息设置', 'user/UserSkip?page=public/accountInfoSite', '2', '1');
INSERT INTO `d_menu` VALUES ('9', '考生管理', '', null, '2');
INSERT INTO `d_menu` VALUES ('10', '考官管理', '', null, '2');
INSERT INTO `d_menu` VALUES ('11', '考场管理', '', null, '2');
INSERT INTO `d_menu` VALUES ('12', '考题管理', '', null, '2');
INSERT INTO `d_menu` VALUES ('13', '考生管理', 'user/UserSkip?page=deptAdmin/studentManage', '9', '2');
INSERT INTO `d_menu` VALUES ('15', '考官管理', 'user/UserSkip?page=deptAdmin/examinerManage', '10', '2');
INSERT INTO `d_menu` VALUES ('16', '考场管理', 'user/UserSkip?page=deptAdmin/examroomManage', '11', '2');
INSERT INTO `d_menu` VALUES ('17', '考场门贴', 'user/UserSkip?page=deptAdmin/doorSticker', '11', '2');
INSERT INTO `d_menu` VALUES ('18', '考题管理', 'user/UserSkip?page=deptAdmin/exatManage', '12', '2');
INSERT INTO `d_menu` VALUES ('19', '考生导入', 'user/UserSkip?page=deptAdmin/importStudent', '9', '2');
INSERT INTO `d_menu` VALUES ('21', '考题添加', 'user/UserSkip?page=deptAdmin/saveExat', '12', '2');
INSERT INTO `d_menu` VALUES ('24', '候考室管理', '', null, '4');
INSERT INTO `d_menu` VALUES ('26', '呼叫信息', 'user/UserSkip?page=waitRoomAdmin/waitRoom', '24', '4');
INSERT INTO `d_menu` VALUES ('27', '考试管理', '', null, '3');
INSERT INTO `d_menu` VALUES ('28', '考生操作', 'user/UserSkip?page=chiefExaminerAdmin/examManage', '27', '3');
INSERT INTO `d_menu` VALUES ('29', '考生评分', 'user/UserSkip?page=ExaminerAdmin/gradeManage', '27', '3');
INSERT INTO `d_menu` VALUES ('30', '缺考名单', 'user/UserSkip?page=chiefExaminerAdmin/missExamManage', '27', '3');
INSERT INTO `d_menu` VALUES ('31', '个人信息设置', '', null, '3');
INSERT INTO `d_menu` VALUES ('33', '基本信息设置', 'user/UserSkip?page=public/accountInfoSite', '31', '3');
INSERT INTO `d_menu` VALUES ('34', '个人信息设置', '', null, '4');
INSERT INTO `d_menu` VALUES ('35', '基本信息设置', 'user/UserSkip?page=public/accountInfoSite', '34', '4');
INSERT INTO `d_menu` VALUES ('36', '系部权重设置', '', null, '2');
INSERT INTO `d_menu` VALUES ('37', '综合素质测试权重设置', 'user/UserSkip?page=deptAdmin/testrightManage', '36', '2');
INSERT INTO `d_menu` VALUES ('38', '评定等级权重设置', 'user/UserSkip?page=deptAdmin/levelrightManage', '36', '2');
INSERT INTO `d_menu` VALUES ('39', '考试管理', '', null, '5');
INSERT INTO `d_menu` VALUES ('40', '考生评分', 'user/UserSkip?page=ExaminerAdmin/gradeManage', '39', '5');
INSERT INTO `d_menu` VALUES ('41', '个人信息设置', '', null, '5');
INSERT INTO `d_menu` VALUES ('42', '基本信息设置', 'user/UserSkip?page=public/accountInfoSite', '41', '5');
INSERT INTO `d_menu` VALUES ('43', '统分员操作', '', null, '6');
INSERT INTO `d_menu` VALUES ('44', '成绩统计查看', 'user/UserSkip?page=countScoreAdmin/countScoreManage', '43', '6');
INSERT INTO `d_menu` VALUES ('45', '个人信息设置', '', null, '6');
INSERT INTO `d_menu` VALUES ('46', '基本信息设置', 'user/UserSkip?page=public/accountInfoSite', '45', '6');
INSERT INTO `d_menu` VALUES ('47', '单个考生添加', 'user/UserSkip?page=deptAdmin/insertOneStu', '9', '2');
INSERT INTO `d_menu` VALUES ('48', '审核评分', 'user/UserSkip?page=countScoreAdmin/checkScore', '43', '6');
INSERT INTO `d_menu` VALUES ('49', '个人信息设置', '', null, '2');
INSERT INTO `d_menu` VALUES ('50', '基本信息设置', 'user/UserSkip?page=public/accountInfoSite', '49', '2');
INSERT INTO `d_menu` VALUES ('51', '考生成绩导出', 'user/UserSkip?page=deptAdmin/exportStuGrade\r\n', '9', '2');

-- ----------------------------
-- Table structure for d_profession
-- ----------------------------
DROP TABLE IF EXISTS `d_profession`;
CREATE TABLE `d_profession` (
  `profId` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业编号',
  `deptid` int(11) DEFAULT NULL COMMENT '系部编号，外键，参照d_department表的deptid字段',
  `profName` varchar(20) DEFAULT NULL COMMENT '专业名称',
  `profNumber` varchar(20) DEFAULT NULL COMMENT '专业代号，不能重复',
  PRIMARY KEY (`profId`),
  UNIQUE KEY `profNumber_unique` (`profNumber`) USING BTREE,
  UNIQUE KEY `profName_unique` (`profName`) USING BTREE,
  KEY `FKa23sfinl29213ra8ag5vm3pme` (`deptid`),
  CONSTRAINT `FKa23sfinl29213ra8ag5vm3pme` FOREIGN KEY (`deptid`) REFERENCES `d_department` (`deptId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_profession
-- ----------------------------
INSERT INTO `d_profession` VALUES ('2', '3', '移动应用开发', '1002');
INSERT INTO `d_profession` VALUES ('3', '3', '动漫制作技术', '1003');
INSERT INTO `d_profession` VALUES ('4', '3', '软件技术(软件测试方向)', '1008');
INSERT INTO `d_profession` VALUES ('7', '5', '机械制', '2001');
INSERT INTO `d_profession` VALUES ('8', '3', '计算机网络技术', '1005');
INSERT INTO `d_profession` VALUES ('9', '3', '云计算技术与应用', '1006');
INSERT INTO `d_profession` VALUES ('10', '3', '软件技术', '1001');
INSERT INTO `d_profession` VALUES ('11', '3', '数字媒体应用技术', '1007');
INSERT INTO `d_profession` VALUES ('14', '3', '基金', '999');

-- ----------------------------
-- Table structure for d_role
-- ----------------------------
DROP TABLE IF EXISTS `d_role`;
CREATE TABLE `d_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `roleName` varchar(20) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_role
-- ----------------------------
INSERT INTO `d_role` VALUES ('1', '超级管理员');
INSERT INTO `d_role` VALUES ('2', '系部管理员');
INSERT INTO `d_role` VALUES ('3', '主考官');
INSERT INTO `d_role` VALUES ('4', '候考室管理员');
INSERT INTO `d_role` VALUES ('5', '考官');
INSERT INTO `d_role` VALUES ('6', '统分员');

-- ----------------------------
-- Table structure for d_student
-- ----------------------------
DROP TABLE IF EXISTS `d_student`;
CREATE TABLE `d_student` (
  `stuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生序号',
  `stuNumber` varchar(20) DEFAULT NULL COMMENT '考生号',
  `stuName` varchar(20) DEFAULT NULL COMMENT '姓名',
  `stuSex` varchar(2) DEFAULT NULL COMMENT '性别',
  `stuTel1` varchar(13) DEFAULT NULL COMMENT '联系电话1',
  `stuTel2` varchar(13) DEFAULT NULL COMMENT '联系电话2',
  `stuTel3` varchar(13) DEFAULT NULL COMMENT '最新联系电话',
  `kType` varchar(4) DEFAULT NULL COMMENT '科类，文科或理科',
  `zgType` varchar(30) DEFAULT NULL COMMENT '职高对口科类',
  `schoolName` varchar(30) DEFAULT NULL,
  `stuStatus` int(11) DEFAULT '0' COMMENT '0：表示候考\r\n1：表示正在呼叫\r\n2：表示正在考试\r\n3：表示考试结束\r\n4：缺考\r\n5：评分结束',
  `deptid` int(11) DEFAULT NULL COMMENT '系部编号，外键，参照d_department表的deptid字段',
  `profid` int(11) DEFAULT NULL COMMENT '专业编号\r\n外键，参照d_profinfo表的profid字段',
  `stuPwd` varchar(255) DEFAULT NULL COMMENT '考生密码',
  `examNumber` varchar(255) DEFAULT NULL COMMENT '准考证号',
  `IDCard` varchar(255) DEFAULT NULL,
  `erId` int(11) DEFAULT NULL COMMENT '考场号',
  `testTime` varchar(255) DEFAULT NULL COMMENT '1代表上午，2代表下午，3代表晚上；',
  `teststarttime` datetime DEFAULT NULL COMMENT '测试开始时间',
  `testendtime` datetime DEFAULT NULL COMMENT '测试结束时间',
  `exatid` int(11) DEFAULT NULL COMMENT '职业素质测试题编号',
  `exatid2` int(11) DEFAULT NULL COMMENT '技能测试题编号',
  `totalscore` float(10,2) DEFAULT NULL COMMENT '考试最终得分',
  `eh` int(11) DEFAULT NULL COMMENT '考试记录',
  `roleId` int(11) NOT NULL DEFAULT '7' COMMENT '角色ID',
  PRIMARY KEY (`stuId`),
  UNIQUE KEY `UK_la5pij8jlu1kayvx6bkllq1c6` (`eh`),
  UNIQUE KEY `stuNumber_unique` (`stuNumber`) USING BTREE COMMENT '考生号唯一约束',
  UNIQUE KEY `examNumber_unique` (`examNumber`) USING BTREE COMMENT '准考证号唯一性约束',
  KEY `FKcyyyqk7j5w1acpdvqjuag60ad` (`deptid`),
  KEY `FK2l1wp1kmls5lcxkbl070g1ivc` (`profid`),
  KEY `exatid` (`exatid`),
  KEY `fk_student_exat2` (`exatid2`),
  KEY `FK_student_examroom_erid` (`erId`),
  CONSTRAINT `d_student_ibfk_1` FOREIGN KEY (`exatid`) REFERENCES `d_examination` (`exatId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK2l1wp1kmls5lcxkbl070g1ivc` FOREIGN KEY (`profid`) REFERENCES `d_profession` (`profId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK4lv5tbxp29pic8vigw66yhroi` FOREIGN KEY (`eh`) REFERENCES `d_examhistory` (`ehId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKcyyyqk7j5w1acpdvqjuag60ad` FOREIGN KEY (`deptid`) REFERENCES `d_department` (`deptId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_student_examroom_erid` FOREIGN KEY (`erId`) REFERENCES `d_examroom` (`erId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_student_exat2` FOREIGN KEY (`exatid2`) REFERENCES `d_examination` (`exatId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1709 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_student
-- ----------------------------
INSERT INTO `d_student` VALUES ('4', '123456789', '软件技术学生', '女', '13973341111', '15311111111', '15322222222', '理科', '', '攸县三中', '4', '3', '2', '1234567890', '1234567890', '430223199812156518', null, '1', '2018-12-23 16:47:13', '2018-12-28 21:41:27', null, null, '133.00', null, '7');
INSERT INTO `d_student` VALUES ('857', '18430102813470', '向泽恒', '男', null, null, null, null, null, null, '0', '3', '8', '20182722', '20182722', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('858', '18430724816414', '覃毅仙', '女', null, null, null, null, null, null, '0', '3', '8', '20182729', '20182729', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('859', '18430521118418', '李涵', '男', null, null, null, null, null, null, '0', '3', '9', '20182736', '20182736', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('860', '18430724153446', '肖涵', '男', null, null, null, null, null, null, '0', '3', '10', '20182742', '20182742', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('861', '18430122813436', '陈鹏飞', '女', null, null, null, null, null, null, '0', '3', '3', '20182745', '20182745', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('862', '18432323151056', '庄世雄', '男', null, null, null, null, null, null, '0', '3', '3', '20182769', '20182769', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('863', '18430402811940', '许文政', '男', null, null, null, null, null, null, '0', '3', '3', '20182782', '20182782', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('864', '18432823111946', '邓海丹', '女', null, null, null, null, null, null, '0', '3', '11', '20182788', '20182788', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('865', '18430623816312', '韦念', '男', null, null, null, null, null, null, '0', '3', '8', '20182806', '20182806', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('866', '18430623816330', '王希瑶', '男', null, null, null, null, null, null, '0', '3', '3', '20182810', '20182810', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('867', '18432831811752', '谭日科', '女', null, null, null, null, null, null, '0', '3', '9', '20182818', '20182818', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('868', '18432831811758', '周峰', '男', null, null, null, null, null, null, '0', '3', '8', '20182823', '20182823', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('869', '18430501115316', '李皓', '男', null, null, null, null, null, null, '0', '3', '2', '20182830', '20182830', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('870', '18432826811724', '雷土龙', '女', null, null, null, null, null, null, '0', '3', '10', '20182833', '20182833', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('871', '18432901813762', '阳雄', '男', null, null, null, null, null, null, '0', '3', '11', '20182848', '20182848', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('872', '18432522114328', '李达标', '男', null, null, null, null, null, null, '0', '3', '10', '20182863', '20182863', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('873', '18430123155208', '喻昊儒', '女', null, null, null, null, null, null, '0', '3', '8', '20182867', '20182867', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('874', '18432524153686', '刘杨', '男', null, null, null, null, null, null, '0', '3', '9', '20182876', '20182876', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('875', '18432323152586', '胡朗', '男', null, null, null, null, null, null, '0', '3', '10', '20182883', '20182883', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('876', '18430104153332', '肖子涵', '女', null, null, null, null, null, null, '0', '3', '8', '20182892', '20182892', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('877', '18430102813450', '刘旺', '男', null, null, null, null, null, null, '0', '3', '10', '20182902', '20182902', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('878', '18432524153682', '康娜', '男', null, null, null, null, null, null, '0', '3', '8', '20182905', '20182905', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('879', '18430102813432', '陈思敏', '女', null, null, null, null, null, null, '0', '3', '2', '20182906', '20182906', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('880', '18430102813434', '李骁骁', '男', null, null, null, null, null, null, '0', '3', '9', '20182916', '20182916', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('881', '18430102813454', '刘盼', '男', null, null, null, null, null, null, '0', '3', '10', '20182927', '20182927', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('882', '18432922118018', '廖莉莉', '女', null, null, null, null, null, null, '0', '3', '9', '20182934', '20182934', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('883', '18430524154398', '陈思', '男', null, null, null, null, null, null, '0', '3', '11', '20182959', '20182959', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('884', '18430201153258', '唐子乘', '男', null, null, null, null, null, null, '0', '3', '10', '20182983', '20182983', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('885', '18432503151942', '刘兆良', '女', null, null, null, null, null, null, '0', '3', '8', '20183034', '20183034', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('886', '18430121151648', '刘书舟', '男', null, null, null, null, null, null, '0', '3', '3', '20183087', '20183087', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('887', '18430321155540', '谢昀臻', '男', null, null, null, null, null, null, '0', '3', '8', '20183101', '20183101', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('888', '18430625813466', '徐烁', '女', null, null, null, null, null, null, '0', '3', '10', '20183125', '20183125', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('889', '18430625813450', '程湖镇', '男', null, null, null, null, null, null, '0', '3', '10', '20183137', '20183137', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('890', '18430625813442', '陈子挺', '男', null, null, null, null, null, null, '0', '3', '10', '20183145', '20183145', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('891', '18430321819230', '章深根', '女', null, null, null, null, null, null, '0', '3', '8', '20183147', '20183147', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('892', '18430625813448', '沈宇琪', '男', null, null, null, null, null, null, '0', '3', '10', '20183152', '20183152', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('893', '18430624818100', '黄文武', '男', null, null, null, null, null, null, '0', '3', '11', '20183159', '20183159', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('894', '18433027110520', '李凌宇', '女', null, null, null, null, null, null, '0', '3', '8', '20183160', '20183160', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('895', '18432325150926', '黄胜', '男', null, null, null, null, null, null, '0', '3', '9', '20183166', '20183166', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('896', '18430423815022', '肖轶', '男', null, null, null, null, null, null, '0', '3', '9', '20183227', '20183227', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('897', '18430423815026', '王维', '女', null, null, null, null, null, null, '0', '3', '8', '20183228', '20183228', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('898', '18430521157702', '王志磊', '男', null, null, null, null, null, null, '0', '3', '10', '20183237', '20183237', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('899', '18430524157544', '马凯', '男', null, null, null, null, null, null, '0', '3', '10', '20183250', '20183250', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('900', '18433127152448', '秦人杰', '女', null, null, null, null, null, null, '0', '3', '2', '20183263', '20183263', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('901', '18433127152452', '张卫', '男', null, null, null, null, null, null, '0', '3', '2', '20183265', '20183265', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('902', '18433123150236', '安世龙', '男', null, null, null, null, null, null, '0', '3', '10', '20183293', '20183293', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('903', '18430124155406', '彭铸伟', '女', null, null, null, null, null, null, '0', '3', '9', '20183302', '20183302', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('904', '18430201816044', '邹海涛', '男', null, null, null, null, null, null, '0', '3', '8', '20183307', '20183307', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('905', '18430522154006', '伍江城', '男', null, null, null, null, null, null, '0', '3', '10', '20183308', '20183308', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('906', '18430201816018', '刘斌杨', '女', null, null, null, null, null, null, '0', '3', '2', '20183309', '20183309', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('907', '18430528110147', '颜洋', '男', null, null, null, null, null, null, '0', '3', '10', '20181806', '20181806', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('908', '18432923151648', '杨维杰', '男', null, null, null, null, null, null, '0', '3', '8', '20181808', '20181808', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('909', '18432923151652', '何玮才', '女', null, null, null, null, null, null, '0', '3', '8', '20181809', '20181809', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('910', '18432923151613', '何朝华', '男', null, null, null, null, null, null, '0', '3', '8', '20181811', '20181811', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('911', '18432826112011', '雷俊华', '男', null, null, null, null, null, null, '0', '3', '10', '20181814', '20181814', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('912', '18432505112374', '邹思廷', '女', null, null, null, null, null, null, '0', '3', '11', '20183310', '20183310', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('913', '18430201816030', '龙舸', '男', null, null, null, null, null, null, '0', '3', '2', '20183311', '20183311', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('914', '18430201816016', '夏澳华', '男', null, null, null, null, null, null, '0', '3', '11', '20183312', '20183312', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('915', '18430601151890', '林子毅', '女', null, null, null, null, null, null, '0', '3', '10', '20183316', '20183316', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('916', '18430522154026', '石灿辉', '男', null, null, null, null, null, null, '0', '3', '10', '20183320', '20183320', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('917', '18430621155634', '周昊翔', '男', null, null, null, null, null, null, '0', '3', '9', '20183327', '20183327', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('918', '18430521151878', '申奇林', '女', null, null, null, null, null, null, '0', '3', '11', '20183332', '20183332', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('919', '18433101154716', '龙治宇', '男', null, null, null, null, null, null, '0', '3', '11', '20183337', '20183337', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('920', '18432930118178', '谢露露', '男', null, null, null, null, null, null, '0', '3', '11', '20183340', '20183340', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('921', '18432924815016', '李祥合', '女', null, null, null, null, null, null, '0', '3', '8', '20183343', '20183343', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('922', '18430424155840', '文雄', '男', null, null, null, null, null, null, '0', '3', '3', '20183347', '20183347', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('923', '18432301113110', '江琰玲', '男', null, null, null, null, null, null, '0', '3', '8', '20183356', '20183356', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('924', '18430123151764', '杨晶', '女', null, null, null, null, null, null, '0', '3', '3', '20183366', '20183366', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('925', '18430201153234', '范鼎', '男', null, null, null, null, null, null, '0', '3', '9', '20183384', '20183384', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('926', '18432321110324', '陈浩轩', '男', null, null, null, null, null, null, '0', '3', '8', '20183395', '20183395', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('927', '18430501153314', '颜鑫', '女', null, null, null, null, null, null, '0', '3', '8', '20183411', '20183411', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('928', '18430219151894', '骆胜军', '男', null, null, null, null, null, null, '0', '3', '10', '20183416', '20183416', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('929', '18430102815294', '吴珊珊', '男', null, null, null, null, null, null, '0', '3', '8', '20183451', '20183451', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('930', '18430124155364', '汤婷', '女', null, null, null, null, null, null, '0', '3', '3', '20183452', '20183452', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('931', '18430522155052', '吕纷芬', '男', null, null, null, null, null, null, '0', '3', '10', '20183461', '20183461', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('932', '18430422156412', '陈宇', '男', null, null, null, null, null, null, '0', '3', '10', '20183468', '20183468', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('933', '18432831150604', '蓝智敏', '女', null, null, null, null, null, null, '0', '3', '8', '20183471', '20183471', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('934', '18430601819558', '王颖', '男', null, null, null, null, null, null, '0', '3', '11', '20183476', '20183476', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('935', '18430527112128', '唐鹏', '男', null, null, null, null, null, null, '0', '3', '8', '20183532', '20183532', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('936', '18430601151238', '王润东', '女', null, null, null, null, null, null, '0', '3', '11', '20183553', '20183553', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('937', '18432801150466', '张景皓', '男', null, null, null, null, null, null, '0', '3', '9', '20183558', '20183558', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('938', '18430525151866', '曾林涛', '男', null, null, null, null, null, null, '0', '3', '10', '20183575', '20183575', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('939', '18433024150614', '张在云', '女', null, null, null, null, null, null, '0', '3', '8', '20183579', '20183579', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('940', '18430122152494', '冯晓龙', '男', null, null, null, null, null, null, '0', '3', '3', '20183588', '20183588', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('941', '18430426154452', '黄鹤', '男', null, null, null, null, null, null, '0', '3', '10', '20183589', '20183589', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('942', '18430623816262', '戴鑫', '女', null, null, null, null, null, null, '0', '3', '11', '20183608', '20183608', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('943', '18432503117614', '唐盼', '男', null, null, null, null, null, null, '0', '3', '3', '20183615', '20183615', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('944', '18432930818432', '胡维艳', '男', null, null, null, null, null, null, '0', '3', '8', '20183620', '20183620', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('945', '18432323813176', '李宏浩', '女', null, null, null, null, null, null, '0', '3', '11', '20183621', '20183621', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('946', '18432930818394', '柏桂林', '男', null, null, null, null, null, null, '0', '3', '10', '20183622', '20183622', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('947', '18432901813180', '叶淑芬', '男', null, null, null, null, null, null, '0', '3', '11', '20183645', '20183645', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('948', '18430123155750', '邓兰勇', '女', null, null, null, null, null, null, '0', '3', '9', '20183669', '20183669', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('949', '18432522154176', '王尧', '男', null, null, null, null, null, null, '0', '3', '10', '20183675', '20183675', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('950', '18433130111834', '向泽政', '男', null, null, null, null, null, null, '0', '3', '10', '20183677', '20183677', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('951', '18432325150940', '田浪', '女', null, null, null, null, null, null, '0', '3', '9', '20183689', '20183689', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('952', '18430123819196', '宋明慧', '男', null, null, null, null, null, null, '0', '3', '8', '20183699', '20183699', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('953', '18430421154434', '欧济源', '男', null, null, null, null, null, null, '0', '3', '4', '20183710', '20183710', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('954', '18430401152174', '洪菁蓉', '女', null, null, null, null, null, null, '0', '3', '11', '20183714', '20183714', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('955', '18430422156310', '陈艳', '男', null, null, null, null, null, null, '0', '3', '11', '20183721', '20183721', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('956', '18432505155062', '李顺', '男', null, null, null, null, null, null, '0', '3', '8', '20183733', '20183733', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('957', '18432325153385', '蒋敦香', '女', null, null, null, null, null, null, '0', '3', '11', '20181815', '20181815', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('958', '18430124114639', '周里江', '男', null, null, null, null, null, null, '0', '3', '2', '20181820', '20181820', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('959', '18432301113402', '李涵', '男', null, null, null, null, null, null, '0', '3', '10', '20181825', '20181825', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('960', '18433030151030', '李康', '女', null, null, null, null, null, null, '0', '3', '9', '20181826', '20181826', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('961', '18432323151248', '袁书培', '男', null, null, null, null, null, null, '0', '3', '8', '20181834', '20181834', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('962', '18430625151520', '余灿', '男', null, null, null, null, null, null, '0', '3', '8', '20181839', '20181839', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('963', '18430622155311', '王璟琪', '女', null, null, null, null, null, null, '0', '3', '10', '20181841', '20181841', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('964', '18430724113608', '任明明', '男', null, null, null, null, null, null, '0', '3', '8', '20181842', '20181842', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('965', '18432323151077', '廖凡', '男', null, null, null, null, null, null, '0', '3', '10', '20181847', '20181847', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('966', '18432930150361', '唐淼', '女', null, null, null, null, null, null, '0', '3', '2', '20181850', '20181850', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('967', '18430624156957', '卢文韬', '男', null, null, null, null, null, null, '0', '3', '9', '20181852', '20181852', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('968', '18430424158151', '陈嘉浩', '男', null, null, null, null, null, null, '0', '3', '10', '20181854', '20181854', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('969', '18430424150166', '王维佳', '女', null, null, null, null, null, null, '0', '3', '4', '20181860', '20181860', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('970', '18430522154057', '谭芝豪', '男', null, null, null, null, null, null, '0', '3', '2', '20181865', '20181865', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('971', '18430501818876', '何小曼', '男', null, null, null, null, null, null, '0', '3', '8', '20181867', '20181867', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('972', '18432301111512', '石轩慧', '女', null, null, null, null, null, null, '0', '3', '2', '20181870', '20181870', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('973', '18432321817679', '杨晟盛', '男', null, null, null, null, null, null, '0', '3', '11', '20181872', '20181872', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('974', '18430421151548', '曾焕', '男', null, null, null, null, null, null, '0', '3', '3', '20181874', '20181874', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('975', '18430431810704', '曾蓉蓉', '女', null, null, null, null, null, null, '0', '3', '11', '20181878', '20181878', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('976', '18430722112032', '唐湘', '男', null, null, null, null, null, null, '0', '3', '4', '20181880', '20181880', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('977', '18430431810711', '邹雅慧', '男', null, null, null, null, null, null, '0', '3', '11', '20181883', '20181883', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('978', '18430621113157', '潘梓林', '女', null, null, null, null, null, null, '0', '3', '8', '20181886', '20181886', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('979', '18430431810573', '钟媛', '男', null, null, null, null, null, null, '0', '3', '2', '20181890', '20181890', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('980', '18433005114916', '孙伟鹏', '男', null, null, null, null, null, null, '0', '3', '8', '20181891', '20181891', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('981', '18430431810559', '汤美英', '女', null, null, null, null, null, null, '0', '3', '11', '20181896', '20181896', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('982', '18432926152006', '王湘龙', '男', null, null, null, null, null, null, '0', '3', '11', '20181898', '20181898', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('983', '18430219814685', '吴宇良', '男', null, null, null, null, null, null, '0', '3', '4', '20181903', '20181903', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('984', '18430524156317', '李明川', '女', null, null, null, null, null, null, '0', '3', '10', '20181905', '20181905', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('985', '18430623152987', '杨赛杰', '男', null, null, null, null, null, null, '0', '3', '10', '20181906', '20181906', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('986', '18432505816187', '贺佳', '男', null, null, null, null, null, null, '0', '3', '3', '20181917', '20181917', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('987', '18432902110974', '向增', '女', null, null, null, null, null, null, '0', '3', '9', '20181924', '20181924', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('988', '18432923158049', '袁光华', '男', null, null, null, null, null, null, '0', '3', '10', '20181931', '20181931', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('989', '18430401153111', '王一钟', '男', null, null, null, null, null, null, '0', '3', '10', '20181935', '20181935', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('990', '18430622818154', '李振国', '女', null, null, null, null, null, null, '0', '3', '2', '20181940', '20181940', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('991', '18430302111606', '孙洋洋', '男', null, null, null, null, null, null, '0', '3', '8', '20181946', '20181946', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('992', '18430425157621', '曾宪映', '男', null, null, null, null, null, null, '0', '3', '4', '20181957', '20181957', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('993', '18432503113062', '黄伟民', '女', null, null, null, null, null, null, '0', '3', '10', '20181958', '20181958', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('994', '18432923153281', '陈利斌', '男', null, null, null, null, null, null, '0', '3', '10', '20181963', '20181963', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('995', '18430425157758', '曾曜', '男', null, null, null, null, null, null, '0', '3', '2', '20181964', '20181964', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('996', '18430425117329', '蒋佳熙', '女', null, null, null, null, null, null, '0', '3', '11', '20181966', '20181966', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('997', '18430425117226', '徐杰', '男', null, null, null, null, null, null, '0', '3', '10', '20181969', '20181969', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('998', '18430425117343', '周胜乾', '男', null, null, null, null, null, null, '0', '3', '11', '20181970', '20181970', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('999', '18432505111555', '王智', '女', null, null, null, null, null, null, '0', '3', '4', '20181973', '20181973', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1000', '18432930116983', '谢英姿', '男', null, null, null, null, null, null, '0', '3', '11', '20181978', '20181978', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1001', '18430321154706', '朱倍宏', '男', null, null, null, null, null, null, '0', '3', '10', '20181980', '20181980', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1002', '18433005113538', '石俊恒', '女', null, null, null, null, null, null, '0', '3', '8', '20181995', '20181995', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1003', '18430425819031', '幸小丰', '男', null, null, null, null, null, null, '0', '3', '3', '20181997', '20181997', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1004', '18432901110545', '孙伟泰', '男', null, null, null, null, null, null, '0', '3', '10', '20181998', '20181998', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1005', '18430501115867', '刘昆', '女', null, null, null, null, null, null, '0', '3', '10', '20181999', '20181999', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1006', '18430521151638', '彭凯', '男', null, null, null, null, null, null, '0', '3', '10', '20182004', '20182004', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1007', '18430722115506', '杨子雄', '男', null, null, null, null, null, null, '0', '3', '8', '20181437', '20181437', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1008', '18432901110533', '阳磊', '女', null, null, null, null, null, null, '0', '3', '4', '20182008', '20182008', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1009', '18432923112234', '陈志铭', '男', null, null, null, null, null, null, '0', '3', '10', '20182010', '20182010', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1010', '18430521153136', '王泽鹏', '男', null, null, null, null, null, null, '0', '3', '8', '20182014', '20182014', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1011', '18430726153122', '覃子维', '女', null, null, null, null, null, null, '0', '3', '10', '20182018', '20182018', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1012', '18430529111956', '谭敦勇', '男', null, null, null, null, null, null, '0', '3', '8', '20182025', '20182025', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1013', '18433005113550', '刘波', '男', null, null, null, null, null, null, '0', '3', '3', '20182026', '20182026', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1014', '18432503152012', '刘峥嵘', '女', null, null, null, null, null, null, '0', '3', '11', '20182028', '20182028', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1015', '18430402811859', '杨张烨', '男', null, null, null, null, null, null, '0', '3', '11', '20182034', '20182034', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1016', '18430521153149', '赵梓然', '男', null, null, null, null, null, null, '0', '3', '8', '20182037', '20182037', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1017', '18430319154325', '万涛', '女', null, null, null, null, null, null, '0', '3', '2', '20182050', '20182050', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1018', '18432829110788', '陈宇峰', '男', null, null, null, null, null, null, '0', '3', '2', '20182051', '20182051', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1019', '18430124152125', '邹文杰', '男', null, null, null, null, null, null, '0', '3', '4', '20182066', '20182066', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1020', '18430124152121', '张凯', '女', null, null, null, null, null, null, '0', '3', '10', '20182068', '20182068', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1021', '18430124152144', '喻智超', '男', null, null, null, null, null, null, '0', '3', '8', '20182072', '20182072', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1022', '18433005152804', '向耀民', '男', null, null, null, null, null, null, '0', '3', '3', '20182074', '20182074', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1023', '18430419818338', '倪志阳', '女', null, null, null, null, null, null, '0', '3', '8', '20182077', '20182077', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1024', '18432321114751', '夏衍铭', '男', null, null, null, null, null, null, '0', '3', '10', '20182078', '20182078', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1025', '18430421156553', '汤娟', '男', null, null, null, null, null, null, '0', '3', '10', '20182079', '20182079', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1026', '18432824112114', '官仁洋', '女', null, null, null, null, null, null, '0', '3', '3', '20182080', '20182080', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1027', '18430621152542', '任佳琪', '男', null, null, null, null, null, null, '0', '3', '3', '20182091', '20182091', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1028', '18430611151005', '张萌', '男', null, null, null, null, null, null, '0', '3', '10', '20182094', '20182094', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1029', '18430402811855', '许细峰', '女', null, null, null, null, null, null, '0', '3', '11', '20182095', '20182095', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1030', '18430402811849', '曾洋', '男', null, null, null, null, null, null, '0', '3', '11', '20182103', '20182103', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1031', '18430726816171', '罗沙', '男', null, null, null, null, null, null, '0', '3', '8', '20182106', '20182106', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1032', '18430521114046', '莫席涓', '女', null, null, null, null, null, null, '0', '3', '4', '20182109', '20182109', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1033', '18430521114031', '唐泺美', '男', null, null, null, null, null, null, '0', '3', '4', '20182114', '20182114', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1034', '18430421156685', '肖艳丹', '男', null, null, null, null, null, null, '0', '3', '8', '20182115', '20182115', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1035', '18432524153644', '邹洁琴', '女', null, null, null, null, null, null, '0', '3', '8', '20182116', '20182116', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1036', '18430421113598', '彭芝', '男', null, null, null, null, null, null, '0', '3', '11', '20182127', '20182127', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1037', '18430421113563', '谭依芸', '男', null, null, null, null, null, null, '0', '3', '11', '20182132', '20182132', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1038', '18430424113011', '郑涛', '女', null, null, null, null, null, null, '0', '3', '10', '20182136', '20182136', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1039', '18432828110179', '何宇豪', '男', null, null, null, null, null, null, '0', '3', '8', '20182150', '20182150', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1040', '18430425113684', '龙湖', '男', null, null, null, null, null, null, '0', '3', '10', '20182151', '20182151', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1041', '18433022116171', '李小平', '女', null, null, null, null, null, null, '0', '3', '2', '20182153', '20182153', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1042', '18430421153317', '罗开祥', '男', null, null, null, null, null, null, '0', '3', '10', '20182154', '20182154', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1043', '18430624818079', '李震宇', '男', null, null, null, null, null, null, '0', '3', '3', '20182171', '20182171', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1044', '18432522112646', '吕艳阳', '女', null, null, null, null, null, null, '0', '3', '8', '20182172', '20182172', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1045', '18430624818078', '黄少文', '男', null, null, null, null, null, null, '0', '3', '3', '20182174', '20182174', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1046', '18430624818091', '李紫阳', '男', null, null, null, null, null, null, '0', '3', '10', '20182177', '20182177', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1047', '18430501818539', '刘晓玲', '女', null, null, null, null, null, null, '0', '3', '10', '20182194', '20182194', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1048', '18430501818553', '蒋千千', '男', null, null, null, null, null, null, '0', '3', '3', '20182196', '20182196', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1049', '18430501818559', '李冰艳', '男', null, null, null, null, null, null, '0', '3', '11', '20182199', '20182199', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1050', '18432325153530', '吴文涛', '女', null, null, null, null, null, null, '0', '3', '10', '20182365', '20182365', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1051', '18433130817684', '方志羽', '男', null, null, null, null, null, null, '0', '3', '10', '20182657', '20182657', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1052', '18430521154440', '邓英杰', '男', null, null, null, null, null, null, '0', '3', '2', '20182696', '20182696', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1053', '18430321153862', '欧阳恒定', '女', null, null, null, null, null, null, '0', '3', '10', '20182709', '20182709', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1054', '18430523118354', '尹武文', '男', null, null, null, null, null, null, '0', '3', '2', '20182712', '20182712', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1055', '18432321817610', '李静', '男', null, null, null, null, null, null, '0', '3', '9', '20182941', '20182941', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1056', '18430501114436', '任葳', '女', null, null, null, null, null, null, '0', '3', '10', '20183438', '20183438', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1057', '18432502112647', '潘玉琦', '男', null, null, null, null, null, null, '0', '3', '9', '20181286', '20181286', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1058', '18432321817589', '何永胜', '男', null, null, null, null, null, null, '0', '3', '2', '20181288', '20181288', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1059', '18433027150412', '周坤霖', '女', null, null, null, null, null, null, '0', '3', '10', '20182200', '20182200', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1060', '18430501818554', '唐雪琪', '男', null, null, null, null, null, null, '0', '3', '11', '20182204', '20182204', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1061', '18433027150372', '蒲剑斌', '男', null, null, null, null, null, null, '0', '3', '10', '20182206', '20182206', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1062', '18432826151862', '李彪', '女', null, null, null, null, null, null, '0', '3', '9', '20182207', '20182207', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1063', '18432826150405', '罗佳威', '男', null, null, null, null, null, null, '0', '3', '2', '20182211', '20182211', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1064', '18430425819030', '吴娜', '男', null, null, null, null, null, null, '0', '3', '4', '20182213', '20182213', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1065', '18430501818540', '曾婷婷', '女', null, null, null, null, null, null, '0', '3', '8', '20182214', '20182214', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1066', '18430724152287', '郑威', '男', null, null, null, null, null, null, '0', '3', '2', '20182217', '20182217', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1067', '18430122151451', '曾子睿', '男', null, null, null, null, null, null, '0', '3', '10', '20182218', '20182218', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1068', '18430501818544', '吴勇群', '女', null, null, null, null, null, null, '0', '3', '11', '20182225', '20182225', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1069', '18430225150286', '邹玉琴', '男', null, null, null, null, null, null, '0', '3', '2', '20182234', '20182234', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1070', '18430225150292', '叶奇馨', '男', null, null, null, null, null, null, '0', '3', '2', '20182235', '20182235', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1071', '18430422152181', '贺小冬', '女', null, null, null, null, null, null, '0', '3', '8', '20182236', '20182236', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1072', '18430523816401', '莫振良', '男', null, null, null, null, null, null, '0', '3', '3', '20182240', '20182240', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1073', '18432301150224', '高骏', '男', null, null, null, null, null, null, '0', '3', '4', '20182242', '20182242', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1074', '18430626819421', '肖崴', '女', null, null, null, null, null, null, '0', '3', '9', '20182247', '20182247', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1075', '18433001110152', '李治', '男', null, null, null, null, null, null, '0', '3', '8', '20182249', '20182249', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1076', '18432503154441', '邓志远', '男', null, null, null, null, null, null, '0', '3', '10', '20182250', '20182250', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1077', '18432524114286', '段绍琨', '女', null, null, null, null, null, null, '0', '3', '10', '20182251', '20182251', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1078', '18430422112905', '王杰', '男', null, null, null, null, null, null, '0', '3', '8', '20182266', '20182266', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1079', '18432828151147', '朱治', '男', null, null, null, null, null, null, '0', '3', '2', '20182273', '20182273', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1080', '18433101154732', '周子龙', '女', null, null, null, null, null, null, '0', '3', '10', '20182276', '20182276', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1081', '18430725813210', '杨东凤', '男', null, null, null, null, null, null, '0', '3', '8', '20182278', '20182278', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1082', '18432503110106', '刘定邦', '男', null, null, null, null, null, null, '0', '3', '3', '20182281', '20182281', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1083', '18432323812976', '唐晶晶', '女', null, null, null, null, null, null, '0', '3', '11', '20182284', '20182284', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1084', '18430501113632', '谭子洋', '男', null, null, null, null, null, null, '0', '3', '2', '20182289', '20182289', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1085', '18433031150718', '李秋凭', '男', null, null, null, null, null, null, '0', '3', '10', '20182290', '20182290', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1086', '18432902812156', '匡豪', '女', null, null, null, null, null, null, '0', '3', '10', '20182294', '20182294', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1087', '18430523110399', '杨倩倩', '男', null, null, null, null, null, null, '0', '3', '9', '20182295', '20182295', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1088', '18430528150730', '袁琳涛', '男', null, null, null, null, null, null, '0', '3', '10', '20182298', '20182298', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1089', '18430402812029', '陈政帅', '女', null, null, null, null, null, null, '0', '3', '3', '20182303', '20182303', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1090', '18430422113733', '贺世龙', '男', null, null, null, null, null, null, '0', '3', '10', '20182319', '20182319', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1091', '18430422154932', '张康林', '男', null, null, null, null, null, null, '0', '3', '8', '20182330', '20182330', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1092', '18430401156437', '沈超', '女', null, null, null, null, null, null, '0', '3', '10', '20182343', '20182343', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1093', '18430321155404', '陈明', '男', null, null, null, null, null, null, '0', '3', '10', '20182351', '20182351', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1094', '18430401116588', '王亿豪', '男', null, null, null, null, null, null, '0', '3', '10', '20182352', '20182352', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1095', '18430526114609', '严慧翔', '女', null, null, null, null, null, null, '0', '3', '2', '20182354', '20182354', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1096', '18430526114621', '肖伟', '男', null, null, null, null, null, null, '0', '3', '2', '20182359', '20182359', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1097', '18430422154938', '肖海波', '男', null, null, null, null, null, null, '0', '3', '8', '20182383', '20182383', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1098', '18430624154162', '刘伟雄', '女', null, null, null, null, null, null, '0', '3', '8', '20182385', '20182385', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1099', '18430424112983', '谭建辉', '男', null, null, null, null, null, null, '0', '3', '9', '20182390', '20182390', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1100', '18430624818156', '章龙', '男', null, null, null, null, null, null, '0', '3', '10', '20182392', '20182392', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1101', '18430122813759', '彭望舒', '女', null, null, null, null, null, null, '0', '3', '3', '20182397', '20182397', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1102', '18430621113174', '邹思瑶', '男', null, null, null, null, null, null, '0', '3', '10', '20182402', '20182402', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1103', '18430426156752', '刘天奇', '男', null, null, null, null, null, null, '0', '3', '10', '20182403', '20182403', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1104', '18430122813772', '黄煜婧', '女', null, null, null, null, null, null, '0', '3', '8', '20182405', '20182405', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1105', '18430124152021', '童姣', '男', null, null, null, null, null, null, '0', '3', '9', '20182407', '20182407', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1106', '18430621113150', '李茜妮', '男', null, null, null, null, null, null, '0', '3', '10', '20182412', '20182412', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1107', '18430524154396', '伍雪林', '女', null, null, null, null, null, null, '0', '3', '10', '20181296', '20181296', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1108', '18432503115925', '郭宇', '男', null, null, null, null, null, null, '0', '3', '8', '20181309', '20181309', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1109', '18430422115721', '欧阳杰', '男', null, null, null, null, null, null, '0', '3', '2', '20181312', '20181312', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1110', '18432325153432', '蒋韵', '女', null, null, null, null, null, null, '0', '3', '10', '20181318', '20181318', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1111', '18432321116436', '蒋鹏', '男', null, null, null, null, null, null, '0', '3', '10', '20181323', '20181323', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1112', '18430103114649', '彭杰', '男', null, null, null, null, null, null, '0', '3', '3', '20181324', '20181324', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1113', '18432930114183', '周虹江', '女', null, null, null, null, null, null, '0', '3', '11', '20181328', '20181328', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1114', '18432824151169', '欧阳兆南', '男', null, null, null, null, null, null, '0', '3', '8', '20181329', '20181329', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1115', '18432924815024', '刘毅', '男', null, null, null, null, null, null, '0', '3', '10', '20181330', '20181330', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1116', '18430801118629', '屈林锋', '女', null, null, null, null, null, null, '0', '3', '10', '20181335', '20181335', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1117', '18433024151908', '谌康', '男', null, null, null, null, null, null, '0', '3', '10', '20181341', '20181341', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1118', '18432323111980', '刘静', '男', null, null, null, null, null, null, '0', '3', '11', '20181345', '20181345', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1119', '18430524154619', '宁波', '女', null, null, null, null, null, null, '0', '3', '8', '20181349', '20181349', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1120', '18430204150573', '宋宏亮', '男', null, null, null, null, null, null, '0', '3', '9', '20181360', '20181360', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1121', '18430726115338', '孙奥阳', '男', null, null, null, null, null, null, '0', '3', '10', '20181362', '20181362', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1122', '18430601151803', '陈星宇', '女', null, null, null, null, null, null, '0', '3', '8', '20181363', '20181363', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1123', '18430528151423', '黄民根', '男', null, null, null, null, null, null, '0', '3', '10', '20181364', '20181364', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1124', '18430501112967', '贺佳倡', '男', null, null, null, null, null, null, '0', '3', '2', '20181365', '20181365', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1125', '18430224153609', '段琦伟', '女', null, null, null, null, null, null, '0', '3', '10', '20181373', '20181373', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1126', '18430106155005', '宋天宇', '男', null, null, null, null, null, null, '0', '3', '9', '20181377', '20181377', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1127', '18430526151745', '龙宇翔', '男', null, null, null, null, null, null, '0', '3', '10', '20181378', '20181378', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1128', '18430421154299', '付文松', '女', null, null, null, null, null, null, '0', '3', '8', '20181379', '20181379', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1129', '18432522154162', '曾勇', '男', null, null, null, null, null, null, '0', '3', '2', '20181386', '20181386', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1130', '18430525153061', '刘昌政', '男', null, null, null, null, null, null, '0', '3', '4', '20181388', '20181388', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1131', '18430623111569', '张坤', '女', null, null, null, null, null, null, '0', '3', '2', '20181389', '20181389', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1132', '18432923112263', '何小路', '男', null, null, null, null, null, null, '0', '3', '10', '20181400', '20181400', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1133', '18432321115143', '刘佳宇', '男', null, null, null, null, null, null, '0', '3', '8', '20181403', '20181403', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1134', '18430121153892', '孙杨', '女', null, null, null, null, null, null, '0', '3', '10', '20181408', '20181408', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1135', '18432928151570', '陈杰华', '男', null, null, null, null, null, null, '0', '3', '8', '20181411', '20181411', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1136', '18430623815967', '蒋凯', '男', null, null, null, null, null, null, '0', '3', '10', '20181415', '20181415', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1137', '18430725111969', '谭骏文', '女', null, null, null, null, null, null, '0', '3', '9', '20181417', '20181417', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1138', '18430201815318', '刘卓琦', '男', null, null, null, null, null, null, '0', '3', '11', '20181420', '20181420', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1139', '18430106155677', '陈骥龙', '男', null, null, null, null, null, null, '0', '3', '10', '20181425', '20181425', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1140', '18430419157685', '谢翔', '女', null, null, null, null, null, null, '0', '3', '2', '20181433', '20181433', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1141', '18432930113959', '宋琳娜', '男', null, null, null, null, null, null, '0', '3', '10', '20181439', '20181439', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1142', '18430624818115', '舒赛', '男', null, null, null, null, null, null, '0', '3', '8', '20181445', '20181445', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1143', '18433022118034', '张宁雪', '女', null, null, null, null, null, null, '0', '3', '10', '20181449', '20181449', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1144', '18430102150454', '刘鸿泽', '男', null, null, null, null, null, null, '0', '3', '10', '20181454', '20181454', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1145', '18430722111838', '戴洁', '男', null, null, null, null, null, null, '0', '3', '4', '20181457', '20181457', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1146', '18430319154425', '龚雨欣', '女', null, null, null, null, null, null, '0', '3', '3', '20181459', '20181459', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1147', '18430123818226', '周隆日', '男', null, null, null, null, null, null, '0', '3', '8', '20181465', '20181465', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1148', '18430423152364', '喻文娟', '男', null, null, null, null, null, null, '0', '3', '11', '20181477', '20181477', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1149', '18432321152962', '贺小龙', '女', null, null, null, null, null, null, '0', '3', '4', '20181493', '20181493', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1150', '18430623816094', '赵诗怡', '男', null, null, null, null, null, null, '0', '3', '11', '20181495', '20181495', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1151', '18430622152490', '喻奥尼', '男', null, null, null, null, null, null, '0', '3', '10', '20181496', '20181496', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1152', '18430622152447', '黄鸿伟', '女', null, null, null, null, null, null, '0', '3', '10', '20181497', '20181497', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1153', '18430124158144', '徐缘', '男', null, null, null, null, null, null, '0', '3', '8', '20181500', '20181500', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1154', '18432826150400', '肖锦涛', '男', null, null, null, null, null, null, '0', '3', '9', '20182202', '20182202', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1155', '18432522152974', '周耀', '女', null, null, null, null, null, null, '0', '3', '2', '20182492', '20182492', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1156', '18430524157260', '马文旺', '男', null, null, null, null, null, null, '0', '3', '2', '20182919', '20182919', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1157', '18430319150597', '张智鹏', '男', null, null, null, null, null, null, '0', '3', '10', '20181314', '20181314', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1158', '18430124114636', '唐江', '女', null, null, null, null, null, null, '0', '3', '8', '20181506', '20181506', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1159', '18430103113618', '滕树华', '男', null, null, null, null, null, null, '0', '3', '8', '20181509', '20181509', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1160', '18430204152172', '周舒怡', '男', null, null, null, null, null, null, '0', '3', '9', '20181512', '20181512', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1161', '18432502813973', '王俊', '女', null, null, null, null, null, null, '0', '3', '10', '20181518', '20181518', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1162', '18430521154299', '刘振', '男', null, null, null, null, null, null, '0', '3', '10', '20181521', '20181521', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1163', '18430724154317', '丁凯旋', '男', null, null, null, null, null, null, '0', '3', '10', '20181523', '20181523', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1164', '18432923817077', '余文', '女', null, null, null, null, null, null, '0', '3', '3', '20181530', '20181530', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1165', '18432502813964', '张婷', '男', null, null, null, null, null, null, '0', '3', '9', '20181537', '20181537', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1166', '18432923153276', '裴鑫', '男', null, null, null, null, null, null, '0', '3', '2', '20181544', '20181544', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1167', '18432502813943', '陈姝', '女', null, null, null, null, null, null, '0', '3', '9', '20181545', '20181545', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1168', '18430321156556', '周赞', '男', null, null, null, null, null, null, '0', '3', '11', '20181550', '20181550', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1169', '18430422154868', '张雅婷', '男', null, null, null, null, null, null, '0', '3', '8', '20181552', '20181552', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1170', '18432323151650', '李成武', '女', null, null, null, null, null, null, '0', '3', '10', '20181563', '20181563', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1171', '18430522110230', '谢毅鹏', '男', null, null, null, null, null, null, '0', '3', '11', '20181566', '20181566', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1172', '18430102815263', '曹轩', '男', null, null, null, null, null, null, '0', '3', '3', '20181571', '20181571', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1173', '18430601112908', '易富林', '女', null, null, null, null, null, null, '0', '3', '10', '20181573', '20181573', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1174', '18430601111152', '陆文涵', '男', null, null, null, null, null, null, '0', '3', '10', '20181574', '20181574', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1175', '18430422158178', '刘谱', '男', null, null, null, null, null, null, '0', '3', '8', '20181575', '20181575', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1176', '18430601111179', '叶建宇', '女', null, null, null, null, null, null, '0', '3', '10', '20181577', '20181577', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1177', '18430624153050', '熊天浩', '男', null, null, null, null, null, null, '0', '3', '10', '20181578', '20181578', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1178', '18432503155518', '杨道强', '男', null, null, null, null, null, null, '0', '3', '8', '20181614', '20181614', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1179', '18430125150126', '杨天祥', '女', null, null, null, null, null, null, '0', '3', '10', '20181617', '20181617', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1180', '18430401151582', '邓嘉怡', '男', null, null, null, null, null, null, '0', '3', '4', '20181621', '20181621', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1181', '18430319819615', '肖乾洋', '男', null, null, null, null, null, null, '0', '3', '3', '20181626', '20181626', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1182', '18430702111374', '孙韬宇', '女', null, null, null, null, null, null, '0', '3', '10', '20181627', '20181627', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1183', '18432831150731', '谢雨龙', '男', null, null, null, null, null, null, '0', '3', '3', '20181628', '20181628', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1184', '18430125812180', '肖潇', '男', null, null, null, null, null, null, '0', '3', '9', '20181634', '20181634', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1185', '18430401116531', '余军庭', '女', null, null, null, null, null, null, '0', '3', '10', '20181648', '20181648', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1186', '18430223112467', '谭炎辉', '男', null, null, null, null, null, null, '0', '3', '11', '20181661', '20181661', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1187', '18430501152884', '彭逸馨', '男', null, null, null, null, null, null, '0', '3', '9', '20181677', '20181677', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1188', '18430124116271', '易火青', '女', null, null, null, null, null, null, '0', '3', '2', '20181687', '20181687', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1189', '18430722818012', '刘意', '男', null, null, null, null, null, null, '0', '3', '8', '20181696', '20181696', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1190', '18432524153727', '鄢隆涛', '男', null, null, null, null, null, null, '0', '3', '10', '20181698', '20181698', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1191', '18430104152650', '李马力', '女', null, null, null, null, null, null, '0', '3', '2', '20181707', '20181707', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1192', '18430421157586', '刘思思', '男', null, null, null, null, null, null, '0', '3', '8', '20181730', '20181730', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1193', '18430524819095', '王洪', '男', null, null, null, null, null, null, '0', '3', '11', '20181731', '20181731', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1194', '18430622153787', '余纪', '女', null, null, null, null, null, null, '0', '3', '10', '20181733', '20181733', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1195', '18432524116831', '廖海强', '男', null, null, null, null, null, null, '0', '3', '10', '20181744', '20181744', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1196', '18430526153230', '梁佳伟', '男', null, null, null, null, null, null, '0', '3', '10', '20181747', '20181747', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1197', '18432524116809', '罗维', '女', null, null, null, null, null, null, '0', '3', '8', '20181748', '20181748', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1198', '18430121152660', '陈启侯', '男', null, null, null, null, null, null, '0', '3', '8', '20181749', '20181749', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1199', '18430102815356', '杨臻', '男', null, null, null, null, null, null, '0', '3', '10', '20181754', '20181754', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1200', '18432323150879', '刘雨浓', '女', null, null, null, null, null, null, '0', '3', '10', '20181756', '20181756', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1201', '18432322151057', '张浩', '男', null, null, null, null, null, null, '0', '3', '10', '20181767', '20181767', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1202', '18430302152033', '何沛铮', '男', null, null, null, null, null, null, '0', '3', '2', '20181798', '20181798', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1203', '18430528111070', '袁智', '女', null, null, null, null, null, null, '0', '3', '10', '20181803', '20181803', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1204', '18430621152465', '张泽政', '男', null, null, null, null, null, null, '0', '3', '10', '20181952', '20181952', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1205', '18430124150299', '周子游', '男', null, null, null, null, null, null, '0', '3', '8', '20182554', '20182554', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1206', '18430623152900', '郑澳', '女', null, null, null, null, null, null, '0', '3', '8', '20182665', '20182665', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1207', '18430106155060', '左轩屹', '男', null, null, null, null, null, null, '0', '3', '9', '20183634', '20183634', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1208', '18433022111096', '胡一鸣', '男', null, null, null, null, null, null, '0', '3', '8', '20181551', '20181551', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1209', '18432826151896', '李曼为', '女', null, null, null, null, null, null, '0', '3', '8', '20181770', '20181770', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1210', '18430524114006', '黄瑛', '男', null, null, null, null, null, null, '0', '3', '2', '20181777', '20181777', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1211', '18430105814865', '张卉', '男', null, null, null, null, null, null, '0', '3', '11', '20181925', '20181925', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1212', '18430501155753', '魏琦', '女', null, null, null, null, null, null, '0', '3', '2', '20181981', '20181981', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1213', '18432522152328', '戴状', '男', null, null, null, null, null, null, '0', '3', '10', '20182417', '20182417', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1214', '18430321154601', '胡佳炬', '男', null, null, null, null, null, null, '0', '3', '2', '20182418', '20182418', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1215', '18430321154549', '胡缘', '女', null, null, null, null, null, null, '0', '3', '2', '20182424', '20182424', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1216', '18432505819810', '王子帆', '男', null, null, null, null, null, null, '0', '3', '8', '20182425', '20182425', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1217', '18430723112099', '易磊', '男', null, null, null, null, null, null, '0', '3', '10', '20182434', '20182434', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1218', '18430521112769', '申文静', '女', null, null, null, null, null, null, '0', '3', '2', '20182439', '20182439', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1219', '18430702152255', '熊峻', '男', null, null, null, null, null, null, '0', '3', '10', '20182440', '20182440', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1220', '18432829150162', '黄政', '男', null, null, null, null, null, null, '0', '3', '2', '20182442', '20182442', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1221', '18430521112775', '曾婷婷', '女', null, null, null, null, null, null, '0', '3', '2', '20182447', '20182447', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1222', '18430526114434', '尹业江', '男', null, null, null, null, null, null, '0', '3', '10', '20182469', '20182469', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1223', '18430601155921', '王子谦', '男', null, null, null, null, null, null, '0', '3', '10', '20182472', '20182472', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1224', '18430724815875', '胡玲', '女', null, null, null, null, null, null, '0', '3', '3', '20182480', '20182480', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1225', '18430601812190', '谢帷嘉', '男', null, null, null, null, null, null, '0', '3', '9', '20182481', '20182481', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1226', '18433005815140', '张振宇', '男', null, null, null, null, null, null, '0', '3', '10', '20182493', '20182493', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1227', '18432326110001', '粟倩怡', '女', null, null, null, null, null, null, '0', '3', '2', '20182494', '20182494', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1228', '18430623816323', '张德', '男', null, null, null, null, null, null, '0', '3', '10', '20182495', '20182495', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1229', '18430423815120', '董俊伟', '男', null, null, null, null, null, null, '0', '3', '11', '20182502', '20182502', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1230', '18432321114514', '周琦俊', '女', null, null, null, null, null, null, '0', '3', '11', '20182506', '20182506', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1231', '18430401819347', '粟俊江', '男', null, null, null, null, null, null, '0', '3', '2', '20182514', '20182514', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1232', '18430422118123', '阳依林', '男', null, null, null, null, null, null, '0', '3', '3', '20182524', '20182524', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1233', '18432924113669', '柏熙', '女', null, null, null, null, null, null, '0', '3', '2', '20182526', '20182526', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1234', '18430319819604', '龚贻可', '男', null, null, null, null, null, null, '0', '3', '8', '20182533', '20182533', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1235', '18432928152639', '胡远卓', '男', null, null, null, null, null, null, '0', '3', '9', '20182536', '20182536', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1236', '18430425151143', '夏新华', '女', null, null, null, null, null, null, '0', '3', '10', '20182539', '20182539', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1237', '18432325150927', '高旭', '男', null, null, null, null, null, null, '0', '3', '10', '20182543', '20182543', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1238', '18432321112292', '王亚', '男', null, null, null, null, null, null, '0', '3', '2', '20182545', '20182545', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1239', '18430621112044', '荣迪', '女', null, null, null, null, null, null, '0', '3', '2', '20182561', '20182561', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1240', '18430424112952', '易俊杰', '男', null, null, null, null, null, null, '0', '3', '10', '20182564', '20182564', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1241', '18432828110290', '胡榕骠', '男', null, null, null, null, null, null, '0', '3', '8', '20182565', '20182565', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1242', '18430105814636', '陈健', '女', null, null, null, null, null, null, '0', '3', '10', '20182577', '20182577', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1243', '18430105153698', '谭茗熙', '男', null, null, null, null, null, null, '0', '3', '10', '20182584', '20182584', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1244', '18430726816202', '姚皓威', '男', null, null, null, null, null, null, '0', '3', '10', '20182593', '20182593', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1245', '18430523110162', '胡姣', '女', null, null, null, null, null, null, '0', '3', '11', '20182600', '20182600', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1246', '18430419815108', '罗康虎', '男', null, null, null, null, null, null, '0', '3', '8', '20182640', '20182640', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1247', '18433127151784', '张扬', '男', null, null, null, null, null, null, '0', '3', '9', '20182647', '20182647', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1248', '18430523159770', '张书航', '女', null, null, null, null, null, null, '0', '3', '4', '20182651', '20182651', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1249', '18430419152134', '刘爱', '男', null, null, null, null, null, null, '0', '3', '8', '20182661', '20182661', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1250', '18430419152174', '资伟', '男', null, null, null, null, null, null, '0', '3', '9', '20182667', '20182667', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1251', '18430521112670', '敬仁', '女', null, null, null, null, null, null, '0', '3', '3', '20182672', '20182672', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1252', '18430526815078', '刘涛涛', '男', null, null, null, null, null, null, '0', '3', '11', '20182678', '20182678', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1253', '18430821815504', '张钦清', '男', null, null, null, null, null, null, '0', '3', '11', '20182684', '20182684', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1254', '18430401112778', '包重阳', '女', null, null, null, null, null, null, '0', '3', '8', '20182690', '20182690', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1255', '18430523150584', '陈旭', '男', null, null, null, null, null, null, '0', '3', '8', '20182720', '20182720', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1256', '18430527152252', '吴天明', '男', null, null, null, null, null, null, '0', '3', '10', '20182780', '20182780', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1257', '18430701112180', '王梦洁', '女', null, null, null, null, null, null, '0', '3', '4', '20183117', '20183117', '430321200001012234', null, '1', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1258', '18432821114211', '首利衡', '男', null, null, null, null, null, null, '0', '3', '10', '20183289', '20183289', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1259', '18430524818653', '刘姣', '男', null, null, null, null, null, null, '0', '3', '10', '20183270', '20183270', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1260', '18430424113161', '郭梓梁', '女', null, null, null, null, null, null, '0', '3', '10', '20183254', '20183254', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1261', '18430401113021', '魏泽旭', '男', null, null, null, null, null, null, '0', '3', '10', '20183251', '20183251', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1262', '18432821110153', '曹自辉', '男', null, null, null, null, null, null, '0', '3', '10', '20183249', '20183249', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1263', '18430521157703', '金昆云', '女', null, null, null, null, null, null, '0', '3', '10', '20183235', '20183235', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1264', '18432923113959', '周俊涛', '男', null, null, null, null, null, null, '0', '3', '10', '20183231', '20183231', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1265', '18432923113813', '彭文彬', '男', null, null, null, null, null, null, '0', '3', '9', '20183230', '20183230', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1266', '18430423815049', '刘景航', '女', null, null, null, null, null, null, '0', '3', '10', '20183226', '20183226', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1267', '18433001811427', '尹天赐', '男', null, null, null, null, null, null, '0', '3', '8', '20183222', '20183222', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1268', '18433125150335', '张金鹏', '男', null, null, null, null, null, null, '0', '3', '10', '20183214', '20183214', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1269', '18430601153455', '刘泽阳', '女', null, null, null, null, null, null, '0', '3', '10', '20183210', '20183210', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1270', '18430724151867', '李博洋', '男', null, null, null, null, null, null, '0', '3', '11', '20183208', '20183208', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1271', '18430621817219', '吴磊', '男', null, null, null, null, null, null, '0', '3', '10', '20183200', '20183200', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1272', '18430524116213', '张艳月', '女', null, null, null, null, null, null, '0', '3', '10', '20183191', '20183191', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1273', '18430621817233', '周锦云', '男', null, null, null, null, null, null, '0', '3', '10', '20183188', '20183188', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1274', '18430523152963', '张智林', '男', null, null, null, null, null, null, '0', '3', '8', '20183171', '20183171', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1275', '18430523112215', '唐子声', '女', null, null, null, null, null, null, '0', '3', '10', '20183168', '20183168', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1276', '18430321819223', '王卓玉', '男', null, null, null, null, null, null, '0', '3', '11', '20183142', '20183142', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1277', '18430321155559', '齐燊', '男', null, null, null, null, null, null, '0', '3', '2', '20183124', '20183124', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1278', '18430624116223', '易帅', '女', null, null, null, null, null, null, '0', '3', '8', '20183123', '20183123', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1279', '18430321155557', '陈鑫龙', '男', null, null, null, null, null, null, '0', '3', '4', '20183119', '20183119', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1280', '18432826811715', '罗佳利', '男', null, null, null, null, null, null, '0', '3', '9', '20183113', '20183113', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1281', '18432826811703', '李布', '女', null, null, null, null, null, null, '0', '3', '3', '20183107', '20183107', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1282', '18430321155599', '彭超征', '男', null, null, null, null, null, null, '0', '3', '10', '20183105', '20183105', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1283', '18430421119855', '周宇', '男', null, null, null, null, null, null, '0', '3', '8', '20183050', '20183050', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1284', '18430525816857', '莫士杰', '女', null, null, null, null, null, null, '0', '3', '8', '20183036', '20183036', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1285', '18432522152325', '陈志广', '男', null, null, null, null, null, null, '0', '3', '4', '20183031', '20183031', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1286', '18430527157127', '彭致远', '男', null, null, null, null, null, null, '0', '3', '8', '20183025', '20183025', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1287', '18433003811163', '杨凯俊', '女', null, null, null, null, null, null, '0', '3', '3', '20183022', '20183022', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1288', '18433027811313', '李淳', '男', null, null, null, null, null, null, '0', '3', '10', '20182993', '20182993', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1289', '18430523110291', '莫倩', '男', null, null, null, null, null, null, '0', '3', '2', '20182960', '20182960', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1290', '18432326150325', '朱镕钦', '女', null, null, null, null, null, null, '0', '3', '10', '20182957', '20182957', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1291', '18432322113347', '李雯', '男', null, null, null, null, null, null, '0', '3', '3', '20182951', '20182951', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1292', '18430501153207', '曾文杰', '男', null, null, null, null, null, null, '0', '3', '10', '20182946', '20182946', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1293', '18432301152701', '曹诗怡', '女', null, null, null, null, null, null, '0', '3', '8', '20182921', '20182921', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1294', '18430102813421', '黄嘉涛', '男', null, null, null, null, null, null, '0', '3', '8', '20182917', '20182917', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1295', '18430426156321', '周海波', '男', null, null, null, null, null, null, '0', '3', '8', '20182913', '20182913', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1296', '18430102813453', '杨涛', '女', null, null, null, null, null, null, '0', '3', '9', '20182908', '20182908', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1297', '18430102813429', '文垒沙', '男', null, null, null, null, null, null, '0', '3', '10', '20182903', '20182903', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1298', '18430102813441', '张伟豪', '男', null, null, null, null, null, null, '0', '3', '3', '20182901', '20182901', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1299', '18432524153685', '张芷苓', '女', null, null, null, null, null, null, '0', '3', '8', '20182900', '20182900', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1300', '18432522152289', '贺英', '男', null, null, null, null, null, null, '0', '3', '10', '20182898', '20182898', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1301', '18430523152487', '吕玉', '男', null, null, null, null, null, null, '0', '3', '4', '20182894', '20182894', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1302', '18430601151079', '郭子熙', '女', null, null, null, null, null, null, '0', '3', '10', '20182884', '20182884', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1303', '18432503152011', '梁遥', '男', null, null, null, null, null, null, '0', '3', '10', '20182874', '20182874', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1304', '18433005153453', '曾淋斌', '男', null, null, null, null, null, null, '0', '3', '3', '20182871', '20182871', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1305', '18430529111949', '喻享伟', '女', null, null, null, null, null, null, '0', '3', '8', '20182858', '20182858', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1306', '18432324152711', '胡缙程', '男', null, null, null, null, null, null, '0', '3', '10', '20182856', '20182856', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1307', '18432503151973', '汤政', '男', null, null, null, null, null, null, '0', '3', '10', '20182851', '20182851', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1308', '18430525153615', '周欢', '女', null, null, null, null, null, null, '0', '3', '4', '20182842', '20182842', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1309', '18430319150369', '成润祺', '男', null, null, null, null, null, null, '0', '3', '3', '20182836', '20182836', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1310', '18433024151529', '舒惠成', '男', null, null, null, null, null, null, '0', '3', '10', '20182812', '20182812', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1311', '18430419152235', '肖东卫', '女', null, null, null, null, null, null, '0', '3', '8', '20183741', '20183741', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1312', '18430421114633', '王璐', '男', null, null, null, null, null, null, '0', '3', '11', '20183711', '20183711', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1313', '18432505113143', '颜喆', '男', null, null, null, null, null, null, '0', '3', '10', '20183706', '20183706', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1314', '18430525153491', '陈嘉鹏', '女', null, null, null, null, null, null, '0', '3', '10', '20183687', '20183687', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1315', '18430601151861', '纪昌海', '男', null, null, null, null, null, null, '0', '3', '10', '20183683', '20183683', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1316', '18432902812039', '黄志涛', '男', null, null, null, null, null, null, '0', '3', '11', '20183672', '20183672', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1317', '18432902812067', '张凯', '女', null, null, null, null, null, null, '0', '3', '11', '20183671', '20183671', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1318', '18430401819049', '谭健', '男', null, null, null, null, null, null, '0', '3', '9', '20183670', '20183670', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1319', '18433021811961', '罗玲', '男', null, null, null, null, null, null, '0', '3', '11', '20183663', '20183663', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1320', '18432505112417', '肖明亮', '女', null, null, null, null, null, null, '0', '3', '2', '20183661', '20183661', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1321', '18430522153031', '李炳志', '男', null, null, null, null, null, null, '0', '3', '8', '20183656', '20183656', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1322', '18430424150809', '秦伟鹏', '男', null, null, null, null, null, null, '0', '3', '8', '20183653', '20183653', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1323', '18430521157719', '王敏', '女', null, null, null, null, null, null, '0', '3', '11', '20183652', '20183652', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1324', '18430541811311', '周柄江', '男', null, null, null, null, null, null, '0', '3', '10', '20183639', '20183639', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1325', '18433003150733', '易师吉', '男', null, null, null, null, null, null, '0', '3', '3', '20183629', '20183629', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1326', '18432930818431', '邓佳丽', '女', null, null, null, null, null, null, '0', '3', '8', '20183618', '20183618', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1327', '18430521112787', '罗宇', '男', null, null, null, null, null, null, '0', '3', '2', '20183611', '20183611', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1328', '18430525153105', '肖敏', '男', null, null, null, null, null, null, '0', '3', '8', '20183605', '20183605', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1329', '18432924156757', '何荣达', '女', null, null, null, null, null, null, '0', '3', '9', '20183594', '20183594', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1330', '18430625112957', '李磊', '男', null, null, null, null, null, null, '0', '3', '10', '20183574', '20183574', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1331', '18430426111571', '彭琦至', '男', null, null, null, null, null, null, '0', '3', '2', '20183569', '20183569', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1332', '18430601153417', '谭天麒', '女', null, null, null, null, null, null, '0', '3', '10', '20183562', '20183562', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1333', '18432503152001', '高毅杰', '男', null, null, null, null, null, null, '0', '3', '2', '20183559', '20183559', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1334', '18430422114357', '罗情', '男', null, null, null, null, null, null, '0', '3', '8', '20183557', '20183557', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1335', '18430621112141', '易漾娟', '女', null, null, null, null, null, null, '0', '3', '2', '20183554', '20183554', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1336', '18432902110349', '和浩', '男', null, null, null, null, null, null, '0', '3', '10', '20183550', '20183550', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1337', '18430321152701', '周晓峰', '男', null, null, null, null, null, null, '0', '3', '8', '20183549', '20183549', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1338', '18432927814619', '李凤强', '女', null, null, null, null, null, null, '0', '3', '2', '20183528', '20183528', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1339', '18432524153717', '伍杰', '男', null, null, null, null, null, null, '0', '3', '3', '20183526', '20183526', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1340', '18430601157247', '段伟仁', '男', null, null, null, null, null, null, '0', '3', '10', '20183525', '20183525', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1341', '18430601157251', '何孟哲', '女', null, null, null, null, null, null, '0', '3', '10', '20183524', '20183524', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1342', '18430726114939', '袁佳伟', '男', null, null, null, null, null, null, '0', '3', '10', '20183522', '20183522', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1343', '18430726114949', '陈子路', '男', null, null, null, null, null, null, '0', '3', '10', '20183520', '20183520', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1344', '18430822151401', '徐玉权', '女', null, null, null, null, null, null, '0', '3', '10', '20183511', '20183511', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1345', '18432503151121', '王意', '男', null, null, null, null, null, null, '0', '3', '8', '20183510', '20183510', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1346', '18430319150315', '王广', '男', null, null, null, null, null, null, '0', '3', '10', '20183503', '20183503', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1347', '18430601819559', '王雅茜', '女', null, null, null, null, null, null, '0', '3', '11', '20183477', '20183477', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1348', '18430121115135', '黄锐', '男', null, null, null, null, null, null, '0', '3', '8', '20183474', '20183474', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1349', '18430726816081', '黎治呈', '男', null, null, null, null, null, null, '0', '3', '10', '20183450', '20183450', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1350', '18430625150385', '汤博文', '女', null, null, null, null, null, null, '0', '3', '8', '20183445', '20183445', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1351', '18432325150941', '谢宇峰', '男', null, null, null, null, null, null, '0', '3', '8', '20183437', '20183437', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1352', '18430623815983', '肖任', '男', null, null, null, null, null, null, '0', '3', '8', '20183415', '20183415', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1353', '18433101110417', '康雅伟', '女', null, null, null, null, null, null, '0', '3', '10', '20183383', '20183383', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1354', '18430726115301', '揭志洲', '男', null, null, null, null, null, null, '0', '3', '8', '20183370', '20183370', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1355', '18430126811051', '杨宁', '男', null, null, null, null, null, null, '0', '3', '11', '20183368', '20183368', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1356', '18430524155627', '周易', '女', null, null, null, null, null, null, '0', '3', '8', '20183362', '20183362', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1357', '18430527112061', '易增峰', '男', null, null, null, null, null, null, '0', '3', '8', '20183346', '20183346', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1358', '18432930156377', '刘有缘', '男', null, null, null, null, null, null, '0', '3', '8', '20183342', '20183342', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1359', '18430521152211', '曾嘉', '女', null, null, null, null, null, null, '0', '3', '10', '20183336', '20183336', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1360', '18430521152195', '申杰', '男', null, null, null, null, null, null, '0', '3', '10', '20183335', '20183335', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1361', '18430521153561', '宁湟', '男', null, null, null, null, null, null, '0', '3', '10', '20183334', '20183334', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1362', '18430201816015', '易雨珂', '女', null, null, null, null, null, null, '0', '3', '11', '20183306', '20183306', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1363', '18433123150231', '吴向东', '男', null, null, null, null, null, null, '0', '3', '10', '20183290', '20183290', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1364', '18433001150862', '廖芳佳豪', '男', null, null, null, null, null, null, '0', '3', '10', '20180884', '20180884', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1365', '18430422152292', '陈亚', '女', null, null, null, null, null, null, '0', '3', '8', '20180880', '20180880', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1366', '18430422112787', '谭永琪', '男', null, null, null, null, null, null, '0', '3', '10', '20180875', '20180875', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1367', '18430426815922', '林文龙', '男', null, null, null, null, null, null, '0', '3', '8', '20180870', '20180870', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1368', '18430621152673', '彭俊', '女', null, null, null, null, null, null, '0', '3', '10', '20180859', '20180859', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1369', '18432826150959', '何坚', '男', null, null, null, null, null, null, '0', '3', '10', '20180854', '20180854', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1370', '18430426111845', '赵飞鸿', '男', null, null, null, null, null, null, '0', '3', '3', '20180846', '20180846', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1371', '18433005113406', '唐震', '女', null, null, null, null, null, null, '0', '3', '4', '20180845', '20180845', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1372', '18432505816088', '张志惠', '男', null, null, null, null, null, null, '0', '3', '9', '20180713', '20180713', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1373', '18430104113946', '康伟健', '男', null, null, null, null, null, null, '0', '3', '4', '20180707', '20180707', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1374', '18430625150728', '李冠东', '女', null, null, null, null, null, null, '0', '3', '8', '20180705', '20180705', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1375', '18433025151447', '王俊', '男', null, null, null, null, null, null, '0', '3', '8', '20180704', '20180704', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1376', '18430422155767', '张文欣', '男', null, null, null, null, null, null, '0', '3', '10', '20180698', '20180698', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1377', '18430104113953', '吴泽琦', '女', null, null, null, null, null, null, '0', '3', '10', '20180697', '20180697', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1378', '18430422155774', '唐雁东', '男', null, null, null, null, null, null, '0', '3', '10', '20180696', '20180696', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1379', '18430701111358', '王璐', '男', null, null, null, null, null, null, '0', '3', '3', '20180691', '20180691', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1380', '18430422155379', '陈麒', '女', null, null, null, null, null, null, '0', '3', '10', '20180689', '20180689', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1381', '18432321156187', '罗涛', '男', null, null, null, null, null, null, '0', '3', '10', '20180687', '20180687', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1382', '18432822151075', '王智媛', '男', null, null, null, null, null, null, '0', '3', '11', '20180681', '20180681', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1383', '18430223814907', '艾玉雅', '女', null, null, null, null, null, null, '0', '3', '10', '20180679', '20180679', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1384', '18430126811038', '钟兴', '男', null, null, null, null, null, null, '0', '3', '10', '20180677', '20180677', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1385', '18430526119692', '肖佳宇', '男', null, null, null, null, null, null, '0', '3', '8', '20180670', '20180670', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1386', '18430622818333', '黄金露', '女', null, null, null, null, null, null, '0', '3', '8', '20180666', '20180666', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1387', '18430105152934', '郑炫成', '男', null, null, null, null, null, null, '0', '3', '2', '20180663', '20180663', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1388', '18433022117016', '周鹏', '男', null, null, null, null, null, null, '0', '3', '2', '20180649', '20180649', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1389', '18433022117047', '李智', '女', null, null, null, null, null, null, '0', '3', '10', '20180644', '20180644', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1390', '18432829150154', '郭李颖', '男', null, null, null, null, null, null, '0', '3', '8', '20180643', '20180643', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1391', '18432924116143', '刘宁', '男', null, null, null, null, null, null, '0', '3', '11', '20180641', '20180641', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1392', '18432502113120', '伍思豪', '女', null, null, null, null, null, null, '0', '3', '8', '20180639', '20180639', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1393', '18432924153443', '李振廷', '男', null, null, null, null, null, null, '0', '3', '10', '20180638', '20180638', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1394', '18432502152592', '杨雷', '男', null, null, null, null, null, null, '0', '3', '8', '20180625', '20180625', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1395', '18430124154534', '朱文超', '女', null, null, null, null, null, null, '0', '3', '8', '20180616', '20180616', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1396', '18432928111731', '蒋依楠', '男', null, null, null, null, null, null, '0', '3', '8', '20180611', '20180611', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1397', '18430426150493', '王水龙', '男', null, null, null, null, null, null, '0', '3', '10', '20180609', '20180609', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1398', '18432928154012', '宋军', '女', null, null, null, null, null, null, '0', '3', '10', '20180607', '20180607', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1399', '18430426150537', '唐雅泉', '男', null, null, null, null, null, null, '0', '3', '10', '20180605', '20180605', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1400', '18432323813104', '周亮', '男', null, null, null, null, null, null, '0', '3', '11', '20180603', '20180603', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1401', '18432323813073', '刘祥镇', '女', null, null, null, null, null, null, '0', '3', '11', '20180601', '20180601', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1402', '18432925151341', '陈成', '男', null, null, null, null, null, null, '0', '3', '8', '20180599', '20180599', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1403', '18430419152245', '资源', '男', null, null, null, null, null, null, '0', '3', '9', '20180598', '20180598', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1404', '18430321154583', '胡俊', '女', null, null, null, null, null, null, '0', '3', '10', '20180597', '20180597', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1405', '18430419110146', '廖子睿', '男', null, null, null, null, null, null, '0', '3', '10', '20180593', '20180593', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1406', '18430103154538', '吴章林', '男', null, null, null, null, null, null, '0', '3', '10', '20180592', '20180592', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1407', '18430821815012', '卓楚杰', '女', null, null, null, null, null, null, '0', '3', '10', '20180590', '20180590', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1408', '18430103154536', '万杨凡', '男', null, null, null, null, null, null, '0', '3', '10', '20180589', '20180589', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1409', '18432902812158', '卢梦南', '男', null, null, null, null, null, null, '0', '3', '10', '20180584', '20180584', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1410', '18432902812163', '朱登强', '女', null, null, null, null, null, null, '0', '3', '10', '20180582', '20180582', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1411', '18430124117478', '虞展哲', '男', null, null, null, null, null, null, '0', '3', '10', '20180581', '20180581', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1412', '18430525815556', '彭浩', '男', null, null, null, null, null, null, '0', '3', '3', '20180578', '20180578', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1413', '18430302111918', '李昕哲', '女', null, null, null, null, null, null, '0', '3', '10', '20180576', '20180576', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1414', '18430722818010', '叶艳红', '男', null, null, null, null, null, null, '0', '3', '11', '20180575', '20180575', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1415', '18430501114465', '陈格', '男', null, null, null, null, null, null, '0', '3', '4', '20180570', '20180570', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1416', '18430106112414', '谭曲江', '女', null, null, null, null, null, null, '0', '3', '10', '20180567', '20180567', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1417', '18433027150592', '贾慧婷', '男', null, null, null, null, null, null, '0', '3', '11', '20180563', '20180563', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1418', '18430625151598', '柳涛', '男', null, null, null, null, null, null, '0', '3', '8', '20180550', '20180550', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1419', '18432823812622', '邓卫', '女', null, null, null, null, null, null, '0', '3', '8', '20180545', '20180545', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1420', '18430419152539', '龙泽海', '男', null, null, null, null, null, null, '0', '3', '4', '20183180', '20183180', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1421', '18430102813427', '邓锦涛', '男', null, null, null, null, null, null, '0', '3', '3', '20182926', '20182926', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1422', '18430625112709', '刘点盟', '女', null, null, null, null, null, null, '0', '3', '9', '20182793', '20182793', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1423', '18430102813378', '王亚雄', '男', null, null, null, null, null, null, '0', '3', '2', '20181207', '20181207', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1424', '18433025812021', '滕汾芳', '男', null, null, null, null, null, null, '0', '3', '8', '20181144', '20181144', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1425', '18430122813233', '任嘉诚', '女', null, null, null, null, null, null, '0', '3', '8', '20180945', '20180945', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1426', '18432801113486', '贺波瀚', '男', null, null, null, null, null, null, '0', '3', '2', '20180938', '20180938', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1427', '18430601111901', '梁茂林', '男', null, null, null, null, null, null, '0', '3', '2', '20180936', '20180936', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1428', '18430419114745', '彭诗怀', '女', null, null, null, null, null, null, '0', '3', '10', '20180933', '20180933', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1429', '18432522152972', '钟军胜', '男', null, null, null, null, null, null, '0', '3', '11', '20180917', '20180917', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1430', '18430426151989', '邹瑶民', '男', null, null, null, null, null, null, '0', '3', '10', '20180915', '20180915', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1431', '18430426114954', '陈俊杰', '女', null, null, null, null, null, null, '0', '3', '4', '20180896', '20180896', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1432', '18430426114955', '周鹏', '男', null, null, null, null, null, null, '0', '3', '4', '20180895', '20180895', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1433', '18430426114912', '王钰', '男', null, null, null, null, null, null, '0', '3', '10', '20180891', '20180891', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1434', '18430121154957', '王朝', '女', null, null, null, null, null, null, '0', '3', '3', '20180885', '20180885', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1435', '18433021150440', '蒋权', '男', null, null, null, null, null, null, '0', '3', '10', '20180842', '20180842', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1436', '18432927810130', '龙芬', '男', null, null, null, null, null, null, '0', '3', '3', '20180829', '20180829', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1437', '18430541810222', '赵佩佩', '女', null, null, null, null, null, null, '0', '3', '3', '20180828', '20180828', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1438', '18430124119502', '颜勇全', '男', null, null, null, null, null, null, '0', '3', '11', '20180825', '20180825', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1439', '18430821815443', '何汕璟', '男', null, null, null, null, null, null, '0', '3', '8', '20180819', '20180819', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1440', '18432321154139', '颜程坤', '女', null, null, null, null, null, null, '0', '3', '2', '20180818', '20180818', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1441', '18432524156921', '陈凤夷', '男', null, null, null, null, null, null, '0', '3', '10', '20180815', '20180815', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1442', '18433130154624', '李健华', '男', null, null, null, null, null, null, '0', '3', '10', '20180814', '20180814', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1443', '18432321154172', '曾誉', '女', null, null, null, null, null, null, '0', '3', '9', '20180810', '20180810', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1444', '18433130154629', '向博', '男', null, null, null, null, null, null, '0', '3', '11', '20180808', '20180808', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1445', '18430104152648', '黄明辉', '男', null, null, null, null, null, null, '0', '3', '10', '20180801', '20180801', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1446', '18430422155446', '陈文杰', '女', null, null, null, null, null, null, '0', '3', '10', '20180800', '20180800', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1447', '18432822151700', '肖智宸', '男', null, null, null, null, null, null, '0', '3', '10', '20180798', '20180798', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1448', '18430423154112', '丁炜', '男', null, null, null, null, null, null, '0', '3', '10', '20180794', '20180794', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1449', '18430104152652', '刘桂秋', '女', null, null, null, null, null, null, '0', '3', '10', '20180793', '20180793', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1450', '18430423154142', '李武', '男', null, null, null, null, null, null, '0', '3', '11', '20180789', '20180789', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1451', '18432924150657', '欧胜涛', '男', null, null, null, null, null, null, '0', '3', '10', '20180786', '20180786', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1452', '18432824110910', '罗刚', '女', null, null, null, null, null, null, '0', '3', '10', '20180783', '20180783', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1453', '18430103154519', '何志颖', '男', null, null, null, null, null, null, '0', '3', '10', '20180773', '20180773', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1454', '18430103154527', '刘靖源', '男', null, null, null, null, null, null, '0', '3', '10', '20180772', '20180772', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1455', '18430524115812', '刘任彪', '女', null, null, null, null, null, null, '0', '3', '11', '20180771', '20180771', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1456', '18430104152647', '戴鑫', '男', null, null, null, null, null, null, '0', '3', '8', '20180770', '20180770', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1457', '18432901111242', '王赟', '男', null, null, null, null, null, null, '0', '3', '10', '20180769', '20180769', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1458', '18432930153562', '王鸿飞', '女', null, null, null, null, null, null, '0', '3', '10', '20180768', '20180768', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1459', '18432901111245', '金宇', '男', null, null, null, null, null, null, '0', '3', '10', '20180765', '20180765', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1460', '18430821815011', '唐耿斌', '男', null, null, null, null, null, null, '0', '3', '8', '20180761', '20180761', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1461', '18430821815030', '胡祖顺', '女', null, null, null, null, null, null, '0', '3', '8', '20180759', '20180759', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1462', '18430223152250', '杨懿', '男', null, null, null, null, null, null, '0', '3', '10', '20180758', '20180758', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1463', '18430421117556', '钟伟丽', '男', null, null, null, null, null, null, '0', '3', '4', '20180742', '20180742', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1464', '18430421117542', '许健民', '女', null, null, null, null, null, null, '0', '3', '8', '20180741', '20180741', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1465', '18433005154937', '张胜', '男', null, null, null, null, null, null, '0', '3', '11', '20180734', '20180734', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1466', '18430623111556', '危佳', '男', null, null, null, null, null, null, '0', '3', '11', '20180725', '20180725', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1467', '18430124116360', '王句儿', '女', null, null, null, null, null, null, '0', '3', '9', '20180720', '20180720', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1468', '18432824112379', '谭博帅', '男', null, null, null, null, null, null, '0', '3', '10', '20180715', '20180715', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1469', '18430121152654', '易博文', '男', null, null, null, null, null, null, '0', '3', '2', '20180714', '20180714', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1470', '18430723112078', '胡平', '女', null, null, null, null, null, null, '0', '3', '4', '20180693', '20180693', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1471', '18430124155840', '刘宇轩', '男', null, null, null, null, null, null, '0', '3', '2', '20180534', '20180534', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1472', '18430121115769', '秦光荣', '男', null, null, null, null, null, null, '0', '3', '2', '20180343', '20180343', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1473', '18430121155397', '杨思铭', '女', null, null, null, null, null, null, '0', '3', '10', '20180250', '20180250', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1474', '18430105814850', '苏鑫宇', '男', null, null, null, null, null, null, '0', '3', '8', '20180001', '20180001', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1475', '18430725111899', '贾子琪', '男', null, null, null, null, null, null, '0', '3', '9', '20181184', '20181184', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1476', '18430425158321', '阳勇', '女', null, null, null, null, null, null, '0', '3', '8', '20181181', '20181181', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1477', '18430623113350', '鲁豪', '男', null, null, null, null, null, null, '0', '3', '10', '20181171', '20181171', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1478', '18432930152191', '周志超', '男', null, null, null, null, null, null, '0', '3', '8', '20181167', '20181167', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1479', '18430223153534', '王阳', '女', null, null, null, null, null, null, '0', '3', '10', '20181164', '20181164', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1480', '18430623152953', '吴广', '男', null, null, null, null, null, null, '0', '3', '11', '20181153', '20181153', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1481', '18433124111087', '龙俊松', '男', null, null, null, null, null, null, '0', '3', '10', '20181151', '20181151', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1482', '18430623152971', '易威', '女', null, null, null, null, null, null, '0', '3', '10', '20181149', '20181149', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1483', '18430525152463', '李尧烨', '男', null, null, null, null, null, null, '0', '3', '10', '20181147', '20181147', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1484', '18430623113264', '赵海', '男', null, null, null, null, null, null, '0', '3', '10', '20181133', '20181133', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1485', '18430122813460', '何诗缤', '女', null, null, null, null, null, null, '0', '3', '10', '20181126', '20181126', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1486', '18430122813450', '秦冰雁', '男', null, null, null, null, null, null, '0', '3', '2', '20181121', '20181121', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1487', '18430122813442', '杨皓', '男', null, null, null, null, null, null, '0', '3', '2', '20181114', '20181114', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1488', '18432502813930', '谢祺玮', '女', null, null, null, null, null, null, '0', '3', '10', '20181113', '20181113', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1489', '18430424150051', '罗雨琪', '男', null, null, null, null, null, null, '0', '3', '11', '20181108', '20181108', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1490', '18430122813448', '周准', '男', null, null, null, null, null, null, '0', '3', '10', '20181107', '20181107', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1491', '18430424150032', '谭文杰', '女', null, null, null, null, null, null, '0', '3', '3', '20181101', '20181101', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1492', '18430122813454', '杨冰', '男', null, null, null, null, null, null, '0', '3', '11', '20181100', '20181100', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1493', '18432323813100', '胡靖', '男', null, null, null, null, null, null, '0', '3', '3', '20181097', '20181097', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1494', '18430304115982', '章千禧', '女', null, null, null, null, null, null, '0', '3', '11', '20181089', '20181089', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1495', '18430126811017', '张鑫栋', '男', null, null, null, null, null, null, '0', '3', '8', '20181087', '20181087', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1496', '18430123112864', '吴冬兰', '男', null, null, null, null, null, null, '0', '3', '10', '20181083', '20181083', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1497', '18430122151904', '黎腾', '女', null, null, null, null, null, null, '0', '3', '10', '20181082', '20181082', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1498', '18432524156223', '罗向辉', '男', null, null, null, null, null, null, '0', '3', '2', '20181080', '20181080', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1499', '18432802811724', '刘嘉杰', '男', null, null, null, null, null, null, '0', '3', '8', '20181069', '20181069', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1500', '18432929152337', '黄少沣', '女', null, null, null, null, null, null, '0', '3', '4', '20181059', '20181059', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1501', '18432522156171', '彭伟哲', '男', null, null, null, null, null, null, '0', '3', '4', '20181057', '20181057', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1502', '18432929152350', '刘洋', '男', null, null, null, null, null, null, '0', '3', '4', '20181056', '20181056', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1503', '18433031150615', '胥永昌', '女', null, null, null, null, null, null, '0', '3', '10', '20181037', '20181037', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1504', '18430425111611', '王清腾', '男', null, null, null, null, null, null, '0', '3', '2', '20181036', '20181036', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1505', '18430624154147', '舒畅', '男', null, null, null, null, null, null, '0', '3', '10', '20181034', '20181034', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1506', '18430425111621', '朱涛', '女', null, null, null, null, null, null, '0', '3', '2', '20181031', '20181031', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1507', '18430621114316', '肖锤', '男', null, null, null, null, null, null, '0', '3', '9', '20181030', '20181030', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1508', '18432827111503', '陈晴', '男', null, null, null, null, null, null, '0', '3', '8', '20181027', '20181027', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1509', '18430621110482', '侯阔', '女', null, null, null, null, null, null, '0', '3', '9', '20181025', '20181025', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1510', '18432524152542', '刘佳栋', '男', null, null, null, null, null, null, '0', '3', '10', '20181019', '20181019', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1511', '18433030811423', '邹明江', '男', null, null, null, null, null, null, '0', '3', '10', '20181009', '20181009', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1512', '18430528151441', '袁子辉', '女', null, null, null, null, null, null, '0', '3', '10', '20181004', '20181004', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1513', '18430219813896', '谢文佳', '男', null, null, null, null, null, null, '0', '3', '10', '20180988', '20180988', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1514', '18432901813527', '刘培', '男', null, null, null, null, null, null, '0', '3', '10', '20180987', '20180987', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1515', '18432901813903', '王伟波', '女', null, null, null, null, null, null, '0', '3', '2', '20180984', '20180984', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1516', '18430426154227', '徐哲', '男', null, null, null, null, null, null, '0', '3', '3', '20180980', '20180980', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1517', '18430424111524', '陈朗', '男', null, null, null, null, null, null, '0', '3', '10', '20180972', '20180972', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1518', '18430523117113', '钟警', '女', null, null, null, null, null, null, '0', '3', '8', '20180962', '20180962', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1519', '18430701151987', '杨鹏飞', '男', null, null, null, null, null, null, '0', '3', '10', '20180953', '20180953', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1520', '18430524117508', '罗浩', '男', null, null, null, null, null, null, '0', '3', '8', '20180951', '20180951', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1521', '18432801816542', '罗凯圆', '女', null, null, null, null, null, null, '0', '3', '8', '20180949', '20180949', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1522', '18430122813201', '胡奕欣', '男', null, null, null, null, null, null, '0', '3', '8', '20180948', '20180948', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1523', '18430121153404', '王宇轩', '男', null, null, null, null, null, null, '0', '3', '10', '20180946', '20180946', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1524', '18430401156396', '唐婉清', '女', null, null, null, null, null, null, '0', '3', '10', '20180046', '20180046', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1525', '18430523816061', '吴慧娟', '男', null, null, null, null, null, null, '0', '3', '11', '20180036', '20180036', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1526', '18432522818630', '宋娟', '男', null, null, null, null, null, null, '0', '3', '4', '20180033', '20180033', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1527', '18433123110928', '杨代鹏', '女', null, null, null, null, null, null, '0', '3', '10', '20180031', '20180031', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1528', '18430522112114', '唐泽宇', '男', null, null, null, null, null, null, '0', '3', '10', '20180021', '20180021', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1529', '18432826151446', '廖鹏勇', '男', null, null, null, null, null, null, '0', '3', '9', '20180017', '20180017', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1530', '18430424153746', '肖炎龙', '女', null, null, null, null, null, null, '0', '3', '8', '20180009', '20180009', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1531', '18430319819699', '赵靖', '男', null, null, null, null, null, null, '0', '3', '10', '20183543', '20183543', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1532', '18430522110413', '陈立鑫', '男', null, null, null, null, null, null, '0', '3', '2', '20183294', '20183294', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1533', '18432324814542', '刘志新', '女', null, null, null, null, null, null, '0', '3', '8', '20181208', '20181208', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1534', '18430725111991', '杨宇洁', '男', null, null, null, null, null, null, '0', '3', '8', '20181191', '20181191', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1535', '18430528111088', '赵新龙', '男', null, null, null, null, null, null, '0', '3', '9', '20181142', '20181142', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1536', '18432325153421', '胡海龙', '女', null, null, null, null, null, null, '0', '3', '9', '20181016', '20181016', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1537', '18430601151792', '许泽锴', '男', null, null, null, null, null, null, '0', '3', '9', '20180737', '20180737', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1538', '18432321156190', '汤卓', '男', null, null, null, null, null, null, '0', '3', '10', '20180694', '20180694', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1539', '18430611151152', '廖锦涛', '女', null, null, null, null, null, null, '0', '3', '8', '20180552', '20180552', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1540', '18432323152410', '文望', '男', null, null, null, null, null, null, '0', '3', '8', '20180542', '20180542', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1541', '18430105814734', '毕如', '男', null, null, null, null, null, null, '0', '3', '11', '20180453', '20180453', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1542', '18430722113240', '彭志伟', '女', null, null, null, null, null, null, '0', '3', '10', '20180344', '20180344', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1543', '18430719112009', '施皓程', '男', null, null, null, null, null, null, '0', '3', '11', '20180339', '20180339', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1544', '18430124116341', '熊晓玲', '男', null, null, null, null, null, null, '0', '3', '9', '20180306', '20180306', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1545', '18433025111938', '欧俊', '女', null, null, null, null, null, null, '0', '3', '8', '20180249', '20180249', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1546', '18433025110793', '张芳铭', '男', null, null, null, null, null, null, '0', '3', '8', '20180243', '20180243', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1547', '18432801112839', '杨永红', '男', null, null, null, null, null, null, '0', '3', '10', '20180234', '20180234', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1548', '18430104112742', '唐豪', '女', null, null, null, null, null, null, '0', '3', '2', '20180231', '20180231', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1549', '18430424115910', '赵鑫驰', '男', null, null, null, null, null, null, '0', '3', '8', '20180227', '20180227', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1550', '18433123111474', '唐子骋', '男', null, null, null, null, null, null, '0', '3', '9', '20180226', '20180226', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1551', '18432321154164', '黄宗阳', '女', null, null, null, null, null, null, '0', '3', '8', '20180225', '20180225', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1552', '18430523152894', '蒋帆', '男', null, null, null, null, null, null, '0', '3', '11', '20180224', '20180224', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1553', '18430424115927', '何文诗', '男', null, null, null, null, null, null, '0', '3', '11', '20180219', '20180219', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1554', '18433101150607', '黄湘军', '女', null, null, null, null, null, null, '0', '3', '10', '20180215', '20180215', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1555', '18430529152293', '阳旭', '男', null, null, null, null, null, null, '0', '3', '9', '20180213', '20180213', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1556', '18430724154318', '赵若彤', '男', null, null, null, null, null, null, '0', '3', '3', '20180212', '20180212', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1557', '18433003150098', '林子康', '女', null, null, null, null, null, null, '0', '3', '2', '20180209', '20180209', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1558', '18430426156575', '陈凯', '男', null, null, null, null, null, null, '0', '3', '10', '20180206', '20180206', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1559', '18430105814705', '杨静', '男', null, null, null, null, null, null, '0', '3', '11', '20180194', '20180194', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1560', '18433002150277', '杨克勤', '女', null, null, null, null, null, null, '0', '3', '8', '20180192', '20180192', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1561', '18432827150103', '唐志辉', '男', null, null, null, null, null, null, '0', '3', '3', '20180184', '20180184', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1562', '18433001150820', '龙振朝', '男', null, null, null, null, null, null, '0', '3', '8', '20180179', '20180179', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1563', '18432823150617', '陈蓉璨', '女', null, null, null, null, null, null, '0', '3', '4', '20180174', '20180174', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1564', '18432822150619', '肖聪', '男', null, null, null, null, null, null, '0', '3', '2', '20180168', '20180168', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1565', '18432822150634', '陈志强', '男', null, null, null, null, null, null, '0', '3', '2', '20180166', '20180166', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1566', '18430525114696', '林佳蔚', '女', null, null, null, null, null, null, '0', '3', '9', '20180162', '20180162', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1567', '18433001150812', '肖杭', '男', null, null, null, null, null, null, '0', '3', '10', '20180160', '20180160', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1568', '18432823150613', '曹文天', '男', null, null, null, null, null, null, '0', '3', '11', '20180159', '20180159', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1569', '18430421117853', '刘国梁', '女', null, null, null, null, null, null, '0', '3', '10', '20180158', '20180158', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1570', '18433021811947', '陈力嘉', '男', null, null, null, null, null, null, '0', '3', '10', '20180147', '20180147', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1571', '18433023150922', '胡政', '男', null, null, null, null, null, null, '0', '3', '8', '20180146', '20180146', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1572', '18430421153228', '刘芬', '女', null, null, null, null, null, null, '0', '3', '11', '20180145', '20180145', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1573', '18432930815397', '周瑞', '男', null, null, null, null, null, null, '0', '3', '4', '20180140', '20180140', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1574', '18430425156104', '彭涛', '男', null, null, null, null, null, null, '0', '3', '2', '20180134', '20180134', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1575', '18433021811942', '蒋威', '女', null, null, null, null, null, null, '0', '3', '2', '20180128', '20180128', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1576', '18430424155518', '边文涛', '男', null, null, null, null, null, null, '0', '3', '2', '20180104', '20180104', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1577', '18432502112402', '段诗婕', '男', null, null, null, null, null, null, '0', '3', '11', '20180102', '20180102', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1578', '18432502112425', '潘湘玲', '女', null, null, null, null, null, null, '0', '3', '11', '20180099', '20180099', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1579', '18432502112422', '段嘉兴', '男', null, null, null, null, null, null, '0', '3', '9', '20180098', '20180098', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1580', '18433024111311', '李泓宇', '男', null, null, null, null, null, null, '0', '3', '8', '20180097', '20180097', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1581', '18430223112375', '贺奥奇', '女', null, null, null, null, null, null, '0', '3', '10', '20180091', '20180091', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1582', '18430722817236', '李文亮', '男', null, null, null, null, null, null, '0', '3', '9', '20180085', '20180085', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1583', '18430526159187', '肖坤', '男', null, null, null, null, null, null, '0', '3', '10', '20180082', '20180082', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1584', '18432325150654', '陈千禧', '女', null, null, null, null, null, null, '0', '3', '3', '20180075', '20180075', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1585', '18430526815063', '刘紫茜', '男', null, null, null, null, null, null, '0', '3', '10', '20180073', '20180073', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1586', '18430125812065', '陈桢', '男', null, null, null, null, null, null, '0', '3', '8', '20180069', '20180069', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1587', '18432924156472', '刘超', '女', null, null, null, null, null, null, '0', '3', '8', '20180068', '20180068', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1588', '18430526815064', '黄瑶', '男', null, null, null, null, null, null, '0', '3', '10', '20180067', '20180067', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1589', '18430526815072', '邓巧', '男', null, null, null, null, null, null, '0', '3', '11', '20180065', '20180065', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1590', '18430124116869', '刘维佳', '女', null, null, null, null, null, null, '0', '3', '10', '20180058', '20180058', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1591', '18433022112343', '李景文', '男', null, null, null, null, null, null, '0', '3', '11', '20180048', '20180048', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1592', '18432901111629', '谷锦江', '男', null, null, null, null, null, null, '0', '3', '11', '20183359', '20183359', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1593', '18430105152580', '李旭', '女', null, null, null, null, null, null, '0', '3', '10', '20181204', '20181204', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1594', '18430103153353', '宋佳惠', '男', null, null, null, null, null, null, '0', '3', '3', '20181169', '20181169', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1595', '18430625110851', '李昊轩', '男', null, null, null, null, null, null, '0', '3', '8', '20180952', '20180952', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1596', '18430122151965', '竺舣波', '女', null, null, null, null, null, null, '0', '3', '10', '20180805', '20180805', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1597', '18430527157162', '李龙海', '男', null, null, null, null, null, null, '0', '3', '8', '20180750', '20180750', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1598', '18432321156193', '谭垚', '男', null, null, null, null, null, null, '0', '3', '10', '20180680', '20180680', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1599', '18432323813149', '曾煜婷', '女', null, null, null, null, null, null, '0', '3', '8', '20180579', '20180579', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1600', '18432323152467', '李可', '男', null, null, null, null, null, null, '0', '3', '10', '20180546', '20180546', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1601', '18432323152474', '吴涛', '男', null, null, null, null, null, null, '0', '3', '10', '20180540', '20180540', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1602', '18430125110436', '刘雨欣', '女', null, null, null, null, null, null, '0', '3', '11', '20180537', '20180537', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1603', '18430122114153', '黄祺', '男', null, null, null, null, null, null, '0', '3', '2', '20180536', '20180536', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1604', '18432927814705', '雷勋政', '男', null, null, null, null, null, null, '0', '3', '11', '20180533', '20180533', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1605', '18432927814768', '黄浩', '女', null, null, null, null, null, null, '0', '3', '11', '20180532', '20180532', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1606', '18432927814719', '孟俊宏', '男', null, null, null, null, null, null, '0', '3', '11', '20180531', '20180531', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1607', '18430123155642', '徐瑶', '男', null, null, null, null, null, null, '0', '3', '11', '20180530', '20180530', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1608', '18432927814724', '雷勋鹏', '女', null, null, null, null, null, null, '0', '3', '11', '20180529', '20180529', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1609', '18432821153409', '黄鑫', '男', null, null, null, null, null, null, '0', '3', '10', '20180528', '20180528', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1610', '18430125812031', '姜纪丰', '男', null, null, null, null, null, null, '0', '3', '11', '20180525', '20180525', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1611', '18432322151895', '王立杰', '女', null, null, null, null, null, null, '0', '3', '10', '20180519', '20180519', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1612', '18432930152173', '桂斌', '男', null, null, null, null, null, null, '0', '3', '9', '20180518', '20180518', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1613', '18432524118285', '杨牧', '男', null, null, null, null, null, null, '0', '3', '8', '20180509', '20180509', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1614', '18432927153755', '谭真波', '女', null, null, null, null, null, null, '0', '3', '4', '20180499', '20180499', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1615', '18432801114348', '周维', '男', null, null, null, null, null, null, '0', '3', '10', '20180489', '20180489', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1616', '18430105814754', '钟佳慧', '男', null, null, null, null, null, null, '0', '3', '2', '20180483', '20180483', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1617', '18430105814745', '孟雨寒', '女', null, null, null, null, null, null, '0', '3', '2', '20180478', '20180478', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1618', '18430105814735', '范炳炎', '男', null, null, null, null, null, null, '0', '3', '3', '20180462', '20180462', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1619', '18432324153594', '符俏', '男', null, null, null, null, null, null, '0', '3', '8', '20180457', '20180457', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1620', '18432324113263', '周宇', '女', null, null, null, null, null, null, '0', '3', '10', '20180456', '20180456', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1621', '18432502814209', '肖忠龙', '男', null, null, null, null, null, null, '0', '3', '10', '20180450', '20180450', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1622', '18430105814762', '舒悦', '男', null, null, null, null, null, null, '0', '3', '3', '20180448', '20180448', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1623', '18432322113221', '曾婷', '女', null, null, null, null, null, null, '0', '3', '8', '20180447', '20180447', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1624', '18432524153743', '易天宇', '男', null, null, null, null, null, null, '0', '3', '10', '20180444', '20180444', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1625', '18430625111022', '陈子琛', '男', null, null, null, null, null, null, '0', '3', '9', '20180435', '20180435', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1626', '18430122151837', '丁帅', '女', null, null, null, null, null, null, '0', '3', '10', '20180419', '20180419', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1627', '18432325814330', '姚敏', '男', null, null, null, null, null, null, '0', '3', '3', '20180411', '20180411', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1628', '18430122813581', '梁思', '男', null, null, null, null, null, null, '0', '3', '11', '20180402', '20180402', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1629', '18432802150028', '李汤', '女', null, null, null, null, null, null, '0', '3', '10', '20180399', '20180399', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1630', '18433130110250', '易文潇', '男', null, null, null, null, null, null, '0', '3', '2', '20180377', '20180377', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1631', '18433101154728', '龙强', '男', null, null, null, null, null, null, '0', '3', '10', '20180376', '20180376', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1632', '18432321115089', '杨玲', '女', null, null, null, null, null, null, '0', '3', '10', '20180363', '20180363', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1633', '18432827150217', '何晓丽', '男', null, null, null, null, null, null, '0', '3', '9', '20180361', '20180361', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1634', '18433025151434', '滕俊', '男', null, null, null, null, null, null, '0', '3', '9', '20180355', '20180355', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1635', '18432505816076', '肖腾', '女', null, null, null, null, null, null, '0', '3', '9', '20180354', '20180354', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1636', '18432829150179', '叶汇钦', '男', null, null, null, null, null, null, '0', '3', '10', '20180346', '20180346', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1637', '18432823111428', '陈慧红', '男', null, null, null, null, null, null, '0', '3', '2', '20180335', '20180335', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1638', '18430611150435', '文啟洋', '女', null, null, null, null, null, null, '0', '3', '3', '20180330', '20180330', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1639', '18430426156683', '周俊霖', '男', null, null, null, null, null, null, '0', '3', '11', '20180328', '20180328', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1640', '18430225150756', '胡俊杰', '男', null, null, null, null, null, null, '0', '3', '10', '20180327', '20180327', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1641', '18430104153899', '陈智涛', '女', null, null, null, null, null, null, '0', '3', '10', '20180308', '20180308', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1642', '18430526815056', '罗碧林', '男', null, null, null, null, null, null, '0', '3', '8', '20180307', '20180307', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1643', '18430302150510', '赵子豪', '男', null, null, null, null, null, null, '0', '3', '8', '20180297', '20180297', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1644', '18430526153220', '周鹏辉', '女', null, null, null, null, null, null, '0', '3', '8', '20180286', '20180286', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1645', '18430526153224', '刘兴泽', '男', null, null, null, null, null, null, '0', '3', '8', '20180281', '20180281', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1646', '18430526815057', '林斯琦', '男', null, null, null, null, null, null, '0', '3', '8', '20180262', '20180262', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1647', '18430622818280', '汤珊', '女', null, null, null, null, null, null, '0', '3', '8', '20180084', '20180084', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1648', '18430524154427', '彭文广', '男', null, null, null, null, null, null, '0', '3', '10', '20183709', '20183709', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1649', '18430419154515', '欧阳昭鑫', '男', null, null, null, null, null, null, '0', '3', '10', '20183504', '20183504', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1650', '18430422156317', '李驰', '女', null, null, null, null, null, null, '0', '3', '10', '20183469', '20183469', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1651', '18430221151503', '刘嘉胤', '男', null, null, null, null, null, null, '0', '3', '8', '20183118', '20183118', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1652', '18430122814759', '董广龙', '男', null, null, null, null, null, null, '0', '3', '4', '20182809', '20182809', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1653', '18430122813871', '袁超', '女', null, null, null, null, null, null, '0', '3', '3', '20182803', '20182803', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1654', '18432801150927', '钟文鹏', '男', null, null, null, null, null, null, '0', '3', '9', '20182802', '20182802', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1655', '18430723117509', '梅宇峰', '男', null, null, null, null, null, null, '0', '3', '3', '20182800', '20182800', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1656', '18432522156051', '王思源', '女', null, null, null, null, null, null, '0', '3', '11', '20182791', '20182791', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1657', '18432324112289', '李湛江', '男', null, null, null, null, null, null, '0', '3', '11', '20182784', '20182784', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1658', '18430524157149', '陈桂培', '男', null, null, null, null, null, null, '0', '3', '10', '20182779', '20182779', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1659', '18430419157845', '何义神', '女', null, null, null, null, null, null, '0', '3', '10', '20182777', '20182777', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1660', '18432930814853', '刘帅', '男', null, null, null, null, null, null, '0', '3', '10', '20182776', '20182776', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1661', '18432826811827', '李钰', '男', null, null, null, null, null, null, '0', '3', '10', '20182772', '20182772', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1662', '18430621817277', '徐宏彬', '女', null, null, null, null, null, null, '0', '3', '8', '20182749', '20182749', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1663', '18430724153505', '陈志强', '男', null, null, null, null, null, null, '0', '3', '10', '20182744', '20182744', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1664', '18430725152353', '邵紫程', '男', null, null, null, null, null, null, '0', '3', '8', '20182728', '20182728', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1665', '18430726153573', '孙晓曼', '女', null, null, null, null, null, null, '0', '3', '11', '20182725', '20182725', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1666', '18432324152885', '秦佳豪', '男', null, null, null, null, null, null, '0', '3', '10', '20182723', '20182723', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1667', '18432324152887', '文闽龙', '男', null, null, null, null, null, null, '0', '3', '11', '20182716', '20182716', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1668', '18430521118411', '李威', '女', null, null, null, null, null, null, '0', '3', '9', '20182711', '20182711', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1669', '18432827150073', '王俊洁', '男', null, null, null, null, null, null, '0', '3', '10', '20182706', '20182706', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1670', '18430501118727', '陈瑶', '男', null, null, null, null, null, null, '0', '3', '10', '20182705', '20182705', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1671', '18433123110609', '龙柚彤', '女', null, null, null, null, null, null, '0', '3', '11', '20182698', '20182698', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1672', '18430423815307', '赵炯', '男', null, null, null, null, null, null, '0', '3', '10', '20182673', '20182673', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1673', '18430419815077', '刘小艳', '男', null, null, null, null, null, null, '0', '3', '8', '20182650', '20182650', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1674', '18430419815085', '陆凤娟', '女', null, null, null, null, null, null, '0', '3', '8', '20182646', '20182646', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1675', '18430419815111', '贺伦', '男', null, null, null, null, null, null, '0', '3', '8', '20182635', '20182635', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1676', '18430419818209', '刘思思', '男', null, null, null, null, null, null, '0', '3', '11', '20182632', '20182632', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1677', '18430426111791', '彭传', '女', null, null, null, null, null, null, '0', '3', '2', '20182624', '20182624', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1678', '18430225150313', '唐坤', '男', null, null, null, null, null, null, '0', '3', '10', '20182620', '20182620', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1679', '18430624114065', '戴介琼', '男', null, null, null, null, null, null, '0', '3', '2', '20182610', '20182610', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1680', '18432326110035', '郭安德', '女', null, null, null, null, null, null, '0', '3', '10', '20182608', '20182608', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1681', '18430319114631', '杨赛娇', '男', null, null, null, null, null, null, '0', '3', '2', '20182604', '20182604', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1682', '18430425117319', '文超', '男', null, null, null, null, null, null, '0', '3', '11', '20182595', '20182595', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1683', '18430421155567', '易渭雨', '女', null, null, null, null, null, null, '0', '3', '10', '20182594', '20182594', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1684', '18430421152381', '屈睿', '男', null, null, null, null, null, null, '0', '3', '10', '20182592', '20182592', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1685', '18430223152259', '夏雨', '男', null, null, null, null, null, null, '0', '3', '10', '20182589', '20182589', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1686', '18430725152291', '吴海洋', '女', null, null, null, null, null, null, '0', '3', '10', '20182585', '20182585', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1687', '18430105814635', '陈奥格', '男', null, null, null, null, null, null, '0', '3', '10', '20182576', '20182576', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1688', '18433029151238', '沈明杨', '男', null, null, null, null, null, null, '0', '3', '8', '20181279', '20181279', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1689', '18430219814278', '林雅瑜', '女', null, null, null, null, null, null, '0', '3', '10', '20181276', '20181276', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1690', '18430319819673', '李芊霞', '男', null, null, null, null, null, null, '0', '3', '8', '20181274', '20181274', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1691', '18430122813224', '王浩', '男', null, null, null, null, null, null, '0', '3', '2', '20181273', '20181273', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1692', '18430521153178', '陈卓兰', '女', null, null, null, null, null, null, '0', '3', '10', '20181254', '20181254', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1693', '18432505816186', '廖三超', '男', null, null, null, null, null, null, '0', '3', '10', '20181250', '20181250', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1694', '18430302111910', '胡胜', '男', null, null, null, null, null, null, '0', '3', '8', '20181248', '20181248', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1695', '18432923816468', '周培生', '女', null, null, null, null, null, null, '0', '3', '10', '20181236', '20181236', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1696', '18430425156258', '罗旺', '男', null, null, null, null, null, null, '0', '3', '8', '20181230', '20181230', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1697', '18430104111732', '朱洪武', '男', null, null, null, null, null, null, '0', '3', '10', '20181225', '20181225', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1698', '18430102150483', '李佳', '女', null, null, null, null, null, null, '0', '3', '3', '20181219', '20181219', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1699', '18430102813290', '姚远嘉', '男', null, null, null, null, null, null, '0', '3', '11', '20181212', '20181212', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1700', '18430102813306', '袁子业', '男', null, null, null, null, null, null, '0', '3', '11', '20181211', '20181211', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1701', '18432502814132', '李臻', '女', null, null, null, null, null, null, '0', '3', '10', '20181210', '20181210', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1702', '18430725111892', '龚晓禹', '男', null, null, null, null, null, null, '0', '3', '4', '20181185', '20181185', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1703', '18430601152823', '刘胜', '男', null, null, null, null, null, null, '0', '3', '8', '20181066', '20181066', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1704', '18432823111963', '曹子浩', '女', null, null, null, null, null, null, '0', '3', '2', '20180975', '20180975', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1705', '18432801113476', '张文硕', '男', null, null, null, null, null, null, '0', '3', '2', '20180508', '20180508', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1706', '18430102813115', '胡文', '男', null, null, null, null, null, null, '0', '3', '2', '20180494', '20180494', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1707', '18430125150229', '阳煜升', '女', null, null, null, null, null, null, '0', '3', '9', '20180458', '20180458', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');
INSERT INTO `d_student` VALUES ('1708', '18430102112747', '陈晓冬', '男', null, null, null, null, null, null, '0', '3', '10', '20180429', '20180429', '430321200001012234', null, '2', null, null, null, null, '0.00', null, '7');

-- ----------------------------
-- Table structure for d_testright
-- ----------------------------
DROP TABLE IF EXISTS `d_testright`;
CREATE TABLE `d_testright` (
  `rightid` int(11) NOT NULL AUTO_INCREMENT COMMENT '权重编号',
  `deptid` int(11) DEFAULT NULL COMMENT '系部编号 \r\n外键，参照d_department表的deptid字段',
  `rightname` varchar(40) DEFAULT NULL COMMENT '权重名称',
  `rightvalue` int(11) DEFAULT NULL COMMENT '权重值',
  `rightparentid` int(11) DEFAULT NULL COMMENT '父权重编号\r\n外键，参照d_testright表的rightid，若为空表示一级权重，否则为父级权重id',
  PRIMARY KEY (`rightid`),
  KEY `rightparentid` (`rightparentid`),
  KEY `fk_testRight_deptid` (`deptid`),
  CONSTRAINT `d_testright_ibfk_1` FOREIGN KEY (`rightparentid`) REFERENCES `d_testright` (`rightid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_testRight_deptid` FOREIGN KEY (`deptid`) REFERENCES `d_department` (`deptId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_testright
-- ----------------------------
INSERT INTO `d_testright` VALUES ('3', '3', '综合素质测试', '40', null);
INSERT INTO `d_testright` VALUES ('4', '3', '心理素质', '50', '3');
INSERT INTO `d_testright` VALUES ('6', '3', '表达能力', '50', '3');
INSERT INTO `d_testright` VALUES ('7', '3', '职业技能测试', '60', null);
INSERT INTO `d_testright` VALUES ('8', '3', '上机操作', '40', '7');
INSERT INTO `d_testright` VALUES ('9', '3', '逻辑思维能力', '50', '7');

-- ----------------------------
-- Table structure for d_user
-- ----------------------------
DROP TABLE IF EXISTS `d_user`;
CREATE TABLE `d_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `userName` varchar(20) NOT NULL COMMENT '用户名称',
  `userPwd` varchar(20) NOT NULL DEFAULT '123456' COMMENT '用户密码',
  `userPhone` varchar(12) NOT NULL COMMENT '用户电话',
  `userEmail` varchar(255) NOT NULL COMMENT '用户邮箱',
  `userRole` int(11) DEFAULT NULL COMMENT '用户角色 外键',
  `deptid` int(11) DEFAULT NULL COMMENT '系部编号 \r\n外键，参照d_department表的deptid字段，为null意味着为超级管理员',
  `erid` int(11) DEFAULT NULL COMMENT '考场编号\r\n2018年7月18日增加，主要用于根据用户角色，指定所在的考场 ，外键参照考场安排表(d_examroom)的考场编号字段。\r\n若“用户角色”字段为系统管理员、超级管理员，则为空若；否则为对应考场的工作人员，若用户角色为主考官、考官、统分员，该用户则为对应的测试考场的考官；若用户角色为候考室管理员，则该用户为该候考室管理员。通过授权功能设置其值！',
  `isGrade` int(11) NOT NULL DEFAULT '0' COMMENT '是否评分 0：否 ; 1：是',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userPhone_unique` (`userPhone`),
  UNIQUE KEY `userEmail_unique` (`userEmail`),
  KEY `FKo5a8r5r2lakpemjwj88nas66p` (`deptid`),
  KEY `erid` (`erid`),
  KEY `fk_user_role` (`userRole`),
  CONSTRAINT `d_user_ibfk_1` FOREIGN KEY (`erid`) REFERENCES `d_examroom` (`erId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKo5a8r5r2lakpemjwj88nas66p` FOREIGN KEY (`deptid`) REFERENCES `d_department` (`deptId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role` FOREIGN KEY (`userRole`) REFERENCES `d_role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_user
-- ----------------------------
INSERT INTO `d_user` VALUES ('3', '陈新12', '123456', '13973341321', '1426627870@qq.com', '1', null, null, '0');
INSERT INTO `d_user` VALUES ('4', '张三', '123456', '15377411215', '1597594921@qq.com', '2', '3', null, '0');
INSERT INTO `d_user` VALUES ('6', '李四', '123456', '13787817057', '123@qq.com', '3', '3', '21', '1');
INSERT INTO `d_user` VALUES ('9', '1512候考', '123456', '13973341323', '1234@qq.com', '4', '3', '24', '0');
INSERT INTO `d_user` VALUES ('15', '1504考官', '123456', '13973341325', '15125@qq.com', '5', '3', '21', '1');
INSERT INTO `d_user` VALUES ('17', '1504统分员', '123456', '13973341326', '15126@qq.com', '6', '3', '21', '1');
INSERT INTO `d_user` VALUES ('18', '机械管理员', '123456', '13973341300', 'jixieDeptAdmin@qq.com', '2', '5', null, '0');
INSERT INTO `d_user` VALUES ('20', '1523主考', '123456', '13989562314', '15128@qq.com', '3', '3', null, '0');
INSERT INTO `d_user` VALUES ('21', '李健', '123456', '13111111111', '13113@qq.com', '3', '3', null, '1');
INSERT INTO `d_user` VALUES ('22', '程亚玲', '123456', '13111222222', '13115@qq.com', '5', '3', null, '1');
INSERT INTO `d_user` VALUES ('23', '测试侯考', '123456', '13131111111', '13134@qq.com', '4', '3', null, '0');
INSERT INTO `d_user` VALUES ('24', '测试统分员', '123456', '13113333333', '13116@qq.com', '6', '3', null, '1');
