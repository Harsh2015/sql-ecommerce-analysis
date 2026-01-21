-- HAVING CLAUSE

--Display products with stock_level less than 20
select product_name,stock_level from ecommerce_data
where stock_level < 20

--Fetch records where customer_gender is 'Female'
select customer_gender from ecommerce_data
where customer_gender = 'Female';

--Find products belonging to the 'Electronics' category
select category, product_name from ecommerce_data
where category = 'Electronics';

--Show products where return_rate is greater than 15%
select product_name, return_rate from ecommerce_data
where return_rate > 15;

-- ORDER BY + LIMIT
select product_name, discount
from ecommerce_data
order by discount desc 
limit 5;

select product_name, popularity_index
from ecommerce_data
order by popularity_index
limit 10;

select product_name, stock_level 
from ecommerce_data
order by stock_level
limit 3;

--Aggregate function
select ROUND(AVG(price),2) as avg_price
from ecommerce_data;

select MIN(price) as min_price, MAX(price) as max_price
from ecommerce_data;

select SUM(stock_level) as total_stock_level
from ecommerce_data;

select ROUND(avg(return_rate),2) as avg_return_rate
from ecommerce_data;

--GROUP BY CLAUSE
--Count the number of products in each category
select category,count(*) as total_category_count
from ecommerce_data
group by category;

--Calculate the average price per category
select category, ROUND(AVG(price),1) as avg_price
from ecommerce_data
group by category
ORDER BY avg_price desc

--Find the total stock per supplier
select supplier_id, SUM(stock_level) as total_stock
from ecommerce_data
group by supplier_id;

--Calculate the average popularity_index by seasonality
select seasonality, ROUND(AVG(popularity_index),2) as avg_pop_index
from ecommerce_data
group by seasonality

--Count the number of products per shipping method
select shipping_method, count(*) as total_product_count
from ecommerce_data
group by shipping_method
order by shipping_method desc

--GROUP BY + HAVING
--Find categories having more than 10 products
select category, count(product_name) as product_count
from ecommerce_data
group by category
having count(product_name) > 10

--Find categories where the average price is greater than 2000
select category, round(avg(price),2) as avg_price
from ecommerce_data
group by category
having avg(price) > 2000;

--Display shipping methods with an average return_rate above 20
select shipping_method, avg(return_rate) as avg_return
from ecommerce_data
group by shipping_method
having avg(return_rate) > 20;

--Show customer locations having more than 5 purchases
select customer_location , count(*) as purchase_count
from ecommerce_data
group by customer_location
having count(*) > 5
order by purchase_count desc;

--Business-Level Questions
--Which product category has the highest average popularity?

select category , round(avg(popularity_index),2) as high_avg_popularity
from ecommerce_data
group by category
order by high_avg_popularity desc
limit 1;

--Which shipping method is used the most?
select shipping_method, count(*) as usage_count
from ecommerce_data
group by shipping_method
order by shipping_method desc
limit 1;

--Identify products that have a high price but low popularity
SELECT 
    product_name,
    category,
    price,
    popularity_index
FROM ecommerce_data
WHERE price > (SELECT AVG(price) FROM ecommerce_data)
AND popularity_index < (SELECT AVG(popularity_index) FROM ecommerce_data)
limit 1;

--Find suppliers contributing the maximum stock
select supplier_id, stock_level
from ecommerce_data
where stock_level > (select avg(stock_level) from ecommerce_data)
limit 1;

-- Find suppliers contributing the maximum stock
SELECT 
    supplier_id,
    SUM(stock_level) AS total_stock
FROM ecommerce_data
GROUP BY supplier_id
ORDER BY total_stock DESC
LIMIT 1;

--Find the top 3 categories by total stock.
select category, sum(stock_level) as total_stock
from ecommerce_data
group by category
order by total_stock desc
limit 3;



--Identify the customer age group that purchases the most products.
select count(*) as product_counts, customer_age_group
from ecommerce_data
group by customer_age_group
order by product_counts desc
limit 1;

























