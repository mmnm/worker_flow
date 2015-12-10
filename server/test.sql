-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'event'
-- 
-- ---

DROP TABLE IF EXISTS `event`;
    
CREATE TABLE `event` (
  `eventID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `userID` INTEGER NULL DEFAULT NULL,
  `text` MEDIUMTEXT NULL DEFAULT NULL,
  `start_time` DATETIME NULL DEFAULT NULL,
  `end_time` DATETIME NULL DEFAULT NULL,
  `post_time` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`eventID`)
);

-- ---
-- Table 'user'
-- 
-- ---

DROP TABLE IF EXISTS `user`;
    
CREATE TABLE `user` (
  `userID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `age` INTEGER NULL DEFAULT NULL,
  `sex` CHAR(1) NULL DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `profile_picture` BLOB NULL DEFAULT NULL,
  `employer` VARCHAR(100) NULL DEFAULT NULL,
  `job_title` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`userID`)
);

-- START REMOVE

CREATE TABLE `user` (
  `userID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `age` INTEGER NULL DEFAULT NULL,
  `sex` CHAR(1) NULL DEFAULT NULL,
  `name` VARCHAR(100),
  `profile_picture` BLOB,
  PRIMARY KEY (`userID`)
);

-- END REMOVE

-- ---
-- Table 'room'
-- 
-- ---

DROP TABLE IF EXISTS `room`;
    
CREATE TABLE `room` (
  `roomID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `expiry_time` DATETIME NULL DEFAULT NULL,
  `eventID` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`roomID`)
);

-- ---
-- Table 'user_interest'
-- 
-- ---

DROP TABLE IF EXISTS `user_interest`;
    
CREATE TABLE `user_interest` (
  `userID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `interest` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`userID`, `interest`)
);

-- ---
-- Table 'user_friendship'
-- 
-- ---

DROP TABLE IF EXISTS `user_friendship`;
    
CREATE TABLE `user_friendship` (
  `userID_1` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `userID_2` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`userID_1`, `userID_2`)
);

-- ---
-- Table 'user_educational_institution'
-- 
-- ---

DROP TABLE IF EXISTS `user_educational_institution`;
    
CREATE TABLE `user_educational_institution` (
  `userID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `institution_name` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`userID`, `institution_name`)
);

-- ---
-- Table 'event_tag'
-- 
-- ---

DROP TABLE IF EXISTS `event_tag`;
    
CREATE TABLE `event_tag` (
  `eventID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `tagID` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`eventID`, `tagID`)
);

-- ---
-- Table 'event_like'
-- 
-- ---

DROP TABLE IF EXISTS `event_like`;
    
CREATE TABLE `event_like` (
  `eventID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `userID` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`eventID`, `userID`)
);

-- ---
-- Table 'tag'
-- 
-- ---

DROP TABLE IF EXISTS `tag`;
    
CREATE TABLE `tag` (
  `tagID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`tagID`)
);

-- ---
-- Table 'room_user'
-- 
-- ---

DROP TABLE IF EXISTS `room_user`;
    
CREATE TABLE `room_user` (
  `roomID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `userID` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`roomID`, `userID`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `event` ADD FOREIGN KEY (userID) REFERENCES `user` (`userID`);
ALTER TABLE `room` ADD FOREIGN KEY (eventID) REFERENCES `event` (`eventID`);
ALTER TABLE `user_interest` ADD FOREIGN KEY (userID) REFERENCES `user` (`userID`);
ALTER TABLE `user_friendship` ADD FOREIGN KEY (userID_1) REFERENCES `user` (`userID`);
ALTER TABLE `user_friendship` ADD FOREIGN KEY (userID_2) REFERENCES `user` (`userID`);
ALTER TABLE `user_educational_institution` ADD FOREIGN KEY (userID) REFERENCES `user` (`userID`);
ALTER TABLE `event_tag` ADD FOREIGN KEY (eventID) REFERENCES `event` (`eventID`);
ALTER TABLE `event_tag` ADD FOREIGN KEY (tagID) REFERENCES `tag` (`tagID`);
ALTER TABLE `event_like` ADD FOREIGN KEY (eventID) REFERENCES `event` (`eventID`);
ALTER TABLE `event_like` ADD FOREIGN KEY (userID) REFERENCES `user` (`userID`);
ALTER TABLE `room_user` ADD FOREIGN KEY (roomID) REFERENCES `room` (`roomID`);
ALTER TABLE `room_user` ADD FOREIGN KEY (userID) REFERENCES `user` (`userID`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `event` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `room` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `user_interest` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `user_friendship` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `user_educational_institution` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `event_tag` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `event_like` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tag` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `room_user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `event` (`eventID`,`userID`,`text`,`start_time`,`end_time`,`post_time`) VALUES
-- ('','','','','','');
-- INSERT INTO `user` (`userID`,`age`,`sex`,`name`,`profile_picture`,`employer`,`job_title`) VALUES
-- ('','','','','','','');
-- INSERT INTO `room` (`roomID`,`expiry_time`,`eventID`) VALUES
-- ('','','');
-- INSERT INTO `user_interest` (`userID`,`interest`) VALUES
-- ('','');
-- INSERT INTO `user_friendship` (`userID_1`,`userID_2`) VALUES
-- ('','');
-- INSERT INTO `user_educational_institution` (`userID`,`institution_name`) VALUES
-- ('','');
-- INSERT INTO `event_tag` (`eventID`,`tagID`) VALUES
-- ('','');
-- INSERT INTO `event_like` (`eventID`,`userID`) VALUES
-- ('','');
-- INSERT INTO `tag` (`tagID`,`name`) VALUES
-- ('','');
-- INSERT INTO `room_user` (`roomID`,`userID`) VALUES
-- ('','');



INSERT INTO `user` (`userID`,`age`,`sex`,`name`,`profile_picture`,`employer`,`job_title`) VALUES
('0','12','M','g','adfgfdag','asdg','asdg');

select userID, name from user;
