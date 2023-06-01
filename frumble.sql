.mode tabs
.import /Users/nicolesmith/Desktop/mrFrumbleData.txt Data

-- 1
CREATE TABLE Data(name VARCHAR(10), discount VARCHAR(4), month VARCHAR(4), price INT(3));




-- 2

-- name --> price
/* this query returns 0 results for products with the same name but different price, therefore there is a FD for name determines price */
SELECT D.name, D.price, D1.price
FROM Data D, Data D1
WHERE D.name = D1.name AND D.price != D1.price;


-- month --> discount
/* this query returns 0 results for products with the same month but different discounts, therefore there is a FD for month determines discount */
SELECT D.month, D.discount, D1.discount
FROM Data D, Data D1
WHERE D.month = D1.month AND D.discount != D1.discount;


-- discount !-> price
SELECT Distinct D.discount, D.price, D1.price
FROM Data D, Data D1
WHERE D.discount = D1.discount AND D.price != D1.price
LIMIT 10;
/* This query returns 10 results of products with the same discount but different prices. Therefore, discount does not determine price */

/* As a result of these FDs, it is implied that name, month --> price, discount as well. */



-- 3

/*
R(N, M, D, P)
N --> P
M --> D

		{N}+ = {N, P}
	R1(N, P}	R2(N, D, M)
	BCNF		{M}+ = {M, D}
		R21(M, D)	R22(M, N)
		BCNF		BCNF
*/

CREATE TABLE Products(name VARCHAR REFERENCES Prices(name), month VARCHAR REFERENCES Discounts(month));
INSERT INTO Products(name, month)
SELECT name, month
FROM Data;
-- ROWS: 427


CREATE TABLE Prices(name VARCHAR, price INT, PRIMARY KEY(name));
INSERT INTO Prices(name, price)
SELECT DISTINCT name, price
FROM Data;
-- ROWS: 37


CREATE TABLE Discounts(month VARCHAR, discount VARCHAR, PRIMARY KEY(month));
INSERT INTO Discounts(month, discount)
SELECT DISTINCT month, discount
FROM Data;
-- ROWS: 12


















