-------------------------
#Introducer SQL Table Schema

CREATE TABLE `lankabangla`.`introducer` (
  `Introducer_id` VARCHAR(8) NOT NULL,
  `name` VARCHAR(40) NULL,
  `phone_number` VARCHAR(11) NULL,
  `email` VARCHAR(20) NULL,
  `occupation` VARCHAR(20) NULL,
  `DOB` DATETIME NULL,
  PRIMARY KEY (`Introducer_id`),
  UNIQUE INDEX `Introducer_id_UNIQUE` (`Introducer_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) VISIBLE);

--------------------------
#BO Account SQL Table Schema

CREATE TABLE `lankabangla`.`bo_account` (
  `bo_number` VARCHAR(16) NOT NULL,
  `email` VARCHAR(40) NULL,
  `bo_nid` VARCHAR(16) NULL,
  `occupation` VARCHAR(20) NULL,
  `DOB` DATETIME NULL,
  `nationality` VARCHAR(30) NULL,
  `photo` VARCHAR(45) NULL,
  `signature` VARCHAR(45) NULL,
  `account_type` TINYINT NULL,
  `operation_type` VARCHAR(2) NULL,
  `opening_date` DATETIME NULL,
  PRIMARY KEY (`bo_number`),
  UNIQUE INDEX `bo_number_UNIQUE` (`bo_number` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `bo_nid_UNIQUE` (`bo_nid` ASC) VISIBLE);

-----------------------
Bank table sql
#Bank Table SQL Schema

CREATE TABLE `lankabangla`.`bank` (
  `bank_code` VARCHAR(18) NOT NULL,
  `account` VARCHAR(20) NULL,
  PRIMARY KEY (`bank_code`),
  UNIQUE INDEX `account_UNIQUE` (`account` ASC) VISIBLE,
  UNIQUE INDEX `bank_code_UNIQUE` (`bank_code` ASC) VISIBLE);
-------------------------
Bank branch number

CREATE TABLE `lankabangla`.`bank_branch_number` (
  `bank_code` VARCHAR(18) NOT NULL,
  `branch_no` VARCHAR(45) NULL, ----------- needs to be clarified and corrected
  PRIMARY KEY (`bank_code`),
  UNIQUE INDEX `branch_no_UNIQUE` (`branch_no` ASC) VISIBLE,
  CONSTRAINT `bank_code`
    FOREIGN KEY (`bank_code`)
    REFERENCES `lankabangla`.`bank` (`bank_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
------------------------------
branch number altered
ALTER TABLE `lankabangla`.`bank_branch_number` 
DROP FOREIGN KEY `bank_code`;
ALTER TABLE `lankabangla`.`bank_branch_number` 
ADD CONSTRAINT `bank_branchNo_code`
  FOREIGN KEY (`bank_code`)
  REFERENCES `lankabangla`.`bank` (`bank_code`);


------------------------------
bank routing number

CREATE TABLE `lankabangla`.`bank_routing_number` (
  `bank_code` VARCHAR(18) NOT NULL,
  `routing_number` VARCHAR(10) NULL,
  PRIMARY KEY (`bank_code`),
  UNIQUE INDEX `routing_number_UNIQUE` (`routing_number` ASC) VISIBLE);
--------------------------
bank routing number altered

ALTER TABLE `lankabangla`.`bank_routing_number` 
ADD CONSTRAINT `bank_code`
  FOREIGN KEY (`bank_code`)
  REFERENCES `lankabangla`.`bank` (`bank_code`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

----------------
bank name sql

CREATE TABLE `lankabangla`.`bank_branch_name` (
  `bank_code` VARCHAR(18) NOT NULL,
  `branch_name` VARCHAR(15) NULL,
  PRIMARY KEY (`bank_code`),
  UNIQUE INDEX `branch_name_UNIQUE` (`branch_name` ASC) VISIBLE,
  CONSTRAINT `bank_branch_code`
    FOREIGN KEY (`bank_code`)
    REFERENCES `lankabangla`.`bank` (`bank_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

----------------------------------
CLIENT sql

CREATE TABLE `lankabangla`.`client` (
  `account_number` VARCHAR(8) NOT NULL,
  `client_code` VARCHAR(15) NULL,
  `title` VARCHAR(3) NULL,
  `client_name` VARCHAR(30) NULL,
  `father_name` VARCHAR(30) NULL,
  `mother_name` VARCHAR(30) NULL,
  `spouse_name` VARCHAR(30) NULL,
  `country` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL, ---------- needs to be corrected to VARCHAR(11)
  `operation` VARCHAR(45) NULL,
  `intro_id` VARCHAR(45) NULL,
  `bo_account_number` VARCHAR(45) NULL,
  `bank_account_number` VARCHAR(45) NULL, -------- need to add photo and signature
  PRIMARY KEY (`account_number`),
  UNIQUE INDEX `account_number_UNIQUE` (`account_number` ASC) VISIBLE,
  UNIQUE INDEX `client_code_UNIQUE` (`client_code` ASC) VISIBLE,
  UNIQUE INDEX `bo_number_UNIQUE` (`bo_account_number` ASC) VISIBLE,
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) VISIBLE,
  INDEX `intro_id_idx` (`intro_id` ASC) VISIBLE,
  INDEX `bank_account_number_idx` (`bank_account_number` ASC) VISIBLE,
  CONSTRAINT `intro_id`
    FOREIGN KEY (`intro_id`)
    REFERENCES `lankabangla`.`introducer` (`Introducer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bo_account_number`
    FOREIGN KEY (`bo_account_number`)
    REFERENCES `lankabangla`.`bo_account` (`bo_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bank_account_number`
    FOREIGN KEY (`bank_account_number`)
    REFERENCES `lankabangla`.`bank` (`account`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
------------------------------------------
first account sql

CREATE TABLE `lankabangla`.`first_account` (
  `first_account_number` VARCHAR(8) NOT NULL,
  `nid` VARCHAR(10) NULL,
  `dateOfbirth` DATETIME NULL,
  `occupation` VARCHAR(20) NULL,
  `phone_number` VARCHAR(11) NULL,
  `email` VARCHAR(45) NULL, ---------- needs to be corrected to VARCHAR(20)
  `nationality` VARCHAR(30) NULL,
  `photo` VARCHAR(45) NULL,
  `signature` VARCHAR(45) NULL,
  PRIMARY KEY (`first_account_number`),
  UNIQUE INDEX `first_account_number_UNIQUE` (`first_account_number` ASC) VISIBLE,
  UNIQUE INDEX `nid_UNIQUE` (`nid` ASC) VISIBLE,
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `FA_account_number`
    FOREIGN KEY (`first_account_number`)
    REFERENCES `lankabangla`.`client` (`account_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
------------------------------------------
first account altered

-------------------------------------------
joint account sql

CREATE TABLE `lankabangla`.`joint_account` (
  `joint_account_number` VARCHAR(8) NOT NULL,
  `title` VARCHAR(45) NULL,
  `spouse_name` VARCHAR(45) NULL, --------|
  `mother_name` VARCHAR(45) NULL,---------|-- needs to corrected to VARCHAR(30)
  `father_name` VARCHAR(45) NULL,---------|
  `present_address` VARCHAR(45) NULL,
  `permanent_address` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL, ------------ needs to be corrected to VARCHAR(11)
  `intro_id` VARCHAR(8) NULL,
  `bo_account_number` VARCHAR(16) NULL,
  `bank_account_number` VARCHAR(20) NULL,
  PRIMARY KEY (`joint_account_number`),
  UNIQUE INDEX `joint_account_number_UNIQUE` (`joint_account_number` ASC) VISIBLE,
  UNIQUE INDEX `bo_account_number_UNIQUE` (`bo_account_number` ASC) VISIBLE,
  UNIQUE INDEX `bank_account_number_UNIQUE` (`bank_account_number` ASC) VISIBLE,
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) VISIBLE,
  INDEX `introducer_id_idx` (`intro_id` ASC) VISIBLE,
  CONSTRAINT `introducer_id`
    FOREIGN KEY (`intro_id`)
    REFERENCES `lankabangla`.`introducer` (`Introducer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bo_account_no`
    FOREIGN KEY (`bo_account_number`)
    REFERENCES `lankabangla`.`bo_account` (`bo_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bank_account_no`
    FOREIGN KEY (`bank_account_number`)
    REFERENCES `lankabangla`.`bank` (`account`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-------------------------------------------------
nominee sql table

CREATE TABLE `lankabangla`.`nominee` (
  `account_number` VARCHAR(8) NOT NULL,
  `title` VARCHAR(2) NULL,
  `name` VARCHAR(30) NULL,
  `address` VARCHAR(45) NULL,
  `phone_number` VARCHAR(11) NULL,
  `email` VARCHAR(20) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(20) NULL,
  `post_code` VARCHAR(4) NULL,
  `nid` VARCHAR(10) NULL,
  `dateofbirth` DATETIME NULL,
  PRIMARY KEY (`account_number`),
  CONSTRAINT `nominee_account_number`
    FOREIGN KEY (`account_number`)
    REFERENCES `lankabangla`.`client` (`account_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
------------------------------------------------
authorized account (table schema needs to be corrected name attribute is to be added)

CREATE TABLE `lankabangla`.`authorized_person` (
  `account_number` VARCHAR(8) NOT NULL,
  `title` VARCHAR(30) NULL,
  `name` VARCHAR(30) NULL,
  `spouse_name` VARCHAR(30) NULL,
  `mother_name` VARCHAR(30) NULL,
  `father_name` VARCHAR(30) NULL,
  `nid` VARCHAR(10) NULL,
  `address` VARCHAR(100) NULL,
  `country` VARCHAR(45) NULL,
  `dateofbirth` DATETIME NULL,
  `occupation` VARCHAR(45) NULL,
  `phone_number` VARCHAR(11) NULL,
  `email` VARCHAR(20) NULL,
  `nationality` VARCHAR(30) NULL,
  `photo` VARCHAR(45) NULL,
  `signature` VARCHAR(45) NULL,
  PRIMARY KEY (`account_number`),
  UNIQUE INDEX `account_number_UNIQUE` (`account_number` ASC) VISIBLE,
  CONSTRAINT `company_account_no`
    FOREIGN KEY (`account_number`)
    REFERENCES `lankabangla`.`client` (`account_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-------------------------------------------------
power_of_attorney (there is a problem with attorney_address and attorney_residency)

CREATE TABLE `lankabangla`.`power_of_attorney` (
  `bo_number` VARCHAR(16) NOT NULL,
  `CDBL_account_no` VARCHAR(45) NULL,
  `name_of_account_holder` VARCHAR(30) NULL,
  `attorney_name` VARCHAR(30) NULL,
  `attorney_address` VARCHAR(100) NULL,
  `attorney_number` VARCHAR(11) NULL,
  `attorney_passport_no` VARCHAR(45) NULL, ------ needs to be checked
  `attorney_country` VARCHAR(45) NULL,
  `attorney_nationality` VARCHAR(45) NULL,
  `attorney_dob` VARCHAR(45) NULL,
  `effective_date` VARCHAR(45) NULL,
  PRIMARY KEY (`bo_number`),
  UNIQUE INDEX `bo_number_UNIQUE` (`bo_number` ASC) VISIBLE,
  UNIQUE INDEX `CDBL_account_no_UNIQUE` (`CDBL_account_no` ASC) VISIBLE,
  UNIQUE INDEX `attorney_passport_no_UNIQUE` (`attorney_passport_no` ASC) VISIBLE,
  UNIQUE INDEX `attorney_number_UNIQUE` (`attorney_number` ASC) VISIBLE,
  CONSTRAINT `kyc_bo_no`
    FOREIGN KEY (`bo_number`)
    REFERENCES `lankabangla`.`bo_account` (`bo_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
--------------------------------------------------
corporate table sql

CREATE TABLE `lankabangla`.`corporate` (
  `corp_account_num` VARCHAR(8) NOT NULL,
  `company_name` VARCHAR(30) NULL,
  PRIMARY KEY (`corp_account_num`),
  UNIQUE INDEX `corp_account_num_UNIQUE` (`corp_account_num` ASC) VISIBLE,
  CONSTRAINT `com_account_num`
    FOREIGN KEY (`corp_account_num`)
    REFERENCES `lankabangla`.`client` (`account_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
--------------------------------------------------
kyc sql table

CREATE TABLE `lankabangla`.`kyc` (
  `bo_account_num` VARCHAR(16) NOT NULL,
  `account_name` VARCHAR(30) NULL,
  `type_of_account` VARCHAR(2) NULL,
  `intro_name` VARCHAR(30) NULL,
  `source_of_fund` VARCHAR(120) NULL,
  `passport_num` VARCHAR(45) NULL,
  `tin_num` VARCHAR(45) NULL,
  `var_reg_no` VARCHAR(45) NULL,
  `driving_license_no` VARCHAR(45) NULL,
  `signature` VARCHAR(45) NULL,
  PRIMARY KEY (`bo_account_num`),
  UNIQUE INDEX `bo_account_num_UNIQUE` (`bo_account_num` ASC) VISIBLE,
  UNIQUE INDEX `tin_num_UNIQUE` (`tin_num` ASC) VISIBLE,
  UNIQUE INDEX `passport_num_UNIQUE` (`passport_num` ASC) VISIBLE,
  UNIQUE INDEX `driving_license_no_UNIQUE` (`driving_license_no` ASC) VISIBLE,
  UNIQUE INDEX `var_reg_no_UNIQUE` (`var_reg_no` ASC) VISIBLE,
  CONSTRAINT `kyc_bo_number`
    FOREIGN KEY (`bo_account_num`)
    REFERENCES `lankabangla`.`bo_account` (`bo_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


