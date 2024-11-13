-- Insert data into HealthPlan table
INSERT INTO HealthPlan (Name, Description, AdultAnnualCost, ChildAnnualCost)
VALUES 
  ('Basic Plan', 'Basic coverage with essential health benefits', 5000.00, 2500.00),
  ('Standard Plan', 'Standard coverage with extended benefits', 7000.00, 3500.00),
  ('Premium Plan', 'Premium coverage with all available benefits and lower deductibles', 10000.00, 5000.00);

-- Insert data into Employee table
INSERT INTO Employee (Title, FirstName, MiddleName, LastName, Suffix, BirthDate, SSN, StartDate, EndDate, fkHealthPlanSID)
VALUES 
  ('Mr.', 'John', 'A.', 'Doe', NULL, '1980-05-15', 123456789, '1985-01-10', NULL, 1001),
  ('Ms.', 'Jane', 'B.', 'Smith', NULL, '1990-08-22', 234567890, '2021-06-25', NULL, 1002),
  ('Dr.', 'Alice', 'C.', 'Johnson', NULL, '1985-12-10', 345678901, '2019-03-01', '2022-12-31', 1003);

-- Insert data into Dependent table
INSERT INTO Dependent (DependentType, fkEmpSID, FirstName, MiddleName, LastName, Suffix, BirthDate, SSN)
VALUES 
  (1, 100001, 'Janet', NULL, 'Doe', NULL, '1987-07-20', 987654321),  -- Spouse of John Doe
  (2, 100001, 'Stephen', NULL, 'Doe', NULL, '2010-05-13', 987655621),  -- Child of John Doe
  (2, 100001, 'Jill', NULL, 'Doe', NULL, '2012-11-14', 187654321),  -- Child of John Doe
  (1, 100002, 'James', 'Jeremy', 'Smith', NULL, '2015-11-10', 876543210),  -- Spouse of Jane Smith
  (1, 100003, 'Evan', NULL, 'Johnson', NULL, '2013-09-05', 765432109); -- Spouse of Alice Johnson

-- Insert data into HourlyEmployee table
INSERT INTO HourlyEmployee (fkEmpSID, HourlyRate)
VALUES 
  (100001, 25.50),  -- John Doe is an hourly employee
  (100002, 30.00);  -- Jane Smith is an hourly employee

-- Insert data into SalariedEmployee table
INSERT INTO SalariedEmployee (fkEmpSID, AnnualSalary)
VALUES 
  (100003, 85000.00); -- Alice Johnson is a salaried employee
