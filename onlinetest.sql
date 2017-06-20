# Host: localhost  (Version 5.7.14-log)
# Date: 2017-06-05 23:12:07
# Generator: MySQL-Front 6.0  (Build 1.195)


#
# Structure for table "answer"
#

DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sId` varchar(8) NOT NULL,
  `stuAnswer` text,
  PRIMARY KEY (`id`),
  KEY `sId` (`sId`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "answer"
#

/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (16,'test1','不好'),(17,'test1','我好');
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;

#
# Structure for table "article"
#

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `authorId` varchar(8) DEFAULT '00000000',
  `dateline` bigint(2) DEFAULT '0',
  `content` text,
  PRIMARY KEY (`id`),
  KEY `authorId` (`authorId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "article"
#

/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (0,'考试规定','admin',0,'<p>1. 考试用品</p>\r\n<p>考试当天，考生进场时必须携带：</p>\r\n<p>- 准考证</p>\r\n<p>- 与报名一致的、真实有效且带照片的个人身份证件（复印件无效</p>\r\n<p>- 参加纸笔考试须携带2B铅笔（两支以上）和橡皮</p>\r\n<p>考生其它个人物品须放在主考老师指定的物品存放处，不可以随身携带。请勿携带贵重物品前往考场，否则遗失恕不负责。</p>\r\n<p>考生入场时无法提供符合规定的证件和准考证，将不能参加考试。考试费用不予退还。</p>\r\n<p>2. 入场时间</p>\r\n<p>考生应在开考前半小时到达考场，避免迟到。入场后直到听力考试结束前，考生不得出入考场。</p>\r\n<p>纸笔考试：听力考试开始前，迟到的考生可进入考场参加考试；听力考试开始后，迟到的考生须等听力考试结束后才可进入考场参加阅读考试，所误时间不补；阅读考试开始后，迟到的考生不得进入考场参加考试。</p>\r\n<p>口语考试：录音开始前，迟到的考生可进入考场参加考试，所误时间不补；录音开始后，迟到的考生不得进入考场参加考试。</p>\r\n<p>3. 考试形式</p>\r\n<p>(1) 考生按照监考人员的安排进行考试。</p>\r\n<p>(2) 考生一律在答题卡上作答，答题卡上的所有内容均使用2B铅笔填涂。</p>\r\n<p>(3) 口语考试的作答采用现场录音形式，考生按照监考人员的安排，使用各自独立的录音设备进行考试。</p>\r\n<p>(4) 汉语网络考试是无纸化考试，考生通过鼠标键盘作答，考试过程自动计时。</p>\r\n<p>4. 考试规则</p>\r\n<p>(1) 考生必须坐在指定的座位上，考生无权选择座位。</p>\r\n(<p>2) 考生须听从主考指令，遵守考试规则，并独立完成各项考试。</p>\r\n<p>(3) 考试中间没有休息时间，如有特殊原因，考生需要中途离场，须经主考同意，在离开考场前把准考证和身份证件交给监考人员,考生返回考场后，监考人员返还考生准考证和身份证件。</p>\r\n<p>(4) 口语考试中考生不得暂时离开考场，若要离开，只能退出考试。</p>\r\n<p>5. 突发情况处理</p>\r\n<p>(1) 由于考场管理失误造成考生受到不公平待遇，例如：考试时间不足、考卷损坏、考试设备损坏等，导致考生无法完成考试，汉考国际将尽快安排考生免费重新参加考试，不承担任何间接损失补偿，考试地点不能变更。</p>\r\n<p>(2) 由于不可抗力，例如：自然灾害、意外事故，迫使考试无法进行，汉考国际将尽快安排重试，或全额退回考试费用，不承担任何间接损失补偿。</p>\r\n<p>6. 考生缺考</p>\r\n<p>如果考试当天考生因非考试主办方原因没有参加考试，考试费不予返还。</p>\r\n<p>7. 违规与处罚</p>\r\n<p>考生不得提前打开试卷、跨区做题，不能撕扯、更换、抄录试卷内容，不能把试卷和答案带出考场，如果考生存在作弊、替考、抄袭、夹带及不听从考官指令等行为，考试成绩将被取消。</p>'),(1,'hello','04141127',2147483647,'欢迎使用在线考试系统'),(2,'你好','12345678',1231312,'欢迎使用在线考试系统');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

#
# Structure for table "class"
#

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `cId` int(11) NOT NULL AUTO_INCREMENT,
  `lessionId` varchar(255) DEFAULT NULL,
  `tecId` varchar(8) DEFAULT NULL,
  `member` int(11) DEFAULT '0',
  PRIMARY KEY (`cId`),
  KEY `lessionId` (`lessionId`),
  KEY `tecId` (`tecId`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

#
# Data for table "class"
#

/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'a01','12345678',1),(2,'a02','admin',0),(3,'a03','12345678',1),(4,'a04','12345678',0),(15,'a01','112233',0),(18,'a05','test2',1),(19,'a08','01',1);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;

