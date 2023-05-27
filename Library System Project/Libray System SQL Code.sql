CREATE SCHEMA IF NOT EXISTS `A2` DEFAULT CHARACTER SET utf8 ;
CREATE TABLE IF NOT EXISTS `A2`.`TCard_eAccounts` (
  `Account_num` INT NOT NULL,
  `Deposit_date` DATETIME NULL,
  `Balance` INT NULL,
  `Payment_date` DATETIME NULL,
  PRIMARY KEY (`Account_num`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `A2`.`Student` (
  `S_Utorid` INT NOT NULL,
  `First_name` VARCHAR(45) NULL,
  `Last_name` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Sex` VARCHAR(45) NULL,
  `Birth_date` DATE NULL,
  `student_number` VARCHAR(45) NULL,
  `TCard_eAccounts_Account_num` INT NOT NULL,
  PRIMARY KEY (`S_Utorid`, `TCard_eAccounts_Account_num`),
  INDEX `fk_Student_TCard_eAccounts_idx` (`TCard_eAccounts_Account_num` ASC) VISIBLE,
  CONSTRAINT `fk_Student_TCard_eAccounts`
    FOREIGN KEY (`TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`TCard_eAccounts` (`Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `A2`.`Faculty` (
  `F_Utorid` INT NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Department` VARCHAR(45) NULL,
  `Sex` VARCHAR(45) NULL,
  `First_name` VARCHAR(45) NULL,
  `Last_name` VARCHAR(45) NULL,
  `Middle_name` VARCHAR(45) NULL,
  `TCard_eAccounts_Account_num` INT NOT NULL,
  PRIMARY KEY (`F_Utorid`, `TCard_eAccounts_Account_num`),
  INDEX `fk_Faculty_TCard_eAccounts1_idx` (`TCard_eAccounts_Account_num` ASC) VISIBLE,
  CONSTRAINT `fk_Faculty_TCard_eAccounts1`
    FOREIGN KEY (`TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`TCard_eAccounts` (`Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `A2`.`Library_staff` (
  `L_Utorid` INT NOT NULL,
  `Department` VARCHAR(45) NULL,
  `Birth_date` DATE NULL,
  `First_name` VARCHAR(45) NULL,
  `Middle_name` VARCHAR(45) NULL,
  `Last_name` VARCHAR(45) NULL,
  `TCard_eAccounts_Account_num` INT NOT NULL,
  PRIMARY KEY (`L_Utorid`, `TCard_eAccounts_Account_num`),
  INDEX `fk_Library_staff_TCard_eAccounts1_idx` (`TCard_eAccounts_Account_num` ASC) VISIBLE,
  CONSTRAINT `fk_Library_staff_TCard_eAccounts1`
    FOREIGN KEY (`TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`TCard_eAccounts` (`Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `A2`.`Printer` (
  `Printer_id` INT NOT NULL,
  `Printing_task` VARCHAR(45) NULL,
  `Paper_load` VARCHAR(45) NULL,
  `Student_S_Utorid` INT NOT NULL,
  `Student_TCard_eAccounts_Account_num` INT NOT NULL,
  `Faculty_F_Utorid` INT NOT NULL,
  `Faculty_TCard_eAccounts_Account_num` INT NOT NULL,
  PRIMARY KEY (`Printer_id`, `Student_S_Utorid`, `Student_TCard_eAccounts_Account_num`, `Faculty_F_Utorid`, `Faculty_TCard_eAccounts_Account_num`),
  INDEX `fk_Printer_Student1_idx` (`Student_S_Utorid` ASC, `Student_TCard_eAccounts_Account_num` ASC) VISIBLE,
  INDEX `fk_Printer_Faculty1_idx` (`Faculty_F_Utorid` ASC, `Faculty_TCard_eAccounts_Account_num` ASC) VISIBLE,
  CONSTRAINT `fk_Printer_Student1`
    FOREIGN KEY (`Student_S_Utorid` , `Student_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Student` (`S_Utorid` , `TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Printer_Faculty1`
    FOREIGN KEY (`Faculty_F_Utorid` , `Faculty_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Faculty` (`F_Utorid` , `TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `A2`.`Technology Supplies` (
  `Item_id` INT NOT NULL,
  `Borrow_date` DATETIME NULL,
  `Status` VARCHAR(45) NULL,
  `Return_date` DATETIME NULL,
  `Student_S_Utorid` INT NOT NULL,
  `Student_TCard_eAccounts_Account_num` INT NOT NULL,
  `Faculty_F_Utorid` INT NOT NULL,
  `Faculty_TCard_eAccounts_Account_num` INT NOT NULL,
  PRIMARY KEY (`Item_id`, `Student_S_Utorid`, `Student_TCard_eAccounts_Account_num`, `Faculty_F_Utorid`, `Faculty_TCard_eAccounts_Account_num`),
  INDEX `fk_Technology Supplies_Student1_idx` (`Student_S_Utorid` ASC, `Student_TCard_eAccounts_Account_num` ASC) VISIBLE,
  INDEX `fk_Technology Supplies_Faculty1_idx` (`Faculty_F_Utorid` ASC, `Faculty_TCard_eAccounts_Account_num` ASC) VISIBLE,
  CONSTRAINT `fk_Technology Supplies_Student1`
    FOREIGN KEY (`Student_S_Utorid` , `Student_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Student` (`S_Utorid` , `TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Technology Supplies_Faculty1`
    FOREIGN KEY (`Faculty_F_Utorid` , `Faculty_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Faculty` (`F_Utorid` , `TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `A2`.`Publications` (
  `Barcode` INT NOT NULL,
  `Status` VARCHAR(45) NULL,
  `Author` VARCHAR(45) NULL,
  `Publisher` VARCHAR(45) NULL,
  `Publication_title` VARCHAR(45) NULL,
  `Category` VARCHAR(45) NULL,
  `Student_S_Utorid` INT NOT NULL,
  `Student_TCard_eAccounts_Account_num` INT NOT NULL,
  `Faculty_F_Utorid` INT NOT NULL,
  `Faculty_TCard_eAccounts_Account_num` INT NOT NULL,
  PRIMARY KEY (`Barcode`, `Student_S_Utorid`, `Student_TCard_eAccounts_Account_num`, `Faculty_F_Utorid`, `Faculty_TCard_eAccounts_Account_num`),
  INDEX `fk_Publications_Student1_idx` (`Student_S_Utorid` ASC, `Student_TCard_eAccounts_Account_num` ASC) VISIBLE,
  INDEX `fk_Publications_Faculty1_idx` (`Faculty_F_Utorid` ASC, `Faculty_TCard_eAccounts_Account_num` ASC) VISIBLE,
  CONSTRAINT `fk_Publications_Student1`
    FOREIGN KEY (`Student_S_Utorid` , `Student_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Student` (`S_Utorid` , `TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Publications_Faculty1`
    FOREIGN KEY (`Faculty_F_Utorid` , `Faculty_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Faculty` (`F_Utorid` , `TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `A2`.`Library_staff_has_Printer` (
  `Library_staff_L_Utorid` INT NOT NULL,
  `Library_staff_TCard_eAccounts_Account_num` INT NOT NULL,
  `Printer_Printer_id` INT NOT NULL,
  `Printer_Student_S_Utorid` INT NOT NULL,
  `Printer_Student_TCard_eAccounts_Account_num` INT NOT NULL,
  `Printer_Faculty_F_Utorid` INT NOT NULL,
  `Printer_Faculty_TCard_eAccounts_Account_num` INT NOT NULL,
  PRIMARY KEY (`Library_staff_L_Utorid`, `Library_staff_TCard_eAccounts_Account_num`, `Printer_Printer_id`, `Printer_Student_S_Utorid`, `Printer_Student_TCard_eAccounts_Account_num`, `Printer_Faculty_F_Utorid`, `Printer_Faculty_TCard_eAccounts_Account_num`),
  INDEX `fk_Library_staff_has_Printer_Printer1_idx` (`Printer_Printer_id` ASC, `Printer_Student_S_Utorid` ASC, `Printer_Student_TCard_eAccounts_Account_num` ASC, `Printer_Faculty_F_Utorid` ASC, `Printer_Faculty_TCard_eAccounts_Account_num` ASC) VISIBLE,
  INDEX `fk_Library_staff_has_Printer_Library_staff1_idx` (`Library_staff_L_Utorid` ASC, `Library_staff_TCard_eAccounts_Account_num` ASC) VISIBLE,
  CONSTRAINT `fk_Library_staff_has_Printer_Library_staff1`
    FOREIGN KEY (`Library_staff_L_Utorid` , `Library_staff_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Library_staff` (`L_Utorid` , `TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Library_staff_has_Printer_Printer1`
    FOREIGN KEY (`Printer_Printer_id` , `Printer_Student_S_Utorid` , `Printer_Student_TCard_eAccounts_Account_num` , `Printer_Faculty_F_Utorid` , `Printer_Faculty_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Printer` (`Printer_id` , `Student_S_Utorid` , `Student_TCard_eAccounts_Account_num` , `Faculty_F_Utorid` , `Faculty_TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `A2`.`Library_staff_has_Publications` (
  `Library_staff_L_Utorid` INT NOT NULL,
  `Library_staff_TCard_eAccounts_Account_num` INT NOT NULL,
  `Publications_Barcode` INT NOT NULL,
  `Publications_Student_S_Utorid` INT NOT NULL,
  `Publications_Student_TCard_eAccounts_Account_num` INT NOT NULL,
  `Publications_Faculty_F_Utorid` INT NOT NULL,
  `Publications_Faculty_TCard_eAccounts_Account_num` INT NOT NULL,
  PRIMARY KEY (`Library_staff_L_Utorid`, `Library_staff_TCard_eAccounts_Account_num`, `Publications_Barcode`, `Publications_Student_S_Utorid`, `Publications_Student_TCard_eAccounts_Account_num`, `Publications_Faculty_F_Utorid`, `Publications_Faculty_TCard_eAccounts_Account_num`),
  INDEX `fk_Library_staff_has_Publications_Publications1_idx` (`Publications_Barcode` ASC, `Publications_Student_S_Utorid` ASC, `Publications_Student_TCard_eAccounts_Account_num` ASC, `Publications_Faculty_F_Utorid` ASC, `Publications_Faculty_TCard_eAccounts_Account_num` ASC) VISIBLE,
  INDEX `fk_Library_staff_has_Publications_Library_staff1_idx` (`Library_staff_L_Utorid` ASC, `Library_staff_TCard_eAccounts_Account_num` ASC) VISIBLE,
  CONSTRAINT `fk_Library_staff_has_Publications_Library_staff1`
    FOREIGN KEY (`Library_staff_L_Utorid` , `Library_staff_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Library_staff` (`L_Utorid` , `TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Library_staff_has_Publications_Publications1`
    FOREIGN KEY (`Publications_Barcode` , `Publications_Student_S_Utorid` , `Publications_Student_TCard_eAccounts_Account_num` , `Publications_Faculty_F_Utorid` , `Publications_Faculty_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Publications` (`Barcode` , `Student_S_Utorid` , `Student_TCard_eAccounts_Account_num` , `Faculty_F_Utorid` , `Faculty_TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `A2`.`Library_staff_has_Technology Supplies` (
  `Library_staff_L_Utorid` INT NOT NULL,
  `Library_staff_TCard_eAccounts_Account_num` INT NOT NULL,
  `Technology Supplies_Item_id` INT NOT NULL,
  `Technology Supplies_Student_S_Utorid` INT NOT NULL,
  `Technology Supplies_Student_TCard_eAccounts_Account_num` INT NOT NULL,
  `Technology Supplies_Faculty_F_Utorid` INT NOT NULL,
  `Technology Supplies_Faculty_TCard_eAccounts_Account_num` INT NOT NULL,
  PRIMARY KEY (`Library_staff_L_Utorid`, `Library_staff_TCard_eAccounts_Account_num`, `Technology Supplies_Item_id`, `Technology Supplies_Student_S_Utorid`, `Technology Supplies_Student_TCard_eAccounts_Account_num`, `Technology Supplies_Faculty_F_Utorid`, `Technology Supplies_Faculty_TCard_eAccounts_Account_num`),
  INDEX `fk_Library_staff_has_Technology Supplies_Technology Supplie_idx` (`Technology Supplies_Item_id` ASC, `Technology Supplies_Student_S_Utorid` ASC, `Technology Supplies_Student_TCard_eAccounts_Account_num` ASC, `Technology Supplies_Faculty_F_Utorid` ASC, `Technology Supplies_Faculty_TCard_eAccounts_Account_num` ASC) VISIBLE,
  INDEX `fk_Library_staff_has_Technology Supplies_Library_staff1_idx` (`Library_staff_L_Utorid` ASC, `Library_staff_TCard_eAccounts_Account_num` ASC) VISIBLE,
  CONSTRAINT `fk_Library_staff_has_Technology Supplies_Library_staff1`
    FOREIGN KEY (`Library_staff_L_Utorid` , `Library_staff_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Library_staff` (`L_Utorid` , `TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Library_staff_has_Technology Supplies_Technology Supplies1`
    FOREIGN KEY (`Technology Supplies_Item_id` , `Technology Supplies_Student_S_Utorid` , `Technology Supplies_Student_TCard_eAccounts_Account_num` , `Technology Supplies_Faculty_F_Utorid` , `Technology Supplies_Faculty_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Technology Supplies` (`Item_id` , `Student_S_Utorid` , `Student_TCard_eAccounts_Account_num` , `Faculty_F_Utorid` , `Faculty_TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `A2`.`Room_booking` (
  `Booking_id` INT NOT NULL,
  `Room_num` VARCHAR(45) NULL,
  `Room_type` VARCHAR(45) NULL,
  `Booking_date` DATE NULL,
  `Student_S_Utorid` INT NOT NULL,
  `Student_TCard_eAccounts_Account_num` INT NOT NULL,
  `Faculty_F_Utorid` INT NOT NULL,
  `Faculty_TCard_eAccounts_Account_num` INT NOT NULL,
  PRIMARY KEY (`Booking_id`, `Student_S_Utorid`, `Student_TCard_eAccounts_Account_num`, `Faculty_F_Utorid`, `Faculty_TCard_eAccounts_Account_num`),
  INDEX `fk_Room_booking_Student1_idx` (`Student_S_Utorid` ASC, `Student_TCard_eAccounts_Account_num` ASC) VISIBLE,
  INDEX `fk_Room_booking_Faculty1_idx` (`Faculty_F_Utorid` ASC, `Faculty_TCard_eAccounts_Account_num` ASC) VISIBLE,
  CONSTRAINT `fk_Room_booking_Student1`
    FOREIGN KEY (`Student_S_Utorid` , `Student_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Student` (`S_Utorid` , `TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Room_booking_Faculty1`
    FOREIGN KEY (`Faculty_F_Utorid` , `Faculty_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Faculty` (`F_Utorid` , `TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `A2`.`Course` (
  `Course_id` INT NOT NULL,
  `Department` VARCHAR(45) NULL,
  `Section_num` VARCHAR(45) NULL,
  `Course_title` VARCHAR(45) NULL,
  `Room_num` VARCHAR(45) NULL,
  `Faculty_F_Utorid` INT NOT NULL,
  `Faculty_TCard_eAccounts_Account_num` INT NOT NULL,
  PRIMARY KEY (`Course_id`, `Faculty_F_Utorid`, `Faculty_TCard_eAccounts_Account_num`),
  INDEX `fk_Course_Faculty1_idx` (`Faculty_F_Utorid` ASC, `Faculty_TCard_eAccounts_Account_num` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Faculty1`
    FOREIGN KEY (`Faculty_F_Utorid` , `Faculty_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Faculty` (`F_Utorid` , `TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `A2`.`Student_has_Course` (
  `Student_S_Utorid` INT NOT NULL,
  `Student_TCard_eAccounts_Account_num` INT NOT NULL,
  `Course_Course_id` INT NOT NULL,
  PRIMARY KEY (`Student_S_Utorid`, `Student_TCard_eAccounts_Account_num`, `Course_Course_id`),
  INDEX `fk_Student_has_Course_Course1_idx` (`Course_Course_id` ASC) VISIBLE,
  INDEX `fk_Student_has_Course_Student1_idx` (`Student_S_Utorid` ASC, `Student_TCard_eAccounts_Account_num` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Course_Student1`
    FOREIGN KEY (`Student_S_Utorid` , `Student_TCard_eAccounts_Account_num`)
    REFERENCES `A2`.`Student` (`S_Utorid` , `TCard_eAccounts_Account_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Student_has_Course_Course1`
    FOREIGN KEY (`Course_Course_id`)
    REFERENCES `A2`.`Course` (`Course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `A2`.`Course` (`Course_id`, `Department`, `Section_num`, `Course_title`, `Room_num`, `Faculty_F_Utorid`, `Faculty_TCard_eAccounts_Account_num`)
VALUES 
  (100, 'Computer Science', 'CSC101', 'Introduction to Programming', 'BA1007', 201, 20000001),
  (200, 'English', 'ENG102', 'Composition and Rhetoric', 'HW406', 202, 20000002),
  (300, 'History', 'HIS202', 'The First Wolrd War', 'SS203', 202, 20000002),
  (400, 'Psychology' 'PSY301', 'Abnormal Psychology', 'MW305', 205, 20000005),
  (500, 'Mathematics', 'MAT401', 'Real Analysis', 'BA204', 203, 20000003);
  
INSERT INTO `A2`.`Faculty` (`F_Utorid`, `Email`, `Department`, `Sex`, `First_name`, `Last_name`, `Middle_name`, `TCard_eAccounts_Account_num`)
VALUES 
  (201, 'john_baker@mail.utoronto.ca', 'Information', 'Male', 'John', 'Baker', 'S', 20000001),
  (202, 'tom_ford@mail.utoronto.ca', 'Science', 'Male', 'Tom', 'Ford', 'M', 20000002),
  (203, 'mary_bryant@mail.utoronto.ca', 'Information', 'Mary', 'Bryant', 'Johnson', 'D', 20000003),
  (204, 'che_zhu@mail.utoronto.ca', 'Physics', 'Male', 'Che', 'Zhu', 'N', 20000004),
  (205, 'charlie_yang@mail.utoronto.ca', 'Business', 'Female', 'Charlie', 'Yang', 'F', 20000005);
  
INSERT INTO `A2`.`Library_staff` (`L_Utorid`, `Department`, `Birth_date`, `First_name`, `Middle_name`, `Last_name`, `TCard_eAccounts_Account_num`)
VALUES 
  (301, 'Computer Science', '1990-05-01', 'John', NULL, 'Doe', 30000001),
  (302, 'English', '1985-11-15', 'Jane', 'A', 'Smith', 30000002),
  (303, 'History', '1982-03-25', 'Bob', 'B', 'Johnson', 30000003),
  (304, 'Psychology', '1988-08-05', 'Alice', NULL, 'Lee', 30000004),
  (305, 'Mathematics', '1992-02-10', 'Mike', 'C', 'Wang', 30000005);
  
INSERT INTO `A2`.`Printer` (`Printer_id`, `Printing_task`, `Paper_load`, `Student_S_Utorid`, `Student_TCard_eAccounts_Account_num`, `Faculty_F_Utorid`, `Faculty_TCard_eAccounts_Account_num`)
VALUES 
  (1001, 'Print Resume', 'Letter', 1, 10000001, 201, 20000001),
  (1002, 'Print Report', 'Legal', 2, 10000002, 202, 20000002),
  (1003, 'Print Assignment', 'Letter', 2, 10000002, 202, 20000002),
  (1004, 'Print Research Paper', 'A4', 4, 10000004, 205, 20000005),
  (1005, 'Print Homework', 'Letter', 5, 10000005, 203, 20000003);

INSERT INTO `A2`.`Publications` (`Barcode`, `Status`, `Author`, `Publisher`, `Publication_title`, `Category`, `Student_S_Utorid`, `Student_TCard_eAccounts_Account_num`, `Faculty_F_Utorid`, `Faculty_TCard_eAccounts_Account_num`)
VALUES 
  (100001, 'Available',	'J.K. Rowling', 'Bloomsbury Publishing', "Harry Potter and the Philosopher's Stone", 'Fiction', 1, 10000001, 201, 20000001),
  (100002, 'Available', 'George R.R. Martin', 'Bantam Spectra', 'A Game of Thrones', 'Fiction', 2, 10000002, 202, 20000002),
  (100003, 'Checked Out', 'Margaret Atwood', 'McClelland and Stewart', "The Handmaid's Tale", 'Fiction', 2, 10000002, 202, 20000002),
  (100004, 'Checked Out', 'Stephen Hawking', 'Bantam Books', 'A Brief History of Time, Science', 1, 10000001, 205, 20000005),
  (100005, 'Available', 'Michael Lewis, W.W. Norton & Company', 'The Big Short', 'Non-fiction', 5, 10000005, 203, 20000003);

INSERT INTO `A2`.`Technology Supplies` (`Item_id`, `Borrow_date`, `Status`, `Return_date`, `Student_S_Utorid`, `Student_TCard_eAccounts_Account_num`, `Faculty_F_Utorid`, `Faculty_TCard_eAccounts_Account_num`)
VALUES 
  (1, '2022-01-01 10:00:00', 'Borrowed', null, 1, 10000001, 201, 20000001),
  (2, '2022-02-01 11:00:00', 'Borrowed', NULL, 2, 10000002, 202, 20000002),
  (3, '2022-03-01 12:00:00', 'Returned', '2022-03-03 13:00:00', 3, 10000003, 202, 20000002),
  (4, '2022-04-01 13:00:00', 'Returned', '2022-04-03 14:00:00', 3, 10000003, 205, 20000005),
  (5, '2022-05-01 14:00:00', 'Borrowed', NULL, 5, 10000005, 203, 20000003);

INSERT INTO `A2`.`Student` (`S_Utorid`, `First_name`, `Last_name`, `Email`, `Sex`, `Birth_date`, `student_number`, `TCard_eAccounts_Account_num`)
VALUES 
  (1, 'Austin', 'Pan', 'austin.pan@mail.utoronto.ca', 'Male', '2000-01-01', 'pan001', 10000001),
  (2, 'Aaron', 'Zhang', 'aaron.zhang@mail.utoronto.ca', 'Male', '2000-02-02', 'zhang002', 10000002),
  (3, 'Bryan', 'Zhu', 'bryan.zhu@mail.utoronto.ca', 'Male', '2000-03-03', 'zhu003', 10000003),
  (4, 'Claire', 'Chen', 'claire.chen@mail.utoronto.ca', 'Female', '2000-04-04', 'chen004', 10000004),
  (5, 'Amber', 'Cai', 'amber.cai@mail.utoronto.ca', 'Female', '2000-05-05', 'cai005', 10000005);
  
INSERT INTO `A2`.`Library_staff_has_Printer` (`Library_staff_L_Utorid`, `Library_staff_TCard_eAccounts_Account_num`, `Printer_Printer_id`, `Printer_Student_S_Utorid`, `Printer_Student_TCard_eAccounts_Account_num`, `Printer_Faculty_F_Utorid`, `Printer_Faculty_TCard_eAccounts_Account_num`)
VALUES 
  (301, 30000001, 1001, 1, 10000001, 201, 20000001),
  (302, 30000002, 1002, 2, 10000002, 202, 20000002),
  (303, 30000003, 1003, 2, 10000002, 202, 20000002),
  (303, 30000003, 1004, 4, 10000004, 205, 20000005),
  (305, 30000005, 1005, 5, 10000005, 203, 20000003);
  
INSERT INTO `A2`.`Library_staff_has_Publications` 
(`Library_staff_L_Utorid`, `Library_staff_TCard_eAccounts_Account_num`, `Publications_Barcode`, `Publications_Student_S_Utorid`, `Publications_Student_TCard_eAccounts_Account_num`, `Publications_Faculty_F_Utorid`, `Publications_Faculty_TCard_eAccounts_Account_num`) 
VALUES 
(301, 30000001, 100001, 1, 10000001, 201, 20000001), 
(302, 30000002, 100002, 2, 10000002, 202, 20000002), 
(303, 30000003, 100003, 2, 10000002, 202, 20000002), 
(304, 30000004, 100004, 1, 10000001, 205, 20000005), 
(305, 30000005, 100005, 5, 10000005, 203, 20000003);

INSERT INTO `A2`.`library_staff_has_technology supplies`
(`Library_staff_L_Utorid`, `Library_staff_TCard_eAccounts_Account_num`, `Technology Supplies_Item_id`, `Technology Supplies_Student_S_Utorid`, `Technology Supplies_Student_TCard_eAccounts_Account_num`, `Technology Supplies_Faculty_F_Utorid`, `Technology Supplies_Faculty_TCard_eAccounts_Account_num`)
VALUES
(305, 30000005, 5, 5, 10000005, 203, 20000003),
(304, 30000004, 4, 3, 10000003, 205, 20000005),
(303, 30000003, 3, 3, 10000003, 202, 20000002),
(302, 30000002, 2, 2, 10000002, 202, 20000002),
(301, 30000001, 1, 1, 10000001, 201, 20000001);

INSERT INTO `A2`.`room_booking`
(`Booking_id`, `Room_num`, `Room_type`, `Booking_date`, `Student_S_Utorid`, `Student_TCard_eAccounts_Account_num`, `Faculty_F_Utorid, Faculty_TCard_eAccounts_Account_num`)
VALUES
(1005, 'BA204', 'Classroom', '2023-04-05', 3, 10000003, 203, 20000003),
(1004, 'SS203', 'Meeting', '2023-04-04', 5, 10000005, 205, 20000005),
(1003, 'HW406', 'Meeting', 2023-04-03, 4, 10000004, 202, 20000002),
(1002, 'BA1007', 'Classroom', '2023-04-02', 2, 10000002, 202, 20000002),
(1001, 'BA1007', 'Classroom', 2023-04-01, 1, 10000001, 201, 20000001);

INSERT INTO `A2`.`student_has_course`
(`Student_S_Utorid`, `Student_TCard_eAccounts_Account_num`, `Course_Course_id`)
VALUES
(1, 10000001, 100),
(2, 10000002, 200),
(3, 10000003, 200),
(1, 10000001, 300),
(5, 10000005, 400);

INSERT INTO `A2`.`tcard_eaccounts`
(`Account_num`, `Deposit_date`, `Balance`, `Payment_date`)
VALUES
(10000001, '2022-03-01 12:00:00', 100, '2022-02-17 13:45:22'),
(10000002, '2022-05-01 15:45:00', 78, '2022-06-17 19:00:00'),
(10000003, '2023-01-01 09:22:33', 60, '2023-02-02 20:00:00'),
(10000004, '2022-10-29 07:29:10', 80, '2022-12-25 15:43:00'),
(10000005, '2022-11-10 08:55:09', 150, '2022-12-29 20:15:06'),
(20000001, '2022-03-04 14:55:00', 50, '2022-04-01 15:00:00'),
(20000002, '2022-01-01 12:00:00', 100, '2022-01-02 12:14:13'),
(20000003, '2022-02-13 13:14:00', 88, '2022-03-14 12:55:44'),
(20000004, '2022-12-01 10:07:06', 77, '2023-01-01 12:00:00'),
(20000005, '2022-11-12 12:00:00', 88, '2023-01-02 13:00:01'),
(30000001, '2022-10-30 09:00:00', 66, '2022-12-24 09:00:00'),
(30000002, '2022-11-29 19:10:55', 150, '2023-02-24 09:00:00'),
(30000003, '2022-11-30 09:17:16', 166, '2023-02-15 10:00:00'),
(30000004, '2023-03-01 20:00:00', 50, '2023-03-02 12:00:00'),
(30000005, '2022-04-01 10:00:00', 44, '2022-05-29 19:55:00');

CREATE VIEW STUDETt_COURSE
AS SELECT First_name, Last_name, Course_title
FROM student, course, student_has_course
WHERE S_Utorid = Student_S_Utorid AND Course_id = Course_Course_id;

CREATE VIEW Student_tcard
AS SELECT First_name, Last_name, Account_num, Balance
From student, tcard_eaccounts
WHERE TCard_eAccounts_Account_num = Account_num;

CREATE VIEW Faculty_course
AS SELECT F.First_name, F.Last_name, C.Course_title, C.Department
FROM faculty F, course C
WHERE Faculty_F_Utorid = F_Utorid;

CREATE VIEW student_booking
AS SELECT First_name, Last_name, Booking_date, Room_num
FROM student, room_booking
WHERE Student_S_Utorid = S_Utorid;

CREATE VIEW faculty_booking
AS SELECT First_name, Last_name, Bookig_date, Room_num
FROM faculty, room_booking
WHERE Faculty_F_Utorid = F_Utorid;

CREATE VIEW staff_printer
AS SELECT First_name, Last_name, printer_id, paper_load
FROM library_staff, printer, library_staff_has_printer
WHERE L_Utorid = Library_staff_L_Utorid AND Printer_id = Printer_Printer_id;

CREATE VIEW staff_publications
AS SELECT First_name, Last_name, Barcode, Publication_title
FROM library_staff, publications, library_staff_has_publications
WHERE L_Utorid = Library_staff_L_Utorid AND Barcode = Publications_Barcode;

CREATE VIEW student_printer
AS SELECT First_name, Last_name, Printer_id, Printing_task
FROM student, printer
WHERE S_Utorid = Student_S_Utorid;

CREATE VIEW faculty_printer
AS SELECT First_name, Last_name, Printer_id, Printer_task
FROM faculty, printer
WHERE F_Utorid = Faculty_F_Utorid;

CREATE VIEW faculty_publications
AS SELECT First_name, Last_name, Barcode, Publication_title
FROM faculty, publications
WHERE F_Utorid = Faculty_F_Utorid;

SELECT Sex, COUNT(*) as count
FROM student
GROUP BY Sex;

Select Balance, First_name
FROM tcard_eaccounts, student
WHERE Account_num = TCard_eAccounts_Account_num
ORDER BY Balance desc;

SELECT S_Utorid AS `student ID`, S.First_name AS `student name`, course_title, F.First_name AS `Instructor name`
FROM student S, student_has_course, course, faculty F
WHERE S_Utorid = Student_S_Utorid AND Course_Course_id = Course_id AND Faculty_F_Utorid = F_Utorid;

SELECT `Status`, Borrow_date, Item_id
FROM `technology supplies`
WHERE `Status` =  'Borrowed';

SELECT Publication_title, `Status`, S.First_name AS `Borrowed by student`, F.First_name AS `Borrowed by Faculty`
FROM publications INNER JOIN student S ON S_Utorid = Student_S_Utorid
				  INNER JOIN faculty F ON F_Utorid = Faculty_F_Utorid
WHERE `Status` = 'Checked Out';

SELECT *
FROM course
WHERE Faculty_F_Utorid IN (
	SELECT F_UtorIid
    FROM faculty
    WHERE First_name = 'Tom'
);

SELECT Account_num, balance
FROM tcard_eaccounts
WHERE Account_num IN
	(SELECT tcard_eAccounts_Account_num
    FROM faculty
    WHErE F_Utorid IN
			(SELECT Faculty_F_Utorid
            FROM `technology supplies`
            WHERE Status = 'borrowed'));
            
SELECT First_name, Last_name, L_Utorid
FROM library_staff
WHERE L_Utorid IN
(SELECT Library_staff_L_Utorid
FROM library_staff_has_publications
WHERE Library_staff_L_Utorid IN
(Select L.L_Utorid
FROM library_staff L
INNER JOIN library_staff_has_printer LP ON L.L_Utorid = LP.Library_staff_L_Utorid));

SELECT Room_num, Room_type, Bookinf_date, S.First_name AS `Student Name`, F.First_name AS `Faculty Name`
FROM room_booking INNER JOIN student S ON Student_S_Utorid = S_Utorid
				  INNER JOIN faculty F ON Faculty_F_Utorid = F_Utorid
WHERE Booking_date <= '2023-04-03';

SELECT Course_title, Section_num, Room_num, First_name AS `Taught by`
FROM course INNER JOIN faculty ON F_Utorid = Faculty_F_Utorid
WHERE Room_num LIKE '%BA%';

DELIMITER //
CREATE TRIGGER new_borrow_history
AFTER INSERT ON `technology supplies`
FOR EACH ROW
BEGIN
	INSERT INTO `borrowing history`
    VALUES(NEW.Item_id, NEW.Borrow_date, 'Checked Out');
END;
//

DELIMITER //
CREATE TRIGGER update_borrow_history2
AFTER UPDATE ON `technology supplies`
FOR EACH ROW
BEGIN
	UPDATE `borrow_history`
    SET `Status` = `Status Changed`
    WHERE ID = OLD.Item_id;
END;
//

DELIMITER //
CREATE TRIGGER delete_borrow_history
AFTER DELETE ON `technology supplies`
FOR EACH ROW
BEGIN
	UPDATE `borrow history`
    SET `Status` = 'Item Missed'
    WHERE ID = OLD.Item_id;
END;
//

























