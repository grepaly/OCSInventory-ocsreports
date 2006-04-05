CREATE DATABASE ocsweb;
USE ocsweb;


CREATE TABLE hardware (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) not NULL,
  NAME VARCHAR(255) default NULL,
  WORKGROUP VARCHAR(255) default NULL,
  OSNAME VARCHAR(255) default NULL,
  OSVERSION VARCHAR(255) default NULL,
  OSCOMMENTS VARCHAR(255) default NULL,
  PROCESSORT VARCHAR(255) default NULL,
  PROCESSORS INTEGER default 0,
  PROCESSORN SMALLINT default NULL,
  MEMORY INTEGER default NULL,
  SWAP INTEGER default NULL,
  IPADDR VARCHAR(255) default NULL,
  ETIME DATETIME default NULL,
  LASTDATE DATETIME default NULL,
  LASTCOME DATETIME default NULL,
  QUALITY DECIMAL(4,3) default 0,
  FIDELITY BIGINT default 1,
  USERID VARCHAR(255) default NULL,
  `TYPE` INTEGER default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  WINCOMPANY VARCHAR(255) default NULL,
  WINOWNER VARCHAR(255) default NULL,
  WINPRODID VARCHAR(255) default NULL,
  USERAGENT VARCHAR(50) default NULL,
  CHECKSUM INTEGER default 0,
  PRIMARY KEY  (ID),
  INDEX NAME (NAME),
  INDEX CHECKSUM (CHECKSUM),
  INDEX DEVICEID (DEVICEID)
) ENGINE=INNODB ;

CREATE TABLE accesslog (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  USERID VARCHAR(255) default NULL,
  LOGDATE DATETIME default NULL,
  PROCESSES TEXT,
  PRIMARY KEY  (ID, HARDWARE_ID)
) ENGINE=INNODB ;

CREATE TABLE accountinfo (
  HARDWARE_ID INTEGER NOT NULL,
  TAG VARCHAR(255) default 'NA',
  primary key(HARDWARE_ID),
  INDEX TAG (TAG)
) ENGINE=INNODB ;

CREATE TABLE deploy (
  NAME VARCHAR(255) NOT NULL,
  CONTENT LONGBLOB NOT NULL,
  PRIMARY KEY  (NAME)
) ENGINE=MYISAM ;

CREATE TABLE netmap (
  IP VARCHAR(15) NOT NULL,
  MAC VARCHAR(17) NOT NULL,
  MASK VARCHAR(15) NOT NULL,
  NETID VARCHAR(15) NOT NULL,
  DATE TIMESTAMP default CURRENT_TIMESTAMP,
  NAME VARCHAR(255) default NULL,
  PRIMARY KEY  (MAC),
  INDEX IP (IP),
  INDEX NETID (NETID)
) ENGINE=INNODB ;

CREATE TABLE bios (
  HARDWARE_ID INTEGER NOT NULL,
  SMANUFACTURER VARCHAR(255) default NULL,
  SMODEL VARCHAR(255) default NULL,
  SSN VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  BMANUFACTURER VARCHAR(255) default NULL,
  BVERSION VARCHAR(255) default NULL,
  BDATE VARCHAR(255) default NULL,
  PRIMARY KEY  (HARDWARE_ID),
  INDEX SSN (SSN)
) ENGINE=INNODB ;

CREATE TABLE tag (
  TAG_NAME VARCHAR(255) default NULL,
  LOGIN VARCHAR(255) default NULL,
  PRIMARY KEY  (TAG_NAME, LOGIN)
) ENGINE=MYISAM ;

CREATE TABLE config (
  NAME VARCHAR(50) NOT NULL,
  IVALUE INTEGER default NULL,
  TVALUE VARCHAR(255) default NULL,
  COMMENTS TEXT,
  PRIMARY KEY (NAME)
) ENGINE=MYISAM ;

