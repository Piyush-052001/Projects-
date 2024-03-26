use swiggy;
show tables;
describe swiggy;

Alter table swiggy
Add PRIMARY KEY (ID);

SELECT * FROM swiggy;

/* Find total rows in a database*/
SELECT COUNT(*) from swiggy;

SELECT * FROM swiggy
where City = 'Bangalore';

SELECT Area, Restaurant from swiggy
WHERE City = 'Bangalore';

/* Find the count of unique cities*/
SELECT count(distinct city) FROM swiggy;

/* Find all names of distinct cities*/
SELECT DISTINCT CITY 
from swiggy;

/* Find count of restaurant in each city*/
SELECT City, count(DISTINCT Restaurant) as Tot_hotels
from swiggy
GROUP BY City
order by Tot_hotels DESC;

/* Find total number of orders made from each restaurant*/
SELECT Restaurant, count(ID) as Orders
from swiggy
GROUP by Restaurant
ORDER BY Orders DESC;

SELECT Restaurant, count(ID) as Orders
from swiggy
GROUP by City, Restaurant
ORDER BY Orders DESC;

SELECT City, Restaurant from swiggy
order by city;

/* Find top three restaurant with highest orders*/
SELECT City, Restaurant, COUNT(ID) AS orders, DENSE_RANK() over(order by count(ID) DESC) AS rankk
FROM swiggy
GROUP BY City, Restaurant
LIMIT 3;

/* Find bottom five restaurants with lowest orders*/

SELECT City, Restaurant, COUNT(ID) AS orders, DENSE_RANK() over(order by count(ID) ASC) AS rankk
from swiggy
group by city, restaurant
limit 5;

/* Find those cities which has more than 1100 restaurants*/
SELECT City, count(DISTINCT Restaurant) as Tot_hotels
from swiggy
GROUP BY City
having count(DISTINCT Restaurant) >= 1100;

/* Find avgerage delivery time of orders*/
SELECT AVG(delivery_time)
FROM swiggy;

/* Find avgerage delivery time of orders in mumbai*/
SELECT AVG(delivery_time) FROM swiggy
WHERE city='Mumbai';

#or
/* Find avgerage delivery time of orders in mumbai and hyderabad*/
SELECT city, AVG(delivery_time) FROM swiggy
group by city
having city in ('Mumbai','Hyderabad');

/* Find restaurant from delhi who serves Indian, Chinese, Mughlai*/
Select * from swiggy;
SELECT Restaurant, food_type FROM swiggy
where city = 'Delhi'
having food_type in('Indian','Chinese','Mughlai');

#or

Select * from swiggy;
SELECT Restaurant, food_type FROM swiggy
where city = 'Delhi' AND Food_type = 'Indian' or Food_type = 'Chinese' or Food_type = 'Mughlai'