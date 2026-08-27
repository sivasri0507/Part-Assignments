CREATE DATABASE employee_db;               -- Create a new database named employee_db    
USE employee_db;                           -- Select the database to use

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,         -- Primary key for department
    department_name VARCHAR(100));

CREATE TABLE Location (
location_id INT PRIMARY KEY,               -- Primary key for location 
location_name VARCHAR(30));

CREATE TABLE Employees (                    -- Create Employees table with foreign keys
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10, 2),                 -- Linking tables using Foreign Keys             
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id));
    
    ALTER TABLE Employees ADD COLUMN email VARCHAR(100);              -- Add email column
    ALTER TABLE Employees MODIFY COLUMN designation VARCHAR(150);     -- Change designation column size
    ALTER TABLE Employees DROP COLUMN age;                            -- Remove age column
    ALTER TABLE Employees RENAME COLUMN hire_date TO date_of_joining; -- Rename hire_date column
    
    RENAME TABLE Departments TO Departments_Info;              -- Rename Departments table
    RENAME TABLE Location TO Locations;                       -- Rename Location table 
    
    TRUNCATE TABLE Employees;                                 -- Clear all data from Employees table
    
    DROP TABLE Employees;                                    -- Delete Employees table
    DROP DATABASE employee_db;                               -- Delete employee_db database
    
    
    DROP DATABASE IF EXISTS employee;                    -- Delete database if it already exists
    CREATE DATABASE employee;                            -- Create fresh employee database
    USE employee;                                        -- Select employee database
    
    CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE );     -- Cannot be empty and must be unique

    
    CREATE TABLE locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,         -- Generates ID numbers automatically
    location_name VARCHAR(30) NOT NULL UNIQUE );
    
    CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,                -- Name is required
    gender ENUM('M', 'F') NOT NULL,                    -- Accepts only 'M' or 'F'
    age INT CHECK (age >= 18),                         -- Accepts only 'M' or 'F'
    hire_date DATE DEFAULT (CURRENT_DATE),             -- Sets today's date if not given
    designation VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    location_id INT,                                   -- Foreign keys linking to main tables
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id) );
    
    USE employee;
    SELECT * FROM departments;
    SELECT * FROM locations;
    SELECT * FROM employees;