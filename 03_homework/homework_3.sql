-- AGGREGATE
/* 1. Write a query that determines how many times each vendor has rented a booth 
at the farmer’s market by counting the vendor booth assignments per vendor_id. */

SELECT vendor_id
,COUNT (*) as '#Booths_Rented'
FROM vendor_booth_assignments
GROUP BY vendor_id

/* 2. The Farmer’s Market Customer Appreciation Committee wants to give a bumper 
sticker to everyone who has ever spent more than $2000 at the market. Write a query that generates a list 
of customers for them to give stickers to, sorted by last name, then first name. 

HINT: This query requires you to join two tables, use an aggregate function, and use the HAVING keyword. */

SELECT a.customer_id,a.customer_last_name,a.customer_first_name
,SUM (b.quantity * b.cost_to_customer_per_qty) as total_amount_spent --new column to calculate the total amount spent
FROM customer as a
	JOIN customer_purchases as b ON a.customer_id = b.customer_id
GROUP BY a.customer_id,a.customer_last_name,a.customer_first_name
HAVING total_amount_spent > 2000
ORDER BY a.customer_last_name,a.customer_first_name

--Temp Table
/* 1. Insert the original vendor table into a temp.new_vendor and then add a 10th vendor: 
Thomass Superfood Store, a Fresh Focused store, owned by Thomas Rosenthal

HINT: This is two total queries -- first create the table from the original, then insert the new 10th vendor. 
When inserting the new vendor, you need to appropriately align the columns to be inserted 
(there are five columns to be inserted, I've given you the details, but not the syntax) 

-> To insert the new row use VALUES, specifying the value you want for each column:
VALUES(col1,col2,col3,col4,col5) 
*/

-- First Query: Creating a new table(temp.new_vendor) using the original table (vendor)
drop table IF EXISTS temp.new_vendor;
CREATE TABLE temp.new_vendor AS
SELECT *
FROM vendor;

-- Second Query: Adding the 10th vendor to the table
INSERT INTO temp.new_vendor (vendor_id,vendor_name,vendor_type,vendor_owner_first_name,vendor_owner_last_name) -- Adding the 5 columns
VALUES (10,'Thomass Superfood Store','Fresh Focused store','Thomas','Rosenthal');

SELECT* -- Command to verify if the Vendor was added to the new table
FROM temp.new_vendor


-- Date
/*1. Get the customer_id, month, and year (in separate columns) of every purchase in the customer_purchases table.

HINT: you might need to search for strfrtime modifers sqlite on the web to know what the modifers for month 
and year are! */

SELECT customer_id, 
STRFTIME('%m', market_date) AS month, 
STRFTIME('%Y', market_date) AS year
FROM customer_purchases;

/* 2. Using the previous query as a base, determine how much money each customer spent in April 2019. 
Remember that money spent is quantity*cost_to_customer_per_qty. 

HINTS: you will need to AGGREGATE, GROUP BY, and filter...
but remember, STRFTIME returns a STRING for your WHERE statement!! */

SELECT a.customer_id,a.customer_first_name,a.customer_last_name
,SUM(quantity * cost_to_customer_per_qty) AS total_amount_spent
FROM customer a
JOIN customer_purchases b ON a.customer_id = b.customer_id
WHERE STRFTIME('%m', market_date) = '04' AND STRFTIME('%Y', market_date) = '2019'
GROUP BY a.customer_id,a.customer_first_name,a.customer_last_name
ORDER BY total_amount_spent DESC,a.customer_id,a.customer_first_name,a.customer_last_name;
