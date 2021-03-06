/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : nimrod

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 28/01/2019 16:29:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_app_appdef
-- ----------------------------
DROP TABLE IF EXISTS `act_app_appdef`;
CREATE TABLE `act_app_appdef`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_APP_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE,
  INDEX `ACT_IDX_APP_DEF_DPLY`(`DEPLOYMENT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_app_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_app_databasechangelog`;
CREATE TABLE `act_app_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_databasechangelog
-- ----------------------------
INSERT INTO `act_app_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2019-01-22 08:34:13', 1, 'EXECUTED', '8:496fc778bdf2ab13f2e1926d0e63e0a2', 'createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...', '', NULL, '3.6.2', NULL, NULL, '8117253701');
INSERT INTO `act_app_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2019-01-22 08:34:13', 2, 'EXECUTED', '8:ccea9ebfb6c1f8367ca4dd473fcbb7db', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT', '', NULL, '3.6.2', NULL, NULL, '8117253701');
INSERT INTO `act_app_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2019-01-22 08:34:13', 3, 'EXECUTED', '8:f1f8aff320aade831944ebad24355f3d', 'createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF', '', NULL, '3.6.2', NULL, NULL, '8117253701');

-- ----------------------------
-- Table structure for act_app_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_app_databasechangeloglock`;
CREATE TABLE `act_app_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_databasechangeloglock
-- ----------------------------
INSERT INTO `act_app_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_app_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_app_deployment`;
CREATE TABLE `act_app_deployment`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_app_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_app_deployment_resource`;
CREATE TABLE `act_app_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_APP_RSRC_DPL`(`DEPLOYMENT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_casedef
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_casedef`;
CREATE TABLE `act_cmmn_casedef`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_CASE_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_DEF_DPLY`(`DEPLOYMENT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_databasechangelog`;
CREATE TABLE `act_cmmn_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_databasechangelog
-- ----------------------------
INSERT INTO `act_cmmn_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-01-22 08:34:12', 1, 'EXECUTED', '8:8b4b922d90b05ff27483abefc9597aa6', 'createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...', '', NULL, '3.6.2', NULL, NULL, '8117251422');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-01-22 08:34:12', 2, 'EXECUTED', '8:65e39b3d385706bb261cbeffe7533cbe', 'addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST', '', NULL, '3.6.2', NULL, NULL, '8117251422');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-01-22 08:34:12', 3, 'EXECUTED', '8:c01f6e802b49436b4489040da3012359', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...', '', NULL, '3.6.2', NULL, NULL, '8117251422');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-01-22 08:34:12', 4, 'EXECUTED', '8:e40d29cb79345b7fb5afd38a7f0ba8fc', 'createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST', '', NULL, '3.6.2', NULL, NULL, '8117251422');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-01-22 08:34:13', 5, 'EXECUTED', '8:70349de472f87368dcdec971a10311a0', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...', '', NULL, '3.6.2', NULL, NULL, '8117251422');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-01-22 08:34:13', 6, 'EXECUTED', '8:10e82e26a7fee94c32a92099c059c18c', 'createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF', '', NULL, '3.6.2', NULL, NULL, '8117251422');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('7', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-01-22 08:34:13', 7, 'EXECUTED', '8:530bc81a1e30618ccf4a2da1f7c6c043', 'renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...', '', NULL, '3.6.2', NULL, NULL, '8117251422');

-- ----------------------------
-- Table structure for act_cmmn_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_databasechangeloglock`;
CREATE TABLE `act_cmmn_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_databasechangeloglock
-- ----------------------------
INSERT INTO `act_cmmn_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_cmmn_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_deployment`;
CREATE TABLE `act_cmmn_deployment`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_deployment_resource`;
CREATE TABLE `act_cmmn_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  `GENERATED_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_CMMN_RSRC_DPL`(`DEPLOYMENT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_hi_case_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_case_inst`;
CREATE TABLE `act_cmmn_hi_case_inst`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_hi_mil_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_mil_inst`;
CREATE TABLE `act_cmmn_hi_mil_inst`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_hi_plan_item_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_plan_item_inst`;
CREATE TABLE `act_cmmn_hi_plan_item_inst`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IS_STAGE_` bit(1) NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) NULL DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) NULL DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `EXIT_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `ENTRY_CRITERION_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_ru_case_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_case_inst`;
CREATE TABLE `act_cmmn_ru_case_inst`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `LOCK_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_PARENT`(`PARENT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_ru_mil_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_mil_inst`;
CREATE TABLE `act_cmmn_ru_mil_inst`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_MIL_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_MIL_CASE_INST`(`CASE_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_ru_plan_item_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_plan_item_inst`;
CREATE TABLE `act_cmmn_ru_plan_item_inst`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IS_STAGE_` bit(1) NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `ITEM_DEFINITION_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` bit(1) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `SENTRY_PART_INST_COUNT_` int(11) NULL DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) NULL DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) NULL DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `EXIT_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENTRY_CRITERION_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_STAGE_INST`(`STAGE_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_ru_sentry_part_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_sentry_part_inst`;
CREATE TABLE `act_cmmn_ru_sentry_part_inst`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PLAN_ITEM_INST_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ON_PART_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IF_PART_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_PLAN_ITEM`(`PLAN_ITEM_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_co_content_item
-- ----------------------------
DROP TABLE IF EXISTS `act_co_content_item`;
CREATE TABLE `act_co_content_item`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MIME_TYPE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TASK_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CONTENT_STORE_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CONTENT_STORE_NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `FIELD_` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CONTENT_AVAILABLE_` bit(1) NULL DEFAULT b'0',
  `CREATED_` timestamp(6) NULL DEFAULT NULL,
  `CREATED_BY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LAST_MODIFIED_` timestamp(6) NULL DEFAULT NULL,
  `LAST_MODIFIED_BY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CONTENT_SIZE_` bigint(20) NULL DEFAULT 0,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `idx_contitem_taskid`(`TASK_ID_`) USING BTREE,
  INDEX `idx_contitem_procid`(`PROC_INST_ID_`) USING BTREE,
  INDEX `idx_contitem_scope`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_co_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_co_databasechangelog`;
CREATE TABLE `act_co_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_databasechangelog
-- ----------------------------
INSERT INTO `act_co_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2019-01-22 08:34:10', 1, 'EXECUTED', '8:7644d7165cfe799200a2abdd3419e8b6', 'createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '3.6.2', NULL, NULL, '8117250828');
INSERT INTO `act_co_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2019-01-22 08:34:11', 2, 'EXECUTED', '8:fe7b11ac7dbbf9c43006b23bbab60bab', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '3.6.2', NULL, NULL, '8117250828');

-- ----------------------------
-- Table structure for act_co_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_co_databasechangeloglock`;
CREATE TABLE `act_co_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_databasechangeloglock
-- ----------------------------
INSERT INTO `act_co_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_dmn_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_databasechangelog`;
CREATE TABLE `act_dmn_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_databasechangelog
-- ----------------------------
INSERT INTO `act_dmn_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-01-22 08:34:09', 1, 'EXECUTED', '8:c8701f1c71018b55029f450b2e9a10a1', 'createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.6.2', NULL, NULL, '8117249597');
INSERT INTO `act_dmn_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-01-22 08:34:09', 2, 'EXECUTED', '8:47f94b27feb7df8a30d4e338c7bd5fb8', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.6.2', NULL, NULL, '8117249597');
INSERT INTO `act_dmn_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-01-22 08:34:09', 3, 'EXECUTED', '8:ac17eae89fbdccb6e08daf3c7797b579', 'addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.6.2', NULL, NULL, '8117249597');
INSERT INTO `act_dmn_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-01-22 08:34:09', 4, 'EXECUTED', '8:f73aabc4529e7292c2942073d1cff6f9', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.6.2', NULL, NULL, '8117249597');
INSERT INTO `act_dmn_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-01-22 08:34:10', 5, 'EXECUTED', '8:3e03528582dd4eeb4eb41f9b9539140d', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.6.2', NULL, NULL, '8117249597');
INSERT INTO `act_dmn_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-01-22 08:34:10', 6, 'EXECUTED', '8:646c6a061e0b6e8a62e69844ff96abb0', 'createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.6.2', NULL, NULL, '8117249597');

-- ----------------------------
-- Table structure for act_dmn_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_databasechangeloglock`;
CREATE TABLE `act_dmn_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_databasechangeloglock
-- ----------------------------
INSERT INTO `act_dmn_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_dmn_decision_table
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_decision_table`;
CREATE TABLE `act_dmn_decision_table`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_DEC_TBL_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_dmn_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_deployment`;
CREATE TABLE `act_dmn_deployment`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_dmn_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_deployment_resource`;
CREATE TABLE `act_dmn_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_dmn_hi_decision_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_hi_decision_execution`;
CREATE TABLE `act_dmn_hi_decision_execution`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DECISION_DEFINITION_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `INSTANCE_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `FAILED_` bit(1) NULL DEFAULT b'0',
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `EXECUTION_JSON_` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log`  (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` longblob NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_fo_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_databasechangelog`;
CREATE TABLE `act_fo_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_databasechangelog
-- ----------------------------
INSERT INTO `act_fo_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-01-22 08:34:10', 1, 'EXECUTED', '8:033ebf9380889aed7c453927ecc3250d', 'createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.6.2', NULL, NULL, '8117250258');
INSERT INTO `act_fo_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-01-22 08:34:10', 2, 'EXECUTED', '8:986365ceb40445ce3b27a8e6b40f159b', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.6.2', NULL, NULL, '8117250258');
INSERT INTO `act_fo_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-01-22 08:34:10', 3, 'EXECUTED', '8:abf482518ceb09830ef674e52c06bf15', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '3.6.2', NULL, NULL, '8117250258');
INSERT INTO `act_fo_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-01-22 08:34:10', 4, 'EXECUTED', '8:2087829f22a4b2298dbf530681c74854', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_FO_FORM_DEPLOYMENT; modifyDataType columnName=SUBMITTED_DATE_, tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.6.2', NULL, NULL, '8117250258');
INSERT INTO `act_fo_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-01-22 08:34:10', 5, 'EXECUTED', '8:b4be732b89e5ca028bdd520c6ad4d446', 'createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '3.6.2', NULL, NULL, '8117250258');

-- ----------------------------
-- Table structure for act_fo_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_databasechangeloglock`;
CREATE TABLE `act_fo_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_databasechangeloglock
-- ----------------------------
INSERT INTO `act_fo_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_fo_form_definition
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_definition`;
CREATE TABLE `act_fo_form_definition`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_FORM_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_fo_form_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_deployment`;
CREATE TABLE `act_fo_form_deployment`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_fo_form_instance
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_instance`;
CREATE TABLE `act_fo_form_instance`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `FORM_DEFINITION_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TASK_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `SUBMITTED_DATE_` datetime(3) NULL DEFAULT NULL,
  `SUBMITTED_BY_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `FORM_VALUES_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_fo_form_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_resource`;