CREATE TABLE controllers (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  MANUFACTURER VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  CAPTION VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  VERSION VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID)
) ENGINE=INNODB ;

CREATE TABLE devices (
  HARDWARE_ID INTEGER NOT NULL,
  NAME VARCHAR(50) NOT NULL,
  IVALUE INTEGER default NULL,
  TVALUE VARCHAR(255) default NULL,
  COMMENTS TEXT,
  INDEX HARDWARE_ID (HARDWARE_ID),
  INDEX TVALUE (TVALUE)
) ENGINE=INNODB ;

CREATE TABLE drives (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  LETTER VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  FILESYSTEM VARCHAR(255) default NULL,
  TOTAL INTEGER default NULL,
  FREE INTEGER default NULL,
  NUMFILES INTEGER default NULL,
  VOLUMN VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID)
) ENGINE=INNODB ;

CREATE TABLE files (
  NAME VARCHAR(255) NOT NULL,
  VERSION VARCHAR(255) NOT NULL,
  OS VARCHAR(255) NOT NULL,
  CONTENT LONGBLOB NOT NULL,
  PRIMARY KEY  (NAME, OS, VERSION)
) ENGINE=MYISAM ;

CREATE TABLE inputs (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  `TYPE` VARCHAR(255) default NULL,
  MANUFACTURER VARCHAR(255) default NULL,
  CAPTION VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  INTERFACE VARCHAR(255) default NULL,
  POINTTYPE VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID)
) ENGINE=INNODB ;

CREATE TABLE memories (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  CAPTION VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  CAPACITY VARCHAR(255) default NULL,
  PURPOSE VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  SPEED VARCHAR(255) default NULL,
  NUMSLOTS SMALLINT default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID)
) ENGINE=INNODB ;

CREATE TABLE modems (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  NAME VARCHAR(255) default NULL,
  MODEL VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID)
) ENGINE=INNODB ;

CREATE TABLE monitors (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  MANUFACTURER VARCHAR(255) default NULL,
  CAPTION VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  SERIAL VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID)
) ENGINE=INNODB ;


CREATE TABLE networks (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  TYPEMIB VARCHAR(255) default NULL,
  SPEED VARCHAR(255) default NULL,
  MACADDR VARCHAR(255) default NULL,
  `STATUS` VARCHAR(255) default NULL,
  IPADDRESS VARCHAR(255) default NULL,
  IPMASK VARCHAR(255) default NULL,
  IPGATEWAY VARCHAR(255) default NULL,
  IPSUBNET VARCHAR(255) default NULL,
  IPDHCP VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID),
  INDEX MACADDR (MACADDR),
  INDEX IPSUBNET (IPSUBNET)
) ENGINE=INNODB ;

CREATE network_devices(
  ID INTEGER NOT NULL auto_increment,
  DESCRIPTION VARCHAR(255) default NULL,
  TYPE VARCHAR(255) default NULL,
  MACADDR VARCHAR(255) default NULL,
  IPADDRESS VARCHAR(255) default NULL,
  IPSUBNET VARCHAR(255) default NULL,
  `USER` VARCHAR(255) default NULL,
  PRIMARY KEY(ID),
  KEY MACADDR (MACADDR),
  KEY IPSUBNET (IPSUBNET)
) ENGINE=MYISAM;

CREATE TABLE operators (
  ID VARCHAR(255) NOT NULL default '',
  FIRSTNAME VARCHAR(255) default NULL,
  LASTNAME VARCHAR(255) default NULL,
  PASSWD VARCHAR(50) default NULL,
  ACCESSLVL INTEGER default NULL,
  COMMENTS text,
  PRIMARY KEY  (ID)
) ENGINE=MYISAM ;

CREATE TABLE ports (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  `TYPE` VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  CAPTION VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID)
) ENGINE=INNODB ;

