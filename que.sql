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

Q. 
