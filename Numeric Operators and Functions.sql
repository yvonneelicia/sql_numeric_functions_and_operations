-- Numeric Operators and Functions -- 

/* You can actually perfomr a queiry in MySQL without supplying a table name. This is useful when you have an expression as a selected
value, but it can be used to show the result of an expression on fixed values
 */
SELECT 15 + 28 as addition, 3 + 4 as addition, 1 + 1 as addition;
SELECT 100 - 1 as subtraction;
SELECT 100/2 as division;
SELECT 4*4 as multiplication;

-- Precedence --
/* The *, /, DIV and MOD operators have a higher precedence than + and -. You can use parenthese where necessary to alter the order in which
an expression is evalauted 
*/

-- Division --
/* The DIV operator can be used to perform diviison where only a whole number is returned and any remainder is simply discarded. 
The modulous operator is used to find the remainder after division and is performed using MOD or the % symbol 
*/

SELECT 20 DIV 3 as division; -- using DIV doesn't return remainder --

SELECT 20 DIV 3, 20 MOD 3;

SELECT 20/3 as division; -- using '/' sybmol gives remainders -- 


-- Calculated Columns --

/* In the following example, the query retrieves price data from the products table. The third column contains an expression that applies a 
fixed discount to the price of each item 
*/

SELECT productCode, buyPrice, buyPrice - 5.00
FROM products;

/* In the following example, the sales tax of 10% is calculated by multipyling the database price by 0.1, using the multiplication operator, *.
The calculated column is given an alias 'salesTax' 
*/

SELECT productCode, buyPrice, buyPrice * 0.1 as salesTax
FROM products;

-- Numeric Functions --
/* Case sensitivity - function name are not case sensitive in MySQL. For example, you can use ROUND(), Round() or round() 
- these all perfomr the same function call.
*/
/* Arguments - to pass a function more than one argument, seperate the values in paratheneses using a comma. If a function does not
   require any arguments, the paraenthese must still be given - for instance RAND()
*/

-- Random Numbers --
/* To generate a random number, use the RAND() function with no arguments. The result is a random decimal number between 0 and 1. */
SELECT rand() as random_num;

/* Shuffling a query - you can use the RAND() function in an ORDER BY clause to shuffle the order in which records are returned.
Simply use ORDER BY RAND(); 
the value of RAND() will be different for earch row returned by the query, and the results will be sorted randomly according to this value
*/

-- example of ORDER BY RAND(); --
SELECT customerNumber as cust_ID, customerName
FROM customers
ORDER BY RAND(cust_ID);

-- Rounding Functions --

/* This set of functions enables you to round decimal numbers in a aprticular way. 
Each of these functions takes a single decimal number argument and returns an integer result */
SELECT round(3.74758) as int_1, round(5478.383) as int_2, round(0.948483892938384728282) as int_3;

/* If you supply a second argument, the number will be rounded to that amount of decimal places instead of an integer */
SELECT round(3.74758, 1) as int_1, round(5478.383, 1) as int_2, round(0.948483892938384728282, 1) as int_3;
SELECT round(3.74758, 2) as int_1, round(5478.383, 2) as int_2, round(0.948483892938384728282, 2) as int_3;

/* The CEILING and FLOOR functions round a decimal number up and down to the nearest integer, respectively */
SELECT CEILING(25.334) as ceiling, FLOOR(34.766) as floor;

-- Truncate --
/* The TRUNCATE function takes two arguments, a number and a precision. 
It does not round the number, but simply removes from it decimal places in excess of the precision specified */

SELECT truncate(7.758485949, 4) as num;
SELECT truncate(345.7585, 2) as num;