CREATE TABLE printers (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  NAME VARCHAR(255) default NULL,
  DRIVER VARCHAR(255) default NULL,
  PORT VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID)
) ENGINE=INNODB ;

CREATE TABLE regconfig (
  ID INTEGER NOT NULL auto_increment,
  NAME VARCHAR(255) default NULL,
  REGTREE INTEGER default NULL,
  REGKEY text,
  REGVALUE VARCHAR(255) default NULL,
  PRIMARY KEY  (ID),
  KEY NAME (NAME)
) ENGINE=MYISAM ;

CREATE TABLE registry (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  NAME VARCHAR(255) default NULL,
  REGVALUE VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID),
  KEY NAME (NAME)
) ENGINE=INNODB ;

CREATE TABLE slots (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  NAME VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  DESIGNATION VARCHAR(255) default NULL,
  PURPOSE VARCHAR(255) default NULL,
  `STATUS` VARCHAR(255) default NULL,
  PSHARE tinyint(4) default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID)
) ENGINE=INNODB ;

CREATE TABLE softwares (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  PUBLISHER VARCHAR(255) default NULL,
  NAME VARCHAR(255) not NULL,
  VERSION VARCHAR(255) default NULL,
  FOLDER text,
  COMMENTS text,
  FILENAME VARCHAR(255) default NULL,
  FILESIZE INTEGER default '0',
  SOURCE INTEGER default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID),
  INDEX NAME (NAME)
) ENGINE=INNODB ;

CREATE TABLE `sounds` (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  MANUFACTURER VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID)
) ENGINE=INNODB ;

CREATE TABLE storages (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  MANUFACTURER VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  MODEL VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  DISKSIZE INTEGER default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID)
) ENGINE=INNODB ;

CREATE TABLE videos (
  ID INTEGER NOT NULL auto_increment,
  HARDWARE_ID INTEGER NOT NULL,
  NAME VARCHAR(255) default NULL,
  CHIPSET VARCHAR(255) default NULL,
  MEMORY VARCHAR(255) default NULL,
  RESOLUTION VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, HARDWARE_ID)
) ENGINE=INNODB ;

CREATE TABLE devicetype (
  ID INTEGER NOT NULL auto_increment,
  NAME VARCHAR(255) default NULL,
  PRIMARY KEY  (ID)
) ENGINE=MYISAM ;

CREATE TABLE subnet (
  NETID VARCHAR(15) NOT NULL,
  NAME VARCHAR(255),
  ID INTEGER,
  MASK VARCHAR(255),
  PRIMARY KEY (NETID)
) ENGINE=MYISAM ;

CREATE TABLE locks(
  HARDWARE_ID INTEGER NOT NULL PRIMARY KEY,
  ID INTEGER DEFAULT NULL,
  SINCE TIMESTAMP,
  INDEX SINCE (SINCE)
) ENGINE=HEAP ;

CREATE TABLE dico_cat(
  NAME VARCHAR(255) NOT NULL,
  PERMANENT TINYINT DEFAULT 0,
  PRIMARY KEY(NAME)
) ENGINE=MYISAM ;

CREATE TABLE dico_ignored(
  EXTRACTED VARCHAR(255) NOT NULL,
  PRIMARY KEY(EXTRACTED)
) ENGINE=MYISAM ;

CREATE TABLE dico_soft( 
  EXTRACTED VARCHAR(255) NOT NULL,
  FORMATTED VARCHAR(255) NOT NULL,
  PRIMARY KEY(EXTRACTED)
) ENGINE=MYISAM ;

CREATE TABLE deleted_equiv(
  DATE TIMESTAMP, 
  DELETED VARCHAR(255) NOT NULL,
  EQUIVALENT VARCHAR(255) default NULL
) ENGINE=MYISAM ;

