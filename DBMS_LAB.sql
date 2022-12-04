drop database if exists E_commerce;
create database E_commerce;
use E_commerce;
create table supplier (SUPP_ID int PRIMARY KEY, SUPP_NAME varchar(50) NOT NULL, SUPP_CITY varchar(50) NOT NULL, SUPP_PHONE varchar(50) NOT NULL);
insert into supplier values (1, "Rajesh Retails", "Delhi", 1234567890);
insert into supplier values (2, "Appario Ltd", "Mumbai", 2589631470);
insert into supplier values (3, "Knome productss", "Bangalore", 9785462315);
insert into supplier values (4, "Bansal Retails	", "Kochi", 8975463285);
insert into supplier values (5, "Mittal Ltd.", "Lucknow", 7898456532);

create table customer (CUS_ID int PRIMARY KEY, CUS_NAME varchar(20) NOT NULL, CUS_PHONE varchar(10) NOT NULL, CUS_CITY varchar(30) NOT NULL, CUS_GENDER char);
insert into customer values (1, "AAKASH", 9999999999, "DELHI", 'M');
insert into customer values (2, "AMAN", 9785463215, "DELHI", 'M');
insert into customer values (3, "NEHA", 9999999999, "DELHI", 'F');
insert into customer values (4, "MEGHA", 9994562399, "DELHI", 'F');
insert into customer values (5, "PULKIT", 7895999999, "DELHI", 'M');

create table category (CAT_ID int PRIMARY KEY, CAT_NAME varchar(20) NOT NULL);
insert into category values (1, "BOOKS");
insert into category values (2, "GAMES");
insert into category values (3, "GROCERIES");
insert into category values (4, "ELECTRONICSS");
insert into category values (5, "CLOTHES");

