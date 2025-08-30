$--1 CREATING DATABASE--
create database project;

--2 USING DATABASE--
use project;

--3 OVERVIEW THE TABLE IN DATABASE PROJECT--

select * from walmart;

--4 VIEW THE TABLE DATA WITH RESPECT TO EACH MONTH--

select *, month(date) 
from walmart 
order by month(date);

--5 COUNT THE TOTAL NUMBER OF UNIQUE ORDERS/INVOICE--

select count(distinct invoice_id) 
FROM walmart as total_invoices;

--6 COUNT THE TOTAL UNIQUE BRANCH, CITY, CATEGORY AND PAYMENT METHOD FROM TABLE--

select count(distinct branch) as branches ,count(distinct city)as cities, count(distinct category) as categories,
count(distinct payment_method) as payment_mode 
from walmart;


--7 What is the total revenue generated per branch?

select branch, round(sum(replace(unit_price,'$','') * quantity),2) as total_revenue 
from walmart 
group by branch;


--8 Which product category has the highest average profit margin?--

select category, avg(profit_margin) 
from walmart 
group by category 
order by avg(profit_margin) desc;


--9 What is the monthly sales trend across different branches?--

select branch, month(date) as month, round(sum(replace(unit_price,'$','')*quantity),2) as monthly_revenue
from walmart
group by branch, month(date)
order by month(date);


--10 Which city has the highest number of transactions?--

select city, count(invoice_id) as transaction
from walmart
group by city
order by count(invoice_id) desc limit 1;


--11 What are the top 5 most popular product categories by quantity sold?--

select category,sum(quantity)
from walmart
group by category
order by sum(quantity) desc limit 5;


--12 Which payment method is most used in each branch?--

select branch, payment_method, count(*) as usage_count
from walmart
group by branch, payment_method
order by branch, count(*) desc;


--13 What are the peak shopping hours during the day?--

select hour(time) as hours, sum(quantity)
from walmart where hour(time) between 8 and 18
group by hour(time)
order by sum(quantity) desc,hour(time);


--14 What is the average customer rating per product category?--

select category, round(avg(rating),2)
from walmart
group by category
order by avg(rating)desc;


--15 How does the revenue vary by day of the week?--

select dayname(date) as day_of_week, 
sum(replace(unit_price,'$','')*quantity)as total_revenue
from walmart
 group by dayname(date) 
 order by sum(replace(unit_price,'$','')*quantity) desc;


--16 Identify high-revenue invoices (revenue > $100) and their payment methods.--
 
 select invoice_id, quantity, unit_price, replace(unit_price,'$','')*quantity as total_revenue
 from walmart
 where replace(unit_price,'$','')*quantity > 100
 order by  quantity,replace(unit_price,'$','')*quantity desc;
 
 ---------END---------
 
 
 
    
    


 
 


















































 
 