CREATE TABLE download_available(
	FILEID VARCHAR(255) NOT NULL PRIMARY KEY,
	NAME VARCHAR(255) NOT NULL,
	PRIORITY INTEGER NOT NULL,
	FRAGMENTS INTEGER NOT NULL,
	SIZE INTEGER NOT NULL,
	OSNAME VARCHAR(255) NOT NULL,
	COMMENT TEXT
) ENGINE = INNODB;

CREATE TABLE download_enable(
	ID INTEGER NOT NULL auto_increment PRIMARY KEY,
	FILEID VARCHAR(255) NOT NULL,
	LOCATION VARCHAR(255) NOT NULL,
	CERT VARCHAR(255) NOT NULL
) ENGINE = INNODB;

ALTER TABLE monitors ADD COLUMN SERIAL VARCHAR(255);
ALTER TABLE netmap ADD COLUMN MASK VARCHAR(15);
ALTER TABLE netmap ADD COLUMN NETID VARCHAR(15);
ALTER TABLE netmap ADD INDEX NETID (NETID);
ALTER TABLE netmap ADD COLUMN DATE TIMESTAMP;
ALTER TABLE netmap ADD COLUMN NAME VARCHAR(255) default NULL;
ALTER TABLE networks ADD COLUMN IPSUBNET VARCHAR(15);
ALTER TABLE networks ADD INDEX IPSUBNET (IPSUBNET);
ALTER TABLE networks ADD INDEX MACADDR (MACADDR);
ALTER TABLE hardware ADD COLUMN CHECKSUM INTEGER default NULL;
ALTER TABLE hardware CHANGE COLUMN CHECKSUM CHECKSUM INTEGER default 131071;

ALTER TABLE hardware CHANGE ID ID INTEGER;
ALTER TABLE hardware DROP PRIMARY KEY;
ALTER TABLE hardware ADD COLUMN ID integer not NULL FIRST;
ALTER TABLE hardware ADD INDEX(ID);
ALTER TABLE hardware CHANGE ID ID INTEGER auto_increment;
ALTER TABLE hardware add PRIMARY KEY(DEVICEID, ID);

ALTER TABLE bios DROP PRIMARY KEY;
ALTER TABLE bios ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE bios SET bios.HARDWARE_ID= (SELECT ID FROM hardware WHERE bios.DEVICEID = hardware.DEVICEID);
ALTER TABLE bios DROP DEVICEID;
ALTER TABLE bios ADD PRIMARY KEY(HARDWARE_ID);

ALTER TABLE accountinfo DROP PRIMARY KEY;
ALTER TABLE accountinfo ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE accountinfo SET accountinfo.HARDWARE_ID= (SELECT ID FROM hardware WHERE accountinfo.DEVICEID = hardware.DEVICEID);
ALTER TABLE accountinfo DROP DEVICEID;
ALTER TABLE accountinfo ADD PRIMARY KEY(HARDWARE_ID);

ALTER TABLE devices DROP PRIMARY KEY;
ALTER TABLE devices ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE devices SET devices.HARDWARE_ID= (SELECT ID FROM hardware WHERE devices.DEVICEID = hardware.DEVICEID);
ALTER TABLE devices DROP DEVICEID;
ALTER TABLE devices ADD INDEX HARDWARE_ID (HARDWARE_ID);

ALTER TABLE controllers change ID ID INTEGER;
ALTER TABLE controllers DROP PRIMARY KEY;
ALTER TABLE controllers ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE controllers SET controllers.HARDWARE_ID= (SELECT ID FROM hardware WHERE controllers.DEVICEID = hardware.DEVICEID);
ALTER TABLE controllers ADD INDEX ID (ID);
ALTER TABLE controllers change ID ID INTEGER auto_increment;
ALTER TABLE controllers ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE controllers DROP DEVICEID;

ALTER TABLE slots change ID ID INTEGER;
ALTER TABLE slots DROP PRIMARY KEY;
ALTER TABLE slots ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE slots SET slots.HARDWARE_ID= (SELECT ID FROM hardware WHERE slots.DEVICEID = hardware.DEVICEID);
ALTER TABLE slots ADD INDEX ID (ID);
ALTER TABLE slots change ID ID INTEGER auto_increment;
ALTER TABLE slots ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE slots DROP DEVICEID;

