Environment configuration: 

For Tomcat Server Admin Password (server): hehan

Source Server: localhost_3307   Source Server Version: 50614
Source Host: localhost:3307   Source Database: taskdb
Target Server Type MYSQL   Target Server Version: 50614
File Encoding: 65001
Manager Password (database): hehan

Codes for 'task' table:

CREATE TABLE `task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `taskmember` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `leader` varchar(20) DEFAULT NULL,
  `priority` varchar(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `text` text NOT NULL,
  `retxt` text,
  `status` char(2) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`)
)

Codes for 'arctask' table:

CREATE TABLE `arctask` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `taskmember` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `leader` varchar(20) DEFAULT NULL,
  `priority` varchar(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `text` text NOT NULL,
  `retxt` text,
  `status` char(2) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`)
)
