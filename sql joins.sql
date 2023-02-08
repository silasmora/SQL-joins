USE bestbuy;
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT PRODUCTS.NAME, CATEGORIES.NAME
FROM PRODUCTS
INNER JOIN CATEGORIES
ON PRODUCTS.CATEGORYID = CATEGORIES.CATEGORYID
WHERE CATEGORIES.NAME = 'COMPUTERS';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT * FROM PRODUCTS;
SELECT * FROM REVIEWS;
SELECT PRODUCTS.NAME, PRODUCTS.PRICE, REVIEWS.RATING
FROM PRODUCTS
INNER JOIN REVIEWS
ON PRODUCTS.PRODUCTID = REVIEWS.PRODUCTID
WHERE REVIEWS.RATING = "5";

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT CONCAT(EMPLOYEES.FIRSTNAME, " ", EMPLOYEES.LASTNAME), SUM(SALES.QUANTITY) AS TOTAL
FROM EMPLOYEES
INNER JOIN SALES
ON EMPLOYEES.EMPLOYEEID = SALES.EMPLOYEEID
GROUP BY EMPLOYEES.EMPLOYEEID
ORDER BY TOTAL DESC
LIMIT 5;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT * FROM CATEGORIES;
SELECT * FROM DEPARTMENTS;
SELECT DEPARTMENTS.NAME, CATEGORIES.NAME FROM CATEGORIES
INNER JOIN DEPARTMENTS
ON DEPARTMENTS.DEPARTMENTID = CATEGORIES.DEPARTMENTID
WHERE CATEGORIES.NAME = "APPLIANCES" OR CATEGORIES.NAME = "GAMES";

/* joins: find the product name, total # sold, and total price sold, */
SELECT * FROM PRODUCTS;
SELECT PRODUCTS.NAME, SUM(SALES.QUANTITY), SUM(SALES.PRICEPERUNIT * SALES.QUANTITY)
FROM PRODUCTS
INNER JOIN SALES
ON PRODUCTS.PRODUCTID = SALES.PRODUCTID
WHERE PRODUCTS.NAME = 'EAGLES: HOTEL CALIFORNIA';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT * FROM PRODUCTS;
SELECT * FROM REVIEWS;
SELECT PRODUCTS.NAME, REVIEWS.RATING, REVIEWS.REVIEWER, REVIEWS.COMMENT
FROM PRODUCTS
INNER JOIN REVIEWS
ON PRODUCTS.PRODUCTID = REVIEWS.PRODUCTID
WHERE PRODUCTS.NAME = 'VISIO TV'
ORDER BY REVIEWS.RATING
LIMIT 1;

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.EmployeeID,employees.FirstName,employees.LastName,products.Name,sales.Quantity
FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products
ON products.ProductID = sales.ProductID;