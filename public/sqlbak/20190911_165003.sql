SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `tb_ad`;
CREATE TABLE `tb_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `links` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `Title` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `sTitle` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `S_Image` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `con` longtext COLLATE utf8_unicode_ci,
  `enduptime` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeID` int(11) NOT NULL,
  `is_del` int(1) NOT NULL DEFAULT '0',
  `deltime` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sid` int(100) DEFAULT NULL,
  `read_num` int(200) DEFAULT '0',
  `Recommend` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fjid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `istop` int(10) DEFAULT '0',
  `hpx` varchar(100) COLLATE utf8_unicode_ci DEFAULT '0',
  `px` varchar(200) COLLATE utf8_unicode_ci DEFAULT '0',
  `Title` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Author` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KeyWords` longtext COLLATE utf8_unicode_ci,
  `videourl` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` mediumtext COLLATE utf8_unicode_ci,
  `Content1` longtext COLLATE utf8_unicode_ci,
  `Content2` longtext COLLATE utf8_unicode_ci,
  `Content3` longtext COLLATE utf8_unicode_ci,
  `Content4` longtext COLLATE utf8_unicode_ci,
  `isVerify` tinyint(1) DEFAULT NULL,
  `webpath` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateTime` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Creator` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `S_Image` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_Image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seotitle` longtext COLLATE utf8_unicode_ci,
  `seokeywords` longtext COLLATE utf8_unicode_ci,
  `seodescription` longtext COLLATE utf8_unicode_ci,
  `s0` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `s2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d3` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d4` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d5` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d6` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endtime` int(200) DEFAULT NULL,
  `endtime1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tb_city`;
CREATE TABLE `tb_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(100) NOT NULL DEFAULT '0',
  `cityname` varchar(200) DEFAULT NULL,
  `endtime` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='城市表';

DROP TABLE IF EXISTS `tb_email`;
CREATE TABLE `tb_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(100) COLLATE utf8_bin NOT NULL,
  `port` varchar(100) COLLATE utf8_bin NOT NULL,
  `username` varchar(100) COLLATE utf8_bin NOT NULL,
  `password` varchar(100) COLLATE utf8_bin NOT NULL,
  `subject` varchar(100) COLLATE utf8_bin NOT NULL,
  `from` varchar(100) COLLATE utf8_bin NOT NULL,
  `fromname` varchar(100) COLLATE utf8_bin NOT NULL,
  `endtime` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `tb_guest`;
CREATE TABLE `tb_guest` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `t1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t4` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t5` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t6` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t7` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateTime` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tb_img_info`;
CREATE TABLE `tb_img_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nid` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `addtime` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `tb_kf`;
CREATE TABLE `tb_kf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `links` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `Title` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `sTitle` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `S_Image` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `con` longtext COLLATE utf8_unicode_ci,
  `enduptime` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tb_links`;
CREATE TABLE `tb_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `links` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `Title` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `sTitle` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `S_Image` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `con` longtext COLLATE utf8_unicode_ci,
  `enduptime` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tb_lm`;
