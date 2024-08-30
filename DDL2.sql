
--Create a new database named CompanyDB.
--Create a schema named Sales within the CompanyDB database.
--Create a table named employees&quot; with columns: employee_id (INT),
--first_name (VARCHAR), last_name (VARCHAR), and salary (DECIMAL)
--within the Sales schema--
CREATE SCHEMA SALES;
GO
-------------------
CREATE TABLE SALES.EMPLOYEES
(
EMPLOYEE_ID INT ,
FIRST_NAME VARCHAR(50) NOT NULL,
LAST_NAME VARCHAR(50)NOT NULL,
SALARY DECIMAL(7,2)
);
--Note: on employee_id use squence NOT identity.--
CREATE SEQUENCE EMPLOYEE_ID
    AS INT
    START WITH 1
    INCREMENT BY 1;
------------------------------
DROP SEQUENCE EMPLOYEE_ID;
--------------------------------
--Alter the employees table to add a new column named hire_date with the data type DATE.--
ALTER TABLE SALES.EMPLOYEES
ADD HIRE_DATE DATE;



--Select all columns from the employees table.--
SELECT * FROM SALES.EMPLOYEES;

--Retrieve only the first_name and last_name columns from the employees table.--
SELECT FIRST_NAME, LAST_NAME
FROM SALES.EMPLOYEES;

--Retrieve “full name” as a one column from first_name and last_name columns from the employees table.--
SELECT FIRST_NAME +' '+ LAST_NAME FULLNAME
FROM SALES.EMPLOYEES

--Show the average salary of all employees.--
SELECT AVG(salary) AS AVG_SALARY
FROM SALES.EMPLOYEES;

--Select employees whose salary is greater than 50000.--
SELECT SALARY
FROM SALES.EMPLOYEES
WHERE SALARY>50000

--Retrieve employees hired in the year 2020.--
SELECT * 
FROM SALES.EMPLOYEES
WHERE YEAR(hire_date) = 2020;

--List employees whose last names start with'S'--
SELECT LAST_NAME
FROM SALES.EMPLOYEES
WHERE LAST_NAME LIKE 'S%'

--Display the top 10 highest-paid employees.--
SELECT TOP 10 *
FROM SALES.EMPLOYEES
ORDER BY SALARY DESC

--Find employees with salaries between 40000 and 60000.--
SELECT SALARY
FROM SALES.EMPLOYEES
WHERE SALARY BETWEEN 40000 and 60000

--Show employees with names containing the substring "man". --
SELECT FIRST_NAME+' '+ LAST_NAME AS 'FULL NAME'
FROM SALES.EMPLOYEES
WHERE LAST_NAME LIKE '%MAN%'

--Display employees with a NULL value in the hire_date column.--
SELECT HIRE_DATE
FROM SALES.EMPLOYEES
WHERE HIRE_DATE IS NULL

--Select employees with a salary in the set (40000, 45000, 50000).--
SELECT *
FROM SALES.EMPLOYEES
WHERE SALARY IN (40000, 45000, 50000)

--Retrieve employees hired between 2020-01-01 and 2021-01-01--
SELECT *
FROM SALES.EMPLOYEES
WHERE HIRE_DATE BETWEEN '2020-01-01' AND '2021-01-01'

--List employees with salaries in descending order.--
SELECT *
FROM SALES.EMPLOYEES
ORDER BY SALARY DESC

--Show the first 5 employees ordered by last_name in ascending order.--
SELECT TOP 5 *
FROM SALES.EMPLOYEES
ORDER BY LAST_NAME ASC 

--Display employees with a salary greater than 55000 and hired in 2020.
SELECT*
FROM SALES.EMPLOYEES
WHERE SALARY > 55000 AND YEAR(hire_date) = 2020;

--Select employees whose first name is John or Jane.;
SELECT FIRST_NAME 
FROM SALES.EMPLOYEES
WHERE FIRST_NAME IN ('Evangelia', 'Florry')

--List employees with a salary less than or equal to 55000 and a hire date after 2022-01-01
SELECT *
FROM SALES.EMPLOYEES
WHERE SALARY <= 55000 AND HIRE_DATE > '2022-01-01'

--Retrieve employees with a salary greater than the average salary.--
SELECT *
FROM SALES.EMPLOYEES
WHERE SALARY> (SELECT AVG(salary) FROM SALES.EMPLOYEES);

--Display the 3rd to 7th highest-paid employees.--
SELECT * 
FROM SALES.EMPLOYEES
ORDER BY salary DESC
OFFSET 2 ROWS 
FETCH FIRST 5 ROWS ONLY;

--List employees hired after 2021-01-01 in alphabetical order.--
SELECT *
FROM SALES.EMPLOYEES
WHERE HIRE_DATE>= '2021-01-01' 
ORDER BY FIRST_NAME ASC

--Retrieve employees with a salary greater than 50000 and last name not starting with A;
SELECT *
FROM SALES.EMPLOYEES
WHERE SALARY> 50000 AND LAST_NAME NOT LIKE 'A%'

--Display employees with a salary that is not NULL.--
SELECT *
FROM SALES.EMPLOYEES
WHERE SALARY IS NOT NULL

--Show employees with names containing 'e' or 'i' and a salary greater than 45000.
SELECT *
FROM SALES.EMPLOYEES
WHERE FIRST_NAME+' '+LAST_NAME LIKE '%e%' OR   FIRST_NAME+' '+LAST_NAME LIKE '%i%'
  AND salary > 45000;





