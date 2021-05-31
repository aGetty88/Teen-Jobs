-- Create the teenjobs database
DROP DATABASE IF EXISTS TeenJobs;
CREATE DATABASE TeenJobs;
USE TeenJobs;  -- MySQL command

-- Create Employee Table
CREATE TABLE Employees (
  WorkerID        INT(12)        NOT NULL    AUTO_INCREMENT,
  LastName        VARCHAR(20)    NOT NULL,
  FirstName       VARCHAR(20)    NOT NULL,
  Phone           VARCHAR(10)    NOT NULL,
  Weekends        TINYINT        NOT NULL,
  Evenings        TINYINT        NOT NULL,
  BabySitting     TINYINT        NOT NULL,
  YardWork        TINYINT        NOT NULL,
  PetSitting      TINYINT        NOT NULL,
  Clerical        TINYINT        NOT NULL,
  PRIMARY KEY (WorkerID)
);

LOAD DATA INFILE 'C:/xampp/htdocs/teenjobs/employees.csv' 
INTO TABLE Employees
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from Employees;

-- Create Jobs Table
CREATE TABLE Jobs (
  JobID           INT(12)        NOT NULL    AUTO_INCREMENT,
  EmployerID      VARCHAR(20)    NOT NULL,
  EmployeeID      INT(12),
  Weekends        TINYINT        NOT NULL,
  Evenings        TINYINT        NOT NULL,
  BabySitting     TINYINT        NOT NULL,
  YardWork        TINYINT        NOT NULL,
  PetSitting      TINYINT        NOT NULL,
  Clerical        TINYINT        NOT NULL,
  StartDate       DATE           NOT NULL,
  EndDate         DATE           NOT NULL,
  Rate            FLOAT(5,2)     NOT NULL,
  PRIMARY KEY (JobID)
);

-- Load Jobs table
LOAD DATA INFILE 'C:/xampp/htdocs/teenjobs/jobs.csv' 
INTO TABLE Jobs
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS(JobId, EmployerID, EmployeeID, Weekends, 
  Evenings, BabySitting, YardWork, PetSitting, Clerical,
  @startDate, @endDate, Rate)set startDate = STR_TO_DATE(@startDate,
  '%m/%d/%Y'),endDate = STR_TO_DATE(@endDate, '%m/%d/%Y');
-- Above converts string from .csv file to date format

select * from Jobs;

-- Create Employers Table
CREATE TABLE Employers (
  EmployerID      VARCHAR(20)     NOT NULL,
  Employer        VARCHAR(30)     NOT NULL,
  Phone           VARCHAR(10)     NOT NULL,
  PRIMARY KEY (EmployerID)
);

-- Load Employers table
LOAD DATA INFILE 'C:/xampp/htdocs/teenjobs/employers.csv' 
INTO TABLE Employers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
select * from Employers;
