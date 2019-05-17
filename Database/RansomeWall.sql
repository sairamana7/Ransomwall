/*
SQLyog - Free MySQL GUI v5.0
Host - 5.0.45-community-nt : Database - ransomewall
*********************************************************************
Server version : 5.0.45-community-nt
*/


create database if not exists `ransomewall`;

USE `ransomewall`;

/*Table structure for table `custhoneyfiles` */

DROP TABLE IF EXISTS `custhoneyfiles`;

CREATE TABLE `custhoneyfiles` (
  `id` int(11) NOT NULL auto_increment,
  `custname` varchar(80) NOT NULL,
  `custemail` varchar(80) NOT NULL,
  `filetypes` varchar(80) NOT NULL,
  `filename` varchar(80) NOT NULL,
  `fileextension` varchar(80) NOT NULL,
  `filestore` longblob NOT NULL,
  `filenewname` varchar(80) NOT NULL,
  `singverify` varchar(80) NOT NULL,
  `iomnagerstayus` varchar(20) NOT NULL,
  `attackingstatus` varchar(20) NOT NULL,
  `cdate` date default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `filenewname` (`filenewname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL auto_increment,
  `loginid` varchar(50) NOT NULL,
  `pswd` varchar(50) NOT NULL,
  `custname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `loginid` (`loginid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `loginid_2` (`loginid`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `ransomeattacking` */

DROP TABLE IF EXISTS `ransomeattacking`;

CREATE TABLE `ransomeattacking` (
  `rowid` int(11) NOT NULL auto_increment,
  `ransomeFileName` varchar(100) NOT NULL,
  `fid` int(11) NOT NULL,
  `filetype` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fileextension` varchar(100) NOT NULL,
  `secretkey` varchar(100) NOT NULL,
  `paymneturl` varchar(100) NOT NULL,
  `paymentstatus` varchar(100) NOT NULL,
  `recoverystatus` varchar(100) NOT NULL,
  `attackername` varchar(100) NOT NULL,
  `cdate` date NOT NULL,
  PRIMARY KEY  (`rowid`),
  UNIQUE KEY `fid` (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `ransomeuser` */

DROP TABLE IF EXISTS `ransomeuser`;

CREATE TABLE `ransomeuser` (
  `id` int(11) NOT NULL auto_increment,
  `loginid` varchar(50) NOT NULL,
  `pswd` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `loginid` (`loginid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `loginid_2` (`loginid`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `ransomeuserrequest` */

DROP TABLE IF EXISTS `ransomeuserrequest`;

CREATE TABLE `ransomeuserrequest` (
  `id` int(11) NOT NULL auto_increment,
  `rfileid` varchar(80) NOT NULL,
  `filename` varchar(80) NOT NULL,
  `filetype` varchar(80) NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `fileext` varchar(80) NOT NULL,
  `recoverystatus` varchar(80) NOT NULL,
  `cdate` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
