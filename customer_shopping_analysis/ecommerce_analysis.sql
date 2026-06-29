use ecommerce_analysis;

select * from ecommerce_dataset limit 5;

# 1. Total sales per category
select productcategory, sum(totalamount) as total_sales from 
ecommerce_dataset group by productcategory;

# 2. Top 5 customers by sales
select customerid, customername, sum(totalamount) as total_sales 
from ecommerce_dataset 
group by customerid, customername   
order by total_sales desc
limit 5;

# 3. Monthly sales trend
select DATE_FORMAT(STR_TO_DATE(orderdate, '%d-%m-%Y'), '%Y-%m') AS month_year, sum(totalamount) as total_sales
from ecommerce_dataset 
group by month_year;

# 4. Find repeat customers

select customerid, count(*) as total_orders
from ecommerce_dataset
group by customerid
having count(*) > 1
order by total_orders desc; 


# 5. Rank customers by total spending
select customerid, 
customername, 
sum(totalamount) as total_sales,  
dense_rank() over (order by sum(totalamount) desc) as rnk
from ecommerce_dataset
group by customerid, customername;
 

