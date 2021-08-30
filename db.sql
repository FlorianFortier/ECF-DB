CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

DROP TABLE IF EXISTS `User` ;

CREATE TABLE IF NOT EXISTS `User` (
    `id_User` INT NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(45) NOT NULL,
    `LastName` VARCHAR(45) NOT NULL,
    `User_Mail` VARCHAR(45) NOT NULL,
    `User_Tel` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id_User`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `request` ;

CREATE TABLE IF NOT EXISTS `request` (
    `id_request` INT NOT NULL AUTO_INCREMENT,
    `Object` VARCHAR(45) NOT NULL,
    `Message` TEXT NOT NULL,
    `Date` DATETIME NOT NULL,
    `Status` VARCHAR(45) NOT NULL,
    `User_id` INT NOT NULL,
    PRIMARY KEY (`id_request`),
    FOREIGN KEY (`User_id`)
    REFERENCES `User` (`id_User`) ON DELETE CASCADE
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `Order` ;

CREATE TABLE IF NOT EXISTS `Order` (
    `id_Order` INT NOT NULL AUTO_INCREMENT,
    `Order_Number` INT NOT NULL,
    `Price_Dollars` INT NOT NULL,
    `User_id` INT NOT NULL,
    PRIMARY KEY (`id_Order`),
    FOREIGN KEY (`User_id`) 
    REFERENCES `User` (`id_User`) ON DELETE CASCADE
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `Operator` ;

CREATE TABLE IF NOT EXISTS `Operator` (
    `id_Operator` INT NOT NULL AUTO_INCREMENT,
    `Firstname_Op` VARCHAR(45) NOT NULL,
    `Lastname_Op` VARCHAR(45) NOT NULL,
    `Op_Mail` VARCHAR(45) NOT NULL,
    `Op_Tel` INT NOT NULL,
    PRIMARY KEY (`id_Operator`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `Operator_Request_link` ;

CREATE TABLE IF NOT EXISTS `Operator_Request_link` (
    `request_id` INT NOT NULL,
    `Operator_id` INT NOT NULL,
    PRIMARY KEY (`request_id`, `Operator_id`),
    FOREIGN KEY (`request_id`) 
    REFERENCES `request` (`id_request`) ON DELETE CASCADE,
    FOREIGN KEY (`Operator_id`)
    REFERENCES `Operator` (`id_Operator`) ON DELETE CASCADE
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `Orders_Request_link` ;

CREATE TABLE IF NOT EXISTS `Orders_Request_link` (
    `Order_id` INT NOT NULL,
    `request_id` INT NOT NULL,
    PRIMARY KEY (`Order_id`, `request_id`),
    FOREIGN KEY (`Order_id`)
    REFERENCES `Order` (`id_Order`) ON DELETE CASCADE,
    FOREIGN KEY (`request_id`)
    REFERENCES `request` (`id_request`) ON DELETE CASCADE
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `ticket` ;

CREATE TABLE IF NOT EXISTS `ticket` (
    `id_ticket` INT NOT NULL AUTO_INCREMENT,
    `Ticket_Number` INT NOT NULL,
    `request_id` INT NOT NULL,
    PRIMARY KEY (`id_ticket`),
    FOREIGN KEY (`request_id`)
    REFERENCES `request` (`id_request`) ON DELETE CASCADE
) ENGINE = InnoDB;

/* Insert Values */

/*  User values  */

INSERT INTO `user` (`FirstName`, `LastName`, `User_Mail`,`User_Tel`) 
VALUES ('Nicolas','Dupont','example@gmail.com',06000900);
INSERT INTO `user` (`FirstName`, `LastName`, `User_Mail`,`User_Tel`) 
VALUES ('Jean','Dupont','example@gmail.com',06004500);
INSERT INTO `user` (`FirstName`, `LastName`, `User_Mail`,`User_Tel`) 
VALUES ('Louis','Marant','example@gmail.com',06910900);

/* users requests values*/

INSERT INTO `request` (`Object`, `Message`,`Date`,`Status`,`User_id`) 
VALUES ('Problem1','lorem ipsum dolor sit amet','2021-08-30 10:00:05.000000','todo',1);
INSERT INTO `request` (`Object`, `Message`,`Date`,`Status`,`User_id`) 
VALUES ('Problem2','lorem ipsum dolor sit amet','2021-08-30 11:00:05.000000','todo',2);
INSERT INTO `request` (`Object`, `Message`,`Date`,`Status`,`User_id`) 
VALUES ('Problem3','lorem ipsum dolor sit amet','2021-08-30 12:00:05.000000','todo',3);

/* orders values */

INSERT INTO `Order` (`Order_Number`, `Price_Dollars`, `User_id`)
VALUES (174786,100,2);
INSERT INTO `Order` (`Order_Number`, `Price_Dollars`, `User_id`)
VALUES (1746,120,1);
INSERT INTO `Order` (`Order_Number`, `Price_Dollars`, `User_id`)
VALUES (174,300,3);

/* Operator values */

INSERT INTO `Operator` (`Firstname_Op`,`Lastname_Op`, `Op_Mail`,`Op_Tel`)
VALUES ('Sylvie','Marion','exemple.op1@gmail.com',0910101020);
INSERT INTO `Operator` (`Firstname_Op`,`Lastname_Op`, `Op_Mail`,`Op_Tel`)
VALUES ('Nils','Dorys','exemple.op2@gmail.com',0910161028);
INSERT INTO `Operator` (`Firstname_Op`,`Lastname_Op`, `Op_Mail`,`Op_Tel`)
VALUES ('Isabel','Dos Santos','exemple.op3@gmail.com',0913121820);

/* tickets */

INSERT INTO `ticket` (`Ticket_Number`,`request_id`)
VALUES (190998,1);
INSERT INTO `ticket` (`Ticket_Number`,`request_id`)
VALUES (394298,2);
INSERT INTO `ticket` (`Ticket_Number`,`request_id`)
VALUES (290298,3);