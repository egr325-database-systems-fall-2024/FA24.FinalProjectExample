-- create the database
DROP DATABASE IF EXISTS companyX;
CREATE DATABASE companyX;

-- select the database
USE companyX;

-- create the tables
CREATE TABLE HealthPlan
(
	SID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Description VARCHAR(5000) NULL,
    AdultAnnualCost DOUBLE NOT NULL,
    ChildAnnualCost DOUBLE NOT NULL,
    CONSTRAINT HealthPlan_PK PRIMARY KEY (SID)
);

-- initialize the auto increment field to four digits
ALTER TABLE HealthPlan AUTO_INCREMENT=1001;

CREATE TABLE Employee
(
  EmpSID INT NOT NULL AUTO_INCREMENT,
  Title   VARCHAR(10),
  FirstName VARCHAR(50) NOT NULL,
  MiddleName VARCHAR(50) NULL,
  LastName VARCHAR(50) NOT NULL,
  Suffix VARCHAR(10) NULL,
  BirthDate DATE NOT NULL,
  SSN INT NOT NULL UNIQUE,
  StartDate DATE NOT NULL,
  EndDate DATE NULL,
  fkHealthPlanSID INT NULL,
  CONSTRAINT Employee_PK PRIMARY KEY (EmpSID),
  CONSTRAINT Employee_HealthPlan_FK FOREIGN KEY (fkHealthPlanSID) REFERENCES HealthPlan(SID)
);

-- initialize the auto increment field to six digits
ALTER TABLE Employee AUTO_INCREMENT=100001;

CREATE TABLE Dependent
(
	DependentType INT NOT NULL,
    fkEmpSID INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50) NULL,
    LastName VARCHAR(50) NOT NULL,
    Suffix VARCHAR(10) NULL,
    BirthDate DATE NOT NULL,
    SSN INT NOT NULL UNIQUE,
    CONSTRAINT Dependent_PK PRIMARY KEY (DependentType, fkEmpSID),
    CONSTRAINT Dependent_Employee_FK FOREIGN KEY (fkEmpSID) REFERENCES Employee(EmpSID)
);

CREATE TABLE HourlyEmployee
(
    fkEmpSID INT NOT NULL,
    HourlyRate DOUBLE NOT NULL,
    CONSTRAINT HourlyEmployee_PK PRIMARY KEY (fkEmpSID),
    CONSTRAINT HourlyEmployee_Employee_FK FOREIGN KEY (fkEmpSID) REFERENCES Employee(EmpSID)
);

CREATE TABLE SalariedEmployee
(
    fkEmpSID INT NOT NULL,
    AnnualSalary DOUBLE NOT NULL,
    CONSTRAINT SalariedEmployee_PK PRIMARY KEY (fkEmpSID),
    CONSTRAINT SalariedEmployee_Employee_FK FOREIGN KEY (fkEmpSID) REFERENCES Employee(EmpSID)
);