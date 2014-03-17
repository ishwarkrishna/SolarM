-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.23-rc-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema spagobi
--

CREATE DATABASE IF NOT EXISTS spagobi;
USE spagobi;

--
-- Definition of table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
CREATE TABLE `hibernate_sequences` (
  `SEQUENCE_NAME` varchar(200) NOT NULL,
  `NEXT_VAL` int(11) NOT NULL,
  PRIMARY KEY (`SEQUENCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequences`
--

/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` (`SEQUENCE_NAME`,`NEXT_VAL`) VALUES 
 ('SBI_ATTRIBUTE',6),
 ('SBI_AUDIT',67),
 ('SBI_BINARY_CONTENTS',155),
 ('SBI_CHECKS',7),
 ('SBI_CONFIG',114),
 ('SBI_DATA_SOURCE',2),
 ('SBI_DOMAINS',140),
 ('SBI_ENGINES',26),
 ('SBI_EXT_ROLES',11),
 ('SBI_FUNCTIONS',4),
 ('SBI_KPI',2),
 ('SBI_KPI_INSTANCE',2),
 ('SBI_KPI_MODEL',3),
 ('SBI_KPI_MODEL_INST',3),
 ('SBI_KPI_PERIODICITY',9),
 ('SBI_KPI_VALUE',5),
 ('SBI_LOV',12),
 ('SBI_MENU',5),
 ('SBI_OBJECTS',16),
 ('SBI_OBJECT_TEMPLATES',88),
 ('SBI_OBJ_PAR',55),
 ('SBI_ORGANIZATIONS',2),
 ('SBI_PARAMETERS',8),
 ('SBI_PARUSE',8),
 ('SBI_THRESHOLD',3),
 ('SBI_THRESHOLD_VALUE',7),
 ('SBI_USER',8),
 ('SBI_USER_FUNC',51);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;


--
-- Definition of table `jbpm_action`
--

DROP TABLE IF EXISTS `jbpm_action`;
CREATE TABLE `jbpm_action` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `class` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ISPROPAGATIONALLOWED_` bit(1) DEFAULT NULL,
  `ACTIONEXPRESSION_` varchar(255) DEFAULT NULL,
  `ISASYNC_` bit(1) DEFAULT NULL,
  `REFERENCEDACTION_` bigint(20) DEFAULT NULL,
  `ACTIONDELEGATION_` bigint(20) DEFAULT NULL,
  `EVENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `TIMERNAME_` varchar(255) DEFAULT NULL,
  `DUEDATE_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `TIMERACTION_` bigint(20) DEFAULT NULL,
  `EXPRESSION_` longtext,
  `EVENTINDEX_` int(11) DEFAULT NULL,
  `EXCEPTIONHANDLER_` bigint(20) DEFAULT NULL,
  `EXCEPTIONHANDLERINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_ACTION_REFACT` (`REFERENCEDACTION_`),
  KEY `FK_CRTETIMERACT_TA` (`TIMERACTION_`),
  KEY `FK_ACTION_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_ACTION_EVENT` (`EVENT_`),
  KEY `FK_ACTION_ACTNDEL` (`ACTIONDELEGATION_`),
  KEY `FK_ACTION_EXPTHDL` (`EXCEPTIONHANDLER_`),
  CONSTRAINT `FK_ACTION_ACTNDEL` FOREIGN KEY (`ACTIONDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_ACTION_EVENT` FOREIGN KEY (`EVENT_`) REFERENCES `jbpm_event` (`ID_`),
  CONSTRAINT `FK_ACTION_EXPTHDL` FOREIGN KEY (`EXCEPTIONHANDLER_`) REFERENCES `jbpm_exceptionhandler` (`ID_`),
  CONSTRAINT `FK_ACTION_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_ACTION_REFACT` FOREIGN KEY (`REFERENCEDACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_CRTETIMERACT_TA` FOREIGN KEY (`TIMERACTION_`) REFERENCES `jbpm_action` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_action`
--

/*!40000 ALTER TABLE `jbpm_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_action` ENABLE KEYS */;


--
-- Definition of table `jbpm_bytearray`
--

DROP TABLE IF EXISTS `jbpm_bytearray`;
CREATE TABLE `jbpm_bytearray` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `FILEDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_BYTEARR_FILDEF` (`FILEDEFINITION_`),
  CONSTRAINT `FK_BYTEARR_FILDEF` FOREIGN KEY (`FILEDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_bytearray`
--

/*!40000 ALTER TABLE `jbpm_bytearray` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_bytearray` ENABLE KEYS */;


--
-- Definition of table `jbpm_byteblock`
--

DROP TABLE IF EXISTS `jbpm_byteblock`;
CREATE TABLE `jbpm_byteblock` (
  `PROCESSFILE_` bigint(20) NOT NULL,
  `BYTES_` blob,
  `INDEX_` int(11) NOT NULL,
  PRIMARY KEY (`PROCESSFILE_`,`INDEX_`),
  KEY `FK_BYTEBLOCK_FILE` (`PROCESSFILE_`),
  CONSTRAINT `FK_BYTEBLOCK_FILE` FOREIGN KEY (`PROCESSFILE_`) REFERENCES `jbpm_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_byteblock`
--

/*!40000 ALTER TABLE `jbpm_byteblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_byteblock` ENABLE KEYS */;


--
-- Definition of table `jbpm_comment`
--

DROP TABLE IF EXISTS `jbpm_comment`;
CREATE TABLE `jbpm_comment` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `MESSAGE_` longtext,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `TOKENINDEX_` int(11) DEFAULT NULL,
  `TASKINSTANCEINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_COMMENT_TOKEN` (`TOKEN_`),
  KEY `FK_COMMENT_TSK` (`TASKINSTANCE_`),
  CONSTRAINT `FK_COMMENT_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_COMMENT_TSK` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_comment`
--

/*!40000 ALTER TABLE `jbpm_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_comment` ENABLE KEYS */;


--
-- Definition of table `jbpm_decisionconditions`
--

DROP TABLE IF EXISTS `jbpm_decisionconditions`;
CREATE TABLE `jbpm_decisionconditions` (
  `DECISION_` bigint(20) NOT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `EXPRESSION_` varchar(255) DEFAULT NULL,
  `INDEX_` int(11) NOT NULL,
  PRIMARY KEY (`DECISION_`,`INDEX_`),
  KEY `FK_DECCOND_DEC` (`DECISION_`),
  CONSTRAINT `FK_DECCOND_DEC` FOREIGN KEY (`DECISION_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_decisionconditions`
--

/*!40000 ALTER TABLE `jbpm_decisionconditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_decisionconditions` ENABLE KEYS */;


--
-- Definition of table `jbpm_delegation`
--

DROP TABLE IF EXISTS `jbpm_delegation`;
CREATE TABLE `jbpm_delegation` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASSNAME_` longtext,
  `CONFIGURATION_` longtext,
  `CONFIGTYPE_` varchar(255) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_DELEGATION_PRCD` (`PROCESSDEFINITION_`),
  CONSTRAINT `FK_DELEGATION_PRCD` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_delegation`
--

/*!40000 ALTER TABLE `jbpm_delegation` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_delegation` ENABLE KEYS */;


--
-- Definition of table `jbpm_event`
--

DROP TABLE IF EXISTS `jbpm_event`;
CREATE TABLE `jbpm_event` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `EVENTTYPE_` varchar(255) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_EVENT_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_EVENT_TRANS` (`TRANSITION_`),
  KEY `FK_EVENT_NODE` (`NODE_`),
  KEY `FK_EVENT_TASK` (`TASK_`),
  CONSTRAINT `FK_EVENT_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_EVENT_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_EVENT_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm_task` (`ID_`),
  CONSTRAINT `FK_EVENT_TRANS` FOREIGN KEY (`TRANSITION_`) REFERENCES `jbpm_transition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_event`
--

/*!40000 ALTER TABLE `jbpm_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_event` ENABLE KEYS */;


--
-- Definition of table `jbpm_exceptionhandler`
--

DROP TABLE IF EXISTS `jbpm_exceptionhandler`;
CREATE TABLE `jbpm_exceptionhandler` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `EXCEPTIONCLASSNAME_` longtext,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `GRAPHELEMENTINDEX_` int(11) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_exceptionhandler`
--

/*!40000 ALTER TABLE `jbpm_exceptionhandler` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_exceptionhandler` ENABLE KEYS */;


--
-- Definition of table `jbpm_id_group`
--

DROP TABLE IF EXISTS `jbpm_id_group`;
CREATE TABLE `jbpm_id_group` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_ID_GRP_PARENT` (`PARENT_`),
  CONSTRAINT `FK_ID_GRP_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_id_group` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_id_group`
--

/*!40000 ALTER TABLE `jbpm_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_id_group` ENABLE KEYS */;


--
-- Definition of table `jbpm_id_membership`
--

DROP TABLE IF EXISTS `jbpm_id_membership`;
CREATE TABLE `jbpm_id_membership` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ROLE_` varchar(255) DEFAULT NULL,
  `USER_` bigint(20) DEFAULT NULL,
  `GROUP_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_ID_MEMSHIP_GRP` (`GROUP_`),
  KEY `FK_ID_MEMSHIP_USR` (`USER_`),
  CONSTRAINT `FK_ID_MEMSHIP_GRP` FOREIGN KEY (`GROUP_`) REFERENCES `jbpm_id_group` (`ID_`),
  CONSTRAINT `FK_ID_MEMSHIP_USR` FOREIGN KEY (`USER_`) REFERENCES `jbpm_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_id_membership`
--

/*!40000 ALTER TABLE `jbpm_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_id_membership` ENABLE KEYS */;


--
-- Definition of table `jbpm_id_permissions`
--

DROP TABLE IF EXISTS `jbpm_id_permissions`;
CREATE TABLE `jbpm_id_permissions` (
  `ENTITY_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTION_` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_id_permissions`
--

/*!40000 ALTER TABLE `jbpm_id_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_id_permissions` ENABLE KEYS */;


--
-- Definition of table `jbpm_id_user`
--

DROP TABLE IF EXISTS `jbpm_id_user`;
CREATE TABLE `jbpm_id_user` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `EMAIL_` varchar(255) DEFAULT NULL,
  `PASSWORD_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_id_user`
--

/*!40000 ALTER TABLE `jbpm_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_id_user` ENABLE KEYS */;


--
-- Definition of table `jbpm_log`
--

DROP TABLE IF EXISTS `jbpm_log`;
CREATE TABLE `jbpm_log` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `INDEX_` int(11) DEFAULT NULL,
  `DATE_` datetime DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `MESSAGE_` longtext,
  `EXCEPTION_` longtext,
  `ACTION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `ENTER_` datetime DEFAULT NULL,
  `LEAVE_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEWLONGVALUE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `CHILD_` bigint(20) DEFAULT NULL,
  `SOURCENODE_` bigint(20) DEFAULT NULL,
  `DESTINATIONNODE_` bigint(20) DEFAULT NULL,
  `VARIABLEINSTANCE_` bigint(20) DEFAULT NULL,
  `OLDBYTEARRAY_` bigint(20) DEFAULT NULL,
  `NEWBYTEARRAY_` bigint(20) DEFAULT NULL,
  `OLDDATEVALUE_` datetime DEFAULT NULL,
  `NEWDATEVALUE_` datetime DEFAULT NULL,
  `OLDDOUBLEVALUE_` double DEFAULT NULL,
  `NEWDOUBLEVALUE_` double DEFAULT NULL,
  `OLDLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `NEWLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `OLDLONGVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGVALUE_` longtext,
  `NEWSTRINGVALUE_` longtext,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKACTORID_` varchar(255) DEFAULT NULL,
  `TASKOLDACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_LOG_SOURCENODE` (`SOURCENODE_`),
  KEY `FK_LOG_DESTNODE` (`DESTINATIONNODE_`),
  KEY `FK_LOG_TOKEN` (`TOKEN_`),
  KEY `FK_LOG_TRANSITION` (`TRANSITION_`),
  KEY `FK_LOG_TASKINST` (`TASKINSTANCE_`),
  KEY `FK_LOG_CHILDTOKEN` (`CHILD_`),
  KEY `FK_LOG_OLDBYTES` (`OLDBYTEARRAY_`),
  KEY `FK_LOG_SWIMINST` (`SWIMLANEINSTANCE_`),
  KEY `FK_LOG_NEWBYTES` (`NEWBYTEARRAY_`),
  KEY `FK_LOG_ACTION` (`ACTION_`),
  KEY `FK_LOG_VARINST` (`VARIABLEINSTANCE_`),
  KEY `FK_LOG_NODE` (`NODE_`),
  KEY `FK_LOG_PARENT` (`PARENT_`),
  CONSTRAINT `FK_LOG_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_LOG_CHILDTOKEN` FOREIGN KEY (`CHILD_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_LOG_DESTNODE` FOREIGN KEY (`DESTINATIONNODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_LOG_NEWBYTES` FOREIGN KEY (`NEWBYTEARRAY_`) REFERENCES `jbpm_bytearray` (`ID_`),
  CONSTRAINT `FK_LOG_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_LOG_OLDBYTES` FOREIGN KEY (`OLDBYTEARRAY_`) REFERENCES `jbpm_bytearray` (`ID_`),
  CONSTRAINT `FK_LOG_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_log` (`ID_`),
  CONSTRAINT `FK_LOG_SOURCENODE` FOREIGN KEY (`SOURCENODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_LOG_SWIMINST` FOREIGN KEY (`SWIMLANEINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`),
  CONSTRAINT `FK_LOG_TASKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  CONSTRAINT `FK_LOG_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_LOG_TRANSITION` FOREIGN KEY (`TRANSITION_`) REFERENCES `jbpm_transition` (`ID_`),
  CONSTRAINT `FK_LOG_VARINST` FOREIGN KEY (`VARIABLEINSTANCE_`) REFERENCES `jbpm_variableinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_log`
--

/*!40000 ALTER TABLE `jbpm_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_log` ENABLE KEYS */;


--
-- Definition of table `jbpm_message`
--

DROP TABLE IF EXISTS `jbpm_message`;
CREATE TABLE `jbpm_message` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `DESTINATION_` varchar(255) DEFAULT NULL,
  `EXCEPTION_` longtext,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(255) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_CMD_ACTION` (`ACTION_`),
  KEY `FK_MSG_TOKEN` (`TOKEN_`),
  KEY `FK_CMD_NODE` (`NODE_`),
  KEY `FK_CMD_TASKINST` (`TASKINSTANCE_`),
  CONSTRAINT `FK_CMD_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_CMD_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_CMD_TASKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  CONSTRAINT `FK_MSG_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_message`
--

/*!40000 ALTER TABLE `jbpm_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_message` ENABLE KEYS */;


--
-- Definition of table `jbpm_moduledefinition`
--

DROP TABLE IF EXISTS `jbpm_moduledefinition`;
CREATE TABLE `jbpm_moduledefinition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` longtext,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `STARTTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_MODDEF_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TSKDEF_START` (`STARTTASK_`),
  CONSTRAINT `FK_MODDEF_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_TSKDEF_START` FOREIGN KEY (`STARTTASK_`) REFERENCES `jbpm_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_moduledefinition`
--

/*!40000 ALTER TABLE `jbpm_moduledefinition` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_moduledefinition` ENABLE KEYS */;


--
-- Definition of table `jbpm_moduleinstance`
--

DROP TABLE IF EXISTS `jbpm_moduleinstance`;
CREATE TABLE `jbpm_moduleinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_MODINST_PRCINST` (`PROCESSINSTANCE_`),
  KEY `FK_TASKMGTINST_TMD` (`TASKMGMTDEFINITION_`),
  CONSTRAINT `FK_MODINST_PRCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_TASKMGTINST_TMD` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_moduleinstance`
--

/*!40000 ALTER TABLE `jbpm_moduleinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_moduleinstance` ENABLE KEYS */;


--
-- Definition of table `jbpm_node`
--

DROP TABLE IF EXISTS `jbpm_node`;
CREATE TABLE `jbpm_node` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ISASYNC_` bit(1) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `SUPERSTATE_` bigint(20) DEFAULT NULL,
  `SUBPROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `DECISIONEXPRESSION_` varchar(255) DEFAULT NULL,
  `DECISIONDELEGATION` bigint(20) DEFAULT NULL,
  `SIGNAL_` int(11) DEFAULT NULL,
  `CREATETASKS_` bit(1) DEFAULT NULL,
  `ENDTASKS_` bit(1) DEFAULT NULL,
  `NODECOLLECTIONINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_DECISION_DELEG` (`DECISIONDELEGATION`),
  KEY `FK_NODE_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_NODE_ACTION` (`ACTION_`),
  KEY `FK_PROCST_SBPRCDEF` (`SUBPROCESSDEFINITION_`),
  KEY `FK_NODE_SUPERSTATE` (`SUPERSTATE_`),
  CONSTRAINT `FK_DECISION_DELEG` FOREIGN KEY (`DECISIONDELEGATION`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_NODE_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_NODE_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_NODE_SUPERSTATE` FOREIGN KEY (`SUPERSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_PROCST_SBPRCDEF` FOREIGN KEY (`SUBPROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_node`
--

/*!40000 ALTER TABLE `jbpm_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_node` ENABLE KEYS */;


--
-- Definition of table `jbpm_pooledactor`
--

DROP TABLE IF EXISTS `jbpm_pooledactor`;
CREATE TABLE `jbpm_pooledactor` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_PLDACTR_ACTID` (`ACTORID_`),
  KEY `FK_POOLEDACTOR_SLI` (`SWIMLANEINSTANCE_`),
  CONSTRAINT `FK_POOLEDACTOR_SLI` FOREIGN KEY (`SWIMLANEINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_pooledactor`
--

/*!40000 ALTER TABLE `jbpm_pooledactor` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_pooledactor` ENABLE KEYS */;


--
-- Definition of table `jbpm_processdefinition`
--

DROP TABLE IF EXISTS `jbpm_processdefinition`;
CREATE TABLE `jbpm_processdefinition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) DEFAULT NULL,
  `STARTSTATE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_PROCDEF_STRTSTA` (`STARTSTATE_`),
  CONSTRAINT `FK_PROCDEF_STRTSTA` FOREIGN KEY (`STARTSTATE_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_processdefinition`
--

/*!40000 ALTER TABLE `jbpm_processdefinition` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_processdefinition` ENABLE KEYS */;


--
-- Definition of table `jbpm_processinstance`
--

DROP TABLE IF EXISTS `jbpm_processinstance`;
CREATE TABLE `jbpm_processinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ROOTTOKEN_` bigint(20) DEFAULT NULL,
  `SUPERPROCESSTOKEN_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_PROCIN_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_PROCIN_ROOTTKN` (`ROOTTOKEN_`),
  KEY `FK_PROCIN_SPROCTKN` (`SUPERPROCESSTOKEN_`),
  CONSTRAINT `FK_PROCIN_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_PROCIN_ROOTTKN` FOREIGN KEY (`ROOTTOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_PROCIN_SPROCTKN` FOREIGN KEY (`SUPERPROCESSTOKEN_`) REFERENCES `jbpm_token` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_processinstance`
--

/*!40000 ALTER TABLE `jbpm_processinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_processinstance` ENABLE KEYS */;


--
-- Definition of table `jbpm_runtimeaction`
--

DROP TABLE IF EXISTS `jbpm_runtimeaction`;
CREATE TABLE `jbpm_runtimeaction` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `EVENTTYPE_` varchar(255) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCEINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_RTACTN_PROCINST` (`PROCESSINSTANCE_`),
  KEY `FK_RTACTN_ACTION` (`ACTION_`),
  CONSTRAINT `FK_RTACTN_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_RTACTN_PROCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_runtimeaction`
--

/*!40000 ALTER TABLE `jbpm_runtimeaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_runtimeaction` ENABLE KEYS */;


--
-- Definition of table `jbpm_swimlane`
--

DROP TABLE IF EXISTS `jbpm_swimlane`;
CREATE TABLE `jbpm_swimlane` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTORIDEXPRESSION_` varchar(255) DEFAULT NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) DEFAULT NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_SWL_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  KEY `FK_SWL_TSKMGMTDEF` (`TASKMGMTDEFINITION_`),
  CONSTRAINT `FK_SWL_ASSDEL` FOREIGN KEY (`ASSIGNMENTDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_SWL_TSKMGMTDEF` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_swimlane`
--

/*!40000 ALTER TABLE `jbpm_swimlane` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_swimlane` ENABLE KEYS */;


--
-- Definition of table `jbpm_swimlaneinstance`
--

DROP TABLE IF EXISTS `jbpm_swimlaneinstance`;
CREATE TABLE `jbpm_swimlaneinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKMGMTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_SWIMLANEINST_TM` (`TASKMGMTINSTANCE_`),
  KEY `FK_SWIMLANEINST_SL` (`SWIMLANE_`),
  CONSTRAINT `FK_SWIMLANEINST_SL` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm_swimlane` (`ID_`),
  CONSTRAINT `FK_SWIMLANEINST_TM` FOREIGN KEY (`TASKMGMTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_swimlaneinstance`
--

/*!40000 ALTER TABLE `jbpm_swimlaneinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_swimlaneinstance` ENABLE KEYS */;


--
-- Definition of table `jbpm_task`
--

DROP TABLE IF EXISTS `jbpm_task`;
CREATE TABLE `jbpm_task` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `DESCRIPTION_` longtext,
  `ISBLOCKING_` bit(1) DEFAULT NULL,
  `ISSIGNALLING_` bit(1) DEFAULT NULL,
  `DUEDATE_` varchar(255) DEFAULT NULL,
  `ACTORIDEXPRESSION_` varchar(255) DEFAULT NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  `TASKNODE_` bigint(20) DEFAULT NULL,
  `STARTSTATE_` bigint(20) DEFAULT NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKCONTROLLER_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TASK_STARTST` (`STARTSTATE_`),
  KEY `FK_TASK_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TASK_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  KEY `FK_TASK_SWIMLANE` (`SWIMLANE_`),
  KEY `FK_TASK_TASKNODE` (`TASKNODE_`),
  KEY `FK_TASK_TASKMGTDEF` (`TASKMGMTDEFINITION_`),
  KEY `FK_TSK_TSKCTRL` (`TASKCONTROLLER_`),
  CONSTRAINT `FK_TASK_ASSDEL` FOREIGN KEY (`ASSIGNMENTDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_TASK_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_TASK_STARTST` FOREIGN KEY (`STARTSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TASK_SWIMLANE` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm_swimlane` (`ID_`),
  CONSTRAINT `FK_TASK_TASKMGTDEF` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`),
  CONSTRAINT `FK_TASK_TASKNODE` FOREIGN KEY (`TASKNODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TSK_TSKCTRL` FOREIGN KEY (`TASKCONTROLLER_`) REFERENCES `jbpm_taskcontroller` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_task`
--

/*!40000 ALTER TABLE `jbpm_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_task` ENABLE KEYS */;


--
-- Definition of table `jbpm_taskactorpool`
--

DROP TABLE IF EXISTS `jbpm_taskactorpool`;
CREATE TABLE `jbpm_taskactorpool` (
  `TASKINSTANCE_` bigint(20) NOT NULL,
  `POOLEDACTOR_` bigint(20) NOT NULL,
  PRIMARY KEY (`TASKINSTANCE_`,`POOLEDACTOR_`),
  KEY `FK_TASKACTPL_TSKI` (`TASKINSTANCE_`),
  KEY `FK_TSKACTPOL_PLACT` (`POOLEDACTOR_`),
  CONSTRAINT `FK_TASKACTPL_TSKI` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  CONSTRAINT `FK_TSKACTPOL_PLACT` FOREIGN KEY (`POOLEDACTOR_`) REFERENCES `jbpm_pooledactor` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_taskactorpool`
--

/*!40000 ALTER TABLE `jbpm_taskactorpool` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_taskactorpool` ENABLE KEYS */;


--
-- Definition of table `jbpm_taskcontroller`
--

DROP TABLE IF EXISTS `jbpm_taskcontroller`;
CREATE TABLE `jbpm_taskcontroller` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TASKCONTROLLERDELEGATION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TSKCTRL_DELEG` (`TASKCONTROLLERDELEGATION_`),
  CONSTRAINT `FK_TSKCTRL_DELEG` FOREIGN KEY (`TASKCONTROLLERDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_taskcontroller`
--

/*!40000 ALTER TABLE `jbpm_taskcontroller` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_taskcontroller` ENABLE KEYS */;


--
-- Definition of table `jbpm_taskinstance`
--

DROP TABLE IF EXISTS `jbpm_taskinstance`;
CREATE TABLE `jbpm_taskinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` longtext,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `ISCANCELLED_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `ISOPEN_` bit(1) DEFAULT NULL,
  `ISSIGNALLING_` bit(1) DEFAULT NULL,
  `ISBLOCKING_` bit(1) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `SWIMLANINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_TASK_ACTORID` (`ACTORID_`),
  KEY `FK_TASKINST_TMINST` (`TASKMGMTINSTANCE_`),
  KEY `FK_TASKINST_TOKEN` (`TOKEN_`),
  KEY `FK_TASKINST_SLINST` (`SWIMLANINSTANCE_`),
  KEY `FK_TASKINST_TASK` (`TASK_`),
  CONSTRAINT `FK_TASKINST_SLINST` FOREIGN KEY (`SWIMLANINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`),
  CONSTRAINT `FK_TASKINST_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm_task` (`ID_`),
  CONSTRAINT `FK_TASKINST_TMINST` FOREIGN KEY (`TASKMGMTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`),
  CONSTRAINT `FK_TASKINST_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_taskinstance`
--

/*!40000 ALTER TABLE `jbpm_taskinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_taskinstance` ENABLE KEYS */;


--
-- Definition of table `jbpm_timer`
--

DROP TABLE IF EXISTS `jbpm_timer`;
CREATE TABLE `jbpm_timer` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `EXCEPTION_` longtext,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `GRAPHELEMENTTYPE_` varchar(255) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TIMER_PRINST` (`PROCESSINSTANCE_`),
  KEY `FK_TIMER_TOKEN` (`TOKEN_`),
  KEY `FK_TIMER_ACTION` (`ACTION_`),
  KEY `FK_TIMER_TSKINST` (`TASKINSTANCE_`),
  CONSTRAINT `FK_TIMER_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_TIMER_PRINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_TIMER_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_TIMER_TSKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_timer`
--

/*!40000 ALTER TABLE `jbpm_timer` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_timer` ENABLE KEYS */;


--
-- Definition of table `jbpm_token`
--

DROP TABLE IF EXISTS `jbpm_token`;
CREATE TABLE `jbpm_token` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `NODEENTER_` datetime DEFAULT NULL,
  `NEXTLOGINDEX_` int(11) DEFAULT NULL,
  `ISABLETOREACTIVATEPARENT_` bit(1) DEFAULT NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `SUBPROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TOKEN_SUBPI` (`SUBPROCESSINSTANCE_`),
  KEY `FK_TOKEN_PROCINST` (`PROCESSINSTANCE_`),
  KEY `FK_TOKEN_NODE` (`NODE_`),
  KEY `FK_TOKEN_PARENT` (`PARENT_`),
  CONSTRAINT `FK_TOKEN_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TOKEN_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_TOKEN_PROCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_TOKEN_SUBPI` FOREIGN KEY (`SUBPROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_token`
--

/*!40000 ALTER TABLE `jbpm_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_token` ENABLE KEYS */;


--
-- Definition of table `jbpm_tokenvariablemap`
--

DROP TABLE IF EXISTS `jbpm_tokenvariablemap`;
CREATE TABLE `jbpm_tokenvariablemap` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `CONTEXTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TKVARMAP_TOKEN` (`TOKEN_`),
  KEY `FK_TKVARMAP_CTXT` (`CONTEXTINSTANCE_`),
  CONSTRAINT `FK_TKVARMAP_CTXT` FOREIGN KEY (`CONTEXTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`),
  CONSTRAINT `FK_TKVARMAP_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_tokenvariablemap`
--

/*!40000 ALTER TABLE `jbpm_tokenvariablemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_tokenvariablemap` ENABLE KEYS */;


--
-- Definition of table `jbpm_transition`
--

DROP TABLE IF EXISTS `jbpm_transition`;
CREATE TABLE `jbpm_transition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `FROM_` bigint(20) DEFAULT NULL,
  `TO_` bigint(20) DEFAULT NULL,
  `FROMINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TRANSITION_FROM` (`FROM_`),
  KEY `FK_TRANS_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TRANSITION_TO` (`TO_`),
  CONSTRAINT `FK_TRANSITION_FROM` FOREIGN KEY (`FROM_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TRANSITION_TO` FOREIGN KEY (`TO_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TRANS_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_transition`
--

/*!40000 ALTER TABLE `jbpm_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_transition` ENABLE KEYS */;


--
-- Definition of table `jbpm_variableaccess`
--

DROP TABLE IF EXISTS `jbpm_variableaccess`;
CREATE TABLE `jbpm_variableaccess` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VARIABLENAME_` varchar(255) DEFAULT NULL,
  `ACCESS_` varchar(255) DEFAULT NULL,
  `MAPPEDNAME_` varchar(255) DEFAULT NULL,
  `PROCESSSTATE_` bigint(20) DEFAULT NULL,
  `TASKCONTROLLER_` bigint(20) DEFAULT NULL,
  `INDEX_` int(11) DEFAULT NULL,
  `SCRIPT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_VARACC_PROCST` (`PROCESSSTATE_`),
  KEY `FK_VARACC_SCRIPT` (`SCRIPT_`),
  KEY `FK_VARACC_TSKCTRL` (`TASKCONTROLLER_`),
  CONSTRAINT `FK_VARACC_PROCST` FOREIGN KEY (`PROCESSSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_VARACC_SCRIPT` FOREIGN KEY (`SCRIPT_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_VARACC_TSKCTRL` FOREIGN KEY (`TASKCONTROLLER_`) REFERENCES `jbpm_taskcontroller` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_variableaccess`
--

/*!40000 ALTER TABLE `jbpm_variableaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_variableaccess` ENABLE KEYS */;


--
-- Definition of table `jbpm_variableinstance`
--

DROP TABLE IF EXISTS `jbpm_variableinstance`;
CREATE TABLE `jbpm_variableinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CONVERTER_` char(1) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TOKENVARIABLEMAP_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `BYTEARRAYVALUE_` bigint(20) DEFAULT NULL,
  `DATEVALUE_` datetime DEFAULT NULL,
  `DOUBLEVALUE_` double DEFAULT NULL,
  `LONGIDCLASS_` varchar(255) DEFAULT NULL,
  `LONGVALUE_` bigint(20) DEFAULT NULL,
  `STRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `STRINGVALUE_` varchar(255) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_VARINST_PRCINST` (`PROCESSINSTANCE_`),
  KEY `FK_VARINST_TKVARMP` (`TOKENVARIABLEMAP_`),
  KEY `FK_VARINST_TK` (`TOKEN_`),
  KEY `FK_BYTEINST_ARRAY` (`BYTEARRAYVALUE_`),
  KEY `FK_VAR_TSKINST` (`TASKINSTANCE_`),
  CONSTRAINT `FK_BYTEINST_ARRAY` FOREIGN KEY (`BYTEARRAYVALUE_`) REFERENCES `jbpm_bytearray` (`ID_`),
  CONSTRAINT `FK_VARINST_PRCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_VARINST_TK` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_VARINST_TKVARMP` FOREIGN KEY (`TOKENVARIABLEMAP_`) REFERENCES `jbpm_tokenvariablemap` (`ID_`),
  CONSTRAINT `FK_VAR_TSKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_variableinstance`
--

/*!40000 ALTER TABLE `jbpm_variableinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_variableinstance` ENABLE KEYS */;


--
-- Definition of table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `TRIGGER_NAME` varchar(80) NOT NULL,
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_blob_triggers`
--

/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;


--
-- Definition of table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `CALENDAR_NAME` varchar(80) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_calendars`
--

/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;


--
-- Definition of table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `TRIGGER_NAME` varchar(80) NOT NULL,
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  `CRON_EXPRESSION` varchar(80) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_cron_triggers`
--

/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` (`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) VALUES 
 ('schedule_uuid_0b7a2bed-4f54-11e3-a333-396e9b914281','DEFAULT','0 0/5 * * * ? *','Asia/Calcutta');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;


--
-- Definition of table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(80) NOT NULL,
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `INSTANCE_NAME` varchar(80) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(80) DEFAULT NULL,
  `JOB_GROUP` varchar(80) DEFAULT NULL,
  `IS_STATEFUL` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_fired_triggers`
--

/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;


--
-- Definition of table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `JOB_NAME` varchar(80) NOT NULL,
  `JOB_GROUP` varchar(80) NOT NULL,
  `DESCRIPTION` varchar(120) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(128) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `IS_STATEFUL` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_job_details`
--

/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` (`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_VOLATILE`,`IS_STATEFUL`,`REQUESTS_RECOVERY`,`JOB_DATA`) VALUES 
 ('AlarmInspectorJob','SPAGOBI/AlarmInspectorJob','AlarmInspectorJob','it.eng.spagobi.kpi.alarm.service.AlarmInspectorJob','1','0','0','1',0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000007800);
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;


--
-- Definition of table `qrtz_job_listeners`
--

DROP TABLE IF EXISTS `qrtz_job_listeners`;
CREATE TABLE `qrtz_job_listeners` (
  `JOB_NAME` varchar(80) NOT NULL,
  `JOB_GROUP` varchar(80) NOT NULL,
  `JOB_LISTENER` varchar(80) NOT NULL,
  PRIMARY KEY (`JOB_NAME`,`JOB_GROUP`,`JOB_LISTENER`),
  KEY `JOB_NAME` (`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_job_listeners_ibfk_1` FOREIGN KEY (`JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_job_listeners`
--

/*!40000 ALTER TABLE `qrtz_job_listeners` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_listeners` ENABLE KEYS */;


--
-- Definition of table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_locks`
--

/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` (`LOCK_NAME`) VALUES 
 ('CALENDAR_ACCESS'),
 ('JOB_ACCESS'),
 ('MISFIRE_ACCESS'),
 ('STATE_ACCESS'),
 ('TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;


--
-- Definition of table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  PRIMARY KEY (`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;


--
-- Definition of table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `INSTANCE_NAME` varchar(80) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_scheduler_state`
--

/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;


--
-- Definition of table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `TRIGGER_NAME` varchar(80) NOT NULL,
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(7) NOT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_simple_triggers`
--

/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;


--
-- Definition of table `qrtz_trigger_listeners`
--

DROP TABLE IF EXISTS `qrtz_trigger_listeners`;
CREATE TABLE `qrtz_trigger_listeners` (
  `TRIGGER_NAME` varchar(80) NOT NULL,
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  `TRIGGER_LISTENER` varchar(80) NOT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_LISTENER`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_trigger_listeners_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_trigger_listeners`
--

/*!40000 ALTER TABLE `qrtz_trigger_listeners` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_trigger_listeners` ENABLE KEYS */;


--
-- Definition of table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `TRIGGER_NAME` varchar(80) NOT NULL,
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  `JOB_NAME` varchar(80) NOT NULL,
  `JOB_GROUP` varchar(80) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `DESCRIPTION` varchar(120) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(80) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `JOB_NAME` (`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_triggers`
--

/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` (`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`IS_VOLATILE`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) VALUES 
 ('schedule_uuid_0b7a2bed-4f54-11e3-a333-396e9b914281','DEFAULT','AlarmInspectorJob','SPAGOBI/AlarmInspectorJob','0',NULL,1385205000000,1385204700000,5,'WAITING','CRON',1325356200000,0,NULL,0,0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740015737061676F424963726F6E45787072657373696F6E7400176D696E7574657B6E756D52657065746974696F6E3D357D7800);
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;


--
-- Definition of table `sbi_activity_monitoring`
--

DROP TABLE IF EXISTS `sbi_activity_monitoring`;
CREATE TABLE `sbi_activity_monitoring` (
  `ID` int(10) unsigned NOT NULL,
  `ACTION_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USERNAME` varchar(40) NOT NULL,
  `USERGROUP` varchar(400) DEFAULT NULL,
  `LOG_LEVEL` varchar(10) DEFAULT NULL,
  `ACTION_CODE` varchar(45) NOT NULL,
  `INFO` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_activity_monitoring`
--

/*!40000 ALTER TABLE `sbi_activity_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_activity_monitoring` ENABLE KEYS */;


--
-- Definition of table `sbi_alarm`
--

DROP TABLE IF EXISTS `sbi_alarm`;
CREATE TABLE `sbi_alarm` (
  `ALARM_ID` int(11) NOT NULL,
  `ID_KPI_INSTANCE` int(11) DEFAULT NULL,
  `MODALITY_ID` int(11) NOT NULL,
  `DOCUMENT_ID` int(11) DEFAULT NULL,
  `LABEL` varchar(50) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `DESCR` varchar(200) DEFAULT NULL,
  `TEXT` varchar(1000) DEFAULT NULL,
  `URL` varchar(20) DEFAULT NULL,
  `SINGLE_EVENT` char(1) DEFAULT NULL,
  `AUTO_DISABLED` char(1) DEFAULT NULL,
  `ID_THRESHOLD_VALUE` int(11) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ALARM_ID`),
  UNIQUE KEY `XIF1SBI_ALARM` (`LABEL`,`ORGANIZATION`),
  KEY `FK_SBI_ALARM_1` (`MODALITY_ID`),
  KEY `FK_SBI_ALARM_2` (`DOCUMENT_ID`),
  KEY `FK_SBI_ALARM_3` (`ID_KPI_INSTANCE`),
  KEY `FK_SBI_ALARM_4` (`ID_THRESHOLD_VALUE`),
  CONSTRAINT `FK_SBI_ALARM_1` FOREIGN KEY (`MODALITY_ID`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_ALARM_2` FOREIGN KEY (`DOCUMENT_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`),
  CONSTRAINT `FK_SBI_ALARM_3` FOREIGN KEY (`ID_KPI_INSTANCE`) REFERENCES `sbi_kpi_instance` (`ID_KPI_INSTANCE`),
  CONSTRAINT `FK_SBI_ALARM_4` FOREIGN KEY (`ID_THRESHOLD_VALUE`) REFERENCES `sbi_threshold_value` (`ID_THRESHOLD_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_alarm`
--

/*!40000 ALTER TABLE `sbi_alarm` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_alarm` ENABLE KEYS */;


--
-- Definition of table `sbi_alarm_contact`
--

DROP TABLE IF EXISTS `sbi_alarm_contact`;
CREATE TABLE `sbi_alarm_contact` (
  `ALARM_CONTACT_ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `MOBILE` varchar(50) DEFAULT NULL,
  `RESOURCES` varchar(200) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ALARM_CONTACT_ID`),
  UNIQUE KEY `XIF1SBI_ALARM_CONTACT` (`NAME`,`ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_alarm_contact`
--

/*!40000 ALTER TABLE `sbi_alarm_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_alarm_contact` ENABLE KEYS */;


--
-- Definition of table `sbi_alarm_distribution`
--

DROP TABLE IF EXISTS `sbi_alarm_distribution`;
CREATE TABLE `sbi_alarm_distribution` (
  `ALARM_CONTACT_ID` int(11) NOT NULL,
  `ALARM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ALARM_CONTACT_ID`,`ALARM_ID`),
  KEY `FK_SBI_ALARM_DISTRIBUTION_1` (`ALARM_ID`),
  CONSTRAINT `FK_SBI_ALARM_DISTRIBUTION_1` FOREIGN KEY (`ALARM_ID`) REFERENCES `sbi_alarm` (`ALARM_ID`),
  CONSTRAINT `FK_SBI_ALARM_DISTRIBUTION_2` FOREIGN KEY (`ALARM_CONTACT_ID`) REFERENCES `sbi_alarm_contact` (`ALARM_CONTACT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_alarm_distribution`
--

/*!40000 ALTER TABLE `sbi_alarm_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_alarm_distribution` ENABLE KEYS */;


--
-- Definition of table `sbi_alarm_event`
--

DROP TABLE IF EXISTS `sbi_alarm_event`;
CREATE TABLE `sbi_alarm_event` (
  `ALARM_EVENT_ID` int(11) NOT NULL,
  `ALARM_ID` int(11) NOT NULL,
  `EVENT_TS` datetime DEFAULT NULL,
  `ACTIVE` char(1) DEFAULT NULL,
  `KPI_VALUE` varchar(50) DEFAULT NULL,
  `THRESHOLD_VALUE` varchar(50) DEFAULT NULL,
  `KPI_NAME` varchar(100) DEFAULT NULL,
  `RESOURCES` varchar(200) DEFAULT NULL,
  `KPI_DESCRIPTION` varchar(100) DEFAULT NULL,
  `RESOURCE_ID` int(11) DEFAULT NULL,
  `KPI_INSTANCE_ID` int(11) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ALARM_EVENT_ID`),
  KEY `FK_SBI_ALARM_EVENT_1` (`ALARM_ID`),
  CONSTRAINT `FK_SBI_ALARM_EVENT_1` FOREIGN KEY (`ALARM_ID`) REFERENCES `sbi_alarm` (`ALARM_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_alarm_event`
--

/*!40000 ALTER TABLE `sbi_alarm_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_alarm_event` ENABLE KEYS */;


--
-- Definition of table `sbi_artifacts`
--

DROP TABLE IF EXISTS `sbi_artifacts`;
CREATE TABLE `sbi_artifacts` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCR` varchar(500) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `XAK1SBI_ARTIFACTS` (`NAME`,`TYPE`,`ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_artifacts`
--

/*!40000 ALTER TABLE `sbi_artifacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_artifacts` ENABLE KEYS */;


--
-- Definition of table `sbi_artifacts_versions`
--

DROP TABLE IF EXISTS `sbi_artifacts_versions`;
CREATE TABLE `sbi_artifacts_versions` (
  `ID` int(11) NOT NULL,
  `ARTIFACT_ID` int(11) NOT NULL,
  `CONTENT` mediumblob NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PROG` int(11) DEFAULT NULL,
  `CREATION_DATE` timestamp NULL DEFAULT NULL,
  `CREATION_USER` varchar(50) NOT NULL,
  `ACTIVE` tinyint(1) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SBI_ARTIFACTS_VERSIONS_1` (`ARTIFACT_ID`),
  CONSTRAINT `FK_SBI_ARTIFACTS_VERSIONS_1` FOREIGN KEY (`ARTIFACT_ID`) REFERENCES `sbi_artifacts` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_artifacts_versions`
--

/*!40000 ALTER TABLE `sbi_artifacts_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_artifacts_versions` ENABLE KEYS */;


--
-- Definition of table `sbi_attribute`
--

DROP TABLE IF EXISTS `sbi_attribute`;
CREATE TABLE `sbi_attribute` (
  `ATTRIBUTE_NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(500) NOT NULL,
  `ATTRIBUTE_ID` int(11) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ATTRIBUTE_ID`),
  UNIQUE KEY `XAK1SBI_USER` (`ATTRIBUTE_NAME`,`ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_attribute`
--

/*!40000 ALTER TABLE `sbi_attribute` DISABLE KEYS */;
INSERT INTO `sbi_attribute` (`ATTRIBUTE_NAME`,`DESCRIPTION`,`ATTRIBUTE_ID`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 ('name','name',1,'server_init',NULL,NULL,'2013-11-17 11:18:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 ('surname','surname',2,'server_init',NULL,NULL,'2013-11-17 11:18:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 ('address','address',3,'server_init',NULL,NULL,'2013-11-17 11:18:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 ('birth_date','birth date',4,'server_init',NULL,NULL,'2013-11-17 11:18:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 ('email','email',5,'server_init',NULL,NULL,'2013-11-17 11:18:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_attribute` ENABLE KEYS */;


--
-- Definition of table `sbi_audit`
--

DROP TABLE IF EXISTS `sbi_audit`;
CREATE TABLE `sbi_audit` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(40) NOT NULL,
  `USERGROUP` varchar(100) DEFAULT NULL,
  `DOC_REF` int(11) DEFAULT NULL,
  `DOC_ID` int(11) DEFAULT NULL,
  `DOC_LABEL` varchar(20) NOT NULL,
  `DOC_NAME` varchar(40) NOT NULL,
  `DOC_TYPE` varchar(20) NOT NULL,
  `DOC_STATE` varchar(20) NOT NULL,
  `DOC_PARAMETERS` text,
  `SUBOBJ_REF` int(11) DEFAULT NULL,
  `SUBOBJ_ID` int(11) DEFAULT NULL,
  `SUBOBJ_NAME` varchar(50) DEFAULT NULL,
  `SUBOBJ_OWNER` varchar(50) DEFAULT NULL,
  `SUBOBJ_ISPUBLIC` smallint(6) DEFAULT NULL,
  `ENGINE_REF` int(11) DEFAULT NULL,
  `ENGINE_ID` int(11) DEFAULT NULL,
  `ENGINE_LABEL` varchar(40) NOT NULL,
  `ENGINE_NAME` varchar(40) NOT NULL,
  `ENGINE_TYPE` varchar(20) NOT NULL,
  `ENGINE_URL` varchar(400) DEFAULT NULL,
  `ENGINE_DRIVER` varchar(400) DEFAULT NULL,
  `ENGINE_CLASS` varchar(400) DEFAULT NULL,
  `REQUEST_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EXECUTION_START` timestamp NULL DEFAULT NULL,
  `EXECUTION_END` timestamp NULL DEFAULT NULL,
  `EXECUTION_TIME` int(11) DEFAULT NULL,
  `EXECUTION_STATE` varchar(20) DEFAULT NULL,
  `ERROR` smallint(6) DEFAULT NULL,
  `ERROR_MESSAGE` varchar(400) DEFAULT NULL,
  `ERROR_CODE` varchar(20) DEFAULT NULL,
  `EXECUTION_MODALITY` varchar(40) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SBI_AUDIT_1` (`DOC_REF`),
  KEY `FK_SBI_AUDIT_2` (`ENGINE_REF`),
  KEY `FK_SBI_AUDIT_3` (`SUBOBJ_REF`),
  CONSTRAINT `FK_SBI_AUDIT_1` FOREIGN KEY (`DOC_REF`) REFERENCES `sbi_objects` (`BIOBJ_ID`) ON DELETE SET NULL,
  CONSTRAINT `FK_SBI_AUDIT_2` FOREIGN KEY (`ENGINE_REF`) REFERENCES `sbi_engines` (`ENGINE_ID`) ON DELETE SET NULL,
  CONSTRAINT `FK_SBI_AUDIT_3` FOREIGN KEY (`SUBOBJ_REF`) REFERENCES `sbi_subobjects` (`SUBOBJ_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_audit`
--

/*!40000 ALTER TABLE `sbi_audit` DISABLE KEYS */;
INSERT INTO `sbi_audit` (`ID`,`USERNAME`,`USERGROUP`,`DOC_REF`,`DOC_ID`,`DOC_LABEL`,`DOC_NAME`,`DOC_TYPE`,`DOC_STATE`,`DOC_PARAMETERS`,`SUBOBJ_REF`,`SUBOBJ_ID`,`SUBOBJ_NAME`,`SUBOBJ_OWNER`,`SUBOBJ_ISPUBLIC`,`ENGINE_REF`,`ENGINE_ID`,`ENGINE_LABEL`,`ENGINE_NAME`,`ENGINE_TYPE`,`ENGINE_URL`,`ENGINE_DRIVER`,`ENGINE_CLASS`,`REQUEST_TIME`,`EXECUTION_START`,`EXECUTION_END`,`EXECUTION_TIME`,`EXECUTION_STATE`,`ERROR`,`ERROR_MESSAGE`,`ERROR_CODE`,`EXECUTION_MODALITY`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 19:49:55','2013-11-20 19:49:55','2013-11-20 19:49:57',2,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 19:49:55','2013-11-20 19:49:57',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (2,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 19:51:58','2013-11-20 19:51:58','2013-11-20 19:51:59',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 19:51:58','2013-11-20 19:51:59',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 19:56:05','2013-11-20 19:56:06','2013-11-20 19:56:06',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 19:56:05','2013-11-20 19:56:06',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (4,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 19:57:33','2013-11-20 19:57:33','2013-11-20 19:57:33',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 19:57:33','2013-11-20 19:57:33',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (5,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 19:59:46','2013-11-20 19:59:46','2013-11-20 19:59:46',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 19:59:46','2013-11-20 19:59:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (6,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 20:03:04','2013-11-20 20:03:04','2013-11-20 20:03:05',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 20:03:04','2013-11-20 20:03:05',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (7,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 20:03:44','2013-11-20 20:03:44','2013-11-20 20:03:44',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 20:03:44','2013-11-20 20:03:44',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (8,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 20:13:56','2013-11-20 20:13:56','2013-11-20 20:13:56',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 20:13:56','2013-11-20 20:13:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (9,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 20:16:17','2013-11-20 20:16:17','2013-11-20 20:16:18',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 20:16:17','2013-11-20 20:16:18',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (10,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 20:16:44','2013-11-20 20:16:44','2013-11-20 20:16:45',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 20:16:44','2013-11-20 20:16:45',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (11,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 20:20:13','2013-11-20 20:20:13','2013-11-20 20:20:13',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 20:20:13','2013-11-20 20:20:13',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (12,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 20:22:42','2013-11-20 20:22:42','2013-11-20 20:22:42',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 20:22:42','2013-11-20 20:22:42',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (13,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 20:24:04','2013-11-20 20:24:04','2013-11-20 20:24:05',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 20:24:04','2013-11-20 20:24:05',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (14,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 20:25:26','2013-11-20 20:25:26','2013-11-20 20:25:26',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 20:25:26','2013-11-20 20:25:26',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (15,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 20:29:21','2013-11-20 20:29:21','2013-11-20 20:29:21',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 20:29:21','2013-11-20 20:29:21',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (16,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000002',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 20:29:38','2013-11-20 20:29:38','2013-11-20 20:29:39',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 20:29:38','2013-11-20 20:29:39',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (17,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000003',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 20:29:49','2013-11-20 20:29:49','2013-11-20 20:29:50',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 20:29:49','2013-11-20 20:29:50',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (18,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-20 20:29:58','2013-11-20 20:29:58','2013-11-20 20:29:58',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-20 20:29:58','2013-11-20 20:29:58',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (19,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 09:25:38','2013-11-23 09:25:39','2013-11-23 09:25:39',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 09:25:38','2013-11-23 09:25:39',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (20,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 09:25:40','2013-11-23 09:25:40','2013-11-23 09:25:40',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 09:25:40','2013-11-23 09:25:40',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (21,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 09:25:46','2013-11-23 09:25:46','2013-11-23 09:25:46',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 09:25:46','2013-11-23 09:25:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (22,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 09:28:38','2013-11-23 09:28:38','2013-11-23 09:28:38',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 09:28:38','2013-11-23 09:28:38',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (23,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 09:29:24','2013-11-23 09:29:24','2013-11-23 09:29:24',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 09:29:24','2013-11-23 09:29:24',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (24,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 09:35:56','2013-11-23 09:35:57','2013-11-23 09:35:57',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 09:35:56','2013-11-23 09:35:57',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (25,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 09:38:48','2013-11-23 09:38:48','2013-11-23 09:38:48',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 09:38:48','2013-11-23 09:38:48',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (26,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 09:46:06','2013-11-23 09:46:06','2013-11-23 09:46:06',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 09:46:06','2013-11-23 09:46:06',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (27,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=2&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 09:46:20','2013-11-23 09:46:20','2013-11-23 09:46:20',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 09:46:20','2013-11-23 09:46:20',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (28,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 09:47:12','2013-11-23 09:47:13','2013-11-23 09:47:13',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 09:47:12','2013-11-23 09:47:13',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (29,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=11',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 09:47:45','2013-11-23 09:47:45','2013-11-23 09:47:45',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 09:47:45','2013-11-23 09:47:45',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (30,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 11:10:39','2013-11-23 11:10:39','2013-11-23 11:10:40',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 11:10:39','2013-11-23 11:10:40',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (31,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=11',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 11:11:10','2013-11-23 11:11:11','2013-11-23 11:11:11',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 11:11:10','2013-11-23 11:11:11',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (32,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 11:16:09','2013-11-23 11:16:09','2013-11-23 11:16:10',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 11:16:09','2013-11-23 11:16:10',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (33,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=11',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 11:17:20','2013-11-23 11:17:20','2013-11-23 11:17:21',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 11:17:20','2013-11-23 11:17:21',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (34,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 11:17:54','2013-11-23 11:17:54','2013-11-23 11:17:55',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 11:17:54','2013-11-23 11:17:55',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (35,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 11:20:13','2013-11-23 11:20:13','2013-11-23 11:20:14',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 11:20:13','2013-11-23 11:20:14',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (36,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 11:25:52','2013-11-23 11:25:52','2013-11-23 11:25:52',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 11:25:52','2013-11-23 11:25:52',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (37,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 11:26:39','2013-11-23 11:26:39','2013-11-23 11:26:40',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 11:26:39','2013-11-23 11:26:40',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (38,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 12:24:13','2013-11-23 12:24:13','2013-11-23 12:24:14',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 12:24:13','2013-11-23 12:24:14',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (39,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=11',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 12:24:30','2013-11-23 12:24:30','2013-11-23 12:24:30',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 12:24:30','2013-11-23 12:24:30',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (40,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 12:36:50','2013-11-23 12:36:50','2013-11-23 12:36:50',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 12:36:50','2013-11-23 12:36:50',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (41,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 12:56:17','2013-11-23 12:56:17','2013-11-23 12:56:17',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 12:56:17','2013-11-23 12:56:17',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (42,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 12:59:32','2013-11-23 12:59:33','2013-11-23 12:59:33',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 12:59:32','2013-11-23 12:59:33',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (43,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 13:08:17','2013-11-23 13:08:17','2013-11-23 13:08:18',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 13:08:17','2013-11-23 13:08:18',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (44,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 13:10:32','2013-11-23 13:10:32','2013-11-23 13:10:32',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 13:10:32','2013-11-23 13:10:32',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (45,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000002',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 13:11:09','2013-11-23 13:11:09','2013-11-23 13:11:09',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 13:11:09','2013-11-23 13:11:09',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (46,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','imeino=00000003',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 13:11:31','2013-11-23 13:11:31','2013-11-23 13:11:31',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 13:11:31','2013-11-23 13:11:31',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (47,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','customer=1&imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 13:24:43','2013-11-23 13:24:43','2013-11-23 13:24:43',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 13:24:43','2013-11-23 13:24:43',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (48,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','customer=1&imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 13:27:37','2013-11-23 13:27:37','2013-11-23 13:27:38',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 13:27:37','2013-11-23 13:27:38',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (49,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','customer=1&imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 13:27:50','2013-11-23 13:27:50','2013-11-23 13:27:50',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 13:27:50','2013-11-23 13:27:50',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (50,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','customer=1&imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 13:38:29','2013-11-23 13:38:29','2013-11-23 13:38:29',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 13:38:29','2013-11-23 13:38:29',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (51,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','customer=1&imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 14:33:58','2013-11-23 14:33:58','2013-11-23 14:33:59',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 14:33:58','2013-11-23 14:33:59',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (52,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','customer=1&imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 14:40:21','2013-11-23 14:40:21','2013-11-23 14:40:21',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 14:40:21','2013-11-23 14:40:21',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (53,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','customer=1&imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 14:40:45','2013-11-23 14:40:45','2013-11-23 14:40:46',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 14:40:45','2013-11-23 14:40:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (54,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','customer=1&imeino=00000002',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 14:40:58','2013-11-23 14:40:58','2013-11-23 14:40:59',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 14:40:58','2013-11-23 14:40:59',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (55,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','customer=1&imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 14:42:47','2013-11-23 14:42:47','2013-11-23 14:42:47',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 14:42:47','2013-11-23 14:42:47',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (56,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','customer=1&imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 14:45:14','2013-11-23 14:45:14','2013-11-23 14:45:14',0,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 14:45:14','2013-11-23 14:45:14',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (57,'biadmin','/spagobi/admin',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','customer=2&imeino=00000003',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 14:46:03','2013-11-23 14:46:03','2013-11-23 14:46:04',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 14:46:03','2013-11-23 14:46:04',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (58,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 14:46:23','2013-11-23 14:46:23','2013-11-23 14:46:24',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 14:46:23','2013-11-23 14:46:25',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (59,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 14:48:15','2013-11-23 14:48:15','2013-11-23 14:48:16',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 14:48:15','2013-11-23 14:48:16',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (60,'biadmin','/spagobi/admin',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=11',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 14:48:52','2013-11-23 14:48:52','2013-11-23 14:48:53',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 14:48:52','2013-11-23 14:48:53',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (61,'gokul','/spagobi/user',13,13,'AllEnergyGenDash','AllEnergyGenDash','DOCUMENT_COMPOSITE','REL','customer=1&year=2013&month=10',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 15:32:14','2013-11-23 15:32:14','2013-11-23 15:32:15',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','gokul','gokul',NULL,'2013-11-23 15:32:14','2013-11-23 15:32:15',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (62,'gokul','/spagobi/user',8,8,'Energy_Gen_Dashboard','Energy_Gen_Dashboard','DOCUMENT_COMPOSITE','REL','customer=1&imeino=00000001',NULL,NULL,NULL,NULL,NULL,5,5,'SpagoBICompositeDocE','Document Composition Engine','INT',NULL,NULL,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine','2013-11-23 15:32:31','2013-11-23 15:32:31','2013-11-23 15:32:32',1,'EXECUTION_PERFORMED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','gokul','gokul',NULL,'2013-11-23 15:32:31','2013-11-23 15:32:32',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (63,'biadmin','/spagobi/admin',15,15,'SolarKPI','SolarKPI','KPI','REL','',NULL,NULL,NULL,NULL,NULL,6,6,'SpagoBIKpiEngine','Kpi Engine','INT',NULL,NULL,'it.eng.spagobi.engines.kpi.SpagoBIKpiInternalEngine','2013-11-23 15:48:13','2013-11-23 15:48:17',NULL,NULL,'EXECUTION_STARTED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 15:48:13','2013-11-23 15:48:17',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (64,'biadmin','/spagobi/admin',15,15,'SolarKPI','SolarKPI','KPI','REL','imeino=00000001&behaviour=recalculate',NULL,NULL,NULL,NULL,NULL,6,6,'SpagoBIKpiEngine','Kpi Engine','INT',NULL,NULL,'it.eng.spagobi.engines.kpi.SpagoBIKpiInternalEngine','2013-11-23 15:59:33','2013-11-23 15:59:33',NULL,NULL,'EXECUTION_STARTED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 15:59:33','2013-11-23 15:59:33',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (65,'biadmin','/spagobi/admin',15,15,'SolarKPI','SolarKPI','KPI','REL','imeino=00000002&behaviour=recalculate',NULL,NULL,NULL,NULL,NULL,6,6,'SpagoBIKpiEngine','Kpi Engine','INT',NULL,NULL,'it.eng.spagobi.engines.kpi.SpagoBIKpiInternalEngine','2013-11-23 15:59:48','2013-11-23 15:59:49',NULL,NULL,'EXECUTION_STARTED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 15:59:48','2013-11-23 15:59:49',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (66,'biadmin','/spagobi/admin',15,15,'SolarKPI','SolarKPI','KPI','REL','imeino=00000003&behaviour=recalculate',NULL,NULL,NULL,NULL,NULL,6,6,'SpagoBIKpiEngine','Kpi Engine','INT',NULL,NULL,'it.eng.spagobi.engines.kpi.SpagoBIKpiInternalEngine','2013-11-23 16:00:24','2013-11-23 16:00:24',NULL,NULL,'EXECUTION_STARTED',0,NULL,NULL,'NORMAL_EXECUTION_MODALITY','biadmin','biadmin',NULL,'2013-11-23 16:00:24','2013-11-23 16:00:24',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_audit` ENABLE KEYS */;


--
-- Definition of table `sbi_binary_contents`
--

DROP TABLE IF EXISTS `sbi_binary_contents`;
CREATE TABLE `sbi_binary_contents` (
  `BIN_ID` int(11) NOT NULL,
  `BIN_CONTENT` mediumblob NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_binary_contents`
--

/*!40000 ALTER TABLE `sbi_binary_contents` DISABLE KEYS */;
INSERT INTO `sbi_binary_contents` (`BIN_ID`,`BIN_CONTENT`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0A20203C5449544C4520746578743D22416C61726D2044657461696C73205265706F7274222F3E0A20203C5355425449544C4520746578743D2244657461696C7320466F72204D6F6E7468223E200A20203C2F5355425449544C453E0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0A20203C585F415849533E0A202020203C5449544C452F3E0A20203C2F585F415849533E0A20203C595F415849533E0A202020203C5449544C452F3E0A20203C2F595F415849533E0A20203C504C4F545F4F5054494F4E533E0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0A202020203C2F5049453E0A20203C2F504C4F545F4F5054494F4E533E0A20203C5345524945535F4C4953543E0A202020203C534552494553206E616D653D22416C61726D732220616C6961733D22696D65695F6E6F2C7661725F64617461312220747970653D22706965222F3E0A20203C2F5345524945535F4C4953543E0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-18 19:12:57',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,0x3C444F43554D454E54535F434F4D504F534954494F4E2074656D706C6174655F76616C75653D222F6A73702F656E67696E65732F646F63756D656E74636F6D706F736974696F6E2F74656D706C6174652F64796E616D696354656D706C6174652E6A7370223E0A20203C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0A202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22416C61726D44657461696C7322206C6F63616C5F66696C655F6E616D653D22416C61726D44657461696C732E736269686368617274223E0A2020202020203C504152414D45544552532F3E0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A32313070783B746F703A35333270783B77696474683A38373070783B6865696768743A32373870783B22206D6F64653D226175746F222F3E0A2020202020203C69643E33315F416C61726D44657461696C733C2F69643E0A202020203C2F444F43554D454E543E0A202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22416C61726D44657461696C7322206C6F63616C5F66696C655F6E616D653D22416C61726D44657461696C732E736269686368617274223E0A2020202020203C504152414D45544552532F3E0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A31353070783B746F703A3070783B77696474683A3130323070783B6865696768743A33383470783B22206D6F64653D226175746F222F3E0A2020202020203C69643E33325F416C61726D44657461696C733C2F69643E0A202020203C2F444F43554D454E543E0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E,'biadmin',NULL,NULL,'2013-11-18 19:52:32',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,0x3C444F43554D454E54535F434F4D504F534954494F4E2074656D706C6174655F76616C75653D222F6A73702F656E67696E65732F646F63756D656E74636F6D706F736974696F6E2F74656D706C6174652F64796E616D696354656D706C6174652E6A7370223E0A20203C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E,'biadmin',NULL,NULL,'2013-11-18 20:42:41',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,0x3C444F43554D454E54535F434F4D504F534954494F4E2074656D706C6174655F76616C75653D222F6A73702F656E67696E65732F646F63756D656E74636F6D706F736974696F6E2F74656D706C6174652F64796E616D696354656D706C6174652E6A7370223E0A20203C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22416C61726D44657461696C7322206C6F63616C5F66696C655F6E616D653D22416C61726D44657461696C732E736269686368617274223E0A2020202020203C504152414D45544552532F3E0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A32313070783B746F703A35333270783B77696474683A38373070783B6865696768743A32373870783B22206D6F64653D226175746F222F3E0A2020202020203C69643E315F416C61726D44657461696C733C2F69643E0A202020203C2F444F43554D454E543E0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E,'biadmin',NULL,NULL,'2013-11-18 20:49:26',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D2778272073706163696E6752696768743D273230272F3E0D0A20203C5449544C4520746578743D27546F64617927202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F41584953202073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2766616C7365273E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-20 19:15:10',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D27546F64617927202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F41584953202073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2766616C7365273E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-20 19:17:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D27546F64617927202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F7572732C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F41584953202073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2766616C7365273E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-20 19:20:34',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,0x3C484947484348415254202077696474683D273130302527206865696768743D2731303025273E0D0A20203C4348415254207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D275472656E64205265706F727420666F7220612044617927202F3E200D0A20203C585F4158495320616C6961733D27686F75727327202F3E0D0A20203C595F415849535F4C4953543E090D0A202020203C595F4158495320616C6961733D277265706F72745F64617461312720677269644C696E6557696474683D2730273E0D0A20202020202020203C4C4142454C533E0D0A2020202020202020202020203C5354594C452020636F6C6F723D272334353732413727202F3E0D0A20202020202020203C2F4C4142454C533E0D0A20202020202020203C5449544C4520746578743D274B7768273E0D0A202020202020202020203C5354594C452020636F6C6F723D272334353732413727202F3E0D0A20202020202020203C2F5449544C453E0D0A202020203C2F595F415849533E0D0A20203C2F595F415849535F4C4953543E0D0A20203C4C4547454E44206C61796F75743D27766572746963616C270D0A202020202020202020616C69676E3D276C656674270D0A202020202020202020766572746963616C416C69676E3D27746F70270D0A202020202020202020783D27313230270D0A202020202020202020793D273830270D0A202020202020202020666C6F6174696E673D2774727565270D0A202020202020202020626F7264657257696474683D2731270D0A2020202020202020206261636B67726F756E64436F6C6F723D2723464646464646270D0A202020202020202020736861646F773D2774727565272F3E20202020202020200D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D2774727565273E0D0A093C534552494553206E616D653D27536F6C617220456E657267792720636F6C6F723D27233435373241372720747970653D27617265612720616C6961733D277265706F72745F64617461312720646173685374796C653D2773686F7274646F74273E0D0A093C2F5345524945533E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-20 19:25:52',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D27546F64617927202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F7572732C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F41584953202073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2766616C7365273E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 19:28:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D27546F64617927202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849532020616C6961733D277265706F72745F6461746131273E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 19:29:58',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (11,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D27546F64617927202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 19:31:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (12,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 19:35:21',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (13,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 19:36:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (14,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 19:36:57',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (15,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 19:38:12',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (16,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 19:39:00',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (17,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A32303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32303070783B77696474683A3131303070783B6865696768743A32303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34303070783B77696474683A3131303070783B6865696768743A32303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A36303070783B77696474683A3131303070783B6865696768743A32303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A38303070783B77696474683A3131303070783B6865696768743A32303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-20 19:49:45',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (18,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31353070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32303070783B77696474683A3131303070783B6865696768743A31353070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34303070783B77696474683A3131303070783B6865696768743A31353070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A36303070783B77696474683A3131303070783B6865696768743A31353070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A38303070783B77696474683A3131303070783B6865696768743A31353070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-20 19:51:38',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (19,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31313070783B77696474683A3131303070783B6865696768743A31353070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32323070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33333070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34343070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-20 19:56:00',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (20,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31313070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32323070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33333070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34343070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-20 19:57:28',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (21,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31353070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31363070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32373070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33383070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34393070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-20 19:59:40',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (22,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C6173742035646179277320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 20:02:58',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (23,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 20:03:38',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (24,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 20:13:48',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (25,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31353070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31363070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32373070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33383070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34393070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-20 20:16:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (26,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31353070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31363070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32373070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33383070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34393070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-20 20:19:17',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (27,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 20:20:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (28,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 20:21:45',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (29,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31323070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31343070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32353070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33363070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552532F3E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34373070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-20 20:22:33',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (30,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31323070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31343070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32353070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33363070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34373070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-20 20:26:53',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (31,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F757273273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D277265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-20 20:28:17',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (32,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D226D616368696E652220747970653D2243415445474F5259222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C736F6C61722220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-22 22:19:00',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (33,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D226D616368696E652220747970653D2243415445474F5259222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C6C6F61642220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-22 23:10:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
INSERT INTO `sbi_binary_contents` (`BIN_ID`,`BIN_CONTENT`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (34,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D226D616368696E652220747970653D2243415445474F5259222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C65622220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-22 23:17:58',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (35,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F4158495320616C6961733D22736F6C6172223E0D0A202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F585F415849533E0D0A20203C595F4158495320616C6961733D2264617465223E0D0A202020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F595F415849533E0D0A200D0A20200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22456E657267792220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-22 23:31:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (36,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F415849533E0D0A202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F585F415849533E0D0A20203C595F4158495320616C6961733D2264617465223E0D0A202020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F595F415849533E0D0A200D0A20200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22456E657267792220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-22 23:33:29',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (37,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F415849533E0D0A202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F595F415849533E0D0A200D0A20200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22456E657267792220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-22 23:35:33',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (38,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020200D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22456E657267792220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 07:58:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (39,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020200D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 08:00:30',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (40,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020200D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22646174652C736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D22646174652C6C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D22646174652C65622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 08:01:52',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (41,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020200D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 08:02:35',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (42,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D226D616368696E652220747970653D2243415445474F5259222F3E0D0A2020202020203C504152414D206E616D653D22796561722220747970653D2252454C4154495645222F3E0D0A2020202020203C504152414D206E616D653D226D6F6E74682220747970653D2252454C4154495645222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C736F6C61722220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 08:28:59',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (43,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020200D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 08:30:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (44,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020200D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 08:30:52',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (45,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020200D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 08:31:13',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (46,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020200D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 08:31:22',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (47,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20200D0A20203C595F415849533E0D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22646174652C736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D22646174652C6C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D22646174652C65622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 08:33:16',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (48,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D226D616368696E652220747970653D2243415445474F5259222F3E0D0A2020202020203C504152414D206E616D653D22796561722220747970653D2252454C4154495645222F3E0D0A2020202020203C504152414D206E616D653D226D6F6E74682220747970653D2252454C4154495645222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C736F6C61722220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 08:34:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (49,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020200D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 08:39:19',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (50,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D22696D65696E6F2220747970653D2243415445474F5259222F3E0D0A2020202020203C504152414D206E616D653D22796561722220747970653D2252454C4154495645222F3E0D0A2020202020203C504152414D206E616D653D226D6F6E74682220747970653D2252454C4154495645222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C736F6C61722220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 08:52:23',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (51,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D226D616368696E652220747970653D2243415445474F5259222F3E0D0A2020202020203C504152414D206E616D653D22796561722220747970653D2252454C4154495645222F3E0D0A2020202020203C504152414D206E616D653D226D6F6E74682220747970653D2252454C4154495645222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C736F6C61722220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 08:57:40',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (52,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D22696D65696E6F2220747970653D2243415445474F5259222F3E0D0A2020202020203C504152414D206E616D653D22796561722220747970653D2252454C4154495645222F3E0D0A2020202020203C504152414D206E616D653D226D6F6E74682220747970653D2252454C4154495645222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C736F6C61722220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:01:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (53,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22456E65726779205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020200D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:05:06',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (54,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22416C6C20456E65726779205265706F727420466F722024507B696D65696E6F7D222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20200D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20200D0A20203C595F415849533E0D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22646174652C736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D22646174652C6C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D22646174652C65622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:06:24',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (55,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22416C6C20456E65726779205265706F727420466F722024507B696D65696E6F7D222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20200D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20200D0A20203C595F415849533E0D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:07:21',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (56,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A093C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536F6C6172456E6572677947656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A0920202020202020200D0A0920202020202020203C504152414D45544552207362695F7061725F6C6162656C3D22696D65696E6F2220747970653D224F5554222064656661756C745F76616C75653D20223030303030303031223E0D0A090909093C524546524553483E0D0A09090909093C524546524553485F444F435F4C494E4B4544206C6162656C446F633D22536974655769736544657461696C7352707422206C6162656C506172616D3D22696D65696E6F222F3E0D0A090909093C2F524546524553483E0D0A0909093C2F504152414D455445523E0D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E6F5F536F6C6172456E6572677947656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D226C6F61645F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F6C6F61642E736269686368617274223E0D0A09202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A33313070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B22202F3E0D0A092020202020203C69643E315F6C6F61645F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D2265625F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F65622E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A36323070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E325F65625F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536974655769736544657461696C7352707422206C6F63616C5F66696C655F6E616D653D22616C6C5F656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D223030303030303031223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A323070783B746F703A34303070783B77696474683A3130323070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E335F536974655769736544657461696C735270743C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A202020203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 09:21:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (57,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22416C6C20456E65726779205265706F727420466F722024507B696D65696E6F7D222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20200D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20200D0A20203C595F415849533E0D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:23:40',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (58,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22416C6C20456E65726779205265706F727420466F722024507B696D65696E6F7D222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20200D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20200D0A20203C595F415849533E0D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:24:08',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (59,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22416C6C20456E65726779205265706F727420466F722024507B696D65696E6F7D222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20200D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20200D0A20203C595F415849533E0D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:24:27',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (60,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22416C6C20456E65726779205265706F727420466F722024507B696D65696E6F7D222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20200D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20200D0A20203C595F415849533E0D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D226C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D2265622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:24:50',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (61,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A093C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536F6C6172456E6572677947656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A0920202020202020200D0A0920202020202020203C504152414D45544552207362695F7061725F6C6162656C3D22696D65696E6F2220747970653D224F5554222064656661756C745F76616C75653D20223030303030303031223E0D0A090909093C524546524553483E0D0A09090909093C524546524553485F444F435F4C494E4B4544206C6162656C446F633D22536974655769736544657461696C7352707422206C6162656C506172616D3D22696D65696E6F222F3E0D0A090909093C2F524546524553483E0D0A0909093C2F504152414D455445523E0D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E6F5F536F6C6172456E6572677947656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D226C6F61645F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F6C6F61642E736269686368617274223E0D0A09202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A33313070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B22202F3E0D0A092020202020203C69643E315F6C6F61645F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D2265625F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F65622E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A36323070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E325F65625F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536974655769736544657461696C7352707422206C6F63616C5F66696C655F6E616D653D22616C6C5F656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D223030303030303031223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020093C2F504152414D45544552533E090D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A323070783B746F703A34303070783B77696474683A3130323070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E335F536974655769736544657461696C735270743C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A202020203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 09:28:55',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (62,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A093C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536F6C6172456E6572677947656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A0920202020202020200D0A0920202020202020203C504152414D45544552207362695F7061725F6C6162656C3D22696D65696E6F2220747970653D224F5554222064656661756C745F76616C75653D20223030303030303031223E0D0A090909093C524546524553483E0D0A09090909093C524546524553485F444F435F4C494E4B4544206C6162656C446F633D22536974655769736544657461696C7352707422206C6162656C506172616D3D22696D65696E6F222F3E0D0A090909093C2F524546524553483E0D0A0909093C2F504152414D455445523E0D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E6F5F536F6C6172456E6572677947656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D226C6F61645F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F6C6F61642E736269686368617274223E0D0A09202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A33313070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B22202F3E0D0A092020202020203C69643E315F6C6F61645F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D2265625F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F65622E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A36323070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E325F65625F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536974655769736544657461696C7352707422206C6F63616C5F66696C655F6E616D653D22616C6C5F656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D223030303030303031223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020093C2F504152414D45544552533E090D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A323070783B746F703A34303070783B77696474683A3130323070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E335F536974655769736544657461696C735270743C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A202020203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 09:29:20',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (63,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D2245422047656E65726174696F6E205265706F7274222F3E0D0A20203C4C4547454E4420656E61626C65643D2266616C7365222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C65622220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:34:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (64,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D224C6F61642047656E65726174696F6E205265706F7274222F3E0D0A20203C4C4547454E4420656E61626C65643D2266616C7365222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C6C6F61642220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:34:25',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (65,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22536F6C61722047656E65726174696F6E205265706F7274222F3E0D0A20203C4C4547454E44206C61796F75743D22766572746963616C2220616C69676E3D226C6566742220766572746963616C416C69676E3D22746F702220783D2232302220793D2235302220666C6F6174696E673D2266616C73652220626F7264657257696474683D223122206261636B67726F756E64436F6C6F723D22234646464646462220736861646F773D2274727565222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D22696D65696E6F2220747970653D2243415445474F5259222F3E0D0A2020202020203C504152414D206E616D653D22796561722220747970653D2252454C4154495645222F3E0D0A2020202020203C504152414D206E616D653D226D6F6E74682220747970653D2252454C4154495645222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C736F6C61722220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:34:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (66,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A093C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536F6C6172456E6572677947656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A0920202020202020200D0A0920202020202020203C504152414D45544552207362695F7061725F6C6162656C3D22696D65696E6F2220747970653D224F5554222064656661756C745F76616C75653D20223030303030303031223E0D0A090909093C524546524553483E0D0A09090909093C524546524553485F444F435F4C494E4B4544206C6162656C446F633D22536974655769736544657461696C7352707422206C6162656C506172616D3D22696D65696E6F222F3E0D0A090909093C2F524546524553483E0D0A0909093C2F504152414D455445523E0D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E6F5F536F6C6172456E6572677947656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D226C6F61645F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F6C6F61642E736269686368617274223E0D0A09202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A33313070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B22202F3E0D0A092020202020203C69643E315F6C6F61645F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D2265625F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F65622E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A36323070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E325F65625F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536974655769736544657461696C7352707422206C6F63616C5F66696C655F6E616D653D22616C6C5F656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D223030303030303031223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020093C2F504152414D45544552533E090D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A323070783B746F703A34303070783B77696474683A39303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E335F536974655769736544657461696C735270743C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A202020203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 09:35:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (67,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A093C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536F6C6172456E6572677947656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A0920202020202020200D0A0920202020202020203C504152414D45544552207362695F7061725F6C6162656C3D22696D65696E6F2220747970653D224F5554222064656661756C745F76616C75653D20223030303030303031223E0D0A090909093C524546524553483E0D0A09090909093C524546524553485F444F435F4C494E4B4544206C6162656C446F633D22536974655769736544657461696C7352707422206C6162656C506172616D3D22696D65696E6F222F3E0D0A090909093C2F524546524553483E0D0A0909093C2F504152414D455445523E0D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E6F5F536F6C6172456E6572677947656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D226C6F61645F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F6C6F61642E736269686368617274223E0D0A09202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A33313070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B22202F3E0D0A092020202020203C69643E315F6C6F61645F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D2265625F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F65622E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A36323070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E325F65625F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536974655769736544657461696C7352707422206C6F63616C5F66696C655F6E616D653D22616C6C5F656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D2254657374223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020093C2F504152414D45544552533E090D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A323070783B746F703A34303070783B77696474683A39303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E335F536974655769736544657461696C735270743C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A202020203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 09:35:43',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
INSERT INTO `sbi_binary_contents` (`BIN_ID`,`BIN_CONTENT`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (68,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A093C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536F6C6172456E6572677947656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A0920202020202020200D0A0920202020202020203C504152414D45544552207362695F7061725F6C6162656C3D22696D65696E6F2220747970653D224F5554222064656661756C745F76616C75653D20223030303030303031223E0D0A090909093C524546524553483E0D0A09090909093C524546524553485F444F435F4C494E4B4544206C6162656C446F633D22536974655769736544657461696C7352707422206C6162656C506172616D3D22696D65696E6F222F3E0D0A090909093C2F524546524553483E0D0A0909093C2F504152414D455445523E0D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E6F5F536F6C6172456E6572677947656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D226C6F61645F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F6C6F61642E736269686368617274223E0D0A09202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A33313070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B22202F3E0D0A092020202020203C69643E315F6C6F61645F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D2265625F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F65622E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A36323070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E325F65625F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536974655769736544657461696C7352707422206C6F63616C5F66696C655F6E616D653D22616C6C5F656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D2254657374223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020093C2F504152414D45544552533E090D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A323070783B746F703A34303070783B77696474683A39303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E335F536974655769736544657461696C735270743C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A202020203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 09:35:52',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (69,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22536F6C61722047656E65726174696F6E205265706F7274222F3E0D0A20203C4C4547454E442020616C69676E3D22626F74746F6D222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D22696D65696E6F2220747970653D2243415445474F5259222F3E0D0A2020202020203C504152414D206E616D653D22796561722220747970653D2252454C4154495645222F3E0D0A2020202020203C504152414D206E616D653D226D6F6E74682220747970653D2252454C4154495645222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C736F6C61722220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:38:17',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (70,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A093C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536F6C6172456E6572677947656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A0920202020202020200D0A0920202020202020203C504152414D45544552207362695F7061725F6C6162656C3D22696D65696E6F2220747970653D224F5554222064656661756C745F76616C75653D20223030303030303031223E0D0A090909093C524546524553483E0D0A09090909093C524546524553485F444F435F4C494E4B4544206C6162656C446F633D22536974655769736544657461696C7352707422206C6162656C506172616D3D22696D65696E6F222F3E0D0A090909093C2F524546524553483E0D0A0909093C2F504152414D455445523E0D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E6F5F536F6C6172456E6572677947656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D226C6F61645F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F6C6F61642E736269686368617274223E0D0A09202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A33313070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B22202F3E0D0A092020202020203C69643E315F6C6F61645F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D2265625F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F65622E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A36323070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E325F65625F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536974655769736544657461696C7352707422206C6F63616C5F66696C655F6E616D653D22616C6C5F656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D2254657374223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020093C2F504152414D45544552533E090D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A323070783B746F703A33323070783B77696474683A39303070783B6865696768743A32353070783B222F3E0D0A092020202020203C69643E335F536974655769736544657461696C735270743C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A202020203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 09:38:35',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (71,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A093C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536F6C6172456E6572677947656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A0920202020202020200D0A0920202020202020203C504152414D45544552207362695F7061725F6C6162656C3D22696D65696E6F2220747970653D224F5554222064656661756C745F76616C75653D20223030303030303031223E0D0A090909093C524546524553483E0D0A09090909093C524546524553485F444F435F4C494E4B4544206C6162656C446F633D22536974655769736544657461696C7352707422206C6162656C506172616D3D22696D65696E6F222F3E0D0A090909093C2F524546524553483E0D0A0909093C2F504152414D455445523E0D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E6F5F536F6C6172456E6572677947656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D226C6F61645F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F6C6F61642E736269686368617274223E0D0A09202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A33313070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B22202F3E0D0A092020202020203C69643E315F6C6F61645F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D2265625F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F65622E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A36323070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E325F65625F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536974655769736544657461696C7352707422206C6F63616C5F66696C655F6E616D653D22616C6C5F656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D2254657374223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020093C2F504152414D45544552533E090D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A323070783B746F703A33323070783B77696474683A39303070783B6865696768743A32353070783B222F3E0D0A092020202020203C69643E335F536974655769736544657461696C735270743C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A202020203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 09:38:43',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (72,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22536F6C61722047656E65726174696F6E222F3E0D0A20203C4C4547454E442020616C69676E3D22626F74746F6D222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D22696D65696E6F2220747970653D2243415445474F5259222F3E0D0A2020202020203C504152414D206E616D653D22796561722220747970653D2252454C4154495645222F3E0D0A2020202020203C504152414D206E616D653D226D6F6E74682220747970653D2252454C4154495645222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C736F6C61722220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:44:34',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (73,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D2245422047656E65726174696F6E222F3E0D0A20203C4C4547454E4420656E61626C65643D2266616C7365222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C65622220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:44:51',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (74,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D224C6F61642047656E65726174696F6E222F3E0D0A20203C4C4547454E4420656E61626C65643D2266616C7365222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C6C6F61642220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:45:08',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (75,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D2245422047656E65726174696F6E222F3E0D0A20203C4C4547454E4420656E61626C65643D2266616C7365222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C65622220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 09:45:24',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (76,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A093C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536F6C6172456E6572677947656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A0920202020202020200D0A0920202020202020203C504152414D45544552207362695F7061725F6C6162656C3D22696D65696E6F2220747970653D224F5554222064656661756C745F76616C75653D20223030303030303031223E0D0A090909093C524546524553483E0D0A09090909093C524546524553485F444F435F4C494E4B4544206C6162656C446F633D22536974655769736544657461696C7352707422206C6162656C506172616D3D22696D65696E6F222F3E0D0A090909093C2F524546524553483E0D0A0909093C2F504152414D455445523E0D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E6F5F536F6C6172456E6572677947656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D226C6F61645F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F6C6F61642E736269686368617274223E0D0A09202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A33313070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B22202F3E0D0A092020202020203C69643E315F6C6F61645F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D2265625F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F65622E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A36323070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E325F65625F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536974655769736544657461696C7352707422206C6F63616C5F66696C655F6E616D653D22616C6C5F656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D2254657374223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020093C2F504152414D45544552533E090D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33323070783B77696474683A39323070783B6865696768743A32353070783B222F3E0D0A092020202020203C69643E335F536974655769736544657461696C735270743C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A202020203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 09:45:47',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (77,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A093C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536F6C6172456E6572677947656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A0920202020202020200D0A0920202020202020203C504152414D45544552207362695F7061725F6C6162656C3D22696D65696E6F2220747970653D224F5554222064656661756C745F76616C75653D20223030303030303031223E0D0A090909093C524546524553483E0D0A09090909093C524546524553485F444F435F4C494E4B4544206C6162656C446F633D22536974655769736544657461696C7352707422206C6162656C506172616D3D22696D65696E6F222F3E0D0A090909093C2F524546524553483E0D0A0909093C2F504152414D455445523E0D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E6F5F536F6C6172456E6572677947656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D226C6F61645F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F6C6F61642E736269686368617274223E0D0A09202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A33313070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B22202F3E0D0A092020202020203C69643E315F6C6F61645F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D2265625F656E657267795F67656E22206C6F63616C5F66696C655F6E616D653D22656E657267795F67656E65726174696F6E5F65622E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22637573746F6D6572222064656661756C745F76616C75653D22636F6D31223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020200D0A092020202020203C2F504152414D45544552533E0D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A36323070783B746F703A3070783B77696474683A33303070783B6865696768743A33303070783B222F3E0D0A092020202020203C69643E325F65625F656E657267795F67656E3C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A09202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22536974655769736544657461696C7352707422206C6F63616C5F66696C655F6E616D653D22616C6C5F656E657267795F67656E65726174696F6E2E736269686368617274223E0D0A092020202020203C504152414D45544552533E0D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D2254657374223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D2279656172222064656661756C745F76616C75653D2232303133223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A092020202020200D0A0920202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D226D6F6E7468222064656661756C745F76616C75653D223130223E0D0A092020202020202020093C52454652455348202F3E0D0A0920202009093C2F504152414D455445523E0D0A09202020093C2F504152414D45544552533E090D0A092020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33323070783B77696474683A39323070783B6865696768743A32353070783B222F3E0D0A092020202020203C69643E335F536974655769736544657461696C735270743C2F69643E0D0A09202020203C2F444F43554D454E543E0D0A202020203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 09:46:02',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (78,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22536F6C61722047656E65726174696F6E222F3E0D0A20203C4C4547454E442020616C69676E3D22626F74746F6D222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D22696D65696E6F2220747970653D2243415445474F5259222F3E0D0A2020202020203C504152414D206E616D653D22796561722220747970653D2252454C4154495645222F3E0D0A2020202020203C504152414D206E616D653D226D6F6E74682220747970653D2252454C4154495645222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C736F6C61722220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 11:10:20',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (79,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22636F6C756D6E222F3E0D0A20203C5449544C4520746578743D22416C6C20456E65726779205265706F727420466F722024507B696D65696E6F7D222F3E0D0A20203C4C4547454E4420616C69676E3D22626F74746F6D222F3E0D0A20200D0A20203C585F4158495320616C696173203D202264617465223E0D0A2020090D0A2020203C5449544C4520746578743D2244617465222F3E0D0A20203C2F585F415849533E0D0A20200D0A20203C595F415849533E0D0A20202020203C5449544C4520746578743D22456E65726779222F3E0D0A20203C2F595F415849533E0D0A200D0A20203C5345524945535F4C4953543E0D0A2020093C534552494553206E616D653D22536F6C61722220616C6961733D22646174652C736F6C61722220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D224C6F61642220616C6961733D22646174652C6C6F61642220747970653D22636F6C756D6E222F3E0D0A202020203C534552494553206E616D653D2245622220616C6961733D22646174652C65622220747970653D22636F6C756D6E222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 11:15:38',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (80,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22536F6C61722047656E65726174696F6E222F3E0D0A20200D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2274727565222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D22696D65696E6F2220747970653D2243415445474F5259222F3E0D0A2020202020203C504152414D206E616D653D22796561722220747970653D2252454C4154495645222F3E0D0A2020202020203C504152414D206E616D653D226D6F6E74682220747970653D2252454C4154495645222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C736F6C61722220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 11:16:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (81,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22536F6C61722047656E65726174696F6E222F3E0D0A20203C4C4547454E4420656E61626C65643D2266616C7365222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2266616C7365222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D22696D65696E6F2220747970653D2243415445474F5259222F3E0D0A2020202020203C504152414D206E616D653D22796561722220747970653D2252454C4154495645222F3E0D0A2020202020203C504152414D206E616D653D226D6F6E74682220747970653D2252454C4154495645222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C736F6C61722220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 11:19:11',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (82,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D2245422047656E65726174696F6E222F3E0D0A20203C4C4547454E4420656E61626C65643D2266616C7365222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2266616C7365222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C65622220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 11:19:29',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (83,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D224C6F61642047656E65726174696F6E222F3E0D0A20203C4C4547454E4420656E61626C65643D2266616C7365222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2266616C7365222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C6C6F61642220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 11:19:53',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (84,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D224C6F61642047656E65726174696F6E222F3E0D0A20203C4C4547454E4420656E61626C65643D2266616C7365222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2266616C7365222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C6C6F61642220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 11:19:56',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (85,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22496E766572746572222F3E0D0A20203C4C4547454E4420656E61626C65643D2266616C7365222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2266616C7365222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C6C6F61642220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 11:25:18',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (86,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D225574696C697479222F3E0D0A20203C4C4547454E4420656E61626C65643D2266616C7365222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2266616C7365222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C65622220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 11:25:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (87,0x3C4849474843484152542077696474683D223130302522206865696768743D2231303025223E0D0A20203C43484152542064656661756C74536572696573547970653D22706965222F3E0D0A20203C5449544C4520746578743D22536F6C6172222F3E0D0A20203C4C4547454E4420656E61626C65643D2266616C7365222F3E0D0A20203C585F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A202020203C5449544C452F3E0D0A20203C2F595F415849533E0D0A20203C504C4F545F4F5054494F4E533E0D0A202020203C50494520616C6C6F77506F696E7453656C6563743D22747275652220637572736F723D22706F696E746572222073686F77496E4C6567656E643D2274727565223E0D0A2020202020203C444154415F4C4142454C5320656E61626C65643D2266616C7365222F3E0D0A202020203C2F5049453E0D0A20203C2F504C4F545F4F5054494F4E533E0D0A20203C4452494C4C20646F63756D656E743D22536974655769736544657461696C73527074223E0D0A202020203C504152414D5F4C4953543E0D0A2020202020203C504152414D206E616D653D22696D65696E6F2220747970653D2243415445474F5259222F3E0D0A2020202020203C504152414D206E616D653D22796561722220747970653D2252454C4154495645222F3E0D0A2020202020203C504152414D206E616D653D226D6F6E74682220747970653D2252454C4154495645222F3E0D0A202020203C2F504152414D5F4C4953543E0D0A20203C2F4452494C4C3E0D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D22456E657267792220616C6961733D226D616368696E652C736F6C61722220747970653D22706965222F3E0D0A20203C2F5345524945535F4C4953543E0D0A3C2F4849474843484152543E,'biadmin',NULL,NULL,'2013-11-23 11:26:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (88,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152543E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E64273E200D0A20203C2F5449544C453E0D0A2020200D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 11:37:57',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (89,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152542077696474683D2239302522206865696768743D22383025223E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E64273E200D0A20203C2F5449544C453E0D0A2020200D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 11:39:57',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (90,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152542077696474683D2239302522206865696768743D22383025223E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E64273E200D0A20203C2F5449544C453E0D0A2020200D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 11:43:02',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (91,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152542077696474683D2239302522206865696768743D22383025223E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E64273E200D0A20203C2F5449544C453E0D0A2020200D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 11:43:30',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (92,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152542077696474683D2239302522206865696768743D22383025223E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E64273E200D0A20203C2F5449544C453E0D0A2020200D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 11:45:48',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (93,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152542077696474683D2239302522206865696768743D22383025223E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E64273E200D0A20203C2F5449544C453E0D0A2020200D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 11:52:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
INSERT INTO `sbi_binary_contents` (`BIN_ID`,`BIN_CONTENT`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (94,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152542077696474683D223130302522206865696768743D22393825223E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E64273E200D0A20203C2F5449544C453E0D0A2020200D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 12:09:53',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (95,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152542077696474683D223130302522206865696768743D22393825223E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E6420466F722024507B696D65696E6F7D273E200D0A20203C2F5449544C453E0D0A202020203C5355425449544C4520746578743D2744657461696C7320466F722024507B6461797D27273E200D0A20203C2F5355425449544C453E0D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 12:14:52',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (96,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152542077696474683D223130302522206865696768743D22393825223E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E6420466F722024507B696D65696E6F7D273E200D0A20203C2F5449544C453E0D0A202020203C5355425449544C4520746578743D2744657461696C7320466F722024507B6461797D273E200D0A20203C2F5355425449544C453E0D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 12:15:26',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (97,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152542077696474683D223130302522206865696768743D22393825223E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E6420466F7220273E200D0A20203C2F5449544C453E0D0A202020203C5355425449544C4520746578743D2744657461696C7320466F722024507B6461797D273E200D0A20203C2F5355425449544C453E0D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 12:35:43',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (98,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152542077696474683D223130302522206865696768743D22393825223E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E6420466F7220273E200D0A20203C2F5449544C453E0D0A202020203C5355425449544C4520746578743D2744657461696C7320466F722024507B6461797D273E200D0A20203C2F5355425449544C453E0D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 12:36:16',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (99,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152542077696474683D223130302522206865696768743D22393825223E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E6420466F7220273E200D0A20203C2F5449544C453E0D0A202020203C5355425449544C4520746578743D2744657461696C7320466F722024507B6461797D273E200D0A20203C2F5355425449544C453E0D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 12:36:26',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (100,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152542077696474683D223130302522206865696768743D22393825223E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E6420466F7220273E200D0A20203C2F5449544C453E0D0A202020203C5355425449544C4520746578743D2744657461696C7320466F722024507B6461797D273E200D0A20203C2F5355425449544C453E0D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 12:36:37',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (101,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 12:55:53',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (102,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 12:56:10',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (103,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 12:57:34',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (104,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 12:58:17',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (105,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 12:58:42',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (106,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 12:58:55',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (107,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 12:59:11',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (108,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 12:59:25',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (109,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:01:41',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (110,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:02:30',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (111,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:02:48',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (112,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:10:23',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (113,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31323070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31343070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32353070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33363070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34373070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 13:17:54',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (114,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31323070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31343070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32353070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33363070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34373070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 13:18:38',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (115,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31323070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31343070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32353070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33363070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34373070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 13:18:48',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (116,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31323070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31343070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32353070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33363070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34373070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 13:19:02',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (117,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:19:17',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (118,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:19:43',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (119,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:19:47',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (120,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:19:52',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (121,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:20:07',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (122,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:20:32',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
INSERT INTO `sbi_binary_contents` (`BIN_ID`,`BIN_CONTENT`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (123,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:20:35',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (124,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:20:38',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (125,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:20:54',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (126,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:21:20',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (127,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:21:30',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (128,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:21:34',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (129,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:21:56',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (130,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:22:19',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (131,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:22:24',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (132,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:23:06',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (133,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:23:28',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (134,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:23:42',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (135,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:24:12',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (136,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:24:22',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (137,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:24:28',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (138,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31323070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31343070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32353070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33363070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34373070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 13:25:25',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (139,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31323070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31343070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32353070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33363070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34373070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 13:25:53',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (140,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:26:59',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (141,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:27:30',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (142,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D274C61737420356461797320536F6C61722047656E65726174696F6E27202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:31:43',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (143,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:34:22',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (144,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:34:32',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (145,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:34:56',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (146,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:34:56',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (147,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:35:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (148,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:36:27',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (149,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:37:45',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (150,0x3C4849474843484152543E0D0A20203C434841525420747970653D276C696E65272064656661756C74536572696573547970653D276C696E6527207A6F6F6D547970653D277827202F3E0D0A20203C5449544C4520746578743D2727202F3E200D0A20203C504C4F545F4F5054494F4E53203E0D0A20202020203C41524541206C696E6557696474683D27312720736861646F773D2766616C7365273E0D0A09203C46494C4C5F434F4C4F52206C696E6561724772616469656E743D275B302C20302C20302C203330305D273E0D0A09202020203C53544F50535F4C4953543E0D0A090920203C53544F50533E5B302C20277267622836392C203131342C2031363729275D3C2F53544F50533E0D0A090920203C53544F50533E5B312C20277267626128322C302C302C3029275D3C2F53544F50533E0D0A09202020203C2F53544F50535F4C4953543E0D0A09203C2F46494C4C5F434F4C4F523E0D0A2020202020203C2F415245413E090D0A20203C2F504C4F545F4F5054494F4E533E0D0A20200D0A20203C585F4158495320616C6961733D27686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E200D0A20203C2F585F415849533E0D0A20203C595F415849533E0D0A2020093C5449544C4520746578743D274B5768272F3E0D0A20203C2F595F415849533E0D0A20200D0A20203C5345524945535F4C4953543E0D0A202020203C534552494553206E616D653D27536F6C617220456E657267792720747970653D2761726561272020616C6961733D27686F75722C7265706F72745F646174613127202F3E0D0A20203C2F5345524945535F4C4953543E0D0A20203C4C4547454E4420656E61626C65643D2766616C7365272F3E0D0A3C2F4849474843484152543E0D0A0D0A,'biadmin',NULL,NULL,'2013-11-23 13:38:12',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (151,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31323070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31343070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32353070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33363070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34373070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 14:39:57',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (152,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C444F43554D454E54535F434F4D504F534954494F4E3E0D0A3C444F43554D454E54535F434F4E46494755524154494F4E20766964656F5F77696474683D22313230302220766964656F5F6865696768743D2231303634223E0D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793122206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A3070783B77696474683A3131303070783B6865696768743A31323070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E305F456E657267795F47656E5F446179313C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793222206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A31343070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E315F456E657267795F47656E5F446179323C2F69643E0D0A202020203C2F444F43554D454E543E0D0A200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793322206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A32353070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E325F456E657267795F47656E5F446179333C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793422206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A33363070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E335F456E657267795F47656E5F446179343C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20200D0A20202020203C444F43554D454E54207362695F6F626A5F6C6162656C3D22456E657267795F47656E5F4461793522206C6F63616C5F66696C655F6E616D653D22456E657267795F67656E65726174696F6E5F646179312E736269686368617274223E0D0A2020202020203C504152414D45544552533E0D0A20202020202020203C504152414D4554455220747970653D22494E22207362695F7061725F6C6162656C3D22696D65696E6F222064656661756C745F76616C75653D22303030303030303122202F3E0D0A2020202020203C2F504152414D45544552533E0D0A2020202020203C5354594C45207374796C653D22706F736974696F6E3A6162736F6C7574653B6D617267696E3A3070783B6C6566743A3070783B746F703A34373070783B77696474683A3131303070783B6865696768743A31303070783B22206D6F64653D226175746F222F3E0D0A2020202020203C69643E345F456E657267795F47656E5F446179353C2F69643E0D0A202020203C2F444F43554D454E543E0D0A20203C2F444F43554D454E54535F434F4E46494755524154494F4E3E0D0A3C2F444F43554D454E54535F434F4D504F534954494F4E3E0D0A,'biadmin',NULL,NULL,'2013-11-23 14:40:00',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (153,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D22796573223F3E0D0A3C212D2D2073656520686967686368617274732720646F63756D656E746174696F6E20746F207669657720616C6C20706F737369626C65206F7074696F6E732028687474703A2F2F7777772E686967686368617274732E636F6D2F72656629202D2D3E0D0A0D0A203C212D2D206469762070726F70657274696573202D2D3E0D0A3C4849474843484152542077696474683D223130302522206865696768743D22393825223E0D0A20200D0A20203C212D2D206368617274206F626A6563742070726F70657274696573202D2D3E0D0A20203C434841525420747970653D2761726561272064656661756C74536572696573547970653D276172656127207A6F6F6D547970653D2778272073706163696E6752696768743D2732302720616E696D6174696F6E3D22747275652220736861646F773D2274727565222F3E0D0A20200D0A20203C212D2D207469746C65206F626A6563742070726F70657274696573202D2D3E200D0A20203C5449544C4520746578743D27436F6E73756D7074696F6E20436F6D70617269736F6E205472656E6420466F7220273E200D0A20203C2F5449544C453E0D0A202020203C5355425449544C4520746578743D2744657461696C7320466F722024507B6461797D273E200D0A20203C2F5355425449544C453E0D0A2020203C212D2D20706C6F74206F626A6563742070726F706572746965732028737065636966696320666F72207468652074797065206F662074686520636861727429202D2D3E0D0A20200D0A20200D0A20203C212D2D207841786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C585F4158495320616C696173203D2027686F7572273E0D0A2020093C5449544C4520746578743D27486F757273272F3E0D0A2020090D0A20203C2F585F415849533E0D0A2020200D0A20203C212D2D207941786973206F626A6563742070726F7065727469657320202D2D3E0D0A20203C595F4158495320206D696E3D2730272073746172744F6E5469636B3D2766616C7365272073686F7746697273744C6162656C3D2774727565273E0D0A093C5449544C4520746578743D27436F6E73756D7074696F6E272F3E0D0A20203C2F595F415849533E0D0A0D0A20203C212D2D20746F6F6C746970206F626A6563742070726F70657274696573202D2D3E0D0A20203C544F4F4C54495020202063726F737368616972733D27747275652720656E61626C65643D27747275652720736861646F773D277472756527203E0D0A202020203C212D2D5354594C4520636F6C6F723D27234646303046462720666F6E745765696768743D27626F6C642720666F6E7453697A653D2731327078272070616464696E673D2735707827202F2D2D3E0D0A20203C2F544F4F4C5449503E200D0A20200D0A202020203C212D2D207365726965732070726F70657274696573202D2D3E0D0A20203C5345524945535F4C49535420616C6C6F77506F696E7453656C6563743D277472756527203E0D0A20200909093C534552494553206E616D653D27536F6C61722720747970653D276C696E652720616C6961733D27686F75722C736F6C6172273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D274C6F61642720747970653D276C696E652720616C6961733D27686F75722C6C6F6164273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A20200909093C534552494553206E616D653D2745422720747970653D276C696E652720616C6961733D27686F75722C6562273E0D0A20200909093C444154415F4C4142454C5320656E61626C653D2774727565272F3E0D0A20200909093C2F5345524945533E0D0A203C2F5345524945535F4C4953543E0D0A20200D0A20203C212D2D206C6567656E64206F626A6563742070726F70657274696573202D2D3E0D0A20203C4C4547454E4420656E61626C65643D2774727565272F3E0D0A202020202020202020200D0A0D0A0D0A3C2F4849474843484152543E0D0A,'biadmin',NULL,NULL,'2013-11-23 14:50:50',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (154,0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D2277696E646F77732D31323530223F3E0D0A3C4B5049206D6F64656C5F6E6F64655F696E7374616E63653D2730323832376366332D303663312D343836352D383738362D36366563306335383432366527206E616D653D27536F6C617220456E65726779273E0D0A20203C5354594C455F5355425449544C4520666F6E743D27417269616C272073697A653D2731302720636F6C6F723D272336363939464627206E616D653D27536F6C617220456E65726779272F3E200D0A20203C5354594C455F5449544C4520666F6E743D27417269616C272073697A653D2731322720636F6C6F723D2723303030303030272F3E20200D0A20203C434F4E463E0D0A202020203C504152414D45544552206E616D653D27646973706C61795F73656D6170686F7265272076616C75653D2774727565272F3E0D0A202020203C504152414D45544552206E616D653D27646973706C61795F62756C6C65745F6368617274272076616C75653D2774727565272F3E0D0A202020203C504152414D45544552206E616D653D27646973706C61795F776569676874272076616C75653D2774727565272F3E0D0A202020203C504152414D45544552206E616D653D27646973706C61795F616C61726D272076616C75653D2774727565272F3E0D0A09203C504152414D45544552206E616D653D27636C6F7365645F74726565272076616C75653D2766616C7365272F3E0D0A202020203C504152414D45544552206E616D653D2772656769737465725F76616C756573272076616C75653D2774727565272F3E0D0A202020203C504152414D45544552206E616D653D2773686F775F61786973272076616C75653D2774727565272F3E0D0A202020203C504152414D45544552206E616D653D2777656967687465645F76616C756573272076616C75653D2774727565272F3E0D0A202020203C504152414D45544552206E616D653D27646174617365745F6D756C7469726573272076616C75653D2774727565272F3E0D0A20203C2F434F4E463E0D0A3C2F4B50493E,'biadmin',NULL,NULL,'2013-11-23 15:47:57',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_binary_contents` ENABLE KEYS */;


--
-- Definition of table `sbi_checks`
--

DROP TABLE IF EXISTS `sbi_checks`;
CREATE TABLE `sbi_checks` (
  `CHECK_ID` int(11) NOT NULL,
  `DESCR` varchar(160) DEFAULT NULL,
  `LABEL` varchar(20) NOT NULL,
  `VALUE_TYPE_CD` varchar(20) NOT NULL,
  `VALUE_TYPE_ID` int(11) NOT NULL,
  `VALUE_1` varchar(400) DEFAULT NULL,
  `VALUE_2` varchar(400) DEFAULT NULL,
  `NAME` varchar(40) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CHECK_ID`),
  UNIQUE KEY `XAK1SBI_CHECKS` (`LABEL`,`ORGANIZATION`),
  KEY `FK_SBI_CHECKS_1` (`VALUE_TYPE_ID`),
  CONSTRAINT `FK_SBI_CHECKS_1` FOREIGN KEY (`VALUE_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_checks`
--

/*!40000 ALTER TABLE `sbi_checks` DISABLE KEYS */;
INSERT INTO `sbi_checks` (`CHECK_ID`,`DESCR`,`LABEL`,`VALUE_TYPE_CD`,`VALUE_TYPE_ID`,`VALUE_1`,`VALUE_2`,`NAME`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,'Control if parameter is an Internet Address','CK-FIX-01','INTERNET ADDRESS',48,'','','Internet Address','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,'Control if  a parameter is Numeric','CK-FIX-02','NUMERIC',49,'','','Numeric','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,'Control if  a parameter is Alfanumeric','CK-FIX-03','ALFANUMERIC',50,'','','Alfanumeric','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,'Control if a parameter is a letter string','CK-FIX-04','LETTERSTRING',51,'','','Letter String','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,'Control if parameter is a Fiscal Code','CK-FIX-06','FISCALCODE',52,'','','Fiscal Code','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,'Control if parameter is a E-Mail','CK-FIX-07','EMAIL',53,'','','E-Mail','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_checks` ENABLE KEYS */;


--
-- Definition of table `sbi_config`
--

DROP TABLE IF EXISTS `sbi_config`;
CREATE TABLE `sbi_config` (
  `ID` int(11) NOT NULL,
  `LABEL` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT '1',
  `VALUE_CHECK` varchar(1000) DEFAULT NULL,
  `VALUE_TYPE_ID` int(11) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  `CATEGORY` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `XAK1SBI_CONFIG` (`LABEL`),
  KEY `FK_SBI_CONFIG_1` (`VALUE_TYPE_ID`),
  CONSTRAINT `FK_SBI_CONFIG_1` FOREIGN KEY (`VALUE_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_config`
--

/*!40000 ALTER TABLE `sbi_config` DISABLE KEYS */;
INSERT INTO `sbi_config` (`ID`,`LABEL`,`NAME`,`DESCRIPTION`,`IS_ACTIVE`,`VALUE_CHECK`,`VALUE_TYPE_ID`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`,`CATEGORY`) VALUES 
 (1,'internal.security.encript.password','encript password','Enable the password encription',0,'true',29,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (2,'changepwdmodule.len_min','Password Len Min','Minimum length',0,'8',29,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (3,'changepwdmodule.special_char','Special char','Special chars',0,'_|-#$',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (4,'changepwdmodule.upper_char','Upper char','Minimum a char must be in upper case',0,'ABCDEFGJKLMNOPQRSTUVWXYZ',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (5,'changepwdmodule.lower_char','Lower char','Minimum a char must be in lower case',0,'abcdefghjklmnopqrstuwxyz',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (6,'changepwdmodule.number','Number','Minimum a char must be a number',0,'0123456789',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (7,'changepwdmodule.alphabetical','Alaphabetical','Minimum a char must be a letter',0,'abcdefghjklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (8,'changepwdmodule.change','Change from last','The new pwd must be different from the lastest',0,'',NULL,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (9,'changepwd.change_first','Change at first login ','The pwd must be changed at first login',0,'',NULL,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (10,'changepwd.disactivation_time','Disactivation time','Number of months before disactivation',0,'6',29,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (11,'changepwd.expired_time','Expired time','Number of days fo the expiration',0,'90',29,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (12,'SPAGOBI.SPAGOBI-MODE.mode','SpagoBI mode','Enable the WebApplication or Portal mode',0,'WEB',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (13,'SPAGOBI.HOME.BANNER.view','show the banner','banner',0,'true',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (14,'SPAGOBI.HOME.FOOTER.view','show the footer','footer',0,'true',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (15,'SPAGOBI.MENU.pathTracked','pathTracked','pathTracked',0,'true',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (16,'SPAGOBI.LOOKUP.numberRows','SPAGOBI LOOKUP numberRows','The numnber of rows showed in each list',1,'20',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (17,'SPAGOBI.RESOURCE_PATH_JNDI_NAME','RESOURCE PATH JNDI NAME','The name of the JNDI variable that contains the RESOURCE PATH',1,'java://comp/env/spagobi_resource_path',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (18,'SPAGOBI.SPAGOBI_HOST_JNDI','SPAGOBI HOST JNDI','HOST JNDI',1,'java://comp/env/spagobi_host_url',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (19,'SPAGOBI.SPAGO_ADAPTERHTTP_URL','ADAPTERHTTP URL','ADAPTERHTTP URL',1,'/servlet/AdapterHTTP',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (20,'SPAGOBI.TEMPLATE_MAX_SIZE','TEMPLATE MAX SIZE','TEMPLATE MAX SIZE',1,'5242880',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (21,'SPAGOBI.SPAGOBI_CONTEXT','SPAGOBI CONTEXT','SPAGOBI CONTEXT',1,'/appstore',30,'server','biadmin',NULL,'2013-11-17 11:18:08','2013-11-17 12:22:53',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI','GENERIC_CONFIGURATION'),
 (22,'SPAGOBI.SESSION_EXPIRED_URL','SESSION EXPIRED URL','SESSION EXPIRED URL',1,'/WEB-INF/jsp/commons/sessionExpired.jsp',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (23,'SPAGOBI.DATASET.maxResult','DATASET maxResult','maxResult',1,'500000',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (24,'SPAGOBI.SESSION_PARAMETERS_MANAGER.enabled','SESSION PARAMETERS MANAGER','enabled',1,'false',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (25,'SPAGOBI.EXECUTION.PARAMETERS.statePersistenceEnabled','Parameter state persistence enabled','if true the default value for each parameter will be set automatically equal to the last value selected by the user',1,'false',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (26,'SPAGOBI.EXECUTION.PARAMETERS.statePersistenceScope','Parameter state persistence scope','if equals SESSION the parameter state will be saved in session (i.e. reseted after each logout). If equals to BROWSER the parameter state will be saved in a cookie and preserver over different login sessions',1,'SESSION',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (27,'SPAGOBI.EXECUTION.PARAMETERS.mementoPersistenceEnabled','Parameter memento persistence enabled','if true the last N values selected from a parameter by the user will be stored and used as selection shortcut for future executions',1,'true',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (28,'SPAGOBI.EXECUTION.PARAMETERS.mementoPersistenceScope','Parameter memento persistence scope','if equals SESSION the parameter memento will be saved in session (i.e. reseted after each logout). If equals to BROWSER the parameter memento will be saved in a cookie and preserver over different login sessions',1,'BROWSER',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (29,'SPAGOBI.EXECUTION.PARAMETERS.mementoPersistenceDepth','Parameter memento persistence depth','The number of values to save into the memento object associated to each parameter',1,'5',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (30,'SPAGOBI.DATE-FORMAT-SERVER.format','SERVE DATE FORMAT','Date format for communications with the server (both on sending and receiving) format attribute is for server side services, see java.text.SimpleDateFormat for details, while extJsFormat is for ExtJs client, that use another standard, see http://extjs.com/deploy/dev/docs/. IF YOU CHANGE ONE FORMAT YOU MUST CHANGE THE OTHER ONE ACCORDINGLY.',1,'dd/MM/yyyy',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (31,'SPAGOBI.DATE-FORMAT-SERVER.extJsFormat','EXTJS SERVER DATE FORMAT','extJsFormat',1,'d/m/Y',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (32,'SPAGOBI.DATE-FORMAT.format','DATE FORMAT','Date visual format if language is not found',1,'dd/MM/yyyy',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (33,'SPAGOBI.DATE-FORMAT.extJsFormat','EXTJS DATE FORMAT','Date visual format if language is not found',1,'d/m/Y',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (34,'SPAGOBI.DATE-FORMAT-IT_IT.format','IT DATE FORMAT','Date format used while displaying dates according to user current locale.Format attribute is for old presentation mechanism, see java.text.SimpleDateFormat for details, while extJsFormat is for ExtJs client, that use another standard, see http://extjs.com/deploy/dev/docs/. IF YOU CHANGE ONE FORMAT YOU MUST CHANGE THE OTHER ONE ACCORDINGLY.',1,'dd/MM/yyyy',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (35,'SPAGOBI.DATE-FORMAT-IT_IT.extJsFormat','EXTJS IT DATE FORMAT','extJsFormat',1,'d/m/Y',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (36,'SPAGOBI.DATE-FORMAT-EN_US.format','US DATE FORMAT','Date format used while displaying dates according to user current locale.Format attribute is for old presentation mechanism, see java.text.SimpleDateFormat for details, while extJsFormat is for ExtJs client, that use another standard, see http://extjs.com/deploy/dev/docs/. IF YOU CHANGE ONE FORMAT YOU MUST CHANGE THE OTHER ONE ACCORDINGLY.',1,'MM/dd/yyyy',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (37,'SPAGOBI.DATE-FORMAT-EN_US.extJsFormat','EXTJS US DATE FORMAT','extJsFormat',1,'m/d/Y',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (38,'SPAGOBI.DATE-FORMAT-FR_FR.format','FR DATE FORMAT','Date format used while displaying dates according to user current locale.Format attribute is for old presentation mechanism, see java.text.SimpleDateFormat for details, while extJsFormat is for ExtJs client, that use another standard, see http://extjs.com/deploy/dev/docs/. IF YOU CHANGE ONE FORMAT YOU MUST CHANGE THE OTHER ONE ACCORDINGLY.',1,'dd/MM/yyyy',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (39,'SPAGOBI.DATE-FORMAT-FR_FR.extJsFormat','EXTJS RF DATE FORMAT','extJsFormat',1,'d/m/Y',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (40,'SPAGOBI.DATE-FORMAT-ES_ES.format','ES DATE FORMAT','Date format used while displaying dates according to user current locale.Format attribute is for old presentation mechanism, see java.text.SimpleDateFormat for details, while extJsFormat is for ExtJs client, that use another standard, see http://extjs.com/deploy/dev/docs/. IF YOU CHANGE ONE FORMAT YOU MUST CHANGE THE OTHER ONE ACCORDINGLY.',1,'dd/MM/yyyy',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (41,'SPAGOBI.DATE-FORMAT-ES_ES.extJsFormat','EXTJS ES DATE FORMAT','extJsFormat',1,'d/m/Y',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (42,'SPAGOBI.TIMESTAMP-FORMAT.format','TIMESTAMP FORMAT','TimeStamp Format of SpagoBI DB',1,'dd/MM/yyyy hh:mm:ss',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (43,'SPAGOBI.TIMESTAMP-FORMAT.extJsFormat','EXTJS TIMESTAMP FORMAT','TimeStamp Format of SpagoBI DB',1,'d/m/Y H:i:s',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (44,'SPAGOBI.ORGANIZATIONAL-UNIT.jndiDatasource','jndiDatasource','jndiDatasource',1,'java:comp/env/jdbc/foodmart',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'ORGANIZATIONAL-UNIT'),
 (45,'SPAGOBI.ORGANIZATIONAL-UNIT.getHierarchiesQuery','getHierarchiesQuery','getHierarchiesQuery',1,'SELECT distinct store_country as HIERARCHY, \' \' as COMPANY FROM store',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'ORGANIZATIONAL-UNIT'),
 (46,'SPAGOBI.ORGANIZATIONAL-UNIT.getOUsQuery','getOUsQuery','getOUsQuery',1,'SELECT distinct a.store_state as name, a.store_state as code FROM store a union select b.store_city as name, b.store_city as code from store b union select c.store_name as name , c.store_name as code from store c',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'ORGANIZATIONAL-UNIT'),
 (47,'SPAGOBI.ORGANIZATIONAL-UNIT.getRootByHierarchy','getRootByHierarchy','getRootByHierarchy',1,'SELECT distinct store_country as code, store_country as name FROM store where store_country = ?',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'ORGANIZATIONAL-UNIT'),
 (48,'SPAGOBI.ORGANIZATIONAL-UNIT.getChildrenByLevel','getChildrenByLevel','getChildrenByLevel',1,'select distinct ! as code, ! as name from store where store_country = ? ',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'ORGANIZATIONAL-UNIT'),
 (49,'SPAGOBI.ORGANIZATIONAL-UNIT.getRootLeaves','getRootLeaves','getRootLeaves',1,'',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'ORGANIZATIONAL-UNIT'),
 (50,'SPAGOBI.ORGANIZATIONAL-UNIT.provider','provider','provider',1,'it.eng.spagobi.kpi.ou.provider.OrganizationalUnitListProviderFoodmart',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'ORGANIZATIONAL-UNIT'),
 (51,'SPAGOBI.SECURITY.DEFAULT_USER','DEFAULT_USER','DEFAULT_USER used by portal environment',1,'biadmin',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (52,'SPAGOBI.SECURITY.PORTAL-SECURITY-CLASS.className','Security Info provider','Security Info provider',1,'it.eng.spagobi.security.InternalSecurityInfoProviderImpl',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (53,'SPAGOBI.SECURITY.USER-PROFILE-FACTORY-CLASS.className','Security Service Supplier','Security Service Supplier',1,'it.eng.spagobi.security.InternalSecurityServiceSupplierImpl',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (54,'SPAGOBI.SECURITY.PORTAL-SECURITY-INIT-CLASS.className','Security Initializer','Security Initializer',1,'it.eng.spagobi.security.init.InternalSecurityInitializer',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (55,'SPAGOBI.SECURITY.ROLE-NAME-PATTERN-FILTER','ROLE NAME PATTERN FILTER','ROLE-NAME-PATTERN-FILTER',1,'.*',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (56,'SPAGOBI.SECURITY.ROLE-TYPE-PATTERNS.DEV_ROLE-PATTERN','DEV ROLE PATTERN','DEV ROLE PATTERN',1,'/spagobi/dev',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (57,'SPAGOBI.SECURITY.ROLE-TYPE-PATTERNS.TEST_ROLE-PATTERN','TEST ROLE PATTERN','TEST ROLE PATTERN',1,'/spagobi/test',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (58,'SPAGOBI.SECURITY.ROLE-TYPE-PATTERNS.MODEL_ADMIN-PATTERN','MODEL ADMIN PATTERN','MODEL ADMIN PATTERN',1,'/spagobi/modeladmin',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (59,'SPAGOBI.SECURITY.ROLE-TYPE-PATTERNS.ADMIN-PATTERN','ADMIN -PATTERN','ADMIN -PATTERN',1,'/spagobi/admin',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (60,'CAS_SSO.VALIDATE-USER.URL','CAS VALIDATE USER URL','CAS VALIDATE USER URL',1,'https://athos.engilab.ewebpd.eng.it:1447/cas',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (61,'CAS_SSO.VALIDATE-USER.SERVICE','CAS VALIDATE USER SERVICE','CAS VALIDATE USER SERVICE',1,'http://localhost:58080/SpagoBI/proxyCallback',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (62,'SPAGOBI.PORTLET_EDIT_MODE_ROLES.ROLE.name','PORTLET EDIT MODE ROLES','PORTLET EDIT MODE ROLES',1,'/spagobi/admin',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (63,'SPAGOBI_SSO.ACTIVE','ACTIVE SSO FLAG','ACTIVE SSO FLAG',1,'false',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (64,'SPAGOBI_SSO.PASS','PASS String','Some proxy element use this string to do some security check',1,'PASS',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (65,'SPAGOBI_SSO.SECURITY_LOGOUT_URL','SECURITY LOGOUT URL','',1,'https://athos.engilab.ewebpd.eng.it:1447/cas/logout',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (66,'SPAGOBI_SSO.INTEGRATION_CLASS_JNDI','SSO INTEGRATION CLASS JNDI','SSO INTEGRATION CLASS JNDI',1,'java://comp/env/spagobi_sso_class',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (67,'SPAGOBI.DB-TIMESTAMP-FORMAT.format','DB TIMESTAMP FORMAT','DB TIMESTAMP FORMAT',1,'yyyy-MM-dd HH:mm:ss',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (68,'SPAGOBI.DB_LOG.value','DB LOG','DB LOG',1,'false',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'DATE-FORMAT'),
 (69,'SPAGOBI.THEMES.THEMES','THEMEs','All themes',1,'sbi_default',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'THEMES'),
 (70,'SPAGOBI.THEMES.THEME.default','THEME default','THEME.default',1,'sbi_default',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'THEMES'),
 (71,'SPAGOBI.THEMES.THEME.sbi_default.view_name','THEME view_name','THEME.view_name',1,'default',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'THEMES'),
 (72,'SPAGOBI.THEMES.THEME.sbi_default.ext_theme','THEME ext_theme','THEME.ext_theme',1,'xtheme-gray.css',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'THEMES'),
 (73,'SPAGOBI.THEMES.THEME.sbi_default.name','default THEME name','THEME.default',1,'sbi_default',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'THEMES'),
 (74,'SPAGOBI.LANGUAGE_SUPPORTED.LANGUAGES','LANGUAGES','All languages supported',1,'[it,IT],[en,US],[fr,FR],[es,ES]',30,'server',NULL,NULL,'2013-11-17 11:18:08',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'LANGUAGE_SUPPORTED'),
 (75,'SPAGOBI.LANGUAGE_SUPPORTED.LANGUAGE.default','default','default',1,'en,US',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'LANGUAGE_SUPPORTED'),
 (76,'INDEX_INITIALIZATION.jndiResourcePath','INDEX_INITIALIZATION.jndiResourcePath','',1,'java://comp/env/spagobi_resource_path',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SEARCH_ENGINE'),
 (77,'INDEX_INITIALIZATION.name','INDEX_INITIALIZATION.jndiResourcePath','',1,'//idx',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SEARCH_ENGINE'),
 (78,'SCRIPT_LANGUAGE_DEFAULT','SCRIPT LANGUAGE DEFAULT','',1,'groovy',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SCRIPT_LANGUAGE'),
 (79,'SCRIPT_LANGUAGE.groovy.name','SCRIPT LANGUAGE.groovy.name','',1,'groovy',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SCRIPT_LANGUAGE'),
 (80,'SCRIPT_LANGUAGE.groovy.engineclass','SCRIPT LANGUAGE.groovy.engineclass','',1,'org.codehaus.groovy.bsf.GroovyEngine',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SCRIPT_LANGUAGE'),
 (81,'SCRIPT_LANGUAGE.groovy.shortidentifier','SCRIPT LANGUAGE.groovy.shortidentifier','',1,'gy',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SCRIPT_LANGUAGE'),
 (82,'SCRIPT_LANGUAGE.groovy.predefinedScriptFile','SCRIPT LANGUAGE.groovy.predefinedScriptFile','',1,'predefinedGroovyScript.groovy',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SCRIPT_LANGUAGE'),
 (83,'SCRIPT_LANGUAGE.groovy.identifier','SCRIPT LANGUAGE.groovy.identifier','',1,'groovy',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SCRIPT_LANGUAGE'),
 (84,'SCRIPT_LANGUAGE.javascript.name','SCRIPT LANGUAGE.groovy.name','',1,'javascript',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SCRIPT_LANGUAGE'),
 (85,'SCRIPT_LANGUAGE.javascript.shortidentifier','SCRIPT LANGUAGE.groovy.shortidentifier','',1,'js',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SCRIPT_LANGUAGE'),
 (86,'SCRIPT_LANGUAGE.javascript.predefinedScriptFile','SCRIPT LANGUAGE.groovy.predefinedScriptFile','',1,'predefinedJavascriptScript.js',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SCRIPT_LANGUAGE'),
 (87,'SCRIPT_LANGUAGE.javascript.identifier','SCRIPT LANGUAGE.groovy.identifier','',1,'javascript',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SCRIPT_LANGUAGE'),
 (88,'MAIL.PROFILES.trustedStore.file','Trusted Store File Path','',1,'',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (89,'MAIL.PROFILES.trustedStore.password','Trusted Store Password','',1,'',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (90,'MAIL.PROFILES.keyStore.file','Key Store File Path','',1,'',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (91,'MAIL.PROFILES.keyStore.password','Key Store Password','',1,'',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (92,'MAIL.PROFILES.scheduler.smtphost','Scheduler Smtp Host','',1,'mail.eng.it',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (93,'MAIL.PROFILES.scheduler.smtpport','Scheduler Smtp Port','',1,'110',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (94,'MAIL.PROFILES.scheduler.from','Scheduler From','',1,'spagobi@eng.it',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (95,'MAIL.PROFILES.scheduler.user','Scheduler User','',1,'',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (96,'MAIL.PROFILES.scheduler.password','Scheduler Password','',1,'',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (97,'MAIL.PROFILES.scheduler.useSSL','Use SSL Connection','',1,'false',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (98,'MAIL.PROFILES.user.smtphost','Scheduler Smtp Host','',1,'mail.eng.it',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (99,'MAIL.PROFILES.user.smtpport','Scheduler Smtp Port','',1,'110',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (100,'MAIL.PROFILES.user.from','Scheduler From','',1,'spagobi@eng.it',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (101,'MAIL.PROFILES.user.user','Scheduler User','',1,'',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (102,'MAIL.PROFILES.user.password','Scheduler Password','',1,'',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (103,'MAIL.PROFILES.user.useSSL','Use SSL Connection','',1,'false',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (104,'MAIL.PROFILES.kpi_alarm.smtphost','Scheduler Smtp Host','',1,'mail.eng.it',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (105,'MAIL.PROFILES.kpi_alarm.smtpport','Scheduler Smtp Port','',1,'110',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (106,'MAIL.PROFILES.kpi_alarm.from','Scheduler From','',1,'spagobi@eng.it',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (107,'MAIL.PROFILES.kpi_alarm.user','Scheduler User','',1,'',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (108,'MAIL.PROFILES.kpi_alarm.password','Scheduler Password','',1,'',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (109,'MAIL.PROFILES.kpi_alarm.useSSL','Use SSL Connection','',1,'false',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (110,'DATA_SET_NULL_VALUE','DATA_SET_NULL_VALUE','Default value to replace null dataset values',1,'%',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'MAIL'),
 (111,'JNDI_THREAD_MANAGER','JNDI_THREAD_MANAGER','Jndi to build work manager',1,'java:/comp/env/wm/SpagoWorkManager',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'GENERIC_CONFIGURATION'),
 (112,'SPAGOBI.SECURITY.CHECK_ROLE_LOGIN','SPAGOBI.SECURITY.CHECK_ROLE_LOGIN','Check the correct role in login action',0,'false',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY'),
 (113,'SPAGOBI.SECURITY.ROLE_LOGIN','SPAGOBI.SECURITY.ROLE_LOGIN','The value of the role to check at login module',0,'',30,'server',NULL,NULL,'2013-11-17 11:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,NULL,'SECURITY');
/*!40000 ALTER TABLE `sbi_config` ENABLE KEYS */;


--
-- Definition of table `sbi_data_set`
--

DROP TABLE IF EXISTS `sbi_data_set`;
CREATE TABLE `sbi_data_set` (
  `DS_ID` int(11) NOT NULL,
  `VERSION_NUM` int(11) NOT NULL,
  `ACTIVE` tinyint(1) NOT NULL,
  `DESCR` varchar(160) DEFAULT NULL,
  `LABEL` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `OBJECT_TYPE` varchar(50) DEFAULT NULL,
  `DS_METADATA` text,
  `PARAMS` varchar(4000) DEFAULT NULL,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  `TRANSFORMER_ID` int(11) DEFAULT NULL,
  `PIVOT_COLUMN` varchar(50) DEFAULT NULL,
  `PIVOT_ROW` varchar(50) DEFAULT NULL,
  `PIVOT_VALUE` varchar(50) DEFAULT NULL,
  `NUM_ROWS` tinyint(1) DEFAULT '0',
  `IS_PERSISTED` tinyint(1) DEFAULT '0',
  `DATA_SOURCE_PERSIST_ID` int(11) DEFAULT NULL,
  `IS_FLAT_DATASET` tinyint(1) DEFAULT '0',
  `FLAT_TABLE_NAME` varchar(50) DEFAULT NULL,
  `DATA_SOURCE_FLAT_ID` int(11) DEFAULT NULL,
  `CONFIGURATION` text,
  `OWNER` varchar(50) DEFAULT NULL,
  `IS_PUBLIC` tinyint(1) DEFAULT '0',
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DS_ID`,`VERSION_NUM`),
  UNIQUE KEY `XAK1SBI_DATA_SET` (`LABEL`,`VERSION_NUM`,`ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_data_set`
--

/*!40000 ALTER TABLE `sbi_data_set` DISABLE KEYS */;
INSERT INTO `sbi_data_set` (`DS_ID`,`VERSION_NUM`,`ACTIVE`,`DESCR`,`LABEL`,`NAME`,`OBJECT_TYPE`,`DS_METADATA`,`PARAMS`,`CATEGORY_ID`,`TRANSFORMER_ID`,`PIVOT_COLUMN`,`PIVOT_ROW`,`PIVOT_VALUE`,`NUM_ROWS`,`IS_PERSISTED`,`DATA_SOURCE_PERSIST_ID`,`IS_FLAT_DATASET`,`FLAT_TABLE_NAME`,`DATA_SOURCE_FLAT_ID`,`CONFIGURATION`,`OWNER`,`IS_PUBLIC`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,1,1,'test','testset','testset','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"var_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT imei_no,var_data1 FROM machine_details m\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-18 19:04:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,1,0,'solarKPI','solarKPI','solarKPI','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"select report_data1 from report_data\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-18 21:13:26',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,2,0,'solarKPI','solarKPI','solarKPI','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"value\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"select report_data1 as value from report_data\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-18 21:14:22',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,3,1,'solarKPI','solarKPI','solarKPI','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"value\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"select report_data1 as value from report_data where imei_no=$P{imeino}\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 15:56:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,1,0,'energy_generation_day1','energy_generation_day1','energy_generation_day1','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT hour,report_data1 FROM report_data where imei_no = \'00000001\' and date = current_date;\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:00:36',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,2,0,'energy_generation_day1','energy_generation_day1','energy_generation_day1','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT hour,report_data1 FROM report_data where imei_no = \'00000001\' and date = current_date\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:00:57',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,3,0,'energy_generation_day1','energy_generation_day1','energy_generation_day1','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT hour,report_data1 FROM report_data where imei_no = $P{imeino} and date = current_date\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 20:09:17',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,4,0,'energy_generation_day1','energy_generation_day1','energy_generation_day1','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT hour,report_data1 FROM report_data where imei_no = $P{imeino} and date = current_date\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 20:09:53',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,5,0,'energy_generation_day1','energy_generation_day1','energy_generation_day1','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT hour,report_data1 FROM report_data where imei_no = $P{imeino} and date = current_date\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 20:18:41',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,6,0,'energy_generation_day1','energy_generation_day1','energy_generation_day1','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT rd.hour,rd.report_data1 FROM report_data rd \\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and rd. imei_no = $P{imeino} and rd.date = current_date\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:14:28',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,7,1,'energy_generation_day1','energy_generation_day1','energy_generation_day1','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT rd.hour,rd.report_data1 FROM report_data rd \\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere  rd. imei_no = $P{imeino} and rd.date = current_date\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:29:20',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,1,0,'energy_generation_day2','energy_generation_day2','energy_generation_day2','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT hour,report_data1 FROM report_data where imei_no = \'00000001\' and date = current_date-1\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:02:24',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,2,0,'energy_generation_day2','energy_generation_day2','energy_generation_day2','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT hour,report_data1 FROM report_data where imei_no = $P{imeino}  and date = current_date-1\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 20:27:24',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,3,0,'energy_generation_day2','energy_generation_day2','energy_generation_day2','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT rd.hour,rd.report_data1 FROM report_data rd \\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and rd. imei_no = $P{imeino} and rd.date  = current_date-1\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:15:21',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,4,1,'energy_generation_day2','energy_generation_day2','energy_generation_day2','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT rd.hour,rd.report_data1 FROM report_data rd \\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere  rd. imei_no = $P{imeino} and rd.date  = current_date-1\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:29:43',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,1,0,'energy_generation_day3','energy_generation_day3','energy_generation_day3','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT hour,report_data1 FROM report_data where imei_no = \'00000001\' and date = current_date-2\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:02:51',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,2,0,'energy_generation_day3','energy_generation_day3','energy_generation_day3','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT hour,report_data1 FROM report_data where imei_no = $P{imeino}  and date = current_date-2\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 20:27:34',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,3,0,'energy_generation_day3','energy_generation_day3','energy_generation_day3','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT rd.hour,rd.report_data1 FROM report_data rd \\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and rd. imei_no = $P{imeino} and rd.date = current_date-2\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:16:53',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,4,1,'energy_generation_day3','energy_generation_day3','energy_generation_day3','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT rd.hour,rd.report_data1 FROM report_data rd \\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere  rd. imei_no = $P{imeino} and rd.date = current_date-2\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:30:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,1,0,'energy_generation_day4','energy_generation_day4','energy_generation_day4','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT hour,report_data1 FROM report_data where imei_no = \'00000001\' and date = current_date-3\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:03:19',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,2,0,'energy_generation_day4','energy_generation_day4','energy_generation_day4','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT hour,report_data1 FROM report_data where imei_no = $P{imeino}  and date = current_date-3\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 20:27:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,3,0,'energy_generation_day4','energy_generation_day4','energy_generation_day4','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT rd.hour,rd.report_data1 FROM report_data rd \\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and rd. imei_no = $P{imeino} and rd.date = current_date-3\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:17:12',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,4,1,'energy_generation_day4','energy_generation_day4','energy_generation_day4','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT rd.hour,rd.report_data1 FROM report_data rd \\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere  rd. imei_no = $P{imeino} and rd.date = current_date-3\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:30:30',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,1,0,'energy_generation_day5','energy_generation_day5','energy_generation_day5','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT hour,report_data1 FROM report_data where imei_no = \'00000001\' and date = current_date-4\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:04:52',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,2,0,'energy_generation_day5','energy_generation_day5','energy_generation_day5','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT hour,report_data1 FROM report_data where imei_no = $P{imeino}  and date = current_date-4\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 20:27:55',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,3,0,'energy_generation_day5','energy_generation_day5','energy_generation_day5','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT rd.hour,rd.report_data1 FROM report_data rd \\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and rd. imei_no = $P{imeino} and rd.date = current_date-4\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:17:30',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,4,1,'energy_generation_day5','energy_generation_day5','energy_generation_day5','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"report_data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT rd.hour,rd.report_data1 FROM report_data rd \\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere rd. imei_no = $P{imeino} and rd.date = current_date-4\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:30:53',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,1,0,'solar_energy_generation','solar_energy_generation','solar_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Long\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no ,md.name as machine,month(rd.date),sum(rd.report_data1) as solar FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = 1 and  month(rd.date)=10 group by md.imei_no,month(rd.date);\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-22 21:50:59',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,2,0,'solar_energy_generation','solar_energy_generation','solar_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Long\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no ,md.name as machine,month(rd.date),sum(rd.report_data1) as solar FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = 1 and\\n year(rd.date) = \'2013\' and  month(rd.date)=10 group by md.imei_no,month(rd.date);\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-22 22:05:54',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,3,0,'solar_energy_generation','solar_energy_generation','solar_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no ,md.name as machine,month(rd.date),sum(rd.report_data1) as solar FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and\\n year(rd.date) = $P{year} and month(rd.date)=$P{month} group by md.imei_no,month(rd.date);\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:18:57',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,4,1,'solar_energy_generation','solar_energy_generation','solar_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imeino\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no as imeino ,md.name as machine,month(rd.date),sum(rd.report_data1) as solar FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and\\n year(rd.date) = $P{year} and month(rd.date)=$P{month} group by md.imei_no,month(rd.date);\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:56:00',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,1,0,'load_energy_generation','load_energy_generation','load_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"name\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Long\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name,month(rd.date),sum(rd.report_data2) as \'load\' FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = 1 and month(rd.date)=10 group by md.imei_no,month(rd.date);\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-22 21:55:30',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,2,0,'load_energy_generation','load_energy_generation','load_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Long\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name as machine,month(rd.date),sum(rd.report_data2) as \'load\' FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = 1 and month(rd.date)=10 group by md.imei_no,month(rd.date);\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-22 21:56:02',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,3,0,'load_energy_generation','load_energy_generation','load_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Long\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name as machine,month(rd.date),sum(rd.report_data2) as \'load\' FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = 1 and month(rd.date)=10 group by md.imei_no,month(rd.date);\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-22 21:56:13',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,4,0,'load_energy_generation','load_energy_generation','load_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Long\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name as machine,month(rd.date),sum(rd.report_data2) as \'load\' FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = 1 and\\n year(rd.date) = \'2013\' and month(rd.date)=10 group by md.imei_no,month(rd.date);\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-22 22:05:34',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,5,0,'load_energy_generation','load_energy_generation','load_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name as machine,month(rd.date),sum(rd.report_data2) as \'load\' FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and\\n year(rd.date) = $P{year} and month(rd.date)=$P{month} group by md.imei_no,month(rd.date);\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:05:11',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,6,0,'load_energy_generation','load_energy_generation','load_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name as machine,month(rd.date),sum(rd.report_data2) as \'load\' FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and\\n year(rd.date) = $P{year} and month(rd.date)=$P{month} group by md.imei_no,month(rd.date)\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:18:09',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,7,1,'load_energy_generation','load_energy_generation','load_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name as machine,month(rd.date),sum(rd.report_data3) as \'load\' FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and\\n year(rd.date) = $P{year} and month(rd.date)=$P{month} group by md.imei_no,month(rd.date)\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:23:33',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,1,0,'eb_energy_generation','eb_energy_generation','eb_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Long\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name as machine,month(rd.date),sum(rd.report_data3) as eb FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = 1 and month(rd.date)=10 group by md.imei_no,month(rd.date);\\n\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-22 21:57:33',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,2,0,'eb_energy_generation','eb_energy_generation','eb_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Long\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name as machine,month(rd.date),sum(rd.report_data3) as eb FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = 1 and\\n year(rd.date) = \'2013\' and month(rd.date)=10 group by md.imei_no,month(rd.date);\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-22 22:05:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,3,0,'eb_energy_generation','eb_energy_generation','eb_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name as machine,month(rd.date),sum(rd.report_data3) as eb FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and\\n year(rd.date) = $P{year} and month(rd.date)=$P{month} group by md.imei_no,month(rd.date);\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:22:16',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,4,1,'eb_energy_generation','eb_energy_generation','eb_energy_generation','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"month(rd.date)\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name as machine,month(rd.date),sum(rd.report_data2) as eb FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and\\n year(rd.date) = $P{year} and month(rd.date)=$P{month} group by md.imei_no,month(rd.date);\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:23:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (11,1,0,'All_energy_generation_for_machine','All_energy_generation_for_machine','All_energy_generation_for_machine','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"date\" type=\"java.sql.Date\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT rd.date as date,sum(rd.report_data1) as \'solar\',sum(rd.report_data2) as \'load\',sum(rd.report_data3) as \'eb\'  FROM report_data rd\\nwhere rd.imei_no = \'00000001\' and\\n year(rd.date) = \'2013\' and month(rd.date)=11 group by rd.date;\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-22 22:04:36',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (11,2,0,'All_energy_generation_for_machine','All_energy_generation_for_machine','All_energy_generation_for_machine','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"date\" type=\"java.sql.Date\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT  rd.date as date,sum(rd.report_data1) as \'solar\',sum(rd.report_data2) as \'load\',sum(rd.report_data3) as \'eb\'  FROM report_data rd\\nwhere rd.imei_no = \'00000001\' and\\n year(rd.date) = \'2013\' and month(rd.date)=11 group by rd.date;\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-22 23:37:27',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (11,3,0,'All_energy_generation_for_machine','All_energy_generation_for_machine','All_energy_generation_for_machine','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"date\" type=\"java.sql.Date\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT  rd.date as date,sum(rd.report_data1) as \'solar\',sum(rd.report_data2) as \'load\',sum(rd.report_data3) as \'eb\'  FROM report_data rd\\nwhere rd.imei_no = \'00000001\' and\\n year(rd.date) = \'2013\' and month(rd.date)=11 group by rd.date;\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 07:56:24',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (11,4,0,'All_energy_generation_for_machine','All_energy_generation_for_machine','All_energy_generation_for_machine','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"date\" type=\"java.sql.Date\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT  rd.date as date,sum(rd.report_data1) as \'solar\',sum(rd.report_data2) as \'load\',sum(rd.report_data3) as \'eb\'  FROM report_data rd\\nwhere rd.imei_no = $P{imeino} and\\n year(rd.date) = $P{year} and month(rd.date)=$P{month} group by rd.date;\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:27:32',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (11,5,0,'All_energy_generation_for_machine','All_energy_generation_for_machine','All_energy_generation_for_machine','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"date\" type=\"java.sql.Date\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT  rd.date as date,sum(rd.report_data1) as \'solar\',sum(rd.report_data2) as \'load\',sum(rd.report_data3) as \'eb\'  FROM report_data rd\\nwhere rd.imei_no = $P{imeino} and\\n year(rd.date) = $P{year} and month(rd.date)=$P{month} group by rd.date;\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:54:52',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (11,6,0,'All_energy_generation_for_machine','All_energy_generation_for_machine','All_energy_generation_for_machine','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"date\" type=\"java.sql.Date\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT  rd.date as date,sum(rd.report_data1) as \'solar\',sum(rd.report_data2) as \'load\',sum(rd.report_data3) as \'eb\'  FROM report_data rd inner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.name = $P{imeino} and\\n year(rd.date) = $P{year} and month(rd.date)=$P{month} group by rd.date;\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:00:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (11,7,0,'All_energy_generation_for_machine','All_energy_generation_for_machine','All_energy_generation_for_machine','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"date\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT  DATE_FORMAT((cast(rd.date as char)),\'%Y-%m-%d \') as date,sum(rd.report_data1) as \'solar\',sum(rd.report_data2) as \'load\',sum(rd.report_data3) as \'eb\'  FROM report_data rd inner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.name = $P{imeino} and\\n year(rd.date) = $P{year} and month(rd.date)=$P{month} group by rd.date;\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:05:28',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (11,8,1,'All_energy_generation_for_machine','All_energy_generation_for_machine','All_energy_generation_for_machine','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"date\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT  DATE_FORMAT((cast(rd.date as char)),\'%d \') as date,sum(rd.report_data1) as \'solar\',sum(rd.report_data2) as \'load\',sum(rd.report_data3) as \'eb\'  FROM report_data rd inner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.name = $P{imeino} and\\n year(rd.date) = $P{year} and month(rd.date)=$P{month} group by rd.date;\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:13:50',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (12,1,0,NULL,'ConsumptionTrend','ConsumptionTrend','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name as machine,hour,rd.report_data1 as solar,rd.report_data2 as \'load\',rd.report_data3 as eb FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = 1 and\\nrd.date=\'2013-10-02\' and md.imei_no=\'00000001\';\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:35:21',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (12,2,0,NULL,'ConsumptionTrend','ConsumptionTrend','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name as machine,hour,rd.report_data1 as solar,rd.report_data2 as \'load\',rd.report_data3 as eb FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and\\nrd.date=(concat(mid($P{day},7,4),\'-\',mid($P{day},4,2),\'-\',mid($P{day},1,2))) and md.imei_no=$P{imeino};\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:42:23',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (12,3,1,'ConsumptionTrend','ConsumptionTrend','ConsumptionTrend','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"imei_no\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"machine\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"hour\" type=\"java.lang.Integer\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"solar\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"load\" type=\"java.lang.Double\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"eb\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"SELECT md.imei_no,md.name as machine,hour,rd.report_data1 as solar,rd.report_data2 as \'load\',rd.report_data3 as eb FROM report_data rd\\ninner join machine_details md on rd.imei_no = md.imei_no\\nwhere md.customer_id = $P{customer} and\\nrd.date=(concat(mid($P{day},7,4),\'-\',mid($P{day},4,2),\'-\',mid($P{day},1,2))) and md.imei_no=$P{imeino};\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:51:49',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (13,1,0,NULL,'SelectedParamTrend','SelectedParamTrend','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"DATE_FORMAT((cast(data_timestamp as char)),\'%Y-%m-%d  %h:%m:%s\')\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"data_timestamp\" type=\"java.sql.Timestamp\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"select DATE_FORMAT((cast(data_timestamp as char)),\'%Y-%m-%d  %h:%m:%s\'),data_timestamp,data1 from history_details where imei_no= \'00000001\' and date(data_timestamp)=\'2009-10-09\';\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:53:56',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (13,2,0,NULL,'SelectedParamTrend','SelectedParamTrend','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"DATE_FORMAT((cast(data_timestamp as char)),\'%Y-%m-%d  %h:%m:%s\')\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"data_timestamp\" type=\"java.sql.Timestamp\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"select DATE_FORMAT((cast(data_timestamp as char)),\'%Y-%m-%d  %h:%m:%s\'),data_timestamp,data1 from history_details where imei_no= \'00000001\' and date(data_timestamp)=\'2009-10-09\';\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:54:43',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (13,3,1,NULL,'SelectedParamTrend','SelectedParamTrend','SbiQueryDataSet','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<COLUMNLIST>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"date\" type=\"java.lang.String\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"data_timestamp\" type=\"java.sql.Timestamp\"/>\r\n  <COLUMN fieldType=\"ATTRIBUTE\" name=\"data1\" type=\"java.lang.Double\"/>\r\n</COLUMNLIST>\r\n','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<PARAMETERSLIST>\r\n  <ROWS/>\r\n</PARAMETERSLIST>\r\n',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,'',NULL,'{\"Query\":\"select DATE_FORMAT((cast(data_timestamp as char)),\'%Y-%m-%d  %h:%m:%s\') as date,data_timestamp,data1 from history_details where imei_no= \'00000001\' and date(data_timestamp)=\'2009-10-09\';\",\"queryScript\":\"\",\"queryScriptLanguage\":\"\",\"dataSource\":\"machine\"}','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:55:09',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_data_set` ENABLE KEYS */;


--
-- Definition of table `sbi_data_source`
--

DROP TABLE IF EXISTS `sbi_data_source`;
CREATE TABLE `sbi_data_source` (
  `DS_ID` int(11) NOT NULL,
  `DESCR` varchar(160) DEFAULT NULL,
  `LABEL` varchar(50) NOT NULL,
  `JNDI` varchar(50) DEFAULT NULL,
  `URL_CONNECTION` varchar(500) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PWD` varchar(50) DEFAULT NULL,
  `DRIVER` varchar(160) DEFAULT NULL,
  `DIALECT_ID` int(11) NOT NULL,
  `MULTI_SCHEMA` tinyint(1) NOT NULL DEFAULT '0',
  `ATTR_SCHEMA` varchar(45) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_DE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DS_ID`),
  UNIQUE KEY `XAK1SBI_DATA_SOURCE` (`LABEL`,`ORGANIZATION`),
  KEY `FK_SBI_DATA_SOURCE_1` (`DIALECT_ID`),
  CONSTRAINT `FK_SBI_DATA_SOURCE_1` FOREIGN KEY (`DIALECT_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_data_source`
--

/*!40000 ALTER TABLE `sbi_data_source` DISABLE KEYS */;
INSERT INTO `sbi_data_source` (`DS_ID`,`DESCR`,`LABEL`,`JNDI`,`URL_CONNECTION`,`USERNAME`,`PWD`,`DRIVER`,`DIALECT_ID`,`MULTI_SCHEMA`,`ATTR_SCHEMA`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,'machine database','machine','','jdbc:mysql://localhost:3306/machine','root','root','com.mysql.jdbc.Driver',65,0,'','biadmin',NULL,NULL,'2013-11-18 18:59:04','2013-11-18 18:59:04','2013-11-18 18:59:04','4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_data_source` ENABLE KEYS */;


--
-- Definition of table `sbi_dist_list`
--

DROP TABLE IF EXISTS `sbi_dist_list`;
CREATE TABLE `sbi_dist_list` (
  `DL_ID` int(11) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `DESCR` varchar(160) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DL_ID`),
  UNIQUE KEY `XAK1SBI_SBI_DIST_LIST` (`NAME`,`ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_dist_list`
--

/*!40000 ALTER TABLE `sbi_dist_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_dist_list` ENABLE KEYS */;


--
-- Definition of table `sbi_dist_list_objects`
--

DROP TABLE IF EXISTS `sbi_dist_list_objects`;
CREATE TABLE `sbi_dist_list_objects` (
  `REL_ID` int(11) NOT NULL,
  `DOC_ID` int(11) NOT NULL,
  `DL_ID` int(11) NOT NULL,
  `XML` varchar(5000) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`REL_ID`),
  KEY `FK_SBI_DIST_LIST_OBJECTS_1` (`DOC_ID`),
  KEY `FK_SBI_DIST_LIST_OBJECTS_2` (`DL_ID`),
  CONSTRAINT `FK_SBI_DIST_LIST_OBJECTS_1` FOREIGN KEY (`DOC_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SBI_DIST_LIST_OBJECTS_2` FOREIGN KEY (`DL_ID`) REFERENCES `sbi_dist_list` (`DL_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_dist_list_objects`
--

/*!40000 ALTER TABLE `sbi_dist_list_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_dist_list_objects` ENABLE KEYS */;


--
-- Definition of table `sbi_dist_list_user`
--

DROP TABLE IF EXISTS `sbi_dist_list_user`;
CREATE TABLE `sbi_dist_list_user` (
  `DLU_ID` int(11) NOT NULL,
  `LIST_ID` int(11) NOT NULL,
  `USER_ID` varchar(40) NOT NULL,
  `E_MAIL` varchar(70) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DLU_ID`),
  UNIQUE KEY `XAK1SBI_DL_USER` (`LIST_ID`,`USER_ID`),
  CONSTRAINT `FK_SBI_DIST_LIST_USER_1` FOREIGN KEY (`LIST_ID`) REFERENCES `sbi_dist_list` (`DL_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_dist_list_user`
--

/*!40000 ALTER TABLE `sbi_dist_list_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_dist_list_user` ENABLE KEYS */;


--
-- Definition of table `sbi_domains`
--

DROP TABLE IF EXISTS `sbi_domains`;
CREATE TABLE `sbi_domains` (
  `VALUE_ID` int(11) NOT NULL,
  `VALUE_CD` varchar(100) DEFAULT NULL,
  `VALUE_NM` varchar(40) DEFAULT NULL,
  `DOMAIN_CD` varchar(20) DEFAULT NULL,
  `DOMAIN_NM` varchar(40) DEFAULT NULL,
  `VALUE_DS` varchar(160) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`),
  UNIQUE KEY `XAK1SBI_DOMAINS` (`VALUE_CD`,`DOMAIN_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_domains`
--

/*!40000 ALTER TABLE `sbi_domains` DISABLE KEYS */;
INSERT INTO `sbi_domains` (`VALUE_ID`,`VALUE_CD`,`VALUE_NM`,`DOMAIN_CD`,`DOMAIN_NM`,`VALUE_DS`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,'QUERY','sbidomains.nm.query','INPUT_TYPE','Input mode and values','sbidomains.ds.query','server',NULL,NULL,'2013-11-17 11:17:59',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (2,'SCRIPT','sbidomains.nm.script','INPUT_TYPE','Input mode and values','sbidomains.ds.script','server',NULL,NULL,'2013-11-17 11:17:59',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (3,'FIX_LOV','sbidomains.nm.fix_lov','INPUT_TYPE','Input mode and values','sbidomains.ds.fix_lov','server',NULL,NULL,'2013-11-17 11:17:59',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (4,'JAVA_CLASS','sbidomains.nm.java_class','INPUT_TYPE','Input mode and values','sbidomains.ds.java_class','server',NULL,NULL,'2013-11-17 11:17:59',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (5,'DATASET','sbidomains.nm.dataset','INPUT_TYPE','Input mode and values','sbidomains.ds.dataset','server',NULL,NULL,'2013-11-17 11:17:59',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (6,'REPORT','sbidomains.nm.report','BIOBJ_TYPE','BI Object types','sbidomains.ds.report','server',NULL,NULL,'2013-11-17 11:17:59',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (7,'OLAP','sbidomains.nm.olap','BIOBJ_TYPE','BI Object types','sbidomains.ds.olap','server',NULL,NULL,'2013-11-17 11:17:59',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (8,'DATA_MINING','sbidomains.nm.data_mining','BIOBJ_TYPE','BI Object types','sbidomains.ds.data_mining','server',NULL,NULL,'2013-11-17 11:17:59',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (9,'DASH','sbidomains.nm.dash','BIOBJ_TYPE','BI Object types','sbidomains.ds.dash','server',NULL,NULL,'2013-11-17 11:17:59',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (10,'DATAMART','sbidomains.nm.datamart','BIOBJ_TYPE','BI Object types','sbidomains.ds.datamart','server',NULL,NULL,'2013-11-17 11:17:59',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (11,'MAP','sbidomains.nm.map','BIOBJ_TYPE','BI Object types','sbidomains.ds.map','server',NULL,NULL,'2013-11-17 11:17:59',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (12,'DOSSIER','sbidomains.nm.dossier','BIOBJ_TYPE','BI Object types','sbidomains.ds.dossier','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (13,'OFFICE_DOC','sbidomains.nm.office_doc','BIOBJ_TYPE','BI Object types','sbidomains.ds.office_doc','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (14,'ETL','sbidomains.nm.etl','BIOBJ_TYPE','BI Object types','sbidomains.ds.etl','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (15,'DOCUMENT_COMPOSITE','sbidomains.nm.document_composite','BIOBJ_TYPE','BI Object types','sbidomains.ds.document_composite','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (16,'KPI','Kpi','BIOBJ_TYPE','BI Object types','Kpi business indicator','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (17,'SMART_FILTER','sbidomains.nm.smart_filter','BIOBJ_TYPE','BI Object types','sbidomains.ds.smart_filter','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (18,'CONSOLE','Console','BIOBJ_TYPE','BI Object types','sbidomains.ds.console','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (19,'WORKSHEET','sbidomains.nm.worksheet','BIOBJ_TYPE','BI Object types','sbidomains.ds.worksheet','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (20,'CHART','sbidomains.nm.chart','BIOBJ_TYPE','BI Object types','sbidomains.ds.chart','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (21,'MOBILE_REPORT','sbidomains.nm.mobile.report','BIOBJ_TYPE','BI Object types','sbidomains.ds.mobile.report','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (22,'MOBILE_CHART','sbidomains.nm.mobile.chart','BIOBJ_TYPE','BI Object types','sbidomains.ds.mobile.chart','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (23,'MOBILE_COCKPIT','sbidomains.nm.mobile.cockpit','BIOBJ_TYPE','BI Object types','sbidomains.ds.mobile.cockpit','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (24,'NETWORK','sbidomains.nm.network','BIOBJ_TYPE','BI Object types','sbidomains.ds.network','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (25,'BOOL','sbidomains.nm.bool','VALUE_TYPE','Input value types to check','sbidomains.ds.bool','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (26,'SINGLE','sbidomains.nm.single','VALUE_TYPE','Input value types to check','sbidomains.ds.single','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (27,'MULTI','sbidomains.nm.multi','VALUE_TYPE','Input value types to check','sbidomains.ds.multi','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (28,'DATE','sbidomains.nm.date','PAR_TYPE','Parameter type','sbidomains.ds.date','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (29,'NUM','sbidomains.nm.num','PAR_TYPE','Parameter type','sbidomains.ds.num','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (30,'STRING','sbidomains.nm.string','PAR_TYPE','Parameter type','sbidomains.ds.string','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (31,'USER','sbidomains.nm.user','ROLE_TYPE','Role type','sbidomains.ds.user','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (32,'ADMIN','sbidomains.nm.admin','ROLE_TYPE','Role type','sbidomains.ds.admin','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (33,'DEV_ROLE','sbidomains.nm.dev_role','ROLE_TYPE','Role type','sbidomains.ds.dev_role','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (34,'TEST_ROLE','sbidomains.nm.test_role','ROLE_TYPE','Role type','sbidomains.ds.test_role','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (35,'MODEL_ADMIN','sbidomains.nm.model_admin','ROLE_TYPE','Role type','sbidomains.ds.model_admin','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (36,'SUSP','sbidomains.nm.susp','STATE','Object state','sbidomains.ds.susp','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (37,'LOW_FUNCT','sbidomains.nm.low_funct','FUNCT_TYPE','Functionality','sbidomains.ds.low_funct','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (38,'USER_FUNCT','sbidomains.nm.user_funct','FUNCT_TYPE','Functionality','sbidomains.ds.user_funct','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (39,'DEV','sbidomains.nm.dev','STATE','Object state','sbidomains.ds.dev','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (40,'TEST','sbidomains.nm.test','STATE','Object state','sbidomains.ds.test','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (41,'REL','sbidomains.nm.rel','STATE','Object state','sbidomains.ds.rel','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (42,'DATE','sbidomains.nm.date','CHECK','Check','sbidomains.ds.date','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (43,'REGEXP','sbidomains.nm.regexp','CHECK','Check','sbidomains.ds.regexp','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (44,'MAXLENGTH','sbidomains.nm.maxlength','CHECK','Check','sbidomains.ds.maxlength','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (45,'RANGE','sbidomains.nm.range','CHECK','Check','sbidomains.ds.range','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (46,'DECIMALS','sbidomains.nm.decimals','CHECK','Check','sbidomains.ds.decimals','server',NULL,NULL,'2013-11-17 11:18:00',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (47,'MINLENGTH','sbidomains.nm.minlength','CHECK','Check','sbidomains.ds.minlength','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (48,'INTERNET ADDRESS','sbidomains.nm.internet_address','PRED_CHECK','Pred Check','sbidomains.ds.internet_address','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (49,'NUMERIC','sbidomains.nm.numeric','PRED_CHECK','Pred Check','sbidomains.ds.numeric','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (50,'ALFANUMERIC','sbidomains.nm.alfanumeric','PRED_CHECK','Pred Check','sbidomains.ds.alfanumeric','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (51,'LETTERSTRING','sbidomains.nm.letterstring','PRED_CHECK','Pred Check','sbidomains.ds.letterstring','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (52,'FISCALCODE','sbidomains.nm.fiscalcode','PRED_CHECK','Pred Check','sbidomains.ds.fiscalcode','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (53,'EMAIL','sbidomains.nm.email','PRED_CHECK','Pred Check','sbidomains.ds.email','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (54,'EXT','sbidomains.nm.ext','ENGINE_TYPE','Engine types','sbidomains.ds.ext','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (55,'INT','sbidomains.nm.int','ENGINE_TYPE','Engine types','sbidomains.ds.int','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (56,'LIST','sbidomains.nm.list','SELECTION_TYPE','Selection modality of parameter values','sbidomains.ds.list','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (57,'LOOKUP','sbidomains.nm.lookup','SELECTION_TYPE','Selection modality of parameter values','sbidomains.ds.lookup','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (58,'SLIDER','sbidomains.nm.slider','SELECTION_TYPE','Selection modality of parameter values','sbidomains.ds.slider','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (59,'TREE','sbidomains.nm.tree','SELECTION_TYPE','Selection modality of parameter values','sbidomains.ds.tree','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (60,'-1','sbidomains.nm.default','DIALECT_HIB','Predefined hibernate dialect','sbidomains.ds.default','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (61,'org.hibernate.dialect.OracleDialect','sbidomains.nm.oracle','DIALECT_HIB','Predefined hibernate dialect','sbidomains.ds.oracle','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (62,'org.hibernate.dialect.Oracle9Dialect','sbidomains.nm.oracle_9i10g','DIALECT_HIB','Predefined hibernate dialect','sbidomains.ds.oracle_9i10g','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (63,'org.hibernate.dialect.SQLServerDialect','sbidomains.nm.sqlserver','DIALECT_HIB','Predefined hibernate dialect','sbidomains.ds.sqlserver','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (64,'org.hibernate.dialect.HSQLDialect','sbidomains.nm.hsql','DIALECT_HIB','Predefined hibernate dialect','sbidomains.ds.hsql','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (65,'org.hibernate.dialect.MySQLInnoDBDialect','sbidomains.nm.mysql','DIALECT_HIB','Predefined hibernate dialect','sbidomains.ds.mysql','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (66,'org.hibernate.dialect.PostgreSQLDialect','sbidomains.nm.postgresql','DIALECT_HIB','Predefined hibernate dialect','sbidomains.ds.postgresql','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (67,'org.hibernate.dialect.IngresDialect','sbidomains.nm.ingres','DIALECT_HIB','Predefined hibernate dialect','sbidomains.ds.ingres','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (68,'hbase','sbidomains.nm.hbase','DIALECT_HIB','HBQL HBase dialect','sbidomains.ds.hbase','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (69,'hive','sbidomains.nm.hive','DIALECT_HIB','HQL Hive dialect','sbidomains.ds.hive','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (70,'RANGE','sbidomains.nm.range','THRESHOLD_TYPE','Threshold Type','sbidomains.ds.range','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (71,'MINIMUM','sbidomains.nm.minimum','THRESHOLD_TYPE','Threshold Type','sbidomains.ds.minimum','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (72,'MAXIMUM','sbidomains.nm.maximum','THRESHOLD_TYPE','Threshold Type','sbidomains.ds.maximum','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (73,'URGENT','sbidomains.nm.Urgent','SEVERITY','Severity Level','sbidomains.ds.Urgent','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (74,'HIGH','sbidomains.nm.High','SEVERITY','Severity Level','sbidomains.ds.High','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (75,'MEDIUM','sbidomains.nm.Medium','SEVERITY','Severity Level','sbidomains.ds.Medium','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (76,'LOW','sbidomains.nm.Low','SEVERITY','Severity Level','sbidomains.ds.Low','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (77,'CSP','sbidomains.nm.CSP','RESOURCE','Resource type','sbidomains.ds.CSP','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (78,'PROCESS','sbidomains.nm.Process','RESOURCE','Resource type','sbidomains.ds.Process','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (79,'PROJECT','sbidomains.nm.Project','RESOURCE','Resource type','sbidomains.ds.Project','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (80,'SERVICE','sbidomains.nm.Service','RESOURCE','Resource type','sbidomains.ds.Service','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (81,'Meter','sbidomains.nm.Meter','KPI_CHART','Kpi Chart type','sbidomains.ds.Meter','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (82,'SimpleDial','sbidomains.nm.SimpleDial','KPI_CHART','Kpi Chart type','sbidomains.ds.SimpleDial','server',NULL,NULL,'2013-11-17 11:18:01',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (83,'Speedometer','sbidomains.nm.Speedometer','KPI_CHART','Kpi Chart type','sbidomains.ds.Speedometer','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (84,'Thermometer','sbidomains.nm.Thermometer','KPI_CHART','Kpi Chart type','sbidomains.ds.Thermometer','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (85,'BulletGraph','sbidomains.nm.BulletGraph','KPI_CHART','Kpi Chart type','sbidomains.ds.BulletGraph','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (86,'MAIL','sbidomains.nm.Mail','ALARM_MODALITY','Alarm Modality','sbidomains.ds.Mail','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (87,'SMS','sbidomains.nm.SMS','ALARM_MODALITY','Alarm Modality','sbidomains.ds.SMS','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (88,'GENERIC_ROOT','sbidomains.nm.Generic_root','MODEL_ROOT','Model root type','sbidomains.ds.Generic_root','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (89,'GENERIC_NODE','sbidomains.nm.Generic_Node','MODEL_NODE','Model node type','sbidomains.ds.Generic_Node','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (90,'PIVOT_TRANSFOMER','sbidomains.nm.pivot_transformer','TRANSFORMER_TYPE','Transformer types','sbidomains.ds.pivot_transformer','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (91,'PDF','PDF','EXPORT_TYPE','Exporters type','Export type','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (92,'XLS','XLS','EXPORT_TYPE','Exporters type','Export type','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (93,'CSV','CSV','EXPORT_TYPE','Exporters type','Export type','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (94,'XML','XML','EXPORT_TYPE','Exporters type','Export type','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (95,'TXT','TXT','EXPORT_TYPE','Exporters type','Export type','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (96,'JPG','JPG','EXPORT_TYPE','Exporters type','Export type','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (97,'PPT','PPT','EXPORT_TYPE','Exporters type','Export type','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (98,'RTF','RTF','EXPORT_TYPE','Exporters type','Export type','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (99,'JRXML','JRXML','EXPORT_TYPE','Exporters type','Export type','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (100,'XLSX','XLSX','EXPORT_TYPE','Exporters type','Export type','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (101,'Basic','Basic','KPI_TYPE','Kpi Type','','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (102,'Derived','Derived','KPI_TYPE','Kpi Type','','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (103,'Nominal scale','Nominal scale','METRIC_SCALE_TYPE','Metric Scale Type','','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (104,'Ordinal scale','Ordinal scale','METRIC_SCALE_TYPE','Metric Scale Type','','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (105,'Intervals scale','Intervals scale','METRIC_SCALE_TYPE','Metric Scale Type','','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (106,'Ratio scale','Ratio scale','METRIC_SCALE_TYPE','Metric Scale Type','','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (107,'Absolute scale','Absolute scale','METRIC_SCALE_TYPE','Metric Scale Type','','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (108,'Day scale','Day scale','METRIC_SCALE_TYPE','Metric Scale Type','','server',NULL,NULL,'2013-11-17 11:18:02',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (109,'COUNT','Count','MEASURE_TYPE','Measure Type','','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (110,'TIME','Time','MEASURE_TYPE','Measure Type','','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (111,'SIZE','Size','MEASURE_TYPE','Measure Type','','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (112,'org.hibernate.dialect.DB2400Dialect','sbidomains.nm.db2','DIALECT_HIB','Predefined hibernate dialect','sbidomains.ds.db2','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (113,'LONG_TEXT','LONG_TEXT','OBJMETA_DATA_TYPE','Predefined data type for metadata','Predefined data type LONG TEXT for metadata','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (114,'SHORT_TEXT','SHORT_TEXT','OBJMETA_DATA_TYPE','Predefined data type for metadata','Predefined data type SHORT TEXT for metadata','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (115,'ACCESSIBLE_HTML','Accessible Html','BIOBJ_TYPE','BI Object types','Accessible HTML','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (116,'Boolean','Udp Boolean Type','UDP_TYPE','Udp type','Predefined udp type','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (117,'Text','Udp Text Type','UDP_TYPE','Udp type','Predefined udp type','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (118,'Integer','Udp Integer Type','UDP_TYPE','Udp type','Predefined udp type','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (119,'Model','Model Family','UDP_FAMILY','Udp family','Predefined udp family','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (120,'Kpi','Kpi_Family','UDP_FAMILY','Udp famil','Predefined udp family','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (121,'groovy','Groovy','SCRIPT_TYPE','Script Type','Script Type','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (122,'ECMAScript','Javascript','SCRIPT_TYPE','Script Type','Script Type','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (123,'File','SbiFileDataSet','DATA_SET_TYPE','Data Set Type','SbiFileDataSet','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (124,'Query','SbiQueryDataSet','DATA_SET_TYPE','Data Set Type','SbiQueryDataSet','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (125,'Java Class','SbiJClassDataSet','DATA_SET_TYPE','Data Set Type','SbiJClassDataSet','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (126,'Web Service','SbiWSDataSet','DATA_SET_TYPE','Data Set Type','SbiWSDataSet','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (127,'Script','SbiScriptDataSet','DATA_SET_TYPE','Data Set Type','SbiScriptDataSet','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (128,'Qbe','SbiQbeDataSet','DATA_SET_TYPE','Data Set Type','SbiQbeDataSet','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (129,'Custom','SbiCustomDataSet','DATA_SET_TYPE','Data Set Type','SbiCustomDataSet','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (130,'Cat1','Cat1','CATEGORY_TYPE','Category Type','Cat1','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (131,'Cat2','Cat2','CATEGORY_TYPE','Category Type','Cat2','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (132,'DEVELOPMENT','sbidomains.permissiononfolder.nm.dev','PERMISSION_ON_FOLDER','Permission on folder','sbidomains.permissiononfolder.ds.dev','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (133,'TEST','sbidomains.permissiononfolder.nm.test','PERMISSION_ON_FOLDER','Permission on folder','sbidomains.permissiononfolder.ds.test','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (134,'EXECUTION','sbidomains.permissiononfolder.nm.execute','PERMISSION_ON_FOLDER','Permission on folder','sbidomains.permissiononfolder.ds.execute','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (135,'CREATION','sbidomains.permissiononfolder.nm.create','PERMISSION_ON_FOLDER','Permission on folder','sbidomains.permissiononfolder.ds.create','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (136,'ITA','Italian','LANG','Language ISO code','Italian','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (137,'SPA','Spanish','LANG','Language ISO code','Spanish','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (138,'ENG','English','LANG','Language ISO code','English','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (139,'FRA','French','LANG','Language ISO code','French','server',NULL,NULL,'2013-11-17 11:18:03',NULL,NULL,'4.0',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sbi_domains` ENABLE KEYS */;


--
-- Definition of table `sbi_dossier_bin_temp`
--

DROP TABLE IF EXISTS `sbi_dossier_bin_temp`;
CREATE TABLE `sbi_dossier_bin_temp` (
  `BIN_ID` int(11) NOT NULL,
  `PART_ID` int(11) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `BIN_CONTENT` mediumblob NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `CREATION_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BIN_ID`),
  KEY `FK_SBI_DOSSIER_BIN_TEMP_1` (`PART_ID`),
  CONSTRAINT `FK_SBI_DOSSIER_BIN_TEMP_1` FOREIGN KEY (`PART_ID`) REFERENCES `sbi_dossier_temp` (`PART_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_dossier_bin_temp`
--

/*!40000 ALTER TABLE `sbi_dossier_bin_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_dossier_bin_temp` ENABLE KEYS */;


--
-- Definition of table `sbi_dossier_pres`
--

DROP TABLE IF EXISTS `sbi_dossier_pres`;
CREATE TABLE `sbi_dossier_pres` (
  `PRESENTATION_ID` int(11) NOT NULL,
  `WORKFLOW_PROCESS_ID` bigint(20) NOT NULL,
  `BIOBJ_ID` int(11) NOT NULL,
  `BIN_ID` int(11) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `PROG` int(11) DEFAULT NULL,
  `CREATION_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `APPROVED` smallint(6) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PRESENTATION_ID`),
  KEY `FK_SBI_DOSSIER_PRES_1` (`BIN_ID`),
  KEY `FK_SBI_DOSSIER_PRES_2` (`BIOBJ_ID`),
  CONSTRAINT `FK_SBI_DOSSIER_PRES_1` FOREIGN KEY (`BIN_ID`) REFERENCES `sbi_binary_contents` (`BIN_ID`),
  CONSTRAINT `FK_SBI_DOSSIER_PRES_2` FOREIGN KEY (`BIOBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_dossier_pres`
--

/*!40000 ALTER TABLE `sbi_dossier_pres` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_dossier_pres` ENABLE KEYS */;


--
-- Definition of table `sbi_dossier_temp`
--

DROP TABLE IF EXISTS `sbi_dossier_temp`;
CREATE TABLE `sbi_dossier_temp` (
  `PART_ID` int(11) NOT NULL,
  `WORKFLOW_PROCESS_ID` bigint(20) NOT NULL,
  `BIOBJ_ID` int(11) NOT NULL,
  `PAGE_ID` int(11) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PART_ID`),
  KEY `FK_SBI_DOSSIER_TEMP_1` (`BIOBJ_ID`),
  CONSTRAINT `FK_SBI_DOSSIER_TEMP_1` FOREIGN KEY (`BIOBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_dossier_temp`
--

/*!40000 ALTER TABLE `sbi_dossier_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_dossier_temp` ENABLE KEYS */;


--
-- Definition of table `sbi_engines`
--

DROP TABLE IF EXISTS `sbi_engines`;
CREATE TABLE `sbi_engines` (
  `ENGINE_ID` int(11) NOT NULL,
  `ENCRYPT` smallint(6) DEFAULT NULL,
  `NAME` varchar(40) NOT NULL,
  `DESCR` varchar(160) DEFAULT NULL,
  `MAIN_URL` varchar(400) DEFAULT NULL,
  `SECN_URL` varchar(400) DEFAULT NULL,
  `OBJ_UPL_DIR` varchar(400) DEFAULT NULL,
  `OBJ_USE_DIR` varchar(400) DEFAULT NULL,
  `DRIVER_NM` varchar(400) DEFAULT NULL,
  `LABEL` varchar(40) NOT NULL,
  `ENGINE_TYPE` int(11) NOT NULL,
  `CLASS_NM` varchar(400) DEFAULT NULL,
  `BIOBJ_TYPE` int(11) NOT NULL,
  `DEFAULT_DS_ID` int(11) DEFAULT NULL,
  `USE_DATASET` tinyint(1) DEFAULT '0',
  `USE_DATASOURCE` tinyint(1) DEFAULT '0',
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ENGINE_ID`),
  UNIQUE KEY `XAK1SBI_ENGINES` (`LABEL`,`ORGANIZATION`),
  KEY `FK_SBI_ENGINES_1` (`BIOBJ_TYPE`),
  KEY `FK_SBI_ENGINES_2` (`ENGINE_TYPE`),
  KEY `FK_SBI_ENGINE_3` (`DEFAULT_DS_ID`),
  CONSTRAINT `FK_SBI_ENGINES_1` FOREIGN KEY (`BIOBJ_TYPE`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_ENGINES_2` FOREIGN KEY (`ENGINE_TYPE`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_ENGINE_3` FOREIGN KEY (`DEFAULT_DS_ID`) REFERENCES `sbi_data_source` (`DS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_engines`
--

/*!40000 ALTER TABLE `sbi_engines` DISABLE KEYS */;
INSERT INTO `sbi_engines` (`ENGINE_ID`,`ENCRYPT`,`NAME`,`DESCR`,`MAIN_URL`,`SECN_URL`,`OBJ_UPL_DIR`,`OBJ_USE_DIR`,`DRIVER_NM`,`LABEL`,`ENGINE_TYPE`,`CLASS_NM`,`BIOBJ_TYPE`,`DEFAULT_DS_ID`,`USE_DATASET`,`USE_DATASOURCE`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,0,'Dashboard Engine','Dashboard Engine','',NULL,NULL,NULL,'','SpagoBIDashboardEng',55,'it.eng.spagobi.engines.dashboard.SpagoBIDashboardInternalEngine',9,NULL,1,0,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,0,'JFreeChart Engine','JFree Chart Engine','',NULL,NULL,NULL,'','SpagoBIJFreeChartEng',55,'it.eng.spagobi.engines.chart.SpagoBIChartInternalEngine',9,NULL,1,0,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,0,'Dossier Engine','Dossier Engine','',NULL,NULL,NULL,'','SpagoBIDossierEngine',55,'it.eng.spagobi.engines.dossier.SpagoBIDossierInternalEngine',12,NULL,0,0,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,0,'Office Document Engine','Office Document Engine','',NULL,NULL,NULL,'','SpagoBIOfficeEngine',55,'it.eng.spagobi.engines.officedocument.SpagoBIOfficeDocumentInternalEngine',13,NULL,0,0,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,0,'Document Composition Engine','Document Composition Engine','',NULL,NULL,NULL,'','SpagoBICompositeDocE',55,'it.eng.spagobi.engines.documentcomposition.SpagoBIDocumentCompositionInternalEngine',15,NULL,0,0,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,0,'Kpi Engine','Kpi Engine','',NULL,NULL,NULL,'','SpagoBIKpiEngine',55,'it.eng.spagobi.engines.kpi.SpagoBIKpiInternalEngine',16,NULL,0,0,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,0,'Birt Report Engine','Birt Report Engine','/SpagoBIBirtReportEngine/BirtReportServlet',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.birt.BirtReportDriver','SpagoBIBirtReportEng',54,'',6,NULL,0,1,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,0,'Geo Engine','Geo Engine','/SpagoBIGeoEngine/servlet/AdapterHTTP',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.geo.GeoDriver','SpagoBIGeoEngine',54,'',11,NULL,1,1,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,0,'JPivot Engine','JPivot Mondrian Engine','/SpagoBIJPivotEngine/JPivotServlet',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.jpivot.JPivotDriver','SpagoBIJPivotEngine',54,'',7,NULL,0,1,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,0,'Jasper Report Engine','Jasper Report Engine','/SpagoBIJasperReportEngine/JasperReportServlet',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.jasperreport.JasperReportDriver','SpagoBIJasperReportE',54,'',6,NULL,0,1,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (11,0,'Qbe Engine','Qbe Engine','/SpagoBIQbeEngine/servlet/AdapterHTTP',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.qbe.QbeDriver','SpagoBIQbeEngine',54,'',10,NULL,0,1,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (12,0,'Talend Engine','Talend Engine','/SpagoBITalendEngine/JobRunService',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.talend.TalendDriver','SpagoBITalendEngine',54,'',14,NULL,0,1,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (13,0,'Weka Engine','Weka Engine','/SpagoBIWekaEngine/WekaServlet',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.weka.WekaDriver','SpagoBIWekaEngine',54,'',8,NULL,0,1,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (14,0,'Accessible Report Engine','Accessible Report Engine','/SpagoBIAccessibilityEngine/servlet/AccessibilityServlet',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.accessibility.AccessibilityDriver','SpagoBIAccessibleRep',54,'',115,NULL,1,1,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (15,0,'Process Engine','Process Engine','/SpagoBICommonJEngine/servlet/AdapterHTTP',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.commonj.CommonjDriver','SpagoBIProcessEngine',54,'',14,NULL,0,0,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (16,0,'Smart Filter Engine',' Smart Filter Engine','/SpagoBIQbeEngine/servlet/AdapterHTTP',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.smartfilter.SmartFilterDriver','SpagoBISmartFilterEn',54,'',17,NULL,0,1,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (17,0,'Gis Engine','Gis Engine','/SpagoBIGeoReportEngine/GeoReportEngineStartAction',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.generic.GenericDriver','SpagoBIGisEngine',54,'',11,NULL,1,1,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (18,0,'Console Engine','Console Engine','/SpagoBIConsoleEngine/servlet/AdapterHTTP',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.console.ConsoleDriver','SpagoBIConsoleEngine',54,'',18,NULL,1,1,'server',NULL,NULL,'2013-11-17 11:18:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (19,0,'Worksheet Engine','Worksheet Engine','/SpagoBIQbeEngine/servlet/AdapterHTTP',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.worksheet.WorksheetDriver','SpagoBIWorksheetEng',54,'',19,NULL,1,1,'server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (20,0,'JSChart Engine','JSChart Engine','/SpagoBIChartEngine/servlet/AdapterHTTP',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.chart.ChartDriver','SpagoBIJSChartEngine',54,'',20,NULL,1,0,'server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (21,0,'JPalo Engine','JPalo Engine','/SpagoBIJPaloEngine/com.tensegrity.wpalo.SpagoBIJPaloEngine/JPaloEngineStartServlet',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.jpalo.JPaloDriver','SpagoBIJPaloEngine',54,'',7,NULL,0,0,'server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (22,0,'Mobile Report Engine','Report engine for mobile devices','/SpagoBIMobileEngine/servlet/AdapterHTTP?ACTION_NAME=MOBILE_ENGINE_START_ACTION',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.mobile.report.MobileReportDriver','SpagoBITableMobileEn',54,'',21,NULL,1,1,'server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (23,0,'Mobile Chart Engine','Chart engine for mobile devices','/SpagoBIMobileEngine/servlet/AdapterHTTP?ACTION_NAME=MOBILE_ENGINE_START_ACTION',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.mobile.chart.MobileChartDriver','SpagoBIChartMobileEn',54,'',22,NULL,1,1,'server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (24,0,'Mobile Cockpit Engine','Cockpit engine for mobile devices','/SpagoBIMobileEngine/servlet/AdapterHTTP?ACTION_NAME=MOBILE_ENGINE_START_ACTION',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.mobile.cockpit.MobileCockpitDriver','SpagoBICockpitMobile',54,'',23,NULL,0,0,'server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (25,0,'Network Analysis Engine','Network Analysis Engine','/SpagoBINetworkEngine/servlet/AdapterHTTP?ACTION_NAME=NETWORK_ENGINE_START_ACTION',NULL,NULL,NULL,'it.eng.spagobi.engines.drivers.network.NetworkDriver','SpagoBINetworkEngine',54,'',24,NULL,1,0,'server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_engines` ENABLE KEYS */;


--
-- Definition of table `sbi_events`
--

DROP TABLE IF EXISTS `sbi_events`;
CREATE TABLE `sbi_events` (
  `ID` int(11) NOT NULL,
  `USER_EVENT` varchar(40) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_events`
--

/*!40000 ALTER TABLE `sbi_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_events` ENABLE KEYS */;


--
-- Definition of table `sbi_events_log`
--

DROP TABLE IF EXISTS `sbi_events_log`;
CREATE TABLE `sbi_events_log` (
  `ID` int(11) NOT NULL,
  `USER_EVENT` varchar(40) NOT NULL,
  `EVENT_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DESCR` text NOT NULL,
  `PARAMS` varchar(1000) DEFAULT NULL,
  `HANDLER` varchar(400) NOT NULL DEFAULT 'it.eng.spagobi.events.handlers.DefaultEventPresentationHandler',
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_events_log`
--

/*!40000 ALTER TABLE `sbi_events_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_events_log` ENABLE KEYS */;


--
-- Definition of table `sbi_events_roles`
--

DROP TABLE IF EXISTS `sbi_events_roles`;
CREATE TABLE `sbi_events_roles` (
  `EVENT_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  PRIMARY KEY (`EVENT_ID`,`ROLE_ID`),
  KEY `FK_SBI_EVENTS_ROLES_1` (`ROLE_ID`),
  CONSTRAINT `FK_SBI_EVENTS_ROLES_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `sbi_ext_roles` (`EXT_ROLE_ID`),
  CONSTRAINT `FK_SBI_EVENTS_ROLES_2` FOREIGN KEY (`EVENT_ID`) REFERENCES `sbi_events_log` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_events_roles`
--

/*!40000 ALTER TABLE `sbi_events_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_events_roles` ENABLE KEYS */;


--
-- Definition of table `sbi_exporters`
--

DROP TABLE IF EXISTS `sbi_exporters`;
CREATE TABLE `sbi_exporters` (
  `ENGINE_ID` int(11) NOT NULL,
  `DOMAIN_ID` int(11) NOT NULL,
  `DEFAULT_VALUE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ENGINE_ID`,`DOMAIN_ID`),
  UNIQUE KEY `XAK1SBI_EXPORTERS` (`ENGINE_ID`,`DOMAIN_ID`),
  KEY `FK_SBI_EXPORTERS_2` (`DOMAIN_ID`),
  CONSTRAINT `FK_SBI_EXPORTERS_1` FOREIGN KEY (`ENGINE_ID`) REFERENCES `sbi_engines` (`ENGINE_ID`),
  CONSTRAINT `FK_SBI_EXPORTERS_2` FOREIGN KEY (`DOMAIN_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_exporters`
--

/*!40000 ALTER TABLE `sbi_exporters` DISABLE KEYS */;
INSERT INTO `sbi_exporters` (`ENGINE_ID`,`DOMAIN_ID`,`DEFAULT_VALUE`) VALUES 
 (1,91,1),
 (2,91,1),
 (6,91,1),
 (7,91,1),
 (7,92,0),
 (7,93,0),
 (7,96,0),
 (7,98,0),
 (8,91,1),
 (8,96,1),
 (9,91,0),
 (9,92,1),
 (10,91,1),
 (10,92,0),
 (10,96,0),
 (10,98,0),
 (11,91,1),
 (11,92,0),
 (11,93,0),
 (11,98,0),
 (11,99,0),
 (11,100,0),
 (16,91,1),
 (16,92,0),
 (16,93,0),
 (16,98,0),
 (18,91,1),
 (19,91,0),
 (19,92,1),
 (19,100,0),
 (20,91,0),
 (20,96,1);
/*!40000 ALTER TABLE `sbi_exporters` ENABLE KEYS */;


--
-- Definition of table `sbi_ext_roles`
--

DROP TABLE IF EXISTS `sbi_ext_roles`;
CREATE TABLE `sbi_ext_roles` (
  `EXT_ROLE_ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCR` varchar(160) DEFAULT NULL,
  `CODE` varchar(20) DEFAULT NULL,
  `ROLE_TYPE_CD` varchar(20) NOT NULL,
  `ROLE_TYPE_ID` int(11) NOT NULL,
  `SAVE_SUBOBJECTS` tinyint(1) DEFAULT '1',
  `SEE_SUBOBJECTS` tinyint(1) DEFAULT '1',
  `SEE_VIEWPOINTS` tinyint(1) DEFAULT '1',
  `SEE_SNAPSHOTS` tinyint(1) DEFAULT '1',
  `SEE_NOTES` tinyint(1) DEFAULT '1',
  `SEND_MAIL` tinyint(1) DEFAULT '1',
  `SAVE_INTO_FOLDER` tinyint(1) DEFAULT '1',
  `SAVE_REMEMBER_ME` tinyint(1) DEFAULT '1',
  `SEE_METADATA` tinyint(1) DEFAULT '1',
  `SAVE_METADATA` tinyint(1) DEFAULT '1',
  `BUILD_QBE_QUERY` tinyint(1) DEFAULT '1',
  `DO_MASSIVE_EXPORT` tinyint(1) DEFAULT '1',
  `EDIT_WORKSHEET` tinyint(1) DEFAULT '1',
  `MANAGE_USERS` tinyint(1) DEFAULT '0',
  `SEE_DOCUMENT_BROWSER` tinyint(1) DEFAULT '1',
  `SEE_FAVOURITES` tinyint(1) DEFAULT '1',
  `SEE_SUBSCRIPTIONS` tinyint(1) DEFAULT '1',
  `SEE_MY_DATA` tinyint(1) DEFAULT '1',
  `SEE_TODO_LIST` tinyint(1) DEFAULT '1',
  `CREATE_DOCUMENTS` tinyint(1) DEFAULT '1',
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`EXT_ROLE_ID`),
  UNIQUE KEY `XAK1SBI_EXT_ROLES` (`NAME`,`ORGANIZATION`),
  KEY `FK_SBI_EXT_ROLES_1` (`ROLE_TYPE_ID`),
  CONSTRAINT `FK_SBI_EXT_ROLES_1` FOREIGN KEY (`ROLE_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_ext_roles`
--

/*!40000 ALTER TABLE `sbi_ext_roles` DISABLE KEYS */;
INSERT INTO `sbi_ext_roles` (`EXT_ROLE_ID`,`NAME`,`DESCR`,`CODE`,`ROLE_TYPE_CD`,`ROLE_TYPE_ID`,`SAVE_SUBOBJECTS`,`SEE_SUBOBJECTS`,`SEE_VIEWPOINTS`,`SEE_SNAPSHOTS`,`SEE_NOTES`,`SEND_MAIL`,`SAVE_INTO_FOLDER`,`SAVE_REMEMBER_ME`,`SEE_METADATA`,`SAVE_METADATA`,`BUILD_QBE_QUERY`,`DO_MASSIVE_EXPORT`,`EDIT_WORKSHEET`,`MANAGE_USERS`,`SEE_DOCUMENT_BROWSER`,`SEE_FAVOURITES`,`SEE_SUBSCRIPTIONS`,`SEE_MY_DATA`,`SEE_TODO_LIST`,`CREATE_DOCUMENTS`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,'/spagobi/dev','/spagobi/dev',NULL,'DEV_ROLE',33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,'server_init',NULL,NULL,'2013-11-17 11:18:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,'/spagobi/test','/spagobi/test',NULL,'TEST_ROLE',34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,'server_init',NULL,NULL,'2013-11-17 11:18:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,'/spagobi/user','/spagobi/user',NULL,'USER',31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,'server_init',NULL,NULL,'2013-11-17 11:18:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,'/spagobi/userb','/spagobi/userb',NULL,'USER',31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,'server_init',NULL,NULL,'2013-11-17 11:18:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,'/spagobi/admin','/spagobi/admin',NULL,'ADMIN',32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,'server_init',NULL,NULL,'2013-11-17 11:18:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,'/spagobi/modeladmin','/spagobi/modeladmin',NULL,'MODEL_ADMIN',35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,'server_init',NULL,NULL,'2013-11-17 11:18:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,'/spagobi/op_reva','/spagobi/op_reva',NULL,'USER',31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,'server_init',NULL,NULL,'2013-11-17 11:18:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,'/spagobi/an_reva','/spagobi/an_reva',NULL,'USER',31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,'server_init',NULL,NULL,'2013-11-17 11:18:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,'/spagobi/bam','/spagobi/bam',NULL,'USER',31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,'server_init',NULL,NULL,'2013-11-17 11:18:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,'/spagobi/user/demo','/spagobi/user/demo',NULL,'USER',31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,'server_init',NULL,NULL,'2013-11-17 11:18:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_ext_roles` ENABLE KEYS */;


--
-- Definition of table `sbi_ext_roles_category`
--

DROP TABLE IF EXISTS `sbi_ext_roles_category`;
CREATE TABLE `sbi_ext_roles_category` (
  `EXT_ROLE_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`EXT_ROLE_ID`,`CATEGORY_ID`),
  KEY `FK_SB_EXT_ROLES_META_MODEL_CATEGORY_2` (`CATEGORY_ID`),
  CONSTRAINT `FK_SB_EXT_ROLES_META_MODEL_CATEGORY_1` FOREIGN KEY (`EXT_ROLE_ID`) REFERENCES `sbi_ext_roles` (`EXT_ROLE_ID`),
  CONSTRAINT `FK_SB_EXT_ROLES_META_MODEL_CATEGORY_2` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_ext_roles_category`
--

/*!40000 ALTER TABLE `sbi_ext_roles_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_ext_roles_category` ENABLE KEYS */;


--
-- Definition of table `sbi_ext_user_roles`
--

DROP TABLE IF EXISTS `sbi_ext_user_roles`;
CREATE TABLE `sbi_ext_user_roles` (
  `ID` int(11) NOT NULL,
  `EXT_ROLE_ID` int(11) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`,`EXT_ROLE_ID`),
  KEY `FK_SBI_EXT_USER_ROLES_2` (`EXT_ROLE_ID`),
  CONSTRAINT `FK_SBI_EXT_USER_ROLES_1` FOREIGN KEY (`ID`) REFERENCES `sbi_user` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SBI_EXT_USER_ROLES_2` FOREIGN KEY (`EXT_ROLE_ID`) REFERENCES `sbi_ext_roles` (`EXT_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_ext_user_roles`
--

/*!40000 ALTER TABLE `sbi_ext_user_roles` DISABLE KEYS */;
INSERT INTO `sbi_ext_user_roles` (`ID`,`EXT_ROLE_ID`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,5,'server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (2,3,'server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (3,10,'server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (4,2,'server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (5,1,'server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (6,9,'server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (7,3,'biadmin',NULL,NULL,'2013-11-18 21:52:43',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_ext_user_roles` ENABLE KEYS */;


--
-- Definition of table `sbi_func_role`
--

DROP TABLE IF EXISTS `sbi_func_role`;
CREATE TABLE `sbi_func_role` (
  `ROLE_ID` int(11) NOT NULL,
  `FUNCT_ID` int(11) NOT NULL,
  `STATE_CD` varchar(20) DEFAULT NULL,
  `STATE_ID` int(11) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`FUNCT_ID`,`STATE_ID`,`ROLE_ID`),
  KEY `FK_SBI_FUNC_ROLE_1` (`ROLE_ID`),
  KEY `FK_SBI_FUNC_ROLE_2` (`STATE_ID`),
  CONSTRAINT `FK_SBI_FUNC_ROLE_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `sbi_ext_roles` (`EXT_ROLE_ID`),
  CONSTRAINT `FK_SBI_FUNC_ROLE_2` FOREIGN KEY (`STATE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_FUNC_ROLE_3` FOREIGN KEY (`FUNCT_ID`) REFERENCES `sbi_functions` (`FUNCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_func_role`
--

/*!40000 ALTER TABLE `sbi_func_role` DISABLE KEYS */;
INSERT INTO `sbi_func_role` (`ROLE_ID`,`FUNCT_ID`,`STATE_CD`,`STATE_ID`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,2,'DEVELOPMENT',132,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (2,2,'DEVELOPMENT',132,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,2,'DEVELOPMENT',132,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (4,2,'DEVELOPMENT',132,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (5,2,'DEVELOPMENT',132,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (6,2,'DEVELOPMENT',132,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (7,2,'DEVELOPMENT',132,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (8,2,'DEVELOPMENT',132,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (9,2,'DEVELOPMENT',132,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (10,2,'DEVELOPMENT',132,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (1,2,'TEST',133,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (2,2,'TEST',133,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,2,'TEST',133,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (4,2,'TEST',133,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (5,2,'TEST',133,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (6,2,'TEST',133,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (7,2,'TEST',133,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (8,2,'TEST',133,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (9,2,'TEST',133,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (10,2,'TEST',133,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (1,2,'EXECUTION',134,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (2,2,'EXECUTION',134,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,2,'EXECUTION',134,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (4,2,'EXECUTION',134,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (5,2,'EXECUTION',134,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (6,2,'EXECUTION',134,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (7,2,'EXECUTION',134,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (8,2,'EXECUTION',134,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (9,2,'EXECUTION',134,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (10,2,'EXECUTION',134,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (1,2,'CREATION',135,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (2,2,'CREATION',135,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,2,'CREATION',135,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (4,2,'CREATION',135,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (5,2,'CREATION',135,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (6,2,'CREATION',135,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (7,2,'CREATION',135,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (8,2,'CREATION',135,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (9,2,'CREATION',135,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (10,2,'CREATION',135,'server','server',NULL,'2013-11-18 21:54:56','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,3,'DEVELOPMENT',132,'server','server',NULL,'2013-11-20 19:12:46','2013-11-20 19:12:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (5,3,'DEVELOPMENT',132,'server','server',NULL,'2013-11-20 19:12:46','2013-11-20 19:12:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (8,3,'DEVELOPMENT',132,'server','server',NULL,'2013-11-20 19:12:46','2013-11-20 19:12:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,3,'TEST',133,'server','server',NULL,'2013-11-20 19:12:46','2013-11-20 19:12:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (5,3,'TEST',133,'server','server',NULL,'2013-11-20 19:12:46','2013-11-20 19:12:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (8,3,'TEST',133,'server','server',NULL,'2013-11-20 19:12:46','2013-11-20 19:12:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,3,'EXECUTION',134,'server','server',NULL,'2013-11-20 19:12:46','2013-11-20 19:12:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (5,3,'EXECUTION',134,'server','server',NULL,'2013-11-20 19:12:46','2013-11-20 19:12:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (8,3,'EXECUTION',134,'server','server',NULL,'2013-11-20 19:12:46','2013-11-20 19:12:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,3,'CREATION',135,'server','server',NULL,'2013-11-20 19:12:46','2013-11-20 19:12:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (5,3,'CREATION',135,'server','server',NULL,'2013-11-20 19:12:46','2013-11-20 19:12:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (8,3,'CREATION',135,'server','server',NULL,'2013-11-20 19:12:46','2013-11-20 19:12:46',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_func_role` ENABLE KEYS */;


--
-- Definition of table `sbi_functions`
--

DROP TABLE IF EXISTS `sbi_functions`;
CREATE TABLE `sbi_functions` (
  `FUNCT_ID` int(11) NOT NULL,
  `FUNCT_TYPE_CD` varchar(20) NOT NULL,
  `PARENT_FUNCT_ID` int(11) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `DESCR` varchar(160) DEFAULT NULL,
  `PATH` varchar(400) DEFAULT NULL,
  `CODE` varchar(40) NOT NULL,
  `PROG` int(11) NOT NULL,
  `FUNCT_TYPE_ID` int(11) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`FUNCT_ID`),
  UNIQUE KEY `XAK1SBI_FUNCTIONS` (`CODE`,`ORGANIZATION`),
  KEY `FK_SBI_FUNCTIONS_1` (`FUNCT_TYPE_ID`),
  KEY `FK_SBI_FUNCTIONS_2` (`PARENT_FUNCT_ID`),
  CONSTRAINT `FK_SBI_FUNCTIONS_1` FOREIGN KEY (`FUNCT_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_FUNCTIONS_2` FOREIGN KEY (`PARENT_FUNCT_ID`) REFERENCES `sbi_functions` (`FUNCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_functions`
--

/*!40000 ALTER TABLE `sbi_functions` DISABLE KEYS */;
INSERT INTO `sbi_functions` (`FUNCT_ID`,`FUNCT_TYPE_CD`,`PARENT_FUNCT_ID`,`NAME`,`DESCR`,`PATH`,`CODE`,`PROG`,`FUNCT_TYPE_ID`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,'LOW_FUNCT',NULL,'Functionalities','Functionalities','/Functionalities','Functionalities',1,37,'server',NULL,NULL,'2013-11-17 11:18:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,'LOW_FUNCT',1,'CompositeDoc','CompositeDoc','/Functionalities/CompositeDoc','CompositeDoc',1,37,'server','server',NULL,'2013-11-18 19:11:31','2013-11-18 21:54:56',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,'LOW_FUNCT',1,'Solar','','/Functionalities/Solar','Solar',2,37,'server',NULL,NULL,'2013-11-20 19:12:46',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_functions` ENABLE KEYS */;


--
-- Definition of table `sbi_geo_features`
--

DROP TABLE IF EXISTS `sbi_geo_features`;
CREATE TABLE `sbi_geo_features` (
  `FEATURE_ID` int(11) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `DESCR` varchar(160) DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`FEATURE_ID`),
  UNIQUE KEY `XAK1SBI_GEO_FEATURES` (`NAME`,`ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_geo_features`
--

/*!40000 ALTER TABLE `sbi_geo_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_geo_features` ENABLE KEYS */;


--
-- Definition of table `sbi_geo_map_features`
--

DROP TABLE IF EXISTS `sbi_geo_map_features`;
CREATE TABLE `sbi_geo_map_features` (
  `MAP_ID` int(11) NOT NULL,
  `FEATURE_ID` int(11) NOT NULL,
  `SVG_GROUP` varchar(40) DEFAULT NULL,
  `VISIBLE_FLAG` varchar(1) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MAP_ID`,`FEATURE_ID`),
  KEY `FK_GEO_MAP_FEATURES2` (`FEATURE_ID`),
  CONSTRAINT `FK_GEO_MAP_FEATURES1` FOREIGN KEY (`MAP_ID`) REFERENCES `sbi_geo_maps` (`MAP_ID`),
  CONSTRAINT `FK_GEO_MAP_FEATURES2` FOREIGN KEY (`FEATURE_ID`) REFERENCES `sbi_geo_features` (`FEATURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_geo_map_features`
--

/*!40000 ALTER TABLE `sbi_geo_map_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_geo_map_features` ENABLE KEYS */;


--
-- Definition of table `sbi_geo_maps`
--

DROP TABLE IF EXISTS `sbi_geo_maps`;
CREATE TABLE `sbi_geo_maps` (
  `MAP_ID` int(11) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `DESCR` varchar(160) DEFAULT NULL,
  `URL` varchar(400) DEFAULT NULL,
  `FORMAT` varchar(40) DEFAULT NULL,
  `BIN_ID` int(11) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MAP_ID`),
  UNIQUE KEY `XAK1SBI_GEO_MAPS` (`NAME`,`ORGANIZATION`),
  KEY `FK_SBI_GEO_MAPS_1` (`BIN_ID`),
  CONSTRAINT `FK_SBI_GEO_MAPS_1` FOREIGN KEY (`BIN_ID`) REFERENCES `sbi_binary_contents` (`BIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_geo_maps`
--

/*!40000 ALTER TABLE `sbi_geo_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_geo_maps` ENABLE KEYS */;


--
-- Definition of table `sbi_goal`
--

DROP TABLE IF EXISTS `sbi_goal`;
CREATE TABLE `sbi_goal` (
  `GOAL_ID` int(11) NOT NULL,
  `GRANT_ID` int(11) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `LABEL` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`GOAL_ID`),
  UNIQUE KEY `XIF1SBI_SBI_GOAL` (`NAME`,`ORGANIZATION`),
  KEY `FK_GRANT_ID_GRANT` (`GRANT_ID`),
  CONSTRAINT `FK_GRANT_ID_GRANT` FOREIGN KEY (`GRANT_ID`) REFERENCES `sbi_org_unit_grant` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_goal`
--

/*!40000 ALTER TABLE `sbi_goal` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_goal` ENABLE KEYS */;


--
-- Definition of table `sbi_goal_hierarchy`
--

DROP TABLE IF EXISTS `sbi_goal_hierarchy`;
CREATE TABLE `sbi_goal_hierarchy` (
  `GOAL_HIERARCHY_ID` int(11) NOT NULL,
  `ORG_UNIT_ID` int(11) NOT NULL,
  `GOAL_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) NOT NULL,
  `LABEL` varchar(50) DEFAULT NULL,
  `GOAL` varchar(1000) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`GOAL_HIERARCHY_ID`),
  UNIQUE KEY `XIF1SBI_SBI_GOAL_HIERARCHY` (`LABEL`,`ORGANIZATION`),
  KEY `FK_SBI_GOAL_HIERARCHY_GOAL` (`GOAL_ID`),
  KEY `FK_SBI_GOAL_HIERARCHY_PARENT` (`PARENT_ID`),
  CONSTRAINT `FK_SBI_GOAL_HIERARCHY_GOAL` FOREIGN KEY (`GOAL_ID`) REFERENCES `sbi_goal` (`GOAL_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SBI_GOAL_HIERARCHY_PARENT` FOREIGN KEY (`PARENT_ID`) REFERENCES `sbi_goal_hierarchy` (`GOAL_HIERARCHY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_goal_hierarchy`
--

/*!40000 ALTER TABLE `sbi_goal_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_goal_hierarchy` ENABLE KEYS */;


--
-- Definition of table `sbi_goal_kpi`
--

DROP TABLE IF EXISTS `sbi_goal_kpi`;
CREATE TABLE `sbi_goal_kpi` (
  `GOAL_KPI_ID` int(11) NOT NULL,
  `KPI_INSTANCE_ID` int(11) NOT NULL,
  `GOAL_HIERARCHY_ID` int(11) NOT NULL,
  `WEIGHT1` double DEFAULT NULL,
  `WEIGHT2` double DEFAULT NULL,
  `THRESHOLD1` double DEFAULT NULL,
  `THRESHOLD2` double DEFAULT NULL,
  `THRESHOLD1SIGN` int(11) DEFAULT NULL,
  `THRESHOLD2SIGN` int(11) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`GOAL_KPI_ID`),
  KEY `FK_SBI_GOAL_KPI_GOAL` (`GOAL_HIERARCHY_ID`),
  KEY `FK_SBI_GOAL_KPI_KPI` (`KPI_INSTANCE_ID`),
  CONSTRAINT `FK_SBI_GOAL_KPI_GOAL` FOREIGN KEY (`GOAL_HIERARCHY_ID`) REFERENCES `sbi_goal_hierarchy` (`GOAL_HIERARCHY_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SBI_GOAL_KPI_KPI` FOREIGN KEY (`KPI_INSTANCE_ID`) REFERENCES `sbi_kpi_model_inst` (`KPI_MODEL_INST`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_goal_kpi`
--

/*!40000 ALTER TABLE `sbi_goal_kpi` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_goal_kpi` ENABLE KEYS */;


--
-- Definition of table `sbi_i18n_messages`
--

DROP TABLE IF EXISTS `sbi_i18n_messages`;
CREATE TABLE `sbi_i18n_messages` (
  `LANGUAGE_CD` int(11) NOT NULL,
  `LABEL` varchar(200) NOT NULL,
  `MESSAGE` text,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`LANGUAGE_CD`,`LABEL`,`ORGANIZATION`),
  CONSTRAINT `FK_SBI_I18N_MESSAGES` FOREIGN KEY (`LANGUAGE_CD`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_i18n_messages`
--

/*!40000 ALTER TABLE `sbi_i18n_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_i18n_messages` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi`
--

DROP TABLE IF EXISTS `sbi_kpi`;
CREATE TABLE `sbi_kpi` (
  `KPI_ID` int(11) NOT NULL,
  `ID_MEASURE_UNIT` int(11) DEFAULT NULL,
  `DS_ID` int(11) DEFAULT NULL,
  `THRESHOLD_ID` int(11) DEFAULT NULL,
  `ID_KPI_PARENT` int(11) DEFAULT NULL,
  `NAME` varchar(400) NOT NULL,
  `CODE` varchar(40) DEFAULT NULL,
  `METRIC` varchar(1000) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `WEIGHT` double DEFAULT NULL,
  `IS_ADDITIVE` char(1) DEFAULT NULL,
  `FLG_IS_FATHER` char(1) DEFAULT NULL,
  `KPI_TYPE` int(11) DEFAULT NULL,
  `METRIC_SCALE_TYPE` int(11) DEFAULT NULL,
  `MEASURE_TYPE` int(11) DEFAULT NULL,
  `INTERPRETATION` varchar(1000) DEFAULT NULL,
  `INPUT_ATTRIBUTES` varchar(1000) DEFAULT NULL,
  `MODEL_REFERENCE` varchar(255) DEFAULT NULL,
  `TARGET_AUDIENCE` varchar(1000) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`KPI_ID`),
  UNIQUE KEY `XAK1SBI_KPI` (`CODE`,`ORGANIZATION`),
  KEY `FK_SBI_KPI_1` (`ID_MEASURE_UNIT`),
  KEY `FK_SBI_KPI_2` (`THRESHOLD_ID`),
  KEY `FK_SBI_KPI_3` (`ID_KPI_PARENT`),
  KEY `FK_SBI_KPI_4` (`KPI_TYPE`),
  KEY `FK_SBI_KPI_5` (`METRIC_SCALE_TYPE`),
  KEY `FK_SBI_KPI_6` (`MEASURE_TYPE`),
  CONSTRAINT `FK_SBI_KPI_1` FOREIGN KEY (`ID_MEASURE_UNIT`) REFERENCES `sbi_measure_unit` (`ID_MEASURE_UNIT`),
  CONSTRAINT `FK_SBI_KPI_2` FOREIGN KEY (`THRESHOLD_ID`) REFERENCES `sbi_threshold` (`THRESHOLD_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SBI_KPI_3` FOREIGN KEY (`ID_KPI_PARENT`) REFERENCES `sbi_kpi` (`KPI_ID`),
  CONSTRAINT `FK_SBI_KPI_4` FOREIGN KEY (`KPI_TYPE`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_KPI_5` FOREIGN KEY (`METRIC_SCALE_TYPE`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_KPI_6` FOREIGN KEY (`MEASURE_TYPE`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi`
--

/*!40000 ALTER TABLE `sbi_kpi` DISABLE KEYS */;
INSERT INTO `sbi_kpi` (`KPI_ID`,`ID_MEASURE_UNIT`,`DS_ID`,`THRESHOLD_ID`,`ID_KPI_PARENT`,`NAME`,`CODE`,`METRIC`,`DESCRIPTION`,`WEIGHT`,`IS_ADDITIVE`,`FLG_IS_FATHER`,`KPI_TYPE`,`METRIC_SCALE_TYPE`,`MEASURE_TYPE`,`INTERPRETATION`,`INPUT_ATTRIBUTES`,`MODEL_REFERENCE`,`TARGET_AUDIENCE`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,NULL,2,1,NULL,'solarKpi','solarKpi','','solarKpi',NULL,'F',NULL,NULL,NULL,NULL,'','','','','biadmin',NULL,NULL,'2013-11-18 21:17:19',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_kpi` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi_comments`
--

DROP TABLE IF EXISTS `sbi_kpi_comments`;
CREATE TABLE `sbi_kpi_comments` (
  `KPI_COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `KPI_INST_ID` int(11) DEFAULT NULL,
  `BIN_ID` int(11) DEFAULT NULL,
  `EXEC_REQ` varchar(500) DEFAULT NULL,
  `OWNER` varchar(50) DEFAULT NULL,
  `ISPUBLIC` tinyint(1) DEFAULT NULL,
  `CREATION_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LAST_CHANGE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`KPI_COMMENT_ID`),
  KEY `FK_SBI_KPI_COMMENT_1` (`BIN_ID`),
  KEY `FK_SBI_KPI_COMMENT_2` (`KPI_INST_ID`),
  CONSTRAINT `FK_SBI_KPI_COMMENT_1` FOREIGN KEY (`BIN_ID`) REFERENCES `sbi_binary_contents` (`BIN_ID`),
  CONSTRAINT `FK_SBI_KPI_COMMENT_2` FOREIGN KEY (`KPI_INST_ID`) REFERENCES `sbi_kpi_instance` (`ID_KPI_INSTANCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi_comments`
--

/*!40000 ALTER TABLE `sbi_kpi_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_kpi_comments` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi_documents`
--

DROP TABLE IF EXISTS `sbi_kpi_documents`;
CREATE TABLE `sbi_kpi_documents` (
  `ID_KPI_DOC` int(11) NOT NULL,
  `BIOBJ_ID` int(11) NOT NULL,
  `KPI_ID` int(11) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_KPI_DOC`),
  KEY `FK_SBI_KPI_DOCUMENTS_1` (`BIOBJ_ID`),
  KEY `FK_SBI_KPI_DOCUMENTS_2` (`KPI_ID`),
  CONSTRAINT `FK_SBI_KPI_DOCUMENTS_1` FOREIGN KEY (`BIOBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SBI_KPI_DOCUMENTS_2` FOREIGN KEY (`KPI_ID`) REFERENCES `sbi_kpi` (`KPI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi_documents`
--

/*!40000 ALTER TABLE `sbi_kpi_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_kpi_documents` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi_error`
--

DROP TABLE IF EXISTS `sbi_kpi_error`;
CREATE TABLE `sbi_kpi_error` (
  `KPI_ERROR_ID` int(11) NOT NULL,
  `KPI_MODEL_INST_ID` int(11) NOT NULL,
  `USER_MSG` varchar(1000) DEFAULT NULL,
  `FULL_MSG` text,
  `TS_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LABEL_MOD_INST` varchar(100) DEFAULT NULL,
  `PARAMETERS` varchar(1000) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`KPI_ERROR_ID`),
  KEY `FK_SBI_KPI_ERROR_MODEL_1` (`KPI_MODEL_INST_ID`),
  CONSTRAINT `FK_SBI_KPI_ERROR_MODEL_1` FOREIGN KEY (`KPI_MODEL_INST_ID`) REFERENCES `sbi_kpi_model_inst` (`KPI_MODEL_INST`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi_error`
--

/*!40000 ALTER TABLE `sbi_kpi_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_kpi_error` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi_inst_period`
--

DROP TABLE IF EXISTS `sbi_kpi_inst_period`;
CREATE TABLE `sbi_kpi_inst_period` (
  `KPI_INST_PERIOD_ID` int(11) NOT NULL,
  `KPI_INSTANCE_ID` int(11) NOT NULL,
  `PERIODICITY_ID` int(11) NOT NULL,
  `DEFAULT_VALUE` tinyint(1) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`KPI_INST_PERIOD_ID`),
  KEY `FK_SBI_KPI_INST_PERIOD_1` (`PERIODICITY_ID`),
  KEY `FK_SBI_KPI_INST_PERIOD_2` (`KPI_INSTANCE_ID`),
  CONSTRAINT `FK_SBI_KPI_INST_PERIOD_1` FOREIGN KEY (`PERIODICITY_ID`) REFERENCES `sbi_kpi_periodicity` (`ID_KPI_PERIODICITY`),
  CONSTRAINT `FK_SBI_KPI_INST_PERIOD_2` FOREIGN KEY (`KPI_INSTANCE_ID`) REFERENCES `sbi_kpi_instance` (`ID_KPI_INSTANCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi_inst_period`
--

/*!40000 ALTER TABLE `sbi_kpi_inst_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_kpi_inst_period` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi_instance`
--

DROP TABLE IF EXISTS `sbi_kpi_instance`;
CREATE TABLE `sbi_kpi_instance` (
  `ID_KPI_INSTANCE` int(11) NOT NULL,
  `KPI_ID` int(11) NOT NULL,
  `THRESHOLD_ID` int(11) DEFAULT NULL,
  `CHART_TYPE_ID` int(11) DEFAULT NULL,
  `ID_MEASURE_UNIT` int(11) DEFAULT NULL,
  `WEIGHT` double DEFAULT NULL,
  `TARGET` double DEFAULT NULL,
  `BEGIN_DT` datetime DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_KPI_INSTANCE`),
  KEY `FK_SBI_KPI_INSTANCE_1` (`KPI_ID`),
  KEY `FK_SBI_KPI_INSTANCE_2` (`CHART_TYPE_ID`),
  KEY `FK_SBI_KPI_INSTANCE_3` (`ID_MEASURE_UNIT`),
  KEY `FK_SBI_KPI_INSTANCE_4` (`THRESHOLD_ID`),
  CONSTRAINT `FK_SBI_KPI_INSTANCE_1` FOREIGN KEY (`KPI_ID`) REFERENCES `sbi_kpi` (`KPI_ID`),
  CONSTRAINT `FK_SBI_KPI_INSTANCE_2` FOREIGN KEY (`CHART_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_KPI_INSTANCE_3` FOREIGN KEY (`ID_MEASURE_UNIT`) REFERENCES `sbi_measure_unit` (`ID_MEASURE_UNIT`),
  CONSTRAINT `FK_SBI_KPI_INSTANCE_4` FOREIGN KEY (`THRESHOLD_ID`) REFERENCES `sbi_threshold` (`THRESHOLD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi_instance`
--

/*!40000 ALTER TABLE `sbi_kpi_instance` DISABLE KEYS */;
INSERT INTO `sbi_kpi_instance` (`ID_KPI_INSTANCE`,`KPI_ID`,`THRESHOLD_ID`,`CHART_TYPE_ID`,`ID_MEASURE_UNIT`,`WEIGHT`,`TARGET`,`BEGIN_DT`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,1,1,81,NULL,NULL,NULL,'2013-11-18 21:26:41','server','biadmin',NULL,'2013-11-18 21:26:39','2013-11-18 21:26:41',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_kpi_instance` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi_instance_history`
--

DROP TABLE IF EXISTS `sbi_kpi_instance_history`;
CREATE TABLE `sbi_kpi_instance_history` (
  `ID_KPI_INSTANCE_HISTORY` int(11) NOT NULL,
  `ID_KPI_INSTANCE` int(11) NOT NULL,
  `THRESHOLD_ID` int(11) DEFAULT NULL,
  `CHART_TYPE_ID` int(11) DEFAULT NULL,
  `ID_MEASURE_UNIT` int(11) DEFAULT NULL,
  `WEIGHT` double DEFAULT NULL,
  `TARGET` double DEFAULT NULL,
  `BEGIN_DT` datetime DEFAULT NULL,
  `END_DT` datetime DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_KPI_INSTANCE_HISTORY`),
  KEY `FK_SBI_KPI_INSTANCE_HISTORY_1` (`ID_MEASURE_UNIT`),
  KEY `FK_SBI_KPI_INSTANCE_HISTORY_2` (`THRESHOLD_ID`),
  KEY `FK_SBI_KPI_INSTANCE_HISTORY_3` (`CHART_TYPE_ID`),
  KEY `FK_SBI_KPI_INSTANCE_HISTORY_4` (`ID_KPI_INSTANCE`),
  CONSTRAINT `FK_SBI_KPI_INSTANCE_HISTORY_1` FOREIGN KEY (`ID_MEASURE_UNIT`) REFERENCES `sbi_measure_unit` (`ID_MEASURE_UNIT`),
  CONSTRAINT `FK_SBI_KPI_INSTANCE_HISTORY_2` FOREIGN KEY (`THRESHOLD_ID`) REFERENCES `sbi_threshold` (`THRESHOLD_ID`),
  CONSTRAINT `FK_SBI_KPI_INSTANCE_HISTORY_3` FOREIGN KEY (`CHART_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_KPI_INSTANCE_HISTORY_4` FOREIGN KEY (`ID_KPI_INSTANCE`) REFERENCES `sbi_kpi_instance` (`ID_KPI_INSTANCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi_instance_history`
--

/*!40000 ALTER TABLE `sbi_kpi_instance_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_kpi_instance_history` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi_model`
--

DROP TABLE IF EXISTS `sbi_kpi_model`;
CREATE TABLE `sbi_kpi_model` (
  `KPI_MODEL_ID` int(11) NOT NULL,
  `KPI_ID` int(11) DEFAULT NULL,
  `KPI_MODEL_TYPE_ID` int(11) NOT NULL,
  `KPI_PARENT_MODEL_ID` int(11) DEFAULT NULL,
  `KPI_MODEL_CD` varchar(40) NOT NULL,
  `KPI_MODEL_NM` varchar(400) DEFAULT NULL,
  `KPI_MODEL_DESC` varchar(1000) DEFAULT NULL,
  `KPI_MODEL_LBL` varchar(100) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`KPI_MODEL_ID`),
  UNIQUE KEY `XIF1SBI_KPI_MODEL` (`KPI_MODEL_LBL`,`ORGANIZATION`),
  UNIQUE KEY `UNIQUE_PAR_ID_CD` (`KPI_PARENT_MODEL_ID`,`KPI_MODEL_CD`),
  KEY `FK_SBI_KPI_MODEL_2` (`KPI_MODEL_TYPE_ID`),
  KEY `FK_SBI_KPI_MODEL_3` (`KPI_ID`),
  CONSTRAINT `FK_SBI_KPI_MODEL_1` FOREIGN KEY (`KPI_PARENT_MODEL_ID`) REFERENCES `sbi_kpi_model` (`KPI_MODEL_ID`),
  CONSTRAINT `FK_SBI_KPI_MODEL_2` FOREIGN KEY (`KPI_MODEL_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_KPI_MODEL_3` FOREIGN KEY (`KPI_ID`) REFERENCES `sbi_kpi` (`KPI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi_model`
--

/*!40000 ALTER TABLE `sbi_kpi_model` DISABLE KEYS */;
INSERT INTO `sbi_kpi_model` (`KPI_MODEL_ID`,`KPI_ID`,`KPI_MODEL_TYPE_ID`,`KPI_PARENT_MODEL_ID`,`KPI_MODEL_CD`,`KPI_MODEL_NM`,`KPI_MODEL_DESC`,`KPI_MODEL_LBL`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,NULL,88,NULL,'Solar Energy','Solar Energy','Solar Energy','Solar Energy','biadmin',NULL,NULL,'2013-11-18 21:20:39',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,1,89,1,'SolarEnergy','SolarEnergy','SolarEnergy','SolarEnergy','biadmin',NULL,NULL,'2013-11-18 21:21:48',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_kpi_model` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi_model_inst`
--

DROP TABLE IF EXISTS `sbi_kpi_model_inst`;
CREATE TABLE `sbi_kpi_model_inst` (
  `KPI_MODEL_INST` int(11) NOT NULL,
  `KPI_MODEL_INST_PARENT` int(11) DEFAULT NULL,
  `KPI_MODEL_ID` int(11) DEFAULT NULL,
  `ID_KPI_INSTANCE` int(11) DEFAULT NULL,
  `NAME` varchar(400) DEFAULT NULL,
  `LABEL` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `MODELUUID` varchar(400) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`KPI_MODEL_INST`),
  UNIQUE KEY `XAK2SBI_KPI_MODEL_INST` (`LABEL`,`ORGANIZATION`),
  KEY `FK_SBI_KPI_MODEL_INST_1` (`KPI_MODEL_INST_PARENT`),
  KEY `FK_SBI_KPI_MODEL_INST_2` (`KPI_MODEL_ID`),
  KEY `FK_SBI_KPI_MODEL_INST_3` (`ID_KPI_INSTANCE`),
  CONSTRAINT `FK_SBI_KPI_MODEL_INST_1` FOREIGN KEY (`KPI_MODEL_INST_PARENT`) REFERENCES `sbi_kpi_model_inst` (`KPI_MODEL_INST`),
  CONSTRAINT `FK_SBI_KPI_MODEL_INST_2` FOREIGN KEY (`KPI_MODEL_ID`) REFERENCES `sbi_kpi_model` (`KPI_MODEL_ID`),
  CONSTRAINT `FK_SBI_KPI_MODEL_INST_3` FOREIGN KEY (`ID_KPI_INSTANCE`) REFERENCES `sbi_kpi_instance` (`ID_KPI_INSTANCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi_model_inst`
--

/*!40000 ALTER TABLE `sbi_kpi_model_inst` DISABLE KEYS */;
INSERT INTO `sbi_kpi_model_inst` (`KPI_MODEL_INST`,`KPI_MODEL_INST_PARENT`,`KPI_MODEL_ID`,`ID_KPI_INSTANCE`,`NAME`,`LABEL`,`DESCRIPTION`,`START_DATE`,`END_DATE`,`MODELUUID`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,NULL,1,1,'Solar Energy','02827cf3-06c1-4865-8786-66ec0c58426e','Solar Energy',NULL,NULL,NULL,'biadmin','biadmin',NULL,'2013-11-18 21:23:16','2013-11-18 21:26:41',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_kpi_model_inst` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi_model_resources`
--

DROP TABLE IF EXISTS `sbi_kpi_model_resources`;
CREATE TABLE `sbi_kpi_model_resources` (
  `KPI_MODEL_RESOURCES_ID` int(11) NOT NULL,
  `RESOURCE_ID` int(11) NOT NULL,
  `KPI_MODEL_INST` int(11) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`KPI_MODEL_RESOURCES_ID`),
  KEY `FK_SBI_KPI_MODEL_RESOURCES_1` (`KPI_MODEL_INST`),
  KEY `FK_SBI_KPI_MODEL_RESOURCES_2` (`RESOURCE_ID`),
  CONSTRAINT `FK_SBI_KPI_MODEL_RESOURCES_1` FOREIGN KEY (`KPI_MODEL_INST`) REFERENCES `sbi_kpi_model_inst` (`KPI_MODEL_INST`),
  CONSTRAINT `FK_SBI_KPI_MODEL_RESOURCES_2` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `sbi_resources` (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi_model_resources`
--

/*!40000 ALTER TABLE `sbi_kpi_model_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_kpi_model_resources` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi_periodicity`
--

DROP TABLE IF EXISTS `sbi_kpi_periodicity`;
CREATE TABLE `sbi_kpi_periodicity` (
  `ID_KPI_PERIODICITY` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `MONTHS` int(11) DEFAULT NULL,
  `DAYS` int(11) DEFAULT NULL,
  `HOURS` int(11) DEFAULT NULL,
  `MINUTES` int(11) DEFAULT NULL,
  `CHRON_STRING` varchar(20) DEFAULT NULL,
  `START_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_KPI_PERIODICITY`),
  UNIQUE KEY `XIF1SBI_KPI_PERIODICITY` (`NAME`,`ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi_periodicity`
--

/*!40000 ALTER TABLE `sbi_kpi_periodicity` DISABLE KEYS */;
INSERT INTO `sbi_kpi_periodicity` (`ID_KPI_PERIODICITY`,`NAME`,`MONTHS`,`DAYS`,`HOURS`,`MINUTES`,`CHRON_STRING`,`START_DATE`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,'month',1,0,0,0,NULL,'2013-11-17 11:18:12','server',NULL,NULL,'2013-11-17 11:18:12',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,'day',0,1,0,0,NULL,'2013-11-17 11:18:12','server',NULL,NULL,'2013-11-17 11:18:12',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,'week',0,7,0,0,NULL,'2013-11-17 11:18:12','server',NULL,NULL,'2013-11-17 11:18:12',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,'hour',0,0,1,0,NULL,'2013-11-17 11:18:12','server',NULL,NULL,'2013-11-17 11:18:12',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,'1minute',0,0,0,1,NULL,'2013-11-17 11:18:12','server',NULL,NULL,'2013-11-17 11:18:12',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,'5minutes',0,0,0,5,NULL,'2013-11-17 11:18:12','server',NULL,NULL,'2013-11-17 11:18:12',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,'10minutes',0,0,0,10,NULL,'2013-11-17 11:18:12','server',NULL,NULL,'2013-11-17 11:18:12',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,'15minutes',0,0,0,15,NULL,'2013-11-17 11:18:12','server',NULL,NULL,'2013-11-17 11:18:12',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_kpi_periodicity` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi_rel`
--

DROP TABLE IF EXISTS `sbi_kpi_rel`;
CREATE TABLE `sbi_kpi_rel` (
  `KPI_REL_ID` int(11) NOT NULL,
  `KPI_FATHER_ID` int(11) NOT NULL,
  `KPI_CHILD_ID` int(11) NOT NULL,
  `PARAMETER` varchar(100) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`KPI_REL_ID`),
  KEY `FK_SBI_KPI_REL_3` (`KPI_FATHER_ID`),
  KEY `FK_SBI_KPI_REL_4` (`KPI_CHILD_ID`),
  CONSTRAINT `FK_SBI_KPI_REL_3` FOREIGN KEY (`KPI_FATHER_ID`) REFERENCES `sbi_kpi` (`KPI_ID`),
  CONSTRAINT `FK_SBI_KPI_REL_4` FOREIGN KEY (`KPI_CHILD_ID`) REFERENCES `sbi_kpi` (`KPI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi_rel`
--

/*!40000 ALTER TABLE `sbi_kpi_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_kpi_rel` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi_role`
--

DROP TABLE IF EXISTS `sbi_kpi_role`;
CREATE TABLE `sbi_kpi_role` (
  `ID_KPI_ROLE` int(11) NOT NULL,
  `KPI_ID` int(11) NOT NULL,
  `EXT_ROLE_ID` int(11) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_KPI_ROLE`),
  KEY `FK_SBI_KPI_ROLE_1` (`EXT_ROLE_ID`),
  KEY `FK_SBI_KPI_ROLE_2` (`KPI_ID`),
  CONSTRAINT `FK_SBI_KPI_ROLE_1` FOREIGN KEY (`EXT_ROLE_ID`) REFERENCES `sbi_ext_roles` (`EXT_ROLE_ID`),
  CONSTRAINT `FK_SBI_KPI_ROLE_2` FOREIGN KEY (`KPI_ID`) REFERENCES `sbi_kpi` (`KPI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi_role`
--

/*!40000 ALTER TABLE `sbi_kpi_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_kpi_role` ENABLE KEYS */;


--
-- Definition of table `sbi_kpi_value`
--

DROP TABLE IF EXISTS `sbi_kpi_value`;
CREATE TABLE `sbi_kpi_value` (
  `ID_KPI_INSTANCE_VALUE` int(11) NOT NULL,
  `ID_KPI_INSTANCE` int(11) NOT NULL,
  `RESOURCE_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(40) DEFAULT NULL,
  `BEGIN_DT` datetime DEFAULT NULL,
  `END_DT` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `XML_DATA` text,
  `ORG_UNIT_ID` int(11) DEFAULT NULL,
  `HIERARCHY_ID` int(11) DEFAULT NULL,
  `COMPANY` varchar(200) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_KPI_INSTANCE_VALUE`),
  KEY `FK_SBI_KPI_VALUE_1` (`RESOURCE_ID`),
  KEY `FK_SBI_KPI_VALUE_2` (`ID_KPI_INSTANCE`),
  KEY `FK_SBI_KPI_VALUE_4` (`HIERARCHY_ID`),
  CONSTRAINT `FK_SBI_KPI_VALUE_1` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `sbi_resources` (`RESOURCE_ID`),
  CONSTRAINT `FK_SBI_KPI_VALUE_2` FOREIGN KEY (`ID_KPI_INSTANCE`) REFERENCES `sbi_kpi_instance` (`ID_KPI_INSTANCE`),
  CONSTRAINT `FK_SBI_KPI_VALUE_4` FOREIGN KEY (`HIERARCHY_ID`) REFERENCES `sbi_org_unit_hierarchies` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_kpi_value`
--

/*!40000 ALTER TABLE `sbi_kpi_value` DISABLE KEYS */;
INSERT INTO `sbi_kpi_value` (`ID_KPI_INSTANCE_VALUE`,`ID_KPI_INSTANCE`,`RESOURCE_ID`,`VALUE`,`BEGIN_DT`,`END_DT`,`DESCRIPTION`,`XML_DATA`,`ORG_UNIT_ID`,`HIERARCHY_ID`,`COMPANY`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,1,NULL,'40.0','2013-11-23 15:48:18','9999-12-31 15:48:20',NULL,'<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<XML_DATA/>\r\n',NULL,NULL,NULL,'server',NULL,NULL,'2013-11-23 15:48:21',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,1,NULL,'40.0','2013-11-23 15:59:33','9999-12-31 15:59:34',NULL,'<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<XML_DATA/>\r\n',NULL,NULL,NULL,'server',NULL,NULL,'2013-11-23 15:59:34',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,1,NULL,'60.0','2013-11-23 15:59:49','9999-12-31 15:59:49',NULL,'<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<XML_DATA/>\r\n',NULL,NULL,NULL,'server',NULL,NULL,'2013-11-23 15:59:49',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,1,NULL,NULL,'2013-11-23 16:00:24','9999-12-31 16:00:24',NULL,NULL,NULL,NULL,NULL,'server',NULL,NULL,'2013-11-23 16:00:24',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_kpi_value` ENABLE KEYS */;


--
-- Definition of table `sbi_lov`
--

DROP TABLE IF EXISTS `sbi_lov`;
CREATE TABLE `sbi_lov` (
  `LOV_ID` int(11) NOT NULL,
  `DESCR` varchar(160) DEFAULT NULL,
  `LABEL` varchar(20) NOT NULL,
  `INPUT_TYPE_CD` varchar(20) NOT NULL,
  `DEFAULT_VAL` varchar(40) DEFAULT NULL,
  `LOV_PROVIDER` text,
  `INPUT_TYPE_ID` int(11) NOT NULL,
  `PROFILE_ATTR` varchar(20) DEFAULT NULL,
  `NAME` varchar(40) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  `DATASET_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LOV_ID`),
  UNIQUE KEY `XAK1SBI_LOV` (`LABEL`,`ORGANIZATION`),
  KEY `FK_SBI_LOV_1` (`INPUT_TYPE_ID`),
  CONSTRAINT `FK_SBI_LOV_1` FOREIGN KEY (`INPUT_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_lov`
--

/*!40000 ALTER TABLE `sbi_lov` DISABLE KEYS */;
INSERT INTO `sbi_lov` (`LOV_ID`,`DESCR`,`LABEL`,`INPUT_TYPE_CD`,`DEFAULT_VAL`,`LOV_PROVIDER`,`INPUT_TYPE_ID`,`PROFILE_ATTR`,`NAME`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`,`DATASET_ID`) VALUES 
 (1,'Current month of the year format mm','CURRENT_MONTH_YEAR','SCRIPT','','<SCRIPTLOV><SCRIPT>\nDate now = new Date();\nint month = now.getMonth() + 1;\nString monthStr = month.toString();\nif (month < 10) monthStr = \'0\' + monthStr;\nreturnValue(monthStr);\n</SCRIPT><VALUE-COLUMN>VALUE</VALUE-COLUMN><DESCRIPTION-COLUMN>VALUE</DESCRIPTION-COLUMN><VISIBLE-COLUMNS>VALUE</VISIBLE-COLUMNS><INVISIBLE-COLUMNS></INVISIBLE-COLUMNS></SCRIPTLOV>',2,'','Current month of the year','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI',NULL),
 (2,'Current year format yyyy','CURRENT_YEAR','SCRIPT','','<SCRIPTLOV><SCRIPT>\nDate now = new Date();\nint year = now.getYear() + 1900;\nString yearStr = year.toString();\nreturnValue(yearStr);\n</SCRIPT><VALUE-COLUMN>VALUE</VALUE-COLUMN><DESCRIPTION-COLUMN>VALUE</DESCRIPTION-COLUMN><VISIBLE-COLUMNS>VALUE</VISIBLE-COLUMNS><INVISIBLE-COLUMNS></INVISIBLE-COLUMNS></SCRIPTLOV>',2,'','Current year','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI',NULL),
 (3,'Current month format mm/yyyy','CURRENT_MONTH','SCRIPT','','<SCRIPTLOV><SCRIPT>\nDate now = new Date();\nint month = now.getMonth() + 1;\nString monthStr = month.toString();\nif (month < 10) monthStr = \'0\' + monthStr;\nint year = now.getYear() + 1900;\nString toReturn = monthStr + \'/\' + year.toString();\nreturnValue(toReturn);\n</SCRIPT><VALUE-COLUMN>VALUE</VALUE-COLUMN><DESCRIPTION-COLUMN>VALUE</DESCRIPTION-COLUMN><VISIBLE-COLUMNS>VALUE</VISIBLE-COLUMNS><INVISIBLE-COLUMNS></INVISIBLE-COLUMNS></SCRIPTLOV>',2,'','Current month','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI',NULL),
 (4,'Current date format dd/mm/yyyy','CURRENT_DATE','SCRIPT','','<SCRIPTLOV><SCRIPT>Date now = new Date();\nint day = now.getDate();\nString dayStr = day.toString();\nif (day < 10) dayStr = \'0\' + dayStr;\nint month = now.getMonth() + 1;\nString monthStr = month.toString();\nif (month < 10) monthStr = \'0\' + monthStr;\nint year = now.getYear() + 1900;\nString toReturn = dayStr + \'/\' + monthStr + \'/\' + year.toString();\nreturnValue(toReturn);</SCRIPT><VALUE-COLUMN>value</VALUE-COLUMN><DESCRIPTION-COLUMN>value</DESCRIPTION-COLUMN><VISIBLE-COLUMNS>value</VISIBLE-COLUMNS><INVISIBLE-COLUMNS></INVISIBLE-COLUMNS><LANGUAGE>groovy</LANGUAGE><LOVTYPE>simple</LOVTYPE><TREE-LEVELS-COLUMNS></TREE-LEVELS-COLUMNS></SCRIPTLOV>',2,'','Current date','server','biadmin',NULL,'2013-11-17 11:18:05','2013-11-23 11:54:17',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI',NULL),
 (5,'','MachineNo','QUERY',NULL,'<QUERY><CONNECTION>machine</CONNECTION><STMT>SELECT c.customer_id,md.imei_no,md.name FROM customer_details c inner join machine_details md on c.customer_id = md.customer_id</STMT><VALUE-COLUMN>imei_no</VALUE-COLUMN><DESCRIPTION-COLUMN>name</DESCRIPTION-COLUMN><VISIBLE-COLUMNS>name</VISIBLE-COLUMNS><INVISIBLE-COLUMNS>customer_id,imei_no</INVISIBLE-COLUMNS><LOVTYPE>simple</LOVTYPE><TREE-LEVELS-COLUMNS></TREE-LEVELS-COLUMNS></QUERY>',1,NULL,'MachineNo','biadmin','biadmin',NULL,'2013-11-20 20:07:50','2013-11-23 14:39:09',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI',NULL),
 (6,'','CustomerId','QUERY',NULL,'<QUERY><CONNECTION>machine</CONNECTION><STMT>SELECT customer_id,name FROM customer_details</STMT><VALUE-COLUMN>customer_id</VALUE-COLUMN><DESCRIPTION-COLUMN>name</DESCRIPTION-COLUMN><VISIBLE-COLUMNS>name</VISIBLE-COLUMNS><INVISIBLE-COLUMNS>customer_id</INVISIBLE-COLUMNS><LOVTYPE>simple</LOVTYPE><TREE-LEVELS-COLUMNS></TREE-LEVELS-COLUMNS></QUERY>',1,NULL,'CustomerId','biadmin',NULL,NULL,'2013-11-23 08:08:16',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI',NULL),
 (7,'','Year','QUERY',NULL,'<QUERY><CONNECTION>machine</CONNECTION><STMT>SELECT year(date) as year FROM report_data group by year(date)</STMT><VALUE-COLUMN>year</VALUE-COLUMN><DESCRIPTION-COLUMN>year</DESCRIPTION-COLUMN><VISIBLE-COLUMNS>year</VISIBLE-COLUMNS><INVISIBLE-COLUMNS></INVISIBLE-COLUMNS><LOVTYPE>simple</LOVTYPE><TREE-LEVELS-COLUMNS></TREE-LEVELS-COLUMNS></QUERY>',1,NULL,'Year','biadmin',NULL,NULL,'2013-11-23 08:10:32',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI',NULL),
 (8,'','Month','QUERY',NULL,'<QUERY><CONNECTION>machine</CONNECTION><STMT>SELECT month(date) as month ,DATE_FORMAT((cast(date as char)),\'%M \') as month_name FROM report_data group by month(date)</STMT><VALUE-COLUMN>month</VALUE-COLUMN><DESCRIPTION-COLUMN>month_name</DESCRIPTION-COLUMN><VISIBLE-COLUMNS>month_name</VISIBLE-COLUMNS><INVISIBLE-COLUMNS>month</INVISIBLE-COLUMNS><LOVTYPE>simple</LOVTYPE><TREE-LEVELS-COLUMNS></TREE-LEVELS-COLUMNS></QUERY>',1,NULL,'Month','biadmin','biadmin',NULL,'2013-11-23 08:11:30','2013-11-23 12:23:53',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI',NULL),
 (9,'','MachineName','QUERY',NULL,'<QUERY><CONNECTION>machine</CONNECTION><STMT>SELECT c.customer_id,md.imei_no,md.name FROM customer_details c inner join machine_details md on c.customer_id = md.customer_id</STMT><VALUE-COLUMN>name</VALUE-COLUMN><DESCRIPTION-COLUMN>name</DESCRIPTION-COLUMN><VISIBLE-COLUMNS>name</VISIBLE-COLUMNS><INVISIBLE-COLUMNS>customer_id,imei_no</INVISIBLE-COLUMNS><LOVTYPE>simple</LOVTYPE><TREE-LEVELS-COLUMNS></TREE-LEVELS-COLUMNS></QUERY>',1,NULL,'MachineName','biadmin','biadmin',NULL,'2013-11-23 09:03:46','2013-11-23 14:48:02',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI',NULL),
 (10,'','CurrentDateSql','SCRIPT',NULL,'<SCRIPTLOV><SCRIPT>Date now = new Date();\nint day = now.getDate();\nString dayStr = day.toString();\nif (day < 10) dayStr = \'0\' + dayStr;\nint month = now.getMonth() + 1;\nString monthStr = month.toString();\nif (month < 10) monthStr = \'0\' + monthStr;\nint year = now.getYear() + 1900;\nString toReturn = monthStr+ \'/\' + dayStr  + \'/\' + year.toString();\nreturnValue(toReturn);</SCRIPT><VALUE-COLUMN>value</VALUE-COLUMN><DESCRIPTION-COLUMN>value</DESCRIPTION-COLUMN><VISIBLE-COLUMNS>value</VISIBLE-COLUMNS><INVISIBLE-COLUMNS></INVISIBLE-COLUMNS><LANGUAGE>groovy</LANGUAGE><LOVTYPE>simple</LOVTYPE><TREE-LEVELS-COLUMNS></TREE-LEVELS-COLUMNS></SCRIPTLOV>',2,NULL,'CurrentDateSql','biadmin','biadmin',NULL,'2013-11-23 12:01:21','2013-11-23 12:11:55',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI',NULL),
 (11,'','BEHAVIOUR','FIX_LOV',NULL,'<FIXLISTLOV><ROWS><ROW VALUE=\"recalculate\" DESCRIPTION=\"Recalculate\"/></ROWS><VALUE-COLUMN>VALUE</VALUE-COLUMN><DESCRIPTION-COLUMN>DESCRIPTION</DESCRIPTION-COLUMN><VISIBLE-COLUMNS>DESCRIPTION</VISIBLE-COLUMNS><INVISIBLE-COLUMNS>VALUE</INVISIBLE-COLUMNS><LOVTYPE>simple</LOVTYPE><TREE-LEVELS-COLUMNS></TREE-LEVELS-COLUMNS></FIXLISTLOV>',3,NULL,'Behaviour','biadmin',NULL,NULL,'2013-11-23 15:54:23',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI',NULL);
/*!40000 ALTER TABLE `sbi_lov` ENABLE KEYS */;


--
-- Definition of table `sbi_measure_unit`
--

DROP TABLE IF EXISTS `sbi_measure_unit`;
CREATE TABLE `sbi_measure_unit` (
  `ID_MEASURE_UNIT` int(11) NOT NULL,
  `NAME` varchar(400) DEFAULT NULL,
  `SCALE_TYPE_ID` int(11) NOT NULL,
  `SCALE_CD` varchar(40) DEFAULT NULL,
  `SCALE_NM` varchar(400) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_MEASURE_UNIT`),
  KEY `FK_SBI_MEASURE_UNIT_1` (`SCALE_TYPE_ID`),
  CONSTRAINT `FK_SBI_MEASURE_UNIT_1` FOREIGN KEY (`SCALE_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_measure_unit`
--

/*!40000 ALTER TABLE `sbi_measure_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_measure_unit` ENABLE KEYS */;


--
-- Definition of table `sbi_menu`
--

DROP TABLE IF EXISTS `sbi_menu`;
CREATE TABLE `sbi_menu` (
  `MENU_ID` int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `DESCR` varchar(2000) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT '0',
  `BIOBJ_ID` int(11) DEFAULT NULL,
  `VIEW_ICONS` tinyint(1) DEFAULT NULL,
  `HIDE_TOOLBAR` tinyint(1) DEFAULT NULL,
  `HIDE_SLIDERS` tinyint(1) DEFAULT NULL,
  `STATIC_PAGE` varchar(45) DEFAULT NULL,
  `BIOBJ_PARAMETERS` text,
  `SUBOBJ_NAME` varchar(50) DEFAULT NULL,
  `SNAPSHOT_NAME` varchar(100) DEFAULT NULL,
  `SNAPSHOT_HISTORY` int(11) DEFAULT NULL,
  `FUNCTIONALITY` varchar(50) DEFAULT NULL,
  `INITIAL_PATH` varchar(400) DEFAULT NULL,
  `EXT_APP_URL` varchar(1000) DEFAULT NULL,
  `PROG` int(11) NOT NULL DEFAULT '1',
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_menu`
--

/*!40000 ALTER TABLE `sbi_menu` DISABLE KEYS */;
INSERT INTO `sbi_menu` (`MENU_ID`,`NAME`,`DESCR`,`PARENT_ID`,`BIOBJ_ID`,`VIEW_ICONS`,`HIDE_TOOLBAR`,`HIDE_SLIDERS`,`STATIC_PAGE`,`BIOBJ_PARAMETERS`,`SUBOBJ_NAME`,`SNAPSHOT_NAME`,`SNAPSHOT_HISTORY`,`FUNCTIONALITY`,`INITIAL_PATH`,`EXT_APP_URL`,`PROG`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,'Home','Home page of Solar',NULL,1,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'biadmin',NULL,NULL,'2013-11-18 21:43:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,'Dashboard','Dashboard',1,13,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'biadmin','biadmin',NULL,'2013-11-18 21:56:09','2013-11-23 15:28:29',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,'Solar Generation','Solar Generation',1,8,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'biadmin',NULL,NULL,'2013-11-23 15:30:02',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,'Consumption Trend','Consumption Trend',1,14,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'biadmin',NULL,NULL,'2013-11-23 15:31:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_menu` ENABLE KEYS */;


--
-- Definition of table `sbi_menu_role`
--

DROP TABLE IF EXISTS `sbi_menu_role`;
CREATE TABLE `sbi_menu_role` (
  `MENU_ID` int(11) NOT NULL,
  `EXT_ROLE_ID` int(11) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`,`EXT_ROLE_ID`),
  KEY `FK_SBI_MENU_ROLE2` (`EXT_ROLE_ID`),
  CONSTRAINT `FK_SBI_MENU_ROLE1` FOREIGN KEY (`MENU_ID`) REFERENCES `sbi_menu` (`MENU_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SBI_MENU_ROLE2` FOREIGN KEY (`EXT_ROLE_ID`) REFERENCES `sbi_ext_roles` (`EXT_ROLE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_menu_role`
--

/*!40000 ALTER TABLE `sbi_menu_role` DISABLE KEYS */;
INSERT INTO `sbi_menu_role` (`MENU_ID`,`EXT_ROLE_ID`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,1,'biadmin',NULL,NULL,'2013-11-18 21:43:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,2,'biadmin',NULL,NULL,'2013-11-18 21:43:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,3,'biadmin',NULL,NULL,'2013-11-18 21:43:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,4,'biadmin',NULL,NULL,'2013-11-18 21:43:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,5,'biadmin',NULL,NULL,'2013-11-18 21:43:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,6,'biadmin',NULL,NULL,'2013-11-18 21:43:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,7,'biadmin',NULL,NULL,'2013-11-18 21:43:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,8,'biadmin',NULL,NULL,'2013-11-18 21:43:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,9,'biadmin',NULL,NULL,'2013-11-18 21:43:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,10,'biadmin',NULL,NULL,'2013-11-18 21:43:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,3,'biadmin',NULL,NULL,'2013-11-23 15:28:29',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,5,'biadmin',NULL,NULL,'2013-11-23 15:28:29',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,3,'biadmin',NULL,NULL,'2013-11-23 15:30:02',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,5,'biadmin',NULL,NULL,'2013-11-23 15:30:02',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,3,'biadmin',NULL,NULL,'2013-11-23 15:31:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,5,'biadmin',NULL,NULL,'2013-11-23 15:31:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_menu_role` ENABLE KEYS */;


--
-- Definition of table `sbi_meta_models`
--

DROP TABLE IF EXISTS `sbi_meta_models`;
CREATE TABLE `sbi_meta_models` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCR` varchar(500) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  `DATA_SOURCE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `XAK1SBI_META_MODELS` (`NAME`,`ORGANIZATION`),
  KEY `FK_SBIDATA_SOURCE` (`DATA_SOURCE_ID`),
  CONSTRAINT `FK_SBIDATA_SOURCE` FOREIGN KEY (`DATA_SOURCE_ID`) REFERENCES `sbi_data_source` (`DS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_meta_models`
--

/*!40000 ALTER TABLE `sbi_meta_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_meta_models` ENABLE KEYS */;


--
-- Definition of table `sbi_meta_models_versions`
--

DROP TABLE IF EXISTS `sbi_meta_models_versions`;
CREATE TABLE `sbi_meta_models_versions` (
  `ID` int(11) NOT NULL,
  `MODEL_ID` int(11) NOT NULL,
  `CONTENT` mediumblob NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PROG` int(11) DEFAULT NULL,
  `CREATION_DATE` timestamp NULL DEFAULT NULL,
  `CREATION_USER` varchar(50) NOT NULL,
  `ACTIVE` tinyint(1) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SBI_META_MODELS_VERSIONS_1` (`MODEL_ID`),
  CONSTRAINT `FK_SBI_META_MODELS_VERSIONS_1` FOREIGN KEY (`MODEL_ID`) REFERENCES `sbi_meta_models` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_meta_models_versions`
--

/*!40000 ALTER TABLE `sbi_meta_models_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_meta_models_versions` ENABLE KEYS */;


--
-- Definition of table `sbi_obj_func`
--

DROP TABLE IF EXISTS `sbi_obj_func`;
CREATE TABLE `sbi_obj_func` (
  `BIOBJ_ID` int(11) NOT NULL,
  `FUNCT_ID` int(11) NOT NULL,
  `PROG` int(11) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BIOBJ_ID`,`FUNCT_ID`),
  KEY `FK_SBI_OBJ_FUNC_1` (`FUNCT_ID`),
  CONSTRAINT `FK_SBI_OBJ_FUNC_1` FOREIGN KEY (`FUNCT_ID`) REFERENCES `sbi_functions` (`FUNCT_ID`),
  CONSTRAINT `FK_SBI_OBJ_FUNC_2` FOREIGN KEY (`BIOBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_obj_func`
--

/*!40000 ALTER TABLE `sbi_obj_func` DISABLE KEYS */;
INSERT INTO `sbi_obj_func` (`BIOBJ_ID`,`FUNCT_ID`,`PROG`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,2,NULL,'server','biadmin',NULL,'2013-11-19 22:37:54','2013-11-19 22:37:54',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (2,2,NULL,'server','biadmin',NULL,'2013-11-18 20:49:26','2013-11-18 20:49:26',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,3,NULL,'server','biadmin',NULL,'2013-11-23 13:31:43','2013-11-23 13:31:43',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (4,3,NULL,'server','biadmin',NULL,'2013-11-23 13:34:32','2013-11-23 13:34:32',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (5,3,NULL,'server','biadmin',NULL,'2013-11-23 13:35:14','2013-11-23 13:35:14',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (6,3,NULL,'server','biadmin',NULL,'2013-11-23 13:37:44','2013-11-23 13:37:44',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (7,3,NULL,'server','biadmin',NULL,'2013-11-23 13:38:12','2013-11-23 13:38:12',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (8,3,NULL,'server','biadmin',NULL,'2013-11-23 14:39:59','2013-11-23 14:39:59',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (9,3,NULL,'server','biadmin',NULL,'2013-11-23 11:26:31','2013-11-23 11:26:31',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (10,3,NULL,'server','biadmin',NULL,'2013-11-23 11:25:18','2013-11-23 11:25:18',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (11,3,NULL,'server','biadmin',NULL,'2013-11-23 11:25:44','2013-11-23 11:25:44',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (12,3,NULL,'server','biadmin',NULL,'2013-11-23 11:15:38','2013-11-23 11:15:38',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (13,3,NULL,'server','biadmin',NULL,'2013-11-23 09:46:02','2013-11-23 09:46:02',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (14,3,NULL,'server','biadmin',NULL,'2013-11-23 14:50:50','2013-11-23 14:50:50',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (15,3,NULL,'server','biadmin',NULL,'2013-11-23 15:59:11','2013-11-23 15:59:11',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_obj_func` ENABLE KEYS */;


--
-- Definition of table `sbi_obj_metacontents`
--

DROP TABLE IF EXISTS `sbi_obj_metacontents`;
CREATE TABLE `sbi_obj_metacontents` (
  `OBJ_METACONTENT_ID` int(11) NOT NULL,
  `OBJMETA_ID` int(11) NOT NULL,
  `BIOBJ_ID` int(11) NOT NULL,
  `SUBOBJ_ID` int(11) DEFAULT NULL,
  `BIN_ID` int(11) DEFAULT NULL,
  `CREATION_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LAST_CHANGE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OBJ_METACONTENT_ID`),
  UNIQUE KEY `XAK1SBI_OBJ_METACONTENTS` (`OBJMETA_ID`,`BIOBJ_ID`,`SUBOBJ_ID`),
  KEY `FK_SBI_OBJ_METACONTENTS_2` (`BIOBJ_ID`),
  KEY `FK_SBI_OBJ_METACONTENTS_3` (`SUBOBJ_ID`),
  KEY `FK_SBI_OBJ_METACONTENTS_4` (`BIN_ID`),
  CONSTRAINT `FK_SBI_OBJ_METACONTENTS_1` FOREIGN KEY (`OBJMETA_ID`) REFERENCES `sbi_obj_metadata` (`OBJ_META_ID`),
  CONSTRAINT `FK_SBI_OBJ_METACONTENTS_2` FOREIGN KEY (`BIOBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`),
  CONSTRAINT `FK_SBI_OBJ_METACONTENTS_3` FOREIGN KEY (`SUBOBJ_ID`) REFERENCES `sbi_subobjects` (`SUBOBJ_ID`),
  CONSTRAINT `FK_SBI_OBJ_METACONTENTS_4` FOREIGN KEY (`BIN_ID`) REFERENCES `sbi_binary_contents` (`BIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_obj_metacontents`
--

/*!40000 ALTER TABLE `sbi_obj_metacontents` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_obj_metacontents` ENABLE KEYS */;


--
-- Definition of table `sbi_obj_metadata`
--

DROP TABLE IF EXISTS `sbi_obj_metadata`;
CREATE TABLE `sbi_obj_metadata` (
  `OBJ_META_ID` int(11) NOT NULL,
  `LABEL` varchar(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `DATA_TYPE_ID` int(11) NOT NULL,
  `CREATION_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OBJ_META_ID`),
  UNIQUE KEY `XAK1SBI_OBJ_METADATA` (`LABEL`,`ORGANIZATION`),
  KEY `FK_SBI_OBJ_METADATA_1` (`DATA_TYPE_ID`),
  CONSTRAINT `FK_SBI_OBJ_METADATA_1` FOREIGN KEY (`DATA_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_obj_metadata`
--

/*!40000 ALTER TABLE `sbi_obj_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_obj_metadata` ENABLE KEYS */;


--
-- Definition of table `sbi_obj_par`
--

DROP TABLE IF EXISTS `sbi_obj_par`;
CREATE TABLE `sbi_obj_par` (
  `OBJ_PAR_ID` int(11) NOT NULL,
  `PAR_ID` int(11) NOT NULL,
  `BIOBJ_ID` int(11) NOT NULL,
  `LABEL` varchar(40) NOT NULL,
  `REQ_FL` smallint(6) DEFAULT NULL,
  `MOD_FL` smallint(6) DEFAULT NULL,
  `VIEW_FL` smallint(6) DEFAULT NULL,
  `MULT_FL` smallint(6) DEFAULT NULL,
  `PROG` int(11) NOT NULL,
  `PARURL_NM` varchar(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OBJ_PAR_ID`),
  KEY `FK_SBI_OBJ_PAR_1` (`BIOBJ_ID`),
  KEY `FK_SBI_OBJ_PAR_2` (`PAR_ID`),
  CONSTRAINT `FK_SBI_OBJ_PAR_1` FOREIGN KEY (`BIOBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`),
  CONSTRAINT `FK_SBI_OBJ_PAR_2` FOREIGN KEY (`PAR_ID`) REFERENCES `sbi_parameters` (`PAR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_obj_par`
--

/*!40000 ALTER TABLE `sbi_obj_par` DISABLE KEYS */;
INSERT INTO `sbi_obj_par` (`OBJ_PAR_ID`,`PAR_ID`,`BIOBJ_ID`,`LABEL`,`REQ_FL`,`MOD_FL`,`VIEW_FL`,`MULT_FL`,`PROG`,`PARURL_NM`,`PRIORITY`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (2,1,3,'Site',1,0,1,0,1,'imeino',1,'biadmin','biadmin',NULL,'2013-11-23 13:31:37','2013-11-23 13:31:43',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (4,1,8,'Site',1,0,1,0,1,'imeino',2,'biadmin','biadmin',NULL,'2013-11-23 13:18:49','2013-11-23 14:40:00',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (5,1,4,'Site',1,0,1,0,1,'imeino',1,'biadmin','biadmin',NULL,'2013-11-23 13:32:01','2013-11-23 13:34:32',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (6,1,5,'Site',1,0,1,0,1,'imeino',1,'biadmin','biadmin',NULL,'2013-11-23 13:34:51','2013-11-23 13:35:14',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (7,1,6,'Site',1,0,1,0,1,'imeino',1,'biadmin','biadmin',NULL,'2013-11-23 13:36:18','2013-11-23 13:37:45',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (8,1,7,'Site',0,0,1,0,1,'imeino',1,'biadmin','biadmin',NULL,'2013-11-23 13:37:59','2013-11-23 13:38:13',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (9,2,9,'Select Customer',1,0,1,0,1,'customer',1,'biadmin','biadmin',NULL,'2013-11-23 08:15:58','2013-11-23 11:26:32',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (10,3,9,'Select Year',1,0,1,0,1,'year',2,'biadmin',NULL,NULL,'2013-11-23 08:16:27',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (11,4,9,'Select Month',1,0,1,0,1,'month',3,'biadmin',NULL,NULL,'2013-11-23 08:16:53',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (12,2,10,'Select Customer',1,0,1,0,1,'customer',1,'biadmin','biadmin',NULL,'2013-11-23 08:23:29','2013-11-23 11:25:18',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (13,3,10,'Select Year',1,0,1,0,1,'year',2,'biadmin',NULL,NULL,'2013-11-23 08:23:54',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (14,4,10,'Select Month',1,0,1,0,1,'month',3,'biadmin',NULL,NULL,'2013-11-23 08:24:18',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (15,2,11,'Select Customer',1,0,1,0,1,'customer',1,'biadmin','biadmin',NULL,'2013-11-23 08:24:46','2013-11-23 11:25:44',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (16,3,11,'Select Year',1,0,1,0,1,'year',2,'biadmin',NULL,NULL,'2013-11-23 08:25:07',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (17,4,11,'Select Month',1,0,1,0,1,'month',3,'biadmin',NULL,NULL,'2013-11-23 08:25:25',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (18,5,12,'Select Machine',1,0,1,0,1,'imeino',1,'biadmin','biadmin',NULL,'2013-11-23 08:30:32','2013-11-23 11:15:38',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (19,3,12,'Select Year',1,0,1,0,1,'year',2,'biadmin','biadmin',NULL,'2013-11-23 08:30:52','2013-11-23 08:31:23',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (20,4,12,'Select Month',1,0,1,0,1,'month',3,'biadmin',NULL,NULL,'2013-11-23 08:31:13',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (40,2,13,'Select Customer',1,0,1,0,1,'customer',1,'biadmin','biadmin',NULL,'2013-11-23 09:45:48','2013-11-23 09:46:02',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (41,3,13,'Select Year',1,0,1,0,1,'year',2,'biadmin',NULL,NULL,'2013-11-23 09:45:48',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (42,4,13,'Select Month',1,0,1,0,1,'month',3,'biadmin',NULL,NULL,'2013-11-23 09:45:48',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (44,2,14,'Customer',1,0,1,0,1,'customer',1,'biadmin','biadmin',NULL,'2013-11-23 11:43:03','2013-11-23 12:36:16',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (45,1,14,'Machine',1,0,1,0,1,'imeino',2,'biadmin','biadmin',NULL,'2013-11-23 11:43:31','2013-11-23 14:50:51',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (46,6,14,'Date',1,0,1,0,1,'day',3,'biadmin','biadmin',NULL,'2013-11-23 11:52:31','2013-11-23 12:36:37',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (47,2,8,'Customer',1,0,1,0,1,'customer',1,'biadmin','biadmin',NULL,'2013-11-23 13:18:40','2013-11-23 13:25:53',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (53,1,15,'Site',1,0,1,0,1,'imeino',1,'biadmin','biadmin',NULL,'2013-11-23 15:57:16','2013-11-23 15:57:31',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (54,7,15,'Behaviour',0,0,1,0,1,'behaviour',2,'biadmin',NULL,NULL,'2013-11-23 15:59:11',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_obj_par` ENABLE KEYS */;


--
-- Definition of table `sbi_obj_paruse`
--

DROP TABLE IF EXISTS `sbi_obj_paruse`;
CREATE TABLE `sbi_obj_paruse` (
  `OBJ_PAR_ID` int(11) NOT NULL,
  `USE_ID` int(11) NOT NULL,
  `OBJ_PAR_FATHER_ID` int(11) NOT NULL,
  `FILTER_OPERATION` varchar(20) NOT NULL,
  `PROG` int(11) NOT NULL,
  `FILTER_COLUMN` varchar(30) NOT NULL,
  `PRE_CONDITION` varchar(10) DEFAULT NULL,
  `POST_CONDITION` varchar(10) DEFAULT NULL,
  `LOGIC_OPERATOR` varchar(10) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OBJ_PAR_ID`,`USE_ID`,`OBJ_PAR_FATHER_ID`,`FILTER_OPERATION`),
  KEY `FK_SBI_OBJ_PARUSE_2` (`USE_ID`),
  KEY `FK_SBI_OBJ_PARUSE_3` (`OBJ_PAR_FATHER_ID`),
  CONSTRAINT `FK_SBI_OBJ_PARUSE_1` FOREIGN KEY (`OBJ_PAR_ID`) REFERENCES `sbi_obj_par` (`OBJ_PAR_ID`),
  CONSTRAINT `FK_SBI_OBJ_PARUSE_2` FOREIGN KEY (`USE_ID`) REFERENCES `sbi_paruse` (`USE_ID`),
  CONSTRAINT `FK_SBI_OBJ_PARUSE_3` FOREIGN KEY (`OBJ_PAR_FATHER_ID`) REFERENCES `sbi_obj_par` (`OBJ_PAR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_obj_paruse`
--

/*!40000 ALTER TABLE `sbi_obj_paruse` DISABLE KEYS */;
INSERT INTO `sbi_obj_paruse` (`OBJ_PAR_ID`,`USE_ID`,`OBJ_PAR_FATHER_ID`,`FILTER_OPERATION`,`PROG`,`FILTER_COLUMN`,`PRE_CONDITION`,`POST_CONDITION`,`LOGIC_OPERATOR`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (4,1,47,'start',1,'customer_id','','','','biadmin',NULL,NULL,'2013-11-23 14:39:52',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (45,1,44,'contains',1,'customer_id','','','','biadmin',NULL,NULL,'2013-11-23 14:50:45',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_obj_paruse` ENABLE KEYS */;


--
-- Definition of table `sbi_obj_parview`
--

DROP TABLE IF EXISTS `sbi_obj_parview`;
CREATE TABLE `sbi_obj_parview` (
  `OBJ_PAR_ID` int(11) NOT NULL,
  `OBJ_PAR_FATHER_ID` int(11) NOT NULL,
  `OPERATION` varchar(20) NOT NULL,
  `COMPARE_VALUE` varchar(200) NOT NULL,
  `VIEW_LABEL` varchar(50) DEFAULT NULL,
  `PROG` int(11) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OBJ_PAR_ID`,`OBJ_PAR_FATHER_ID`,`OPERATION`,`COMPARE_VALUE`),
  KEY `FK_SBI_OBJ_PARVIEW_2` (`OBJ_PAR_FATHER_ID`),
  CONSTRAINT `FK_SBI_OBJ_PARVIEW_1` FOREIGN KEY (`OBJ_PAR_ID`) REFERENCES `sbi_obj_par` (`OBJ_PAR_ID`),
  CONSTRAINT `FK_SBI_OBJ_PARVIEW_2` FOREIGN KEY (`OBJ_PAR_FATHER_ID`) REFERENCES `sbi_obj_par` (`OBJ_PAR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_obj_parview`
--

/*!40000 ALTER TABLE `sbi_obj_parview` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_obj_parview` ENABLE KEYS */;


--
-- Definition of table `sbi_obj_state`
--

DROP TABLE IF EXISTS `sbi_obj_state`;
CREATE TABLE `sbi_obj_state` (
  `BIOBJ_ID` int(11) NOT NULL,
  `STATE_ID` int(11) NOT NULL,
  `END_DT` date DEFAULT NULL,
  `START_DT` date NOT NULL,
  `NOTE` varchar(300) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BIOBJ_ID`,`STATE_ID`,`START_DT`),
  KEY `FK_SBI_OBJ_STATE_2` (`STATE_ID`),
  CONSTRAINT `FK_SBI_OBJ_STATE_1` FOREIGN KEY (`BIOBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`),
  CONSTRAINT `FK_SBI_OBJ_STATE_2` FOREIGN KEY (`STATE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_obj_state`
--

/*!40000 ALTER TABLE `sbi_obj_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_obj_state` ENABLE KEYS */;


--
-- Definition of table `sbi_object_notes`
--

DROP TABLE IF EXISTS `sbi_object_notes`;
CREATE TABLE `sbi_object_notes` (
  `OBJ_NOTE_ID` int(11) NOT NULL,
  `BIOBJ_ID` int(11) DEFAULT NULL,
  `BIN_ID` int(11) DEFAULT NULL,
  `EXEC_REQ` varchar(500) DEFAULT NULL,
  `OWNER` varchar(50) DEFAULT NULL,
  `ISPUBLIC` tinyint(1) DEFAULT NULL,
  `CREATION_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LAST_CHANGE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OBJ_NOTE_ID`),
  KEY `FK_SBI_OBJECT_NOTES_1` (`BIN_ID`),
  KEY `FK_SBI_OBJECT_NOTES_2` (`BIOBJ_ID`),
  CONSTRAINT `FK_SBI_OBJECT_NOTES_1` FOREIGN KEY (`BIN_ID`) REFERENCES `sbi_binary_contents` (`BIN_ID`),
  CONSTRAINT `FK_SBI_OBJECT_NOTES_2` FOREIGN KEY (`BIOBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_object_notes`
--

/*!40000 ALTER TABLE `sbi_object_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_object_notes` ENABLE KEYS */;


--
-- Definition of table `sbi_object_templates`
--

DROP TABLE IF EXISTS `sbi_object_templates`;
CREATE TABLE `sbi_object_templates` (
  `OBJ_TEMP_ID` int(11) NOT NULL,
  `BIOBJ_ID` int(11) DEFAULT NULL,
  `BIN_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `PROG` int(11) DEFAULT NULL,
  `DIMENSION` varchar(20) DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `CREATION_USER` varchar(45) NOT NULL,
  `ACTIVE` tinyint(1) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OBJ_TEMP_ID`),
  KEY `FK_SBI_OBJECT_TEMPLATES_1` (`BIN_ID`),
  KEY `FK_SBI_OBJECT_TEMPLATES_2` (`BIOBJ_ID`),
  CONSTRAINT `FK_SBI_OBJECT_TEMPLATES_1` FOREIGN KEY (`BIN_ID`) REFERENCES `sbi_binary_contents` (`BIN_ID`),
  CONSTRAINT `FK_SBI_OBJECT_TEMPLATES_2` FOREIGN KEY (`BIOBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_object_templates`
--

/*!40000 ALTER TABLE `sbi_object_templates` DISABLE KEYS */;
INSERT INTO `sbi_object_templates` (`OBJ_TEMP_ID`,`BIOBJ_ID`,`BIN_ID`,`NAME`,`PROG`,`DIMENSION`,`CREATION_DATE`,`CREATION_USER`,`ACTIVE`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,1,1,'AlarmDetails.sbihchart',1,'0 KByte','2013-11-18 19:12:58','biadmin',1,'biadmin',NULL,NULL,'2013-11-18 19:12:58',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,2,2,'AlarmDetails.sbidoccomp',1,'0 KByte','2013-11-18 19:52:33','biadmin',0,'biadmin',NULL,NULL,'2013-11-18 20:42:41',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,2,3,'AlarmDetails.sbidoccomp',2,'0 KByte','2013-11-18 20:42:41','biadmin',0,'biadmin',NULL,NULL,'2013-11-18 20:49:26',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,2,4,'AlarmDetails.sbidoccomp',3,'0 KByte','2013-11-18 20:49:26','biadmin',1,'biadmin',NULL,NULL,'2013-11-18 20:49:26',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,3,5,'Energy_generation_day1.sbihchart',1,'0 KByte','2013-11-20 19:15:10','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:17:02',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,3,6,'Energy_generation_day1.sbihchart',2,'0 KByte','2013-11-20 19:17:02','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:20:34',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,3,7,'Energy_generation_day1.sbihchart',3,'0 KByte','2013-11-20 19:20:34','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:25:52',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,3,8,'Energy_generation_day1.sbihchart',4,'0 KByte','2013-11-20 19:25:52','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:28:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,3,9,'Energy_generation_day1.sbihchart',5,'0 KByte','2013-11-20 19:28:44','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:29:58',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,3,10,'Energy_generation_day1.sbihchart',6,'0 KByte','2013-11-20 19:29:58','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:31:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (11,3,11,'Energy_generation_day1.sbihchart',7,'0 KByte','2013-11-20 19:31:03','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 20:02:58',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (12,4,12,'Energy_generation_day1.sbihchart',1,'0 KByte','2013-11-20 19:35:21','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:36:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (13,4,13,'Energy_generation_day1.sbihchart',2,'0 KByte','2013-11-20 19:36:04','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:58:42',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (14,5,14,'Energy_generation_day1.sbihchart',1,'0 KByte','2013-11-20 19:36:57','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:58:55',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (15,6,15,'Energy_generation_day1.sbihchart',1,'0 KByte','2013-11-20 19:38:12','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:56:10',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (16,7,16,'Energy_generation_day1.sbihchart',1,'0 KByte','2013-11-20 19:39:00','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:59:25',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (17,8,17,'Energy_Gen_Dashboard.sbidoccomp',1,'1 KByte','2013-11-20 19:49:45','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:51:38',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (18,8,18,'Energy_Gen_Dashboard.sbidoccomp',2,'1 KByte','2013-11-20 19:51:38','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:56:00',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (19,8,19,'Energy_Gen_Dashboard.sbidoccomp',3,'1 KByte','2013-11-20 19:56:00','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:57:28',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (20,8,20,'Energy_Gen_Dashboard.sbidoccomp',4,'1 KByte','2013-11-20 19:57:28','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 19:59:40',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (21,8,21,'Energy_Gen_Dashboard.sbidoccomp',5,'1 KByte','2013-11-20 19:59:40','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 20:22:33',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (22,3,22,'Energy_generation_day1.sbihchart',8,'0 KByte','2013-11-20 20:02:58','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 20:03:38',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (23,3,23,'Energy_generation_day1.sbihchart',9,'0 KByte','2013-11-20 20:03:38','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 20:13:48',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (24,3,24,'Energy_generation_day1.sbihchart',10,'0 KByte','2013-11-20 20:13:48','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:55:53',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (25,8,29,'Energy_Gen_Dashboard.sbidoccomp',6,'1 KByte','2013-11-20 20:22:33','biadmin',0,'biadmin',NULL,NULL,'2013-11-20 20:26:53',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (26,8,30,'Energy_Gen_Dashboard.sbidoccomp',7,'2 KByte','2013-11-20 20:26:53','biadmin',1,'biadmin',NULL,NULL,'2013-11-23 14:40:00',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (27,9,32,'energy_generation.sbihchart',1,'0 KByte','2013-11-22 22:19:00','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:28:59',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (28,10,33,'energy_generation_load.sbihchart',1,'0 KByte','2013-11-22 23:10:31','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:34:26',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (29,11,34,'energy_generation_eb.sbihchart',1,'0 KByte','2013-11-22 23:17:58','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:34:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (30,12,35,'all_energy_generation.sbihchart',1,'0 KByte','2013-11-22 23:31:01','biadmin',0,'biadmin',NULL,NULL,'2013-11-22 23:33:29',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (31,12,36,'all_energy_generation.sbihchart',2,'0 KByte','2013-11-22 23:33:29','biadmin',0,'biadmin',NULL,NULL,'2013-11-22 23:35:33',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (32,12,37,'all_energy_generation.sbihchart',3,'0 KByte','2013-11-22 23:35:33','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 07:58:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (33,12,38,'all_energy_generation.sbihchart',4,'0 KByte','2013-11-23 07:58:04','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:00:30',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (34,12,39,'all_energy_generation.sbihchart',5,'0 KByte','2013-11-23 08:00:30','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:01:52',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (35,12,40,'all_energy_generation.sbihchart',6,'0 KByte','2013-11-23 08:01:52','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:02:35',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (36,12,41,'all_energy_generation.sbihchart',7,'0 KByte','2013-11-23 08:02:35','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:06:24',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (37,9,42,'energy_generation.sbihchart',2,'0 KByte','2013-11-23 08:28:59','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:33:16',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (38,9,47,'all_energy_generation.sbihchart',3,'0 KByte','2013-11-23 08:33:16','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:34:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (39,9,48,'energy_generation.sbihchart',4,'0 KByte','2013-11-23 08:34:04','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:52:23',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (40,9,50,'energy_generation.sbihchart',5,'0 KByte','2013-11-23 08:52:23','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 08:57:40',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (41,9,51,'energy_generation.sbihchart',6,'0 KByte','2013-11-23 08:57:40','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:01:04',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (42,9,52,'energy_generation.sbihchart',7,'0 KByte','2013-11-23 09:01:04','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:34:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (43,12,54,'all_energy_generation.sbihchart',8,'0 KByte','2013-11-23 09:06:24','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:07:21',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (44,12,55,'all_energy_generation.sbihchart',9,'0 KByte','2013-11-23 09:07:21','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:15:38',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (45,13,56,'AllEnergyGenDash.sbidoccomp',1,'3 KByte','2013-11-23 09:21:31','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:23:40',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (46,13,57,'all_energy_generation.sbihchart',2,'0 KByte','2013-11-23 09:23:40','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:28:55',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (47,13,61,'AllEnergyGenDash.sbidoccomp',3,'3 KByte','2013-11-23 09:28:55','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:35:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (48,11,63,'energy_generation_eb.sbihchart',2,'0 KByte','2013-11-23 09:34:04','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:44:51',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (49,10,64,'energy_generation_load.sbihchart',2,'0 KByte','2013-11-23 09:34:26','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:45:08',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (50,9,65,'energy_generation.sbihchart',8,'0 KByte','2013-11-23 09:34:44','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:38:17',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (51,13,66,'AllEnergyGenDash.sbidoccomp',4,'3 KByte','2013-11-23 09:35:03','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:35:43',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (52,13,67,'AllEnergyGenDash.sbidoccomp',5,'3 KByte','2013-11-23 09:35:43','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:38:35',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (53,9,69,'energy_generation.sbihchart',9,'0 KByte','2013-11-23 09:38:17','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:44:34',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (54,13,70,'AllEnergyGenDash.sbidoccomp',6,'3 KByte','2013-11-23 09:38:35','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:45:47',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (55,9,72,'energy_generation.sbihchart',10,'0 KByte','2013-11-23 09:44:34','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:10:20',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (56,11,73,'energy_generation_eb.sbihchart',3,'0 KByte','2013-11-23 09:44:51','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 09:45:24',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (57,10,74,'energy_generation_load.sbihchart',3,'0 KByte','2013-11-23 09:45:08','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:19:53',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (58,11,75,'energy_generation_eb.sbihchart',4,'0 KByte','2013-11-23 09:45:24','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:19:29',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (59,13,76,'AllEnergyGenDash.sbidoccomp',7,'3 KByte','2013-11-23 09:45:47','biadmin',1,'biadmin',NULL,NULL,'2013-11-23 09:46:02',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (60,9,78,'energy_generation.sbihchart',11,'0 KByte','2013-11-23 11:10:20','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:16:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (61,12,79,'all_energy_generation.sbihchart',10,'0 KByte','2013-11-23 11:15:38','biadmin',1,'biadmin',NULL,NULL,'2013-11-23 11:15:38',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (62,9,80,'energy_generation.sbihchart',12,'0 KByte','2013-11-23 11:16:01','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:19:11',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (63,9,81,'energy_generation.sbihchart',13,'0 KByte','2013-11-23 11:19:11','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:26:32',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (64,11,82,'energy_generation_eb.sbihchart',5,'0 KByte','2013-11-23 11:19:29','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:25:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (65,10,83,'energy_generation_load.sbihchart',4,'0 KByte','2013-11-23 11:19:53','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:25:18',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (66,10,85,'energy_generation_load.sbihchart',5,'0 KByte','2013-11-23 11:25:18','biadmin',1,'biadmin',NULL,NULL,'2013-11-23 11:25:18',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (67,11,86,'energy_generation_eb.sbihchart',6,'0 KByte','2013-11-23 11:25:44','biadmin',1,'biadmin',NULL,NULL,'2013-11-23 11:25:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (68,9,87,'energy_generation.sbihchart',14,'0 KByte','2013-11-23 11:26:32','biadmin',1,'biadmin',NULL,NULL,'2013-11-23 11:26:32',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (69,14,88,'AllParameterTrend.sbihchart',1,'1 KByte','2013-11-23 11:37:57','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 11:39:57',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (70,14,89,'AllParameterTrend.sbihchart',2,'1 KByte','2013-11-23 11:39:57','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:09:53',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (71,14,94,'AllParameterTrend.sbihchart',3,'1 KByte','2013-11-23 12:09:53','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:14:52',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (72,14,95,'AllParameterTrend.sbihchart',4,'1 KByte','2013-11-23 12:14:52','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:15:26',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (73,14,96,'AllParameterTrend.sbihchart',5,'1 KByte','2013-11-23 12:15:26','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:35:43',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (74,14,97,'AllParameterTrend.sbihchart',6,'1 KByte','2013-11-23 12:35:43','biadmin',1,'biadmin',NULL,NULL,'2013-11-23 14:50:51',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (75,3,101,'Energy_generation_day1.sbihchart',11,'0 KByte','2013-11-23 12:55:53','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:57:34',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (76,6,102,'Energy_generation_day1.sbihchart',2,'0 KByte','2013-11-23 12:56:10','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:59:11',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (77,3,103,'Energy_generation_day1.sbihchart',12,'0 KByte','2013-11-23 12:57:35','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 12:58:17',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (78,3,104,'Energy_generation_day1.sbihchart',13,'0 KByte','2013-11-23 12:58:17','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:10:23',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (79,4,105,'Energy_generation_day1.sbihchart',3,'0 KByte','2013-11-23 12:58:42','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:02:48',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (80,5,106,'Energy_generation_day1.sbihchart',2,'0 KByte','2013-11-23 12:58:55','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:02:30',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (81,6,107,'Energy_generation_day1.sbihchart',3,'0 KByte','2013-11-23 12:59:11','biadmin',0,'biadmin',NULL,NULL,'2013-11-23 13:01:41',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (82,7,108,'Energy_generation_day1.sbihchart',2,'0 KByte','2013-11-23 12:59:25','biadmin',1,'biadmin',NULL,NULL,'2013-11-23 13:38:12',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (83,6,109,'Energy_generation_day1.sbihchart',4,'0 KByte','2013-11-23 13:01:41','biadmin',1,'biadmin',NULL,NULL,'2013-11-23 13:37:45',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (84,5,110,'Energy_generation_day1.sbihchart',3,'0 KByte','2013-11-23 13:02:30','biadmin',1,'biadmin',NULL,NULL,'2013-11-23 13:35:14',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (85,4,111,'Energy_generation_day1.sbihchart',4,'0 KByte','2013-11-23 13:02:48','biadmin',1,'biadmin',NULL,NULL,'2013-11-23 13:34:32',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (86,3,112,'Energy_generation_day1.sbihchart',14,'0 KByte','2013-11-23 13:10:23','biadmin',1,'biadmin',NULL,NULL,'2013-11-23 13:31:43',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (87,15,154,'kpitest.xml',1,'0 KByte','2013-11-23 15:47:57','biadmin',1,'biadmin',NULL,NULL,'2013-11-23 15:47:57',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_object_templates` ENABLE KEYS */;


--
-- Definition of table `sbi_objects`
--

DROP TABLE IF EXISTS `sbi_objects`;
CREATE TABLE `sbi_objects` (
  `BIOBJ_ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `DESCR` varchar(400) DEFAULT NULL,
  `LABEL` varchar(20) NOT NULL,
  `ENCRYPT` smallint(6) DEFAULT NULL,
  `PATH` varchar(400) DEFAULT NULL,
  `REL_NAME` varchar(400) DEFAULT NULL,
  `STATE_ID` int(11) NOT NULL,
  `STATE_CD` varchar(20) NOT NULL,
  `BIOBJ_TYPE_CD` varchar(20) NOT NULL,
  `BIOBJ_TYPE_ID` int(11) NOT NULL,
  `SCHED_FL` smallint(6) DEFAULT NULL,
  `EXEC_MODE_ID` int(11) DEFAULT NULL,
  `STATE_CONS_ID` int(11) DEFAULT NULL,
  `EXEC_MODE_CD` varchar(20) DEFAULT NULL,
  `STATE_CONS_CD` varchar(20) DEFAULT NULL,
  `NAME` varchar(200) NOT NULL,
  `VISIBLE` smallint(6) NOT NULL,
  `UUID` varchar(40) NOT NULL,
  `DATA_SOURCE_ID` int(11) DEFAULT NULL,
  `DATA_SET_ID` int(11) DEFAULT NULL,
  `CREATION_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATION_USER` varchar(45) NOT NULL,
  `REFRESH_SECONDS` int(11) DEFAULT NULL,
  `PROF_VISIBILITY` varchar(400) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BIOBJ_ID`),
  UNIQUE KEY `XAK1SBI_OBJECTS` (`LABEL`,`ORGANIZATION`),
  KEY `FK_SBI_OBJECTS_2` (`STATE_ID`),
  KEY `FK_SBI_OBJECTS_3` (`BIOBJ_TYPE_ID`),
  KEY `FK_SBI_OBJECTS_5` (`ENGINE_ID`),
  KEY `FK_SBI_OBJECTS_4` (`EXEC_MODE_ID`),
  KEY `FK_SBI_OBJECTS_1` (`STATE_CONS_ID`),
  KEY `FK_SBI_OBJECTS_6` (`DATA_SOURCE_ID`),
  CONSTRAINT `FK_SBI_OBJECTS_1` FOREIGN KEY (`STATE_CONS_ID`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_OBJECTS_2` FOREIGN KEY (`STATE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_OBJECTS_3` FOREIGN KEY (`BIOBJ_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_OBJECTS_4` FOREIGN KEY (`EXEC_MODE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_OBJECTS_5` FOREIGN KEY (`ENGINE_ID`) REFERENCES `sbi_engines` (`ENGINE_ID`),
  CONSTRAINT `FK_SBI_OBJECTS_6` FOREIGN KEY (`DATA_SOURCE_ID`) REFERENCES `sbi_data_source` (`DS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_objects`
--

/*!40000 ALTER TABLE `sbi_objects` DISABLE KEYS */;
INSERT INTO `sbi_objects` (`BIOBJ_ID`,`ENGINE_ID`,`DESCR`,`LABEL`,`ENCRYPT`,`PATH`,`REL_NAME`,`STATE_ID`,`STATE_CD`,`BIOBJ_TYPE_CD`,`BIOBJ_TYPE_ID`,`SCHED_FL`,`EXEC_MODE_ID`,`STATE_CONS_ID`,`EXEC_MODE_CD`,`STATE_CONS_CD`,`NAME`,`VISIBLE`,`UUID`,`DATA_SOURCE_ID`,`DATA_SET_ID`,`CREATION_DATE`,`CREATION_USER`,`REFRESH_SECONDS`,`PROF_VISIBILITY`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,2,'AlarmDetails','AlarmDetails',0,NULL,'',41,'REL','DASH',9,NULL,NULL,NULL,NULL,NULL,'AlarmDetails',1,'54efb8bf-5057-11e3-b42c-7708befd3eae',NULL,1,'2013-11-18 19:12:56','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-18 19:12:56','2013-11-19 22:37:54',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (2,5,'comTest','comTest',0,NULL,'',39,'DEV','DOCUMENT_COMPOSITE',15,NULL,NULL,NULL,NULL,NULL,'comTest',1,'dd241795-505c-11e3-b42c-7708befd3eae',NULL,NULL,'2013-11-18 19:52:32','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-18 19:52:32','2013-11-18 20:49:26',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,2,'','Energy_Gen_Day1',0,NULL,'',41,'REL','DASH',9,NULL,NULL,NULL,NULL,NULL,'Energy_Gen_Day1',1,'f98639b7-51e9-11e3-84a0-7f6f11328fe1',NULL,3,'2013-11-20 19:15:10','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-20 19:15:10','2013-11-23 13:31:43',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (4,2,'','Energy_Gen_Day2',0,NULL,'',41,'REL','DASH',9,NULL,NULL,NULL,NULL,NULL,'Energy_Gen_Day2',1,'cb49cd45-51ec-11e3-84a0-7f6f11328fe1',NULL,4,'2013-11-20 19:35:21','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-20 19:35:21','2013-11-23 13:34:32',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (5,2,'Energy_Gen_Day3','Energy_Gen_Day3',0,NULL,'',41,'REL','DASH',9,NULL,NULL,NULL,NULL,NULL,'Energy_Gen_Day3',1,'043f19cf-51ed-11e3-84a0-7f6f11328fe1',NULL,5,'2013-11-20 19:36:57','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-20 19:36:57','2013-11-23 13:35:14',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (6,2,'','Energy_Gen_Day4',0,NULL,'',41,'REL','DASH',9,NULL,NULL,NULL,NULL,NULL,'Energy_Gen_Day4',1,'31367be3-51ed-11e3-84a0-7f6f11328fe1',NULL,6,'2013-11-20 19:38:12','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-20 19:38:12','2013-11-23 13:37:44',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (7,2,'','Energy_Gen_Day5',0,NULL,'',41,'REL','DASH',9,NULL,NULL,NULL,NULL,NULL,'Energy_Gen_Day5',1,'4d8cf859-51ed-11e3-84a0-7f6f11328fe1',NULL,7,'2013-11-20 19:39:00','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-20 19:39:00','2013-11-23 13:38:12',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (8,5,'','Energy_Gen_Dashboard',0,NULL,'',41,'REL','DOCUMENT_COMPOSITE',15,NULL,NULL,NULL,NULL,NULL,'Energy_Gen_Dashboard',1,'ce48074c-51ee-11e3-84a0-7f6f11328fe1',NULL,NULL,'2013-11-20 19:49:45','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-20 19:49:45','2013-11-23 14:39:59',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (9,2,'','SolarEnergyGen',0,NULL,'',41,'REL','DASH',9,NULL,NULL,NULL,NULL,NULL,'SolarEnergyGen',1,'fbcc009e-5395-11e3-8e76-bf807b8e8a82',NULL,8,'2013-11-22 22:18:59','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-22 22:18:59','2013-11-23 11:26:31',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (10,2,'','load_energy_gen',0,NULL,'',41,'REL','DASH',9,NULL,NULL,NULL,NULL,NULL,'load_energy_gen',1,'2f0ae1f7-539d-11e3-8e76-bf807b8e8a82',NULL,9,'2013-11-22 23:10:31','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-22 23:10:31','2013-11-23 11:25:18',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (11,2,'','eb_energy_gen',0,NULL,'',41,'REL','DASH',9,NULL,NULL,NULL,NULL,NULL,'eb_energy_gen',1,'3928a54e-539e-11e3-8e76-bf807b8e8a82',NULL,10,'2013-11-22 23:17:58','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-22 23:17:58','2013-11-23 11:25:44',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (12,2,'','SiteWiseDetailsRpt',0,NULL,'',41,'REL','DASH',9,NULL,NULL,NULL,NULL,NULL,'SiteWiseDetailsRpt',1,'0bb94233-53a0-11e3-8e76-bf807b8e8a82',NULL,11,'2013-11-22 23:31:00','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-22 23:31:00','2013-11-23 11:15:38',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (13,5,'','AllEnergyGenDash',0,NULL,'',41,'REL','DOCUMENT_COMPOSITE',15,NULL,NULL,NULL,NULL,NULL,'AllEnergyGenDash',1,'89767650-53f2-11e3-9550-0b78a1160126',NULL,NULL,'2013-11-23 09:21:30','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-23 09:21:30','2013-11-23 09:46:02',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (14,2,'','ConsumptionTrend',0,NULL,'',41,'REL','DASH',9,NULL,NULL,NULL,NULL,NULL,'ConsumptionTrend',1,'98cf9fdb-5405-11e3-9550-0b78a1160126',NULL,12,'2013-11-23 11:37:56','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-23 11:37:56','2013-11-23 14:50:50',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (15,6,'','SolarKPI',0,NULL,'',41,'REL','KPI',16,NULL,NULL,NULL,NULL,NULL,'SolarKPI',1,'8560909b-5428-11e3-935d-bf7f40c8ce8e',NULL,NULL,'2013-11-23 15:47:56','biadmin',0,'','biadmin','biadmin',NULL,'2013-11-23 15:47:56','2013-11-23 15:59:11',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_objects` ENABLE KEYS */;


--
-- Definition of table `sbi_objects_rating`
--

DROP TABLE IF EXISTS `sbi_objects_rating`;
CREATE TABLE `sbi_objects_rating` (
  `USER_ID` varchar(127) NOT NULL,
  `OBJ_ID` int(11) NOT NULL,
  `RATING` int(11) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`OBJ_ID`),
  KEY `FK_SBI_OBJECTS_RATING_1` (`OBJ_ID`),
  CONSTRAINT `FK_SBI_OBJECTS_RATING_1` FOREIGN KEY (`OBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_objects_rating`
--

/*!40000 ALTER TABLE `sbi_objects_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_objects_rating` ENABLE KEYS */;


--
-- Definition of table `sbi_org_unit`
--

DROP TABLE IF EXISTS `sbi_org_unit`;
CREATE TABLE `sbi_org_unit` (
  `ID` int(11) NOT NULL,
  `LABEL` varchar(100) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `XIF1SBI_ORG_UNIT` (`LABEL`,`NAME`,`ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_org_unit`
--

/*!40000 ALTER TABLE `sbi_org_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_org_unit` ENABLE KEYS */;


--
-- Definition of table `sbi_org_unit_grant`
--

DROP TABLE IF EXISTS `sbi_org_unit_grant`;
CREATE TABLE `sbi_org_unit_grant` (
  `ID` int(11) NOT NULL,
  `HIERARCHY_ID` int(11) NOT NULL,
  `KPI_MODEL_INST_NODE_ID` int(11) NOT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `LABEL` varchar(200) NOT NULL,
  `NAME` varchar(400) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  `IS_AVAILABLE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `XIF1SBI_ORG_UNIT_GRANT` (`LABEL`,`ORGANIZATION`),
  KEY `FK_SBI_ORG_UNIT_GRANT_2` (`HIERARCHY_ID`),
  KEY `FK_SBI_ORG_UNIT_GRANT_3` (`KPI_MODEL_INST_NODE_ID`),
  CONSTRAINT `FK_SBI_ORG_UNIT_GRANT_2` FOREIGN KEY (`HIERARCHY_ID`) REFERENCES `sbi_org_unit_hierarchies` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SBI_ORG_UNIT_GRANT_3` FOREIGN KEY (`KPI_MODEL_INST_NODE_ID`) REFERENCES `sbi_kpi_model_inst` (`KPI_MODEL_INST`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_org_unit_grant`
--

/*!40000 ALTER TABLE `sbi_org_unit_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_org_unit_grant` ENABLE KEYS */;


--
-- Definition of table `sbi_org_unit_grant_nodes`
--

DROP TABLE IF EXISTS `sbi_org_unit_grant_nodes`;
CREATE TABLE `sbi_org_unit_grant_nodes` (
  `NODE_ID` int(11) NOT NULL,
  `KPI_MODEL_INST_NODE_ID` int(11) NOT NULL,
  `GRANT_ID` int(11) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NODE_ID`,`KPI_MODEL_INST_NODE_ID`,`GRANT_ID`),
  KEY `FK_SBI_ORG_UNIT_GRANT_NODES_2` (`KPI_MODEL_INST_NODE_ID`),
  KEY `FK_SBI_ORG_UNIT_GRANT_NODES_3` (`GRANT_ID`),
  CONSTRAINT `FK_SBI_ORG_UNIT_GRANT_NODES_1` FOREIGN KEY (`NODE_ID`) REFERENCES `sbi_org_unit_nodes` (`NODE_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SBI_ORG_UNIT_GRANT_NODES_2` FOREIGN KEY (`KPI_MODEL_INST_NODE_ID`) REFERENCES `sbi_kpi_model_inst` (`KPI_MODEL_INST`) ON DELETE CASCADE,
  CONSTRAINT `FK_SBI_ORG_UNIT_GRANT_NODES_3` FOREIGN KEY (`GRANT_ID`) REFERENCES `sbi_org_unit_grant` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_org_unit_grant_nodes`
--

/*!40000 ALTER TABLE `sbi_org_unit_grant_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_org_unit_grant_nodes` ENABLE KEYS */;


--
-- Definition of table `sbi_org_unit_hierarchies`
--

DROP TABLE IF EXISTS `sbi_org_unit_hierarchies`;
CREATE TABLE `sbi_org_unit_hierarchies` (
  `ID` int(11) NOT NULL,
  `LABEL` varchar(100) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `TARGET` varchar(1000) DEFAULT NULL,
  `COMPANY` varchar(100) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `XIF1SBI_ORG_UNIT_HIERARCHIES` (`LABEL`,`COMPANY`,`ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_org_unit_hierarchies`
--

/*!40000 ALTER TABLE `sbi_org_unit_hierarchies` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_org_unit_hierarchies` ENABLE KEYS */;


--
-- Definition of table `sbi_org_unit_nodes`
--

DROP TABLE IF EXISTS `sbi_org_unit_nodes`;
CREATE TABLE `sbi_org_unit_nodes` (
  `NODE_ID` int(11) NOT NULL,
  `OU_ID` int(11) NOT NULL,
  `HIERARCHY_ID` int(11) NOT NULL,
  `PARENT_NODE_ID` int(11) DEFAULT NULL,
  `PATH` varchar(4000) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NODE_ID`),
  KEY `FK_SBI_ORG_UNIT_NODES_1` (`OU_ID`),
  KEY `FK_SBI_ORG_UNIT_NODES_2` (`HIERARCHY_ID`),
  KEY `FK_SBI_ORG_UNIT_NODES_3` (`PARENT_NODE_ID`),
  CONSTRAINT `FK_SBI_ORG_UNIT_NODES_1` FOREIGN KEY (`OU_ID`) REFERENCES `sbi_org_unit` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SBI_ORG_UNIT_NODES_2` FOREIGN KEY (`HIERARCHY_ID`) REFERENCES `sbi_org_unit_hierarchies` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SBI_ORG_UNIT_NODES_3` FOREIGN KEY (`PARENT_NODE_ID`) REFERENCES `sbi_org_unit_nodes` (`NODE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_org_unit_nodes`
--

/*!40000 ALTER TABLE `sbi_org_unit_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_org_unit_nodes` ENABLE KEYS */;


--
-- Definition of table `sbi_organizations`
--

DROP TABLE IF EXISTS `sbi_organizations`;
CREATE TABLE `sbi_organizations` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `XAK1SBI_ORGANIZATIONS` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_organizations`
--

/*!40000 ALTER TABLE `sbi_organizations` DISABLE KEYS */;
INSERT INTO `sbi_organizations` (`ID`,`NAME`) VALUES 
 (1,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_organizations` ENABLE KEYS */;


--
-- Definition of table `sbi_parameters`
--

DROP TABLE IF EXISTS `sbi_parameters`;
CREATE TABLE `sbi_parameters` (
  `PAR_ID` int(11) NOT NULL,
  `DESCR` varchar(160) DEFAULT NULL,
  `LENGTH` smallint(6) NOT NULL,
  `LABEL` varchar(20) NOT NULL,
  `PAR_TYPE_CD` varchar(20) NOT NULL,
  `MASK` varchar(20) DEFAULT NULL,
  `PAR_TYPE_ID` int(11) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `FUNCTIONAL_FLAG` smallint(6) NOT NULL DEFAULT '1',
  `TEMPORAL_FLAG` smallint(6) NOT NULL DEFAULT '0',
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PAR_ID`),
  UNIQUE KEY `XAK1SBI_PARAMETERS` (`LABEL`,`ORGANIZATION`),
  KEY `FK_SBI_PARAMETERS_1` (`PAR_TYPE_ID`),
  CONSTRAINT `FK_SBI_PARAMETERS_1` FOREIGN KEY (`PAR_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_parameters`
--

/*!40000 ALTER TABLE `sbi_parameters` DISABLE KEYS */;
INSERT INTO `sbi_parameters` (`PAR_ID`,`DESCR`,`LENGTH`,`LABEL`,`PAR_TYPE_CD`,`MASK`,`PAR_TYPE_ID`,`NAME`,`FUNCTIONAL_FLAG`,`TEMPORAL_FLAG`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,'',0,'MachineNo','STRING','',30,'MachineNo',1,0,'biadmin','server',NULL,'2013-11-20 20:05:23','2013-11-23 14:44:44',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (2,'',0,'Customer','STRING','',30,'Customer',1,0,'biadmin','server',NULL,'2013-11-23 08:05:42','2013-11-23 14:45:01',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,'',0,'Year','NUM','',29,'Year',1,0,'biadmin','server',NULL,'2013-11-23 08:13:06','2013-11-23 08:14:07',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (4,'',0,'Month','NUM','',29,'month',1,0,'biadmin','server',NULL,'2013-11-23 08:14:35','2013-11-23 08:15:03',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (5,'',0,'MachineName','STRING','',30,'MachineName',1,0,'biadmin','server',NULL,'2013-11-23 09:02:18','2013-11-23 09:30:31',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (6,'',0,'Date','DATE','',28,'Date',1,0,'biadmin','server',NULL,'2013-11-23 11:44:11','2013-11-23 12:17:13',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (7,'',0,'Behaviour','STRING','',30,'Behaviour',1,0,'biadmin','server',NULL,'2013-11-23 15:52:51','2013-11-23 15:55:01',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_parameters` ENABLE KEYS */;


--
-- Definition of table `sbi_paruse`
--

DROP TABLE IF EXISTS `sbi_paruse`;
CREATE TABLE `sbi_paruse` (
  `USE_ID` int(11) NOT NULL,
  `LOV_ID` int(11) DEFAULT NULL,
  `DEFAULT_LOV_ID` int(11) DEFAULT NULL,
  `DEFAULT_FORMULA` varchar(4000) DEFAULT NULL,
  `LABEL` varchar(20) NOT NULL,
  `DESCR` varchar(160) DEFAULT NULL,
  `PAR_ID` int(11) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `MAN_IN` int(11) NOT NULL,
  `MAXIMIZER_ENABLED` tinyint(1) DEFAULT '0',
  `SELECTION_TYPE` varchar(20) DEFAULT 'LIST',
  `MULTIVALUE_FLAG` int(11) DEFAULT '0',
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USE_ID`),
  UNIQUE KEY `XAK1SBI_PARUSE` (`PAR_ID`,`LABEL`),
  KEY `FK_SBI_PARUSE_2` (`LOV_ID`),
  KEY `FK_SBI_PARUSE_3` (`DEFAULT_LOV_ID`),
  CONSTRAINT `FK_SBI_PARUSE_1` FOREIGN KEY (`PAR_ID`) REFERENCES `sbi_parameters` (`PAR_ID`),
  CONSTRAINT `FK_SBI_PARUSE_2` FOREIGN KEY (`LOV_ID`) REFERENCES `sbi_lov` (`LOV_ID`),
  CONSTRAINT `FK_SBI_PARUSE_3` FOREIGN KEY (`DEFAULT_LOV_ID`) REFERENCES `sbi_lov` (`LOV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_paruse`
--

/*!40000 ALTER TABLE `sbi_paruse` DISABLE KEYS */;
INSERT INTO `sbi_paruse` (`USE_ID`,`LOV_ID`,`DEFAULT_LOV_ID`,`DEFAULT_FORMULA`,`LABEL`,`DESCR`,`PAR_ID`,`NAME`,`MAN_IN`,`MAXIMIZER_ENABLED`,`SELECTION_TYPE`,`MULTIVALUE_FLAG`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,5,NULL,'FIRST','ALL','',1,'ALL',0,0,'LIST',0,'biadmin','biadmin',NULL,'2013-11-20 20:15:45','2013-11-23 14:44:44',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (2,6,NULL,'FIRST','ALL','',2,'ALL',0,0,'LOOKUP',1,'biadmin','biadmin',NULL,'2013-11-23 08:12:34','2013-11-23 14:45:01',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (3,7,NULL,'FIRST','ALL','',3,'ALL',0,0,'LIST',0,'biadmin','biadmin',NULL,'2013-11-23 08:13:53','2013-11-23 08:14:07',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (4,8,NULL,'FIRST','ALL','',4,'ALL',0,0,'LIST',0,'biadmin',NULL,NULL,'2013-11-23 08:15:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,9,NULL,'FIRST','ALL','',5,'ALL',0,0,'LIST',0,'biadmin','biadmin',NULL,'2013-11-23 09:04:43','2013-11-23 09:30:31',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (6,10,NULL,'FIRST','ALL','',6,'ALL',0,0,'COMBOBOX',0,'biadmin','biadmin',NULL,'2013-11-23 11:45:39','2013-11-23 12:17:13',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI'),
 (7,11,NULL,'FIRST','ALL','',7,'ALL',0,0,'LIST',0,'biadmin',NULL,NULL,'2013-11-23 15:55:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_paruse` ENABLE KEYS */;


--
-- Definition of table `sbi_paruse_ck`
--

DROP TABLE IF EXISTS `sbi_paruse_ck`;
CREATE TABLE `sbi_paruse_ck` (
  `CHECK_ID` int(11) NOT NULL,
  `USE_ID` int(11) NOT NULL,
  `PROG` int(11) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USE_ID`,`CHECK_ID`),
  KEY `FK_SBI_PARUSE_CK_2` (`CHECK_ID`),
  CONSTRAINT `FK_SBI_PARUSE_CK_1` FOREIGN KEY (`USE_ID`) REFERENCES `sbi_paruse` (`USE_ID`),
  CONSTRAINT `FK_SBI_PARUSE_CK_2` FOREIGN KEY (`CHECK_ID`) REFERENCES `sbi_checks` (`CHECK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_paruse_ck`
--

/*!40000 ALTER TABLE `sbi_paruse_ck` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_paruse_ck` ENABLE KEYS */;


--
-- Definition of table `sbi_paruse_det`
--

DROP TABLE IF EXISTS `sbi_paruse_det`;
CREATE TABLE `sbi_paruse_det` (
  `EXT_ROLE_ID` int(11) NOT NULL,
  `PROG` int(11) DEFAULT NULL,
  `USE_ID` int(11) NOT NULL,
  `HIDDEN_FL` smallint(6) DEFAULT NULL,
  `DEFAULT_VAL` varchar(40) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USE_ID`,`EXT_ROLE_ID`),
  KEY `FK_SBI_PARUSE_DET_2` (`EXT_ROLE_ID`),
  CONSTRAINT `FK_SBI_PARUSE_DET_1` FOREIGN KEY (`USE_ID`) REFERENCES `sbi_paruse` (`USE_ID`),
  CONSTRAINT `FK_SBI_PARUSE_DET_2` FOREIGN KEY (`EXT_ROLE_ID`) REFERENCES `sbi_ext_roles` (`EXT_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_paruse_det`
--

/*!40000 ALTER TABLE `sbi_paruse_det` DISABLE KEYS */;
INSERT INTO `sbi_paruse_det` (`EXT_ROLE_ID`,`PROG`,`USE_ID`,`HIDDEN_FL`,`DEFAULT_VAL`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,NULL,1,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:44:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,NULL,1,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:44:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,NULL,1,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:44:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,NULL,1,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:44:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,NULL,1,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:44:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,NULL,1,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:44:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,NULL,1,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:44:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,NULL,1,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:44:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,NULL,1,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:44:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,NULL,1,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:44:44',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,NULL,2,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:45:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,NULL,2,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:45:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,NULL,2,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:45:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,NULL,2,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:45:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,NULL,2,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:45:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,NULL,2,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:45:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,NULL,2,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:45:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,NULL,2,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:45:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,NULL,2,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:45:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,NULL,2,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 14:45:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,NULL,3,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:14:07',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,NULL,3,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:14:07',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,NULL,3,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:14:07',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,NULL,3,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:14:07',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,NULL,3,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:14:07',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,NULL,3,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:14:07',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,NULL,3,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:14:07',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,NULL,3,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:14:07',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,NULL,3,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:14:07',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,NULL,3,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:14:07',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,NULL,4,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:15:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,NULL,4,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:15:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,NULL,4,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:15:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,NULL,4,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:15:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,NULL,4,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:15:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,NULL,4,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:15:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,NULL,4,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:15:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,NULL,4,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:15:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,NULL,4,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:15:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,NULL,4,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 08:15:03',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,NULL,5,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 09:30:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,NULL,5,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 09:30:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,NULL,5,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 09:30:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,NULL,5,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 09:30:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,NULL,5,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 09:30:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,NULL,5,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 09:30:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,NULL,5,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 09:30:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,NULL,5,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 09:30:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,NULL,5,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 09:30:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,NULL,5,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 09:30:31',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,NULL,6,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 12:17:13',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,NULL,6,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 12:17:13',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,NULL,6,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 12:17:13',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,NULL,6,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 12:17:13',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,NULL,6,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 12:17:13',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,NULL,6,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 12:17:13',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,NULL,6,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 12:17:13',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,NULL,6,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 12:17:13',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,NULL,6,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 12:17:13',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,NULL,6,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 12:17:13',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (1,NULL,7,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 15:55:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,NULL,7,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 15:55:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (3,NULL,7,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 15:55:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (4,NULL,7,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 15:55:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (5,NULL,7,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 15:55:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (6,NULL,7,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 15:55:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (7,NULL,7,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 15:55:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (8,NULL,7,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 15:55:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (9,NULL,7,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 15:55:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (10,NULL,7,NULL,NULL,'biadmin',NULL,NULL,'2013-11-23 15:55:01',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_paruse_det` ENABLE KEYS */;


--
-- Definition of table `sbi_progress_thread`
--

DROP TABLE IF EXISTS `sbi_progress_thread`;
CREATE TABLE `sbi_progress_thread` (
  `PROGRESS_THREAD_ID` int(11) NOT NULL,
  `USER_ID` varchar(100) NOT NULL,
  `PARTIAL` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `FUNCTION_CD` varchar(200) DEFAULT NULL,
  `STATUS` varchar(4000) DEFAULT NULL,
  `RANDOM_KEY` varchar(4000) DEFAULT NULL,
  `TYPE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PROGRESS_THREAD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_progress_thread`
--

/*!40000 ALTER TABLE `sbi_progress_thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_progress_thread` ENABLE KEYS */;


--
-- Definition of table `sbi_remember_me`
--

DROP TABLE IF EXISTS `sbi_remember_me`;
CREATE TABLE `sbi_remember_me` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` text,
  `USERNAME` varchar(40) NOT NULL,
  `BIOBJ_ID` int(11) NOT NULL,
  `SUBOBJ_ID` int(11) DEFAULT NULL,
  `PARAMETERS` text,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SBI_REMEMBER_ME_1` (`BIOBJ_ID`),
  KEY `FK_SBI_REMEMBER_ME_2` (`SUBOBJ_ID`),
  CONSTRAINT `FK_SBI_REMEMBER_ME_1` FOREIGN KEY (`BIOBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SBI_REMEMBER_ME_2` FOREIGN KEY (`SUBOBJ_ID`) REFERENCES `sbi_subobjects` (`SUBOBJ_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_remember_me`
--

/*!40000 ALTER TABLE `sbi_remember_me` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_remember_me` ENABLE KEYS */;


--
-- Definition of table `sbi_resources`
--

DROP TABLE IF EXISTS `sbi_resources`;
CREATE TABLE `sbi_resources` (
  `RESOURCE_ID` int(11) NOT NULL,
  `RESOURCE_TYPE_ID` int(11) NOT NULL,
  `TABLE_NAME` varchar(40) DEFAULT NULL,
  `COLUMN_NAME` varchar(40) DEFAULT NULL,
  `RESOURCE_NAME` varchar(40) NOT NULL,
  `RESOURCE_DESCR` varchar(400) DEFAULT NULL,
  `RESOURCE_CODE` varchar(45) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`),
  UNIQUE KEY `XIF1SBI_RESOURCES` (`RESOURCE_CODE`,`ORGANIZATION`),
  KEY `FK_SBI_RESOURCES_1` (`RESOURCE_TYPE_ID`),
  CONSTRAINT `FK_SBI_RESOURCES_1` FOREIGN KEY (`RESOURCE_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_resources`
--

/*!40000 ALTER TABLE `sbi_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_resources` ENABLE KEYS */;


--
-- Definition of table `sbi_role_type_user_func`
--

DROP TABLE IF EXISTS `sbi_role_type_user_func`;
CREATE TABLE `sbi_role_type_user_func` (
  `ROLE_TYPE_ID` int(11) NOT NULL,
  `USER_FUNCT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ROLE_TYPE_ID`,`USER_FUNCT_ID`),
  KEY `FK_SBI_ROLE_TYPE_USER_FUNC_2` (`USER_FUNCT_ID`),
  CONSTRAINT `FK_SBI_ROLE_TYPE_USER_FUNC_1` FOREIGN KEY (`ROLE_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_ROLE_TYPE_USER_FUNC_2` FOREIGN KEY (`USER_FUNCT_ID`) REFERENCES `sbi_user_func` (`USER_FUNCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_role_type_user_func`
--

/*!40000 ALTER TABLE `sbi_role_type_user_func` DISABLE KEYS */;
INSERT INTO `sbi_role_type_user_func` (`ROLE_TYPE_ID`,`USER_FUNCT_ID`) VALUES 
 (31,12),
 (31,14),
 (31,21),
 (31,26),
 (31,28),
 (31,37),
 (31,44),
 (31,45),
 (31,48),
 (31,49),
 (31,50),
 (32,1),
 (32,2),
 (32,3),
 (32,4),
 (32,5),
 (32,6),
 (32,7),
 (32,8),
 (32,9),
 (32,10),
 (32,11),
 (32,12),
 (32,13),
 (32,14),
 (32,15),
 (32,16),
 (32,17),
 (32,18),
 (32,19),
 (32,20),
 (32,21),
 (32,22),
 (32,23),
 (32,24),
 (32,25),
 (32,26),
 (32,27),
 (32,28),
 (32,29),
 (32,30),
 (32,31),
 (32,32),
 (32,33),
 (32,34),
 (32,35),
 (32,36),
 (32,37),
 (32,38),
 (32,39),
 (32,40),
 (32,41),
 (32,42),
 (32,43),
 (32,44),
 (32,45),
 (32,46),
 (32,47),
 (32,49),
 (32,50),
 (33,7),
 (33,12),
 (33,13),
 (33,14),
 (33,15),
 (33,16),
 (33,17),
 (33,19),
 (33,21),
 (33,22),
 (33,24),
 (33,26),
 (33,27),
 (33,28),
 (33,29),
 (33,30),
 (33,31),
 (33,32),
 (33,34),
 (33,37),
 (33,44),
 (33,49),
 (33,50),
 (34,8),
 (34,12),
 (34,14),
 (34,21),
 (34,26),
 (34,28),
 (34,33),
 (34,34),
 (34,37),
 (34,44),
 (34,49),
 (34,50),
 (35,3),
 (35,4),
 (35,5),
 (35,29),
 (35,30),
 (35,31),
 (35,37),
 (35,38),
 (35,49),
 (35,50);
/*!40000 ALTER TABLE `sbi_role_type_user_func` ENABLE KEYS */;


--
-- Definition of table `sbi_snapshots`
--

DROP TABLE IF EXISTS `sbi_snapshots`;
CREATE TABLE `sbi_snapshots` (
  `SNAP_ID` int(11) NOT NULL,
  `BIOBJ_ID` int(11) DEFAULT NULL,
  `BIN_ID` int(11) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `CREATION_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SNAP_ID`),
  KEY `FK_SBI_SNAPSHOTS_1` (`BIN_ID`),
  KEY `FK_SBI_SNAPSHOTS_2` (`BIOBJ_ID`),
  CONSTRAINT `FK_SBI_SNAPSHOTS_1` FOREIGN KEY (`BIN_ID`) REFERENCES `sbi_binary_contents` (`BIN_ID`),
  CONSTRAINT `FK_SBI_SNAPSHOTS_2` FOREIGN KEY (`BIOBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_snapshots`
--

/*!40000 ALTER TABLE `sbi_snapshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_snapshots` ENABLE KEYS */;


--
-- Definition of table `sbi_subobjects`
--

DROP TABLE IF EXISTS `sbi_subobjects`;
CREATE TABLE `sbi_subobjects` (
  `SUBOBJ_ID` int(11) NOT NULL,
  `BIOBJ_ID` int(11) DEFAULT NULL,
  `BIN_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `OWNER` varchar(50) DEFAULT NULL,
  `ISPUBLIC` tinyint(1) DEFAULT NULL,
  `CREATION_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LAST_CHANGE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SUBOBJ_ID`),
  KEY `FK_SBI_SUBOBJECTS_1` (`BIN_ID`),
  KEY `FK_SBI_SUBOBJECTS_2` (`BIOBJ_ID`),
  CONSTRAINT `FK_SBI_SUBOBJECTS_1` FOREIGN KEY (`BIN_ID`) REFERENCES `sbi_binary_contents` (`BIN_ID`),
  CONSTRAINT `FK_SBI_SUBOBJECTS_2` FOREIGN KEY (`BIOBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_subobjects`
--

/*!40000 ALTER TABLE `sbi_subobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_subobjects` ENABLE KEYS */;


--
-- Definition of table `sbi_subreports`
--

DROP TABLE IF EXISTS `sbi_subreports`;
CREATE TABLE `sbi_subreports` (
  `MASTER_RPT_ID` int(11) NOT NULL,
  `SUB_RPT_ID` int(11) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MASTER_RPT_ID`,`SUB_RPT_ID`),
  KEY `FK_SBI_SUBREPORTS_2` (`SUB_RPT_ID`),
  CONSTRAINT `FK_SBI_SUBREPORTS_1` FOREIGN KEY (`MASTER_RPT_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`),
  CONSTRAINT `FK_SBI_SUBREPORTS_2` FOREIGN KEY (`SUB_RPT_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_subreports`
--

/*!40000 ALTER TABLE `sbi_subreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_subreports` ENABLE KEYS */;


--
-- Definition of table `sbi_threshold`
--

DROP TABLE IF EXISTS `sbi_threshold`;
CREATE TABLE `sbi_threshold` (
  `THRESHOLD_ID` int(11) NOT NULL,
  `THRESHOLD_TYPE_ID` int(11) NOT NULL,
  `NAME` varchar(400) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `CODE` varchar(45) NOT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`THRESHOLD_ID`),
  UNIQUE KEY `XIF1SBI_THRESHOLD` (`CODE`,`ORGANIZATION`),
  KEY `FK_SBI_THRESHOLD_1` (`THRESHOLD_TYPE_ID`),
  CONSTRAINT `FK_SBI_THRESHOLD_1` FOREIGN KEY (`THRESHOLD_TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_threshold`
--

/*!40000 ALTER TABLE `sbi_threshold` DISABLE KEYS */;
INSERT INTO `sbi_threshold` (`THRESHOLD_ID`,`THRESHOLD_TYPE_ID`,`NAME`,`DESCRIPTION`,`CODE`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,70,'solarEnergy','solarEnergy','solarEnergy','biadmin',NULL,NULL,'2013-11-18 21:04:22',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 (2,70,'utilityEnergy','utilityEnergy','utilityEnergy','biadmin',NULL,NULL,'2013-11-18 21:06:43',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_threshold` ENABLE KEYS */;


--
-- Definition of table `sbi_threshold_value`
--

DROP TABLE IF EXISTS `sbi_threshold_value`;
CREATE TABLE `sbi_threshold_value` (
  `ID_THRESHOLD_VALUE` int(11) NOT NULL,
  `THRESHOLD_ID` int(11) NOT NULL,
  `SEVERITY_ID` int(11) DEFAULT NULL,
  `POSITION` int(11) DEFAULT NULL,
  `MIN_VALUE` double DEFAULT NULL,
  `MAX_VALUE` double DEFAULT NULL,
  `LABEL` varchar(20) NOT NULL,
  `COLOUR` varchar(20) DEFAULT NULL,
  `MIN_CLOSED` tinyint(1) DEFAULT NULL,
  `MAX_CLOSED` tinyint(1) DEFAULT NULL,
  `TH_VALUE` double DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_THRESHOLD_VALUE`),
  UNIQUE KEY `XIF1SBI_THRESHOLD_VALUE` (`LABEL`,`THRESHOLD_ID`),
  KEY `SEVERITY_ID` (`SEVERITY_ID`),
  KEY `FK_SBI_THRESHOLD_VALUE_1` (`THRESHOLD_ID`),
  CONSTRAINT `FK_SBI_THRESHOLD_VALUE_1` FOREIGN KEY (`THRESHOLD_ID`) REFERENCES `sbi_threshold` (`THRESHOLD_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `sbi_threshold_value_ibfk_1` FOREIGN KEY (`SEVERITY_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_threshold_value`
--

/*!40000 ALTER TABLE `sbi_threshold_value` DISABLE KEYS */;
INSERT INTO `sbi_threshold_value` (`ID_THRESHOLD_VALUE`,`THRESHOLD_ID`,`SEVERITY_ID`,`POSITION`,`MIN_VALUE`,`MAX_VALUE`,`LABEL`,`COLOUR`,`MIN_CLOSED`,`MAX_CLOSED`,`TH_VALUE`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,1,76,2,81,100,'High','#339966',0,0,NULL,'server',NULL,NULL,'2013-11-18 21:04:22',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (2,1,76,1,11,80,'Medium','#FFFF00',0,0,NULL,'server',NULL,NULL,'2013-11-18 21:04:23',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (3,1,76,0,0,10,'Low','#FF0000',0,0,NULL,'server',NULL,NULL,'2013-11-18 21:04:23',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (4,2,76,2,80,100,'High','#FF0000',0,0,NULL,'server',NULL,NULL,'2013-11-18 21:06:43',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (5,2,76,1,11,80,'Medium','#FFFF00',0,0,NULL,'server',NULL,NULL,'2013-11-18 21:06:43',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (6,2,76,0,0,10,'Low','#00FF00',0,0,NULL,'server',NULL,NULL,'2013-11-18 21:06:43',NULL,NULL,'4.0',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sbi_threshold_value` ENABLE KEYS */;


--
-- Definition of table `sbi_udp`
--

DROP TABLE IF EXISTS `sbi_udp`;
CREATE TABLE `sbi_udp` (
  `UDP_ID` int(11) NOT NULL,
  `TYPE_ID` int(11) NOT NULL,
  `FAMILY_ID` int(11) NOT NULL,
  `LABEL` varchar(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `IS_MULTIVALUE` tinyint(1) DEFAULT '0',
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UDP_ID`),
  UNIQUE KEY `XAK1SBI_UDP` (`LABEL`,`ORGANIZATION`),
  KEY `FK_SBI_SBI_UDP_1` (`TYPE_ID`),
  KEY `FK_SBI_SBI_UDP_2` (`FAMILY_ID`),
  CONSTRAINT `FK_SBI_SBI_UDP_1` FOREIGN KEY (`TYPE_ID`) REFERENCES `sbi_domains` (`VALUE_ID`),
  CONSTRAINT `FK_SBI_SBI_UDP_2` FOREIGN KEY (`FAMILY_ID`) REFERENCES `sbi_domains` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_udp`
--

/*!40000 ALTER TABLE `sbi_udp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_udp` ENABLE KEYS */;


--
-- Definition of table `sbi_udp_value`
--

DROP TABLE IF EXISTS `sbi_udp_value`;
CREATE TABLE `sbi_udp_value` (
  `UDP_VALUE_ID` int(11) NOT NULL,
  `UDP_ID` int(11) NOT NULL,
  `VALUE` varchar(1000) DEFAULT NULL,
  `PROG` int(11) DEFAULT NULL,
  `LABEL` varchar(20) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `FAMILY` varchar(40) DEFAULT NULL,
  `BEGIN_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `END_TS` timestamp NULL DEFAULT NULL,
  `REFERENCE_ID` int(11) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UDP_VALUE_ID`),
  KEY `FK_SBI_UDP_VALUE_2` (`UDP_ID`),
  CONSTRAINT `FK_SBI_UDP_VALUE_2` FOREIGN KEY (`UDP_ID`) REFERENCES `sbi_udp` (`UDP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_udp_value`
--

/*!40000 ALTER TABLE `sbi_udp_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_udp_value` ENABLE KEYS */;


--
-- Definition of table `sbi_user`
--

DROP TABLE IF EXISTS `sbi_user`;
CREATE TABLE `sbi_user` (
  `USER_ID` char(100) NOT NULL,
  `PASSWORD` varchar(150) DEFAULT NULL,
  `FULL_NAME` varchar(255) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `DT_PWD_BEGIN` datetime DEFAULT NULL,
  `DT_PWD_END` datetime DEFAULT NULL,
  `FLG_PWD_BLOCKED` tinyint(1) DEFAULT NULL,
  `DT_LAST_ACCESS` datetime DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `XAK1SBI_USER` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_user`
--

/*!40000 ALTER TABLE `sbi_user` DISABLE KEYS */;
INSERT INTO `sbi_user` (`USER_ID`,`PASSWORD`,`FULL_NAME`,`ID`,`DT_PWD_BEGIN`,`DT_PWD_END`,`FLG_PWD_BLOCKED`,`DT_LAST_ACCESS`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 ('biadmin','#SHA#nHPmUA7oguQ9LN2lkku6Q0U+0Qg=','SpagoBI Administrator',1,NULL,NULL,NULL,NULL,'server',NULL,NULL,'2013-11-17 11:18:15',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 ('biuser','#SHA#/rsNSUksRt1BHKBiX+weiI9zJHA=','SpagoBI User',2,NULL,NULL,NULL,'2013-11-18 21:44:36','server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 ('bidemo','#SHA#fopnXBEkTx/VJ6kWZgnFsUALE/E=','SpagoBI Demo User',3,NULL,NULL,NULL,'2013-11-18 21:50:03','server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 ('bitest','#SHA#W71FxoesBeLFG/wcKMIPGTtjmac=','SpagoBI Test User',4,NULL,NULL,NULL,NULL,'server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 ('bidev','#SHA#SxqRhZU9B2tcldDajuQhgdyohHM=','SpagoBI Developer',5,NULL,NULL,NULL,NULL,'server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 ('bam','#SHA#Q95YLu19fRaqMNQgwVizRTDfXzM=','Bam User',6,NULL,NULL,NULL,NULL,'server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,'SPAGOBI'),
 ('gokul','#SHA#+unUGXb9OPHkRCTCCIfKsuapz7g=','gokul',7,NULL,NULL,NULL,'2013-11-23 15:31:54','biadmin','biadmin',NULL,'2013-11-17 11:21:56','2013-11-18 21:52:43',NULL,'4.0','4.0',NULL,NULL,'SPAGOBI');
/*!40000 ALTER TABLE `sbi_user` ENABLE KEYS */;


--
-- Definition of table `sbi_user_attributes`
--

DROP TABLE IF EXISTS `sbi_user_attributes`;
CREATE TABLE `sbi_user_attributes` (
  `ID` int(11) NOT NULL,
  `ATTRIBUTE_ID` int(11) NOT NULL,
  `ATTRIBUTE_VALUE` varchar(500) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`,`ATTRIBUTE_ID`),
  KEY `FK_SBI_USER_ATTRIBUTES_2` (`ATTRIBUTE_ID`),
  CONSTRAINT `FK_SBI_USER_ATTRIBUTES_1` FOREIGN KEY (`ID`) REFERENCES `sbi_user` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SBI_USER_ATTRIBUTES_2` FOREIGN KEY (`ATTRIBUTE_ID`) REFERENCES `sbi_attribute` (`ATTRIBUTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_user_attributes`
--

/*!40000 ALTER TABLE `sbi_user_attributes` DISABLE KEYS */;
INSERT INTO `sbi_user_attributes` (`ID`,`ATTRIBUTE_ID`,`ATTRIBUTE_VALUE`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,1,'SpagoBI Administrator','server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (1,5,'admin@eng.it','server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (2,1,'SpagoBI User','server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (3,1,'SpagoBI Demo User','server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (4,1,'SpagoBI TestUser','server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (5,1,'SpagoBI Developer','server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (6,1,'Bam User','server',NULL,NULL,'2013-11-17 11:18:16',NULL,NULL,'4.0',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sbi_user_attributes` ENABLE KEYS */;


--
-- Definition of table `sbi_user_func`
--

DROP TABLE IF EXISTS `sbi_user_func`;
CREATE TABLE `sbi_user_func` (
  `USER_FUNCT_ID` int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USER_FUNCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_user_func`
--

/*!40000 ALTER TABLE `sbi_user_func` DISABLE KEYS */;
INSERT INTO `sbi_user_func` (`USER_FUNCT_ID`,`NAME`,`DESCRIPTION`,`USER_IN`,`USER_UP`,`USER_DE`,`TIME_IN`,`TIME_UP`,`TIME_DE`,`SBI_VERSION_IN`,`SBI_VERSION_UP`,`SBI_VERSION_DE`,`META_VERSION`,`ORGANIZATION`) VALUES 
 (1,'EnginesManagement','EnginesManagement','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (2,'FunctionalitiesManagement','FunctionalitiesManagement','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (3,'LovsManagement','LovsManagement','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (4,'ConstraintManagement','ConstraintManagement','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (5,'ParameterManagement','ParameterManagement','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (6,'DocumentAdministration','DocumentAdministration','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (7,'DocumentDevManagement','DocumentDevManagement','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (8,'DocumentTestManagement','DocumentTestManagement','server',NULL,NULL,'2013-11-17 11:18:05',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (9,'DocumentAdminManagement','DocumentAdminManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (10,'ImportExportManagement','ImportExportManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (11,'SchedulerManagement','SchedulerManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (12,'EventsManagement','EventsManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (13,'WorkspaceManagement','WorkspaceManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (14,'WorklistManagement','WorklistManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (15,'MapCatalogueManagement','MapCatalogueManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (16,'MapFeaturesManagement','MapFeaturesManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (17,'DocumentManagement','DocumentManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (18,'SyncronizeRolesManagement','SyncronizeRolesManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (19,'ProfileAttributeManagement','ProfileAttributeManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (20,'DataSourceManagement','DataSourceManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (21,'DocumentUserManagement','DocumentUserManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (22,'DocumentDeleteManagement','DocumentDeleteManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (23,'DocumentStateManagement','DocumentStateManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (24,'DocumentDetailManagement','DocumentDetailManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (25,'ViewMyFolderAdmin','ViewMyFolderAdmin','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (26,'DistributionListUser','DistributionListUser','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (27,'DistributionListManagement','DistributionListManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (28,'DocumentMetadataManagement','DocumentMetadataManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (29,'LovsView','LovsView','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (30,'ConstraintView','ConstraintView','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (31,'ParameterView','ParameterView','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (32,'DatasetManagement','DatasetManagement','server',NULL,NULL,'2013-11-17 11:18:06',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (33,'DocumentMoveDownState','DocumentMoveDownState','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (34,'DocumentMoveUpState','DocumentMoveUpState','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (35,'ModifyRefresh','ModifyRefresh','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (36,'MenuManagement','MenuManagement','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (37,'HotLinkManagement','HotLinkManagement','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (38,'KpiManagement','KpiManagement','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (39,'ObjMetadataManagement','ObjMetadataManagement','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (40,'ProfileManagement','ProfileManagement','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (41,'UserDefinedPropertyManagement','UserDefinedPropertyManagement','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (42,'DomainManagement','DomainManagement','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (43,'ConfigManagement','ConfigManagement','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (44,'UserSaveDocumentFunctionality','UserSaveDocumentFunctionality','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (45,'FinalUsersManagement','FinalUsersManagement','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (46,'MetaModelsCatalogueManagement','MetaModelsCatalogueManagement','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (47,'ArtifactCatalogueManagement','ArtifactCatalogueManagement','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (48,'CreateWorksheetFromDatasetUserFunctionality','CreateWorksheetFromDatasetUserFunctionality','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (49,'SelfServiceDatasetManagement','SelfServiceDatasetManagement','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL),
 (50,'SelfServiceMetaModelManagement','SelfServiceMetaModelManagement','server',NULL,NULL,'2013-11-17 11:18:07',NULL,NULL,'4.0',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sbi_user_func` ENABLE KEYS */;


--
-- Definition of table `sbi_viewpoints`
--

DROP TABLE IF EXISTS `sbi_viewpoints`;
CREATE TABLE `sbi_viewpoints` (
  `VP_ID` int(11) NOT NULL,
  `BIOBJ_ID` int(11) NOT NULL,
  `VP_NAME` varchar(40) NOT NULL,
  `VP_OWNER` varchar(40) DEFAULT NULL,
  `VP_DESC` varchar(160) DEFAULT NULL,
  `VP_SCOPE` varchar(20) NOT NULL,
  `VP_VALUE_PARAMS` text,
  `VP_CREATION_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_IN` varchar(100) NOT NULL,
  `USER_UP` varchar(100) DEFAULT NULL,
  `USER_DE` varchar(100) DEFAULT NULL,
  `TIME_IN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIME_UP` timestamp NULL DEFAULT NULL,
  `TIME_DE` timestamp NULL DEFAULT NULL,
  `SBI_VERSION_IN` varchar(10) DEFAULT NULL,
  `SBI_VERSION_UP` varchar(10) DEFAULT NULL,
  `SBI_VERSION_DE` varchar(10) DEFAULT NULL,
  `META_VERSION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`VP_ID`),
  KEY `FK_SBI_VIEWPOINTS_1` (`BIOBJ_ID`),
  CONSTRAINT `FK_SBI_VIEWPOINTS_1` FOREIGN KEY (`BIOBJ_ID`) REFERENCES `sbi_objects` (`BIOBJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sbi_viewpoints`
--

/*!40000 ALTER TABLE `sbi_viewpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_viewpoints` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