ALTER TABLE registry change ID ID INTEGER;
ALTER TABLE registry DROP PRIMARY KEY;
ALTER TABLE registry ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE registry SET registry.HARDWARE_ID= (SELECT ID FROM hardware WHERE registry.DEVICEID = hardware.DEVICEID);
ALTER TABLE registry ADD INDEX ID (ID);
ALTER TABLE registry change ID ID INTEGER auto_increment;
ALTER TABLE registry ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE registry DROP DEVICEID;

ALTER TABLE networks change ID ID INTEGER;
ALTER TABLE networks DROP PRIMARY KEY;
ALTER TABLE networks ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE networks SET networks.HARDWARE_ID= (SELECT ID FROM hardware WHERE networks.DEVICEID = hardware.DEVICEID);
ALTER TABLE networks ADD INDEX ID (ID);
ALTER TABLE networks change ID ID INTEGER auto_increment;
ALTER TABLE networks ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE networks DROP DEVICEID;

ALTER TABLE memories change ID ID INTEGER;
ALTER TABLE memories DROP PRIMARY KEY;
ALTER TABLE memories ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE memories SET memories.HARDWARE_ID= (SELECT ID FROM hardware WHERE memories.DEVICEID = hardware.DEVICEID);
ALTER TABLE memories ADD INDEX ID (ID);
ALTER TABLE memories change ID ID INTEGER auto_increment;
ALTER TABLE memories ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE memories DROP DEVICEID;

ALTER TABLE drives change ID ID INTEGER;
ALTER TABLE drives DROP PRIMARY KEY;
ALTER TABLE drives ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE drives SET drives.HARDWARE_ID= (SELECT ID FROM hardware WHERE drives.DEVICEID = hardware.DEVICEID);
ALTER TABLE drives ADD INDEX ID (ID);
ALTER TABLE drives change ID ID INTEGER auto_increment;
ALTER TABLE drives ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE drives DROP DEVICEID;

ALTER TABLE storages change ID ID INTEGER;
ALTER TABLE storages DROP PRIMARY KEY;
ALTER TABLE storages ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE storages SET storages.HARDWARE_ID= (SELECT ID FROM hardware WHERE storages.DEVICEID = hardware.DEVICEID);
ALTER TABLE storages ADD INDEX ID (ID);
ALTER TABLE storages change ID ID INTEGER auto_increment;
ALTER TABLE storages ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE storages DROP DEVICEID;

ALTER TABLE ports change ID ID INTEGER;
ALTER TABLE ports DROP PRIMARY KEY;
ALTER TABLE ports ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE ports SET ports.HARDWARE_ID= (SELECT ID FROM hardware WHERE ports.DEVICEID = hardware.DEVICEID);
ALTER TABLE ports ADD INDEX ID (ID);
ALTER TABLE ports change ID ID INTEGER auto_increment;
ALTER TABLE ports ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE ports DROP DEVICEID;

ALTER TABLE accesslog change ID ID INTEGER;
ALTER TABLE accesslog DROP PRIMARY KEY;
ALTER TABLE accesslog ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE accesslog SET accesslog.HARDWARE_ID= (SELECT ID FROM hardware WHERE accesslog.DEVICEID = hardware.DEVICEID);
ALTER TABLE accesslog ADD INDEX ID (ID);
ALTER TABLE accesslog change ID ID INTEGER auto_increment;
ALTER TABLE accesslog ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE accesslog DROP DEVICEID;