CREATE TABLE `tb_lm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_meau` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TypeName` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentID` int(11) DEFAULT NULL,
  `PathTree` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'null',
  `idpath` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Depth` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SortNumber` int(11) DEFAULT NULL,
  `parentID_top` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `temp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ljdz` int(10) DEFAULT NULL,
  `contemp` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PageSize` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sTypeName` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Video` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `con1` longtext COLLATE utf8_unicode_ci,
  `con2` longtext COLLATE utf8_unicode_ci,
  `con3` longtext COLLATE utf8_unicode_ci,
  `img1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newsid` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img3` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img4` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img5` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` longtext COLLATE utf8_unicode_ci,
  `seo_keywords` longtext COLLATE utf8_unicode_ci,
  `seo_miaoshu` longtext COLLATE utf8_unicode_ci,
  `weburl` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nohtml` varchar(5) COLLATE utf8_unicode_ci DEFAULT '0',
  `ty` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endtime` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idpath` (`idpath`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_del` int(10) NOT NULL DEFAULT '0',
  `UserName` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `LoginTime` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `model` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin,
  `sql` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `endtime` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=664 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `tb_member`;
CREATE TABLE `tb_member` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) DEFAULT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `gid` int(10) NOT NULL,
  `isVerify` varchar(100) NOT NULL DEFAULT '0',
  `type` varchar(200) NOT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `telphone` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `yyzz` varchar(200) DEFAULT NULL,
  `idcardnum` varchar(200) DEFAULT NULL,
  `idcard` varchar(200) DEFAULT NULL,
  `idcard1` varchar(200) DEFAULT NULL,
  `Content` longtext,
  `regtime` varchar(100) DEFAULT NULL,
  `logintime` varchar(100) DEFAULT NULL,
  `endtime` varchar(11) DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_pro`;
CREATE TABLE `tb_pro` (
  `ProID` int(11) NOT NULL,
  `ProName` varchar(100) DEFAULT NULL,
  `FileName` varchar(50) DEFAULT NULL,
  `SmallPic` varchar(80) DEFAULT NULL,
  `BigPic` longtext,
  `Memo` varchar(255) DEFAULT NULL,
  `KeyWords` varchar(50) DEFAULT NULL,
  `Remarks` longtext,
  `Content` longtext,
  `AddTime` datetime DEFAULT NULL,
  `LastDoTime` datetime DEFAULT NULL,
  `Author` varchar(80) DEFAULT NULL,
  `ReadCount` int(11) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `OrderId` int(11) DEFAULT NULL,
  `IsRec` int(11) DEFAULT NULL,
  `IsHot` int(11) DEFAULT NULL,
  `IsJing` int(11) DEFAULT NULL,
  `IsPPT` int(11) DEFAULT NULL,
  `IsTop` int(11) DEFAULT NULL,
  `GuiGe` varchar(50) DEFAULT NULL,
  `Number` varchar(50) DEFAULT NULL,
  `Version` varchar(50) DEFAULT NULL,
  `Vender` varchar(50) DEFAULT NULL,
  `Argument` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_screen`;
CREATE TABLE `tb_screen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `endtime` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `tb_sql`;
CREATE TABLE `tb_sql` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `endtime` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_ty_info`;
CREATE TABLE `tb_ty_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `TypeID` int(10) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `endtime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=gbk COMMENT='属性';

DROP TABLE IF EXISTS `tb_ty_type`;
CREATE TABLE `tb_ty_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '分类名称',
  `endtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gbk COMMENT='属性分类';

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `RealName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PassWord` varchar(1212) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(1221) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isVerify` tinyint(1) DEFAULT NULL,
  `UserType` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endtime` varchar(30) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tb_web`;
CREATE TABLE `tb_web` (
  `id` int(11) NOT NULL,
  `Web_Name` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `SeoTitle` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Locked` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Locked_is` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `cache` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Telphone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Mobilephone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PostCode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `beian` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `QICQ` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Video` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Addess` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oaurl` longtext COLLATE utf8_unicode_ci,
  `taobaourl` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shangqiao` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `liuyantext` longtext COLLATE utf8_unicode_ci,
  `t1` longtext COLLATE utf8_unicode_ci,
  `t2` longtext COLLATE utf8_unicode_ci,
  `t3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t4` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t5` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ips` longtext COLLATE utf8_unicode_ci,
  `enduptime` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tb_webinfo`;
CREATE TABLE `tb_webinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `field` varchar(100) COLLATE utf8_bin NOT NULL,
  `type` varchar(100) COLLATE utf8_bin NOT NULL,
  `val` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



DELETE FROM tb_ad;
INSERT INTO `tb_ad` VALUES (49,'','http://www.baidu.com','广告图1','','/s/images/banner.jpg','','2019-09-10 15:43:06');
INSERT INTO `tb_ad` VALUES (50,'','','广告图2','','/s/images/banner.jpg','','2019-08-30 10:04:11');
INSERT INTO `tb_ad` VALUES (51,'','','广告图3','','/s/images/banner.jpg','','2019-08-30 10:04:26');

DELETE FROM tb_article;
INSERT INTO `tb_article` VALUES (68,3,0,NULL,NULL,0,'0,',',0,',0,NULL,NULL,234,'shop.gemut.cn',NULL,NULL,234234,NULL,NULL,NULL,NULL,1,NULL,'2019-09-10 17:21:37',NULL,234234,NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1568102595,'2019-09-10 17:21:37');
INSERT INTO `tb_article` VALUES (69,1,0,NULL,NULL,0,'0,',',0,',NULL,NULL,NULL,'关于我们','shop.gemut.cn',NULL,NULL,'<span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span><span style=\"white-space:normal;\">关于我们</span>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-10 21:57:07',NULL,'',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1568123821,'2019-09-10 21:57:07');
INSERT INTO `tb_article` VALUES (2,8,0,NULL,NULL,13,'0,',',0,',0,NULL,NULL,'IBC吨桶','jg.dd',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902111438_34167.jpg\" alt=\"\" /><br />
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			品&nbsp;牌&nbsp;&nbsp;:&nbsp;佳&nbsp;罐
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Brand&nbsp; &nbsp;&nbsp;:&nbsp;Good&nbsp;tank
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			型&nbsp;号&nbsp;:&nbsp;1000L
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Model&nbsp; &nbsp;:&nbsp; 1000L
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		加 工 定 制&nbsp;:&nbsp;是
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Custom&nbsp;processing&nbsp;&nbsp;:&nbsp;yes
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		&nbsp;材&nbsp;质&nbsp;:&nbsp;塑&nbsp;料
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Material&nbsp; &nbsp;:&nbsp; Plastic
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			内 部 容 积&nbsp;:&nbsp;1m3<br />
Internal&nbsp;volume&nbsp; :&nbsp; 1m3
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			外 形 尺 寸 :&nbsp;1200*1000*1150mm
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			&nbsp;Dimensions&nbsp; &nbsp; &nbsp;:&nbsp; 1200*&nbsp;1000*1150mm
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		自&nbsp;身&nbsp;重&nbsp;量&nbsp;:&nbsp;60kg
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			&nbsp;Own&nbsp;weight&nbsp;:60kg
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		适 用 领 域&nbsp;:&nbsp;化工、食品、医药
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Application&nbsp;&nbsp;:&nbsp;Chemical、&nbsp;Food、Medical
		</p>
	</blockquote>
</div>',NULL,NULL,NULL,NULL,0,NULL,'2019-09-02 11:45:05',NULL,'/s/images/product.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567131626,'2019-09-02 11:45:05');
INSERT INTO `tb_article` VALUES (12,9,0,NULL,NULL,3,'0,',',0,',0,NULL,NULL,'35L广口桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902113911_82177.jpg\" alt=\"\" /><br />
	<p>
		品 牌 : 佳 罐
	</p>
	<p>
		Brand : Good tank
	</p>
	<p>
		型 号 : 35L
	</p>
	<p>
		Model : 35L
	</p>
	<p>
		加 工 定 制 :否
	</p>
	<p>
		Custom processing : NO
	</p>
	<p>
		材 质 : 塑 料
	</p>
	<p>
		Material : Plastic
	</p>
	<p>
		长 :300 mm
	</p>
	<p>
		Length: 300mm
	</p>
	<p>
		宽 : 300mm
	</p>
	<p>
		Breadt : 300 mm
	</p>
	<p>
		高 ：500mm
	</p>
	<p>
		Hight: 500mm
	</p>
	<p>
		口径：240mm
	</p>
	<p>
		Caliber：240mm
	</p>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:17:16',NULL,'/public/uploads/image/20190902/20190902113839_18399.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567395250,'2019-09-02 14:17:16');
INSERT INTO `tb_article` VALUES (4,10,0,NULL,NULL,4,'0,',',0,',0,NULL,NULL,'吨桶冷冻测试','jg.dd',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902144605_36619.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:46:06',NULL,'/s/images/test.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567133949,'2019-09-02 14:46:06');
INSERT INTO `tb_article` VALUES (5,14,0,1567852986,NULL,4,'0,',',0,',NULL,NULL,NULL,'伙伴','jg.dd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2019-08-30 11:06:02',NULL,'/s/images/ptn.jpg','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567134351,'2019-08-30 11:06:02');
INSERT INTO `tb_article` VALUES (11,14,0,NULL,NULL,4,'0,',',0,',0,NULL,NULL,'避光吨桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902111837_89788.jpg\" alt=\"\" /><br />
	<table width=\"80%\" height=\"100%\" border=\"0\" style=\"font-stretch:normal;font-size:12px;line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;color:#5A5A5A;border-spacing:0px;empty-cells:show;background-color:#FFFFFF;\" class=\"ke-zeroborder\">
		<tbody>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;border:none;padding:0px;\">
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">品 牌  : 佳 罐</span>
						</p>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Brand    : Good tank</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;border:none;padding:0px;\">
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:20px;font-size:18px;\">型 号 : 1000L</span>
						</p>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:20px;font-size:14px;\">Model   :  1000</span><span style=\"margin:0px;padding:0px;line-height:20px;font-size:14px;\">L</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;border:none;padding:0px;\">
						<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">加 工 定 制 : 是</span>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Custom processing  : yes</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;border:none;padding:0px;\">
						<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\"> 材 质 : 塑 料</span>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Material   :  Plastic</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;border:none;padding:0px;\">
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">内 部 容 积 </span><span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">: 1m</span><span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">3</span><br />
<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\"></span><span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Internal volume  :  1m</span><span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">3</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;border:none;padding:0px;\">
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">外 形 尺 寸 : 1200*1000*1150mm</span>
						</p>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\"> Dimensions     :  1200* 1000*1150mm</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;border:none;padding:0px;\">
						<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">自 身 重 量 : 60kg</span>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\"> Own weight :60kg</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;border:none;padding:0px;\">
						<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">适 用 领 域 : 化工、食品、医药</span>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Application  : Chemical、 Food、Medical</span>
						</p>
					</blockquote>
				</td>
			</tr>
		</tbody>
	</table>
<br />
</div>',NULL,NULL,NULL,NULL,0,NULL,'2019-09-10 16:03:11',NULL,'/public/uploads/image/20190902/20190902114729_20423.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567394263,'2019-09-10 16:03:11');
INSERT INTO `tb_article` VALUES (6,14,0,1567591329,NULL,10,'0,',',0,',0,NULL,NULL,'低温环境对化工桶有何影响','cdjiaguan.com',NULL,NULL,'<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">化工桶在我们的生活中经常会用到，但是由于季节的问题，通常在冬天化工桶会放在室内，另外三个季节则是室内、室外都可以，为什么呢</span><span lang=\"EN-US\" style=\"font-size:14px;\">?</span><span style=\"font-size:14px;\">我们来了解一下低温环境对化工桶有何影响吧。<br />
	<div style=\"text-align:center;\">
		<span style=\"text-indent:2em;\"></span><span style=\"text-indent:2em;\"><img src=\"/public/uploads/image/20190830/20190830172714_86094.jpg\" alt=\"\" /></span>
	</div>
</span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">我们往往比较关注的是塑料制品中的塑化剂问题，却忽略了塑料制品在寒冷的环境下存在着老化与破裂的现象，化工桶在使用完之后，不是被回收就是被丢弃，而化工桶由于使用的范围较大，能够被重复的利用，所以化工桶的使用规范应该被重视。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">需要提醒大家的是，再好的产品也需要进行养护，因此我们应该尽可能避免在低温环境下使用化工桶，这可以避免化工桶的破碎让其使用的时间更长。</span>
</p>',NULL,NULL,NULL,NULL,1,NULL,'2019-08-30 17:31:48',NULL,'/public/uploads/image/20190830/20190830173147_51341.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567157196,'2019-08-30 17:31:48');
INSERT INTO `tb_article` VALUES (7,14,0,1567591329,NULL,7,'0,',',0,',0,NULL,NULL,'选择塑料桶有哪些办法','cdjiaguan.com',NULL,NULL,'<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">随着化工行业的不断发展，化学试剂的保存工厂都会选择专门的塑料桶完成。那么化工行业选择塑料桶都有哪些方法呢</span><span lang=\"EN-US\" style=\"font-size:14px;\">?</span><span style=\"font-size:14px;\">我们主要从以下几点来进行了解。<br />
	<div style=\"text-align:center;\">
		<span style=\"text-indent:2em;\"></span><span style=\"text-indent:2em;\"><img src=\"/public/uploads/image/20190830/20190830172800_36683.jpg\" alt=\"\" /></span>
	</div>
</span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">对塑胶桶进行选择，该提早了解整个的行业状况，这也是我们作出选择的前提。各种不同的市场，目前处在的状况怎样发展到哪种情况，要是能很好的去考虑这类地方的事物，关于产品好坏的判断则会更准确，因此我们在选择的过程中，肯定需对整个的市场状况有着更多的熟悉。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">除了了解整个市场的状况之外，选择塑胶桶还该注重本身的需求，能正确的得到一些作用，更适应使用，质量地方更加好的产品，这样在使用的过程中才能具有更好的价值，要是其中的某一些地方对我们来讲并不适合的话，势必则会直接影响接下来的使用效果。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">懂得正确的方法，再找到一家合适的塑胶桶厂家，才能购买到比较好的塑料桶产品。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>',NULL,NULL,NULL,NULL,1,NULL,'2019-08-30 17:32:03',NULL,'/public/uploads/image/20190830/20190830173202_48682.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567157243,'2019-08-30 17:32:03');
INSERT INTO `tb_article` VALUES (8,14,0,NULL,NULL,7,'0,',',0,',0,NULL,NULL,'选择品质优良的化工桶分几步','cdjiaguan.com',NULL,NULL,'<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">化工桶作为一种特殊产品，对于其本身的品质要求是比较大的。所以，要保证选到品质优良的化工桶主要还是要分以下几个步骤：<br />
	<div style=\"text-align:center;\">
		<span style=\"text-indent:2em;\"></span><span style=\"text-indent:2em;\"><img src=\"/public/uploads/image/20190830/20190830172846_58449.jpg\" alt=\"\" /></span>
	</div>
</span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">一个非常大的品牌，我们也要对它们做一定的分析，而且从这专门的产品入手，让我们一出来充分如何分辨化工桶是不是合适我们购买，是否会带来不少好处。先则是需要分析品质，需要对其质量足够的分析，根据不一样的费用适合什么情形，对化工桶进行寻找。分析市场里的平均价格，不一样的厂家在价钱上拥有的差别是巨大的，因此购买前要先对市场里厂家的平均价格进行分析。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">其次则是需要挑选合适的供应商，挑选家好的供应商不仅能作出相当合适的价钱，并且还能够保证产品的品质。快速掌握相关资讯，在某些的时候厂家会进行一些促销活动，假如能及时的注重这些方面的介绍的话，能够挑选合适的购买时间。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">行业的竞争日渐强烈，不少的化工桶厂家出目前客户的视野里，不少的人有选择困难，一个好的厂家肯定坦诚并且公平的针对他的顾客。</span>
</p>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-10 17:08:13',NULL,'/public/uploads/image/20190830/20190830173230_39490.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567157291,'2019-09-10 17:08:13');
INSERT INTO `tb_article` VALUES (9,9,0,NULL,NULL,8,'0,',',0,',0,NULL,NULL,'125L铁箍桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190830/20190830173842_33733.jpg\" alt=\"\" /><br />
	<p>
		品 牌 : 佳 罐
	</p>
	<p>
		Brand : Good tank
	</p>
	<p>
		型 号 : 125L
	</p>
	<p>
		Model : 125L
	</p>
	<p>
		加 工 定 制 :否
	</p>
	<p>
		Custom processing : NO
	</p>
	<p>
		材 质 : 塑 料
	</p>
	<p>
		Material : Plastic
	</p>
	<p>
		高 :810 mm
	</p>
	<p>
		High : 810 mm
	</p>
	<p>
		口径 : 400 mm
	</p>
	<p>
		Caliber : 400 mm
	</p>
	<p>
		直径 ：500 mm
	</p>
	<p>
		Diameter : 500 mm
	</p>
	<p>
		适 用 领 域 : 化工、食品、医药
	</p>
	<p>
		Application : Chemical、 Food、Medical
	</p>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:18:45',NULL,'/public/uploads/image/20190902/20190902112247_15007.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567157896,'2019-09-02 14:18:45');
INSERT INTO `tb_article` VALUES (10,9,0,NULL,NULL,14,'0,',',0,',0,NULL,NULL,'160L铁箍桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190830/20190830174926_63182.jpg\" alt=\"\" /><br />
	<p>
		品 牌 : 佳 罐
	</p>
	<p>
		Brand : Good tank
	</p>
	<p>
		型 号 : 160L
	</p>
	<p>
		Model : 1000L
	</p>
	<p>
		加 工 定 制 :否
	</p>
	<p>
		Custom processing : NO
	</p>
	<p>
		材 质 : 塑 料
	</p>
	<p>
		Material : Plastic
	</p>
	<p>
		高 :970 mm
	</p>
	<p>
		High : 970 mm
	</p>
	<p>
		口径 : 400 mm
	</p>
	<p>
		Caliber : 400 mm
	</p>
	<p>
		直径 ：512 mm
	</p>
	<p>
		Diameter : 512mm
	</p>
	<p>
		适 用 领 域 : 化工、食品、医药
	</p>
	<p>
		Application : Chemical、 Food、Medical
	</p>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:18:01',NULL,'/public/uploads/image/20190902/20190902112220_98110.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567158528,'2019-09-02 14:18:01');
INSERT INTO `tb_article` VALUES (13,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'1L欧式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902141633_36927.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:16:35',NULL,'/public/uploads/image/20190902/20190902133300_41777.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402348,'2019-09-02 14:16:35');
INSERT INTO `tb_article` VALUES (14,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'1L欧式塑料圆桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902141603_96778.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:16:06',NULL,'/public/uploads/image/20190902/20190902133346_38009.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402398,'2019-09-02 14:16:06');
INSERT INTO `tb_article` VALUES (15,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'2.5L欧式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902141538_28849.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:15:39',NULL,'/public/uploads/image/20190902/20190902133404_68543.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402434,'2019-09-02 14:15:39');
INSERT INTO `tb_article` VALUES (16,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'2L敞口小方桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902141436_60943.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:14:39',NULL,'/public/uploads/image/20190902/20190902133439_10780.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402465,'2019-09-02 14:14:39');
INSERT INTO `tb_article` VALUES (17,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'2L透明敞口塑料圆桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902141503_80556.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:15:06',NULL,'/public/uploads/image/20190902/20190902133459_32947.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402487,'2019-09-02 14:15:06');
INSERT INTO `tb_article` VALUES (18,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'3L欧式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902141357_70836.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:13:58',NULL,'/public/uploads/image/20190902/20190902133516_73663.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402505,'2019-09-02 14:13:58');
INSERT INTO `tb_article` VALUES (19,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'4L欧式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902141243_40566.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:12:46',NULL,'/public/uploads/image/20190902/20190902133537_83333.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402526,'2019-09-02 14:12:46');
INSERT INTO `tb_article` VALUES (20,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'5L欧式方桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902141205_43266.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:12:07',NULL,'/public/uploads/image/20190902/20190902133600_53445.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402546,'2019-09-02 14:12:07');
INSERT INTO `tb_article` VALUES (21,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'5L欧式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902141130_48622.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:11:31',NULL,'/public/uploads/image/20190902/20190902133621_86986.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402569,'2019-09-02 14:11:31');
INSERT INTO `tb_article` VALUES (22,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'5L小方桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902141035_18486.jpg\" alt=\"\" /><br />
	<p>
		品 牌 : 佳 罐
	</p>
	<p>
		Brand : Good tank
	</p>
	<p>
		型 号 : 5L
	</p>
	<p>
		Model : 5L
	</p>
	<p>
		加 工 定 制 :否
	</p>
	<p>
		Custom processing : NO
	</p>
	<p>
		材 质 : 塑 料
	</p>
	<p>
		Material : Plastic
	</p>
	<p>
		长 :185 mm
	</p>
	<p>
		Length: 185mm
	</p>
	<p>
		宽 : 185 mm
	</p>
	<p>
		Breadt : 185mm
	</p>
	<p>
		高 ：230 mm
	</p>
	<p>
		Hight: 230mm
	</p>
	<p>
		口径：30mm
	</p>
	<p>
		Caliber：30mm
	</p>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:10:40',NULL,'/public/uploads/image/20190902/20190902133642_15995.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402587,'2019-09-02 14:10:40');
INSERT INTO `tb_article` VALUES (23,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'6L欧式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902140943_31736.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:09:45',NULL,'/public/uploads/image/20190902/20190902133702_61289.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402608,'2019-09-02 14:09:45');
INSERT INTO `tb_article` VALUES (24,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'10L堆码桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902140858_96668.jpg\" alt=\"\" /><br />
	<p>
		品 牌 : 佳 罐
	</p>
	<p>
		Brand : Good tank
	</p>
	<p>
		型 号 : 20L
	</p>
	<p>
		Model : 20L
	</p>
	<p>
		加 工 定 制 :否
	</p>
	<p>
		Custom processing : NO
	</p>
	<p>
		材 质 : 塑 料
	</p>
	<p>
		Material : Plastic
	</p>
	<p>
		长 :200 mm
	</p>
	<p>
		Length: 200mm
	</p>
	<p>
		宽 : 180mm
	</p>
	<p>
		Breadt : 180mm
	</p>
	<p>
		高 ：300 mm
	</p>
	<p>
		Hight: 300mm
	</p>
	<p>
		口径：40mm
	</p>
	<p>
		Caliber：40mm
	</p>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:09:02',NULL,'/public/uploads/image/20190902/20190902133740_79826.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402629,'2019-09-02 14:09:02');
INSERT INTO `tb_article` VALUES (25,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'10L欧式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902140743_33436.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:07:57',NULL,'/public/uploads/image/20190902/20190902133801_21821.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402667,'2019-09-02 14:07:57');
INSERT INTO `tb_article` VALUES (26,9,1,1567590641,NULL,1,'0,',',0,',0,NULL,NULL,'10L小口扁桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902140706_99533.jpg\" alt=\"\" /><br />
	<p>
		品 牌 : 佳 罐
	</p>
	<p>
		Brand : Good tank
	</p>
	<p>
		型 号 : 10L
	</p>
	<p>
		加 工 定 制 :否
	</p>
	<p>
		Custom processing : NO
	</p>
	<p>
		材 质 : 塑 料
	</p>
	<p>
		Material : Plastic
	</p>
	<p>
		长 :230 mm
	</p>
	<p>
		Length: 230mm
	</p>
	<p>
		宽 : 150 mm
	</p>
	<p>
		Breadt : 150 mm
	</p>
	<p>
		高 ：380mm
	</p>
	<p>
		Hight: 380mm
	</p>
	<p>
		口径：40mm
	</p>
	<p>
		Caliber：40mm
	</p>
	<p>
		上一个：5L小方桶
	</p>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:07:10',NULL,'/public/uploads/image/20190902/20190902133820_35449.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402689,'2019-09-02 14:07:10');
INSERT INTO `tb_article` VALUES (27,9,1,1567590641,NULL,1,'0,',',0,',0,NULL,NULL,'14L欧式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902140614_47109.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:06:19',NULL,'/public/uploads/image/20190902/20190902133839_33409.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402706,'2019-09-02 14:06:19');
INSERT INTO `tb_article` VALUES (28,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'16L欧式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902140540_48177.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:05:42',NULL,'/public/uploads/image/20190902/20190902133900_34933.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402727,'2019-09-02 14:05:42');
INSERT INTO `tb_article` VALUES (29,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'18L美式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902140507_93800.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:05:09',NULL,'/public/uploads/image/20190902/20190902133918_23364.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402746,'2019-09-02 14:05:09');
INSERT INTO `tb_article` VALUES (30,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'18L欧式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902140342_38094.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:04:09',NULL,'/public/uploads/image/20190902/20190902133940_96404.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402765,'2019-09-02 14:04:09');
INSERT INTO `tb_article` VALUES (31,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'20L对角桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902140301_36886.jpg\" alt=\"\" /><br />
	<p>
		品 牌 : 佳 罐
	</p>
	<p>
		Brand : Good tank
	</p>
	<p>
		型 号 : 20L
	</p>
	<p>
		Model : 2L
	</p>
	<p>
		加 工 定 制 :否
	</p>
	<p>
		Custom processing : NO
	</p>
	<p>
		材 质 : 塑 料
	</p>
	<p>
		Material : Plastic
	</p>
	<p>
		长 :300 mm
	</p>
	<p>
		Length: 300mm
	</p>
	<p>
		宽 : 250 mm
	</p>
	<p>
		高 ：450 mm
	</p>
	<p>
		Hight: 450mm
	</p>
	<p>
		口径：60mm
	</p>
	<p>
		Caliber：60mm
	</p>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:03:19',NULL,'/public/uploads/image/20190902/20190902134005_25213.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402787,'2019-09-02 14:03:19');
INSERT INTO `tb_article` VALUES (32,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'20L美式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902140226_56642.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:02:42',NULL,'/public/uploads/image/20190902/20190902134025_41239.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402812,'2019-09-02 14:02:42');
INSERT INTO `tb_article` VALUES (33,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'20L欧式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902140125_84352.jpg\" alt=\"\" /><br />
	<p>
		品 牌 : 佳 罐
	</p>
	<p>
		Brand : Good tank
	</p>
	<p>
		型 号 : 5L
	</p>
	<p>
		Model : 5L
	</p>
	<p>
		加 工 定 制 :否
	</p>
	<p>
		Custom processing : NO
	</p>
	<p>
		材 质 : 塑 料
	</p>
	<p>
		Material : Plastic
	</p>
	<p>
		上直径:185 mm
	</p>
	<p>
		upperdiameter: 185mm
	</p>
	<p>
		下直径 : 185 mm
	</p>
	<p>
		lower diameter: 185mm
	</p>
	<p>
		高度 ：230 mm
	</p>
	<p>
		Hight : 230mm
	</p>
	<p>
		盖 盒 方 式：强压
	</p>
	<p>
		Hamper the way ：pressure
	</p>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:02:04',NULL,'/public/uploads/image/20190902/20190902134051_72124.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402837,'2019-09-02 14:02:04');
INSERT INTO `tb_article` VALUES (34,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'20L小方口','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902140041_48435.jpg\" alt=\"\" /><br />
	<p>
		品 牌 : 佳 罐
	</p>
	<p>
		Brand : Good tank
	</p>
	<p>
		型 号 : 20L
	</p>
	<p>
		Model : 20L
	</p>
	<p>
		加 工 定 制 :否
	</p>
	<p>
		Custom processing : NO
	</p>
	<p>
		材 质 : 塑 料
	</p>
	<p>
		Material : Plastic
	</p>
	<p>
		长 :250 mm
	</p>
	<p>
		Length: 250mm
	</p>
	<p>
		宽 : 200 mm
	</p>
	<p>
		Breadt : 200mm
	</p>
	<p>
		高 ：400 mm
	</p>
	<p>
		Hight: 400mm
	</p>
	<p>
		口径：60mm
	</p>
	<p>
		Caliber：60mm
	</p>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:01:04',NULL,'/public/uploads/image/20190902/20190902134112_63676.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402860,'2019-09-02 14:01:04');
INSERT INTO `tb_article` VALUES (35,9,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'25L广口桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902135955_69383.jpg\" alt=\"\" /><br />
	<p>
		品 牌 : 佳 罐
	</p>
	<p>
		Brand : Good tank
	</p>
	<p>
		型 号 : 25L
	</p>
	<p>
		Model : 25L
	</p>
	<p>
		加 工 定 制 :否
	</p>
	<p>
		Custom processing : NO
	</p>
	<p>
		材 质 : 塑 料
	</p>
	<p>
		Material : Plastic
	</p>
	<p>
		高 :440mm
	</p>
	<p>
		High : 440mm
	</p>
	<p>
		口径 : 220mm
	</p>
	<p>
		Caliber : 220 mm
	</p>
	<p>
		直径 ：300 mm
	</p>
	<p>
		Diameter : 300mm
	</p>
	<p>
		适 用 领 域 : 化工、食品、医药
	</p>
	<p>
		Application : Chemical、 Food、Medical
	</p>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:00:14',NULL,'/public/uploads/image/20190902/20190902134131_45933.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402879,'2019-09-02 14:00:14');
INSERT INTO `tb_article` VALUES (36,9,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'25L美式塑料桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902135823_17715.jpg\" alt=\"\" /><br />
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 13:59:35',NULL,'/public/uploads/image/20190902/20190902134150_34455.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402897,'2019-09-02 13:59:35');
INSERT INTO `tb_article` VALUES (37,9,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'25L小方口桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902135742_62064.jpg\" alt=\"\" /><br />
	<p>
		品 牌 : 佳 罐
	</p>
	<p>
		Brand : Good tank
	</p>
	<p>
		型 号 : 25L
	</p>
	<p>
		Model : 25L
	</p>
	<p>
		加 工 定 制 :否
	</p>
	<p>
		Custom processing : NO
	</p>
	<p>
		材 质 : 塑 料
	</p>
	<p>
		Material : Plastic
	</p>
	<p>
		长 :350mm
	</p>
	<p>
		Length: 350mm
	</p>
	<p>
		宽 : 265 mm
	</p>
	<p>
		Breadt : 265 mm
	</p>
	<p>
		高 ：370mm
	</p>
	<p>
		Hight: 370mm
	</p>
	<p>
		口径：48mm
	</p>
	<p>
		Caliber：48mm
	</p>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 13:58:04',NULL,'/public/uploads/image/20190902/20190902134209_97371.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402916,'2019-09-02 13:58:04');
INSERT INTO `tb_article` VALUES (38,9,0,NULL,NULL,3,'0,',',0,',0,NULL,NULL,'30L小方口桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902135709_29162.jpg\" alt=\"\" /><br />
	<p>
		品 牌 : 佳 罐
	</p>
	<p>
		Brand : Good tank
	</p>
	<p>
		型 号 : 30L
	</p>
	<p>
		Model :30L
	</p>
	<p>
		加 工 定 制 :否
	</p>
	<p>
		Custom processing : NO
	</p>
	<p>
		材 质 : 塑 料
	</p>
	<p>
		Material : Plastic
	</p>
	<p>
		长 :300mm
	</p>
	<p>
		Length: 300mm
	</p>
	<p>
		宽 : 250mm
	</p>
	<p>
		Breadt : 250 mm
	</p>
	<p>
		高 ：450 mm
	</p>
	<p>
		Hight: 450mm
	</p>
	<p>
		口径：60mm
	</p>
	<p>
		Caliber：60mm
	</p>
<br />
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 13:57:17',NULL,'/public/uploads/image/20190902/20190902134224_95072.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402934,'2019-09-02 13:57:17');
INSERT INTO `tb_article` VALUES (39,9,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'50L广口桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902135447_56820.jpg\" alt=\"\" /><br />
	<table width=\"80%\" height=\"100%\" border=\"0\" style=\"font-stretch:normal;font-size:12px;line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;color:#5A5A5A;border-spacing:0px;empty-cells:show;background-color:#FFFFFF;\" class=\"ke-zeroborder\">
		<tbody>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">品 牌  : 佳 罐</span>
						</p>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Brand    : Good tank</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:20px;font-size:18px;\">型 号 : 50L</span>
						</p>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:20px;font-size:14px;\">Model   :  50</span><span style=\"margin:0px;padding:0px;line-height:20px;font-size:14px;\">L</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">加 工 定 制 :否</span>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Custom processing  : NO</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\"> 材 质 : 塑 料</span>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Material   :  Plastic</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">长 </span><span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">:380 mm</span><br />
<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\"></span><span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Length: 380mm</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">宽 : 340 mm</span>
						</p>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Breadt :  340 mm</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">高 ：540 mm</span><br />
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Hight: 540mm</span>
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">口径：220mm</span>
						</p>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\"><span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Caliber：220mm</span></span>
						</p>
					</blockquote>
				</td>
			</tr>
		</tbody>
	</table>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:27:54',NULL,'/public/uploads/image/20190902/20190902142753_48438.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402950,'2019-09-02 14:27:54');
INSERT INTO `tb_article` VALUES (40,9,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'50L圆桶（活动把手）','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902135409_43181.jpg\" alt=\"\" /><br />
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			品&nbsp;牌&nbsp;&nbsp;:&nbsp;佳&nbsp;罐
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Brand&nbsp; &nbsp;&nbsp;:&nbsp;Good&nbsp;tank
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			型&nbsp;号&nbsp;:&nbsp;50L
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Model&nbsp; &nbsp;:&nbsp;50L
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		加 工 定 制&nbsp;:否
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Custom&nbsp;processing&nbsp;&nbsp;:&nbsp;NO
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		&nbsp;材&nbsp;质&nbsp;:&nbsp;塑&nbsp;料
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Material&nbsp; &nbsp;:&nbsp; Plastic
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			高&nbsp;:600 mm<br />
High :&nbsp;600 mm
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			口径 :&nbsp;240 mm
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Caliber&nbsp;&nbsp;:&nbsp;&nbsp;240 mm
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		直径 ：410 mm<br />
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Diameter : 410mm
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		适 用 领 域&nbsp;:&nbsp;化工、食品、医药
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Application&nbsp;&nbsp;:&nbsp;Chemical、&nbsp;Food、Medical
		</p>
	</blockquote>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 13:54:22',NULL,'/public/uploads/image/20190902/20190902134300_88406.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402968,'2019-09-02 13:54:22');
INSERT INTO `tb_article` VALUES (41,9,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'50L圆桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902135330_60512.jpg\" alt=\"\" /><br />
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			品 牌  : 佳 罐
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Brand    : Good tank
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			型 号 : 50L
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Model   : 50L
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		加 工 定 制 :否
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Custom processing  : NO
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		 材 质 : 塑 料
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Material   :  Plastic
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			高 :600mm<br />
High : 600mm
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			口径 : 240mm
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Caliber  :  240 mm
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		直径 ：410 mm<br />
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Diameter : 410mm
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		适 用 领 域 : 化工、食品、医药
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Application  : Chemical、 Food、Medical
		</p>
	</blockquote>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:28:17',NULL,'/public/uploads/image/20190902/20190902142812_63679.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567402986,'2019-09-02 14:28:17');
INSERT INTO `tb_article` VALUES (42,9,0,NULL,NULL,6,'0,',',0,',0,NULL,NULL,'60L双口桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<div style=\"text-align:left;\">
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"/public/uploads/image/20190902/20190902135207_31025.jpg\" alt=\"\" />
	</div>
	<table width=\"80%\" height=\"100%\" border=\"0\" style=\"font-stretch:normal;font-size:12px;line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;color:#5A5A5A;border-spacing:0px;empty-cells:show;background-color:#FFFFFF;\" class=\"ke-zeroborder\">
		<tbody>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">品&nbsp;牌&nbsp;&nbsp;:&nbsp;佳&nbsp;罐</span> 
						</p>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Brand&nbsp; &nbsp;&nbsp;:&nbsp;Good&nbsp;tank</span> 
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:20px;font-size:18px;\">型&nbsp;号&nbsp;:&nbsp;60L</span> 
						</p>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:20px;font-size:14px;\">Model&nbsp; &nbsp;:&nbsp; 600</span><span style=\"margin:0px;padding:0px;line-height:20px;font-size:14px;\">L</span> 
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">加 工 定 制&nbsp;:否</span> 
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Custom&nbsp;processing&nbsp;&nbsp;:&nbsp;NO</span> 
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\"> 材&nbsp;质&nbsp;:&nbsp;塑&nbsp;料</span> 
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Material&nbsp; &nbsp;:&nbsp; Plastic</span> 
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">高 </span><span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">:650 mm</span><br />
<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\"></span><span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">High :&nbsp;650 mm</span> 
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">口径 :&nbsp;48 mm</span> 
						</p>
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Caliber&nbsp;&nbsp;:&nbsp;&nbsp;48 mm</span> 
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">直径 ：410 mm</span><br />
						<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
							<span style=\"margin:0px;padding:0px;line-height:19.6px;font-size:14px;\">Diameter : 410mm</span> 
						</p>
					</blockquote>
				</td>
			</tr>
			<tr>
				<td style=\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\">
					<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
						<span style=\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\">适 用 领 域&nbsp;:&nbsp;化工、食品、医药</span> 
					</blockquote>
				</td>
			</tr>
		</tbody>
	</table>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 13:52:56',NULL,'/public/uploads/image/20190902/20190902134334_56614.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567403002,'2019-09-02 13:52:56');
INSERT INTO `tb_article` VALUES (43,9,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'200L单环桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902134946_56906.jpg\" alt=\"\" /><br />
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			品&nbsp;牌&nbsp;&nbsp;:&nbsp;佳&nbsp;罐
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Brand&nbsp; &nbsp;&nbsp;:&nbsp;Good&nbsp;tank
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			型&nbsp;号&nbsp;:&nbsp;200L
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Model&nbsp; &nbsp;:&nbsp; 200L
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		加 工 定 制&nbsp;:否
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Custom&nbsp;processing&nbsp;&nbsp;:&nbsp;NO
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		&nbsp;材&nbsp;质&nbsp;:&nbsp;塑&nbsp;料
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Material&nbsp; &nbsp;:&nbsp; Plastic
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			高&nbsp;:930 mm<br />
High :&nbsp; 930 mm
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			口径 : 60 mm
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Caliber&nbsp;&nbsp;:&nbsp; 60 mm
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		直径 ：585 mm<br />
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Diameter : 585 mm
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		适 用 领 域&nbsp;:&nbsp;化工、食品、医药
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Application&nbsp;&nbsp;:&nbsp;Chemical、&nbsp;Food、Medical
		</p>
	</blockquote>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 13:49:59',NULL,'/public/uploads/image/20190902/20190902134351_63171.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567403020,'2019-09-02 13:49:59');
INSERT INTO `tb_article` VALUES (44,9,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'200L双环桶','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902134451_64371.jpg\" alt=\"\" /><br />
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			品 牌  : 佳 罐
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Brand    : Good tank
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			型 号 : 200L
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Model   :  200L
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		加 工 定 制 :否
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Custom processing  : NO
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		 材 质 : 塑 料
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Material   :  Plastic
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			高 :930 mm<br />
High :  930 mm
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			口径 : 60 mm
		</p>
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Caliber  :  60 mm
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		直径 ：585 mm<br />
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Diameter : 585 mm
		</p>
	</blockquote>
	<blockquote style=\"margin:0px 0px 0px 40px;padding:0px;border:currentcolor;\">
		适 用 领 域 : 化工、食品、医药
		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">
			Application  : Chemical、 Food、Medical
		</p>
	</blockquote>
<br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:28:47',NULL,'/public/uploads/image/20190902/20190902142842_20725.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567403038,'2019-09-02 14:28:47');
INSERT INTO `tb_article` VALUES (45,3,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'吹塑设备','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902143310_24235.png\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:33:19',NULL,'/public/uploads/image/20190902/20190902143255_63195.png',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567405957,'2019-09-02 14:33:19');
INSERT INTO `tb_article` VALUES (46,9,0,NULL,NULL,3,'0,',',0,',0,NULL,NULL,'吹塑设备','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902143349_34743.jpg\" alt=\"\" width=\"600\" height=\"450\" title=\"\" align=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:34:01',NULL,'/public/uploads/image/20190902/20190902143336_72951.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567406002,'2019-09-02 14:34:01');
INSERT INTO `tb_article` VALUES (47,8,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'吹塑设备','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902143510_52547.png\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:35:14',NULL,'/public/uploads/image/20190902/20190902143450_70172.png',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567406071,'2019-09-02 14:35:14');
INSERT INTO `tb_article` VALUES (48,9,0,NULL,NULL,1,'0,',',0,',0,NULL,NULL,'大型吹塑设备','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902143737_87360.png\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:37:41',NULL,'/public/uploads/image/20190902/20190902143720_61234.png',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567406129,'2019-09-02 14:37:41');
INSERT INTO `tb_article` VALUES (49,8,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'框架设备','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902143810_42912.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:38:17',NULL,'/public/uploads/image/20190902/20190902143757_48545.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567406264,'2019-09-02 14:38:17');
INSERT INTO `tb_article` VALUES (50,8,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'框架设备','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902143847_31730.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:38:50',NULL,'/public/uploads/image/20190902/20190902143832_31198.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567406300,'2019-09-02 14:38:50');
INSERT INTO `tb_article` VALUES (51,8,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'框架设备','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902143932_89917.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:39:36',NULL,'/public/uploads/image/20190902/20190902143911_90318.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567406335,'2019-09-02 14:39:36');
INSERT INTO `tb_article` VALUES (52,9,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'生产车间','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902144012_54785.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:40:15',NULL,'/public/uploads/image/20190902/20190902144000_72308.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567406388,'2019-09-02 14:40:15');
INSERT INTO `tb_article` VALUES (53,9,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'吨桶跌落检测','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902144642_10444.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:46:43',NULL,'/public/uploads/image/20190902/20190902144629_16825.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567406770,'2019-09-02 14:46:43');
INSERT INTO `tb_article` VALUES (54,9,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'吨桶堆码实验','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902144723_66101.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:47:24',NULL,'/public/uploads/image/20190902/20190902144704_29951.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567406807,'2019-09-02 14:47:24');
INSERT INTO `tb_article` VALUES (55,9,0,NULL,NULL,3,'0,',',0,',0,NULL,NULL,'吨桶振动检测','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902144809_86168.jpg\" alt=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 14:48:10',NULL,'/public/uploads/image/20190902/20190902144756_61377.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567406855,'2019-09-02 14:48:10');
INSERT INTO `tb_article` VALUES (56,9,0,NULL,NULL,0,'0,',',0,',0,NULL,NULL,'全国工业产品生产许可证','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902150717_79532.jpg\" alt=\"\" width=\"500\" height=\"701\" title=\"\" align=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 15:33:43',NULL,'/public/uploads/image/20190902/20190902153341_89285.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567408001,'2019-09-02 15:33:43');
INSERT INTO `tb_article` VALUES (57,9,0,NULL,NULL,0,'0,',',0,',0,NULL,NULL,'型式认可证书','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902150812_73569.jpg\" alt=\"\" width=\"500\" height=\"701\" title=\"\" align=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 15:36:39',NULL,'/public/uploads/image/20190902/20190902153637_14902.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567408057,'2019-09-02 15:36:39');
INSERT INTO `tb_article` VALUES (58,9,0,NULL,NULL,0,'0,',',0,',0,NULL,NULL,'营业执照','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902150925_68892.jpg\" alt=\"\" width=\"500\" height=\"701\" title=\"\" align=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 15:36:17',NULL,'/public/uploads/image/20190902/20190902153615_87884.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567408109,'2019-09-02 15:36:17');
INSERT INTO `tb_article` VALUES (59,9,0,NULL,NULL,0,'0,',',0,',0,NULL,NULL,'质量管理体系认证证书','cdjiaguan.com',NULL,NULL,'<div style=\"text-align:center;\">
	<img src=\"/public/uploads/image/20190902/20190902151058_87082.jpg\" alt=\"\" width=\"500\" height=\"701\" title=\"\" align=\"\" /><br />
</div>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 15:35:56',NULL,'/public/uploads/image/20190902/20190902153554_37235.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567408211,'2019-09-02 15:35:56');
INSERT INTO `tb_article` VALUES (61,9,0,NULL,NULL,2,'1,0,',',0,',1,NULL,NULL,'怎样预防塑料桶老化问题','cdjiaguan.com',NULL,NULL,'<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">塑料制品在使用一段时间之后其表面会发白、粉化，硬度明显降低。这就是塑料的老化现象。那么盛放液体的塑料桶应该怎样预防老化问题呢</span><span lang=\"EN-US\" style=\"font-size:14px;\">?</span><span style=\"font-size:14px;\">我们一起来了解一下。<br />
	<div style=\"text-align:center;\">
		<span style=\"text-indent:2em;\"></span><span style=\"text-indent:2em;\"><img src=\"/public/uploads/image/20190902/20190902174129_69999.jpg\" alt=\"\" /></span>
	</div>
</span>
</p>
<p style=\"text-indent:2em;\">
	<span lang=\"EN-US\" style=\"font-size:14px;\">1</span><span style=\"font-size:14px;\">、为解决老化问题，在制塑料时常加一些防老剂，以减慢其老化速度，其实这并未从根本上解决问题。为了使塑料制品能经久耐用，主要是使用时要得当，不让阳光曝晒，不让雨淋，也不在火上或暖气上烤，不要常接触水或油类等。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">2、另外，尽量避免用塑料容器或者袋子盛装油腻或者热食物，塑料制品不可以用力碰撞，也不可以在高温下经常暴晒，碰撞容易碎，暴晒容易加快其老化，从而减短使用寿命。</span>
</p>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-10 21:58:21',NULL,'/public/uploads/image/20190902/20190902174057_18028.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567417240,'2019-09-10 21:58:21');
INSERT INTO `tb_article` VALUES (62,7,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'塑料桶破碎后怎样修补','cdjiaguan.com',NULL,NULL,'<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">当塑料桶出现微小破损之后虽然不影响使用，但是随着时间的增加，破损可能会越来越大。这时候我们可以对塑料桶进行修补。那么我们可以使用哪些方法来修补呢</span><span lang=\"EN-US\"><span style=\"font-size:14px;\">?<br />
	<div style=\"text-align:center;\">
		<span style=\"text-indent:2em;\"></span><span style=\"text-indent:2em;\"><img src=\"/public/uploads/image/20190902/20190902174227_35903.jpg\" alt=\"\" /></span>
	</div>
</span><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span lang=\"EN-US\" style=\"font-size:14px;\">1.</span><span style=\"font-size:14px;\">用塑料片热补</span><span lang=\"EN-US\" style=\"font-size:14px;\">:</span><span style=\"font-size:14px;\">如果塑料桶破裂的不是裂缝而是孔洞，应找</span><span lang=\"EN-US\" style=\"font-size:14px;\">-</span><span style=\"font-size:14px;\">块塑料片，进行热补。把塑料片融化，滴在空洞处，边滴边抹平，使得液体要盖空洞，冷却后就修补好了。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span lang=\"EN-US\" style=\"font-size:14px;\">2.</span><span style=\"font-size:14px;\">用万能胶水</span><span lang=\"EN-US\" style=\"font-size:14px;\">:</span><span style=\"font-size:14px;\">如果没有钢锯条还可以用万能胶水，使用前把裂纹周围擦拭干净，不要有灰尘，然后在破损周围涂抹万能胶水。过一会再用厚一点的塑料袋，裁剪成合适大小贴在破损处，确保没有空隙等胶水干了就可以了。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span lang=\"EN-US\" style=\"font-size:14px;\">3.</span><span style=\"font-size:14px;\">使用融化的钢锯条</span><span lang=\"EN-US\" style=\"font-size:14px;\">:</span><span style=\"font-size:14px;\">很多人习惯使用</span><span lang=\"EN-US\" style=\"font-size:14px;\">502</span><span style=\"font-size:14px;\">胶水去修补出现破损的塑料桶，这样修补的塑料桶是不牢固的，最好的方式是使用融化的钢锯条，在裂纹出涂抹。由于钢锯条冷却后是固体，可以很好的修补裂纹地方并且牢固不容易二次损坏。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">4、粘合剂粘连:特别小的孔，可以选择粘合剂粘连，当然如果是稍微大点这种办法是不可行的，黏合剂是粘不好的，最好的办法是用专门的塑料焊接弥补，也可以找-快合适的塑料桶焊接到破的地方就可以了。</span>
</p>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 17:42:32',NULL,'/public/uploads/image/20190902/20190902174157_56032.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567417297,'2019-09-02 17:42:32');
INSERT INTO `tb_article` VALUES (63,7,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'怎样可以延长塑料桶的使用寿命','cdjiaguan.com',NULL,NULL,'<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">我们经常用塑料桶来盛放各种物品，用途非常广泛。但是任何东西都有寿命限制，我们要做的就是如何延长寿命</span><span lang=\"EN-US\" style=\"font-size:14px;\">,</span><span style=\"font-size:14px;\">今天就简单的和大家分享一下关于延长塑料桶使用寿命的方法吧。<br />
	<div style=\"text-align:center;\">
		<span style=\"text-indent:2em;\"></span><span style=\"text-indent:2em;\"><img src=\"/public/uploads/image/20190902/20190902174350_21455.jpg\" alt=\"\" /></span>
	</div>
</span>
</p>
<p style=\"text-indent:2em;\">
	<span lang=\"EN-US\" style=\"font-size:14px;\">1</span><span style=\"font-size:14px;\">、操作人员包装货物后的塑料桶需要采用双面平托盘进行堆放，托盘尺寸不能大于</span><span lang=\"EN-US\" style=\"font-size:14px;\">1</span><span style=\"font-size:14px;\">。</span><span lang=\"EN-US\" style=\"font-size:14px;\">3</span><span style=\"font-size:14px;\">米</span><span lang=\"EN-US\" style=\"font-size:14px;\">;</span><span style=\"font-size:14px;\">每个托盘上面堆放不得多于</span><span lang=\"EN-US\" style=\"font-size:14px;\">1</span><span style=\"font-size:14px;\">层，桶的边缘不能超过托盘的边缘，堆放桶的个数由托盘大小而定，托盘上的桶应对称堆放，使整个托盘与其上桶的重心位于托盘中心的位置。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span lang=\"EN-US\" style=\"font-size:14px;\">2.</span><span style=\"font-size:14px;\">塑料桶应该遮篷储存，避免曝晒现象，贮存温度需要控制在</span><span lang=\"EN-US\" style=\"font-size:14px;\">40</span><span style=\"font-size:14px;\">摄氏度以下，委下</span><span lang=\"EN-US\" style=\"font-size:14px;\">18</span><span style=\"font-size:14px;\">摄氏度以上的范围。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">3.堆放在托盘上的桶用缠绕膜打包固定，打包时应避免桶与桶之间相互挤压变形，变形量小于等于5%，打包后托盘的堆放层数应不多于2层，堆高时上下层应对准，使上层的重星均匀地施加于下层:堆放处地面应平整，并处于水平位置。</span>
</p>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 17:43:54',NULL,'/public/uploads/image/20190902/20190902174319_45908.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567417367,'2019-09-02 17:43:54');
INSERT INTO `tb_article` VALUES (64,3,0,NULL,NULL,2,'0,',',0,',0,NULL,NULL,'塑料桶的保质期限是多久','cdjiaguan.com',NULL,NULL,'<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">塑料桶广泛应用于我们日常生活中，各个行业都能见到这种产品的身影。但是塑料桶有保质期吗</span><span lang=\"EN-US\" style=\"font-size:14px;\">?</span><span style=\"font-size:14px;\">不少人都很疑惑，下面我们就一起来了解一下吧。<br />
	<div style=\"text-align:center;\">
		<span style=\"text-indent:2em;\"></span><span style=\"text-indent:2em;\"><img src=\"/public/uploads/image/20190902/20190902174446_19003.jpg\" alt=\"\" /></span>
	</div>
</span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">塑料桶也是有保质期的，过期后塑料会老化，出现变色、变脆的情况，如发现使用的塑料盒变黄或不再透明，应尽快更换。一定要关注塑料制品</span><span lang=\"EN-US\" style=\"font-size:14px;\">—</span><span style=\"font-size:14px;\">塑料桶的保质期。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">同时，老化的塑料或会释出可能有害人体的物质。大多数塑料制品-塑料桶的保质期-般在三至五年左右，如果使用频繁，一至两年更换更好。另外，正确的对塑料桶进行保养和使用，不但可以增加其使用寿命，还可以确保工作人员的人身安全。</span>
</p>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-02 17:44:48',NULL,'/public/uploads/image/20190902/20190902174418_19898.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567417443,'2019-09-02 17:44:48');
INSERT INTO `tb_article` VALUES (65,3,0,1567853003,NULL,1,'0,',',0,',0,NULL,NULL,'合格的塑料桶产品需要通过哪些性能检验','cdjiaguan.com',NULL,NULL,'<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">尽管塑料桶已普遍存在，可是我们在选购起来仍是要有必定的技巧的。选择的时候首先要看塑料桶的外观，色泽鲜亮、外形漂亮，闻一闻塑料桶的气味，一般不要选择异味比较大的产品。尽管塑料桶外表看起来大同小异，可是质量的确大有差距，人们必定要仔细选择。<br />
	<div style=\"text-align:center;\">
		<span style=\"text-indent:2em;\"></span><span style=\"text-indent:2em;\"><img src=\"/public/uploads/image/20190903/20190903175753_42926.jpg\" alt=\"\" /></span>
	</div>
</span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">塑料桶性能查验：开口塑料容器须进行笔直冲击跌落实验、堆码实验、密封实验。闭口塑料容器须进行笔直冲击跌落实验、堆码实验、气密实验、液压实验。装置式提手及整体式提手的塑料容器还需做悬吊实验。塑料桶外观：塑料桶厂家桶体对称部位壁厚比不大于</span><span lang=\"EN-US\" style=\"font-size:14px;\">2:1</span><span style=\"font-size:14px;\">，无砂眼、无塑化不良，外壁、嘴口平坦光洁，直径不大于</span><span lang=\"EN-US\" style=\"font-size:14px;\">2mm</span><span style=\"font-size:14px;\">的气泡不多于</span><span lang=\"EN-US\" style=\"font-size:14px;\">2</span><span style=\"font-size:14px;\">个，黑点杂质长度不大于</span><span lang=\"EN-US\" style=\"font-size:14px;\">4mm</span><span style=\"font-size:14px;\">，桶口件重合严密，互换性好。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">塑料桶漂亮表里润滑、重量轻、强度好、耐冲击、无毒无味、运送便利。使用寿命也长，保质期为1.5年。 产品技术参数严格执行标准，当然产品外观设计和产品尺寸也可以根据需要量身定做。</span>
</p>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-03 17:57:55',NULL,'/public/uploads/image/20190903/20190903175731_34180.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567504620,'2019-09-03 17:57:55');
INSERT INTO `tb_article` VALUES (66,5,1,1567590469,NULL,1,'0,',',0,',0,NULL,NULL,'怎样安全堆码20升塑料桶','cdjiaguan.com',NULL,NULL,'<p style=\"text-indent:2em;\">
	<span lang=\"EN-US\">20</span>升塑料桶具有杰出的耐热性和耐寒性，硬度、拉伸强度、电绝缘功能和韧性都很好，并且具有很好的化学稳定性，在室温下几乎不溶于任何有机溶剂，耐多种酸、碱及盐类溶液的腐蚀，还具有优秀的耐环境应力开裂和热应力开裂功能，外表硬度高，尺寸稳定性好。<br />
	<div style=\"text-align:center;\">
		<span style=\"text-indent:2em;\"><img src=\"/public/uploads/image/20190903/20190903175846_62437.jpg\" alt=\"\" /></span>
	</div>
</p>
<p style=\"text-indent:2em;\">
	罐装前请查<span lang=\"EN-US\">20</span>升塑料桶的验瓶塞与桶体是不是配对。不然，要是外盖和桶体不配对，液體就会从口中漏出来。装上液体后，在运送全过程中，请不必将桶体当即移到路面上，以防底端损坏和擦破。恰当的方式是用两手说到化工<span lang=\"EN-US\">20</span>升塑料桶厂家，或是用电动叉车的木制托盘装桶。<span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	20升塑料桶的强度和熔体压力有关，如果熔体压力高，就会促进塑化好，混料上色也就会均匀，特别是高密度聚乙烯与低密度聚乙烯共混料，及上色反场，型坯上的晶点、云雾状花纹减少，所以咱们能够经过提高螺杆转速来提高熔体压力，还有桶内的相对湿度，与<span lang=\"EN-US\">20</span>升塑料桶的强度还是有必定的影响。<span lang=\"EN-US\"><o:p></o:p></span>
</p>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-03 17:58:48',NULL,'/public/uploads/image/20190903/20190903175823_95838.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567504685,'2019-09-03 17:58:48');
INSERT INTO `tb_article` VALUES (67,3,0,1567590469,NULL,1,'0,',',0,',0,NULL,NULL,'塑料桶不适合盛装什么物质','cdjiaguan.com',NULL,NULL,'<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">塑料桶耐酸碱防腐蚀、强度高、耐性好，耐磨损、耐高温、施工寿命长。但是并不代表塑料桶就是万能产品了，因为并不适合盛装易燃易爆物。<br />
	<div style=\"text-align:center;\">
		<span style=\"text-indent:2em;\"></span><span style=\"text-indent:2em;\"><img src=\"/public/uploads/image/20190903/20190903175934_53428.jpg\" alt=\"\" /></span>
	</div>
</span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">塑料桶装置外盖需外力紧固，密封圈装置后必须与桶口触摸平面紧贴，阻止密封圈歪曲装置。在选用塑料桶进行包装运送的时分，必定要注意塑料桶自身能够承载的重量不能超过自身容积的</span><span lang=\"EN-US\" style=\"font-size:14px;\">45%</span><span style=\"font-size:14px;\">，否则会呈现变形的现象。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">一般塑料桶在与外界触摸冲突，尤其是可移动塑料桶厂家在搬运过程中，在外外表积累静电荷，在静电积累到必定的程度，或许会发生刷型发电，
刷型放电的能量大可达</span><span lang=\"EN-US\" style=\"font-size:14px;\">10mj</span><span style=\"font-size:14px;\">，假如这个刷型放电正好在桶口附近，则或许会点着从桶口散发出的易燃蒸汽，回火导致桶内闪爆</span><span lang=\"EN-US\"><span style=\"font-size:14px;\">;</span><o:p></o:p></span>
</p>
<p style=\"text-indent:2em;\">
	<span style=\"font-size:14px;\">其次，在往一般塑料桶内充装液体时，因为液体在充装过程中与充装管壁冲突，会把静电带入桶内，桶内静电积累，液体或许会与导体间发生刷型放电，从而点着桶内的易燃蒸汽云，造成桶内闪爆。</span><span lang=\"EN-US\"><o:p></o:p></span>
</p>',NULL,NULL,NULL,NULL,1,NULL,'2019-09-10 17:20:25',NULL,'/public/uploads/image/20190903/20190903175908_93342.jpg',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1567504735,'2019-09-10 17:20:25');

DELETE FROM tb_city;
INSERT INTO `tb_city` VALUES (1,0,'四川省','2017-06-06 16:00:13');
INSERT INTO `tb_city` VALUES (3,0,'绵阳市','2017-05-26 10:54:55');
INSERT INTO `tb_city` VALUES (4,0,'德阳市','2017-05-26 10:54:59');
INSERT INTO `tb_city` VALUES (5,10,'锦江区','2017-05-26 10:55:05');
INSERT INTO `tb_city` VALUES (6,1,'资阳市','2017-05-26 10:55:08');
INSERT INTO `tb_city` VALUES (7,1,'南充市','2017-05-26 10:55:23');
INSERT INTO `tb_city` VALUES (8,1,'遂宁市','2017-05-26 10:55:27');
INSERT INTO `tb_city` VALUES (9,1,'德阳市','2017-05-26 14:12:34');
INSERT INTO `tb_city` VALUES (10,1,'成都市','2017-07-17 11:25:53');
INSERT INTO `tb_city` VALUES (11,1,'北京市','2017-07-17 11:26:33');
INSERT INTO `tb_city` VALUES (12,1,'阿坝州','2017-07-17 12:27:06');

DELETE FROM tb_email;
INSERT INTO `tb_email` VALUES (1,'smtp.qq.com',465,19590850,'ykonwdiryydybgic','找回密码通知','19590850@qq.com',195908503,'2019-09-10 15:53:11');

DELETE FROM tb_guest;

DELETE FROM tb_img_info;
INSERT INTO `tb_img_info` VALUES (1,6,4,'选择平开门样式','2017-07-27 18:04:41');
INSERT INTO `tb_img_info` VALUES (2,6,4,'选择平开门样式','2017-07-27 18:04:59');
INSERT INTO `tb_img_info` VALUES (3,6,4,'选择平开门样式','2017-07-27 18:06:14');
INSERT INTO `tb_img_info` VALUES (4,6,4,'选择平开门样式','2017-07-27 18:06:27');
INSERT INTO `tb_img_info` VALUES (5,6,4,'选择平开门样式','2017-07-27 18:07:21');

DELETE FROM tb_kf;
INSERT INTO `tb_kf` VALUES (48,'','','ces','','','','2019-09-04 11:12:23');

DELETE FROM tb_links;

DELETE FROM tb_lm;
INSERT INTO `tb_lm` VALUES (1,1,'关于我们',0,'null',',1,',1,1,0,'about123',1,'page','默认','','',NULL,NULL,NULL,'',1,NULL,NULL,NULL,NULL,'','','','/about/',NULL,NULL,'2019-09-10 21:19:51');
INSERT INTO `tb_lm` VALUES (2,1,'主营产品',0,'null',',2,',1,1,0,'pic1',1,'picview','默认','','',NULL,NULL,NULL,'',3,NULL,NULL,NULL,NULL,'','','','/pro/',NULL,NULL,'2019-09-10 21:19:00');
INSERT INTO `tb_lm` VALUES (3,1,'工程设备',0,'null',',3,',1,3,0,'pic',1,'picview','默认','','',NULL,NULL,'','',3,NULL,NULL,NULL,NULL,'','','','/sb/',NULL,NULL,'2019-08-30 09:53:24');
INSERT INTO `tb_lm` VALUES (4,1,'新闻资讯',0,'null',',4,',1,4,0,'list',1,'view','默认','','',NULL,NULL,'','',2,NULL,NULL,NULL,NULL,'','','','/news/',NULL,NULL,'2019-08-30 09:53:34');
INSERT INTO `tb_lm` VALUES (5,1,'技术文章',0,'null',',5,',1,5,0,'list',1,'view','默认','','',NULL,NULL,'','',2,NULL,NULL,NULL,NULL,'','','','/jswz/',NULL,NULL,'2019-08-30 09:53:44');
INSERT INTO `tb_lm` VALUES (6,1,'荣誉资质',0,'null',',6,',1,6,0,'zz',1,'picview','默认','','',NULL,NULL,'','',3,NULL,NULL,NULL,NULL,'','','','/ry/',NULL,NULL,'2019-09-02 15:27:08');
INSERT INTO `tb_lm` VALUES (16,1,'性能测试',0,'null',',16,',1,16,0,'pic',1,'picview','默认','','',NULL,NULL,'','',3,NULL,NULL,NULL,NULL,'','','','/list16/',NULL,NULL,'2019-08-30 10:58:39');
INSERT INTO `tb_lm` VALUES (7,1,'联系我们',0,'null',',7,',1,7,0,'contact',1,'contact','默认','','',NULL,NULL,'','',1,NULL,NULL,NULL,NULL,'','','','/contact/',NULL,NULL,'2019-08-30 09:54:05');
INSERT INTO `tb_lm` VALUES (8,1,'吨桶',2,'null',',2,8,',2,8,2,'pic',1,'picview','默认','','',NULL,NULL,'','',3,NULL,NULL,NULL,NULL,'','','','/pro/list8/',NULL,NULL,'2019-09-10 15:07:23');
INSERT INTO `tb_lm` VALUES (9,1,'塑料桶',2,'null',',2,9,',2,9,2,'pic',1,'picview','默认','','',NULL,NULL,'','',3,NULL,NULL,NULL,NULL,'','','','/pro/list9/',NULL,NULL,'2019-08-30 09:54:57');
INSERT INTO `tb_lm` VALUES (10,1,'储罐',2,'null',',2,10,',2,10,2,'pic',1,'picview','默认','','',NULL,NULL,'','',3,NULL,NULL,NULL,NULL,'','','','/pro/list10/',NULL,NULL,'2019-08-30 09:55:04');
INSERT INTO `tb_lm` VALUES (11,1,'塑料托盘',2,'null',',2,11,',2,11,2,'pic',1,'picview','默认','','',NULL,NULL,'','',3,NULL,NULL,NULL,NULL,'','','','/pro/list11/',NULL,NULL,'2019-08-30 09:55:51');
INSERT INTO `tb_lm` VALUES (12,1,'垃圾桶',2,'null',',2,12,',2,12,2,'pic',1,'picview','默认','','',NULL,NULL,'','',3,NULL,NULL,NULL,NULL,'','','','/pro/list12/',NULL,NULL,'2019-08-30 09:56:37');
INSERT INTO `tb_lm` VALUES (13,1,'其他零配件',2,'null',',2,13,',2,13,2,'pic',1,'picview','默认','','',NULL,NULL,'','',3,NULL,NULL,NULL,NULL,'','','','/pro/list13/',NULL,NULL,'2019-08-30 09:56:44');
INSERT INTO `tb_lm` VALUES (14,1,'公司新闻',4,'null',',4,14,',2,14,4,'list',1,'view','默认','','',NULL,NULL,'','',2,NULL,NULL,NULL,NULL,'','','','/news/list14/',NULL,NULL,'2019-08-30 09:57:53');
INSERT INTO `tb_lm` VALUES (15,1,'行业新闻',4,'null',',4,15,',2,15,4,'list',1,'view','默认','','',NULL,NULL,'','',2,NULL,NULL,NULL,NULL,'','','','/news/list15/',NULL,NULL,'2019-08-30 09:59:19');
INSERT INTO `tb_lm` VALUES (17,1,'合作伙伴',0,'null',',17,',1,17,0,'ad',1,'adview','默认','','',NULL,NULL,'','',4,NULL,NULL,NULL,NULL,'','','','/list17/',NULL,NULL,'2019-08-30 11:05:20');
INSERT INTO `tb_lm` VALUES (18,1,'测试测试',1,'null',',1,18,',2,18,1,'page',1,'page','默认','','',NULL,NULL,'测试测试测试测试测试测试测试测试测试测试测试测试','',1,NULL,NULL,NULL,NULL,'','','','/about/list18/',NULL,NULL,'2019-09-10 16:27:15');
INSERT INTO `tb_lm` VALUES (19,1,234234,8,'null',',2,8,19,',3,19,2,'pic',1,'picview','默认','','',NULL,NULL,'','',3,NULL,NULL,NULL,NULL,'','','','/pro/list8/list19/',NULL,NULL,'2019-09-10 17:38:15');
INSERT INTO `tb_lm` VALUES (20,1,456456456,19,'null',',2,8,19,20,',4,20,2,'pic',1,'picview','默认','','',NULL,NULL,'','',3,NULL,NULL,NULL,NULL,'','','','/pro/list8/list19/list20/',NULL,NULL,'2019-09-10 17:47:44');
INSERT INTO `tb_lm` VALUES (24,1,1231,1,'null',',1,24,',2,24,1,'about',1,'page11','默认',23123,'',NULL,NULL,'','',1,NULL,NULL,NULL,NULL,'','','','/about/list24/',NULL,NULL,'2019-09-10 20:45:46');
INSERT INTO `tb_lm` VALUES (25,1,111,1,'null',',1,25,',2,25,1,'about1',1,'page2','默认','','',NULL,NULL,'','',1,NULL,NULL,NULL,NULL,'','','','/about/list25/',NULL,NULL,'2019-09-10 20:46:05');

DELETE FROM tb_log;
INSERT INTO `tb_log` VALUES (1,1,'admin','','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 15:50:22');
INSERT INTO `tb_log` VALUES (2,1,'admin','','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 15:50:24');
INSERT INTO `tb_log` VALUES (3,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:50:55');
INSERT INTO `tb_log` VALUES (4,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:50:56');
INSERT INTO `tb_log` VALUES (5,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:51:20');
INSERT INTO `tb_log` VALUES (6,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:52:14');
INSERT INTO `tb_log` VALUES (7,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:52:47');
INSERT INTO `tb_log` VALUES (8,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:53:04');
INSERT INTO `tb_log` VALUES (9,0,'admin','','125.69.102.34','Webinfo/in','更新网站配置成功','UPDATE `tb_webinfo`  SET `val`=\'\'  WHERE  `field` = \'fsd\'    ','2019-09-10 15:53:08');
INSERT INTO `tb_log` VALUES (10,0,'admin','','125.69.102.34','Email/inde','更新email成功','UPDATE `tb_email`  SET `host`=\'smtp.qq.com\',`port`=\'465\',`username`=\'19590850\',`password`=\'ykonwdiryydybgic\',`subject`=\'找回密码通知\',`from`=\'19590850@qq.com\',`fromname`=\'195908503\',`endtime`=\'2019-09-10 15:53:11\'  WHERE  (  `id`=\'1\' )          ','2019-09-10 15:53:11');
INSERT INTO `tb_log` VALUES (11,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:53:13');
INSERT INTO `tb_log` VALUES (12,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:55:16');
INSERT INTO `tb_log` VALUES (13,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:55:26');
INSERT INTO `tb_log` VALUES (14,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:55:41');
INSERT INTO `tb_log` VALUES (15,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:56:44');
INSERT INTO `tb_log` VALUES (16,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:56:46');
INSERT INTO `tb_log` VALUES (17,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:56:55');
INSERT INTO `tb_log` VALUES (18,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:57:10');
INSERT INTO `tb_log` VALUES (19,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:57:22');
INSERT INTO `tb_log` VALUES (20,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:57:23');
INSERT INTO `tb_log` VALUES (21,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:57:46');
INSERT INTO `tb_log` VALUES (22,0,'admin','','125.69.102.34','Sitemap/in','sitemap.xml生成成功','','2019-09-10 15:57:50');
INSERT INTO `tb_log` VALUES (23,0,'admin','','125.69.102.34','Sitemap/ht','sitemap.xml生成成功','','2019-09-10 15:57:50');
INSERT INTO `tb_log` VALUES (24,0,'admin','','125.69.102.34','Sitemap/tx','sitemap.xml生成成功','','2019-09-10 15:57:51');
INSERT INTO `tb_log` VALUES (25,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 15:57:53');
INSERT INTO `tb_log` VALUES (26,0,'admin','','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 15:58:13');
INSERT INTO `tb_log` VALUES (27,0,'admin','','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 15:58:16');
INSERT INTO `tb_log` VALUES (28,0,'admin','','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 15:58:18');
INSERT INTO `tb_log` VALUES (29,0,'admin','','125.69.102.34','Temp/add','上传文件成功：173340.jpg','','2019-09-10 16:01:43');
INSERT INTO `tb_log` VALUES (30,0,'admin','','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 16:01:43');
INSERT INTO `tb_log` VALUES (31,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:01:44');
INSERT INTO `tb_log` VALUES (32,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:01:49');
INSERT INTO `tb_log` VALUES (33,0,'admin','','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 16:01:52');
INSERT INTO `tb_log` VALUES (34,0,'admin','','125.69.102.34','Temp/index','文件管理列表/App/','','2019-09-10 16:02:04');
INSERT INTO `tb_log` VALUES (35,0,'admin','','125.69.102.34','Temp/add','上传文件错误：上传文件类型不允许','','2019-09-10 16:02:10');
INSERT INTO `tb_log` VALUES (36,0,'admin','','125.69.102.34','Temp/index','文件管理列表/App/','','2019-09-10 16:02:11');
INSERT INTO `tb_log` VALUES (37,0,'admin','','125.69.102.34','Temp/add','上传文件成功：logo.png','','2019-09-10 16:02:22');
INSERT INTO `tb_log` VALUES (38,0,'admin','','125.69.102.34','Temp/index','文件管理列表/App/','','2019-09-10 16:02:22');
INSERT INTO `tb_log` VALUES (39,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:02:25');
INSERT INTO `tb_log` VALUES (40,0,'admin','','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 16:03:05');
INSERT INTO `tb_log` VALUES (41,0,'admin','','125.69.102.34','Article/in','吨桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'8\' ) LIMIT 1  ','2019-09-10 16:03:07');
INSERT INTO `tb_log` VALUES (42,0,'admin','','125.69.102.34','Article/up','修改文档成功','UPDATE `tb_article`  SET `read_num`=4,`Recommend`=\'0,\',`fjid`=\',0,\',`istop`=0,`hpx`=NULL,`px`=NULL,`Title`=\'避光吨桶\',`Author`=\'cdjiaguan.com\',`KeyWords`=NULL,`videourl`=NULL,`Content`=\'<div style=\\\"text-align:center;\\\">\\r\\n	<img src=\\\"/public/uploads/image/20190902/20190902111837_89788.jpg\\\" alt=\\\"\\\" /><br />\\r\\n	<table width=\\\"80%\\\" height=\\\"100%\\\" border=\\\"0\\\" style=\\\"font-stretch:normal;font-size:12px;line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;color:#5A5A5A;border-spacing:0px;empty-cells:show;background-color:#FFFFFF;\\\" class=\\\"ke-zeroborder\\\">\\r\\n		<tbody>\\r\\n			<tr>\\r\\n				<td style=\\\"line-height:16.8px;font-family:Arial, 宋体, Helvetica, sans-serif, Verdana;border-collapse:collapse;\\\">\\r\\n					<blockquote style=\\\"margin:0px 0px 0px 40px;border:none;padding:0px;\\\">\\r\\n						<p style=\\\"margin-top:0px;margin-bottom:0px;padding:0px;\\\">\\r\\n							<span style=\\\"margin:0px;padding:0px;line-height:25.2px;font-size:18px;\\\">品 牌  : 佳 罐</span>\\r\\n						</p>\\r\\n						','2019-09-10 16:03:11');
INSERT INTO `tb_log` VALUES (43,0,'admin','','125.69.102.34','Article/in','吨桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'8\' ) LIMIT 1  ','2019-09-10 16:03:12');
INSERT INTO `tb_log` VALUES (44,0,'admin','','125.69.102.34','Article/ad','新增文档成功','INSERT INTO `tb_article` (`id` , `TypeID` , `read_num` , `Recommend` , `fjid` , `istop` , `hpx` , `px` , `Title` , `Author` , `KeyWords` , `videourl` , `Content` , `Content1` , `Content2` , `Content3` , `Content4` , `isVerify` , `CreateTime` , `Creator` , `S_Image` , `B_Image` , `seotitle` , `seokeywords` , `seodescription` , `s2` , `d1` , `d2` , `d3` , `d4` , `d5` , `d6` , `endtime` , `endtime1`) VALUES (0 , 8 , 0 , \'0,\' , \',0,\' , 0 , NULL , NULL , \'234\' , \'shop.gemut.cn\' , NULL , NULL , \'234234\' , NULL , NULL , NULL , NULL , 1 , \'2019-09-10 16:03:18\' , NULL , \'234234\' , NULL , \'\' , \'\' , \'\' , \'\' , NULL , NULL , NULL , NULL , NULL , NULL , 1568102595 , \'2019-09-10 16:03:18\')                   ','2019-09-10 16:03:18');
INSERT INTO `tb_log` VALUES (45,0,'admin','','125.69.102.34','Article/in','吨桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'8\' ) LIMIT 1  ','2019-09-10 16:03:19');
INSERT INTO `tb_log` VALUES (46,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:03:22');
INSERT INTO `tb_log` VALUES (47,0,'admin','','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 16:03:42');
INSERT INTO `tb_log` VALUES (48,0,'admin','','125.69.102.34','Lm/add','新增栏目成功','UPDATE `tb_lm`  SET `idpath`=\',1,18,\',`Depth`=\'2\'  WHERE  (  `id`=\'18\' )    ','2019-09-10 16:03:52');
INSERT INTO `tb_log` VALUES (49,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:03:54');
INSERT INTO `tb_log` VALUES (50,0,'admin','','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 16:05:50');
INSERT INTO `tb_log` VALUES (51,0,'admin','','125.69.102.34','Lm/updata','测试测试/修改栏目成功','UPDATE `tb_lm`  SET `idpath`=\',1,18,\',`parentID_top`=\'1\',`Depth`=\'2\'  WHERE  (  `id`=\'18\' )     ','2019-09-10 16:05:54');
INSERT INTO `tb_log` VALUES (52,0,'admin','','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 16:05:55');
INSERT INTO `tb_log` VALUES (53,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:05:55');
INSERT INTO `tb_log` VALUES (54,0,'admin','','125.69.102.34','User/xgmm','admin修改登录密码成功','UPDATE `tb_user`  SET `UserName`=\'admin\',`RealName`=\'网站管理\',`PassWord`=\'7fef6171469e80d32c0559f88b377245\',`isVerify`=1,`endtime`=\'2019-09-10 16:06:13\'  WHERE  (  `id`=\'1\' )       ','2019-09-10 16:06:13');
INSERT INTO `tb_log` VALUES (55,0,'admin','','125.69.102.34','User/index','获取管理员列表','SELECT * FROM `tb_user` WHERE  (  `id`>\'0\' and `UserName`<>\'admin\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 16:06:14');
INSERT INTO `tb_log` VALUES (56,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:06:16');
INSERT INTO `tb_log` VALUES (57,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:26:17');
INSERT INTO `tb_log` VALUES (58,0,'admin','','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 16:26:22');
INSERT INTO `tb_log` VALUES (59,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:26:25');
INSERT INTO `tb_log` VALUES (60,0,'admin','','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 16:27:10');
INSERT INTO `tb_log` VALUES (61,0,'admin','','125.69.102.34','Lm/updata','测试测试/修改栏目成功','UPDATE `tb_lm`  SET `idpath`=\',1,18,\',`parentID_top`=\'1\',`Depth`=\'2\'  WHERE  (  `id`=\'18\' )     ','2019-09-10 16:27:15');
INSERT INTO `tb_log` VALUES (62,0,'admin','','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 16:27:16');
INSERT INTO `tb_log` VALUES (63,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:27:16');
INSERT INTO `tb_log` VALUES (64,0,'admin','','125.69.102.34','Links/inde','获取链接列表','SELECT * FROM `tb_links` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 16:28:08');
INSERT INTO `tb_log` VALUES (65,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:28:10');
INSERT INTO `tb_log` VALUES (66,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  and (`UserName` like \'%修改%\' || `endtime` like \'%修改%\' || `model` like \'%修改%\' || `content` like \'%修改%\' || `ip` like \'%修改%\' ) ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:28:21');
INSERT INTO `tb_log` VALUES (67,0,'admin','','125.69.102.34','Ad/index','获取ad列表','SELECT * FROM `tb_ad` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 16:28:31');
INSERT INTO `tb_log` VALUES (68,0,'admin','','125.69.102.34','Del/del','ad/52/删除成功','DELETE FROM `tb_ad`    WHERE  (  `id`=\'52\' )  ','2019-09-10 16:28:34');
INSERT INTO `tb_log` VALUES (69,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:28:37');
INSERT INTO `tb_log` VALUES (70,0,'admin','','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 16:32:38');
INSERT INTO `tb_log` VALUES (71,0,'admin','','125.69.102.34','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 16:32:39');
INSERT INTO `tb_log` VALUES (72,0,'admin','','125.69.102.34','Article/in','吨桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'8\' ) LIMIT 1  ','2019-09-10 16:32:41');
INSERT INTO `tb_log` VALUES (73,0,'admin','','125.69.102.34','article','批量操作成功/：选中文档-已取消审核.article','UPDATE `tb_article`  SET `isVerify`=0  WHERE  (  id in(68,11,2) )   ','2019-09-10 16:32:43');
INSERT INTO `tb_log` VALUES (74,0,'admin','','125.69.102.34','Article/in','吨桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'8\' ) LIMIT 1  ','2019-09-10 16:32:43');
INSERT INTO `tb_log` VALUES (75,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:32:46');
INSERT INTO `tb_log` VALUES (76,0,'admin','','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 16:32:55');
INSERT INTO `tb_log` VALUES (77,0,'admin','','125.69.102.34','article','批量操作成功/：选中文档-已审核.article','UPDATE `tb_article`  SET `isVerify`=1  WHERE  (  id in(68,67,65,64,63,62,61,59,58,57,56,55,54,53,52,51,50,49,48,47) )   ','2019-09-10 16:32:59');
INSERT INTO `tb_log` VALUES (78,0,'admin','','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 16:32:59');
INSERT INTO `tb_log` VALUES (79,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:33:02');
INSERT INTO `tb_log` VALUES (80,0,NULL,'1970-01-01 08:00:00','125.69.102.34',NULL,'注销成功：','','2019-09-10 16:33:58');
INSERT INTO `tb_log` VALUES (81,0,'admin','','125.69.102.34','user/login','admin登录成功','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-10 16:34:04');
INSERT INTO `tb_log` VALUES (82,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:34:08');
INSERT INTO `tb_log` VALUES (83,0,NULL,'1970-01-01 08:00:00','125.69.102.34','Login/logo','注销成功','','2019-09-10 16:34:33');
INSERT INTO `tb_log` VALUES (84,0,'admin','','125.69.102.34','user/login','admin登录成功','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-10 16:34:43');
INSERT INTO `tb_log` VALUES (85,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:34:46');
INSERT INTO `tb_log` VALUES (86,0,NULL,'1970-01-01 08:00:00','125.69.102.34','Login/logo','注销成功','','2019-09-10 16:35:08');
INSERT INTO `tb_log` VALUES (87,0,'admin','','125.69.102.34','user/login','admin登录成功','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-10 16:35:14');
INSERT INTO `tb_log` VALUES (88,0,'admin','','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:35:19');
INSERT INTO `tb_log` VALUES (89,0,'admin','','125.69.102.34','User/index','获取管理员列表','SELECT * FROM `tb_user` WHERE  (  `id`>\'0\' and `UserName`<>\'admin\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 16:35:43');
INSERT INTO `tb_log` VALUES (90,0,NULL,'1970-01-01 08:00:00','125.69.102.34','Login/logo','注销成功','','2019-09-10 16:37:26');
INSERT INTO `tb_log` VALUES (91,0,'anddisme','','125.69.102.34','user/login','anddisme登录成功','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'anddisme\' ) LIMIT 1  ','2019-09-10 16:39:04');
INSERT INTO `tb_log` VALUES (92,0,'anddisme','','125.69.102.34','User/index','获取管理员列表','SELECT * FROM `tb_user` WHERE  (  `id`>\'0\' and `UserName`<>\'admin\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 16:39:08');
INSERT INTO `tb_log` VALUES (93,0,'anddisme','','125.69.102.34','User/updat','修改管理员成功','UPDATE `tb_user`  SET `UserName`=\'anddisme\',`RealName`=\'anddisme\',`isVerify`=0,`UserType`=\'admin,1,2,8,3,6,7\',`endtime`=\'2019-09-10 16:39:16\'  WHERE  (  `id`=\'5\' )       ','2019-09-10 16:39:16');
INSERT INTO `tb_log` VALUES (94,0,'anddisme','','125.69.102.34','User/index','获取管理员列表','SELECT * FROM `tb_user` WHERE  (  `id`>\'0\' and `UserName`<>\'admin\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 16:39:17');
INSERT INTO `tb_log` VALUES (95,0,NULL,'1970-01-01 08:00:00','125.69.102.34','Login/logo','注销成功','','2019-09-10 16:39:21');
INSERT INTO `tb_log` VALUES (96,0,'anddisme','','125.69.102.34','user/login','anddisme登录成功','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'anddisme\' ) LIMIT 1  ','2019-09-10 16:39:25');
INSERT INTO `tb_log` VALUES (97,0,'anddisme','','125.69.102.34','User/index','获取管理员列表','SELECT * FROM `tb_user` WHERE  (  `id`>\'0\' and `UserName`<>\'admin\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 16:39:28');
INSERT INTO `tb_log` VALUES (98,0,'anddisme','','125.69.102.34','user/login','anddisme登录成功','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'anddisme\' ) LIMIT 1  ','2019-09-10 16:42:22');
INSERT INTO `tb_log` VALUES (99,0,'anddisme','','125.69.102.34','user/login','anddisme账号未启用','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'anddisme\' ) LIMIT 1  ','2019-09-10 16:43:27');
INSERT INTO `tb_log` VALUES (100,0,'anddisme','','125.69.102.34','user/login','anddisme账号未启用','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'anddisme\' ) LIMIT 1  ','2019-09-10 16:44:47');
INSERT INTO `tb_log` VALUES (101,0,'anddisme','','125.69.102.34','user/login','anddisme登录密码错误','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'anddisme\' ) LIMIT 1  ','2019-09-10 16:44:55');
INSERT INTO `tb_log` VALUES (102,0,'anddisme','','125.69.102.34','user/login','admin登录密码错误','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-10 16:45:57');
INSERT INTO `tb_log` VALUES (103,0,'admin','','125.69.102.34','user/login','admin登录成功','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-10 16:46:06');
INSERT INTO `tb_log` VALUES (104,0,NULL,'1970-01-01 08:00:00','125.69.102.34','Login/logo','注销成功','','2019-09-10 16:46:50');
INSERT INTO `tb_log` VALUES (105,0,'admin','','125.69.102.34','user/login','admin登录成功','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-10 16:46:57');
INSERT INTO `tb_log` VALUES (106,0,NULL,'1970-01-01 08:00:00','125.69.102.34','Login/logo','注销成功','','2019-09-10 16:47:13');
INSERT INTO `tb_log` VALUES (107,0,'admin','','125.69.102.34','user/login','admin登录成功','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-10 16:47:22');
INSERT INTO `tb_log` VALUES (108,0,NULL,'1970-01-01 08:00:00','125.69.102.34','Login/logo','注销成功','','2019-09-10 16:51:57');
INSERT INTO `tb_log` VALUES (109,0,'admin','','125.69.102.34','user/login','admin登录成功','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-10 16:52:02');
INSERT INTO `tb_log` VALUES (110,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','工程设备文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'3\' ) LIMIT 1  ','2019-09-10 16:52:43');
INSERT INTO `tb_log` VALUES (111,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 16:52:44');
INSERT INTO `tb_log` VALUES (112,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:52:46');
INSERT INTO `tb_log` VALUES (113,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:53:39');
INSERT INTO `tb_log` VALUES (114,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:54:27');
INSERT INTO `tb_log` VALUES (115,0,'admin','2019-09-10 16:52:02','125.69.102.34','Web/index','更新系统配置成功','UPDATE `tb_web`  SET `Web_Name`=\'成都佳罐塑料制品有限公司\',`Addess`=\'/public/uploads/image/20190902/20190902103622_40272.png\',`taobaourl`=\'/public/uploads/image/20190827/20190827170403_34772.jpg\',`cache`=\'0\',`Locked`=\'0\',`Title`=\'#1\',`t3`=\'##1\',`SeoTitle`=\'###1\',`Description`=\'####1\',`ips`=\'125.69.102.34\',`enduptime`=\'2019-09-10 16:54:35\'  WHERE  (  `id`=\'1\' )             ','2019-09-10 16:54:35');
INSERT INTO `tb_log` VALUES (116,0,'admin','2019-09-10 16:52:02','125.69.102.34','Web/delcac','更新系统缓存','','2019-09-10 16:55:00');
INSERT INTO `tb_log` VALUES (117,0,'admin','2019-09-10 16:52:02','125.69.102.34','Web/delcac','更新系统缓存','','2019-09-10 16:55:01');
INSERT INTO `tb_log` VALUES (118,0,'admin','2019-09-10 16:52:02','125.69.102.34','Web/delcac','更新系统缓存','','2019-09-10 16:55:03');
INSERT INTO `tb_log` VALUES (119,0,'admin','2019-09-10 16:52:02','125.69.102.34','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 16:58:44');
INSERT INTO `tb_log` VALUES (120,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 16:58:58');
INSERT INTO `tb_log` VALUES (121,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 16:59:20');
INSERT INTO `tb_log` VALUES (122,0,'admin','2019-09-10 16:52:02','125.69.102.34','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 16:59:32');
INSERT INTO `tb_log` VALUES (123,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:00:14');
INSERT INTO `tb_log` VALUES (124,0,'admin','2019-09-10 16:52:02','125.69.102.34','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:00:21');
INSERT INTO `tb_log` VALUES (125,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 17:00:22');
INSERT INTO `tb_log` VALUES (126,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 17:00:23');
INSERT INTO `tb_log` VALUES (127,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 17:00:23');
INSERT INTO `tb_log` VALUES (128,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','测试测试文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'18\' ) LIMIT 1  ','2019-09-10 17:00:24');
INSERT INTO `tb_log` VALUES (129,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:00:25');
INSERT INTO `tb_log` VALUES (130,0,'admin','2019-09-10 16:52:02','125.69.102.34','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:00:40');
INSERT INTO `tb_log` VALUES (131,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 17:01:13');
INSERT INTO `tb_log` VALUES (132,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:01:50');
INSERT INTO `tb_log` VALUES (133,0,'admin','2019-09-10 16:52:02','125.69.102.34','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:01:51');
INSERT INTO `tb_log` VALUES (134,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 17:01:54');
INSERT INTO `tb_log` VALUES (135,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 17:01:55');
INSERT INTO `tb_log` VALUES (136,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','测试测试文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'18\' ) LIMIT 1  ','2019-09-10 17:01:56');
INSERT INTO `tb_log` VALUES (137,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:01:59');
INSERT INTO `tb_log` VALUES (138,0,'admin','2019-09-10 16:52:02','125.69.102.34','User/index','获取管理员列表','SELECT * FROM `tb_user` WHERE  (  `id`>\'0\' and `UserName`<>\'admin\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:02:20');
INSERT INTO `tb_log` VALUES (139,0,'admin','2019-09-10 16:52:02','125.69.102.34','Member/ind','获取会员列表','SELECT * FROM `tb_member` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:02:20');
INSERT INTO `tb_log` VALUES (140,0,'admin','2019-09-10 16:52:02','125.69.102.34','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:02:21');
INSERT INTO `tb_log` VALUES (141,0,'admin','2019-09-10 16:52:02','125.69.102.34','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:02:22');
INSERT INTO `tb_log` VALUES (142,0,'admin','2019-09-10 16:52:02','125.69.102.34','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:02:28');
INSERT INTO `tb_log` VALUES (143,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:02:32');
INSERT INTO `tb_log` VALUES (144,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:02:35');
INSERT INTO `tb_log` VALUES (145,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 17:02:37');
INSERT INTO `tb_log` VALUES (146,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 17:02:39');
INSERT INTO `tb_log` VALUES (147,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','测试测试文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'18\' ) LIMIT 1  ','2019-09-10 17:02:40');
INSERT INTO `tb_log` VALUES (148,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:02:41');
INSERT INTO `tb_log` VALUES (149,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:02:49');
INSERT INTO `tb_log` VALUES (150,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:04:19');
INSERT INTO `tb_log` VALUES (151,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:04:29');
INSERT INTO `tb_log` VALUES (152,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:04:33');
INSERT INTO `tb_log` VALUES (153,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:05:34');
INSERT INTO `tb_log` VALUES (154,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','工程设备文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'3\' ) LIMIT 1  ','2019-09-10 17:05:38');
INSERT INTO `tb_log` VALUES (155,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:05:46');
INSERT INTO `tb_log` VALUES (156,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:06:32');
INSERT INTO `tb_log` VALUES (157,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 17:06:36');
INSERT INTO `tb_log` VALUES (158,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 17:06:37');
INSERT INTO `tb_log` VALUES (159,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 17:06:39');
INSERT INTO `tb_log` VALUES (160,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 17:07:30');
INSERT INTO `tb_log` VALUES (161,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','工程设备文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'3\' ) LIMIT 1  ','2019-09-10 17:07:33');
INSERT INTO `tb_log` VALUES (162,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 17:07:36');
INSERT INTO `tb_log` VALUES (163,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','荣誉资质文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'6\' ) LIMIT 1  ','2019-09-10 17:07:45');
INSERT INTO `tb_log` VALUES (164,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:08:04');
INSERT INTO `tb_log` VALUES (165,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','技术文章文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'5\' ) LIMIT 1  ','2019-09-10 17:08:10');
INSERT INTO `tb_log` VALUES (166,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','新闻资讯文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'4\' ) LIMIT 1  ','2019-09-10 17:08:10');
INSERT INTO `tb_log` VALUES (167,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/up','修改文档成功','UPDATE `tb_article`  SET `read_num`=7,`Recommend`=\'0,\',`fjid`=\',0,\',`istop`=0,`hpx`=NULL,`px`=NULL,`Title`=\'选择品质优良的化工桶分几步\',`Author`=\'cdjiaguan.com\',`KeyWords`=NULL,`videourl`=NULL,`Content`=\'<p style=\\\"text-indent:2em;\\\">\\r\\n	<span style=\\\"font-size:14px;\\\">化工桶作为一种特殊产品，对于其本身的品质要求是比较大的。所以，要保证选到品质优良的化工桶主要还是要分以下几个步骤：<br />\\r\\n	<div style=\\\"text-align:center;\\\">\\r\\n		<span style=\\\"text-indent:2em;\\\"></span><span style=\\\"text-indent:2em;\\\"><img src=\\\"/public/uploads/image/20190830/20190830172846_58449.jpg\\\" alt=\\\"\\\" /></span>\\r\\n	</div>\\r\\n</span>\\r\\n</p>\\r\\n<p style=\\\"text-indent:2em;\\\">\\r\\n	<span style=\\\"font-size:14px;\\\">一个非常大的品牌，我们也要对它们做一定的分析，而且从这专门的产品入手，让我们一出来充分如何分辨化工桶是不是合适我们购买，是否会带来不少好处。先则是需要分析品质，需要对其质量足够的分析，根据不一样的费用适合什么情形，对化工桶进行寻找。分析市场里的平均价格，不一样的厂家在价钱上拥有的差别是巨大的，因此购买前要先对市场里厂家的平均价格进行分析。</span><span lang=\\\"EN-US\\\"><o:p></o:p></span>\\r\\n</p>\\r\\n<p style=\\\"text-indent:2em;\\\">\\r\\n	<span style=\\\"font-size:14px;\\\">其次则是需要挑选合适的供应商，挑选家好的供应商不仅能作出相当合适的价钱，并且还能够保证产品的品质。快速掌握相关资讯，在某些的时候厂家会进行一些促销活动，假如','2019-09-10 17:08:13');
INSERT INTO `tb_log` VALUES (168,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','公司新闻文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'14\' ) LIMIT 1  ','2019-09-10 17:08:14');
INSERT INTO `tb_log` VALUES (169,0,'admin','2019-09-10 16:52:02','125.69.102.34','article','批量操作失败/：批量处理失败.article','UPDATE `tb_article`  SET `isVerify`=1  WHERE  (  id in(8,7,6,5) )   ','2019-09-10 17:08:17');
INSERT INTO `tb_log` VALUES (170,0,'admin','2019-09-10 16:52:02','125.69.102.34','article','批量操作成功/：选中文档-已取消审核.article','UPDATE `tb_article`  SET `isVerify`=0  WHERE  (  id in(8,7,6,5) )   ','2019-09-10 17:08:19');
INSERT INTO `tb_log` VALUES (171,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','公司新闻文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'14\' ) LIMIT 1  ','2019-09-10 17:08:19');
INSERT INTO `tb_log` VALUES (172,0,'admin','2019-09-10 16:52:02','125.69.102.34','article','批量操作成功/：选中文档-已审核.article','UPDATE `tb_article`  SET `isVerify`=1  WHERE  (  id in(8,7,6,5) )   ','2019-09-10 17:08:21');
INSERT INTO `tb_log` VALUES (173,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','公司新闻文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'14\' ) LIMIT 1  ','2019-09-10 17:08:21');
INSERT INTO `tb_log` VALUES (174,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:08:25');
INSERT INTO `tb_log` VALUES (175,0,'admin','2019-09-10 16:52:02','125.69.102.34','Links/inde','获取链接列表','SELECT * FROM `tb_links` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:08:37');
INSERT INTO `tb_log` VALUES (176,0,'admin','2019-09-10 16:52:02','125.69.102.34','Del/del','links/51/删除成功','DELETE FROM `tb_links`    WHERE  (  `id`=\'51\' )  ','2019-09-10 17:08:39');
INSERT INTO `tb_log` VALUES (177,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:08:43');
INSERT INTO `tb_log` VALUES (178,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:15:53');
INSERT INTO `tb_log` VALUES (179,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:15:56');
INSERT INTO `tb_log` VALUES (180,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','吨桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'8\' ) LIMIT 1  ','2019-09-10 17:16:21');
INSERT INTO `tb_log` VALUES (181,1,'admin','2019-09-10 16:52:02','125.69.102.34','Article/yi','批量移动成功68,11->14','UPDATE `tb_article`  SET `TypeID`=14  WHERE  (  id in(68,11) )   ','2019-09-10 17:16:30');
INSERT INTO `tb_log` VALUES (182,1,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','吨桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'8\' ) LIMIT 1  ','2019-09-10 17:16:30');
INSERT INTO `tb_log` VALUES (183,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:16:33');
INSERT INTO `tb_log` VALUES (184,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:16:34');
INSERT INTO `tb_log` VALUES (185,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:17:45');
INSERT INTO `tb_log` VALUES (186,1,'admin','2019-09-10 16:52:02','125.69.102.34','log','批量操作成功/：日志无法删除.log','SELECT * FROM `tb_webinfo` ORDER BY `id` asc ','2019-09-10 17:17:48');
INSERT INTO `tb_log` VALUES (187,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:18:09');
INSERT INTO `tb_log` VALUES (188,1,'admin','2019-09-10 16:52:02','125.69.102.34','log','批量操作成功/：选中日志-已删除.log','UPDATE `tb_log`  SET `is_del`=1  WHERE  (  id in(186,182) )   ','2019-09-10 17:18:13');
INSERT INTO `tb_log` VALUES (189,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:18:13');
INSERT INTO `tb_log` VALUES (190,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:18:24');
INSERT INTO `tb_log` VALUES (191,0,'admin','2019-09-10 16:52:02','125.69.102.34','log','批量操作成功/：选中日志-已删除.log','UPDATE `tb_log`  SET `is_del`=1  WHERE  (  id in(188) )   ','2019-09-10 17:18:26');
INSERT INTO `tb_log` VALUES (192,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:18:26');
INSERT INTO `tb_log` VALUES (193,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:18:41');
INSERT INTO `tb_log` VALUES (194,0,'admin','2019-09-10 16:52:02','125.69.102.34','log','批量操作成功/：选中日志-已删除.log','UPDATE `tb_log`  SET `is_del`=1  WHERE  (  id in(181) )   ','2019-09-10 17:18:44');
INSERT INTO `tb_log` VALUES (195,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:18:44');
INSERT INTO `tb_log` VALUES (196,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:18:48');
INSERT INTO `tb_log` VALUES (197,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 17:19:12');
INSERT INTO `tb_log` VALUES (198,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/yi','批量移动成功68,67,65,64->3','UPDATE `tb_article`  SET `TypeID`=3  WHERE  (  id in(68,67,65,64) )   ','2019-09-10 17:19:21');
INSERT INTO `tb_log` VALUES (199,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 17:19:21');
INSERT INTO `tb_log` VALUES (200,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:19:29');
INSERT INTO `tb_log` VALUES (201,0,'admin','2019-09-10 16:52:02','125.69.102.34','Links/inde','获取链接列表','SELECT * FROM `tb_links` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:19:54');
INSERT INTO `tb_log` VALUES (202,0,'admin','2019-09-10 16:52:02','125.69.102.34','Kf/index','获取客服列表','SELECT * FROM `tb_kf` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:19:55');
INSERT INTO `tb_log` VALUES (203,0,'admin','2019-09-10 16:52:02','125.69.102.34','Links/inde','获取链接列表','SELECT * FROM `tb_links` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:19:55');
INSERT INTO `tb_log` VALUES (204,0,'admin','2019-09-10 16:52:02','125.69.102.34','Kf/index','获取客服列表','SELECT * FROM `tb_kf` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:19:56');
INSERT INTO `tb_log` VALUES (205,0,'admin','2019-09-10 16:52:02','125.69.102.34','Ad/index','获取ad列表','SELECT * FROM `tb_ad` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:19:56');
INSERT INTO `tb_log` VALUES (206,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 17:20:05');
INSERT INTO `tb_log` VALUES (207,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 17:20:06');
INSERT INTO `tb_log` VALUES (208,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 17:20:07');
INSERT INTO `tb_log` VALUES (209,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','测试测试文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'18\' ) LIMIT 1  ','2019-09-10 17:20:08');
INSERT INTO `tb_log` VALUES (210,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 17:20:08');
INSERT INTO `tb_log` VALUES (211,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','测试测试文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'18\' ) LIMIT 1  ','2019-09-10 17:20:09');
INSERT INTO `tb_log` VALUES (212,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 17:20:11');
INSERT INTO `tb_log` VALUES (213,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','工程设备文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'3\' ) LIMIT 1  ','2019-09-10 17:20:12');
INSERT INTO `tb_log` VALUES (214,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 17:20:13');
INSERT INTO `tb_log` VALUES (215,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','测试测试文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'18\' ) LIMIT 1  ','2019-09-10 17:20:14');
INSERT INTO `tb_log` VALUES (216,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 17:20:15');
INSERT INTO `tb_log` VALUES (217,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','新闻资讯文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'4\' ) LIMIT 1  ','2019-09-10 17:20:15');
INSERT INTO `tb_log` VALUES (218,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','工程设备文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'3\' ) LIMIT 1  ','2019-09-10 17:20:16');
INSERT INTO `tb_log` VALUES (219,0,NULL,NULL,'61.151.178.166','Article/yi','批量移动失败68,67,65,64->3','UPDATE `tb_article`  SET `TypeID`=3  WHERE  (  id in(68,67,65,64) )   ','2019-09-10 17:20:22');
INSERT INTO `tb_log` VALUES (220,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/up','修改文档成功','UPDATE `tb_article`  SET `read_num`=1,`Recommend`=\'0,\',`fjid`=\',0,\',`istop`=0,`hpx`=NULL,`px`=NULL,`Title`=\'塑料桶不适合盛装什么物质\',`Author`=\'cdjiaguan.com\',`KeyWords`=NULL,`videourl`=NULL,`Content`=\'<p style=\\\"text-indent:2em;\\\">\\r\\n	<span style=\\\"font-size:14px;\\\">塑料桶耐酸碱防腐蚀、强度高、耐性好，耐磨损、耐高温、施工寿命长。但是并不代表塑料桶就是万能产品了，因为并不适合盛装易燃易爆物。<br />\\r\\n	<div style=\\\"text-align:center;\\\">\\r\\n		<span style=\\\"text-indent:2em;\\\"></span><span style=\\\"text-indent:2em;\\\"><img src=\\\"/public/uploads/image/20190903/20190903175934_53428.jpg\\\" alt=\\\"\\\" /></span>\\r\\n	</div>\\r\\n</span>\\r\\n</p>\\r\\n<p style=\\\"text-indent:2em;\\\">\\r\\n	<span style=\\\"font-size:14px;\\\">塑料桶装置外盖需外力紧固，密封圈装置后必须与桶口触摸平面紧贴，阻止密封圈歪曲装置。在选用塑料桶进行包装运送的时分，必定要注意塑料桶自身能够承载的重量不能超过自身容积的</span><span lang=\\\"EN-US\\\" style=\\\"font-size:14px;\\\">45%</span><span style=\\\"font-size:14px;\\\">，否则会呈现变形的现象。</span><span lang=\\\"EN-US\\\"><o:p></o:p></span>\\r\\n</p>\\r\\n<p style=\\\"text-indent:2em;\\\">\\r\\n	<span style=\\\"font-size:14px;\\\">一般塑料桶在与外界触摸冲突，尤其是可移动塑料桶厂家在搬运过程中，在外外表积累静电荷，在静电积累到必定的程','2019-09-10 17:20:25');
INSERT INTO `tb_log` VALUES (221,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','工程设备文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'3\' ) LIMIT 1  ','2019-09-10 17:20:26');
INSERT INTO `tb_log` VALUES (222,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:20:27');
INSERT INTO `tb_log` VALUES (223,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:21:33');
INSERT INTO `tb_log` VALUES (224,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','工程设备文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'3\' ) LIMIT 1  ','2019-09-10 17:21:34');
INSERT INTO `tb_log` VALUES (225,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/up','修改文档成功/id=68','UPDATE `tb_article`  SET `read_num`=0,`Recommend`=\'0,\',`fjid`=\',0,\',`istop`=0,`hpx`=NULL,`px`=NULL,`Title`=\'234\',`Author`=\'shop.gemut.cn\',`KeyWords`=NULL,`videourl`=NULL,`Content`=\'234234\',`Content1`=NULL,`Content2`=NULL,`Content3`=NULL,`Content4`=NULL,`isVerify`=1,`CreateTime`=\'2019-09-10 17:21:37\',`Creator`=NULL,`S_Image`=\'234234\',`B_Image`=NULL,`seotitle`=\'\',`seokeywords`=\'\',`seodescription`=\'\',`s2`=\'\',`d1`=NULL,`d2`=NULL,`d3`=NULL,`d4`=NULL,`d5`=NULL,`d6`=NULL,`endtime`=1568102595,`endtime1`=\'2019-09-10 17:21:37\'  WHERE  `id` = 68                   ','2019-09-10 17:21:37');
INSERT INTO `tb_log` VALUES (226,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','工程设备文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'3\' ) LIMIT 1  ','2019-09-10 17:21:39');
INSERT INTO `tb_log` VALUES (227,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:21:40');
INSERT INTO `tb_log` VALUES (228,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:22:23');
INSERT INTO `tb_log` VALUES (229,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 17:22:55');
INSERT INTO `tb_log` VALUES (230,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','测试测试文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'18\' ) LIMIT 1  ','2019-09-10 17:22:56');
INSERT INTO `tb_log` VALUES (231,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 17:22:58');
INSERT INTO `tb_log` VALUES (232,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/yi','批量移动成功63,62->7','UPDATE `tb_article`  SET `TypeID`=7  WHERE  (  id in(63,62) )   ','2019-09-10 17:23:10');
INSERT INTO `tb_log` VALUES (233,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 17:23:10');
INSERT INTO `tb_log` VALUES (234,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 17:23:23');
INSERT INTO `tb_log` VALUES (235,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:23:33');
INSERT INTO `tb_log` VALUES (236,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:23:51');
INSERT INTO `tb_log` VALUES (237,0,'admin','2019-09-10 16:52:02','125.69.102.34','Ad/index','获取ad列表','SELECT * FROM `tb_ad` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 17:23:59');
INSERT INTO `tb_log` VALUES (238,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:24:04');
INSERT INTO `tb_log` VALUES (239,0,'admin','2019-09-10 16:52:02','125.69.102.34','Web/index','更新系统配置成功','UPDATE `tb_web`  SET `Web_Name`=\'成都佳罐塑料制品有限公司\',`Addess`=\'/public/uploads/image/20190902/20190902103622_40272.png\',`taobaourl`=\'/public/uploads/image/20190827/20190827170403_34772.jpg\',`cache`=\'0\',`Locked`=\'0\',`Title`=\'#1\',`t3`=\'##100000\',`SeoTitle`=\'###1\',`Description`=\'####1\',`ips`=\'125.69.102.34\',`enduptime`=\'2019-09-10 17:24:27\'  WHERE  (  `id`=\'1\' )             ','2019-09-10 17:24:27');
INSERT INTO `tb_log` VALUES (240,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 17:24:30');
INSERT INTO `tb_log` VALUES (241,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 150,30  ','2019-09-10 17:24:47');
INSERT INTO `tb_log` VALUES (242,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,200  ','2019-09-10 17:24:52');
INSERT INTO `tb_log` VALUES (243,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,1  ','2019-09-10 17:24:57');
INSERT INTO `tb_log` VALUES (244,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 17:25:00');
INSERT INTO `tb_log` VALUES (245,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 17:25:28');
INSERT INTO `tb_log` VALUES (246,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/add','上传文件成功：173340.jpg','','2019-09-10 17:25:34');
INSERT INTO `tb_log` VALUES (247,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 17:25:34');
INSERT INTO `tb_log` VALUES (248,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 17:25:37');
INSERT INTO `tb_log` VALUES (249,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 17:25:46');
INSERT INTO `tb_log` VALUES (250,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/App/','','2019-09-10 17:25:47');
INSERT INTO `tb_log` VALUES (251,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/App/index/','','2019-09-10 17:25:47');
INSERT INTO `tb_log` VALUES (252,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 17:25:49');
INSERT INTO `tb_log` VALUES (253,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  and (`UserName` like \'%列表/App%\' || `endtime` like \'%列表/App%\' || `model` like \'%列表/App%\' || `content` like \'%列表/App%\' || `ip` like \'%列表/App%\' ) ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 17:25:58');
INSERT INTO `tb_log` VALUES (254,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  and (`UserName` like \'%adm%\' || `endtime` like \'%adm%\' || `model` like \'%adm%\' || `content` like \'%adm%\' || `ip` like \'%adm%\' ) ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 17:26:05');
INSERT INTO `tb_log` VALUES (255,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  and (`UserName` like \'%69.102%\' || `endtime` like \'%69.102%\' || `model` like \'%69.102%\' || `content` like \'%69.102%\' || `ip` like \'%69.102%\' ) ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 17:26:10');
INSERT INTO `tb_log` VALUES (256,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  and (`UserName` like \'%批量移动%\' || `endtime` like \'%批量移动%\' || `model` like \'%批量移动%\' || `content` like \'%批量移动%\' || `ip` like \'%批量移动%\' ) ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 17:26:18');
INSERT INTO `tb_log` VALUES (257,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  and (`UserName` like \'%68%\' || `endtime` like \'%68%\' || `model` like \'%68%\' || `content` like \'%68%\' || `ip` like \'%68%\' ) ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 17:26:31');
INSERT INTO `tb_log` VALUES (258,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 17:26:41');
INSERT INTO `tb_log` VALUES (259,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 17:26:43');
INSERT INTO `tb_log` VALUES (260,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 17:26:44');
INSERT INTO `tb_log` VALUES (261,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 17:26:45');
INSERT INTO `tb_log` VALUES (262,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 17:26:45');
INSERT INTO `tb_log` VALUES (263,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 17:28:57');
INSERT INTO `tb_log` VALUES (264,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 17:29:34');
INSERT INTO `tb_log` VALUES (265,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 17:29:36');
INSERT INTO `tb_log` VALUES (266,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 17:29:45');
INSERT INTO `tb_log` VALUES (267,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/phpMyAdmin/','','2019-09-10 17:29:57');
INSERT INTO `tb_log` VALUES (268,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 17:29:59');
INSERT INTO `tb_log` VALUES (269,0,'admin','2019-09-10 16:52:02','125.69.102.34','Temp/index','文件管理列表/','','2019-09-10 17:30:01');
INSERT INTO `tb_log` VALUES (270,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/ad','查看回收站','','2019-09-10 17:30:02');
INSERT INTO `tb_log` VALUES (271,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/ad','查看回收站','','2019-09-10 17:32:26');
INSERT INTO `tb_log` VALUES (272,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/ad','查看回收站','','2019-09-10 17:32:32');
INSERT INTO `tb_log` VALUES (273,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/ad','查看回收站','','2019-09-10 17:33:25');
INSERT INTO `tb_log` VALUES (274,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:33:30');
INSERT INTO `tb_log` VALUES (275,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:34:37');
INSERT INTO `tb_log` VALUES (276,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:34:53');
INSERT INTO `tb_log` VALUES (277,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:35:33');
INSERT INTO `tb_log` VALUES (278,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:35:35');
INSERT INTO `tb_log` VALUES (279,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:35:37');
INSERT INTO `tb_log` VALUES (280,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:35:38');
INSERT INTO `tb_log` VALUES (281,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:35:40');
INSERT INTO `tb_log` VALUES (282,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:36:11');
INSERT INTO `tb_log` VALUES (283,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:36:39');
INSERT INTO `tb_log` VALUES (284,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:37:02');
INSERT INTO `tb_log` VALUES (285,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:38:08');
INSERT INTO `tb_log` VALUES (286,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/add','234234/新增栏目成功','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,\',`Depth`=\'3\'  WHERE  (  `id`=\'19\' )    ','2019-09-10 17:38:15');
INSERT INTO `tb_log` VALUES (287,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:38:18');
INSERT INTO `tb_log` VALUES (288,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:38:40');
INSERT INTO `tb_log` VALUES (289,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:47:36');
INSERT INTO `tb_log` VALUES (290,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/add','456456456/新增栏目成功','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,\',`Depth`=\'4\'  WHERE  (  `id`=\'20\' )    ','2019-09-10 17:47:44');
INSERT INTO `tb_log` VALUES (291,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 17:47:48');
INSERT INTO `tb_log` VALUES (292,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:47:49');
INSERT INTO `tb_log` VALUES (293,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/add','111111/新增栏目成功','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,21,\',`Depth`=\'5\'  WHERE  (  `id`=\'21\' )    ','2019-09-10 17:48:04');
INSERT INTO `tb_log` VALUES (294,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:48:05');
INSERT INTO `tb_log` VALUES (295,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/add','111111/新增栏目成功','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,21,22,\',`Depth`=\'6\'  WHERE  (  `id`=\'22\' )    ','2019-09-10 17:48:10');
INSERT INTO `tb_log` VALUES (296,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:48:11');
INSERT INTO `tb_log` VALUES (297,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/add','11112/新增栏目成功','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,21,22,23,\',`Depth`=\'7\'  WHERE  (  `id`=\'23\' )    ','2019-09-10 17:48:15');
INSERT INTO `tb_log` VALUES (298,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:48:17');
INSERT INTO `tb_log` VALUES (299,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:49:15');
INSERT INTO `tb_log` VALUES (300,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:49:48');
INSERT INTO `tb_log` VALUES (301,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 17:50:49');
INSERT INTO `tb_log` VALUES (302,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:50:59');
INSERT INTO `tb_log` VALUES (303,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:58:19');
INSERT INTO `tb_log` VALUES (304,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:58:26');
INSERT INTO `tb_log` VALUES (305,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:58:26');
INSERT INTO `tb_log` VALUES (306,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:58:44');
INSERT INTO `tb_log` VALUES (307,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:58:50');
INSERT INTO `tb_log` VALUES (308,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:58:53');
INSERT INTO `tb_log` VALUES (309,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:59:02');
INSERT INTO `tb_log` VALUES (310,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:59:03');
INSERT INTO `tb_log` VALUES (311,0,'admin','2019-09-10 16:52:02','125.69.102.34','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 17:59:50');
INSERT INTO `tb_log` VALUES (312,0,'admin','2019-09-10 16:52:02','125.69.102.34','Web/delcac','更新系统缓存','','2019-09-10 17:59:53');
INSERT INTO `tb_log` VALUES (313,0,'admin','2019-09-10 16:52:02','125.69.102.34','Web/delcac','更新系统缓存','','2019-09-10 17:59:55');
INSERT INTO `tb_log` VALUES (314,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 17:59:58');
INSERT INTO `tb_log` VALUES (315,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 18:01:22');
INSERT INTO `tb_log` VALUES (316,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 18:01:26');
INSERT INTO `tb_log` VALUES (317,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,15  ','2019-09-10 18:01:26');
INSERT INTO `tb_log` VALUES (318,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,50  ','2019-09-10 18:01:29');
INSERT INTO `tb_log` VALUES (319,0,'admin','2019-09-10 16:52:02','125.69.102.34','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,50  ','2019-09-10 18:01:33');
INSERT INTO `tb_log` VALUES (320,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 18:01:41');
INSERT INTO `tb_log` VALUES (321,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','测试测试文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'18\' ) LIMIT 1  ','2019-09-10 18:01:42');
INSERT INTO `tb_log` VALUES (322,0,'admin','2019-09-10 16:52:02','125.69.102.34','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 18:01:44');
INSERT INTO `tb_log` VALUES (323,0,NULL,NULL,'117.172.26.64','user/login','admin登录密码错误','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-10 20:21:21');
INSERT INTO `tb_log` VALUES (324,0,NULL,NULL,'117.172.26.64','user/login','admin登录密码错误','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-10 20:21:32');
INSERT INTO `tb_log` VALUES (325,0,'admin','2019-09-10 20:21:44','117.172.26.64','user/login','admin登录成功','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-10 20:21:44');
INSERT INTO `tb_log` VALUES (326,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,50  ','2019-09-10 20:21:48');
INSERT INTO `tb_log` VALUES (327,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,50  ','2019-09-10 20:21:54');
INSERT INTO `tb_log` VALUES (328,0,'admin','2019-09-10 20:21:44','117.172.26.64','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 20:21:56');
INSERT INTO `tb_log` VALUES (329,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:21:59');
INSERT INTO `tb_log` VALUES (330,0,'admin','2019-09-10 20:21:44','117.172.26.64','Webinfo/in','更新网站配置成功','UPDATE `tb_webinfo`  SET `val`=\'\'  WHERE  `field` = \'fsd\'    ','2019-09-10 20:31:28');
INSERT INTO `tb_log` VALUES (331,0,'admin','2019-09-10 20:21:44','117.172.26.64','Links/inde','获取链接列表','SELECT * FROM `tb_links` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 20:31:34');
INSERT INTO `tb_log` VALUES (332,0,'admin','2019-09-10 20:21:44','117.172.26.64','Kf/index','获取客服列表','SELECT * FROM `tb_kf` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 20:31:35');
INSERT INTO `tb_log` VALUES (333,0,'admin','2019-09-10 20:21:44','117.172.26.64','Ad/index','获取ad列表','SELECT * FROM `tb_ad` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 20:31:35');
INSERT INTO `tb_log` VALUES (334,0,'admin','2019-09-10 20:21:44','117.172.26.64','Kf/index','获取客服列表','SELECT * FROM `tb_kf` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 20:31:36');
INSERT INTO `tb_log` VALUES (335,0,'admin','2019-09-10 20:21:44','117.172.26.64','Links/inde','获取链接列表','SELECT * FROM `tb_links` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 20:31:36');
INSERT INTO `tb_log` VALUES (336,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 20:33:20');
INSERT INTO `tb_log` VALUES (337,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/App/','','2019-09-10 20:33:22');
INSERT INTO `tb_log` VALUES (338,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/App/index/','','2019-09-10 20:33:23');
INSERT INTO `tb_log` VALUES (339,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/App/index/view/','','2019-09-10 20:33:24');
INSERT INTO `tb_log` VALUES (340,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:35:37');
INSERT INTO `tb_log` VALUES (341,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:35:41');
INSERT INTO `tb_log` VALUES (342,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata','关于我们/修改栏目成功','UPDATE `tb_lm`  SET `idpath`=\',1,18,\',`parentID_top`=\'1\',`Depth`=\'2\'  WHERE  (  `id`=\'18\' )     ','2019-09-10 20:35:49');
INSERT INTO `tb_log` VALUES (343,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:35:50');
INSERT INTO `tb_log` VALUES (344,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata','关于我们/修改栏目成功','UPDATE `tb_lm`  SET `idpath`=\',1,18,\',`parentID_top`=\'1\',`Depth`=\'2\'  WHERE  (  `id`=\'18\' )     ','2019-09-10 20:37:18');
INSERT INTO `tb_log` VALUES (345,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:37:20');
INSERT INTO `tb_log` VALUES (346,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:37:24');
INSERT INTO `tb_log` VALUES (347,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:40:28');
INSERT INTO `tb_log` VALUES (348,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:43:27');
INSERT INTO `tb_log` VALUES (349,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:43:32');
INSERT INTO `tb_log` VALUES (350,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/add','1231/新增栏目成功','UPDATE `tb_lm`  SET `idpath`=\',1,24,\',`Depth`=\'2\'  WHERE  (  `id`=\'24\' )    ','2019-09-10 20:45:46');
INSERT INTO `tb_log` VALUES (351,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:45:48');
INSERT INTO `tb_log` VALUES (352,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:45:58');
INSERT INTO `tb_log` VALUES (353,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/add','111/新增栏目成功','UPDATE `tb_lm`  SET `idpath`=\',1,25,\',`Depth`=\'2\'  WHERE  (  `id`=\'25\' )    ','2019-09-10 20:46:05');
INSERT INTO `tb_log` VALUES (354,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:46:08');
INSERT INTO `tb_log` VALUES (355,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:46:17');
INSERT INTO `tb_log` VALUES (356,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:46:23');
INSERT INTO `tb_log` VALUES (357,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:46:28');
INSERT INTO `tb_log` VALUES (358,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:46:38');
INSERT INTO `tb_log` VALUES (359,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:46:43');
INSERT INTO `tb_log` VALUES (360,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata','主营产品/修改栏目成功','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,21,22,23,\',`parentID_top`=\'2\',`Depth`=\'7\'  WHERE  (  `id`=\'23\' )     ','2019-09-10 20:46:51');
INSERT INTO `tb_log` VALUES (361,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:46:52');
INSERT INTO `tb_log` VALUES (362,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:48:36');
INSERT INTO `tb_log` VALUES (363,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:50:06');
INSERT INTO `tb_log` VALUES (364,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:50:11');
INSERT INTO `tb_log` VALUES (365,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:50:15');
INSERT INTO `tb_log` VALUES (366,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:50:19');
INSERT INTO `tb_log` VALUES (367,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:50:24');
INSERT INTO `tb_log` VALUES (368,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:50:29');
INSERT INTO `tb_log` VALUES (369,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:50:55');
INSERT INTO `tb_log` VALUES (370,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:50:59');
INSERT INTO `tb_log` VALUES (371,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata','111111/修改栏目成功','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,21,22,23,\',`parentID_top`=\'2\',`Depth`=\'7\'  WHERE  (  `id`=\'23\' )     ','2019-09-10 20:51:07');
INSERT INTO `tb_log` VALUES (372,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:51:09');
INSERT INTO `tb_log` VALUES (373,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:51:16');
INSERT INTO `tb_log` VALUES (374,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata','111111/修改栏目成功','UPDATE `tb_lm`  SET `newsid`=\'1\',`temp`=\'pic6\',`contemp`=\'picview7\'  WHERE  (  id=23 )     ','2019-09-10 20:51:21');
INSERT INTO `tb_log` VALUES (375,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:51:22');
INSERT INTO `tb_log` VALUES (376,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:51:26');
INSERT INTO `tb_log` VALUES (377,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:51:31');
INSERT INTO `tb_log` VALUES (378,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:51:37');
INSERT INTO `tb_log` VALUES (379,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:51:41');
INSERT INTO `tb_log` VALUES (380,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:51:50');
INSERT INTO `tb_log` VALUES (381,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:51:56');
INSERT INTO `tb_log` VALUES (382,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:52:02');
INSERT INTO `tb_log` VALUES (383,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:53:48');
INSERT INTO `tb_log` VALUES (384,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:53:53');
INSERT INTO `tb_log` VALUES (385,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:53:57');
INSERT INTO `tb_log` VALUES (386,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:54:01');
INSERT INTO `tb_log` VALUES (387,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:54:07');
INSERT INTO `tb_log` VALUES (388,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:54:13');
INSERT INTO `tb_log` VALUES (389,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:54:18');
INSERT INTO `tb_log` VALUES (390,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata','111111/修改栏目成功','UPDATE `tb_lm`  SET `newsid`=\'3\',`temp`=\'pic6\',`contemp`=\'picview7\'  WHERE  (  id=23 )     ','2019-09-10 20:54:30');
INSERT INTO `tb_log` VALUES (391,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:54:32');
INSERT INTO `tb_log` VALUES (392,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:54:37');
INSERT INTO `tb_log` VALUES (393,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:54:43');
INSERT INTO `tb_log` VALUES (394,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:56:46');
INSERT INTO `tb_log` VALUES (395,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:58:10');
INSERT INTO `tb_log` VALUES (396,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:58:41');
INSERT INTO `tb_log` VALUES (397,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:59:25');
INSERT INTO `tb_log` VALUES (398,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:59:41');
INSERT INTO `tb_log` VALUES (399,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 20:59:51');
INSERT INTO `tb_log` VALUES (400,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:06:50');
INSERT INTO `tb_log` VALUES (401,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata','关于我们/修改栏目成功','UPDATE `tb_lm`  SET `idpath`=\',1,25,\',`parentID_top`=\'1\',`Depth`=\'2\'  WHERE  (  `id`=\'25\' )     ','2019-09-10 21:10:22');
INSERT INTO `tb_log` VALUES (402,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:10:24');
INSERT INTO `tb_log` VALUES (403,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata','关于我们/修改栏目成功','UPDATE `tb_lm`  SET `idpath`=\',1,25,\',`parentID_top`=\'1\',`Depth`=\'2\'  WHERE  (  `id`=\'25\' )     ','2019-09-10 21:10:35');
INSERT INTO `tb_log` VALUES (404,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:10:36');
INSERT INTO `tb_log` VALUES (405,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata','关于我们/修改栏目成功','UPDATE `tb_lm`  SET `idpath`=\',1,25,\',`parentID_top`=\'1\',`Depth`=\'2\'  WHERE  (  `id`=\'25\' )     ','2019-09-10 21:10:42');
INSERT INTO `tb_log` VALUES (406,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:10:44');
INSERT INTO `tb_log` VALUES (407,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:10:57');
INSERT INTO `tb_log` VALUES (408,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:11:03');
INSERT INTO `tb_log` VALUES (409,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:11:13');
INSERT INTO `tb_log` VALUES (410,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:11:22');
INSERT INTO `tb_log` VALUES (411,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:11:28');
INSERT INTO `tb_log` VALUES (412,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:11:30');
INSERT INTO `tb_log` VALUES (413,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:11:38');
INSERT INTO `tb_log` VALUES (414,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:11:40');
INSERT INTO `tb_log` VALUES (415,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:11:56');
INSERT INTO `tb_log` VALUES (416,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','关于我们/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,1,\',`parentID_top`=\'2\',`Depth`=\'5\'  WHERE  (  `id`=\'1\' )     ','2019-09-10 21:18:45');
INSERT INTO `tb_log` VALUES (417,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','关于我们/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,1,18,\',`parentID_top`=\'2\',`Depth`=\'6\'  WHERE  (  `id`=\'18\' )     ','2019-09-10 21:18:45');
INSERT INTO `tb_log` VALUES (418,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','关于我们/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,1,24,\',`parentID_top`=\'2\',`Depth`=\'6\'  WHERE  (  `id`=\'24\' )     ','2019-09-10 21:18:45');
INSERT INTO `tb_log` VALUES (419,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','关于我们/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,1,25,\',`parentID_top`=\'2\',`Depth`=\'6\'  WHERE  (  `id`=\'25\' )     ','2019-09-10 21:18:45');
INSERT INTO `tb_log` VALUES (420,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata','关于我们/修改栏目成功','INSERT INTO `tb_log` (`UserName` , `LoginTime` , `ip` , `model` , `content` , `sql` , `endtime`) VALUES (\'admin\' , \'2019-09-10 20:21:44\' , \'117.172.26.64\' , \'Lm/updata_oldv\' , \'关于我们/修改栏目成功,更新下级栏目idpath失败\' , \'UPDATE `tb_lm`  SET `idpath`=\\\',2,8,19,20,1,25,\\\',`parentID_top`=\\\'2\\\',`Depth`=\\\'6\\\'  WHERE  (  `id`=\\\'25\\\' )     \' , \'2019-09-10 21:18:45\')        ','2019-09-10 21:18:45');
INSERT INTO `tb_log` VALUES (421,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:18:46');
INSERT INTO `tb_log` VALUES (422,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:18:47');
INSERT INTO `tb_log` VALUES (423,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:18:56');
INSERT INTO `tb_log` VALUES (424,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,1,\',`parentID_top`=\'2\',`Depth`=\'5\'  WHERE  (  `id`=\'1\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (425,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,\',`parentID_top`=\'2\',`Depth`=\'2\'  WHERE  (  `id`=\'8\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (426,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,9,\',`parentID_top`=\'2\',`Depth`=\'2\'  WHERE  (  `id`=\'9\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (427,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,10,\',`parentID_top`=\'2\',`Depth`=\'2\'  WHERE  (  `id`=\'10\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (428,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,11,\',`parentID_top`=\'2\',`Depth`=\'2\'  WHERE  (  `id`=\'11\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (429,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,12,\',`parentID_top`=\'2\',`Depth`=\'2\'  WHERE  (  `id`=\'12\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (430,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,13,\',`parentID_top`=\'2\',`Depth`=\'2\'  WHERE  (  `id`=\'13\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (431,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,1,18,\',`parentID_top`=\'2\',`Depth`=\'6\'  WHERE  (  `id`=\'18\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (432,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,\',`parentID_top`=\'2\',`Depth`=\'3\'  WHERE  (  `id`=\'19\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (433,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,\',`parentID_top`=\'2\',`Depth`=\'4\'  WHERE  (  `id`=\'20\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (434,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,21,\',`parentID_top`=\'2\',`Depth`=\'5\'  WHERE  (  `id`=\'21\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (435,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,21,22,\',`parentID_top`=\'2\',`Depth`=\'6\'  WHERE  (  `id`=\'22\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (436,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,21,22,23,\',`parentID_top`=\'2\',`Depth`=\'7\'  WHERE  (  `id`=\'23\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (437,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,1,24,\',`parentID_top`=\'2\',`Depth`=\'6\'  WHERE  (  `id`=\'24\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (438,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata_','主营产品/修改栏目成功,更新下级栏目idpath失败','UPDATE `tb_lm`  SET `idpath`=\',2,8,19,20,1,25,\',`parentID_top`=\'2\',`Depth`=\'6\'  WHERE  (  `id`=\'25\' )     ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (439,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata','主营产品/修改栏目成功','INSERT INTO `tb_log` (`UserName` , `LoginTime` , `ip` , `model` , `content` , `sql` , `endtime`) VALUES (\'admin\' , \'2019-09-10 20:21:44\' , \'117.172.26.64\' , \'Lm/updata_oldv\' , \'主营产品/修改栏目成功,更新下级栏目idpath失败\' , \'UPDATE `tb_lm`  SET `idpath`=\\\',2,8,19,20,1,25,\\\',`parentID_top`=\\\'2\\\',`Depth`=\\\'6\\\'  WHERE  (  `id`=\\\'25\\\' )     \' , \'2019-09-10 21:19:00\')        ','2019-09-10 21:19:00');
INSERT INTO `tb_log` VALUES (440,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:19:01');
INSERT INTO `tb_log` VALUES (441,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:19:02');
INSERT INTO `tb_log` VALUES (442,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:19:34');
INSERT INTO `tb_log` VALUES (443,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/updata','关于我们/修改栏目成功','UPDATE `tb_lm`  SET `idpath`=\',1,25,\',`parentID_top`=\'1\',`Depth`=\'2\'  WHERE  (  `id`=\'25\' )     ','2019-09-10 21:19:51');
INSERT INTO `tb_log` VALUES (444,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:19:52');
INSERT INTO `tb_log` VALUES (445,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:20:03');
INSERT INTO `tb_log` VALUES (446,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:20:08');
INSERT INTO `tb_log` VALUES (447,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:20:12');
INSERT INTO `tb_log` VALUES (448,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 21:20:36');
INSERT INTO `tb_log` VALUES (449,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:20:38');
INSERT INTO `tb_log` VALUES (450,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:20:45');
INSERT INTO `tb_log` VALUES (451,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:20:46');
INSERT INTO `tb_log` VALUES (452,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:20:52');
INSERT INTO `tb_log` VALUES (453,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:22:20');
INSERT INTO `tb_log` VALUES (454,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:23:33');
INSERT INTO `tb_log` VALUES (455,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:23:44');
INSERT INTO `tb_log` VALUES (456,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:23:47');
INSERT INTO `tb_log` VALUES (457,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:23:53');
INSERT INTO `tb_log` VALUES (458,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:25:30');
INSERT INTO `tb_log` VALUES (459,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','111文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'25\' ) LIMIT 1  ','2019-09-10 21:25:38');
INSERT INTO `tb_log` VALUES (460,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:26:54');
INSERT INTO `tb_log` VALUES (461,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:27:11');
INSERT INTO `tb_log` VALUES (462,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:27:40');
INSERT INTO `tb_log` VALUES (463,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:28:57');
INSERT INTO `tb_log` VALUES (464,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:29:04');
INSERT INTO `tb_log` VALUES (465,0,'admin','2019-09-10 20:21:44','117.172.26.64','Links/inde','获取链接列表','SELECT * FROM `tb_links` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:29:09');
INSERT INTO `tb_log` VALUES (466,0,'admin','2019-09-10 20:21:44','117.172.26.64','Links/inde','获取链接列表','SELECT * FROM `tb_links` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:29:18');
INSERT INTO `tb_log` VALUES (467,0,'admin','2019-09-10 20:21:44','117.172.26.64','Kf/index','获取客服列表','SELECT * FROM `tb_kf` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:29:19');
INSERT INTO `tb_log` VALUES (468,0,'admin','2019-09-10 20:21:44','117.172.26.64','Ad/index','获取ad列表','SELECT * FROM `tb_ad` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:29:23');
INSERT INTO `tb_log` VALUES (469,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:29:27');
INSERT INTO `tb_log` VALUES (470,0,'admin','2019-09-10 20:21:44','117.172.26.64','Kf/index','获取客服列表','SELECT * FROM `tb_kf` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:29:30');
INSERT INTO `tb_log` VALUES (471,0,'admin','2019-09-10 20:21:44','117.172.26.64','Links/inde','获取链接列表','SELECT * FROM `tb_links` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:29:31');
INSERT INTO `tb_log` VALUES (472,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:29:33');
INSERT INTO `tb_log` VALUES (473,0,'admin','2019-09-10 20:21:44','117.172.26.64','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:29:34');
INSERT INTO `tb_log` VALUES (474,0,'admin','2019-09-10 20:21:44','117.172.26.64','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:29:36');
INSERT INTO `tb_log` VALUES (475,0,'admin','2019-09-10 20:21:44','117.172.26.64','User/index','获取管理员列表','SELECT * FROM `tb_user` WHERE  (  `id`>\'0\' and `UserName`<>\'admin\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:29:38');
INSERT INTO `tb_log` VALUES (476,0,'admin','2019-09-10 20:21:44','117.172.26.64','Member/ind','获取会员列表','SELECT * FROM `tb_member` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:30:13');
INSERT INTO `tb_log` VALUES (477,0,'admin','2019-09-10 20:21:44','117.172.26.64','Links/inde','获取链接列表','SELECT * FROM `tb_links` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:30:16');
INSERT INTO `tb_log` VALUES (478,0,'admin','2019-09-10 20:21:44','117.172.26.64','Links/inde','获取链接列表','SELECT * FROM `tb_links` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:30:19');
INSERT INTO `tb_log` VALUES (479,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:30:21');
INSERT INTO `tb_log` VALUES (480,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','工程设备文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'3\' ) LIMIT 1  ','2019-09-10 21:30:23');
INSERT INTO `tb_log` VALUES (481,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','工程设备文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'3\' ) LIMIT 1  ','2019-09-10 21:30:26');
INSERT INTO `tb_log` VALUES (482,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','工程设备文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'3\' ) LIMIT 1  ','2019-09-10 21:30:34');
INSERT INTO `tb_log` VALUES (483,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','工程设备文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'3\' ) LIMIT 1  ','2019-09-10 21:30:37');
INSERT INTO `tb_log` VALUES (484,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:30:41');
INSERT INTO `tb_log` VALUES (485,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/up','修改文档成功/id=61','UPDATE `tb_article`  SET `read_num`=2,`Recommend`=\'1,0,\',`fjid`=\',0,\',`istop`=1,`hpx`=NULL,`px`=NULL,`Title`=\'怎样预防塑料桶老化问题\',`Author`=\'cdjiaguan.com\',`KeyWords`=NULL,`videourl`=NULL,`Content`=\'<p style=\\\"text-indent:2em;\\\">\\r\\n	<span style=\\\"font-size:14px;\\\">塑料制品在使用一段时间之后其表面会发白、粉化，硬度明显降低。这就是塑料的老化现象。那么盛放液体的塑料桶应该怎样预防老化问题呢</span><span lang=\\\"EN-US\\\" style=\\\"font-size:14px;\\\">?</span><span style=\\\"font-size:14px;\\\">我们一起来了解一下。<br />\\r\\n	<div style=\\\"text-align:center;\\\">\\r\\n		<span style=\\\"text-indent:2em;\\\"></span><span style=\\\"text-indent:2em;\\\"><img src=\\\"/public/uploads/image/20190902/20190902174129_69999.jpg\\\" alt=\\\"\\\" /></span>\\r\\n	</div>\\r\\n</span>\\r\\n</p>\\r\\n<p style=\\\"text-indent:2em;\\\">\\r\\n	<span lang=\\\"EN-US\\\" style=\\\"font-size:14px;\\\">1</span><span style=\\\"font-size:14px;\\\">、为解决老化问题，在制塑料时常加一些防老剂，以减慢其老化速度，其实这并未从根本上解决问题。为了使塑料制品能经久耐用，主要是使用时要得当，不让阳光曝晒，不让雨淋，也不在火上或暖气上烤，不要常接触水或油类等。</span><span lang=\\\"EN-US\\\"><o:p></o:p></span>\\r\\n</p>\\r\\n<p style=\\\"text-indent:2em;\\\">\\r\\n	<span style=\\\"','2019-09-10 21:30:47');
INSERT INTO `tb_log` VALUES (486,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:30:48');
INSERT INTO `tb_log` VALUES (487,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:30:50');
INSERT INTO `tb_log` VALUES (488,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:30:51');
INSERT INTO `tb_log` VALUES (489,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:30:54');
INSERT INTO `tb_log` VALUES (490,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:30:55');
INSERT INTO `tb_log` VALUES (491,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:30:56');
INSERT INTO `tb_log` VALUES (492,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:30:58');
INSERT INTO `tb_log` VALUES (493,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:31:16');
INSERT INTO `tb_log` VALUES (494,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:32:20');
INSERT INTO `tb_log` VALUES (495,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:32:21');
INSERT INTO `tb_log` VALUES (496,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:33:04');
INSERT INTO `tb_log` VALUES (497,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:33:40');
INSERT INTO `tb_log` VALUES (498,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:33:55');
INSERT INTO `tb_log` VALUES (499,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:34:43');
INSERT INTO `tb_log` VALUES (500,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:34:51');
INSERT INTO `tb_log` VALUES (501,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:35:47');
INSERT INTO `tb_log` VALUES (502,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:35:51');
INSERT INTO `tb_log` VALUES (503,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:35:56');
INSERT INTO `tb_log` VALUES (504,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:36:01');
INSERT INTO `tb_log` VALUES (505,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:36:05');
INSERT INTO `tb_log` VALUES (506,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:36:50');
INSERT INTO `tb_log` VALUES (507,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:36:52');
INSERT INTO `tb_log` VALUES (508,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:36:55');
INSERT INTO `tb_log` VALUES (509,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:36:57');
INSERT INTO `tb_log` VALUES (510,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:37:02');
INSERT INTO `tb_log` VALUES (511,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:37:06');
INSERT INTO `tb_log` VALUES (512,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:37:30');
INSERT INTO `tb_log` VALUES (513,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:37:37');
INSERT INTO `tb_log` VALUES (514,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:37:46');
INSERT INTO `tb_log` VALUES (515,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:37:50');
INSERT INTO `tb_log` VALUES (516,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:37:52');
INSERT INTO `tb_log` VALUES (517,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:38:28');
INSERT INTO `tb_log` VALUES (518,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:38:29');
INSERT INTO `tb_log` VALUES (519,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:38:34');
INSERT INTO `tb_log` VALUES (520,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:38:36');
INSERT INTO `tb_log` VALUES (521,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:38:38');
INSERT INTO `tb_log` VALUES (522,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:38:44');
INSERT INTO `tb_log` VALUES (523,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:38:47');
INSERT INTO `tb_log` VALUES (524,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:39:07');
INSERT INTO `tb_log` VALUES (525,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:39:10');
INSERT INTO `tb_log` VALUES (526,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:39:13');
INSERT INTO `tb_log` VALUES (527,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:40:47');
INSERT INTO `tb_log` VALUES (528,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:40:54');
INSERT INTO `tb_log` VALUES (529,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:42:29');
INSERT INTO `tb_log` VALUES (530,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:42:30');
INSERT INTO `tb_log` VALUES (531,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:42:34');
INSERT INTO `tb_log` VALUES (532,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:42:35');
INSERT INTO `tb_log` VALUES (533,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:42:57');
INSERT INTO `tb_log` VALUES (534,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:43:07');
INSERT INTO `tb_log` VALUES (535,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:43:21');
INSERT INTO `tb_log` VALUES (536,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:43:36');
INSERT INTO `tb_log` VALUES (537,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:43:44');
INSERT INTO `tb_log` VALUES (538,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:43:49');
INSERT INTO `tb_log` VALUES (539,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:43:51');
INSERT INTO `tb_log` VALUES (540,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:44:36');
INSERT INTO `tb_log` VALUES (541,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:44:39');
INSERT INTO `tb_log` VALUES (542,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:44:41');
INSERT INTO `tb_log` VALUES (543,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:44:45');
INSERT INTO `tb_log` VALUES (544,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:44:46');
INSERT INTO `tb_log` VALUES (545,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:45:01');
INSERT INTO `tb_log` VALUES (546,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:45:04');
INSERT INTO `tb_log` VALUES (547,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:45:11');
INSERT INTO `tb_log` VALUES (548,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:45:14');
INSERT INTO `tb_log` VALUES (549,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:45:17');
INSERT INTO `tb_log` VALUES (550,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','234234文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'19\' ) LIMIT 1  ','2019-09-10 21:45:20');
INSERT INTO `tb_log` VALUES (551,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','11112文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'23\' ) LIMIT 1  ','2019-09-10 21:45:22');
INSERT INTO `tb_log` VALUES (552,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:45:25');
INSERT INTO `tb_log` VALUES (553,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:45:48');
INSERT INTO `tb_log` VALUES (554,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:46:12');
INSERT INTO `tb_log` VALUES (555,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:46:13');
INSERT INTO `tb_log` VALUES (556,0,'admin','2019-09-10 20:21:44','117.172.26.64','article','批量操作成功/：选中文档-已取消审核.article','UPDATE `tb_article`  SET `isVerify`=0  WHERE  (  id in(51) )   ','2019-09-10 21:46:40');
INSERT INTO `tb_log` VALUES (557,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:46:40');
INSERT INTO `tb_log` VALUES (558,0,'admin','2019-09-10 20:21:44','117.172.26.64','article','批量操作成功/：选中文档-已审核.article','UPDATE `tb_article`  SET `isVerify`=1  WHERE  (  id in(51) )   ','2019-09-10 21:46:49');
INSERT INTO `tb_log` VALUES (559,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:46:49');
INSERT INTO `tb_log` VALUES (560,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:47:24');
INSERT INTO `tb_log` VALUES (561,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:47:38');
INSERT INTO `tb_log` VALUES (562,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:47:43');
INSERT INTO `tb_log` VALUES (563,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:48:17');
INSERT INTO `tb_log` VALUES (564,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:48:31');
INSERT INTO `tb_log` VALUES (565,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:48:44');
INSERT INTO `tb_log` VALUES (566,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:48:48');
INSERT INTO `tb_log` VALUES (567,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:48:58');
INSERT INTO `tb_log` VALUES (568,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:49:13');
INSERT INTO `tb_log` VALUES (569,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:49:17');
INSERT INTO `tb_log` VALUES (570,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:49:24');
INSERT INTO `tb_log` VALUES (571,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:49:41');
INSERT INTO `tb_log` VALUES (572,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:49:49');
INSERT INTO `tb_log` VALUES (573,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:49:53');
INSERT INTO `tb_log` VALUES (574,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:50:30');
INSERT INTO `tb_log` VALUES (575,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:50:34');
INSERT INTO `tb_log` VALUES (576,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:50:50');
INSERT INTO `tb_log` VALUES (577,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:50:55');
INSERT INTO `tb_log` VALUES (578,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:51:00');
INSERT INTO `tb_log` VALUES (579,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:51:06');
INSERT INTO `tb_log` VALUES (580,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:51:23');
INSERT INTO `tb_log` VALUES (581,0,'admin','2019-09-10 20:21:44','117.172.26.64','Links/inde','获取链接列表','SELECT * FROM `tb_links` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:51:28');
INSERT INTO `tb_log` VALUES (582,0,'admin','2019-09-10 20:21:44','117.172.26.64','Kf/index','获取客服列表','SELECT * FROM `tb_kf` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:51:29');
INSERT INTO `tb_log` VALUES (583,0,'admin','2019-09-10 20:21:44','117.172.26.64','Ad/index','获取ad列表','SELECT * FROM `tb_ad` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:51:29');
INSERT INTO `tb_log` VALUES (584,0,'admin','2019-09-10 20:21:44','117.172.26.64','Kf/index','获取客服列表','SELECT * FROM `tb_kf` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:51:31');
INSERT INTO `tb_log` VALUES (585,0,'admin','2019-09-10 20:21:44','117.172.26.64','Ad/index','获取ad列表','SELECT * FROM `tb_ad` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:51:35');
INSERT INTO `tb_log` VALUES (586,0,'admin','2019-09-10 20:21:44','117.172.26.64','User/index','获取管理员列表','SELECT * FROM `tb_user` WHERE  (  `id`>\'0\' and `UserName`<>\'admin\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:51:38');
INSERT INTO `tb_log` VALUES (587,0,'admin','2019-09-10 20:21:44','117.172.26.64','Member/ind','获取会员列表','SELECT * FROM `tb_member` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:51:39');
INSERT INTO `tb_log` VALUES (588,0,'admin','2019-09-10 20:21:44','117.172.26.64','Member/ind','获取会员列表','SELECT * FROM `tb_member` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:51:43');
INSERT INTO `tb_log` VALUES (589,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:51:44');
INSERT INTO `tb_log` VALUES (590,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-10 21:51:45');
INSERT INTO `tb_log` VALUES (591,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','工程设备文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'3\' ) LIMIT 1  ','2019-09-10 21:51:46');
INSERT INTO `tb_log` VALUES (592,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','新闻资讯文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'4\' ) LIMIT 1  ','2019-09-10 21:51:47');
INSERT INTO `tb_log` VALUES (593,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:51:53');
INSERT INTO `tb_log` VALUES (594,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/ad','查看回收站','','2019-09-10 21:51:59');
INSERT INTO `tb_log` VALUES (595,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 21:52:03');
INSERT INTO `tb_log` VALUES (596,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:52:18');
INSERT INTO `tb_log` VALUES (597,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:52:48');
INSERT INTO `tb_log` VALUES (598,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:53:05');
INSERT INTO `tb_log` VALUES (599,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 21:53:12');
INSERT INTO `tb_log` VALUES (600,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 21:53:35');
INSERT INTO `tb_log` VALUES (601,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 21:53:51');
INSERT INTO `tb_log` VALUES (602,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 21:54:06');
INSERT INTO `tb_log` VALUES (603,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 21:54:46');
INSERT INTO `tb_log` VALUES (604,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 21:54:55');
INSERT INTO `tb_log` VALUES (605,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 21:55:01');
INSERT INTO `tb_log` VALUES (606,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 21:55:08');
INSERT INTO `tb_log` VALUES (607,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:55:13');
INSERT INTO `tb_log` VALUES (608,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 21:55:27');
INSERT INTO `tb_log` VALUES (609,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:55:29');
INSERT INTO `tb_log` VALUES (610,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:55:50');
INSERT INTO `tb_log` VALUES (611,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:56:26');
INSERT INTO `tb_log` VALUES (612,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/yi','批量移动成功51,50,49,47->24','UPDATE `tb_article`  SET `TypeID`=24  WHERE  (  id in(51,50,49,47) )   ','2019-09-10 21:56:45');
INSERT INTO `tb_log` VALUES (613,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:56:45');
INSERT INTO `tb_log` VALUES (614,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 21:56:49');
INSERT INTO `tb_log` VALUES (615,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/yi','批量移动成功51,50,49,47->8','UPDATE `tb_article`  SET `TypeID`=8  WHERE  (  id in(51,50,49,47) )   ','2019-09-10 21:56:57');
INSERT INTO `tb_log` VALUES (616,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 21:56:57');
INSERT INTO `tb_log` VALUES (617,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/ad','新增文档成功','INSERT INTO `tb_article` (`id` , `TypeID` , `read_num` , `Recommend` , `fjid` , `istop` , `hpx` , `px` , `Title` , `Author` , `KeyWords` , `videourl` , `Content` , `Content1` , `Content2` , `Content3` , `Content4` , `isVerify` , `CreateTime` , `Creator` , `S_Image` , `B_Image` , `seotitle` , `seokeywords` , `seodescription` , `s2` , `d1` , `d2` , `d3` , `d4` , `d5` , `d6` , `endtime` , `endtime1`) VALUES (0 , 1 , 0 , \'0,\' , \',0,\' , NULL , NULL , NULL , \'关于我们\' , \'shop.gemut.cn\' , NULL , NULL , \'<span style=\\\"white-space:normal;\\\">关于我们</span><span style=\\\"white-space:normal;\\\">关于我们</span><span style=\\\"white-space:normal;\\\">关于我们</span><span style=\\\"white-space:normal;\\\">关于我们</span><span style=\\\"white-space:normal;\\\">关于我们</span><span style=\\\"white-space:normal;\\\">关于我们</span><span style=\\\"white-space:normal;\\\">关于我们</span><span style=\\\"white-space:normal;\\\">关于我们</span><span style=\\\"white-space:normal;\\\">关于我们</span><span style=\\\"white-space:normal;\\\">关于我们</span><span style=\\\"white-space:norma','2019-09-10 21:57:07');
INSERT INTO `tb_log` VALUES (618,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 21:57:08');
INSERT INTO `tb_log` VALUES (619,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 21:57:15');
INSERT INTO `tb_log` VALUES (620,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 21:57:18');
INSERT INTO `tb_log` VALUES (621,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:58:04');
INSERT INTO `tb_log` VALUES (622,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-10 21:58:05');
INSERT INTO `tb_log` VALUES (623,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-10 21:58:07');
INSERT INTO `tb_log` VALUES (624,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/up','修改文档成功/id=61','UPDATE `tb_article`  SET `read_num`=2,`Recommend`=\'1,0,\',`fjid`=\',0,\',`istop`=1,`hpx`=NULL,`px`=NULL,`Title`=\'怎样预防塑料桶老化问题\',`Author`=\'cdjiaguan.com\',`KeyWords`=NULL,`videourl`=NULL,`Content`=\'<p style=\\\"text-indent:2em;\\\">\\r\\n	<span style=\\\"font-size:14px;\\\">塑料制品在使用一段时间之后其表面会发白、粉化，硬度明显降低。这就是塑料的老化现象。那么盛放液体的塑料桶应该怎样预防老化问题呢</span><span lang=\\\"EN-US\\\" style=\\\"font-size:14px;\\\">?</span><span style=\\\"font-size:14px;\\\">我们一起来了解一下。<br />\\r\\n	<div style=\\\"text-align:center;\\\">\\r\\n		<span style=\\\"text-indent:2em;\\\"></span><span style=\\\"text-indent:2em;\\\"><img src=\\\"/public/uploads/image/20190902/20190902174129_69999.jpg\\\" alt=\\\"\\\" /></span>\\r\\n	</div>\\r\\n</span>\\r\\n</p>\\r\\n<p style=\\\"text-indent:2em;\\\">\\r\\n	<span lang=\\\"EN-US\\\" style=\\\"font-size:14px;\\\">1</span><span style=\\\"font-size:14px;\\\">、为解决老化问题，在制塑料时常加一些防老剂，以减慢其老化速度，其实这并未从根本上解决问题。为了使塑料制品能经久耐用，主要是使用时要得当，不让阳光曝晒，不让雨淋，也不在火上或暖气上烤，不要常接触水或油类等。</span><span lang=\\\"EN-US\\\"><o:p></o:p></span>\\r\\n</p>\\r\\n<p style=\\\"text-indent:2em;\\\">\\r\\n	<span style=\\\"','2019-09-10 21:58:21');
INSERT INTO `tb_log` VALUES (625,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','塑料桶文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'9\' ) LIMIT 1  ','2019-09-10 21:58:22');
INSERT INTO `tb_log` VALUES (626,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','新闻资讯文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'4\' ) LIMIT 1  ','2019-09-10 21:58:23');
INSERT INTO `tb_log` VALUES (627,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/in','技术文章文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'5\' ) LIMIT 1  ','2019-09-10 21:58:24');
INSERT INTO `tb_log` VALUES (628,0,'admin','2019-09-10 20:21:44','117.172.26.64','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:58:25');
INSERT INTO `tb_log` VALUES (629,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:58:26');
INSERT INTO `tb_log` VALUES (630,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:58:28');
INSERT INTO `tb_log` VALUES (631,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:58:30');
INSERT INTO `tb_log` VALUES (632,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:58:31');
INSERT INTO `tb_log` VALUES (633,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:58:32');
INSERT INTO `tb_log` VALUES (634,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:58:33');
INSERT INTO `tb_log` VALUES (635,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:58:34');
INSERT INTO `tb_log` VALUES (636,0,'admin','2019-09-10 20:21:44','117.172.26.64','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:58:37');
INSERT INTO `tb_log` VALUES (637,0,'admin','2019-09-10 20:21:44','117.172.26.64','Guest/inde','获取留言列表','SELECT * FROM `tb_guest` WHERE  (  `id`>\'0\'  ) ORDER BY `id` asc LIMIT 0,30  ','2019-09-10 21:58:46');
INSERT INTO `tb_log` VALUES (638,0,'admin','2019-09-10 20:21:44','117.172.26.64','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-10 21:58:49');
INSERT INTO `tb_log` VALUES (639,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 21:58:52');
INSERT INTO `tb_log` VALUES (640,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/zipra','生成zip压缩文件成功/20190910215856.zip','','2019-09-10 21:59:04');
INSERT INTO `tb_log` VALUES (641,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 21:59:19');
INSERT INTO `tb_log` VALUES (642,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 21:59:28');
INSERT INTO `tb_log` VALUES (643,0,'admin','2019-09-10 20:21:44','117.172.26.64','Article/ad','查看回收站','','2019-09-10 21:59:42');
INSERT INTO `tb_log` VALUES (644,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 21:59:43');
INSERT INTO `tb_log` VALUES (645,0,'admin','2019-09-10 20:21:44','117.172.26.64','Sitemap/in','sitemap.xml生成成功','','2019-09-10 21:59:47');
INSERT INTO `tb_log` VALUES (646,0,'admin','2019-09-10 20:21:44','117.172.26.64','Sitemap/ht','sitemap.xml生成成功','','2019-09-10 21:59:47');
INSERT INTO `tb_log` VALUES (647,0,'admin','2019-09-10 20:21:44','117.172.26.64','Sitemap/tx','sitemap.xml生成成功','','2019-09-10 21:59:47');
INSERT INTO `tb_log` VALUES (648,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 22:00:43');
INSERT INTO `tb_log` VALUES (649,0,'admin','2019-09-10 20:21:44','117.172.26.64','Temp/index','文件管理列表/','','2019-09-10 22:01:13');
INSERT INTO `tb_log` VALUES (650,0,'admin','2019-09-10 20:21:44','117.172.26.64','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-10 22:01:15');
INSERT INTO `tb_log` VALUES (651,0,NULL,NULL,'171.212.113.72','user/login','admin登录密码错误','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-11 09:10:46');
INSERT INTO `tb_log` VALUES (652,0,'admin','2019-09-11 09:10:58','171.212.113.72','user/login','admin登录成功','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-11 09:10:58');
INSERT INTO `tb_log` VALUES (653,0,'admin','2019-09-11 09:10:58','171.212.113.72','Article/in','关于我们文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'1\' ) LIMIT 1  ','2019-09-11 09:11:02');
INSERT INTO `tb_log` VALUES (654,0,'admin','2019-09-11 09:10:58','171.212.113.72','Article/in','主营产品文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'2\' ) LIMIT 1  ','2019-09-11 09:11:05');
INSERT INTO `tb_log` VALUES (655,0,'admin','2019-09-11 10:16:29','171.212.113.72','user/login','admin登录成功','SELECT * FROM `tb_user` WHERE  (  `UserName`=\'admin\' ) LIMIT 1  ','2019-09-11 10:16:29');
INSERT INTO `tb_log` VALUES (656,0,'admin','2019-09-11 10:16:29','171.212.113.72','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-11 10:16:34');
INSERT INTO `tb_log` VALUES (657,0,'admin','2019-09-11 09:10:58','171.212.113.72','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-11 16:47:01');
INSERT INTO `tb_log` VALUES (658,0,'admin','2019-09-11 09:10:58','171.212.113.72','Lm/index','栏目列表','SELECT * FROM `tb_lm` WHERE  (  `parentID`=\'17\' ) ORDER BY `SortNumber` asc,`id` asc ','2019-09-11 16:47:07');
INSERT INTO `tb_log` VALUES (659,0,'admin','2019-09-11 09:10:58','171.212.113.72','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-11 16:47:11');
INSERT INTO `tb_log` VALUES (660,0,'admin','2019-09-11 09:10:58','171.212.113.72','Temp/index','文件管理列表/','','2019-09-11 16:47:14');
INSERT INTO `tb_log` VALUES (661,0,'admin','2019-09-11 09:10:58','171.212.113.72','Article/in','文档列表','SELECT * FROM `tb_lm` WHERE  (  `id`=\'0\' ) LIMIT 1  ','2019-09-11 16:47:16');
INSERT INTO `tb_log` VALUES (662,0,'admin','2019-09-11 09:10:58','171.212.113.72','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-11 16:47:42');
INSERT INTO `tb_log` VALUES (663,0,'admin','2019-09-11 09:10:58','171.212.113.72','Log/index','获取日志列表','SELECT * FROM `tb_log` WHERE  (  `id`>\'0\' and `is_del`<>\'1\' and `model`<>\'Log/index\'  ) ORDER BY `id` desc LIMIT 0,30  ','2019-09-11 16:47:43');

DELETE FROM tb_member;
INSERT INTO `tb_member` VALUES (1,NULL,'anddisme','anddisme',0,1,2,'anddisme','anddisme',13981718398,NULL,NULL,'/public/uploads/image/20170607/163214.jpg',513922199008059745,'/public/uploads/image/20170607/163214.jpg','/public/uploads/image/20170607/163214.jpg','内容测试','anddisme','anddisme',1496825329);
INSERT INTO `tb_member` VALUES (3,NULL,'scltt11','2e2a66551e91cf14309be687844da609',0,0,'','scltt1',NULL,'scltt1',NULL,NULL,'/public/uploads/image/20190820/20190820152123_34392.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-20 ');
INSERT INTO `tb_member` VALUES (4,NULL,'u201909111616577','bc9b5718afdffe85fb13555347969ff5',0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-11 16:16:57',NULL,'2019-09-11 ');

DELETE FROM tb_pro;
INSERT INTO `tb_pro` VALUES (14,'豪进1','201159152916.html',NULL,'../uploadfile/ProdFile/2011050915291336773.jpg',NULL,NULL,NULL,'<FONT face=Verdana>豪进1</FONT>','2011-05-09 15:29:16','2011-05-09 15:29:16','admin',1416,10,100,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (15,'恒发3','201159152940.html',NULL,'../uploadfile/ProdFile/2011050915293796116.jpg','','','','<FONT face=Verdana>恒发3</FONT>','2011-05-09 15:29:40','2011-05-09 15:29:40','admin',1424,10,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (17,'骨科展 德国蛇牌-1','2011510115837.html',NULL,'../uploadfile/ProdFile/2011051011582852284.jpg','','','','','2011-05-10 11:58:37','2011-05-10 11:58:37','admin',2233,11,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (18,'骨科大会 理贝尔','2011510120007.html',NULL,'../uploadfile/ProdFile/2011051011595929393.jpg','','','','','2011-05-10 12:00:07','2011-05-10 12:00:07','admin',2252,11,14,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (19,'医药展—美敦力','2011510120105.html',NULL,'../uploadfile/ProdFile/2011051012010144307.jpg','','','','','2011-05-10 12:01:05','2011-05-10 12:01:05','admin',2006,11,3,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (20,'成都天台山制药','2011510120150.html',NULL,'../uploadfile/ProdFile/2011051012013052806.jpg','','','','','2011-05-10 12:01:50','2011-05-10 12:01:50','admin',1447,11,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (21,'2010成都秋季房交会','2011510120428.html',NULL,'../uploadfile/ProdFile/2011051012042291211.jpg','','','','','2011-05-10 12:04:28','2011-05-10 12:04:28','admin',1410,12,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (22,'2010成都秋季房交会','2011510120455.html',NULL,'../uploadfile/ProdFile/2011051012045112102.jpg','','','','','2011-05-10 12:04:55','2011-05-10 12:04:55','admin',1457,12,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (77,'2011台湾先驱','2011711104327.html',NULL,'../uploadfile/ProdFile/2011071110401875924.jpg','','','','<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011711104045142.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201171110410931.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011711104130632.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011711104140457.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011711104150172.jpg\"></P>
<P style=\"MARGIN-TOP: 0pt; MARGIN-BOTTOM: 0pt\" class=p0 align=center><SPAN style=\"FONT-FAMILY: \'幼圆\'; FONT-SIZE: 16pt; mso-spacerun: \'yes\'\">2011</SPAN><SPAN style=\"FONT-FAMILY: \'幼圆\'; FONT-SIZE: 16pt; mso-spacerun: \'yes\'\">年</SPAN><SPAN style=\"FONT-FAMILY: \'幼圆\'; FONT-SIZE: 16pt; mso-spacerun: \'yes\'\">第十二届成都国际家具工业</SPAN><SPAN style=\"FONT-FAMILY: \'幼圆\'; FONT-SIZE: 16pt; mso-spacerun: \'yes\'\">展览会</SPAN></P>
<P align=center><!--EndFragment--></P>','2011-07-11 10:43:27','2011-07-11 10:43:27','admin',1732,12,3,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (78,'新湖装饰材料','2011714115939.html',NULL,'../uploadfile/ProdFile/2011071412035415624.jpg','','','','<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011714115753855.jpg\"></P>
<P align=center>2011成都建材展（成都世纪城新会展中心）</P>','2011-07-14 11:59:39','2011-07-14 11:59:39','admin',1595,14,99,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (79,'电子展 长安','2011815155735.html',NULL,'../uploadfile/ProdFile/2011081515545237001.jpg','','','','<P>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011815155522684.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201181515563628.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011815155624226.jpg\"></P>
<P align=center>成都世纪城新会展中心&nbsp; 东莞电子展</P>','2011-08-15 15:57:35','2011-08-15 15:57:35','admin',1205,16,99,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (80,'电子展 长安','2011815155958.html',NULL,'../uploadfile/ProdFile/2011081515582494863.jpg','','','','<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201181515590988.jpg\"></P>
<P align=center>成都展台制作&nbsp; 成都世纪城新会展中心</P>','2011-08-15 15:59:58','2011-08-15 15:59:58','admin',1150,16,99,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (81,'电子展 横沥','2011815160236.html',NULL,'../uploadfile/ProdFile/2011081516004472219.jpg','','','','<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20118151613977.jpg\"></P>
<P align=center>成都展会布置&nbsp; （成都世纪城新会展中心）</P>','2011-08-15 16:02:36','2011-08-15 16:02:36','admin',1323,16,99,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (82,'南昌泰康','2011819172714.html',NULL,'../uploadfile/ProdFile/2011081917243098131.jpg','','','','<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011819172452326.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201181917258333.jpg\"></P>
<P align=center>乳品展——成都展会制作 (成都世纪城新会展中心)</P>','2011-08-19 17:27:14','2011-08-19 17:27:14','admin',1310,13,99,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (83,'金达威','2011819172950.html',NULL,'../uploadfile/ProdFile/2011081917273710264.jpg','','','','<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201181917281124.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011819172813766.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center>乳品展——成都展台制作搭建（成都世纪城新会展中心）</P>','2011-08-19 17:29:50','2011-08-19 17:29:50','admin',1416,13,98,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (84,'亚欧博览会','201193191721.html',NULL,'../uploadfile/ProdFile/2011090319144123272.jpg','','','','<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201193191518880.jpg\"></P>
<P align=center>亚欧博览会展台制作搭建（新疆国际会展中心） </P>','2011-09-03 19:17:21','2011-09-03 19:17:21','admin',1632,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (85,'商标节  袁隆平','2011915162802.html',NULL,'../uploadfile/ProdFile/2011091516272057922.jpg','','','','<P align=center>第四届中国商标节（成都世纪城新会展中心）</P>','2011-09-15 16:28:02','2011-09-15 16:28:02','admin',1167,16,101,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (86,'商标节 漫步者','2011915162953.html',NULL,'../uploadfile/ProdFile/2011091516282941222.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011915162843331.jpg\"></P>
<P align=center>第四届中国商标节（成都世纪城新会展中心）</P>','2011-09-15 16:29:53','2011-09-15 16:29:53','admin',1081,16,99,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (87,'商标节 绍兴','2011915163144.html',NULL,'../uploadfile/ProdFile/2011091516301250668.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011915163031997.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011915163048891.jpg\"></P>
<P align=center>第四届中国商标节（成都世纪城新会展中心）</P>','2011-09-15 16:31:44','2011-09-15 16:31:44','admin',1216,16,99,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (88,'2011秋交会 华达','2011108103530.html',NULL,'../uploadfile/ProdFile/2011100810324313644.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201110810334754.jpg\"></P>
<P align=center>2011成都第38届秋交会 华达装饰公司展位制作搭建 （成都世纪城新会展中心）</P>','2011-10-08 10:35:30','2011-10-08 10:35:30','admin',1460,12,97,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (89,'秋交会 西财置业','2011108104255.html',NULL,'../uploadfile/ProdFile/2011100810412711157.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011108104143952.jpg\"></P>
<P align=center>成都第38届秋交会西财置业展台制作 （成都世纪城新会展中心）</P>','2011-10-08 10:42:55','2011-10-08 10:42:55','admin',1570,14,97,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (90,'秋交会 南湖半岛','2011108104607.html',NULL,'../uploadfile/ProdFile/2011100810443444682.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011108104512177.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011108104526381.jpg\"></P>
<P align=center>2011年成都秋季房交会（成都世纪城新会展中心）</P>','2011-10-08 10:46:07','2011-10-08 10:46:07','admin',1662,14,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (91,'38届秋交会 华润置地','2011108104917.html',NULL,'../uploadfile/ProdFile/2011100810473649608.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011108104754185.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201110810486645.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011108104817482.jpg\"></P>
<P align=center>2011年成都第38届秋季房交会展台制作搭建（成都世纪城新会展中心）</P>','2011-10-08 10:49:17','2011-10-08 10:49:17','admin',1531,14,4,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (23,'家具展 时尚一百','2011510120515.html',NULL,'../uploadfile/ProdFile/2011051012051184778.jpg','','','','','2011-05-10 12:05:15','2011-05-10 12:05:15','admin',1543,12,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (24,'家具展 台湾先驱','2011510120530.html',NULL,'../uploadfile/ProdFile/2011051017565370955.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201151017570158.jpg\"><BR><BR><IMG border=0 src=\"/UploadFile/ProdFile/2011510175720507.jpg\"><BR><BR><IMG border=0 src=\"/UploadFile/ProdFile/2011510175740198.jpg\"></P>','2011-05-10 12:05:30','2011-05-10 12:05:30','admin',1663,12,103,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (25,'西博会 希杰','2011510173113.html',NULL,'../uploadfile/ProdFile/2011051017301817224.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510173050642.jpg\" border=0></P>','2011-05-10 17:31:13','2011-05-10 17:31:13','admin',1324,13,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (26,'四川省泡菜展','2011510173302.html',NULL,'../uploadfile/ProdFile/2011051017314224677.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/201151017324920.jpg\" border=0><BR><BR><IMG src=\"/UploadFile/ProdFile/2011510173226566.jpg\" border=0><BR><BR><IMG src=\"/UploadFile/ProdFile/2011510173242826.jpg\" border=0></P>','2011-05-10 17:33:02','2011-05-10 17:33:02','admin',1367,13,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (29,'斯凯五金','2011510174554.html',NULL,'../uploadfile/ProdFile/2011061816521179659.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011618165239309.jpg\"><BR><BR></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201161816532196.jpg\"></P>
<P align=center>成都建材展（成都世纪城新会展中心）</P>','2011-05-10 17:45:54','2011-05-10 17:45:54','admin',1400,14,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (30,'艾 格 丽','2011510174755.html',NULL,'../uploadfile/ProdFile/2011061817035452773.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201161817336512.jpg\"></P>','2011-05-10 17:47:55','2011-05-10 17:47:55','admin',1395,14,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (31,'合 室 家','2011510174934.html',NULL,'../uploadfile/ProdFile/2011061816435141394.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201161816449377.jpg\"></P>
<P align=center>成都建博会（成都世纪城新会展中心）</P>','2011-05-10 17:49:34','2011-05-10 17:49:34','admin',1363,14,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (32,'宝 钢','2011510175047.html',NULL,'../uploadfile/ProdFile/2011061816390412856.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011618163919861.jpg\"></P>
<P align=center>成都建材展（成都世纪城新会展中心）</P>','2011-05-10 17:50:47','2011-05-10 17:50:47','admin',1505,14,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (33,'专柜 罗比罗丹','2011510175209.html',NULL,'../uploadfile/ProdFile/2011051017515011274.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/201151017526795.jpg\" border=0></P>','2011-05-10 17:52:09','2011-05-10 17:52:09','admin',1504,15,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (34,'专柜 盛世昌南','2011510175301.html',NULL,'../uploadfile/ProdFile/2011051017525012334.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510175259681.jpg\" border=0></P>','2011-05-10 17:53:01','2011-05-10 17:53:01','admin',1827,15,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (35,'专柜 康宁','2011510180613.html',NULL,'../uploadfile/ProdFile/2011051018053170835.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/201151018559769.jpg\" border=0><BR><BR><IMG src=\"/UploadFile/ProdFile/201151018542377.jpg\" border=0><BR><BR></P>','2011-05-10 18:06:13','2011-05-10 18:06:13','admin',1473,15,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (36,'展示柜 澳门','2011510180842.html',NULL,'../uploadfile/ProdFile/2011051018080989179.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/201151018817807.jpg\" border=0><BR><BR><IMG src=\"/UploadFile/ProdFile/201151018833143.jpg\" border=0></P>','2011-05-10 18:08:42','2011-05-10 18:08:42','admin',1382,15,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (37,'群光商场柜子','2011510181026.html',NULL,'../uploadfile/ProdFile/2011051018094921263.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/201151018957709.jpg\" border=0><BR><BR><IMG src=\"/UploadFile/ProdFile/2011510181015286.jpg\" border=0></P>','2011-05-10 18:10:26','2011-05-10 18:10:26','admin',1698,15,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (38,'书 柜','2011510181146.html',NULL,'../uploadfile/ProdFile/2011051018112944897.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510181142154.jpg\" border=0></P>','2011-05-10 18:11:46','2011-05-10 18:11:46','admin',1389,15,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (39,'南玻展示柜','2011510181233.html',NULL,'../uploadfile/ProdFile/2011051018123157608.jpg','','','','','2011-05-10 18:12:33','2011-05-10 18:12:33','admin',1438,15,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (40,'贝莉雅黛','2011510181328.html',NULL,'../uploadfile/ProdFile/2011051018132226488.jpg','','','','','2011-05-10 18:13:28','2011-05-10 18:13:28','admin',1417,15,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (41,'网货交易会 淘宝网','2011510181819.html',NULL,'../uploadfile/ProdFile/2011051018173768289.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510181751305.jpg\" border=0><BR><BR><IMG src=\"/UploadFile/ProdFile/201151018188691.jpg\" border=0></P>','2011-05-10 18:18:19','2011-05-10 18:18:19','admin',1113,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (42,'气体展 重庆中容','2011510181915.html',NULL,'../uploadfile/ProdFile/2011051018190095381.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510181912202.jpg\" border=0></P>','2011-05-10 18:19:15','2011-05-10 18:19:15','admin',1175,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (43,'气体展 易会','2011510181956.html',NULL,'../uploadfile/ProdFile/2011051018195199693.jpg','','','','','2011-05-10 18:19:56','2011-05-10 18:19:56','admin',1176,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (44,'西博会 澳门','2011510182212.html',NULL,'../uploadfile/ProdFile/2011051018211465769.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011510182141901.jpg\"><BR><BR><IMG border=0 src=\"/UploadFile/ProdFile/2011510182123258.jpg\"><BR><BR><IMG border=0 src=\"/UploadFile/ProdFile/2011510182154264.jpg\"><BR></P>','2011-05-10 18:22:12','2011-05-10 18:22:12','admin',1379,16,1,0,0,0,0,1,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (45,'西博会 自贡','2011510182411.html',NULL,'../uploadfile/ProdFile/2011051018232182264.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011510182338348.jpg\"><BR><BR><IMG border=0 src=\"/UploadFile/ProdFile/2011510182356321.jpg\"></P>
<P align=center>&nbsp;&nbsp; 四川经济日报 四川经济网成都讯 （记者 李远驰 杨桂兰）距离十一届西博会开幕还有一天时间，自贡市3个展区和四川高新技术机器人展参展展位布展工作已全部就绪。这是记者今（20）日下午从成都世纪城会展中心现场了解并发回的报道。 </P>
<P align=center><IMG border=0 src=\"http://zg.scjjrb.com/upfile/20101020192913854.jpg\"><BR><SPAN style=\"COLOR: #0000ff; FONT-SIZE: 15px\">自贡展区</SPAN></P>
<P>&nbsp;&nbsp;&nbsp; 本届西博会自贡市共设立了工业、农业、旅游三个展区，并参加了省科技厅主办的高新技术机器人展。从本月16日起，各展区工作人员就开始了入场布展，每天加班加点开展工作，到今日下午4时为止，展区布展工作已经全部完成。</P>
<P align=center><IMG border=0 src=\"http://zg.scjjrb.com/upfile/20101020192932614.jpg\"><BR><SPAN style=\"COLOR: #0000ff; FONT-SIZE: 15px\">自贡市委常委、秘书长谭豹（右一），副市长戴绍泉（右二）检查自贡各展区准备工作情况</SPAN></P>
<P>&nbsp;&nbsp;&nbsp; 今日下午，自贡市委常委、秘书长谭豹，副市长戴绍泉，市委副秘书长骆玲，在市投资促进局党组书记杨大全，副局长黄艳峰，市经济信息委主任唐宏，副主任陶勇，市农牧业局副局长张泽忠的陪同下检查了自贡各展区准备工作情况，充分肯定了自贡展区布展工作取得的成绩，特别是自贡工业展区和农业展区相比往届西博会布展更有气势、突出了自贡特色，并对布展及正式展出等相关工作提出了要求。</P>
<P align=center><IMG border=0 src=\"http://zg.scjjrb.com/upfile/20101020192954954.jpg\"><BR><SPAN style=\"COLOR: #0000ff\"><SPAN style=\"COLOR: #0000ff; FONT-SIZE: 15px\">自贡市委常委、秘书长谭豹（右一）在<FONT style=\"COLOR: #0000ff; FONT-SIZE: 15px\">农业展区内检查</FONT></SPAN><BR></SPAN></P>
<P align=center><SPAN style=\"COLOR: #0000ff\"><IMG border=0 src=\"http://zg.scjjrb.com/upfile/20101020193019917.jpg\"><BR><SPAN style=\"COLOR: #0000ff; FONT-SIZE: 15px\">副市长戴绍泉（左二）在<FONT style=\"COLOR: #0000ff; FONT-SIZE: 15px\">市经济信息委主任唐宏（左三）的陪同下在工业展区检查准备情况</FONT></SPAN></SPAN></P>
<P align=left><SPAN style=\"COLOR: #0000ff\"><SPAN style=\"COLOR: #0000ff; FONT-SIZE: 15px\">&nbsp;&nbsp;&nbsp; </SPAN></SPAN>以“推进清洁生产、建设环保城市”为主题的自贡工业展区位于成都世纪城会展中心优势产业馆，展区风格简洁清爽，抽象的恐龙造型极具地方特色，突出了节能环保工业发展的特点。在200平方米展区内，高新技术产业园区、富顺晨光工业园区以及东锅、华西能源、久大、川润等23户企业通过图片、展板、电子咨询台、视频资料等形式向观展客人展示和介绍自贡工业经济，特别是节能环保产业的发展情况。</P>
<P align=center><IMG border=0 src=\"http://zg.scjjrb.com/upfile/20101020193114504.jpg\"><BR><SPAN style=\"COLOR: #0000ff; FONT-SIZE: 15px\">工人们在做开展前的最后准备工作之一</SPAN></P>
<P align=center><SPAN style=\"COLOR: #0000ff\"><IMG border=0 src=\"http://zg.scjjrb.com/upfile/20101020193133125.jpg\"><BR><SPAN style=\"COLOR: #0000ff; FONT-SIZE: 15px\">工人们在做开展前的最后准备工作之二</SPAN></SPAN></P>
<P>&nbsp;&nbsp;&nbsp; 自贡农业展区位于农业馆，在50多平方米的展区内，香辣酱、火边子牛肉、茶叶、香柚等来自30余家农产品企业生产的自贡特产100多个系列农产品参展，展览将采用宣传片、画册、产品展示相结合的方式，大力宣传自贡农业产业发展。</P>
<P align=center><SPAN style=\"FONT-SIZE: 15px\"><IMG border=0 src=\"http://zg.scjjrb.com/upfile/20101020193200384.jpg\"><BR><SPAN style=\"COLOR: #0000ff; FONT-SIZE: 15px\">自贡农业展区</SPAN></SPAN></P>','2011-05-10 18:24:11','2011-05-10 18:24:11','admin',4000,16,2,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (46,'成都电子展','2011510182508.html',NULL,'../uploadfile/ProdFile/2011051018245542066.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/201151018253374.jpg\" border=0></P>','2011-05-10 18:25:08','2011-05-10 18:25:08','admin',1077,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (47,'成都电子展','2011510182548.html',NULL,'../uploadfile/ProdFile/2011051018254479106.jpg','','','','','2011-05-10 18:25:48','2011-05-10 18:25:48','admin',1089,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (48,'2010成都秋季房交会','2011510182724.html',NULL,'../uploadfile/ProdFile/2011051018264439106.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/201151018279732.jpg\" border=0><BR><BR><IMG src=\"/UploadFile/ProdFile/2011510182657249.jpg\" border=0><BR><BR></P>','2011-05-10 18:27:24','2011-05-10 18:27:24','admin',1039,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (49,'2010成都秋季房交会','2011510182841.html',NULL,'../uploadfile/ProdFile/2011051018283031678.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510182838936.jpg\" border=0></P>','2011-05-10 18:28:41','2011-05-10 18:28:41','admin',1062,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (50,'西博会 中国电信','2011510182932.html',NULL,'../uploadfile/ProdFile/2011051018291996629.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510182929361.jpg\" border=0></P>','2011-05-10 18:29:32','2011-05-10 18:29:32','admin',1167,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (51,'成都房交会','2011510183102.html',NULL,'../uploadfile/ProdFile/2011051018301881604.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510183031745.jpg\" border=0><BR><BR><IMG src=\"/UploadFile/ProdFile/2011510183043410.jpg\" border=0></P>','2011-05-10 18:31:02','2011-05-10 18:31:02','admin',1050,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (52,'成都房交会','2011510183224.html',NULL,'../uploadfile/ProdFile/2011051018321588472.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510183221603.jpg\" border=0></P>','2011-05-10 18:32:24','2011-05-10 18:32:24','admin',1061,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (53,'房交会 空港晶座','2011510183324.html',NULL,'../uploadfile/ProdFile/2011051018331557957.jpg','','','','','2011-05-10 18:33:24','2011-05-10 18:33:24','admin',1112,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (54,'绵阳房交会','2011510183959.html',NULL,'../uploadfile/ProdFile/2011051018394768065.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510183957562.jpg\" border=0></P>','2011-05-10 18:39:59','2011-05-10 18:39:59','admin',1110,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (55,'狄诺合众','2011510184155.html',NULL,'../uploadfile/ProdFile/2011051018405125638.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/201151018413941.jpg\" border=0><BR><BR><IMG src=\"/UploadFile/ProdFile/2011510184128919.jpg\" border=0><BR><BR></P>','2011-05-10 18:41:55','2011-05-10 18:41:55','admin',1101,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (56,'民营图书','2011510184330.html',NULL,'../uploadfile/ProdFile/2011051018430551434.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510184313668.jpg\" border=0><BR><BR><IMG src=\"/UploadFile/ProdFile/2011510184326963.jpg\" border=0></P>','2011-05-10 18:43:30','2011-05-10 18:43:30','admin',1074,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (57,'北京洪恩','2011510184424.html',NULL,'../uploadfile/ProdFile/2011051018441264398.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510184421435.jpg\" border=0></P>','2011-05-10 18:44:24','2011-05-10 18:44:24','admin',1065,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (58,'华龙五金','2011510184511.html',NULL,'../uploadfile/ProdFile/2011051018450037749.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/201151018458304.jpg\" border=0></P>','2011-05-10 18:45:11','2011-05-10 18:45:11','admin',1120,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (59,'南玻集团','2011510184646.html',NULL,'../uploadfile/ProdFile/2011051018460066256.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510184617783.jpg\" border=0><BR><BR><IMG src=\"/UploadFile/ProdFile/2011510184640790.jpg\" border=0></P>','2011-05-10 18:46:46','2011-05-10 18:46:46','admin',1235,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (60,'北京博尔乐','2011510184832.html',NULL,'../uploadfile/ProdFile/2011051018472693199.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510184736311.jpg\" border=0><BR><BR><IMG src=\"/UploadFile/ProdFile/2011510184749423.jpg\" border=0></P>','2011-05-10 18:48:32','2011-05-10 18:48:32','admin',1091,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (61,'菊乐牛奶','2011510185018.html',NULL,'../uploadfile/ProdFile/2011051018494416901.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510184957729.jpg\" border=0><BR><BR><IMG src=\"/UploadFile/ProdFile/2011510185013282.jpg\" border=0></P>','2011-05-10 18:50:18','2011-05-10 18:50:18','admin',1259,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (62,'金 冠 园','2011510185115.html',NULL,'../uploadfile/ProdFile/2011051018510374067.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/2011510185113768.jpg\" border=0></P>','2011-05-10 18:51:15','2011-05-10 18:51:15','admin',1096,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (63,'北京名饮','2011510185204.html',NULL,'../uploadfile/ProdFile/2011051018515052632.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/201151018521784.jpg\" border=0></P>','2011-05-10 18:52:04','2011-05-10 18:52:04','admin',1217,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (64,'广东大和味','2011510185310.html',NULL,'../uploadfile/ProdFile/2011051018525125712.jpg','','','','<P align=center><IMG src=\"/UploadFile/ProdFile/201151018534749.jpg\" border=0></P>','2011-05-10 18:53:10','2011-05-10 18:53:10','admin',1254,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (65,'赛 磊 那','2011510185412.html',NULL,'../uploadfile/ProdFile/2011061816331028990.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011618163243571.jpg\"></P>','2011-05-10 18:54:12','2011-05-10 18:54:12','admin',1157,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (66,'浙江泰源机床','2011510185507.html',NULL,'../uploadfile/ProdFile/2011051018550086663.jpg','','','','','2011-05-10 18:55:07','2011-05-10 18:55:07','admin',1085,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (67,'上海开维喜','2011510185548.html',NULL,'../uploadfile/ProdFile/2011061816283644415.jpg','','','','','2011-05-10 18:55:48','2011-05-10 18:55:48','admin',1102,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (68,'四川省农业厅','2011510185723.html',NULL,'../uploadfile/ProdFile/2011061816215512563.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011618162453437.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
<P align=center><STRONG>第十届中国西部国际博览会设农业专馆&nbsp;产品琳琅满目扯眼球</STRONG></P>
<P align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=100>
<TBODY>
<TR>
<TD>&nbsp;</TD></TR></TBODY></TABLE>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"93%\" align=center>
<TBODY>
<TR>
<TD class=high>
<P>　　10月16日第十届中国西部国际博览会在成都隆重开。本届西博会规模空前，逾5万名来自88个国家和地区的嘉宾和客商参会参展。大会主展场设在成都世纪城会展中心，展览面积12万平方米。今年西博会专门为其重头戏西部农交会开辟6号专馆，专馆面积达1.15万平方米。在专馆中央核心区，一个20平方米的古朴庭院很扯眼球，门楣上一条横幅写着“原生态农产品展销区”。来自阿坝、凉山地区的高原牦牛肉，以及安岳、西充县的有机苹果猪肉和有机牛奶猪肉等优质特色农产品，让参观者爱不释手。</P>
<P>　　省畜牧食品局杨昌明、副局长宾军宜等于16日参观了畜产品产区，对本次参展的优质畜产品给予了高度评价。据昌明局长介绍，本次西部农交会是今年四川省举办的一次高规格农牧行业盛会，将充分展示四川特色优质畜产品、展示四川现代畜牧业发展成就。通过搭建展示优质畜产品平台，为我省特色畜产品走向国内外市场，开辟畅通渠道。据悉，西博会和农产品交易会期间，农业专馆将举办特色农畜产品展示展销、采购洽谈、农业投资项目签约、企业专题推介等多项活动。我省省级农口部门共落实参展企业达172家，规模占到展区总面积的一半。</P>
<P>　　来源：四川畜牧食品信息网</P></TD></TR></TBODY></TABLE></P>','2011-05-10 18:57:23','2011-05-10 18:57:23','admin',1293,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (69,'北京金色农华','2011510185827.html',NULL,'../uploadfile/ProdFile/2011051018582230078.jpg','','','','','2011-05-10 18:58:27','2011-05-10 18:58:27','admin',1137,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (70,'成都体博会 729','2011617185238.html',NULL,'../uploadfile/ProdFile/2011061718495284760.jpg','','成都体博会','','<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011617185118594.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011617185130943.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011617185140518.jpg\"></P>
<P align=center>2011年成都体博会（成都世纪城新会展中心）</P>','2011-06-17 18:52:38','2011-06-17 18:52:38','admin',1428,16,3,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (71,'成都体博会 海尔斯','2011617185746.html',NULL,'../uploadfile/ProdFile/2011061718550681283.jpg','','成都体博会 成都展览展示 成都展台制作  成都展览制作','','<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011617185649513.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201161718571635.jpg\"></P>
<P align=center>成都体博会（成都世纪城新会展中心）</P>','2011-06-17 18:57:46','2011-06-17 18:57:46','admin',1315,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (72,'成都房交会 合能地产','2011617190150.html',NULL,'../uploadfile/ProdFile/2011061718592249231.jpg','','成都房交会 成都展览展示 成都展台制作  成都展览制作  成都展览工厂  成都展览制作工厂','','<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20116171913207.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201161719114208.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201161719126641.jpg\"></P>
<P align=center>成都房交会（成都世纪城新会展中心）</P>','2011-06-17 19:01:50','2011-06-17 19:01:50','admin',1207,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (73,'体博会 瑞莱克斯','2011617190427.html',NULL,'../uploadfile/ProdFile/2011061719022438448.jpg','','成都体博会 成都展览展示 成都展台制作  成都展览制作  成都展览制作工厂','','<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201161719349421.jpg\"></P>
<P align=center>成都体博会（成都世纪城新会展中心）</P>','2011-06-17 19:04:27','2011-06-17 19:04:27','admin',1345,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (74,'房交会 华力房产','2011618102552.html',NULL,'../uploadfile/ProdFile/2011061810224717739.jpg','','房交会展台制作  成都展览展示 成都展览展示制作工厂 成都展览制作工厂','','<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011618102350978.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011618102412990.jpg\"></P>
<P align=center>2011房交会（广汉雒城门口.房湖公园）</P>','2011-06-18 10:25:52','2011-06-18 10:25:52','admin',1339,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (75,'成都房交会 合能地产','2011618102906.html',NULL,'../uploadfile/ProdFile/2011061810273747611.jpg','','成都房交会 成都展览展示制作工厂 成都展台制作工厂','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011618102839401.jpg\"></P>
<P align=center>成都房交会（成都世纪城新会展中心）</P>','2011-06-18 10:29:06','2011-06-18 10:29:06','admin',1121,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (76,'动物保健','2011618103502.html',NULL,'../uploadfile/ProdFile/2011061810330767114.jpg','','成都展台制作 成都展台搭建','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011618103335569.jpg\"></P>
<P align=center>成都动物保健展（成都世纪城新会展中心）</P>','2011-06-18 10:35:02','2011-06-18 10:35:02','admin',1796,11,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (92,'耳鼻喉','20111030143230.html',NULL,'../uploadfile/ProdFile/2011103014310146856.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20111030143119430.jpg\"></P>
<P align=center>成都世纪城会议中心</P>','2011-10-30 14:32:30','2011-10-30 14:32:30','admin',1461,11,99,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (93,'稀杰 西博会','20111030143531.html',NULL,'../uploadfile/ProdFile/2011103014334961958.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011103014347194.jpg\"></P>
<P align=center>第十二届西博会（成都世纪城新会展中心）</P>
<P align=center>&nbsp;</P>','2011-10-30 14:35:31','2011-10-30 14:35:31','admin',1270,13,99,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (94,'澳门 西博会','20111030143952.html',NULL,'../uploadfile/ProdFile/2011103014385074794.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20111030143920753.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20111030143943258.jpg\"></P>
<P align=center>第十二届西博会（成都世纪城新会展中心）</P>','2011-10-30 14:39:52','2011-10-30 14:39:52','admin',1558,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (95,'绵阳高新区','20111030144215.html',NULL,'../uploadfile/ProdFile/2011103014410842568.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20111030144145426.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011103014421989.jpg\"></P>
<P align=center>第十二届西博会（成都世纪城新会展中心）</P>','2011-10-30 14:42:15','2011-10-30 14:42:15','admin',1487,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (96,'九洲集团','20111030144939.html',NULL,'../uploadfile/ProdFile/2011103014485575259.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20111030144910129.jpg\"></P>
<P align=center>第十二届西博会（成都世纪城新会展中心）</P>','2011-10-30 14:49:39','2011-10-30 14:49:39','admin',1207,16,99,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (97,'新疆 农博会','20111030145655.html',NULL,'../uploadfile/ProdFile/2011103014505248218.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011103014521843.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20111030145522477.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20111030145555372.jpg\"></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011103014565301.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20111030145615913.jpg\"></P>
<P align=center>第九届国际农产品博览会（成都世纪城新会展中心）</P>','2011-10-30 14:56:55','2011-10-30 14:56:55','admin',1549,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (98,'农博会 广东','20111030145803.html',NULL,'../uploadfile/ProdFile/2011103014571925203.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20111030145735411.jpg\"></P>
<P align=center>第九届国际农产品博览会（成都世纪城新会展中心）</P>','2011-10-30 14:58:03','2011-10-30 14:58:03','admin',1318,16,99,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (99,'海洋岛','20111030150520.html',NULL,'../uploadfile/ProdFile/2011103014584480788.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011103015439166.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011103015450803.jpg\"></P>
<P align=center>第九届国际农产品博览会（成都世纪城新会展中心）</P>','2011-10-30 15:05:20','2011-10-30 15:05:20','admin',1580,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (100,'电视节 华创','2011111895656.html',NULL,'../uploadfile/ProdFile/2011111809532886343.jpg','','电视节展台制作，成都展台搭建，成都展览展示制作','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011111895518168.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011111895533875.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011111895558907.jpg\"></P>
<P align=center>2011成都电视节展台制作搭建（成都世纪城新会展中心）</P>','2011-11-18 09:56:56','2011-11-18 09:56:56','admin',1544,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (101,'格非科技','20111118100248.html',NULL,'../uploadfile/ProdFile/2011111809594173504.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201111181009128.jpg\"></P>
<P align=center>成都电视节展台装修（成都世纪城新会展中心）</P>','2011-11-18 10:02:48','2011-11-18 10:02:48','admin',1281,16,99,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (102,'电视节 AVS','20111118100851.html',NULL,'../uploadfile/ProdFile/2011111810035728109.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201111181050614.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2011111810534507.jpg\"></P>
<P align=center>成都电视节展览展示制作（成都世纪城新会展中心）</P>','2011-11-18 10:08:51','2011-11-18 10:08:51','admin',1626,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (103,'汉威','20111118101229.html',NULL,'../uploadfile/ProdFile/2011111810102697154.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20111118101038502.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20111118101047581.jpg\"></P>
<P align=center>燃气展（成都世纪城新会展中心）</P>','2011-11-18 10:12:29','2011-11-18 10:12:29','admin',1184,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (104,'上海海骄','20111118101340.html',NULL,'../uploadfile/ProdFile/2011111810125949803.jpg','','','','<P align=center>燃气展（成都世纪城新会展中心）</P>','2011-11-18 10:13:40','2011-11-18 10:13:40','admin',1194,16,100,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (105,'糖酒会 东莞','201241150441.html',NULL,'../uploadfile/ProdFile/2012040115012297137.jpg','','糖酒会，东莞，东莞政府','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20124115226465.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20124115240444.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012411531925.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20124115321298.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20124115336286.jpg\"></P>
<P align=center>2012年成都糖酒会东莞茶山展团（成都世纪城新会展中心）</P>','2012-04-01 15:04:41','2012-04-01 15:04:41','admin',1657,13,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (106,'糖酒会 叙府酒','201241150938.html',NULL,'../uploadfile/ProdFile/2012040115063373607.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20124115754290.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20124115810345.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20124115819608.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20124115836792.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20124115846226.jpg\"></P>
<P align=center>2012成都糖酒会叙府酒业（成都世纪城新会展中心）</P>','2012-04-01 15:09:38','2012-04-01 15:09:38','admin',1790,13,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (107,'糖酒会 东莞茶山','201241151312.html',NULL,'../uploadfile/ProdFile/2012040115111974516.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20124115129709.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201241151219865.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201241151228169.jpg\"></P>
<P align=center>2012年成都第86届春季糖酒会（成都世纪城新会展中心）</P>','2012-04-01 15:13:12','2012-04-01 15:13:12','admin',1158,16,96,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (108,'糖酒会 迪士尼','201241151607.html',NULL,'../uploadfile/ProdFile/2012040115143248222.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20124115150159.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20124115158299.jpg\"></P>
<P align=center>2012成都春季糖酒会（成都西藏饭店）</P>','2012-04-01 15:16:07','2012-04-01 15:16:07','admin',1231,16,95,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (109,'糖酒会 粤畅','201241152057.html',NULL,'../uploadfile/ProdFile/2012040115183618312.jpg','','','','<P align=center>2012成都春季糖酒会东莞<FONT face=Verdana>粤畅公司（成都世纪城新会展中心）</FONT></P>','2012-04-01 15:20:57','2012-04-01 15:20:57','admin',1529,13,95,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (110,'接待台','2012425175643.html',NULL,'../uploadfile/ProdFile/2012042517551135612.jpg','','','','<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>','2012-04-25 17:56:43','2012-04-25 17:56:43','admin',1292,15,99,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (111,'精品展示柜','2012425175817.html',NULL,'../uploadfile/ProdFile/2012042517574591406.jpg','','','','','2012-04-25 17:58:17','2012-04-25 17:58:17','admin',1282,15,98,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (112,'中德机械','2012425180122.html',NULL,'../uploadfile/ProdFile/2012042517592343402.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012425175943489.jpg\"></P>
<P align=center>阀门展（2012成都世纪城新会展中心）</P>','2012-04-25 18:01:22','2012-04-25 18:01:22','admin',1587,14,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (113,'金悠然义齿','2012425181134.html',NULL,'../uploadfile/ProdFile/2012042518071287243.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201242518733271.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20124251882562.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201242518816935.jpg\"></P>
<P align=center>2012西部（成都）口腔医学学术展览会（成都世纪城新会展中心）</P>','2012-04-25 18:11:34','2012-04-25 18:11:34','admin',1738,11,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (114,'安防展  录林王','2012425181500.html',NULL,'../uploadfile/ProdFile/2012042518142099385.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012425181433892.jpg\"></P>
<P align=center>2012成都安防展展台制作搭建（成都世纪城新会展中心）</P>','2012-04-25 18:15:00','2012-04-25 18:15:00','admin',1653,16,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (115,'房交会 圣沅房产','2012514160419.html',NULL,'../uploadfile/ProdFile/2012051416003086535.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201251416140425.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201251416152831.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20125141627711.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201251416217648.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201251416229943.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201251416241953.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201251416252909.jpg\"></P>
<P align=center>2012年成都春季房交会（成都世纪城新会展中心）</P>','2012-05-14 16:04:19','2012-05-14 16:04:19','admin',1736,16,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (116,'禾邦集团','2012525121535.html',NULL,'../uploadfile/ProdFile/2012052512125670574.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012525121337179.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012525121345493.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012525121353288.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201252512140132.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201252512149960.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012525121417251.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012525121425680.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012525121432975.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012525121441738.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012525121449253.jpg\"></P>
<P align=center>禾邦集团展厅装修</P>','2012-05-25 12:15:35','2012-05-25 12:15:35','admin',1763,16,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (117,'中小企业展  吉林','2012624160640.html',NULL,'../uploadfile/ProdFile/2012062416161431093.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012624161626719.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012624161639407.jpg\"></P>
<P align=center><FONT color=#000000>第七届APEC中小企业技术交流暨展览会（成都世纪城新会展中心）</FONT></P>','2012-06-24 16:06:40','2012-06-24 16:06:40','admin',1908,16,0,1,0,0,1,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (118,'青洽会 浙江','2012624162251.html',NULL,'../uploadfile/ProdFile/2012062416200328003.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012624162046222.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012624162059475.jpg\"></P>
<P align=center><FONT color=#000000>2012青海绿色经济投资贸易洽谈会（青海西宁国际会展中心）</FONT></P>
<P align=left>相关新闻连接：<FONT face=Verdana>http://roll.sohu.com/20120611/n345244897.shtml</FONT></P>
<P align=left>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本报西宁6月10日电&nbsp;以“开放合作、绿色发展”为主题的“2012中国·青海绿色经济投资贸易洽谈会”，今天在青海西宁国际会展中心举行。副省长陈加元出席开幕仪式，参加了青海省2012年对口援青（帮扶）暨经济技术合作恳谈会。<BR><BR>　　据了解，作为对口援青主要省市之一，今年是我省第二次组织参展“青洽会”。我省本次参展以“宣传浙江、扩大影响，展示商品、推进合作”为目的，集中展示浙江经济社会发展和对口援青情况，拓展浙江产品市场，同时开展投资洽谈、贸易合作等活动。<BR><BR>　　据不完全统计，近年来浙江省为青海省引进项目13个，签约资金48亿元。已落地实施新能源、基础设施建设等项目9个，总投资8.9亿元。<BR><BR>　　作者：颜伟杰 </P>','2012-06-24 16:22:51','2012-06-24 16:22:51','admin',1910,16,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (119,'广汉康达食品','2012624163428.html',NULL,'../uploadfile/ProdFile/2012062416310819103.jpg','','','','<P align=center>2012年成都第四届端午食品博览会暨粽子团购节（成都世纪城新会展中心）</P>','2012-06-24 16:34:28','2012-06-24 16:34:28','admin',1465,13,92,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (120,'APEC 辽宁','2012624163720.html',NULL,'../uploadfile/ProdFile/2012062416355545992.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012624163611454.jpg\"></P>
<P align=center><FONT color=#000000>第七届APEC中小企业技术交流暨展览会（成都世纪城新会展中心）</FONT></P>','2012-06-24 16:37:20','2012-06-24 16:37:20','admin',1178,16,93,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (121,'渝洽会 广州','2012716140855.html',NULL,'../uploadfile/ProdFile/2012071614074683711.jpg','','','','<P align=center>重庆渝洽会广州展台制作搭建</P>','2012-07-16 14:08:55','2012-07-16 14:08:55','admin',1272,16,92,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (122,'成都汽车展','201292155809.html',NULL,'../uploadfile/ProdFile/2012090215553867717.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201292155624748.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201292155638617.jpg\"></P>
<P align=center>2012成都第十五届汽车展展台制作搭建</P>','2012-09-02 15:58:09','2012-09-02 15:58:09','admin',1582,16,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (123,'成都汽车用品展','201292160439.html',NULL,'../uploadfile/ProdFile/2012090216023069998.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20129216254729.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2012921634444.jpg\"></P>
<P align=center>2012成都汽车用品展&nbsp; 成都展览展示制作</P>','2012-09-02 16:04:39','2012-09-02 16:04:39','admin',1861,16,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (124,'台湾名品展','201292164022.html',NULL,'../uploadfile/ProdFile/2012090216381571152.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201292163836159.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201292163850589.jpg\"></P>
<P align=center>台湾名品展（成都世纪城新会展中心）成都展览制作</P>','2012-09-02 16:40:22','2012-09-02 16:40:22','admin',1829,13,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (125,'精品展柜','201292164324.html',NULL,'../uploadfile/ProdFile/2012090216420921473.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201292164226612.jpg\"></P>
<P align=center>万宝柜&nbsp; 成都展柜制作</P>','2012-09-02 16:43:24','2012-09-02 16:43:24','admin',1234,15,5,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (126,'禅境工坊','201292164750.html',NULL,'../uploadfile/ProdFile/2012090216452639234.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201292164538464.jpg\"></P>
<P align=center>台湾名品展——成都展览展示工程</P>','2012-09-02 16:47:50','2012-09-02 16:47:50','admin',1777,16,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (127,'墨金玉石','201292165011.html',NULL,'../uploadfile/ProdFile/2012090216481248350.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201292164845495.jpg\"><IMG border=0 src=\"/UploadFile/ProdFile/201292164834150.jpg\"></P>
<P align=center>台湾名品展（成都世纪城新会展中心）</P>
<P align=center>&nbsp;</P>','2012-09-02 16:50:11','2012-09-02 16:50:11','admin',2294,16,2,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (128,'九阡酒','2013131201805.html',NULL,'../uploadfile/ProdFile/2013013120154867322.jpg','','糖酒会，成都糖酒会，酒博会','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131201639968.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131201656155.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131201712861.jpg\"></P>
<P align=center>2012贵阳酒博会</P>','2013-01-31 20:18:05','2013-01-31 20:18:05','admin',1554,13,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (129,'城市通卡年会','2013131202725.html',NULL,'../uploadfile/ProdFile/2013013120231061370.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131202356486.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131202417344.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131202430218.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131202456409.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131202533606.jpg\"></P>
<P align=center>保利假日皇冠酒店</P>','2013-01-31 20:27:25','2013-01-31 20:27:25','admin',1460,10,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (130,'城市通卡年会 室外','2013131203100.html',NULL,'../uploadfile/ProdFile/2013013120283854091.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201313120293322.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131202914238.jpg\"></P>
<P align=center>&nbsp;</P>','2013-01-31 20:31:00','2013-01-31 20:31:00','admin',1211,10,50,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (131,'南充','2013131203911.html',NULL,'../uploadfile/ProdFile/2013013120352823033.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201313120360902.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131203622121.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131203639103.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131203720579.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131203735290.jpg\"></P>
<P align=center>2012四川物流展展台制作搭建（成都世纪城新会展中心）</P>','2013-01-31 20:39:11','2013-01-31 20:39:11','admin',2103,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (132,'荣华饼家','2013131204420.html',NULL,'../uploadfile/ProdFile/2013013120423323392.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013131204244344.jpg\"></P>
<P align=center>2012中国食品博览会展位制作搭建（成都世纪城新会展中心）</P>','2013-01-31 20:44:20','2013-01-31 20:44:20','admin',1371,13,95,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (133,'名优展 无锡','201357111226.html',NULL,'../uploadfile/ProdFile/2013050711101778853.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201357111049702.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20135711118922.jpg\"></P>
<P align=center>无锡市名优特产品（贵阳）展销会（贵阳国际会议中心）&nbsp; &nbsp;成都展览展示制作工厂</P>','2013-05-07 11:12:26','2013-05-07 11:12:26','admin',1509,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (134,'门头制作','201357111358.html',NULL,'../uploadfile/ProdFile/2013050711124736519.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201357111313553.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201357111322650.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201357111340397.jpg\"></P>
<P align=center>无锡市名优特产品（贵阳）展销会（贵阳国际会议中心）&nbsp; &nbsp;成都展览展示制作</P>','2013-05-07 11:13:58','2013-05-07 11:13:58','admin',2499,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (135,'名优展开幕式','201357111516.html',NULL,'../uploadfile/ProdFile/2013050711142051352.jpg','','','','<P align=center>无锡市名优特产品（贵阳）展销会（贵阳国际会议中心）&nbsp; &nbsp;成都展览展示制作工厂</P>','2013-05-07 11:15:16','2013-05-07 11:15:16','admin',1203,10,1,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (136,'泸州老窖','201357114420.html',NULL,'../uploadfile/ProdFile/2013050711422956473.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20135711433158.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201357114317742.jpg\"></P>
<P align=center>2013春季糖酒会（成都世纪城新会展中心）成都展览制作工厂</P>','2013-05-07 11:44:20','2013-05-07 11:44:20','admin',1866,13,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (137,'椰岛鹿龟酒','201357114716.html',NULL,'../uploadfile/ProdFile/2013050711450897779.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201357114518755.jpg\"></P>
<P align=center>2013春季糖酒会（成都世纪城新会展中心）成都展览展示制作工厂</P>','2013-05-07 11:47:16','2013-05-07 11:47:16','admin',1607,13,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (138,'中国 山西','201357114954.html',NULL,'../uploadfile/ProdFile/2013050711483125269.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20135711492943.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201357114915554.jpg\"></P>
<P align=center>2013春季糖酒会（成都世纪城新会展中心）成都展览展示制作工厂</P>','2013-05-07 11:49:54','2013-05-07 11:49:54','admin',1237,13,1,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (139,'韩国','201357115226.html',NULL,'../uploadfile/ProdFile/2013050711505725152.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201357115130799.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201357115143257.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20135711520311.jpg\"></P>
<P align=center>2013春季糖酒会（成都世纪城新会展中心）成都展览制作工厂</P>','2013-05-07 11:52:26','2013-05-07 11:52:26','admin',1590,13,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (140,'雅诚德','2013617112321.html',NULL,'../uploadfile/ProdFile/2013061711201431803.jpg','','礼品展制作  展台搭建  成都展览展示','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013617112145907.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013617112120116.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201361711220176.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013617112217532.jpg\"></P>
<P align=center>2013年成都礼品展展台制作（成都世纪城新会展中心）</P>
<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>','2013-06-17 11:23:21','2013-06-17 11:23:21','admin',1497,12,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (141,'雅诚德','2013617112625.html',NULL,'../uploadfile/ProdFile/2013061711235325951.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013617112431779.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013617112447994.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013617112456750.jpg\"></P>
<P align=center>成都展柜制作&nbsp; 瓷器品专柜</P>','2013-06-17 11:26:25','2013-06-17 11:26:25','admin',988,15,3,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (142,'澳能','201388150311.html',NULL,'../uploadfile/ProdFile/2013080815012558106.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20138815141158.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013881523308.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20138815223769.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20138815245399.jpg\"></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013881532330.jpg\"></P>
<P align=center>贵阳毕节澳能空气动力产业园</P>','2013-08-08 15:03:11','2013-08-08 15:03:11','admin',1144,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (143,'青洽会 浙江','201388150625.html',NULL,'../uploadfile/ProdFile/2013080815045880172.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013881558931.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20138815523134.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20138815531120.jpg\"></P>
<P align=center>2013青洽会浙江展位制作搭建</P>','2013-08-08 15:06:25','2013-08-08 15:06:25','admin',1521,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (144,'先驱家私','2013122694447.html',NULL,'../uploadfile/ProdFile/2013122609421054530.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122694238138.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201312269433778.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122694318367.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122694332327.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122694346237.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201312269445596.jpg\"></P>
<P align=center>2013成都家具展展台制作</P>','2013-12-26 09:44:47','2013-12-26 09:44:47','admin',905,12,1,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (145,'农博会 遂宁','2013122695751.html',NULL,'../uploadfile/ProdFile/2013122609512040139.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122695151429.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122695658979.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201312269578314.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122695722237.jpg\"></P>
<P align=center>2013成都农博会展展台制作搭建</P>','2013-12-26 09:57:51','2013-12-26 09:57:51','admin',1366,16,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (146,'怡宝','20131226101048.html',NULL,'../uploadfile/ProdFile/2013122610083972999.jpg','','','','<P align=center><IMG style=\"FILTER: ; WIDTH: 550px; HEIGHT: 331px\" border=0 hspace=0 alt=\"\" src=\"/UploadFile/ProdFile/2013122610915849.jpg\" width=550 height=331></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122610935932.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122610948212.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122610104766.jpg\"></P>
<P align=center>2013连锁加盟展展会制作</P>','2013-12-26 10:10:48','2013-12-26 10:10:48','admin',982,13,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (147,'纬视科技','20131226101459.html',NULL,'../uploadfile/ProdFile/2013122610130049389.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131226101316959.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122610142404.jpg\"></P>
<P align=center>2013成都电视节展位制作搭建</P>','2013-12-26 10:14:59','2013-12-26 10:14:59','admin',634,16,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (148,'连锁加盟展--银商','2013122791218.html',NULL,'../uploadfile/ProdFile/2013122709080953582.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201312279103576.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122791048816.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122791119445.jpg\"></P>
<P align=center>2013成都连锁加盟展 成都展览工厂</P>','2013-12-27 09:12:18','2013-12-27 09:12:18','admin',655,16,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (149,'2013成都连锁加盟展','2013122791642.html',NULL,'../uploadfile/ProdFile/2013122709144994788.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122791537678.jpg\"></P>
<P align=center>2013成都连锁加盟展&nbsp; 成都纯制作工厂</P>','2013-12-27 09:16:42','2013-12-27 09:16:42','admin',624,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (150,'2013成都连锁加盟展','2013122791929.html',NULL,'../uploadfile/ProdFile/2013122709173979420.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122791823150.jpg\"></P>
<P align=center>2013成都连锁加盟展&nbsp; 成都展台搭建工厂</P>','2013-12-27 09:19:29','2013-12-27 09:19:29','admin',635,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (151,'2013成都电视节  四川嘉诚','2013122792310.html',NULL,'../uploadfile/ProdFile/2013122709203754130.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201312279224620.jpg\"></P>
<P align=center>2013成都电视节&nbsp; 成都专业展览制作工厂</P>','2013-12-27 09:23:10','2013-12-27 09:23:10','admin',729,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (152,'2013贵阳苏州商品展  相城','2013122792801.html',NULL,'../uploadfile/ProdFile/2013122709242896681.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122792544737.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122792612441.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122792628725.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122792646374.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122792659342.jpg\"></P>
<P align=center>2013贵阳苏州商品展&nbsp; 贵阳展览展示工厂</P>','2013-12-27 09:28:01','2013-12-27 09:28:01','admin',719,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (153,'中国新疆-亚欧博览会  浙江','2013122793345.html',NULL,'../uploadfile/ProdFile/2013122709294062066.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122793053563.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201312279317610.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122793128339.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122793150831.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122793210860.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122793229918.jpg\"></P>
<P align=center>亚欧博览会&nbsp; 亚欧博览会搭建工厂</P>','2013-12-27 09:33:45','2013-12-27 09:33:45','admin',789,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (154,'新疆亚欧博览会  江西','2013122793855.html',NULL,'../uploadfile/ProdFile/2013122709351691048.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201312279368586.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122793628642.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122793648480.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122793714264.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122793737700.jpg\"></P>
<P align=center>亚欧博览会&nbsp; 展览展示工厂</P>','2013-12-27 09:38:55','2013-12-27 09:38:55','admin',784,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (155,'2013成都国际家具展览会  台湾先驱家私','2013122794600.html',NULL,'../uploadfile/ProdFile/2013122709410263375.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201312279420959.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122794229462.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122794243715.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201312279437210.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122794332117.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122794348724.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201312279446725.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122794426296.jpg\"></P>
<P align=center>成都家具展&nbsp; 成都展台搭建工厂</P>','2013-12-27 09:46:00','2013-12-27 09:46:00','admin',1121,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (156,'2013成都游戏展年会-坦克世界','2013122795108.html',NULL,'../uploadfile/ProdFile/2013122709481214781.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201312279497462.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122794924684.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122794951950.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201312279504456.jpg\"></P>
<P align=center>专业展览展示制作工厂</P>','2013-12-27 09:51:08','2013-12-27 09:51:08','admin',1690,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (157,'中国银行 黄金专柜','2013122795332.html',NULL,'../uploadfile/ProdFile/2013122709513796025.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122795232992.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122795247237.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122795259735.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201312279539693.jpg\"></P>
<P align=center>成都专柜制作工厂</P>','2013-12-27 09:53:32','2013-12-27 09:53:32','admin',1806,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (158,'2013成都西博会-澳门','20131227100045.html',NULL,'../uploadfile/ProdFile/2013122709572328960.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122795757680.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122795817987.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122795841494.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122795857871.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122795921653.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122795942409.jpg\"></P>
<P align=center>成都西博会搭建工厂 首选成都展艺工厂</P>','2013-12-27 10:00:45','2013-12-27 10:00:45','admin',2093,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (159,'2013成都西博会-自贡','20131227100622.html',NULL,'../uploadfile/ProdFile/2013122710024245193.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122710323967.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122710344766.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122710440383.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122710459376.jpg\"></P>
<P align=center>成都西博会制作搭建工厂</P>','2013-12-27 10:06:22','2013-12-27 10:06:22','admin',1852,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (160,'2013成都西博会-广东','20131227100903.html',NULL,'../uploadfile/ProdFile/2013122710074265041.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122710817310.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122710837998.jpg\"></P>
<P align=center>成都展览展示</P>','2013-12-27 10:09:03','2013-12-27 10:09:03','admin',1840,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (161,'2013成都西博会-德阳高新区','20131227101927.html',NULL,'../uploadfile/ProdFile/2013122710165466385.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227101742619.jpg\"><IMG border=0 src=\"/UploadFile/ProdFile/20131227101811779.jpg\"></P>
<P align=center>纯展览、展示、会议活动制作搭建工厂</P>','2013-12-27 10:19:27','2013-12-27 10:19:27','admin',2188,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (162,'2013成都西博会-泸州高新区','20131227103108.html',NULL,'../uploadfile/ProdFile/2013122710285472951.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227102938733.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227102958111.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227103013281.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227103024131.jpg\"></P>
<P align=center>泸州高新区 成都展艺展览工厂</P>','2013-12-27 10:31:08','2013-12-27 10:31:08','admin',2138,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (163,'泛珠三角（9+2）贵阳站-澳门','20131227104947.html',NULL,'../uploadfile/ProdFile/2013122710385645887.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227104014183.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227104035671.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227104054393.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227104117901.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227104130176.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227104531617.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122710468263.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227104626858.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227104645672.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227104657461.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227104711189.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227104726690.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227104748727.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122710481421.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227104817709.jpg\"></P>
<P align=center>9+2贵阳站&nbsp; 贵阳展览展示制作工厂</P>','2013-12-27 10:49:47','2013-12-27 10:49:47','admin',2245,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (164,'成都展览展示 GSD','20131227105450.html',NULL,'../uploadfile/ProdFile/2013122710521228407.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227105332565.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2013122710540497.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20131227105420441.jpg\"></P>
<P align=center>成都展览展示制作工厂</P>','2013-12-27 10:54:50','2013-12-27 10:54:50','admin',2343,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (165,'渝洽会','201535104935.html',NULL,'../uploadfile/ProdFile/2015030510470228957.jpg','','重庆渝洽会','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201535104729496.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201535104741226.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201535104751960.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20153510482703.jpg\"></P>
<P align=center>2014重庆渝洽会</P>','2015-03-05 10:49:35','2015-03-05 10:49:35','admin',1149,16,0,1,0,0,0,1,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (166,'2014韩国优品展','201535105916.html',NULL,'../uploadfile/ProdFile/2015030510554028951.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201535105731411.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201535105750199.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20153510588254.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201535105823854.jpg\"></P>
<P align=center><FONT face=Verdana>2014韩国优品展 (成都世纪城会展中心)</FONT></P>','2015-03-05 10:59:16','2015-03-05 10:59:16','admin',1164,16,0,1,0,0,0,1,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (167,'时装秀T台','201535110403.html',NULL,'../uploadfile/ProdFile/2015030511002422092.jpg','','','','<P align=center><IMG border=0 src=\"http://www.028-zy.com/UploadFile/ProdFile/20153511040276.jpg\"></P>
<P align=center>澳门优品展&nbsp;&nbsp;&nbsp; (成都世纪城新会展中心)</P>','2015-03-05 11:04:03','2015-03-05 11:04:03','admin',1642,10,0,1,0,0,0,1,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (168,'2014澳门优品展','201535110944.html',NULL,'../uploadfile/ProdFile/2015030511064134125.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20153511658448.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20153511715502.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20153511727853.jpg\"></P>
<P align=center>2014澳门优品展</P>','2015-03-05 11:09:44','2015-03-05 11:09:44','admin',1406,16,0,1,0,0,0,1,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (169,'NEC','2015310152400.html',NULL,'../uploadfile/ProdFile/2015031015202045620.jpg','','成都会议布置 会议制作','成都会议布置','<P align=center><IMG border=0 src=\"http://www.028-zy.com/UploadFile/ProdFile/2015310152055234.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"http://www.028-zy.com/UploadFile/ProdFile/201531015216644.jpg\"></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2015310152150275.jpg\"></P>
<P align=center>成都洲际酒店</P>','2015-03-10 15:24:00','2015-03-10 15:24:00','admin',2068,10,0,1,0,0,0,1,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (170,'RuRO展台制作','2015612110359.html',NULL,'../uploadfile/ProdFile/2015061210535419822.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2015612105410658.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2015612105421271.jpg\"></P>
<P align=center>2015成都国际细胞研讨会（成都金韵酒店）</P>','2015-06-12 11:03:59','2015-06-12 11:03:59','admin',1003,11,70,1,0,0,0,1,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (171,'马博士展位制作','2015612110907.html',NULL,'../uploadfile/ProdFile/2015061211054824777.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201561211558503.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201561211624598.jpg\"></P>
<P align=center>2015中国特许展----成都站（成都世纪城新会展中心）</P>
<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>','2015-06-12 11:09:07','2015-06-12 11:09:07','admin',1357,16,68,1,0,0,0,1,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (172,'家具展先驱','2016224135412.html',NULL,'../uploadfile/ProdFile/2016022413500497292.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201622413533687.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016224135324877.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016224135344879.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016224135357854.jpg\"></P>
<P align=center>成都世纪城新会展中心 （2015成都家具展先驱展台制作与搭建）</P>','2016-02-24 13:54:12','2016-02-24 13:54:12','admin',1511,12,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (173,'宜信','2016224135931.html',NULL,'../uploadfile/ProdFile/2016022413565723923.jpg','','成都展览展示制作 成都展台制作 展台搭建','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016224135721418.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016224135733484.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center>重庆会议中心（成都展览展示制作 成都展台制作 展台搭建）</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016224135743749.jpg\"></P>','2016-02-24 13:59:31','2016-02-24 13:59:31','admin',1500,16,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (174,'2016汽配展','2016426171758.html',NULL,'../uploadfile/ProdFile/2016042617124291438.jpg','','','','<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016426171312358.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016426171328401.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016426171337146.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016426171344783.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016426171351556.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016426171358854.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016426171410289.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016426171418322.jpg\"></P>
<P align=center>2016成都国际汽车零配部件展览会&nbsp;&nbsp; 成都展台制作搭建&nbsp;&nbsp;&nbsp; </P>
<P align=center>展台制作搭建地址：成都世纪城新会展中心</P>','2016-04-26 17:17:58','2016-04-26 17:17:58','admin',1304,16,0,1,0,0,0,1,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (175,'2016渝洽会','2016725201025.html',NULL,'../uploadfile/ProdFile/2016072520051556926.jpg','','','','<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201672520552595.jpg\"></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201672520610365.jpg\"></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016725202011467.jpg\"></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201672520721992.jpg\"></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201672520740854.jpg\"></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201672520631951.jpg\"></P>
<P align=center>成都展艺展览制作工厂为渝洽会广安展台制作搭建</P>
<P align=center>2016渝洽会（重庆悦来国际会议中心）</P>
<P align=center>&nbsp;</P>','2016-07-25 20:10:25','2016-07-25 20:10:25','admin',1265,16,0,1,0,0,1,1,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (176,'万源展厅','2016831151345.html',NULL,'../uploadfile/ProdFile/2016083115103566958.jpg','','展厅制作 展厅装修','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016831151054664.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016831151130691.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016831151155417.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016831151213953.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016831151222504.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016831151232555.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016831151241547.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016831151251547.jpg\"></P>
<P align=center>展厅制作 展厅装修</P>','2016-08-31 15:13:45','2016-08-31 15:13:45','admin',1156,15,0,1,0,0,1,1,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (177,'万达展厅','201695135257.html',NULL,'../uploadfile/ProdFile/2016090513494327620.jpg','','','','<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20169513518582.jpg\"></P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201695135047385.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201695135059617.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201695135133610.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201695135656692.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20169513577249.jpg\"></P>
<P align=left>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 成都展艺展览展示制作工厂致力于四川成都展览展示制作，并提供展厅装修、四川成都会议布置、四川成都展台制作、成都展览展示、展示柜制作等多种优质服务，是成都展会制作的专业厂家。也提供省外服务，如重庆的渝洽会、新疆的亚欧博览会、贵阳酒博会、西宁的青洽会等等。</P>
<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>','2016-09-05 13:52:57','2016-09-05 13:52:57','admin',1147,15,0,1,0,0,0,1,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (178,'万象城周年庆','2016101095022.html',NULL,'../uploadfile/ProdFile/2016101009454590054.jpg','','','','<P align=center><IMG border=0 align=middle src=\"/UploadFile/ProdFile/2016101094624695.jpg\"></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016101094643724.jpg\"></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016101094656746.jpg\"></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/201610109476915.jpg\"></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016101094716844.jpg\"></P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016101094724543.jpg\"></P>
<P align=center>重庆万象城2周年庆活动&nbsp; </P>
<H1 style=\"TEXT-ALIGN: center; PADDING-BOTTOM: 0px; WIDOWS: 1; TEXT-TRANSFORM: none; BACKGROUND-COLOR: rgb(255,255,255); FONT-VARIANT: normal; FONT-STYLE: normal; TEXT-INDENT: 0px; MARGIN: 0px 0px 30px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; FONT-FAMILY: \'Microsoft Yahei\', Simsun; WHITE-SPACE: normal; LETTER-SPACING: normal; COLOR: rgb(51,51,51); FONT-SIZE: 24px; FONT-WEIGHT: normal; WORD-SPACING: 0px; PADDING-TOP: 0px; -webkit-text-stroke-width: 0px\">重庆万象城2周年庆 ·星光熠熠闪耀全城 陈坤、好妹妹乐队、苏运莹助燃庆典</H1>','2016-10-10 09:50:22','2016-10-10 09:50:22','admin',1214,10,0,1,0,0,1,1,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (179,'网络视听 哔哩','20161220170836.html',NULL,'../uploadfile/ProdFile/2016122017010250723.jpg','','','','<P align=center><IMG border=0 align=middle src=\"/UploadFile/ProdFile/2016122017121869.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016122017143651.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016122017157855.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2016122017211721.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=left>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2016年12月8日第四届中国网络视听大会在成都世纪城会展中心顺利召开，成都展艺展览展示制作工厂为上海哔哩哔哩文化传播有限公司精心制作豪华展台，使得展台在整个展场光彩夺目。</P>','2016-12-20 17:08:36','2016-12-20 17:08:36','admin',1051,16,0,1,0,0,0,0,NULL,'',NULL,NULL,NULL);
INSERT INTO `tb_pro` VALUES (180,'意凡','20171014172334.html',NULL,'../uploadfile/ProdFile/2017101417064313636.jpg','','','','<P align=center>2017年成都家具展意凡展位制作</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20171014172012411.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/2017101417212489.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20171014172122683.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20171014172137391.jpg\"></P>
<P align=center>&nbsp;</P>
<P align=center><IMG border=0 src=\"/UploadFile/ProdFile/20171014172153564.jpg\"></P>
<P align=center>成都展艺展览制作工厂提供各种展会展台制作</P>','2017-10-14 17:23:34','2017-10-14 17:23:34','admin',595,12,0,0,0,0,0,0,NULL,'',NULL,NULL,NULL);

DELETE FROM tb_screen;

DELETE FROM tb_sql;
INSERT INTO `tb_sql` VALUES (102,'20190905_210501.sql','20190905_210501.sql',201285,'2019-09-05 21:05:01');
INSERT INTO `tb_sql` VALUES (103,'20190907_184237.sql','20190907_184237.sql',201394,'2019-09-07 18:42:37');

DELETE FROM tb_ty_info;
INSERT INTO `tb_ty_info` VALUES (1,1,'韩式','2017-07-27 17:40:36');
INSERT INTO `tb_ty_info` VALUES (2,1,'中式','2017-07-27 17:40:51');
INSERT INTO `tb_ty_info` VALUES (3,1,'创意','2017-07-27 17:41:00');
INSERT INTO `tb_ty_info` VALUES (4,1,'田园','2017-07-27 17:41:08');
INSERT INTO `tb_ty_info` VALUES (5,1,'卡通','2017-07-27 17:41:17');
INSERT INTO `tb_ty_info` VALUES (6,1,'古典中式','2017-07-27 17:41:24');
INSERT INTO `tb_ty_info` VALUES (7,2,'大空间','2017-07-27 18:02:18');
INSERT INTO `tb_ty_info` VALUES (8,3,688,'2017-07-27 18:06:08');

DELETE FROM tb_ty_type;
INSERT INTO `tb_ty_type` VALUES (1,'风格','2017-07-27 17:39:43');
INSERT INTO `tb_ty_type` VALUES (2,'空间','2017-07-27 17:39:55');
INSERT INTO `tb_ty_type` VALUES (3,'类别','2017-07-27 17:40:00');
INSERT INTO `tb_ty_type` VALUES (4,'材质颜色','2017-07-27 17:40:07');
INSERT INTO `tb_ty_type` VALUES (5,'平开门样式','2017-07-27 17:40:13');
INSERT INTO `tb_ty_type` VALUES (6,'推拉门样式','2017-07-27 17:40:19');

DELETE FROM tb_user;
INSERT INTO `tb_user` VALUES (1,'admin','网站管理','7fef6171469e80d32c0559f88b377245','四川成都',1,'admin','2019-09-10 16:06:13');
INSERT INTO `tb_user` VALUES (5,'anddisme','anddisme','9440d96efca0933a5a41cd7d4b636db0',NULL,0,'admin,1,2,8,3,6,7','2019-09-10 16:39:16');
INSERT INTO `tb_user` VALUES (6,'ces','ces333','9d89e27badedeba14a6e13bce87c9957',NULL,1,2,0);
INSERT INTO `tb_user` VALUES (7,'anddism',1111,'6e244252c60d11dade91c7d562d37a0f',NULL,1,'admin,1,7,8,35,2','2019-08-17 14:27:21');

DELETE FROM tb_web;
INSERT INTO `tb_web` VALUES (1,'成都佳罐塑料制品有限公司','#1','###1','####1',0,'',0,'','40077-40087','159-1025-8952','丰台区南三环西路16号搜宝商务中心2号楼605','270128526@qq.com','',NULL,'/public/uploads/image/20190902/20190902103622_40272.png','© 2007-2019 国捷集团版权所有   财税服务由xx财税提供战略支持   京ICP-19001241','/public/uploads/image/20190827/20190827170403_34772.jpg',NULL,'国捷集团','国捷集团','国捷集团','##100000',NULL,NULL,'125.69.102.34','2019-09-10 17:24:27');

DELETE FROM tb_webinfo;
INSERT INTO `tb_webinfo` VALUES (1,'首页电话','phone400','text','028-88354868');
INSERT INTO `tb_webinfo` VALUES (12,'传　　真','c5','text','028-88376589');
INSERT INTO `tb_webinfo` VALUES (11,'地　　址','c4','text','成都市大邑县晋原镇兴业大道北段62号');
INSERT INTO `tb_webinfo` VALUES (9,'销售咨询','c2','text','15208196264(韩先生)(微信同号)');
INSERT INTO `tb_webinfo` VALUES (10,'销售咨询','c3','text','15208196264(韩先生)(微信同号)');
INSERT INTO `tb_webinfo` VALUES (8,'联系电话','c1','text','028-88354868');
INSERT INTO `tb_webinfo` VALUES (13,'电子邮件','c6','text','150287879@qq.com');
INSERT INTO `tb_webinfo` VALUES (14,'在线Q Q','c7','text',3181824);
INSERT INTO `tb_webinfo` VALUES (15,'邮政编码','c8','text',610041);
INSERT INTO `tb_webinfo` VALUES (16,'地图','c9','images','/s/images/map.jpg');
INSERT INTO `tb_webinfo` VALUES (17,'二维码','c10','images','/s/images/qr.png');
INSERT INTO `tb_webinfo` VALUES (18,'底部服务热线','c11','text','028-88354868   152-0819-6264');
INSERT INTO `tb_webinfo` VALUES (19,'底部版权','c12','textarea','@2000-2000 www.cdjiaguan.com ALL Rignts Reserved');
INSERT INTO `tb_webinfo` VALUES (20,'备案号','c13','text','蜀ICP备10000000号');
INSERT INTO `tb_webinfo` VALUES (21,'ggg','sdf','text','');
INSERT INTO `tb_webinfo` VALUES (22,'sdfs','fsd','text','');