CREATE TABLE `act_fo_form_resource`  (
  `ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  `GENERATED_` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_BYTEARR_DEPL`(`DEPLOYMENT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------
INSERT INTO `act_ge_bytearray` VALUES ('3a44ce8e-1faa-11e9-a2bc-40a5eff30b04', 1, '/Volumes/office/dev/IdeaProjects/nimrod/src/main/resources/processes/LeaveApplication.bpmn20.xml', '3a44ce8d-1faa-11e9-a2bc-40a5eff30b04', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F585061746822207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D226C656176654170706C69636174696F6E22206E616D653D22E8AFB7E58187E794B3E8AFB7E6B581E7A88B2220697345786563757461626C653D2274727565223E0A202020203C73746172744576656E742069643D2273746172744576656E74223E3C2F73746172744576656E743E0A202020203C73657175656E6365466C6F772069643D2273657175656E6365466C6F772D64623465386239322D366538312D343535322D393838632D6339393738656237366633382220736F757263655265663D2273746172744576656E7422207461726765745265663D22617070726F76655461736B223E3C2F73657175656E6365466C6F773E0A202020203C757365725461736B2069643D22617070726F76655461736B22206E616D653D22E7BB8FE79086E5AEA1E689B9EFBC88E689B9E58786E68896E9A9B3E59B9EEFBC892220666C6F7761626C653A63616E64696461746547726F7570733D226D616E6167657273223E3C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D2273657175656E6365466C6F772D33663961613636622D306337332D343033352D383136622D3634313663383033643034362220736F757263655265663D22617070726F76655461736B22207461726765745265663D226465636973696F6E223E3C2F73657175656E6365466C6F773E0A202020203C6578636C7573697665476174657761792069643D226465636973696F6E223E3C2F6578636C7573697665476174657761793E0A202020203C736572766963655461736B2069643D2273656E64417070726F7665644D61696C22206E616D653D22E58F91E98081E689B9E58786E982AEE4BBB6E9809AE79FA5E794B3E8AFB7E4BABA2220666C6F7761626C653A636C6173733D22636F6D2E67696F6F762E6E696D726F642E666C6F7761626C652E64656C65676174652E6C656176654170706C69636174696F6E44656C6567617465223E3C2F736572766963655461736B3E0A202020203C73657175656E6365466C6F772069643D2273657175656E6365466C6F772D63633630303962332D643735392D343763342D623165302D3364363734333062656537322220736F757263655265663D2273656E64417070726F7665644D61696C22207461726765745265663D22617070726F7665645461736B223E3C2F73657175656E6365466C6F773E0A202020203C757365725461736B2069643D22617070726F7665645461736B22206E616D653D22E5AEA1E689B9E9809AE8BF872220666C6F7761626C653A61737369676E65653D22247B61737369676E65657D223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C65746520786D6C6E733A6D6F64656C65723D22687474703A2F2F666C6F7761626C652E6F72672F6D6F64656C6572223E3C215B43444154415B66616C73655D5D3E3C2F6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C6574653E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D2273657175656E6365466C6F772D36633434366465652D336131642D343263652D623736652D3435366535613334343262652220736F757263655265663D22617070726F7665645461736B22207461726765745265663D22617070726F7665456E64223E3C2F73657175656E6365466C6F773E0A202020203C736572766963655461736B2069643D2273656E6452656A656374696F6E4D61696C22206E616D653D22E58F91E98081E9A9B3E59B9EE982AEE4BBB6E9809AE79FA5E794B3E8AFB7E4BABA2220666C6F7761626C653A636C6173733D22636F6D2E67696F6F762E6E696D726F642E666C6F7761626C652E64656C65676174652E6C656176654170706C69636174696F6E44656C6567617465223E3C2F736572766963655461736B3E0A202020203C73657175656E6365466C6F772069643D2273657175656E6365466C6F772D38306665613961642D356138382D343837642D393636342D3966643336653734363939652220736F757263655265663D2273656E6452656A656374696F6E4D61696C22207461726765745265663D2272656A656374456E64223E3C2F73657175656E6365466C6F773E0A202020203C656E644576656E742069643D22617070726F7665456E64223E3C2F656E644576656E743E0A202020203C656E644576656E742069643D2272656A656374456E64223E3C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D2273657175656E6365466C6F772D31383535616231382D326162342D343363642D383436322D64636636623633663966303222206E616D653D22E9A9B3E59B9E2220736F757263655265663D226465636973696F6E22207461726765745265663D2273656E6452656A656374696F6E4D61696C223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B21617070726F7665647D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D2273657175656E6365466C6F772D65623964303261612D363736382D343038382D393962392D36396265303036636536356622206E616D653D22E689B9E587862220736F757263655265663D226465636973696F6E22207461726765745265663D2273656E64417070726F7665644D61696C223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B617070726F7665647D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F6C656176654170706C69636174696F6E223E0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D226C656176654170706C69636174696F6E222069643D2242504D4E506C616E655F6C656176654170706C69636174696F6E223E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2273746172744576656E74222069643D2242504D4E53686170655F73746172744576656E74223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D22302E302220793D2239302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22617070726F76655461736B222069643D2242504D4E53686170655F617070726F76655461736B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2236302E30222077696474683D223130302E302220783D2237352E302220793D2237352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226465636973696F6E222069643D2242504D4E53686170655F6465636973696F6E223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223233302E302220793D2238352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2273656E64417070726F7665644D61696C222069643D2242504D4E53686170655F73656E64417070726F7665644D61696C223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2236302E30222077696474683D223130302E302220783D223336302E302220793D2237352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22617070726F7665645461736B222069643D2242504D4E53686170655F617070726F7665645461736B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2236302E30222077696474683D223130302E302220783D223531302E302220793D2237352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2273656E6452656A656374696F6E4D61696C222069643D2242504D4E53686170655F73656E6452656A656374696F6E4D61696C223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2236302E30222077696474683D223130302E302220783D223336302E302220793D223135302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22617070726F7665456E64222069643D2242504D4E53686170655F617070726F7665456E64223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223635302E302220793D2239312E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2272656A656374456E64222069643D2242504D4E53686170655F72656A656374456E64223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223532302E302220793D223136362E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D2273657175656E6365466C6F772D64623465386239322D366538312D343535322D393838632D633939373865623736663338222069643D2242504D4E456467655F73657175656E6365466C6F772D64623465386239322D366538312D343535322D393838632D633939373865623736663338223E0A20202020202020203C6F6D6764693A776179706F696E7420783D2232392E3934393939383438393935373539372220793D223130352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D2237352E302220793D223130352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D2273657175656E6365466C6F772D65623964303261612D363736382D343038382D393962392D363962653030366365363566222069643D2242504D4E456467655F73657175656E6365466C6F772D65623964303261612D363736382D343038382D393962392D363962653030366365363566223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236392E39333936323031383834303336342220793D223130352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223334362E30303030313031373235323630362220793D223130352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223238322E302220793D223130352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223336302E302220793D223130352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D2273657175656E6365466C6F772D33663961613636622D306337332D343033352D383136622D363431366338303364303436222069643D2242504D4E456467655F73657175656E6365466C6F772D33663961613636622D306337332D343033352D383136622D363431366338303364303436223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223137342E393439393939393939393938382220793D223130352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223233302E302220793D223130352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D2273657175656E6365466C6F772D63633630303962332D643735392D343763342D623165302D336436373433306265653732222069643D2242504D4E456467655F73657175656E6365466C6F772D63633630303962332D643735392D343763342D623165302D336436373433306265653732223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435392E39353030303030303030303030352220793D223130352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223531302E302220793D223130352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D2273657175656E6365466C6F772D36633434366465652D336131642D343263652D623736652D343536653561333434326265222069643D2242504D4E456467655F73657175656E6365466C6F772D36633434366465652D336131642D343263652D623736652D343536653561333434326265223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223630392E393439393939393939393730352220793D223130352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223635302E302220793D223130352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D2273657175656E6365466C6F772D31383535616231382D326162342D343363642D383436322D646366366236336639663032222069643D2242504D4E456467655F73657175656E6365466C6F772D31383535616231382D326162342D343363642D383436322D646366366236336639663032223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223235302E302220793D223132342E3933363731373730393732303336223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223235302E302220793D223138302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223336302E302220793D223138302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D2273657175656E6365466C6F772D38306665613961642D356138382D343837642D393636342D396664333665373436393965222069643D2242504D4E456467655F73657175656E6365466C6F772D38306665613961642D356138382D343837642D393636342D396664333665373436393965223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435392E39353030303030303030303030352220793D223138302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223532302E302220793D223138302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E, 0);
INSERT INTO `act_ge_bytearray` VALUES ('3c2c051f-1faa-11e9-a2bc-40a5eff30b04', 1, '/Volumes/office/dev/IdeaProjects/nimrod/src/main/resources/processes/LeaveApplication.leaveApplication.png', '3a44ce8d-1faa-11e9-a2bc-40a5eff30b04', 0x89504E470D0A1A0A0000000D49484452000002B0000000DC080600000088ED92BE0000240A4944415478DAEDDD097454D5E1C771A0B8EFBB566B3D152B6E55AB5654AAF668952A0AB562204442234251F64D141145101495BA1571014104FF209BB2672104D90481844D44760221610F2450D4FB7FBF7BF2A6CFC93693CC4C66C8F773CE3D79992D21DC7BDFEFDD77DF7D356A000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A02A18636A6FD8B061DCC2850B7F4A4D4D35C9C9C9940897949414939191B1CB2909D448D0E750E873A857D42BA01C6AF073E7CE35B9B9B9E6C89123942A2A79797966CE9C39FB9D0EE0516A25E87328F439D42BEA1550061DADD2E0A3A6E11F718E62D7502B419F43A1CFA15E51AF8032E8540B0D2E7A8AD3E88F522B419F43A1CFA15E51AF803268DE0A8D2DAA1ABDA156823E87429F43BDA25E012168F407F7ED301B160F37AB52FADAA26D3D4643A5D103E10A1A3BF61C345DC62CB745DBF411F439ECCBA85740C08D3E7F6FB65939B3B7C99CDAFD17458FE9391A2B8D1E08459F73F8F011B3FB4081EFFB8C3539BE00AB6DF7F1DC7D87CCBEFC02FA0CFA1CF665D42BB03329BD6C5DF565B106EF966DABBEA2B1D2E8814AF7390AAFA3E66D34CF8ECB32B3566C37E9AB7798DE1356FA02ACB6F5F8D465DB4C4FE7356FCE586BF61F24C4D2E7B02FA35E819D492965CDEC574B6DF47A8EC64AA3072ADBE7ECDA7FC83C3336CB1758CB2BDD3ECF345B771DA0DFA0CF615F46BD023B9392CBCAE4174B6DF47A8EC64AA3AF2267F22738B6FA9C69CBB3030EB063176DA6CFA0CF615F46BD023B131A3D8D3EA634708A29FA8A63A4CFD1B40137A076FFBF4C337AFE26B33E679F2DDAD663EEF3D33399B3489FC3BE8C7A05762665145DA9595AA3D77334561A7D84DDEB94BD4E195CF4B5217F92D8EE73B4C2802ED2F2CE795560F57F9D1EF3CE89D57B589D803E877D19F50AEC4C4A2CEBE6BD5B6AA3D77334561A7D1584D7869E91D83C426C6CF739254D11D0A8ABFFEBF45849AFA5EFA0CF615F46BD023B9362657776965939AB4FF1532ECE637A8EC64AA3AFA2F05ADEE320C05208B0ECCBA857A8AE015665E39291C51ABD1EA3A1D2E823A4413921D57D9E39B131D8E73085803E877D19F50A0132C69C989595D566C4881173060E1CB8BF43870E475BB66C699A366D6A1212127E6EDBB6ED915EBD7A6D78F5D5574739E5CA6A1D600F1F36EBE60F297ECAC5794CCFD15869F4110AAFE58553466263BCCF495F9D13F0455C7A2D7D067D0EFB32EA55B8346FDEFC92B8B8B8764E2E1CE794754EC95746744AA153363ACF4D74BE76D3EB22165CC78F1F3FF2E5975F3EDAA953273374E850B370E142939D9D6D0A0B0B8DE86B6E6EAEF9F6DB6F8D13704DC78E1D7FEEDCB9F3A6D6AD5BB7AA6E01567727F97EDE3BA5CE1BD273DCC184461F46F70639B21AECEB11457DCE8CACC097D19AB26C1B7D067D0EFB32EA55C8356BD6ACB153929D72A428B00652663BAF4F08DB2FE504D5A47EFDFA1DEEDEBDBB0DA73FFEF8A309D4F2E5CB4DCF9E3D7F6CD3A6CD9A264D9AD439E67726CED1E88E756966C58CE74A6DF06ED16BF45A8E60D9998429BC36ACC0FBF209B1B1D5E7E84606BA0B57A001B6C7D84C7B4B59FA0DFA1CF665D4AB507042E8654E089D1144682DA9CC0D694674F267EDC99327A7FDEB5FFF325F7DF55550C1D5DF8C19334C525252C1B1321A5B52A32FEF489523581A7D1487D750BD1F110E1A870A0E9B2169EBEC3481894BB698D9AB738ADD4A56EBC4EA76B20ABAC332D69B4282067D0EFB32EA5508C4C5C5358D8F8FDFE30DA3CD9B373703060C3069696966CB962DE6C0810336071E3A74C89EB59F376F9E193C78B079FCF1C7FD436C7E484663155ED3D3D3BF69DFBEBDF9FEFBEF4D286CDAB4C93861B8A055AB564F1F8B8D3E9023D5B28E6069BCEC4C2AA9BC0BB622FD3988D0A95E85D89CBDFFBB284B1769B90156DBEEE37B0E14105EE973D89751AF42155E1B3A81F3476F701D356A949D4A1A88BD7BF7DAD7EB7DDE20EB7C66E5063A35F2AAF01AE82F12287D5EEBD6ADF3C33AE7A18A1A7D451BBC5B68BCEC4C42103A4375FA9F91D8180AB025AD4EE00658561BA0CF615F46BD0AC7C8AB37BC76E9D2C58EB65684DEA729AA7E21B6621951735E356D205423AF258DC4B668D162AFF30BD6AD0E3B130A8D3E42D306DCF05AD32989455F83E1FF3E2EECA2CFA1B00A01857AF50B9AF3EA9D36D0A74F1FDF34818AD2F482FEFDFBFB4F27082E236AB581BE7DFB1ED19CD7709A3A756A41F3E6CD17D0E829EC4C423A52AAF0F9B19A72D1D740436C69EF23C4D2E75008B014EA958F135E53BC23AF950DAFDE10EB37123B37A85F6CE2C4899FE903FEFBDFFF9A707BEAA9A77262752A018D9E461F85E1B546D108AAF1944042AC37BCBAA54509D313984E409F4321C052AA71BDD25259DE39AF159D3650D67402EF9CD88033A2465FB5CEAB96CA8A84CCCCCC23B13A0A4BA3A7D157B1D242654961B4AC105BD2EB3F2AE1F5CC89A5CFA110602904D864375CEA02AC701833664CF0A3B0BAC3962EDCAACC7259C14A4A4ACAD17C8A68FACF714A7D1A3D8D3E5AEA5A19E1B54110A1B4A4101B6878ADC17402FA1C4AEC050DEA15F52A94F54577CE722FDCD228E9EEDDBBC3920BB53A81DF125BE56744DD1EF6A38F3E32913478F0E0E5BAA558B4347ACFB075725C5C5C3D1A3D8DBEAAEB5A054364792136D8F0EAFDF9798CC4D2E7D0E744779F43BDA25E85BABE14DD1ED6BEEEB5D75E0B7736F406D8F233E2C08103F7EBF6B091347FFEFC4DCE2FF755B4357A4F995ED251098D9E461FA9BA5689D3F8A585D85A150CAFE54D5F007D0E7D0EF58A12C301B6ACFAE23C36CE7D3E3D3D3DACD950373BF0FC2EE567C40E1D3A1CDDB1634744036C4E4E4EAEF3CB6D8DE246EF3B2AF1FE67D2E869F491AA6B150CAF6585D8B59508AF95FD7D409F439F43BDA2447F802D565F9CEFD7B98F87FAE22D7FBA6397E7F7283F23B66CD9D21416164634C0EAE739BF5C61B4377AEF518986D769F434FA48D5B5108C789614622B135E839DCE00FA1CFA1CEA15250603ACB7BE38A5C0FD3E544B6795B5A496E7671706F40FA80A01FCE1A2AE44AAD16B9274383F5F47513367CE2CF5F99C9C1CB36CD932BBBD6BD72E5B69B5AD3BAA1D3C183D77F889C53A144879E49147DCA039B892FD53AD12465ED7163D5E19838FD5BF7D75EC73F2F3F36DD1F6AC59B3CC8A152B7CFD907628DED76AF0C1DD2E282830CB972FF73DBE60C18290F423DBB66D331B376EF46DEFDBB78F3E2746F76591D807A91E96F5B30E7B6EA3ECADBFDEB275EBD662F5977A55BC443A1B96BB274A4C4CFC39D223B04E85CB899111D8C5BAEFEFDD77DF5D3B52A75DF47F71C9259798112346D8EF7577346FB0193B76AC7DFCDD77DF350D1A34300F3CF080B9E79E7BECD57B7FF8C31FCCF5D75FEF2BD75C738D59BB76AD2D6FBEF9A69D20ADF2D7BFFED59C78E289E68D37DEF03DA6E7BFFBEE3BFBD95ACEE2B7BFFDADDDBEE1861BCC7FFEF31FBB7DDE79E79969D3A6311A1281BA56A3F2B7892D6B0436989B1D30027B8CF739E3C78F37279F7CB20DB1EA335E79E515FBF8830F3E68EAD5AB6776EEDC69BF5FBD7AB5A953A78E59B46891AFFD9D7EFAE936648E1E3DDA9C71C619BED706D38FAC5BB7CEF65F6E50559F77E38D37DA6DF579CEDF833E2706EB95B7846B1F346EDC3873F3CD379BBCBC3CD3AE5D3B5B8F4F39E5145FD1F775EBD6B5FB557DF6E5975FAE6B708AFD7E43860C31E79C730E23B025D417DD1D2B6A4760DBB76F7F24D27360B76FDFBE36CAE7C0FA878988CD1B9A30618239FBECB3ED51A7BE1F34689079F1C517CD33CF3C638E3FFE78D3A95327FBF8DCB9734D870E1DCC05175C603EF8E00373EFBDF79AAE5DBB9A8E1D3BDA9DCED4A9536D58D1AD8135AAA2F7366BD6CC16ED101A366CE8CE75B1E584134E30D3A74F371B366CB09D8A42F4CA952BED67E9F3F5337FFDEB5F9BD4D454BB93F21F99616712DABAE6098BF9619A035B9110CB1CD863B0CF79E18517CC75D75D6777EC175E78A179FEF9E7EDB6FA0DEDF0870E1D6A77FE1AC96AD5AA950D117A5EB780BCEAAAAB4CAF5EBDECD7DB6FBFDDF4EBD7CFF60DC1F4230AC0BFFBDDEFCC638F3D66B42F52E8505FA63B431E77DC71E6F5D75FB7A145F3E3E87362A75E794BB8F6417BF6EC31F5EBD7B7754F75477544DBAFBEFAAAFD6CD5EBACAC2CDF48EC934F3E69F7AF1F7FFCB179F9E597CD8001036C69D2A4893D0053FDD545EDD538C016AB2F513D07B677EFDEEB22BD0AC1CC9933A745E92A040B74C78952C244D81BBD8E6EFEF8C73FDA11108D4228CCBAA748D4D8353AE29E4A5199346992B9E28A2BECB68E686FBDF55673CB2DB7D846AE9D8182CA0F3FFC601BF0134F3C61B7D7AF5F6F4FDDE839DDBC42DFEB71356C9D0ED4CEE8D4534F35B56AD5327FFEF39F6DE7A11D987EAE3E577F038DCCA8D1B333095F5DABC48867694B6595B40A4130219655088EC13E47456770B4F33EEDB4D36CBDD0577DEF168DB2AA5F70FB22055C8DC66AD4342929C906DA3BEEB8C36E6B9D489DE20DB61FD1E9DBA79E7ACAB468D1C2D4AC59D38EBA5D7DF5D5F6F7D1B6FABE3973E6D0E7C450BDF29670EE83147A1458870F1F6E0FC0CE3AEB2C5F1FA7BA79FEF9E7DBCF77EBAF0679860D1B66FF4E090909B628F4EAC049F577C68C19D531C0965A5FA27A15824183067D14E97560FBF4E93335CAD6812D6B142C628D5ED302D4E874CA433B0ECD45D3FF8D3AEF4B2FBDD436B0BFFFFDEFB6D16B045647AD3AEDF1CE3BEFD800AB86F9F4D34F9B3FFDE94F66E2C489BE00ABCFD688C649279D642EBAE822DBA8F59C1ABBBED7A91C3DEFFE1E9AA6A011116DABF3D06BDD60AC9D8A76283A65C3CE247C75AD82239FE5ADF31AEC1DBB5C37D7601DD863B2CFF196B4B4341B1E35C2A540A951D6254B96F89ED7297E8D78E9EC90E6A82AC4AE59B3C637ED40DBAB56ADD219B60AF5231A69D5CFD748DDA64D9B6C1FF7AB5FFDCA6EEB4C12530862B35EB9251CFB20D5472D80AF6DED2BAFBDF65AF3E5975FDAD7F4ECD9D30E02E9BD9B376FB623B61A85D557BDA777EFDE766A837E8602EDC5175F5C1DA710945B5FA27A1D58E768FAF276EDDAFD14C13B7115C6C7C7AF8FA63B71052ADC8D5E8D4C7371D498352F4DA7D6746A4EA7F874F4A9235585D6F7DE7BCFCC9E3DDB86599D0E51C7AF51141DAD6A24E437BFF98D494C4CF44D21D0673FFBECB3E6FEFBEFB73B24B7517FFDF5D7F67B4D3FD0F3DEB96B0AC6FAB9EA3C743A4793DCD579B8A76AD899445C7923A081DEA420D810EB4E63684CEC3CF6FA1CFF80A1FAA01DB90E9815321428354755CFEBF4AA5B6734DAAA915A77D456A15307DD1A397BEBADB72AD48FA8CFD354297D9E46CDCE3DF75CDFB6FAB9D22EC0A1CF89EE7AE59670EC8374A6529FA3C0AA6901AAB3DA47EAABA61668AA821B607590E5D65F8D08DF79E79DE6CA2BAFB461B6BA06D840E84E5C4E5E3B1A893B71252424FC1CD49DB8A44B972E3F68542F42D30746057C9FDB6AD6E87534A806A50B18741A458D5C8D5141D52D0F3FFCB0FD8FF69F42A006AFA3174D1DD088C8BFFFFD6F3B295E5773BA9D873A047506BAC0CB3DA2D5F77ADCED3CB493AA5DBBB6DD11E9944C49F38FB8A0A2CA9436121BEC1DB6020DB1EECF23BC1EE34143730A355540677934CAA2C7744A5717897A4760758A57F5C55DB54007CF3AE056C874836E45FA11F57D3AF3A4E96C9A0BA9C774F0AD11586D47C39C7B026CE5036CA8F741DABF69E45517302BC0EA9A100DDEA83EDE75D75D769A8B1B60354AAB41207DAF39DDDAD608B0E6DD1260CBA67561DD60396AD4A8B0644365184F780D3C233EF1C4134D9CA3EFA3111885DD1B1F1FBFD4F96324D0E88B179DB65320D5D168EBD6ADED2934354E5D2CA146F7FEFBEFDB6906EECE4301560DD0390031DDBA75B30157E1578F69BB51A346BE09E9EA1CFEF297BF98949414F3C9279FD8CFD3855EFA5E0DDDED3CB474898E54BDA76FFC3B0FBD6FCA9429EC4CAA6E24D6FF747E628DE0D7792D29C4B60862C417C750D0501F72D34D37D9B9890AA4BA4054730975418D7FD0545DD1288CCE04E994F0175F7C61A72EE954B0FA0A9DD60DB61FD1CF57FFA4D1387DBEE63F6AF4D7DDD6574660633FC086631FA4E9066E80D5455BAAC31AC4D15C6D852DFD1C5D7CE45E67E206587DAFAF5A55A36DDBB6F6A231EA55A901B6B11B2E350A1BEA8BB9F4794E36FCD9732385E032629B366DB274D5673869BEAD927590F3FFAA5DA3D7FC328DBEAA61BB8DCCBF03D74E43F380B4B3D1C50FFABF1B3972A4F9E73FFF691FD7B63A09773DC5EEDDBBDBA35385634D33D0E7A933D1F73A5AD5F3A5CD3FD26479CD2B723B0F056A8DCEE8F3EFBBEF3E93999959EA363B93B04E27685042180DE62605A5BD8FA5B2AA519FA3BE44235EBA40433B785D30EA8E8EF9CF3DD541B49ED334018D9A7DF8E187BEE5FF347276E69967DA70114C3FA2915B8DB6A9CF5380D508AC2E04D31C5B8DC06A7BFFFEFDF673E8736237C086631FA439AD9AFAA283279D39B8EDB6DBEC7B347D40237A5AF64DCB71B9173FEB2221FD5C4DC1735747501DD3F417EF1C5C026C714E769BED064C1D70866A492D9D5D71FEF63F7A475F83CE889A6F90949454A00E2B1CB2B2B2263B3F638793ACEBD2E84B2E5AEB4E81540D4C0D55A31A1A59D568AC1ED3B61A99465E7564A946AC2B3075D5A4E68E69D2BAD68655A3D5B61EFBF4D34FED677FF3CD37262323C36E6B69127D9E3B154157F7EA796DEBA22FCD3BD2F2391A61D13C343570CD35D22916751ADAB1A9B3D011AE3E47EF2F6D9B9D49C4A613D42C1A410D76692CFFF75576FD59C4509FA37E444B55E902D01E3D7AD8B9AFBA1046A1D6D989D8B9ADEA53144A5F7AE9251B2EE3E3E36D50D557F5157DFBF6B517C4E8FD1A9DD1E85930FD88E637EA94B2DB4F69C45561547314350AAB6DCDF1D7281C7D4EEC06D870EC833A77EE6CA7BEE8FA0FEDF7DAB76F6FEB9F969F54E87DEEB9E7ECD26F6FBFFDB65DAB58F5D7ADD79A6EA7252AF53AED4BFBF4E963F7B19A7E47802D39233A25CF0D9AFA7B5536C42ABC3A7F7BEFBCD7FC0A67C4848484E66DDAB439A4BB5D84D2B66DDBBE763ABBCDB13A7520528D5EA7E7264F9E6C27ABEB7B9DDAD0A93CADFDEA16ED68DCE5B5DCA2D1573DEE7D9DFB5A9D56F1FF394B972EB5A327EED5C2FEA3313AF25543D6FC36ED5C347FC85D25E1A1871EB281DA9D5BCBE9BCA80AB1E1989E8063B8CFD185A20A861AED5460D45C40EF9D8E749AD69D8AA433426E40D42898FA082D7BA50B651406345F5FB726571F126C3FE24E55509FA7EB007423176FD1EF5515EB731260C35342B50FD25983C58B17DB20A45178F7C63FFFF8C73FECDAAEDAD659490DF2686A82CE20E87374CD8F06881A376E6CE779AB68692EDD3843672FA9572573DA7A53F7822E7724B6A2D309F43EBF915753E98CE81C41273995233F5423B11A79557875FEE13D69F4147626511B62B949017D0E85004BA15E953712DBD21B6275D6456772349A1EE86A039ADEE19DF3AA12B28CA8949D9090B07FD2A449072B7161D75EE7C869B8A60DE81F4CA3A7B033099BCA9EF667DA007D0E85004BA15E059C119DB2D71B40156435AD43A3E21A5D75A71768745C531D35FF5853391213137FF2BBFB577EC833A2E63B380939B54D9B36394B972E2D08669DD759B3668D7102F0624DC68DE539AF347A1A7D0C86D8604750B9608B3E874280A550AF82CE88DEE5B52A58C29B119D1FF0A8826CCB962D73070E1CB8EAEBAFBFDEECA4E91DBAEA540A0A0A72B66FDFBE36252565CA8B2FBE38DD49E11BF44B2951C7EA6A03347A1A7D35994EC0B401FA1C0A019642BDAA54462C0AB2478309AE11CD88BA1B83F34B762ABA2FEE46A71416FD22FABA55F7ADD5ADBF62F10E5B347A1A7D350CB1BA3D2C77D8A2CFA1106029D42B32223B130A8D3E2A34280AA70DCA783E8FF04A9F4321C052A857606742A1D1C7C2482CD306E873280458FE3FA957606742A1D1C74C8825BCD2E750E873A857D42BB033A1D0E86326C40E26BCD2E750E873A857D42BB033A1D0E86345034DA6AFC15259F43914FA1CEA15F50AEC4C2834FA58511460419F43A1CFA15E51AFC0CE8442A327C0823E873E877A45A15E81464FA1D11360419F439F43BDA25E01347A1A3D0196BF027D0E853E877A45BD023B130A8D9E000BFA1CFA1CEA15857A051A3D85464F80057D0E7D0EF58A7A05844C6A6A2A8D2D7A4AA1D3E88F522B09B0F43914FA1CEA15F50A28434646C68EDCDC5C1A5C1494ECECECCF9D46BF865A4980A5CFA1D0E750AFA8574019D2D2D21AA5A7A7EFDBB97367010DAFEA8E56D5E0535252363BE5516A2501963E87429F43BDA25E01E5702A5A43E76869B186FC356F8512F1A2BFFB1A1A3C01963E87429F43BDA25E0100011600000020C0020000000458000000106001000000022C000000408005000000011600000020C0020000000458000000106001000000022C000000408005000000011600000020C00200000004D86AC818537BC3860DE3162E5CF8536A6AAA494E4EA644B8A4A4A4988C8C8C5D4E49A046020040804539145EE7CE9D6B727373CD912347285554F2F2F2CC9C3973F63B61F6516A2500000458944123AF84D7A809B147929393D7502B010020C0A20C9A3640788C9EE204D8A3D44A000008B02883E660121CA32AC0D28E000020C022540176C79E83A6CB98E5B6689BC04980050080008BA80AB0870F1F31BB0F14F8BECF5893E30BB0DA761FCFDD77C8ECCB2F20801260010020C0A2EA02ACC2EBA8791BCDB3E3B2CCAC15DB4DFAEA1DA6F78495BE00AB6D3D3E75D936D3D379CD9B33D69AFD0709B10458000008B0A8A200BB6BFF21F3CCD82C5F602DAF74FB3CD36CDD7580104A80050080008BAA09B02AD39667071C60C72EDA4C0025C00200408045D506584D1B70036AF7FFCB34A3E76F32EB73F6D9A26D3DE63E3F3D339B004A80050080008BAA09B05A6140176979E7BC2AB0FABF4E8F79E7C4EA3DAC4E4080050080008B8807D892A60868D4D5FF757AACA4D7124409B000001060418025C0020000022C4A0BB04C2120C002004080454C05D8FF5DC49513F0455C7A2D0194001B0ECD9B37BF242E2EAE9DD3C78C73CA3AA7E4ABBF714AA153363ACF4D74BE76D3EBF86B010008B0D53CC0CEC80A7C19AD29CBB6114009B021D5AC59B3C64E4976CA91A2C01A4899EDBC3E81BF1E0080005B0D03AC6E64A0BB70051A607B8CCDB4B7942584126043D0975CE684D0194184D692CADC264D9AD4A185030008B0D528C01E2A386C86A4ADB3D304262ED96266AFCE29762B59AD13ABDBC92AE80ECB586F0A0F1F268412602B252E2EAE697C7CFC1E6F186DDEBCB919306080494B4B335BB66C31070E1C3072E8D021939D9D6DE6CD9B67060F1E6C1E7FFC71FF109BCF682C0080005B8D02AC1B6273F6FEEFA22C5DA4E506586DBB8FEF3950407825C08622BC367402E78FDEE03A6AD428939B9B6B02B177EF5EFB7ABDCF1B649DCF6C454B07001060AB49802D69750237C0B2DA000136C4E1B5A937BC76E9D2C58EB65684DED7BD7B77FF10CB482C0080005B1D032C85001BA6BEE332EFB4813E7DFAF8A6095494A617F4EFDFDF7F3A415D5A3C0080004B80A510602BCD09AF29DE91D7CA86576F88F51B899D4B8B0700106009B014026CA568A92CEF9CD78A4E1B286B3A81774E2C530900000458022C85005BD9009BEC864B5D80150E63C68C6114160040808D9560E094FA0458026CB4D63FDD39CBBD704BA3A4BB77EF0E4B80D5EA047E4B6C5D460F010020C046E9FF47D129D3E4B8B8B87A0458026CB4D5BFA2DBC3DAD7BDF6DA6B269CB44EAC27C076A38700001060A3384078CAF49246C408B004D8AAAA7FCE63E3DCE7D3D3D3C31A6075B303CFEFF2153D040080001B1B01C23722E60D120458026C55D53FE7FB75EEE3A1BE78CB9FEED8E5F93DB6D243000008B0311420BC23623AB54B8025C05655FD734A81FB7DA896CE2A6B492DCFCF2EA487000004BAC3A24461894480CDCFCFB745DBB366CD322B56ACB0DBBA6847C1C2FBDAC2C242DF7641418159BE7CB9EFF1050B1604F573F7EFDF1F7301B6BAD6C348F0FE3C7A6C000062EB8062B1EE397FF7DD77D7D6EB221160C78F1F6F4E3EF9641B62AFB9E61AF3CA2BAFD8C71F7CF04153AF5E3DB373E74EFBFDEAD5AB4D9D3A75CCA2458B7CA391A79F7EBAD9B66D9B193D7AB439E38C337CAFD567D6AD5BD75C75D555B6B46FDFDE7CFAE9A7E685175EB0579D0F1D3AD4FCFEF7BFB7237B6BD7AE35B7DD769BB9EBAEBB4A2D7ADE0DCB8CC046A6FEE9EE588CC0020080B202C42F82AB2B120156A1F2BAEBAE33F3E7CF37175E78A179FEF9E7EDB646632FBFFC721B36BFFBEE3B73F8F061D3AA552B73DE79E7D9E7752B5085D35EBD7AD9AFB7DF7EBBE9D7AF9F0D23393939F67DD3A74FB7FFBE6EDDBA99A54B979AFBEFBFDF5C7CF1C5E694534E31D3A64DB33FFFFBEFBF5728346FBFFDB619316244B13264C810FBFCB265CB08B011AC7FCC81050000A5058805BADB917F708D6480BDE79E7BECE8E969A79D6683A2BEEA7BB768945521D59D36A080ABD158ADDD9994946403ED1D77DC61B7B55EE8C18307ED6BEBD7AF6F3EFBEC33F3F0C30F9BB7DE7ACBAC5BB7CEC4C7C79BB3CF3EDB9C73CE39263131D14E53F8E1871FECCFDDBA75AB993061820DAC6ED1486E5E5E9E7D9E11D8C8D63F5621000000FEE1A0C411D7AA08B06E494B4B33356BD634A9A9A9763EAB4659972C59E27B7EDFBE7D66CF9E3D66D7AE5D66E3C68D36C4AE59B3C637ED40DBAB56AD32DBB76FB7AFBFE28A2B4C464686B9E9A69B6C80D53485468D1AD9F72ACC2A382B947A036CC3860DCDF5D75FAFABE1EDD7BFFDED6F04D82AAA7FAC030B00002A249201B66BD7AE3628EA14FFA5975E6A475615681536F5BCA607E879158DB66AA4D61DB53DFEF8E3ED68EDA9A79E6AC3AA5EAFEF274F9E6C3F67E4C891769EEC238F3C629FD3E86ACF9E3DEDB637C03EF4D043766A821ED7D7071E7880005B4574272E274C1E8DC49DB81212127EE64E5C00001060832ABAF84A5305344AAAD1363DF6E4934FDA00E91D815588549874572D78FDF5D7CD89279E68CE3FFF7C5FD05551E8D49C58158DA42AC46A1EA582EEA44993EC055E03070E2C31C06ABEAC3E4B5F09B0554BEBC2BAC172D4A8516109B063C68CF18EBECEA5D5030040800DA874E9D2C59EEA9F3973A60DA41D3A7430679D7596D9B061C32F5EA715031426351AF7DE7BEF99934E3AC97CF1C517E6E9A79F36175D7491F9E0830FEC3403BD56AB13E8222CCD9FBDFAEAAB7D3FE7820B2E30E79E7BAE6FC5026F806DD2A4890DBB0AC4FADAB87163026CD506D8C66EB8D4286CA82FE6D2E7C5C7C7FFECB9914202AD1E0000026CB94501B476EDDAF6421D2D97A479A80A8CB7DC728B5D21C0FBDAF7DF7FDF3EA76902BA10EBC30F3FF4AD03AB2906679E79A6993A75AAE9DCB9B3A955AB96B9F9E69B4DDBB66DED52587A9D46DBF4FE1B6EB8C1065CFF005BD2EFE70DB09F7CF289B9EFBEFB4C666666A9DB04D8D07282E56C3760EA0024544B6A69B58AAE5DBBFEE81D7D2D6F4E38000020C0DAD3C2C71D779CE9D8B1A3E9D1A3879DFB7AEDB5D7DA50EB84097BCABF4183063694BEF4D24BE684134EB02B0928A8EAAB96E0EADBB7AFE9DDBBB77DBF46E9DC0BBA74319742B12EC87AECB1C7EC578DD8BEF1C61BF6B335C2AA515C7719AD1B6FBCD1DC7AEBADC58A4686DD00AB1510B43D67CE9C52B709B0210FB0973925CF0D9A7DFAF4A974885578EDDFBFBF77DE6BBE533FEAD2E2010020C0965B340AAAD3FE5A51E0CE3BEF34C3860DF32D83A53265CA14BB72C0C2850B4D4A4A8A2F206AA502CD516DD1A285898B8BF305D4962D5BDAF0EB5DA24BA3B05A53566BC0BAD300B41CD7A04183EC1483952B57DA303B7CF870BB6C967F51C8D6F3DF7EFB2D5308AA88F37FDCD4BDA0CB1D89ADE87402BDCF6FE495A903000010602904D8D07382664B6F88D568BB0E2EB48A40A0AB0D680A8977CEAB8A138E7BD2D2010020C05208B061A19158A7ECF506500559AD5CA1E9221A5D75A717689A80EEB0A59B14E82E6B8989893FF9DDFD4BB7AA6D492B070080004B21C08695E6C47A97D7AA6099CB9C57000008B014026CA483ECA34541F66830C155A3AEAC3600000001964280AD32BA639713643B39C1749C53363AA5B028ACEAEB56A77CA5DBC372872D000008B014022C0000000196428005000020C0126001000008B014022C0000000196428005000020C0126001000008B014022C0000000196428005000020C0126001000008B014022C00000001964280050000088DD4D4548263F4944227C01EA5560200009421232363476E6E2EE1310A4A7676F6E74E805D43AD04000028435A5A5AA3F4F4F47D3B77EE2C204456DDC8ABC26B4A4ACA66A73C4AAD0400002887139A1A2627272FD6E96BCDC1A444BCE8EFBE86F00A00000000000000000000000000000000000000000000000000000000000000000000000044A9FF07A98FE83161DAD1FE0000000049454E44AE426082, 1);

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('cfg.task-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('common.schema.version', '6.4.1.3', 1);
INSERT INTO `act_ge_property` VALUES ('entitylink.schema.version', '6.4.1.3', 1);
INSERT INTO `act_ge_property` VALUES ('identitylink.schema.version', '6.4.1.3', 1);
INSERT INTO `act_ge_property` VALUES ('job.schema.version', '6.4.1.3', 1);
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', 1);
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.4.1.3)', 1);
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.4.1.3', 1);
INSERT INTO `act_ge_property` VALUES ('task.schema.version', '6.4.1.3', 1);
INSERT INTO `act_ge_property` VALUES ('variable.schema.version', '6.4.1.3', 1);

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_PROCINST`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_EXEC`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------
INSERT INTO `act_hi_actinst` VALUES ('285c3147-1fab-11e9-a2bc-40a5eff30b04', 1, 'leaveApplication:6:3c2d8bc0-1faa-11e9-a2bc-40a5eff30b04', '285b9501-1fab-11e9-a2bc-40a5eff30b04', '285c3146-1fab-11e9-a2bc-40a5eff30b04', 'startEvent', NULL, NULL, NULL, 'startEvent', NULL, '2019-01-24 07:39:18.851', '2019-01-24 07:39:18.855', 4, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('285cf498-1fab-11e9-a2bc-40a5eff30b04', 1, 'leaveApplication:6:3c2d8bc0-1faa-11e9-a2bc-40a5eff30b04', '285b9501-1fab-11e9-a2bc-40a5eff30b04', '285c3146-1fab-11e9-a2bc-40a5eff30b04', 'sequenceFlow-db4e8b92-6e81-4552-988c-c9978eb76f38', NULL, NULL, NULL, 'sequenceFlow', NULL, '2019-01-24 07:39:18.856', '2019-01-24 07:39:18.856', 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('285cf499-1fab-11e9-a2bc-40a5eff30b04', 1, 'leaveApplication:6:3c2d8bc0-1faa-11e9-a2bc-40a5eff30b04', '285b9501-1fab-11e9-a2bc-40a5eff30b04', '285c3146-1fab-11e9-a2bc-40a5eff30b04', 'approveTask', '2860770a-1fab-11e9-a2bc-40a5eff30b04', NULL, '经理审批（批准或驳回）', 'userTask', NULL, '2019-01-24 07:39:18.856', NULL, NULL, NULL, '');

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `FULL_MSG_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_ACT_INST`(`ACT_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TIME`(`TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_NAME`(`NAME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TASK_ID`(`TASK_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_entitylink`;
CREATE TABLE `act_hi_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------
INSERT INTO `act_hi_identitylink` VALUES ('285bbc12-1fab-11e9-a2bc-40a5eff30b04', NULL, 'starter', 'system_admin', NULL, '2019-01-24 07:39:18.848', '285b9501-1fab-11e9-a2bc-40a5eff30b04', NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('28609e1b-1fab-11e9-a2bc-40a5eff30b04', 'managers', 'candidate', NULL, '2860770a-1fab-11e9-a2bc-40a5eff30b04', '2019-01-24 07:39:18.880', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `PROC_INST_ID_`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_I_BUSKEY`(`BUSINESS_KEY_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------
INSERT INTO `act_hi_procinst` VALUES ('285b9501-1fab-11e9-a2bc-40a5eff30b04', 1, '285b9501-1fab-11e9-a2bc-40a5eff30b04', NULL, 'leaveApplication:6:3c2d8bc0-1faa-11e9-a2bc-40a5eff30b04', '2019-01-24 07:39:18.847', NULL, NULL, 'system_admin', 'startEvent', NULL, NULL, NULL, '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_INST_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------
INSERT INTO `act_hi_taskinst` VALUES ('2860770a-1fab-11e9-a2bc-40a5eff30b04', 1, 'leaveApplication:6:3c2d8bc0-1faa-11e9-a2bc-40a5eff30b04', NULL, 'approveTask', '285b9501-1fab-11e9-a2bc-40a5eff30b04', '285c3146-1fab-11e9-a2bc-40a5eff30b04', NULL, NULL, NULL, NULL, '经理审批（批准或驳回）', NULL, NULL, NULL, NULL, '2019-01-24 07:39:18.856', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2019-01-24 07:39:18.880');

-- ----------------------------
-- Table structure for act_hi_tsk_log
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_tsk_log`;
CREATE TABLE `act_hi_tsk_log`  (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE`(`NAME_`, `VAR_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_EXE`(`EXECUTION_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------
INSERT INTO `act_hi_varinst` VALUES ('285c0a33-1fab-11e9-a2bc-40a5eff30b04', 0, '285b9501-1fab-11e9-a2bc-40a5eff30b04', '285b9501-1fab-11e9-a2bc-40a5eff30b04', NULL, 'description', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '事假', NULL, '2019-01-24 07:39:18.850', '2019-01-24 07:39:18.850');
INSERT INTO `act_hi_varinst` VALUES ('285c0a34-1fab-11e9-a2bc-40a5eff30b04', 0, '285b9501-1fab-11e9-a2bc-40a5eff30b04', '285b9501-1fab-11e9-a2bc-40a5eff30b04', NULL, 'assignee', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'godcheese', NULL, '2019-01-24 07:39:18.850', '2019-01-24 07:39:18.850');
INSERT INTO `act_hi_varinst` VALUES ('285c3145-1fab-11e9-a2bc-40a5eff30b04', 0, '285b9501-1fab-11e9-a2bc-40a5eff30b04', '285b9501-1fab-11e9-a2bc-40a5eff30b04', NULL, 'day', 'integer', NULL, NULL, NULL, NULL, NULL, 2, '2', NULL, '2019-01-24 07:39:18.851', '2019-01-24 07:39:18.851');

-- ----------------------------
-- Table structure for act_id_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_id_bytearray`;
CREATE TABLE `act_id_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PASSWORD_` longblob NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership`  (
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE,
  INDEX `ACT_FK_MEMB_GROUP`(`GROUP_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_priv
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv`;
CREATE TABLE `act_id_priv`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PRIV_NAME`(`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_priv_mapping
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv_mapping`;
CREATE TABLE `act_id_priv_mapping`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_PRIV_MAPPING`(`PRIV_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_GROUP`(`GROUP_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_property
-- ----------------------------
DROP TABLE IF EXISTS `act_id_property`;
CREATE TABLE `act_id_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_property
-- ----------------------------
INSERT INTO `act_id_property` VALUES ('schema.version', '6.4.1.3', 1);

-- ----------------------------
-- Table structure for act_id_token
-- ----------------------------
DROP TABLE IF EXISTS `act_id_token`;
CREATE TABLE `act_id_token`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `IP_ADDRESS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_AGENT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `FIRST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LAST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EMAIL_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PWD_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_INFO_JSON_BA`(`INFO_JSON_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------
INSERT INTO `act_re_deployment` VALUES ('3a44ce8d-1faa-11e9-a2bc-40a5eff30b04', 'SpringBootAutoDeployment', NULL, NULL, '', '2019-01-24 07:32:39.371', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE`(`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE_EXTRA`(`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_DEPLOYMENT`(`DEPLOYMENT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PROCDEF`(`KEY_`, `VERSION_`, `DERIVED_VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------
INSERT INTO `act_re_procdef` VALUES ('leaveApplication:6:3c2d8bc0-1faa-11e9-a2bc-40a5eff30b04', 1, 'http://www.flowable.org/processdef', '请假申请流程', 'leaveApplication', 6, '3a44ce8d-1faa-11e9-a2bc-40a5eff30b04', '/Volumes/office/dev/IdeaProjects/nimrod/src/main/resources/processes/LeaveApplication.bpmn20.xml', '/Volumes/office/dev/IdeaProjects/nimrod/src/main/resources/processes/LeaveApplication.leaveApplication.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for act_ru_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_actinst`;
CREATE TABLE `act_ru_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC_ACT`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC_ACT`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_actinst
-- ----------------------------
INSERT INTO `act_ru_actinst` VALUES ('285c3147-1fab-11e9-a2bc-40a5eff30b04', 1, 'leaveApplication:6:3c2d8bc0-1faa-11e9-a2bc-40a5eff30b04', '285b9501-1fab-11e9-a2bc-40a5eff30b04', '285c3146-1fab-11e9-a2bc-40a5eff30b04', 'startEvent', NULL, NULL, NULL, 'startEvent', NULL, '2019-01-24 07:39:18.851', '2019-01-24 07:39:18.855', 4, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('285cf498-1fab-11e9-a2bc-40a5eff30b04', 1, 'leaveApplication:6:3c2d8bc0-1faa-11e9-a2bc-40a5eff30b04', '285b9501-1fab-11e9-a2bc-40a5eff30b04', '285c3146-1fab-11e9-a2bc-40a5eff30b04', 'sequenceFlow-db4e8b92-6e81-4552-988c-c9978eb76f38', NULL, NULL, NULL, 'sequenceFlow', NULL, '2019-01-24 07:39:18.856', '2019-01-24 07:39:18.856', 0, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('285cf499-1fab-11e9-a2bc-40a5eff30b04', 1, 'leaveApplication:6:3c2d8bc0-1faa-11e9-a2bc-40a5eff30b04', '285b9501-1fab-11e9-a2bc-40a5eff30b04', '285c3146-1fab-11e9-a2bc-40a5eff30b04', 'approveTask', '2860770a-1fab-11e9-a2bc-40a5eff30b04', NULL, '经理审批（批准或驳回）', 'userTask', NULL, '2019-01-24 07:39:18.856', NULL, NULL, NULL, '');

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_entitylink`;
CREATE TABLE `act_ru_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_`(`CONFIGURATION_`) USING BTREE,
  INDEX `ACT_FK_EVENT_EXEC`(`EXECUTION_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) NULL DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) NULL DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) NULL DEFAULT NULL,
  `TASK_COUNT_` int(11) NULL DEFAULT NULL,
  `JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_BUSKEY`(`BUSINESS_KEY_`) USING BTREE,
  INDEX `ACT_IDC_EXEC_ROOT`(`ROOT_PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PARENT`(`PARENT_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_SUPER`(`SUPER_EXEC_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCDEF`(`PROC_DEF_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------
INSERT INTO `act_ru_execution` VALUES ('285b9501-1fab-11e9-a2bc-40a5eff30b04', 1, '285b9501-1fab-11e9-a2bc-40a5eff30b04', NULL, NULL, 'leaveApplication:6:3c2d8bc0-1faa-11e9-a2bc-40a5eff30b04', NULL, '285b9501-1fab-11e9-a2bc-40a5eff30b04', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'startEvent', '2019-01-24 07:39:18.847', 'system_admin', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('285c3146-1fab-11e9-a2bc-40a5eff30b04', 1, '285b9501-1fab-11e9-a2bc-40a5eff30b04', NULL, '285b9501-1fab-11e9-a2bc-40a5eff30b04', 'leaveApplication:6:3c2d8bc0-1faa-11e9-a2bc-40a5eff30b04', NULL, '285b9501-1fab-11e9-a2bc-40a5eff30b04', 'approveTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2019-01-24 07:39:18.851', NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for act_ru_history_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_history_job`;
CREATE TABLE `act_ru_history_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_GROUP`(`GROUP_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ATHRZ_PROCEDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_TSKASS_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_IDL_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------
INSERT INTO `act_ru_identitylink` VALUES ('285bbc12-1fab-11e9-a2bc-40a5eff30b04', 1, NULL, 'starter', 'system_admin', NULL, '285b9501-1fab-11e9-a2bc-40a5eff30b04', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('28609e1b-1fab-11e9-a2bc-40a5eff30b04', 1, 'managers', 'candidate', NULL, '2860770a-1fab-11e9-a2bc-40a5eff30b04', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TASK_CREATE`(`CREATE_TIME_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TASK_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCDEF`(`PROC_DEF_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------
INSERT INTO `act_ru_task` VALUES ('2860770a-1fab-11e9-a2bc-40a5eff30b04', 1, '285c3146-1fab-11e9-a2bc-40a5eff30b04', '285b9501-1fab-11e9-a2bc-40a5eff30b04', 'leaveApplication:6:3c2d8bc0-1faa-11e9-a2bc-40a5eff30b04', NULL, NULL, NULL, NULL, NULL, '经理审批（批准或驳回）', NULL, NULL, 'approveTask', NULL, NULL, NULL, 50, '2019-01-24 07:39:18.856', NULL, NULL, 1, '', NULL, NULL, 1, 0, 1, 0);

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_VAR_BYTEARRAY`(`BYTEARRAY_ID_`) USING BTREE,
  INDEX `ACT_IDX_VARIABLE_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------
INSERT INTO `act_ru_variable` VALUES ('285c0a33-1fab-11e9-a2bc-40a5eff30b04', 1, 'string', 'description', '285b9501-1fab-11e9-a2bc-40a5eff30b04', '285b9501-1fab-11e9-a2bc-40a5eff30b04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '事假', NULL);
INSERT INTO `act_ru_variable` VALUES ('285c0a34-1fab-11e9-a2bc-40a5eff30b04', 1, 'string', 'assignee', '285b9501-1fab-11e9-a2bc-40a5eff30b04', '285b9501-1fab-11e9-a2bc-40a5eff30b04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'godcheese', NULL);
INSERT INTO `act_ru_variable` VALUES ('285c3145-1fab-11e9-a2bc-40a5eff30b04', 1, 'integer', 'day', '285b9501-1fab-11e9-a2bc-40a5eff30b04', '285b9501-1fab-11e9-a2bc-40a5eff30b04', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2', NULL);

-- ----------------------------
-- Table structure for api
-- ----------------------------
DROP TABLE IF EXISTS `api`;
CREATE TABLE `api`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'API 名称',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求地址（url）',
  `authority` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限（authority）',
  `api_category_id` bigint(20) UNSIGNED NOT NULL COMMENT 'API 分类 id',
  `sort` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_authority`(`authority`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'API 表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api
-- ----------------------------
INSERT INTO `api` VALUES (1, '分页获取所有父级 API 分类', '/api/system/api_category/page_all_parent', '/API/SYSTEM/API_CATEGORY/PAGE_ALL_PARENT', 4, 0, '', '2018-06-20 12:56:39', '2018-06-20 12:56:39');
INSERT INTO `api` VALUES (2, '指定父级 API 分类 id ，获取所有 API 分类分类', '/api/system/api_category/list_all_by_parent_id', '/API/SYSTEM/API_CATEGORY/LIST_ALL_BY_PARENT_ID', 4, 0, '', '2018-11-19 09:00:05', '2018-06-20 12:57:36');
INSERT INTO `api` VALUES (3, '新增 API 分类', '/api/system/api_category/add_one', '/API/SYSTEM/API_CATEGORY/ADD_ONE', 4, 0, '', '2018-06-20 12:58:15', '2018-06-20 12:58:15');
INSERT INTO `api` VALUES (4, '保存 API 分类', '/api/system/api_category/save_one', '/API/SYSTEM/API_CATEGORY/SAVE_ONE', 4, 0, '', '2018-06-20 12:58:43', '2018-06-20 12:58:43');
INSERT INTO `api` VALUES (5, '指定 API 分类 id ，批量删除 API 分类', '/api/system/api_category/delete_all', '/API/SYSTEM/API_CATEGORY/DELETE_ALL', 4, 0, '', '2018-06-20 12:59:32', '2018-06-20 12:59:18');
INSERT INTO `api` VALUES (6, '指定 API 分类 id ，获取 API 分类信息', '/api/system/api_category/one', '/API/SYSTEM/API_CATEGORY/ONE', 4, 0, '', '2018-06-20 13:00:35', '2018-06-20 13:00:35');
INSERT INTO `api` VALUES (7, '指定 API 分类 id ，分页获取所有 API', '/api/system/api/page_all_by_api_category_id', '/API/SYSTEM/API/PAGE_ALL_BY_API_CATEGORY_ID', 5, 0, '', '2018-06-20 13:01:16', '2018-06-20 13:01:16');
INSERT INTO `api` VALUES (8, '新增 API', '/api/system/api/add_one', '/API/SYSTEM/API/ADD_ONE', 5, 0, '', '2018-06-20 13:01:45', '2018-06-20 13:01:45');
INSERT INTO `api` VALUES (9, '保存 API', '/api/system/api/save_one', '/API/SYSTEM/API/SAVE_ONE', 5, 0, '', '2018-06-20 13:02:03', '2018-06-20 13:02:03');
INSERT INTO `api` VALUES (10, '指定 API id ，批量删除 API', '/api/system/api/delete_all', '/API/SYSTEM/API/DELETE_ALL', 5, 0, '', '2018-06-20 13:02:22', '2018-06-20 13:02:22');
INSERT INTO `api` VALUES (11, '指定 API id ， 获取 API 信息', '/api/system/api/one', '/API/SYSTEM/API/ONE', 5, 0, '', '2018-06-20 13:02:40', '2018-06-20 13:02:40');
INSERT INTO `api` VALUES (12, '分页获取所有父级数据字典分类', '/api/system/dictionary_category/page_all_parent', '/API/SYSTEM/DICTIONARY_CATEGORY/PAGE_ALL_PARENT', 6, 0, '', '2018-06-20 13:04:25', '2018-06-20 13:04:25');
INSERT INTO `api` VALUES (13, '指定父级数据字典分类 id ，获取所有数据字典分类', '/api/system/dictionary_category/list_all_by_parent_id', '/API/SYSTEM/DICTIONARY_CATEGORY/LIST_ALL_BY_PARENT_ID', 6, 0, '', '2018-06-20 13:04:43', '2018-06-20 13:04:43');
INSERT INTO `api` VALUES (14, '新增数据字典分类', '/api/system/dictionary_category/add_one', '/API/SYSTEM/DICTIONARY_CATEGORY/ADD_ONE', 6, 0, '', '2018-06-20 13:05:26', '2018-06-20 13:05:02');
INSERT INTO `api` VALUES (15, '保存数据字典分类', '/api/system/dictionary_category/save_one', '/API/SYSTEM/DICTIONARY_CATEGORY/SAVE_ONE', 6, 0, '', '2018-06-20 13:05:19', '2018-06-20 13:05:19');
INSERT INTO `api` VALUES (16, '指定数据字典分类 id ，批量删除数据字典分类', '/api/system/dictionary_category/delete_all', '/API/SYSTEM/DICTIONARY_CATEGORY/DELETE_ALL', 6, 0, '', '2018-06-20 13:05:44', '2018-06-20 13:05:44');
INSERT INTO `api` VALUES (17, '指定数据字典分类 id ，获取数据字典分类信息', '/api/system/dictionary_category/one', '/API/SYSTEM/DICTIONARY_CATEGORY/ONE', 6, 0, '', '2018-06-20 13:06:00', '2018-06-20 13:06:00');
INSERT INTO `api` VALUES (18, '指定父级数据字典分类 id ，获取所有数据字典', '/api/system/dictionary/page_all_by_dictionary_category_id', '/API/SYSTEM/DICTIONARY/PAGE_ALL_BY_DICTIONARY_CATEGORY_ID', 7, 0, '', '2018-06-20 13:06:49', '2018-06-20 13:06:49');
INSERT INTO `api` VALUES (19, '新增数据字典', '/api/system/dictionary/add_one', '/API/SYSTEM/DICTIONARY/ADD_ONE', 7, 0, '', '2018-06-20 13:07:27', '2018-06-20 13:07:27');
INSERT INTO `api` VALUES (20, '保存数据字典', '/api/system/dictionary/save_one', '/API/SYSTEM/DICTIONARY/SAVE_ONE', 7, 0, '', '2018-06-20 13:07:45', '2018-06-20 13:07:45');
INSERT INTO `api` VALUES (21, '指定数据字典 id ， 批量删除数据字典', '/api/system/dictionary/delete_all', '/API/SYSTEM/DICTIONARY/DELETE_ALL', 7, 0, '', '2018-06-20 13:08:06', '2018-06-20 13:08:06');
INSERT INTO `api` VALUES (22, '指定数据字典 id ，获取数据字典信息', '/api/system/dictionary/one', '/API/SYSTEM/DICTIONARY/ONE', 7, 0, '', '2018-06-20 13:10:51', '2018-06-20 13:08:54');
INSERT INTO `api` VALUES (23, '获取所有数据字典', '/api/system/dictionary/list_all', '/API/SYSTEM/DICTIONARY/LIST_ALL', 7, 0, '', '2018-06-20 13:11:16', '2018-06-20 13:11:16');
INSERT INTO `api` VALUES (24, '指定数据字典键 ，获取所有数据字典', '/api/system/dictionary/list_all_by_key', '/API/SYSTEM/DICTIONARY/LIST_ALL_BY_KEY', 7, 0, '', '2018-06-20 13:11:55', '2018-06-20 13:11:55');
INSERT INTO `api` VALUES (25, '是否关联 API', '/api/system/view_page_api/is_associated_by_page_id_and_api_id', '/API/SYSTEM/VIEW_PAGE_API/IS_ASSOCIATED_BY_PAGE_ID_AND_API_ID', 8, 0, '', '2018-06-20 14:25:36', '2018-06-20 14:25:36');
INSERT INTO `api` VALUES (26, '批量关联 API', '/api/system/view_page_api/associate_all_by_page_id_and_api_id_list', '/API/SYSTEM/VIEW_PAGE_API/ASSOCIATE_ALL_BY_PAGE_ID_AND_API_ID_LIST', 8, 0, '', '2018-06-20 14:26:00', '2018-06-20 14:26:00');
INSERT INTO `api` VALUES (27, '指定视图页面 id、API id ，批量撤销关联', '/api/system/view_page_api/revoke_associate_all_by_page_id_and_api_id_list', '/API/SYSTEM/VIEW_PAGE_API/REVOKE_ASSOCIATE_ALL_BY_PAGE_ID_AND_API_ID_LIST', 8, 0, '', '2018-06-20 14:26:26', '2018-06-20 14:26:26');
INSERT INTO `api` VALUES (28, '分页获取所有父级视图页面分类', '/api/system/view_page_category/page_all_parent', '/API/SYSTEM/VIEW_PAGE_CATEGORY/PAGE_ALL_PARENT', 9, 0, '', '2018-06-20 14:27:26', '2018-06-20 14:27:26');
INSERT INTO `api` VALUES (29, '指定父级视图页面分类 id ，获取所有视图页面分类', '/api/system/view_page_category/list_all_by_parent_id', '/API/SYSTEM/VIEW_PAGE_CATEGORY/LIST_ALL_BY_PARENT_ID', 9, 0, '', '2018-06-20 14:27:45', '2018-06-20 14:27:45');
INSERT INTO `api` VALUES (30, '新增视图页面分类', '/api/system/view_page_category/add_one', '/API/SYSTEM/VIEW_PAGE_CATEGORY/ADD_ONE', 9, 0, '', '2018-06-20 14:28:02', '2018-06-20 14:28:02');
INSERT INTO `api` VALUES (31, '保存视图页面分类', '/api/system/view_page_category/save_one', '/API/SYSTEM/VIEW_PAGE_CATEGORY/SAVE_ONE', 9, 0, '', '2018-06-20 14:28:17', '2018-06-20 14:28:17');
INSERT INTO `api` VALUES (32, '指定视图页面分类 id ，批量删除视图页面分类', '/api/system/view_page_category/delete_all', '/API/SYSTEM/VIEW_PAGE_CATEGORY/DELETE_ALL', 9, 0, '', '2018-06-20 14:28:36', '2018-06-20 14:28:36');
INSERT INTO `api` VALUES (33, '指定视图页面分类 id ，获取视图页面分类信息', '/api/system/view_page_category/one', '/API/SYSTEM/VIEW_PAGE_CATEGORY/ONE', 9, 0, '', '2018-06-20 14:29:04', '2018-06-20 14:29:04');
INSERT INTO `api` VALUES (34, '指定父级视图页面分类 id ，获取所有视图页面', '/api/system/view_page/page_all_by_page_category_id', '/API/SYSTEM/VIEW_PAGE/PAGE_ALL_BY_PAGE_CATEGORY_ID', 10, 0, '', '2018-06-20 14:38:43', '2018-06-20 14:38:43');
INSERT INTO `api` VALUES (35, '新增视图页面', '/api/system/view_page/add_one', '/API/SYSTEM/VIEW_PAGE/ADD_ONE', 10, 0, '', '2018-06-20 14:39:26', '2018-06-20 14:39:26');
INSERT INTO `api` VALUES (36, '保存视图页面', '/api/system/view_page/save_one', '/API/SYSTEM/VIEW_PAGE/SAVE_ONE', 10, 0, '', '2018-06-20 14:39:53', '2018-06-20 14:39:53');
INSERT INTO `api` VALUES (37, '指定视图页面 id ，批量删除视图页面', '/api/system/view_page/delete_all', '/API/SYSTEM/VIEW_PAGE/DELETE_ALL', 10, 0, '', '2018-06-20 14:40:17', '2018-06-20 14:40:17');
INSERT INTO `api` VALUES (38, '指定视图页面 id ，获取视图页面信息', '/api/system/view_page/one', '/API/SYSTEM/VIEW_PAGE/ONE', 10, 0, '', '2018-06-20 14:40:34', '2018-06-20 14:40:34');
INSERT INTO `api` VALUES (39, '分页获取所有视图页面组件', '/api/system/view_page_component/page_all_by_page_id', '/API/SYSTEM/VIEW_PAGE_COMPONENT/PAGE_ALL_BY_PAGE_ID', 11, 0, '', '2018-06-20 14:45:30', '2018-06-20 14:45:30');
INSERT INTO `api` VALUES (40, '新增视图页面组件', '/api/system/view_page_component/add_one', '/API/SYSTEM/VIEW_PAGE_COMPONENT/ADD_ONE', 11, 0, '', '2018-06-20 14:45:45', '2018-06-20 14:45:45');
INSERT INTO `api` VALUES (41, '保存视图页面组件', '/api/system/view_page_component/save_one', '/API/SYSTEM/VIEW_PAGE_COMPONENT/SAVE_ONE', 11, 0, '', '2018-06-20 14:46:03', '2018-06-20 14:46:03');
INSERT INTO `api` VALUES (42, '指定视图页面组件 id ，批量删除视图页面组件', '/api/system/view_page_component/delete_all', '/API/SYSTEM/VIEW_PAGE_COMPONENT/DELETE_ALL', 11, 0, '', '2018-06-20 14:46:22', '2018-06-20 14:46:22');
INSERT INTO `api` VALUES (43, '指定视图组件 id ，获取视图组件信息', '/api/system/view_page_component/one', '/API/SYSTEM/VIEW_PAGE_COMPONENT/ONE', 11, 0, '', '2018-06-20 14:46:40', '2018-06-20 14:46:40');
INSERT INTO `api` VALUES (44, '是否关联 API', '/api/system/view_page_component_api/is_associated_by_page_component_id_and_api_id', '/API/SYSTEM/VIEW_PAGE_COMPONENT_API/IS_ASSOCIATED_BY_PAGE_COMPONENT_ID_AND_API_ID', 12, 0, '', '2018-06-20 14:48:47', '2018-06-20 14:48:47');
INSERT INTO `api` VALUES (45, '批量关联 API', '/api/system/view_page_component_api/associate_all_by_page_component_id_and_api_id_list', '/API/SYSTEM/VIEW_PAGE_COMPONENT_API/ASSOCIATE_ALL_BY_PAGE_COMPONENT_ID_AND_API_ID_LIST', 12, 0, '', '2018-06-20 14:49:42', '2018-06-20 14:49:42');
INSERT INTO `api` VALUES (46, '指定视图页面组件 id、API id ，批量撤销关联', '/api/system/view_page_component_api/revoke_associate_all_by_page_component_id_and_api_id_list', '/API/SYSTEM/VIEW_PAGE_COMPONENT_API/REVOKE_ASSOCIATE_ALL_BY_PAGE_COMPONENT_ID_AND_API_ID_LIST', 12, 0, '', '2018-06-20 14:50:43', '2018-06-20 14:50:43');
INSERT INTO `api` VALUES (47, '指定角色 id、视图页面权限（authority），批量授权', '/api/user/role_authority/grant_all_by_role_id_and_page_authority_list', '/API/USER/ROLE_AUTHORITY/GRANT_ALL_BY_ROLE_ID_AND_PAGE_AUTHORITY_LIST', 13, 0, '', '2018-07-03 21:24:13', '2018-06-20 15:07:15');
INSERT INTO `api` VALUES (48, '指定角色 id、视图页面权限（authority），批量撤销授权', '/api/user/role_authority/revoke_all_by_role_id_and_page_authority_list', '/API/USER/ROLE_AUTHORITY/REVOKE_ALL_BY_ROLE_ID_AND_PAGE_AUTHORITY_LIST', 13, 0, '', '2018-07-03 21:24:17', '2018-06-20 15:07:39');
INSERT INTO `api` VALUES (49, '指定角色 id、视图页面组件权限（authority），批量授权', '/api/user/role_authority/grant_all_by_role_id_and_page_component_authority_list', '/API/USER/ROLE_AUTHORITY/GRANT_ALL_BY_ROLE_ID_AND_PAGE_COMPONENT_AUTHORITY_LIST', 13, 0, '', '2018-07-03 21:24:20', '2018-06-20 15:08:11');
INSERT INTO `api` VALUES (50, '指定角色 id、视图页面组件权限（authority），批量撤销授权', '/api/user/role_authority/revoke_all_by_role_id_and_page_component_authority_list', '/API/USER/ROLE_AUTHORITY/REVOKE_ALL_BY_ROLE_ID_AND_PAGE_COMPONENT_AUTHORITY_LIST', 13, 0, '', '2018-07-03 21:24:24', '2018-06-20 15:08:27');
INSERT INTO `api` VALUES (51, '指定角色权限 id ，获取角色权限信息', '/api/user/role_authority/one', '/API/USER/ROLE_AUTHORITY/ONE', 13, 0, '', '2018-06-20 15:08:44', '2018-06-20 15:08:44');
INSERT INTO `api` VALUES (52, '指定角色 id、权限（authority）判断是否已授权', '/api/user/role_authority/is_granted_by_role_id_and_authority', '/API/USER/ROLE_AUTHORITY/IS_GRANTED_BY_ROLE_ID_AND_AUTHORITY', 13, 0, '', '2018-06-20 15:10:50', '2018-06-20 15:10:50');
INSERT INTO `api` VALUES (53, '分页获取所有角色', '/api/user/role/page_all', '/API/USER/ROLE/PAGE_ALL', 14, 0, '', '2018-06-20 15:12:12', '2018-06-20 15:12:12');
INSERT INTO `api` VALUES (54, '获取所有角色', '/api/user/role/list_all', '/API/USER/ROLE/LIST_ALL', 14, 0, '', '2018-06-20 15:12:38', '2018-06-20 15:12:38');
INSERT INTO `api` VALUES (55, '新增角色', '/api/user/role/add_one', '/API/USER/ROLE/ADD_ONE', 14, 0, '', '2018-06-20 15:12:53', '2018-06-20 15:12:53');
INSERT INTO `api` VALUES (56, '保存角色', '/api/user/role/save_one', '/API/USER/ROLE/SAVE_ONE', 14, 0, '', '2018-06-20 15:13:14', '2018-06-20 15:13:14');
INSERT INTO `api` VALUES (57, '指定角色 id ，批量删除角色', '/api/user/role/delete_all', '/API/USER/ROLE/DELETE_ALL', 14, 0, '', '2018-06-20 15:13:40', '2018-06-20 15:13:40');
INSERT INTO `api` VALUES (58, '指定角色 id ，获取角色信息', '/api/user/role/one', '/API/USER/ROLE/ONE', 14, 0, '', '2018-06-20 15:13:57', '2018-06-20 15:13:57');
INSERT INTO `api` VALUES (59, '指定用户 id ，获取用户角色', '/api/user/role/list_all_by_user_id', '/API/USER/ROLE/LIST_ALL_BY_USER_ID', 14, 0, '', '2018-06-20 15:14:27', '2018-06-20 15:14:27');
INSERT INTO `api` VALUES (60, '分页获取用户', '/api/user/page_all', '/API/USER/PAGE_ALL', 15, 0, '', '2018-06-20 15:16:24', '2018-06-20 15:16:24');
INSERT INTO `api` VALUES (61, '新增用户', '/api/user/add_one', '/API/USER/ADD_ONE', 15, 0, '', '2018-06-20 15:16:40', '2018-06-20 15:16:40');
INSERT INTO `api` VALUES (62, '保存用户', '/api/user/save_one', '/API/USER/SAVE_ONE', 15, 0, '', '2018-06-20 15:16:55', '2018-06-20 15:16:55');
INSERT INTO `api` VALUES (63, '伪删除用户', '/api/user/sign_all_gmt_deleted', '/API/USER/SIGN_ALL_GMT_DELETED', 15, 0, '', '2018-06-24 21:23:49', '2018-06-24 21:23:49');
INSERT INTO `api` VALUES (64, '撤销伪删除用户', '/api/user/unsign_all_gmt_deleted', '/API/USER/UNSIGN_ALL_GMT_DELETED', 15, 0, '', '2018-06-24 21:24:07', '2018-06-24 21:24:07');
INSERT INTO `api` VALUES (65, '指定用户 id ，批量删除用户', '/api/user/delete_all', '/API/USER/DELETE_ALL', 15, 0, '', '2018-06-24 21:24:54', '2018-06-24 21:24:54');
INSERT INTO `api` VALUES (66, '指定用户 id ，获取用户信息（除密码和角色）', '/api/user/one', '/API/USER/ONE', 15, 0, '', '2018-06-24 21:25:22', '2018-06-24 21:25:22');
INSERT INTO `api` VALUES (67, '分页获取所有用户角色', '/api/user/user_role/page_all', '/API/USER/USER_ROLE/PAGE_ALL', 16, 0, '', '2018-06-24 21:26:34', '2018-06-24 21:26:34');
INSERT INTO `api` VALUES (68, '新增用户角色', '/api/user/user_role/add_one', '/API/USER/USER_ROLE/ADD_ONE', 16, 0, '', '2018-06-24 21:26:53', '2018-06-24 21:26:53');
INSERT INTO `api` VALUES (69, '指定用户角色 id ，批量删除用户角色', '/api/user/user_role/delete_all_by_user_id_and_role_id_list', '/API/USER/USER_ROLE/DELETE_ALL_BY_USER_ID_AND_ROLE_ID_LIST', 16, 0, '', '2018-06-24 21:27:42', '2018-06-24 21:27:42');
INSERT INTO `api` VALUES (70, '指定角色 id ，分页获取所有父级视图菜单分类', '/api/user/view_menu_category/page_all_parent_by_role_id', '/API/USER/VIEW_MENU_CATEGORY/PAGE_ALL_PARENT_BY_ROLE_ID', 17, 0, '', '2018-06-24 21:30:19', '2018-06-24 21:28:38');
INSERT INTO `api` VALUES (71, '指定父级视图菜单分类 id 、角色 id ，获取所有视图菜单分类', '/api/user/view_menu_category/list_all_by_parent_id_and_role_id', '/API/USER/VIEW_MENU_CATEGORY/LIST_ALL_BY_PARENT_ID_AND_ROLE_ID', 17, 0, '', '2018-06-24 21:30:36', '2018-06-24 21:29:06');
INSERT INTO `api` VALUES (72, '新增视图菜单分类', '/api/user/view_menu_category/add_one', '/API/USER/VIEW_MENU_CATEGORY/ADD_ONE', 17, 0, '', '2018-06-24 21:30:55', '2018-06-24 21:30:55');
INSERT INTO `api` VALUES (73, '保存视图菜单分类', '/api/user/view_menu_category/save_one', '/API/USER/VIEW_MENU_CATEGORY/SAVE_ONE', 17, 0, '', '2018-06-24 21:31:10', '2018-06-24 21:31:10');
INSERT INTO `api` VALUES (74, '指定视图菜单分类 id ，批量删除视图菜单分类', '/api/user/view_menu_category/delete_all', '/API/USER/VIEW_MENU_CATEGORY/DELETE_ALL', 17, 0, '', '2018-06-24 21:31:30', '2018-06-24 21:31:30');
INSERT INTO `api` VALUES (75, '指定视图菜单分类 id ，获取视图菜单分类信息', '/api/user/view_menu_category/one', '/API/USER/VIEW_MENU_CATEGORY/ONE', 17, 0, '', '2018-06-24 21:31:52', '2018-06-24 21:31:52');
INSERT INTO `api` VALUES (76, '指定角色 id ，获取所有父级视图菜单分类', '/api/user/view_menu_category/list_all_parent_by_role_id', '/API/USER/VIEW_MENU_CATEGORY/LIST_ALL_PARENT_BY_ROLE_ID', 17, 0, '', '2018-06-24 21:32:16', '2018-06-24 21:32:16');
INSERT INTO `api` VALUES (77, '指定用户 id ，获取所有父级视图菜单分类', '/api/user/view_menu_category/list_all_parent_by_user_id', '/API/USER/VIEW_MENU_CATEGORY/LIST_ALL_PARENT_BY_USER_ID', 17, 0, '首页显示顶部菜单分类', '2018-06-29 12:09:25', '2018-06-24 21:32:36');
INSERT INTO `api` VALUES (78, '指定用户 id 、父级视图菜单分类 id ，获取所有子级视图菜单分类', '/api/user/view_menu_category/list_all_child_by_parent_id_and_user_id', '/API/USER/VIEW_MENU_CATEGORY/LIST_ALL_CHILD_BY_PARENT_ID_AND_USER_ID', 17, 0, '首页显示左侧子级菜单分类', '2018-06-29 12:09:11', '2018-06-24 21:33:19');
INSERT INTO `api` VALUES (79, '指定用户 id 、父级视图菜单分类 id ，获取所有子级视图菜单分类和视图菜单', '/api/user/view_menu_category/list_all_child_view_menu_category_and_view_menu_by_parent_id_and_user_id', '/API/USER/VIEW_MENU_CATEGORY/LIST_ALL_CHILD_VIEW_MENU_CATEGORY_AND_VIEW_MENU_BY_PARENT_ID_AND_USER_ID', 17, 0, '首页显示子级菜单分类及子级菜单', '2018-06-29 12:10:22', '2018-06-24 21:34:15');
INSERT INTO `api` VALUES (80, '获取所有菜单分类', '/api/user/view_menu_category/list_all', '/API/USER/VIEW_MENU_CATEGORY/LIST_ALL', 17, 0, '', '2018-06-24 21:35:24', '2018-06-24 21:35:24');
INSERT INTO `api` VALUES (81, '指定菜单分类名，模糊搜索获取所有菜单分类', '/api/user/view_menu_category/search_all_by_name', '/API/USER/VIEW_MENU_CATEGORY/SEARCH_ALL_BY_NAME', 17, 0, '', '2018-06-24 21:35:49', '2018-06-24 21:35:49');
INSERT INTO `api` VALUES (82, '指定视图菜单分类 id 、角色 id ，分页获取所有视图菜单', '/api/user/view_menu/page_all_by_menu_category_id_and_role_id', '/API/USER/VIEW_MENU/PAGE_ALL_BY_MENU_CATEGORY_ID_AND_ROLE_ID', 18, 0, '', '2018-06-24 21:36:50', '2018-06-24 21:36:50');
INSERT INTO `api` VALUES (83, '新增视图菜单', '/api/user/view_menu/add_one', '/API/USER/VIEW_MENU/ADD_ONE', 18, 0, '', '2018-06-24 21:37:11', '2018-06-24 21:37:11');
INSERT INTO `api` VALUES (84, '保存视图菜单', '/api/user/view_menu/save_one', '/API/USER/VIEW_MENU/SAVE_ONE', 18, 0, '', '2018-06-24 21:37:29', '2018-06-24 21:37:29');
INSERT INTO `api` VALUES (85, '指定视图菜单 id ，批量删除视图菜单', '/api/user/view_menu/delete_all', '/API/USER/VIEW_MENU/DELETE_ALL', 18, 0, '', '2018-06-24 21:37:51', '2018-06-24 21:37:51');
INSERT INTO `api` VALUES (86, '指定视图菜单 id ，获取视图菜单信息', '/api/user/view_menu/one', '/API/USER/VIEW_MENU/ONE', 18, 0, '', '2018-06-24 21:38:11', '2018-06-24 21:38:11');
INSERT INTO `api` VALUES (87, '指定菜单名，模糊搜索获取所有菜单', '/api/user/view_menu/search_all_by_name', '/API/USER/VIEW_MENU/SEARCH_ALL_BY_NAME', 18, 0, '', '2018-06-24 21:38:53', '2018-06-24 21:38:53');
INSERT INTO `api` VALUES (88, '指定角色 id、API 权限（authority），批量授权', '/api/user/role_authority/grant_all_by_role_id_and_api_authority_list', '/API/USER/ROLE_AUTHORITY/GRANT_ALL_BY_ROLE_ID_AND_API_AUTHORITY_LIST', 13, 0, '', '2018-07-03 21:24:04', '2018-07-03 21:24:04');
INSERT INTO `api` VALUES (89, '指定角色 id、API 权限（authority），批量撤销授权', '/api/user/role_authority/revoke_all_by_role_id_and_api_authority_list', '/API/USER/ROLE_AUTHORITY/REVOKE_ALL_BY_ROLE_ID_AND_API_AUTHORITY_LIST', 13, 0, '', '2018-07-03 21:25:13', '2018-07-03 21:25:13');

-- ----------------------------
-- Table structure for api_category
-- ----------------------------
DROP TABLE IF EXISTS `api_category`;
CREATE TABLE `api_category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级分类 id',
  `sort` bigint(20) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'API 分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_category
-- ----------------------------
INSERT INTO `api_category` VALUES (1, '系统管理', NULL, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (2, '系统配置', 1, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (3, '用户配置', 1, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (4, 'API 分类', 2, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (5, 'API', 2, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (6, '数据字典分类', 2, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (7, '数据字典', 2, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (8, '视图页面关联 API', 2, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (9, '视图页面分类', 2, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (10, '视图页面', 2, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (11, '视图页面组件', 2, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (12, '视图页面组件关联 API', 2, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (13, '角色关联权限', 3, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (14, '角色', 3, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (15, '用户', 3, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (16, '用户关联角色', 3, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (17, '视图菜单分类', 3, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');
INSERT INTO `api_category` VALUES (18, '视图菜单', 3, 0, '', '2018-06-20 14:36:43', '2018-06-20 14:36:43');

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一标识符',
  `size` bigint(20) NOT NULL COMMENT '文件大小',
  `pretty_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件美化大小',
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'MIME 类型',
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文件路径',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级部门 id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '测试部门', NULL, '', '2018-12-20 06:08:12', '2018-12-20 03:43:04');

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典键',
  `key_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典键名',
  `value_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典值名',
  `value_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典值别名',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '字典值',
  `enable` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否有效（0=否，1=是，默认=0）',
  `dictionary_category_id` bigint(20) UNSIGNED NOT NULL COMMENT '字典分类 id',
  `sort` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES (1, 'WEB', '网站字段', '网站名', 'NAME', 'Nimrod', 1, 3, 0, '', '2019-01-10 02:25:43', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (2, 'WEB', '网站字段', '页脚版权', 'FOOTER', 'Copyright &copy; 2019 Nimrod.All rights reserved.', 1, 3, 0, '', '2019-01-04 08:34:31', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (3, 'MAIL', '电子邮箱发信配置', '主机', 'HOST', 'smtp.exmail.qq.com', 1, 4, 0, '腾讯企业邮箱：https://exmail.qq.com/', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (4, 'MAIL', '电子邮箱发信配置', '协议', 'PROTOCOL', 'smtp', 1, 4, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (5, 'MAIL', '电子邮箱发信配置', '端口号', 'PORT', '25', 1, 4, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (6, 'MAIL', '电子邮箱发信配置', '用户名', 'USERNAME', 'no-reply@example.com', 1, 4, 0, '', '2018-12-24 01:27:17', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (7, 'MAIL', '电子邮箱发信配置', '密码', 'PASSWORD', '', 1, 4, 0, '', '2018-12-24 01:28:13', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (8, 'MAIL', '电子邮箱发信配置', '显示邮箱', 'FROM', 'no-reply@example.com', 1, 4, 0, '', '2018-12-24 01:27:25', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (9, 'MAIL', '电子邮箱发信配置', '默认编码', 'DEFAULT_ENCODING', 'UTF-8', 1, 4, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (10, 'MAIL', '电子邮箱发信配置', '测试连接', 'TEST_CONNECTION', 'false', 1, 4, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (11, 'VIEW_PAGE_COMPONENT_TYPE', '视图页面组件类型', '按钮', 'BUTTON', '1', 1, 5, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (12, 'VIEW_PAGE_COMPONENT_TYPE', '视图页面组件类型', '搜索框', 'SEARCH', '2', 1, 5, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (16, 'SMS_STATUS', '信息状态', '等待', 'WAIT', '0', 1, 7, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (17, 'SMS_STATUS', '信息状态', '失败', 'FAIL', '1', 1, 7, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (18, 'SMS_STATUS', '信息状态', '成功', 'SUCCESS', '2', 1, 7, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (19, 'IS_OR_NOT', '是或否', '否', 'NOT', '0', 1, 8, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (20, 'IS_OR_NOT', '是或否', '是', 'IS', '1', 1, 8, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (21, 'GENDER', '性别', '未知', 'UNKNOWN', '0', 1, 9, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (22, 'GENDER', '性别', '男', 'MALE', '1', 1, 9, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (23, 'GENDER', '性别', '女', 'FEMALE', '2', 1, 9, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary` VALUES (24, 'ATTACHMENT', '附件配置', '上传路径', 'UPLOAD_PATH', '/upload', 0, 11, 0, '', '2019-01-09 06:53:06', '2018-11-19 07:41:07');
INSERT INTO `dictionary` VALUES (25, 'OPERATION_TYPE', '操作类型', '访问页面', 'PAGE', '0', 1, 12, 0, '', '2018-12-27 03:18:00', '2018-12-17 12:13:32');
INSERT INTO `dictionary` VALUES (26, 'OPERATION_TYPE', '操作类型', '调用 API', 'API', '1', 1, 12, 0, '', '2018-12-27 03:18:08', '2018-12-17 12:14:42');
INSERT INTO `dictionary` VALUES (27, 'ATTACHMENT', '附件配置', '附件类型', 'TYPE', '.jpg,.png,.zip', 0, 11, 0, '允许上传的文件类型', '2019-01-09 06:53:11', '2018-12-17 13:08:13');
INSERT INTO `dictionary` VALUES (28, 'ATTACHMENT', '附件配置', '最大文件上传大小', 'MAX_FILE_SIZE', '1KB', 0, 11, 0, '允许上传的最大文件大小', '2019-01-09 06:53:16', '2018-12-17 13:10:23');
INSERT INTO `dictionary` VALUES (29, 'SYSTEM', '系统配置', '语言', 'LANGUAGE', 'zh', 0, 13, 0, '', '2019-01-09 06:32:49', '2018-12-19 08:25:09');
INSERT INTO `dictionary` VALUES (30, 'SYSTEM', '系统配置', '国家/区域', 'COUNTY', 'CN', 0, 13, 0, '', '2019-01-09 06:32:55', '2018-12-19 08:27:08');
INSERT INTO `dictionary` VALUES (31, 'SYSTEM', '系统配置', '时区标识符', 'TIME_ZONE_ID', 'GMT+8', 0, 13, 0, '', '2019-01-09 06:32:59', '2018-12-19 08:30:44');
INSERT INTO `dictionary` VALUES (32, 'SYSTEM', '系统配置', '日期格式', 'DATE_FORMAT_PATTERN', 'yyyy-MM-dd HH:mm:ss', 0, 13, 0, '', '2019-01-09 06:33:04', '2018-12-19 08:32:46');
INSERT INTO `dictionary` VALUES (33, 'ATTACHMENT', '附件配置', '最大请求上传大小', 'MAX_REQUEST_SIZE', '10KB', 0, 11, 0, '', '2019-01-09 06:53:20', '2018-12-21 01:05:54');
INSERT INTO `dictionary` VALUES (34, 'VERIFY_CODE', '验证码', '过期时间（秒）', 'EXPIRE_IN', '20', 1, 14, 0, '', '2019-01-09 06:56:53', '2019-01-09 06:56:53');
INSERT INTO `dictionary` VALUES (35, 'VERIFY_CODE', '验证码', '噪点', 'YAWP', 'false', 1, 14, 0, '', '2019-01-09 06:57:56', '2019-01-09 06:57:43');
INSERT INTO `dictionary` VALUES (36, 'VERIFY_CODE', '验证码', '字符长度', 'STRING_LENGTH', '4', 1, 14, 0, '建议字典值设置为4', '2019-01-10 01:02:27', '2019-01-09 06:58:19');
INSERT INTO `dictionary` VALUES (37, 'VERIFY_CODE', '验证码', '干扰线条数', 'INTER_LINE', '0', 1, 14, 0, '建议字典值设置为4', '2019-01-10 01:02:56', '2019-01-09 06:59:09');

-- ----------------------------
-- Table structure for dictionary_category
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_category`;
CREATE TABLE `dictionary_category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '父级分类 id',
  `sort` bigint(20) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据字典分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dictionary_category
-- ----------------------------
INSERT INTO `dictionary_category` VALUES (1, '系统缺省字段', NULL, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary_category` VALUES (2, '通用缺省字段', NULL, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary_category` VALUES (3, '网站配置', 1, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary_category` VALUES (4, '电子邮箱配置', 1, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary_category` VALUES (5, '视图页面组件类型', 1, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary_category` VALUES (7, '信息状态', 1, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary_category` VALUES (8, '是否', 2, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary_category` VALUES (9, '性别', 2, 0, '', '2018-07-08 15:29:33', '2018-07-08 15:29:33');
INSERT INTO `dictionary_category` VALUES (11, '附件配置', 1, 0, '', '2018-11-19 07:39:44', '2018-11-19 07:39:44');
INSERT INTO `dictionary_category` VALUES (12, '操作类型', 1, 0, '', '2018-12-17 12:02:51', '2018-12-17 12:02:51');
INSERT INTO `dictionary_category` VALUES (13, '系统配置', 1, 0, '', '2018-12-19 08:23:57', '2018-12-19 08:23:57');
INSERT INTO `dictionary_category` VALUES (14, '验证码', 1, 0, '', '2019-01-04 08:23:15', '2019-01-04 08:23:15');

-- ----------------------------
-- Table structure for mail
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `status` tinyint(1) NOT NULL COMMENT '发信状态',
  `from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '发件人',
  `to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收件人',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主题',
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `html` tinyint(1) NULL DEFAULT 0 COMMENT '是否为 html，0=否，1=是',
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '发信报错信息',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电子邮件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for operation_log
-- ----------------------------
DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '访问用户 id',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户 IP',
  `operation_type` tinyint(1) NULL DEFAULT NULL COMMENT '操作类型',
  `operation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作说明',
  `request_time` bigint(255) NULL DEFAULT 0 COMMENT '请求耗时（毫秒）',
  `request_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求地址',
  `request_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方法',
  `request_parameter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `accept_language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求语言',
  `referer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求来源',
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户代理',
  `handler` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Handler',
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'Session ID',
  `cookie` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Cookie',
  `content_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '响应文本类型',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '响应状态码',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 330 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色值',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_value`(`value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '普通用户', 'NORMAL_USER', '', '2018-06-27 21:22:40', '2018-06-27 21:22:40');
INSERT INTO `role` VALUES (2, '管理员', 'ADMIN', '', '2018-06-27 21:22:40', '2018-06-27 21:22:40');
INSERT INTO `role` VALUES (3, '系统管理员', 'SYSTEM_ADMIN', '', '2018-06-27 21:22:40', '2018-06-27 21:22:40');

-- ----------------------------
-- Table structure for role_authority
-- ----------------------------
DROP TABLE IF EXISTS `role_authority`;
CREATE TABLE `role_authority`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色 id',
  `authority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限（authority）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色关联权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_authority
-- ----------------------------
INSERT INTO `role_authority` VALUES (1, 2, '/');
INSERT INTO `role_authority` VALUES (2, 2, '/API/USER/VIEW_MENU_CATEGORY/LIST_ALL_CHILD_VIEW_MENU_CATEGORY_AND_VIEW_MENU_BY_PARENT_ID_AND_USER_ID');
INSERT INTO `role_authority` VALUES (3, 2, '/API/USER/VIEW_MENU_CATEGORY/LIST_ALL_CHILD_BY_PARENT_ID_AND_USER_ID');
INSERT INTO `role_authority` VALUES (4, 2, '/API/USER/VIEW_MENU_CATEGORY/LIST_ALL_PARENT_BY_USER_ID');
INSERT INTO `role_authority` VALUES (5, 2, '/SYSTEM/WORKBENCH');
INSERT INTO `role_authority` VALUES (6, 2, '/SYSTEM/VIEW_PAGE/PAGE_ALL');
INSERT INTO `role_authority` VALUES (7, 2, '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/ADD');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `email_is_verified` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '电子邮箱是否验证通过（0=未验证，1=已验证，默认=0）',
  `department_id` bigint(20) NULL DEFAULT NULL COMMENT '部门 id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_deleted` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '$2a$10$2ASJsYX1q5AMjHCji6DkrOt/mmS4D1nCXwnUW4kt.n/FvONR6Kjiq', 'normal_user', 'normal_user@outlook.com', 1, 1, '测试备注', NULL, '2018-11-13 04:26:59', '2018-06-27 21:22:40');
INSERT INTO `user` VALUES (2, '$2a$10$2ASJsYX1q5AMjHCji6DkrOt/mmS4D1nCXwnUW4kt.n/FvONR6Kjiq', 'admin', 'admin@outlook.com', 1, 1, '测试备注', NULL, '2018-11-13 04:27:08', '2018-06-27 21:22:40');
INSERT INTO `user` VALUES (3, '$2a$10$2ASJsYX1q5AMjHCji6DkrOt/mmS4D1nCXwnUW4kt.n/FvONR6Kjiq', 'system_admin', 'godcheese@outlook.com', 1, 1, '测试备注', NULL, '2018-11-13 04:26:44', '2018-06-27 21:22:40');

-- ----------------------------
-- Table structure for user_password_reset
-- ----------------------------
DROP TABLE IF EXISTS `user_password_reset`;
CREATE TABLE `user_password_reset`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户 id',
  `verify_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户绑定的电子邮箱或手机号码',
  `verify_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '电子邮箱或手机号码验证码',
  `gmt_expires` datetime(0) NOT NULL COMMENT '过期时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id`) USING BTREE,
  UNIQUE INDEX `uk_verify_from`(`verify_from`) USING BTREE,
  UNIQUE INDEX `uk_verify_code`(`verify_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户密码重置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户 id',
  `role_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色 id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户关联角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 2, 2);
INSERT INTO `user_role` VALUES (3, 3, 3);

-- ----------------------------
-- Table structure for view_menu
-- ----------------------------
DROP TABLE IF EXISTS `view_menu`;
CREATE TABLE `view_menu`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图标（icon）',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求地址（url）',
  `menu_category_id` bigint(20) UNSIGNED NOT NULL COMMENT '菜单分类 id',
  `role_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色 id',
  `sort` bigint(20) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视图菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_menu
-- ----------------------------
INSERT INTO `view_menu` VALUES (1, 'API 管理', '', '/system/api/page_all', 2, 3, 0, '', '2018-07-01 21:28:04', '2018-07-01 21:28:04');
INSERT INTO `view_menu` VALUES (2, '数据字典', '', '/system/dictionary/page_all', 2, 3, 0, '', '2018-07-01 21:28:04', '2018-07-01 21:28:04');
INSERT INTO `view_menu` VALUES (3, '视图页面管理', '', '/system/view_page/page_all', 2, 3, 0, '', '2018-07-01 21:28:04', '2018-07-01 21:28:04');
INSERT INTO `view_menu` VALUES (4, 'Druid Monitor', '', '/druid', 2, 3, 0, '', '2018-07-01 21:28:04', '2018-07-01 21:28:04');
INSERT INTO `view_menu` VALUES (5, '用户管理', '', '/user/page_all', 3, 3, 0, '', '2018-07-01 21:28:04', '2018-07-01 21:28:04');
INSERT INTO `view_menu` VALUES (6, '角色管理', '', '/user/role/page_all', 3, 3, 0, '', '2018-07-01 21:28:04', '2018-07-01 21:28:04');
INSERT INTO `view_menu` VALUES (7, '发送邮件', '', '/mail/send', 4, 3, 0, '', '2019-01-21 02:58:57', '2018-07-08 13:20:28');
INSERT INTO `view_menu` VALUES (8, '邮件队列', '', '/mail/page_all', 4, 3, 0, '', '2019-01-21 02:59:02', '2018-07-08 13:22:30');
INSERT INTO `view_menu` VALUES (9, '操作日志', '', '/system/operation_log/page_all', 2, 3, 0, '', '2018-12-11 03:13:08', '2018-08-06 16:47:15');
INSERT INTO `view_menu` VALUES (10, '附件管理', 'fa fa-archive', '/system/attachment/page_all', 2, 3, 0, '', '2018-10-20 19:07:33', '2018-10-20 19:01:23');
INSERT INTO `view_menu` VALUES (11, '部门管理', '', '/user/department/page_all', 3, 3, 0, '', '2018-12-20 02:43:28', '2018-12-20 02:43:28');
INSERT INTO `view_menu` VALUES (12, '流程定义管理', '', '/flowable/act_re_procdef/page_all', 5, 3, 0, '', '2019-01-21 03:18:22', '2019-01-21 00:27:19');
INSERT INTO `view_menu` VALUES (13, '正在流转的流程实例', '', '/flowable/act_hi_procinst/page_all', 5, 3, 0, '', '2019-01-24 07:37:28', '2019-01-21 04:09:35');

-- ----------------------------
-- Table structure for view_menu_category
-- ----------------------------
DROP TABLE IF EXISTS `view_menu_category`;
CREATE TABLE `view_menu_category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图标（icon）',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级分类 id',
  `role_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色 id',
  `sort` bigint(20) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视图菜单分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_menu_category
-- ----------------------------
INSERT INTO `view_menu_category` VALUES (1, '系统管理', 'fa fa-cog', NULL, 3, 0, '', '2018-07-01 21:28:04', '2018-07-01 21:28:04');
INSERT INTO `view_menu_category` VALUES (2, '系统配置', 'fa fa-cog', 1, 3, 0, '', '2018-07-01 21:28:04', '2018-07-01 21:28:04');
INSERT INTO `view_menu_category` VALUES (3, '用户配置', 'fa fa-user', 1, 3, 0, '', '2018-07-01 21:28:04', '2018-07-01 21:28:04');
INSERT INTO `view_menu_category` VALUES (4, '电子邮箱', '', 2, 3, 0, '', '2018-07-08 13:19:57', '2018-07-08 13:19:57');
INSERT INTO `view_menu_category` VALUES (5, '工作流管理', '', 2, 3, 0, '', '2019-01-21 00:26:38', '2019-01-21 00:26:38');

-- ----------------------------
-- Table structure for view_page
-- ----------------------------
DROP TABLE IF EXISTS `view_page`;
CREATE TABLE `view_page`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '页面名称',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求地址（url）',
  `authority` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限（authority）',
  `page_category_id` bigint(20) UNSIGNED NOT NULL COMMENT '页面分类 id',
  `sort` bigint(20) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_authority`(`authority`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视图页面表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_page
-- ----------------------------
INSERT INTO `view_page` VALUES (1, '系统首页1', '/', '/', 2, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (2, '系统首页2', '/index', '/INDEX', 2, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (3, '系统首页2', '/system', '/SYSTEM', 2, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (4, '系统首页3', '/system/index', '/SYSTEM/INDEX', 2, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (5, '工作台', '/system/workbench', '/SYSTEM/WORKBENCH', 2, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (6, '视图页面管理', '/system/view_page/page_all', '/SYSTEM/VIEW_PAGE/PAGE_ALL', 2, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (7, '视图页面关联 API', '/system/view_page_api/page_all', '/SYSTEM/VIEW_PAGE_API/PAGE_ALL', 2, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (8, '视图页面组件关联 API', '/system/view_page_component_api/page_all', '/SYSTEM/VIEW_PAGE_COMPONENT_API/PAGE_ALL', 2, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (9, 'API 管理', '/system/api/page_all', '/SYSTEM/API/PAGE_ALL', 2, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (10, '数据字典', '/system/dictionary/page_all', '/SYSTEM/DICTIONARY/PAGE_ALL', 2, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (11, 'Druid Monitor', '/druid', '/DRUID', 2, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (12, '用户管理', '/user/page_all', '/USER/PAGE_ALL', 3, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (13, '角色管理', '/user/role/page_all', '/USER/ROLE/PAGE_ALL', 3, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (14, '角色 API 权限管理', '/user/role_authority/api/page_all', '/USER/ROLE_AUTHORITY/API/PAGE_ALL', 3, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (15, '角色视图页面管理', '/user/role_authority/view_page/page_all', '/USER/ROLE_AUTHORITY/VIEW_PAGE/PAGE_ALL', 3, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (16, '用户角色管理', '/user/user_role/page_all', '/USER/USER_ROLE/PAGE_ALL', 3, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (17, '视图菜单管理', '/user/view_menu/page_all', '/USER/VIEW_MENU/PAGE_ALL', 3, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page` VALUES (18, '发送邮件', '/email/send', '/EMAIL/SEND', 4, 0, '', '2019-01-21 02:59:50', '2018-07-08 13:16:32');
INSERT INTO `view_page` VALUES (19, '邮件队列', '/email/page_all', '/EMAIL/PAGE_ALL', 4, 0, '', '2019-01-21 02:59:57', '2018-07-08 13:17:38');

-- ----------------------------
-- Table structure for view_page_api
-- ----------------------------
DROP TABLE IF EXISTS `view_page_api`;
CREATE TABLE `view_page_api`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `page_id` bigint(20) UNSIGNED NOT NULL COMMENT '视图页面 id',
  `api_id` bigint(20) UNSIGNED NOT NULL COMMENT 'API id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视图页面关联 API 表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_page_api
-- ----------------------------
INSERT INTO `view_page_api` VALUES (1, 1, 77);
INSERT INTO `view_page_api` VALUES (2, 1, 78);
INSERT INTO `view_page_api` VALUES (3, 1, 79);
INSERT INTO `view_page_api` VALUES (4, 2, 77);
INSERT INTO `view_page_api` VALUES (5, 2, 78);
INSERT INTO `view_page_api` VALUES (6, 2, 79);
INSERT INTO `view_page_api` VALUES (7, 3, 77);
INSERT INTO `view_page_api` VALUES (8, 3, 78);
INSERT INTO `view_page_api` VALUES (9, 3, 79);
INSERT INTO `view_page_api` VALUES (10, 4, 77);
INSERT INTO `view_page_api` VALUES (11, 4, 78);
INSERT INTO `view_page_api` VALUES (12, 4, 79);
INSERT INTO `view_page_api` VALUES (13, 6, 28);
INSERT INTO `view_page_api` VALUES (14, 6, 29);
INSERT INTO `view_page_api` VALUES (15, 6, 34);
INSERT INTO `view_page_api` VALUES (16, 6, 39);
INSERT INTO `view_page_api` VALUES (17, 6, 24);
INSERT INTO `view_page_api` VALUES (18, 7, 1);
INSERT INTO `view_page_api` VALUES (19, 7, 2);
INSERT INTO `view_page_api` VALUES (20, 7, 25);
INSERT INTO `view_page_api` VALUES (21, 8, 1);
INSERT INTO `view_page_api` VALUES (22, 8, 2);
INSERT INTO `view_page_api` VALUES (23, 8, 7);
INSERT INTO `view_page_api` VALUES (24, 8, 44);
INSERT INTO `view_page_api` VALUES (25, 9, 1);
INSERT INTO `view_page_api` VALUES (26, 9, 2);
INSERT INTO `view_page_api` VALUES (27, 9, 7);
INSERT INTO `view_page_api` VALUES (28, 10, 12);
INSERT INTO `view_page_api` VALUES (29, 10, 13);
INSERT INTO `view_page_api` VALUES (30, 10, 18);
INSERT INTO `view_page_api` VALUES (31, 10, 24);
INSERT INTO `view_page_api` VALUES (32, 12, 24);
INSERT INTO `view_page_api` VALUES (33, 12, 60);
INSERT INTO `view_page_api` VALUES (34, 16, 59);
INSERT INTO `view_page_api` VALUES (35, 14, 1);
INSERT INTO `view_page_api` VALUES (36, 14, 2);
INSERT INTO `view_page_api` VALUES (37, 14, 52);
INSERT INTO `view_page_api` VALUES (38, 15, 28);
INSERT INTO `view_page_api` VALUES (39, 15, 29);
INSERT INTO `view_page_api` VALUES (40, 15, 52);
INSERT INTO `view_page_api` VALUES (41, 15, 39);
INSERT INTO `view_page_api` VALUES (42, 17, 70);
INSERT INTO `view_page_api` VALUES (43, 17, 71);
INSERT INTO `view_page_api` VALUES (44, 17, 82);
INSERT INTO `view_page_api` VALUES (45, 17, 81);
INSERT INTO `view_page_api` VALUES (46, 17, 87);
INSERT INTO `view_page_api` VALUES (48, 15, 34);

-- ----------------------------
-- Table structure for view_page_category
-- ----------------------------
DROP TABLE IF EXISTS `view_page_category`;
CREATE TABLE `view_page_category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级分类 id',
  `sort` bigint(20) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视图页面分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_page_category
-- ----------------------------
INSERT INTO `view_page_category` VALUES (1, '系统管理', NULL, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page_category` VALUES (2, '系统配置', 1, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page_category` VALUES (3, '用户配置', 1, 0, '', '2018-07-01 18:52:40', '2018-07-01 18:52:40');
INSERT INTO `view_page_category` VALUES (4, '电子邮箱', 2, 0, '', '2018-07-08 13:12:23', '2018-07-08 13:12:23');

-- ----------------------------
-- Table structure for view_page_component
-- ----------------------------
DROP TABLE IF EXISTS `view_page_component`;
CREATE TABLE `view_page_component`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `page_component_type` tinyint(2) NOT NULL COMMENT '组件类型 id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组件名称',
  `authority` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限（authority）',
  `page_id` bigint(20) UNSIGNED NOT NULL COMMENT '视图页面 id',
  `sort` bigint(20) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_authority`(`authority`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视图页面组件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_page_component
-- ----------------------------
INSERT INTO `view_page_component` VALUES (1, 1, '新增', '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/VIEW_PAGE_CATEGORY_ADD_DIALOG', 6, 0, '新增视图页面分类', '2018-07-01 19:14:28', '2018-07-01 19:14:28');
INSERT INTO `view_page_component` VALUES (2, 1, '编辑', '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/VIEW_PAGE_CATEGORY_EDIT_DIALOG', 6, 0, '编辑视图页面分类', '2018-07-01 19:17:39', '2018-07-01 19:17:39');
INSERT INTO `view_page_component` VALUES (3, 1, '删除', '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/VIEW_PAGE_CATEGORY_DELETE_ALL', 6, 0, '删除视图页面分类', '2018-07-01 19:18:11', '2018-07-01 19:18:11');
INSERT INTO `view_page_component` VALUES (4, 1, '新增', '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/VIEW_PAGE_ADD_DIALOG', 6, 0, '新增视图页面', '2018-07-01 19:19:40', '2018-07-01 19:19:40');
INSERT INTO `view_page_component` VALUES (5, 1, '复制新增', '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/VIEW_PAGE_COPY_ADD_DIALOG', 6, 0, '复制新增视图页面', '2018-07-01 19:20:44', '2018-07-01 19:20:44');
INSERT INTO `view_page_component` VALUES (6, 1, '编辑', '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/VIEW_PAGE_EDIT_DIALOG', 6, 0, '编辑视图页面', '2018-07-01 19:30:34', '2018-07-01 19:30:34');
INSERT INTO `view_page_component` VALUES (7, 1, '删除', '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/VIEW_PAGE_DELETE_ALL', 6, 0, '删除视图页面', '2018-07-01 19:30:56', '2018-07-01 19:30:56');
INSERT INTO `view_page_component` VALUES (8, 1, '关联 API', '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/VIEW_PAGE_API_DIALOG', 6, 0, '视图页面关联 API', '2018-07-01 19:32:27', '2018-07-01 19:32:27');
INSERT INTO `view_page_component` VALUES (9, 1, '新增', '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/VIEW_PAGE_COMPONENT_ADD_DIALOG', 6, 0, '新增视图页面组件', '2018-07-01 19:33:06', '2018-07-01 19:33:06');
INSERT INTO `view_page_component` VALUES (10, 1, '复制新增', '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/VIEW_PAGE_COMPONENT_COPY_ADD_DIALOG', 6, 0, '复制新增视图页面组件', '2018-07-01 19:33:42', '2018-07-01 19:33:42');
INSERT INTO `view_page_component` VALUES (11, 1, '编辑', '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/VIEW_PAGE_COMPONENT_EDIT_DIALOG', 6, 0, '编辑视图页面组件', '2018-07-01 19:34:07', '2018-07-01 19:34:07');
INSERT INTO `view_page_component` VALUES (12, 1, '删除', '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/VIEW_PAGE_COMPONENT_DELETE_ALL', 6, 0, '删除视图页面组件', '2018-07-01 19:35:50', '2018-07-01 19:35:50');
INSERT INTO `view_page_component` VALUES (13, 1, '关联 API', '/COMPONENT/SYSTEM/VIEW_PAGE/PAGE_ALL/VIEW_PAGE_COMPONENT_API_DIALOG', 6, 0, '视图页面组件关联 API', '2018-07-01 19:36:27', '2018-07-01 19:36:27');
INSERT INTO `view_page_component` VALUES (14, 1, '关联', '/COMPONENT/SYSTEM/VIEW_PAGE_API/PAGE_ALL/ASSOCIATE_ALL_VIEW_PAGE_API', 7, 0, '', '2018-07-03 12:59:22', '2018-07-03 12:57:37');
INSERT INTO `view_page_component` VALUES (15, 1, '撤销关联', '/COMPONENT/SYSTEM/VIEW_PAGE_API/PAGE_ALL/REVOKE_ASSOCIATE_ALL_VIEW_PAGE_API', 7, 0, '', '2018-07-03 12:59:16', '2018-07-03 12:59:16');
INSERT INTO `view_page_component` VALUES (16, 1, '关联', '/COMPONENT/SYSTEM/VIEW_PAGE_COMPONENT_API/PAGE_ALL/ASSOCIATE_ALL_VIEW_PAGE_COMPONENT_API', 8, 0, '', '2018-07-03 13:00:28', '2018-07-03 13:00:28');
INSERT INTO `view_page_component` VALUES (17, 1, '撤销关联', '/COMPONENT/SYSTEM/VIEW_PAGE_COMPONENT_API/PAGE_ALL/REVOKE_ASSOCIATE_ALL_VIEW_PAGE_COMPONENT_API', 8, 0, '', '2018-07-03 13:00:42', '2018-07-03 13:00:42');
INSERT INTO `view_page_component` VALUES (18, 1, '新增', '/COMPONENT/SYSTEM/API/PAGE_ALL/API_CATEGORY_ADD_DIALOG', 9, 0, '新增 API 分类', '2018-07-03 13:07:51', '2018-07-03 13:07:51');
INSERT INTO `view_page_component` VALUES (19, 1, '编辑', '/COMPONENT/SYSTEM/API/PAGE_ALL/API_CATEGORY_EDIT_DIALOG', 9, 0, '编辑 API 分类', '2018-07-03 13:08:17', '2018-07-03 13:08:17');
INSERT INTO `view_page_component` VALUES (20, 1, '删除', '/COMPONENT/SYSTEM/API/PAGE_ALL/API_CATEGORY_DELETE_ALL', 9, 0, '删除 API 分类', '2018-07-03 13:08:36', '2018-07-03 13:08:36');
INSERT INTO `view_page_component` VALUES (21, 1, '新增', '/COMPONENT/SYSTEM/API/PAGE_ALL/API_ADD_DIALOG', 9, 0, '新增 API', '2018-07-03 13:09:21', '2018-07-03 13:09:21');
INSERT INTO `view_page_component` VALUES (22, 1, '复制新增', '/COMPONENT/SYSTEM/API/PAGE_ALL/API_COPY_ADD_DIALOG', 9, 0, '复制新增 API', '2018-07-03 13:09:36', '2018-07-03 13:09:36');
INSERT INTO `view_page_component` VALUES (23, 1, '编辑', '/COMPONENT/SYSTEM/API/PAGE_ALL/API_EDIT_DIALOG', 9, 0, '编辑 API', '2018-07-03 13:09:55', '2018-07-03 13:09:55');
INSERT INTO `view_page_component` VALUES (24, 1, '删除', '/COMPONENT/SYSTEM/API/PAGE_ALL/API_DELETE_ALL', 9, 0, '删除 API', '2018-07-03 13:10:08', '2018-07-03 13:10:08');
INSERT INTO `view_page_component` VALUES (25, 1, '新增', '/COMPONENT/SYSTEM/DICTIONARY/PAGE_ALL/DICTIONARY_CATEGORY_ADD_DIALOG', 10, 0, '新增字典分类', '2018-07-03 15:25:33', '2018-07-03 15:25:33');
INSERT INTO `view_page_component` VALUES (26, 1, '编辑', '/COMPONENT/SYSTEM/DICTIONARY/PAGE_ALL/DICTIONARY_CATEGORY_EDIT_DIALOG', 10, 0, '编辑字典分类', '2018-07-03 15:25:58', '2018-07-03 15:25:58');
INSERT INTO `view_page_component` VALUES (27, 1, '删除', '/COMPONENT/SYSTEM/DICTIONARY/PAGE_ALL/DICTIONARY_CATEGORY_DELETE_ALL', 10, 0, '删除字典分类', '2018-07-03 15:26:18', '2018-07-03 15:26:18');
INSERT INTO `view_page_component` VALUES (28, 1, '新增', '/COMPONENT/SYSTEM/DICTIONARY/PAGE_ALL/DICTIONARY_ADD_DIALOG', 10, 0, '新增字典', '2018-07-03 15:26:37', '2018-07-03 15:26:37');
INSERT INTO `view_page_component` VALUES (29, 1, '复制新增', '/COMPONENT/SYSTEM/DICTIONARY/PAGE_ALL/DICTIONARY_COPY_ADD_DIALOG', 10, 0, '复制新增字典', '2018-07-03 15:26:56', '2018-07-03 15:26:56');
INSERT INTO `view_page_component` VALUES (30, 1, '编辑', '/COMPONENT/SYSTEM/DICTIONARY/PAGE_ALL/DICTIONARY_EDIT_DIALOG', 10, 0, '编辑字典', '2018-07-03 15:27:18', '2018-07-03 15:27:18');
INSERT INTO `view_page_component` VALUES (31, 1, '删除', '/COMPONENT/SYSTEM/DICTIONARY/PAGE_ALL/DICTIONARY_DELETE_ALL', 10, 0, '删除字典', '2018-07-03 15:27:32', '2018-07-03 15:27:32');
INSERT INTO `view_page_component` VALUES (32, 1, '新增', '/COMPONENT/USER/PAGE_ALL/USER_ADD_DIALOG', 12, 0, '', '2018-07-03 20:29:52', '2018-07-03 20:29:52');
INSERT INTO `view_page_component` VALUES (33, 1, '编辑', '/COMPONENT/USER/PAGE_ALL/USER_EDIT_DIALOG', 12, 0, '', '2018-07-03 20:30:18', '2018-07-03 20:30:18');
INSERT INTO `view_page_component` VALUES (34, 1, '删除', '/COMPONENT/USER/PAGE_ALL/USER_SIGN_ALL_GMT_DELETED', 12, 0, '标记 gmt_deleted 不为空，可撤销删除', '2018-07-03 20:32:47', '2018-07-03 20:31:36');
INSERT INTO `view_page_component` VALUES (35, 1, '撤销删除', '/COMPONENT/USER/PAGE_ALL/USER_UNSIGN_ALL_GMT_DELETED', 12, 0, '标记 gmt_deleted 为空，撤销删除', '2018-07-03 20:32:32', '2018-07-03 20:32:32');
INSERT INTO `view_page_component` VALUES (36, 1, '永久删除', '/COMPONENT/USER/PAGE_ALL/USER_DELETE_ALL', 12, 0, '永久删除，不可撤销删除', '2018-07-03 20:33:45', '2018-07-03 20:33:45');
INSERT INTO `view_page_component` VALUES (37, 1, '角色管理', '/COMPONENT/USER/PAGE_ALL/USER_ROLE_DIALOG', 12, 0, '角色管理，可为指定用户新增或删除角色', '2018-07-03 20:35:12', '2018-07-03 20:35:12');
INSERT INTO `view_page_component` VALUES (38, 1, '授权用户角色', '/COMPONENT/USER/USER_ROLE/PAGE_ALL/USER_ROLE_ADD_DIALOG', 16, 0, '', '2018-07-03 20:41:51', '2018-07-03 20:41:51');
INSERT INTO `view_page_component` VALUES (39, 1, '撤销授权用户角色', '/COMPONENT/USER/USER_ROLE/PAGE_ALL/USER_ROLE_DELETE_ALL', 16, 0, '', '2018-07-03 20:42:22', '2018-07-03 20:42:22');
INSERT INTO `view_page_component` VALUES (40, 1, '新增', '/COMPONENT/USER/ROLE/PAGE_ALL/ROLE_ADD_DIALOG', 13, 0, '', '2018-07-03 20:45:22', '2018-07-03 20:45:22');
INSERT INTO `view_page_component` VALUES (41, 1, '编辑', '/COMPONENT/USER/ROLE/PAGE_ALL/ROLE_EDIT_DIALOG', 13, 0, '', '2018-07-03 20:45:53', '2018-07-03 20:45:53');
INSERT INTO `view_page_component` VALUES (42, 1, '删除', '/COMPONENT/USER/ROLE/PAGE_ALL/ROLE_DELETE_ALL', 13, 0, '', '2018-07-03 20:46:24', '2018-07-03 20:46:24');
INSERT INTO `view_page_component` VALUES (43, 1, '视图菜单管理', '/COMPONENT/USER/ROLE/PAGE_ALL/VIEW_MENU_DIALOG', 13, 0, '', '2018-07-03 20:46:58', '2018-07-03 20:46:58');
INSERT INTO `view_page_component` VALUES (44, 1, '视图页面权限管理', '/COMPONENT/USER/ROLE/PAGE_ALL/ROLE_AUTHORITY_VIEW_PAGE_DIALOG', 13, 0, '', '2018-07-03 20:47:35', '2018-07-03 20:47:35');
INSERT INTO `view_page_component` VALUES (45, 1, 'API 权限管理', '/COMPONENT/USER/ROLE/PAGE_ALL/ROLE_AUTHORITY_API_DIALOG', 13, 0, '', '2018-07-03 20:48:00', '2018-07-03 20:48:00');
INSERT INTO `view_page_component` VALUES (46, 1, '授权', '/COMPONENT/USER/ROLE_AUTHORITY/API/PAGE_ALL/GRANT_ALL_ROLE_AUTHORITY_API', 14, 0, '', '2018-07-03 20:51:20', '2018-07-03 20:51:20');
INSERT INTO `view_page_component` VALUES (47, 1, '撤销授权', '/COMPONENT/USER/ROLE_AUTHORITY/API/PAGE_ALL/REVOKE_ALL_ROLE_AUTHORITY_API', 14, 0, '', '2018-07-03 20:51:48', '2018-07-03 20:51:48');
INSERT INTO `view_page_component` VALUES (48, 1, '授权', '/COMPONENT/USER/ROLE_AUTHORITY/VIEW_PAGE/PAGE_ALL/GRANT_ALL_ROLE_AUTHORITY_VIEW_PAGE', 15, 0, '授权视图页面权限（authority）', '2018-07-03 21:31:49', '2018-07-03 20:52:32');
INSERT INTO `view_page_component` VALUES (49, 1, '撤销授权', '/COMPONENT/USER/ROLE_AUTHORITY/VIEW_PAGE/PAGE_ALL/REVOKE_ALL_ROLE_AUTHORITY_VIEW_PAGE', 15, 0, '撤销授权视图页面权限（authority）', '2018-07-03 21:31:57', '2018-07-03 20:52:54');
INSERT INTO `view_page_component` VALUES (50, 1, '新增', '/COMPONENT/USER/VIEW_MENU/PAGE_ALL/VIEW_MENU_CATEGORY_ADD_DIALOG', 17, 0, '新增视图菜单分类', '2018-07-03 20:54:19', '2018-07-03 20:54:19');
INSERT INTO `view_page_component` VALUES (51, 1, '编辑', '/COMPONENT/USER/VIEW_MENU/PAGE_ALL/VIEW_MENU_CATEGORY_EDIT_DIALOG', 17, 0, '编辑视图菜单分类', '2018-07-03 20:54:44', '2018-07-03 20:54:44');
INSERT INTO `view_page_component` VALUES (52, 1, '删除', '/COMPONENT/USER/VIEW_MENU/PAGE_ALL/VIEW_MENU_CATEGORY_DELETE_ALL', 17, 0, '删除视图菜单分类', '2018-07-03 20:55:05', '2018-07-03 20:55:05');
INSERT INTO `view_page_component` VALUES (53, 1, '新增', '/COMPONENT/USER/VIEW_MENU/PAGE_ALL/VIEW_MENU_ADD_DIALOG', 17, 0, '新增视图菜单', '2018-07-03 20:55:37', '2018-07-03 20:55:37');
INSERT INTO `view_page_component` VALUES (54, 1, '编辑', '/COMPONENT/USER/VIEW_MENU/PAGE_ALL/VIEW_MENU_EDIT_DIALOG', 17, 0, '编辑视图菜单', '2018-07-03 20:55:52', '2018-07-03 20:55:52');
INSERT INTO `view_page_component` VALUES (55, 1, '删除', '/COMPONENT/USER/VIEW_MENU/PAGE_ALL/VIEW_MENU_DELETE_ALL', 17, 0, '删除视图菜单', '2018-07-03 20:56:08', '2018-07-03 20:56:08');
INSERT INTO `view_page_component` VALUES (56, 1, '授权', '/COMPONENT/USER/ROLE_AUTHORITY/VIEW_PAGE/PAGE_ALL/GRANT_ALL_ROLE_AUTHORITY_VIEW_PAGE_COMPONENT', 15, 0, '授权视图页面组件权限（authority）', '2018-07-03 21:32:25', '2018-07-03 21:32:25');
INSERT INTO `view_page_component` VALUES (57, 1, '撤销授权', '/COMPONENT/USER/ROLE_AUTHORITY/VIEW_PAGE/PAGE_ALL/REVOKE_ALL_ROLE_AUTHORITY_VIEW_PAGE_COMPONENT', 15, 0, '撤销授权视图页面组件权限（authority）', '2018-07-03 21:32:48', '2018-07-03 21:32:48');

-- ----------------------------
-- Table structure for view_page_component_api
-- ----------------------------
DROP TABLE IF EXISTS `view_page_component_api`;
CREATE TABLE `view_page_component_api`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `page_component_id` bigint(20) UNSIGNED NOT NULL COMMENT '视图页面组件 id',
  `api_id` bigint(20) UNSIGNED NOT NULL COMMENT 'API id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视图页面组件关联 API 表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_page_component_api
-- ----------------------------
INSERT INTO `view_page_component_api` VALUES (1, 1, 30);
INSERT INTO `view_page_component_api` VALUES (2, 2, 33);
INSERT INTO `view_page_component_api` VALUES (3, 2, 31);
INSERT INTO `view_page_component_api` VALUES (4, 3, 32);
INSERT INTO `view_page_component_api` VALUES (5, 4, 35);
INSERT INTO `view_page_component_api` VALUES (6, 5, 38);
INSERT INTO `view_page_component_api` VALUES (7, 5, 35);
INSERT INTO `view_page_component_api` VALUES (8, 6, 36);
INSERT INTO `view_page_component_api` VALUES (9, 6, 38);
INSERT INTO `view_page_component_api` VALUES (10, 7, 37);
INSERT INTO `view_page_component_api` VALUES (11, 9, 40);
INSERT INTO `view_page_component_api` VALUES (12, 10, 40);
INSERT INTO `view_page_component_api` VALUES (13, 10, 43);
INSERT INTO `view_page_component_api` VALUES (14, 11, 41);
INSERT INTO `view_page_component_api` VALUES (15, 11, 43);
INSERT INTO `view_page_component_api` VALUES (16, 12, 42);
INSERT INTO `view_page_component_api` VALUES (17, 14, 26);
INSERT INTO `view_page_component_api` VALUES (18, 15, 27);
INSERT INTO `view_page_component_api` VALUES (19, 16, 45);
INSERT INTO `view_page_component_api` VALUES (20, 17, 46);
INSERT INTO `view_page_component_api` VALUES (21, 18, 3);
INSERT INTO `view_page_component_api` VALUES (22, 19, 4);
INSERT INTO `view_page_component_api` VALUES (23, 19, 6);
INSERT INTO `view_page_component_api` VALUES (24, 20, 5);
INSERT INTO `view_page_component_api` VALUES (25, 21, 8);
INSERT INTO `view_page_component_api` VALUES (26, 22, 8);
INSERT INTO `view_page_component_api` VALUES (27, 22, 11);
INSERT INTO `view_page_component_api` VALUES (28, 23, 9);
INSERT INTO `view_page_component_api` VALUES (29, 23, 11);
INSERT INTO `view_page_component_api` VALUES (30, 24, 10);
INSERT INTO `view_page_component_api` VALUES (31, 32, 61);
INSERT INTO `view_page_component_api` VALUES (32, 33, 62);
INSERT INTO `view_page_component_api` VALUES (33, 33, 66);
INSERT INTO `view_page_component_api` VALUES (34, 34, 63);
INSERT INTO `view_page_component_api` VALUES (35, 35, 64);
INSERT INTO `view_page_component_api` VALUES (36, 36, 65);
INSERT INTO `view_page_component_api` VALUES (37, 38, 68);
INSERT INTO `view_page_component_api` VALUES (38, 39, 69);
INSERT INTO `view_page_component_api` VALUES (39, 40, 55);
INSERT INTO `view_page_component_api` VALUES (40, 41, 56);
INSERT INTO `view_page_component_api` VALUES (41, 41, 58);
INSERT INTO `view_page_component_api` VALUES (42, 42, 57);
INSERT INTO `view_page_component_api` VALUES (43, 46, 88);
INSERT INTO `view_page_component_api` VALUES (44, 47, 89);
INSERT INTO `view_page_component_api` VALUES (45, 48, 47);
INSERT INTO `view_page_component_api` VALUES (46, 49, 48);
INSERT INTO `view_page_component_api` VALUES (47, 56, 49);
INSERT INTO `view_page_component_api` VALUES (48, 57, 50);
INSERT INTO `view_page_component_api` VALUES (49, 50, 72);
INSERT INTO `view_page_component_api` VALUES (50, 51, 73);
INSERT INTO `view_page_component_api` VALUES (51, 51, 75);
INSERT INTO `view_page_component_api` VALUES (52, 52, 74);
INSERT INTO `view_page_component_api` VALUES (53, 53, 83);
INSERT INTO `view_page_component_api` VALUES (54, 54, 84);
INSERT INTO `view_page_component_api` VALUES (55, 54, 86);
INSERT INTO `view_page_component_api` VALUES (56, 55, 85);

SET FOREIGN_KEY_CHECKS = 1;