ALTER TABLE softwares change ID ID INTEGER;
ALTER TABLE softwares DROP PRIMARY KEY;
ALTER TABLE softwares ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE softwares SET softwares.HARDWARE_ID= (SELECT ID FROM hardware WHERE softwares.DEVICEID = hardware.DEVICEID);
ALTER TABLE softwares ADD INDEX ID (ID);
ALTER TABLE softwares change ID ID INTEGER auto_increment;
ALTER TABLE softwares ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE softwares DROP DEVICEID;

ALTER TABLE monitors change ID ID INTEGER;
ALTER TABLE monitors DROP PRIMARY KEY;
ALTER TABLE monitors ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE monitors SET monitors.HARDWARE_ID= (SELECT ID FROM hardware WHERE monitors.DEVICEID = hardware.DEVICEID);
ALTER TABLE monitors ADD INDEX ID (ID);
ALTER TABLE monitors change ID ID INTEGER auto_increment;
ALTER TABLE monitors ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE monitors DROP DEVICEID;

ALTER TABLE modems change ID ID INTEGER;
ALTER TABLE modems DROP PRIMARY KEY;
ALTER TABLE modems ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE modems SET modems.HARDWARE_ID= (SELECT ID FROM hardware WHERE modems.DEVICEID = hardware.DEVICEID);
ALTER TABLE modems ADD INDEX ID (ID);
ALTER TABLE modems change ID ID INTEGER auto_increment;
ALTER TABLE modems ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE modems DROP DEVICEID;

ALTER TABLE inputs change ID ID INTEGER;
ALTER TABLE inputs DROP PRIMARY KEY;
ALTER TABLE inputs ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE inputs SET inputs.HARDWARE_ID= (SELECT ID FROM hardware WHERE inputs.DEVICEID = hardware.DEVICEID);
ALTER TABLE inputs ADD INDEX ID (ID);
ALTER TABLE inputs change ID ID INTEGER auto_increment;
ALTER TABLE inputs ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE inputs DROP DEVICEID;

ALTER TABLE printers change ID ID INTEGER;
ALTER TABLE printers DROP PRIMARY KEY;
ALTER TABLE printers ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE printers SET printers.HARDWARE_ID= (SELECT ID FROM hardware WHERE printers.DEVICEID = hardware.DEVICEID);
ALTER TABLE printers ADD INDEX ID (ID);
ALTER TABLE printers change ID ID INTEGER auto_increment;
ALTER TABLE printers ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE printers DROP DEVICEID;

ALTER TABLE videos change ID ID INTEGER;
ALTER TABLE videos DROP PRIMARY KEY;
ALTER TABLE videos ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE videos SET videos.HARDWARE_ID= (SELECT ID FROM hardware WHERE videos.DEVICEID = hardware.DEVICEID);
ALTER TABLE videos ADD INDEX ID (ID);
ALTER TABLE videos change ID ID INTEGER auto_increment;
ALTER TABLE videos ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE videos DROP DEVICEID;

ALTER TABLE sounds change ID ID INTEGER;
ALTER TABLE sounds DROP PRIMARY KEY;
ALTER TABLE sounds ADD COLUMN HARDWARE_ID integer not NULL FIRST;
UPDATE sounds SET sounds.HARDWARE_ID= (SELECT ID FROM hardware WHERE sounds.DEVICEID = hardware.DEVICEID);
ALTER TABLE sounds ADD INDEX ID (ID);
ALTER TABLE sounds change ID ID INTEGER auto_increment;
ALTER TABLE sounds ADD PRIMARY KEY(HARDWARE_ID,ID);
ALTER TABLE sounds DROP DEVICEID;

TRUNCATE TABLE locks;
ALTER TABLE locks DROP DEVICEID;
ALTER TABLE locks ADD HARDWARE_ID INTEGER NOT NULL PRIMARY KEY FIRST;
ALTER TABLE locks ADD INDEX SINCE (SINCE);

INSERT INTO network_devices(DESCRIPTION,TYPE,MACADDR,IPADDRESS,IPSUBNET,`USER`) SELECT DESCRIPTION,TYPE,MACADDR,IPADDRESS,IPSUBNET,TYPEMIB FROM networks WHERE DEVICEID LIKE "NETWORK_DEVICE-%";