#
# Structure for table "codeq"
#

DROP TABLE IF EXISTS `codeq`;
CREATE TABLE `codeq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examId` int(11) DEFAULT NULL,
  `question` text,
  `answer` text,
  PRIMARY KEY (`id`),
  KEY `examId` (`examId`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "codeq"
#

/*!40000 ALTER TABLE `codeq` DISABLE KEYS */;
INSERT INTO `codeq` VALUES (14,5,'你好','我好'),(16,7,'不好','很好aaa'),(17,7,'你好','不好'),(18,10,'DASDA','DASDADAD'),(20,22,'说出数据库系统有哪几部分组成？ ','数据，软件，硬件，人员'),(21,22,'试述SQL语言的功能','SQL语言是一种数据库查询和程序设计语言，用于存取数据以及查询更新和管理关系数据库系统。'),(22,22,'SQL提供的基本数据类型有哪些？每种举两个例子。','1.数值型（int bit）  2.字符串型（char vachar） \r\n3.日期时间类型（datetime small datetime） 4.货币类型（money small money）'),(23,23,'1','1');
/*!40000 ALTER TABLE `codeq` ENABLE KEYS */;

#
# Structure for table "exam"
#

DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cId` varchar(255) DEFAULT NULL,
  `scqNumber` int(11) DEFAULT '0',
  `mcqNumber` int(11) DEFAULT '0',
  `codeqNumber` int(11) DEFAULT '0',
  `dateline` bigint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cId` (`cId`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "exam"
#

/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (5,'3',1,1,1,1495431997470),(10,'18',1,1,1,1495879294185),(22,'1',3,3,3,1496313008918),(23,'19',1,1,1,1496317604561);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;

#
# Structure for table "lession"
#

DROP TABLE IF EXISTS `lession`;
CREATE TABLE `lession` (
  `lessionId` varchar(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lessionId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "lession"
#

/*!40000 ALTER TABLE `lession` DISABLE KEYS */;
INSERT INTO `lession` VALUES ('a01','数据库原理与应用'),('a02','JAVA程序设计'),('a03','J2ee'),('a04','软件测试'),('a05','数据结构'),('a08','爱动漫');
/*!40000 ALTER TABLE `lession` ENABLE KEYS */;

#
# Structure for table "mcq"
#

DROP TABLE IF EXISTS `mcq`;
CREATE TABLE `mcq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examId` int(11) DEFAULT NULL,
  `question` text,
  `selectionA` varchar(255) DEFAULT NULL,
  `selectionB` varchar(255) DEFAULT NULL,
  `selectionC` varchar(255) DEFAULT NULL,
  `selectionD` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT 'A',
  PRIMARY KEY (`id`),
  KEY `examId` (`examId`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# Data for table "mcq"
#

/*!40000 ALTER TABLE `mcq` DISABLE KEYS */;
INSERT INTO `mcq` VALUES (14,5,'','','','','',NULL),(16,7,'不知道','AA','BB','CC','DD','A, B'),(17,10,'1231','A','V','C','D','A, B'),(21,15,'','','','','',NULL),(23,22,'SQL Server的安全身份验证模式决定了什么样的账户可以连接到服务器中，SQLServer 2008提供的身份验证模式有（ ）','Windows身份验证模式 ','Windows身份验证模式 ','仅SQL身份验证模式 ','加密身份验证模式 ','A, B'),(24,22,'分离和附加数据库可以实现将数据库从一个服务移到另一个服务器上，但有些情况下不能进行分离数据库的操作。以下情况一定不能进行分离数据库的操作（ ）','Northwind数据库','Master数据库','用户正在使用的数据库','用户自己创建的benet数据库 ','B, C'),(25,22,'数据库管理员希望对数据库进行性能优化，以下操作中行之有效的方法为（ ）','将数据库的数据库文件和日志文件分别放在不同的分区上','在数据库服务器上尽量不要安装其他无关服务','一个表中的数据行过多时，将其划分为两个或多个表','将数据库涉及到的所有文件单独放在一个分区上供用户访问 ','A, B'),(26,23,'1','1','1','2','3','A, B');
/*!40000 ALTER TABLE `mcq` ENABLE KEYS */;

#
# Structure for table "menu"
#

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `sx` int(1) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '0',
  `menu` varchar(255) DEFAULT NULL,
  `menuUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sx`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "menu"
#

/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,0,'我的考试','exam_show'),(1,1,'我的试卷','paper_show'),(1,2,'试卷管理','paper_show'),(2,0,'我的成绩','score_show'),(2,1,'成绩录入','score_show'),(2,2,'成绩管理','score_show'),(3,0,'我要选课','classAction_show'),(3,2,'课程管理','classAction_show'),(4,2,'用户管理','user_show');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

#
# Structure for table "score"
#

DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `sId` varchar(8) NOT NULL DEFAULT '0',
  `cId` varchar(255) NOT NULL,
  `score` int(3) DEFAULT '0',
  `state` int(1) DEFAULT '0',
  PRIMARY KEY (`sId`,`cId`),
  KEY `cId` (`cId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "score"
#

/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES ('04141127','1',0,0),('04141127','3',59,2),('test1','18',50,2),('test1','19',70,3);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;

#
# Structure for table "scq"
#

DROP TABLE IF EXISTS `scq`;
CREATE TABLE `scq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examId` int(11) DEFAULT NULL,
  `question` text,
  `selectionA` varchar(255) DEFAULT NULL,
  `selectionB` varchar(255) DEFAULT NULL,
  `selectionC` varchar(255) DEFAULT NULL,
  `selectionD` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT 'A',
  PRIMARY KEY (`id`),
  KEY `examId` (`examId`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

#
# Data for table "scq"
#

/*!40000 ALTER TABLE `scq` DISABLE KEYS */;
INSERT INTO `scq` VALUES (26,7,'D','你好','我好','大家好','很好','D'),(28,5,'hello','到底','到底','dd','点点滴滴','C'),(29,7,'你好','s','ss','ss','','D'),(30,10,'1','2','3','4','5','A'),(46,22,'（   ）是位于用户和操作系统之间的一层数据管理软件。数据库在建立、使用和维护时由其统一管理、统一控制。 ',' DB','DBMS','DBS','DBA','B'),(47,22,'SQL语言允许使用通配符进行字符串匹配的操作，其中‘%’可以表示（   ）','零个字符','1个字符 ','多个字符','以上都可以 ','D'),(48,22,'下列哪一个数据库不是SQL Server 2000的系统数据库（ ）','master数据库 ','msdb数据库','pubs数据库','model数据库 ','C'),(49,23,'1\r\n\r\n22\r\n\r\n33','1','2','3','4','A'),(50,6,'你好\r\n\r\n什么意思','','','','','A');
/*!40000 ALTER TABLE `scq` ENABLE KEYS */;

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(8) NOT NULL DEFAULT '00000000',
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT 'ICy5YqxZB1uWSwcVLSNLcA==',
  `type` int(1) DEFAULT '0',
  `major` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "users"
#

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('01','大苏打老师','1',NULL,'ICy5YqxZB1uWSwcVLSNLcA==',1,'化药'),('04141127','朱强','123456','pigstrong@qq.com','ICy5YqxZB1uWSwcVLSNLcA==',0,'计算机'),('112233','李军国','0',NULL,'ICy5YqxZB1uWSwcVLSNLcA==',1,'化药系'),('12345678','马永骏','123456','123@qq.co','gdyb21LQTcIANtvYMT7QVQ==',1,'计算机'),('admin','管理员','123456','','ISMvKXpXpadDiUoOSoAfww==',2,'管理员'),('test1','测试学生','11',NULL,'ICy5YqxZB1uWSwcVLSNLcA==',0,'11'),('test2','测试教师','0',NULL,'ICy5YqxZB1uWSwcVLSNLcA==',1,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

#
# Trigger "deleteCQ"
#

DROP TRIGGER IF EXISTS `deleteCQ`;
onlinetest

#
# Trigger "deleteMCQ"
#

DROP TRIGGER IF EXISTS `deleteMCQ`;
onlinetest

#
# Trigger "InsertCODEQ"
#

DROP TRIGGER IF EXISTS `InsertCODEQ`;
onlinetest

#
# Trigger "InsertMCQ"
#

DROP TRIGGER IF EXISTS `InsertMCQ`;
onlinetest

#
# Trigger "更新触发器"
#

DROP TRIGGER IF EXISTS `更新触发器`;
onlinetest

#
# Trigger "减少单选题数目"
#

DROP TRIGGER IF EXISTS `减少单选题数目`;
onlinetest

#
# Trigger "删"
#

DROP TRIGGER IF EXISTS `删`;
onlinetest

#
# Trigger "删除"
#

DROP TRIGGER IF EXISTS `删除`;
onlinetest

#
# Trigger "删除试卷"
#

DROP TRIGGER IF EXISTS `删除试卷`;
onlinetest

#
# Trigger "添加"
#

DROP TRIGGER IF EXISTS `添加`;
onlinetest

#
# Trigger "增加单选题数目"
#

DROP TRIGGER IF EXISTS `增加单选题数目`;
onlinetest
