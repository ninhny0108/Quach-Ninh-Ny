CREATE DATABASE IF NOT EXISTS Testing_System;

USE testing_system;

/* Table department */
CREATE TABLE department(
	DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE `position`(
	PositionID INT PRIMARY KEY AUTO_INCREMENT,
    PositionName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE `account` (
	AccountID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Username VARCHAR(50) NOT NULL,
    FullName VARCHAR(50),
    DepartmentID INT,
    PositionID INT,
    CreateDate DATE,
    CONSTRAINT FOREIGN KEY fk_account_department(DepartmentID) REFERENCES department(DepartmentID)
);

create table `GROUP` (
GroupID int primary key auto_increment,
GroupName varchar(50) not null unique,
CreatDate date
);

create table `GroupAccount`(
GroupID INT,
AccountID int primary key,
JoinDate date,
constraint foreign key fk_GroupAccount_group(GroupID) references `GROUP`(GroupID)
);
create table TypeQuestion(
TypeID int primary key auto_increment,
TypeName ENUM ('Essay','Multiple-Choice')

);

create table CategoryQuestion(
CategoryID INT PRIMARY KEY AUTO_INCREMENT,
CategoryName varchar(50) not null unique

);
create table Question(
QuestionID INT primary KEY auto_increment,
Content varchar(250),
CategoryID int,
TypeID int,
CreatorID int,
CreatorDate date,
CONSTRAINT FOREIGN KEY fk_question_CategoryQuestion(CategoryID) REFERENCES CategoryQuestion(CategoryID)
);
CREATE TABLE ANSWER(
AnswerID INT PRIMARY KEY AUTO_INCREMENT,
Content varchar(300) not null,
QuestionID int,
isCorrect ENUM('TRUE','FALSE'),
constraint foreign key fk_Answer_Question(QuestionID) REFERENCEs Question(QuestionID)
);

CREATE TABLE Exam(
ExamID INT PRIMARY KEY AUTO_INCREMENT,
`CODE` char(50),
Title int,
CategoryID INT,
Duration time ,
CreatorID int,
CreateDate date

);
CREATE TABLE ExamQuestion(
ExamID int,
QuestionID int,
constraint foreign key fk_ExamQuestion_Exam(ExamID) REFERENCES Exam(ExamID)
);