create table product (PRO_ID int PRIMARY KEY, PRO_NAME varchar(20) NOT NULL DEFAULT 'Dummy', PRO_DESC varchar(60), CAT_ID int, FOREIGN KEY (CAT_ID) REFERENCES category (CAT_ID));
insert into product values (1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
insert into product values (2, "TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
insert into product values (3,  "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
insert into product values (4, "OATS", "Highly Nutritious from Nestle", 3);
insert into product values (5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1);
insert into product values (6, "MILK", "1L Toned Milk", 3);
insert into product values (7, "Boat Earphones", "1.5Meter long Dolby Atmos", 4);
insert into product values (8, "Jeans", "Stretchable Denim Jeans with various sizes and color", 5);
insert into product values (9, "Project IGI", "compatible with windows 7 and above", 2);
insert into product values (10, "Hoodie	", "Black GUCCI for 13 yrs and above", 5);
insert into product values (11, "Rich Dad Poor Dad", "Written by Robert Kiyosaki", 1);
insert into product values (12, "Train Your Brain", "By Shireen Stephen", 1);

create table supplier_pricing (PRICING_ID int PRIMARY KEY, PRO_ID int, FOREIGN KEY (PRO_ID) REFERENCES product (PRO_ID), SUPP_ID int, FOREIGN KEY (SUPP_ID) REFERENCES supplier (SUPP_ID), SUPP_PRICE int DEFAULT 0);
insert into supplier_pricing values (1, 1, 2, 1500);
insert into supplier_pricing values (2, 3, 5, 30000);
insert into supplier_pricing values (3, 5, 1, 3000);
insert into supplier_pricing values (4, 2, 3, 2500);
insert into supplier_pricing values (5, 4, 1, 1000);
insert into supplier_pricing values (6, 12, 2, 780);
insert into supplier_pricing values (7, 12, 4, 789);
insert into supplier_pricing values (8, 8, 1, 31000);
insert into supplier_pricing values (9, 1, 5, 1450);
insert into supplier_pricing values (10, 4, 2, 999);
insert into supplier_pricing values (11, 7, 3, 549);
insert into supplier_pricing values (12, 7, 4, 529);
insert into supplier_pricing values (13, 6, 2, 105);
insert into supplier_pricing values (14, 6, 1, 99);
insert into supplier_pricing values (15, 2, 5, 2999);
insert into supplier_pricing values (16, 5, 2, 2999);

create table orders (ORD_ID int PRIMARY KEY, ORD_AMOUNT int NOT NULL, ORD_DATE date NOT NULL, CUS_ID int, FOREIGN KEY (CUS_ID) REFERENCES customer (CUS_ID), PRICING_ID int, FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing (PRICING_ID));
insert into orders values (101, 1500, '2021-10-06', 2, 1);
insert into orders values (102, 1000, '2021-10-12', 3, 5);
insert into orders values (103, 30000, '2021-09-16', 5, 2);
insert into orders values (104, 1500, '2021-10-05', 1, 1);
insert into orders values (105, 3000, '2021-08-16', 4, 3);
insert into orders values (106, 1450, '2021-08-18', 1, 9);
insert into orders values (107, 789, '2021-09-01', 3, 7);
insert into orders values (108, 780, '2021-09-07', 5, 6);
insert into orders values (109, 3000, '2021-00-10', 5, 3);
insert into orders values (110, 2500, '2021-09-10', 2, 4);
insert into orders values (111, 1000, '2021-09-15', 4, 5);
insert into orders values (112, 789, '2021-09-16', 4, 7);
insert into orders values (113, 31000, '2021-09-16', 1, 8);
insert into orders values (114, 1000, '2021-09-16', 3, 5);
insert into orders values (115, 3000, '2021-09-16', 5, 3);
insert into orders values (116, 99, '2021-09-17', 2, 14);

create table rating (RAT_ID int PRIMARY KEY, ORD_ID int, FOREIGN KEY (ORD_ID) REFERENCES orders (ORD_ID),RAT_RATSTARS int NOT NULL);
insert into rating values (1, 101, 4);
insert into rating values (2, 102, 3);
insert into rating values (3, 103, 1);
insert into rating values (4, 104, 2);
insert into rating values (5, 105, 4);
insert into rating values (6, 106, 3);
insert into rating values (7, 107, 4);
insert into rating values (8, 108, 4);
insert into rating values (9, 109, 3);
insert into rating values (10, 110, 5);
insert into rating values (11, 111, 3);
insert into rating values (12, 112, 4);
insert into rating values (13, 113, 2);
insert into rating values (14, 114, 1);
insert into rating values (15, 115, 1);
insert into rating values (16, 116, 0);

/* 3. Display the total number of customers based on gender who have placed orders of worth at least Rs.3000 */
select customer.CUS_GENDER, count(*) FROM customer WHERE customer.CUS_ID IN 
(select customer.CUS_ID FROM orders WHERE orders.ORD_AMOUNT >= 3000) GROUP BY customer.CUS_GENDER;

/* 4. Display all the orders along with product name ordered by a customer having Customer_Id=2 */
select product.PRO_NAME, orders.* FROM orders, supplier_pricing, product 
WHERE orders.CUS_ID = 2 AND
orders.PRICING_ID = supplier_pricing.PRICING_ID AND supplier_pricing.PRO_ID = product.PRO_ID;

/* 5. Display the Supplier details who can supply more than one product */
select * FROM supplier WHERE supplier.SUPP_ID IN 
(select supplier.SUPP_ID FROM supplier_pricing GROUP BY supplier.SUPP_ID HAVING count(supplier.SUPP_ID) > 1);

/* 6. Find the least expensive product from each category and print the table with category id, name, product name and price of the product */
select category.CAT_ID,category.CAT_NAME, min(t3.min_price) AS Min_Price FROM category INNER JOIN
(select product.CAT_ID, product.PRO_NAME, t2.* FROM product INNER JOIN 
(select PRO_ID, min(SUPP_PRICE) AS Min_Price FROM supplier_pricing GROUP BY PRO_ID) 
AS t2 WHERE t2.PRO_ID = product.PRO_ID)
AS t3 WHERE t3.CAT_ID = category.CAT_ID GROUP BY t3.CAT_ID;

/* 7. Display the Id and Name of the Product ordered after “2021-10-05 ” */
select PRICING_ID FROM orders WHERE ORD_DATE > '2021-10-05';
select PRO_ID FROM supplier_pricing WHERE PRICING_ID IN (select PRICING_ID FROM orders WHERE ORD_DATE > '2021-10-05');
select PRO_ID, PRO_NAME FROM product WHERE PRO_ID IN (select PRO_ID FROM supplier_pricing WHERE PRICING_ID IN (select PRICING_ID FROM orders WHERE ORD_DATE > '2021-10-05'));

/* 8. Display customer name and gender whose names start or end with character 'A' */
select customer.CUS_NAME, CUS_GENDER FROM customer WHERE customer.CUS_NAME LIKE 'A%' or customer.CUS_GENDER LIKE 'A%';

/* 9. Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service” */

DELIMITER //
use E_commerce;
create procedure 'sp_storedprocedure'
AS
BEGIN
select s.SUPP_ID, s.SUPP_NAME, r.RAT_RATSTARS , CASE
WHEN (r.RAT_RATSTARS) = 5 THEN 'Excellent Service'
WHEN (r.RAT_RATSTARS) > 4 THEN 'Good Service'
WHEN (r.RAT_RATSTARS) > 2 THEN 'Average Service'
ELSE 'Poor Service' END AS Type_of_Service FROM supplier s
JOIN SUPPLIER_PRICING sp ON s.SUPP_ID = sp.SUPP_ID
JOIN orders o ON sp.PRICING_ID = o.PRICING_ID
JOIN RATING r ON r.ORD_ID = o.ORD_ID;
END
DELIMITER;