ALTER TABLE hardware engine="INNODB";
ALTER TABLE accesslog engine="INNODB";
ALTER TABLE bios engine="INNODB";
ALTER TABLE memories engine="INNODB";
ALTER TABLE slots engine="INNODB";
ALTER TABLE registry engine="INNODB";
ALTER TABLE registry engine="INNODB";
ALTER TABLE monitors engine="INNODB";
ALTER TABLE ports engine="INNODB";
ALTER TABLE storages engine="INNODB";
ALTER TABLE drives engine="INNODB";
ALTER TABLE inputs engine="INNODB";
ALTER TABLE modems engine="INNODB";
ALTER TABLE networks engine="INNODB";
ALTER TABLE printers engine="INNODB";
ALTER TABLE sounds engine="INNODB";
ALTER TABLE videos engine="INNODB";
ALTER TABLE softwares engine="INNODB";
ALTER TABLE accountinfo engine="INNODB";
ALTER TABLE netmap engine="INNODB";
ALTER TABLE devices engine="INNODB";
ALTER TABLE locks engine="HEAP";

DELETE FROM `config` WHERE name='GUI_VERSION';
DELETE FROM `config` WHERE NAME='IP_MIN_QUALITY';

INSERT INTO `config` VALUES ('FREQUENCY', 0, '', 'Specify the frequency (days) of inventories. (0: inventory at each login. -1: no inventory)');
INSERT INTO `config` VALUES ('IPDISCOVER', 2, '', 'Max number of computers per gateway retrieving IP on the network');
INSERT INTO `config` VALUES ('REGISTRY', 0, '', 'Activates or not the registry query function');
INSERT INTO `config` VALUES ('IPDISCOVER_MAX_ALIVE', 7, '','Max number of days before an Ip Discover computer is replaced');
INSERT INTO `config` VALUES ('DEPLOY', 1, '', 'Activates or not the automatic deployment option');
INSERT INTO `config` VALUES ('UPDATE', 0, '', 'Activates or not the update feature');
INSERT INTO `config` VALUES ('GUI_VERSION', 0, '4014', 'Version of the installed GUI and database');
INSERT INTO `config` VALUES ('TRACE_DELETED', 0, '', 'Trace deleted/duplicated computers (Activated by GLPI)');
INSERT INTO `config` VALUES ('LOGLEVEL', 0, '', 'ocs engine loglevel');
INSERT INTO `config` VALUES ('AUTO_DUPLICATE_LVL', 7, '', 'Trace deleted/duplicated computers (Activated by GLPI)');
INSERT INTO `config` VALUES ('DOWNLOAD', 0, '', 'Activate softwares auto deployment feature');
INSERT INTO `config` VALUES ('DOWNLOAD_CYCLE_LATENCY', 60, '', 'Modify that if you know what you are doing');
INSERT INTO `config` VALUES ('DOWNLOAD_PERIOD_LENGTH', 10, '', 'Modify that if you know what you are doing');
INSERT INTO `config` VALUES ('DOWNLOAD_FRAG_LATENCY', 10, '', 'Modify that if you know what you are doing');
INSERT INTO `config` VALUES ('DOWNLOAD_PERIOD_LATENCY', 0, '', 'Modify that if you know what you are doing');
INSERT INTO `config` VALUES ('DOWNLOAD_TIMEOUT', 30, '', 'Modify that if you know what you are doing');

INSERT INTO `operators` VALUES ('admin','admin','admin','admin',1, 'Default administrator account');

GRANT ALL PRIVILEGES ON ocsweb.* TO ocs IDENTIFIED BY 'ocs';
GRANT ALL PRIVILEGES ON ocsweb.* TO ocs@localhost IDENTIFIED BY 'ocs';
