Q. List all distinct Bookcases.
SELECT DISTINCT PRODUCTDESC
FROM PRODUCT
WHERE PRODUCTDESC LIKE '%Bookcase';

Q. How many products are there?
select count(productdesc)
from product;

Q. List every product finish having unit price > 200 and average of qtyonhand greater than 3.
select productfinish,avg(qtyonhand) as average
from product
where unitprice > 200
group by productfinish
having avg(qtyonhand)>3;

Q. List product name(s) having maximum quantity on hand
select productfinish
from product
where qtyonhand=(select max(qtyonhand)from product);

Q. List all products whose unitprice is same as some made of ‘Oak’
select productfinish
from product
where unitprice in (select unitprice from product where productfinish='Oak');

Q. List product name(s) having qty on hand more than the average qty on hand
select productfinish,qtyonhand
from product
group by qtyonhand
having qtyonhand > (select avg(qtyonhand) from product);

Q. List the product prices if they are increased by 10%.
SELECT 1.10*UNITPRICE AS INCREASED
FROM PRODUCT;

Q. List products whose unit price is greater than every unitprice of different productfinish.
SELECT productdesc
FROM PRODUCT P
WHERE UNITPRICE > ( SELECT Unitprice 
FROM PRODUCT P1
Where P1.Productfinish <> P.Productfinish); 

Q. List the products which are not made of “Oak” or “Walnut”
SELECT *
FROM PRODUCT
WHERE PRODUCTFINISH NOT IN('Oak','Walnut');

Q. List all products whose unitprice is same as some other product.
SELECT * 
FROM PRODUCT P
WHERE P.UNITPRICE = ANY
(SELECT UNITPRICE 
FROM PRODUCT 
WHERE PRODUCT.PRODUCTNO <> P.PRODUCTNO);
