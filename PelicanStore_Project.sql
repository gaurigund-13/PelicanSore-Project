create database PelicanStore;

use PelicanStore;

select * from Store;

-- What is the total sales amount for the entire dataset?
select sum(Sales) as TotalSales from Store;

-- What are the top 10 customers based on their total spending
select customer, sum(Sales) as TotalSpending
from Store group by Customer
order by TotalSpending desc
limit 10;

-- What are the total sales amount for each gender?
select gender, sum(Sales) as TotalSpending 
from Store group by gender;

-- which gender gives you the max sales?
select sum(sales) from Store where gender="Male";
select sum(sales) from Store where gender="Female";

-- which age group and gender gives maximum sales
select age , gender, sales from store 
order by cast(sales as float) desc limit 5;

-- what is the highest discount given to females ?
select * from Store where gender='Female' order by discount desc;

-- what is average discount given to female?
select gender, round(avg(discount),3) as avg_discount from store 
where gender='Female';

-- How does the marital status of customers affect their purchasing behavior?
SELECT m_ Status, AVG(Sales) AS AvgSales
FROM Store
GROUP BY m_Status;

-- Which payment method is most commanly used by Customers?
select p_method , count(*) as TransactionCount 
from store 
group by p_method
order by TransactionCount desc
limit 1;

-- What are the top-selling items in terms of quantity sold or total sales?
select items, sum(sales) as TotalSales from store
group by items
order by TotalSales
limit 10;

-- identify different customer segments based on theri total spending or avg sales?
select customer,
	case
		when sum(sales) < 50 then "Low Spending"
        when sum(sales) >=50 and sum(sales) < 100 then "Moderate Spending"
        when sum(sales) >= 100 then "High Spending"
		else "Unknown"
	end as SpendingSegment
from store
group by customer;

-- Customer Spending Over Time
select customer , sum(sales) as TotalSpending
from store
group by customer
order by TotalSpending desc;

-- Average sales by age group
select 
	case
		when age between 18 and 30 then "18-30"
        when age between 31 and 40 then "31-40"
        when age between 41 and 50 then "41-50"
        when age between 51 and 60 then "51-60"
        else "Above 60"
	end as AgeGroup,
    avg(Sales) as AvgSales
from store 
group by AgeGroup;