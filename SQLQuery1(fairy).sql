create database fairy;
--create a table of  department
CREATE TABLE Departments (
    DepartmentID int PRIMARY KEY,
    DepartmentName varchar(255)
);
--create a tale of emplyees
CREATE TABLE Employees (
    EmployeeID int PRIMARY KEY,
    FirstName varchar(255),
    LastName varchar(255),
    DepartmentID int,
    Salary decimal,
    HireDate datetime,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
--5 records adding in department table
INSERT INTO Departments (DepartmentID, DepartmentName)VALUES (1, 'IT'),
    (2, 'Sales'),
    (3, 'Marketing'),
    (4, 'Finance'),
    (5, 'se');
	--10 records adding in employees table
	INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate)VALUES  (1, 'John', 'Doe', 1, 50000, '2021-01-01'),
    (2, 'Jane', 'Smith', 2, 45000, '2022-02-15'),
    (3, 'Bob', 'Johnson', 3, 60000, '2020-11-20'),
    (4, 'Emily', 'Davis', 4, 55000, '2023-04-01'),
    (5, 'Michael', 'Brown', 5, 40000, '2021-05-30'),
    (6, 'David', 'Miller', 1, 48000, '2022-08-22'),
    (7, 'Anna', 'Williams', 2, 52000, '2020-09-10'),
    (8, 'Ryan', 'Jones', 3, 65000, '2023-03-05'),
    (9, 'Sarah', 'Thomas', 4, 58000, '2021-12-18'),
    (10, 'Kevin', 'Lee', 5, 43000, '2022-06-04');

	select * from Employees;

	select * from Departments;

	alter table Employees add gender  varchar(255);
	update Employees SET gender='Female' where EmployeeID=(2);
	update Employees SET gender='Female' where EmployeeID=(4);
	update Employees SET gender='Female' where EmployeeID=(5);
	update Employees SET gender='Female' where EmployeeID=(6);
	update Employees SET gender='female' where EmployeeID=(9);

	--scalar function without parameters

	create function hoor()
	returns varchar(255)

	begin
	return 'hoor'
	end

	select dbo.hoor() as NAME

	--sacalar with parameters

	create function addition(@num1 as int, @num2 as int)
	returns int
	begin
	return (@num1 + @num2)
	end
	select dbo.addition(2,4) as addition_number

	--function with varaiable

	create function students(@age as int)
	returns varchar(255)
	as
	begin
	declare @str varchar(255)

	if(@age>=15)
	begin
	set @str='you can take addmission in aptech'
	end
	else
	begin
	set @str='bary ho kr ao'
	end
	return @str
	end

	select dbo.students(19)as student_details
	
	
	
	--table valued function 

	create function Emp()
	returns table
	as
	return select * from Employees

	select * from Emp()
	--2
	create function maleEmp(@gender as varchar(20))
	returns table
	as 
	return select * from Employees where gender= @gender

	select * from maleEmp('female')
	--3
	alter function maleEmp()
	returns table
	as 
	return select distinct LastName from Employees

	select * from maleEmp()