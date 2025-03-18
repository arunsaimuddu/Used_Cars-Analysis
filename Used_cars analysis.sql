create database Usedcars;
use usedcars;

select * from cars24data;

#.1 calculate the average price of the cars each model and manufactured year

SELECT 
    COUNT(*) AS Total_cars,
    round(AVG(price)) AS Avg_price,
    MIN(price) AS Min_price,
    MAX(price) AS Max_price,
    round(AVG(`kM driven`)) AS Avg_km_driven
FROM cars24data;

select `Model Name`,Manufacturing_year, Price as avg_price 
from cars24data
group by `Model Name`,Manufacturing_year,price
order  by Price desc
limit 10;


#2. identify most common fuel type 

SELECT `fuel type`, COUNT(*) AS count
FROM cars24data
GROUP BY `fuel type`
ORDER BY count DESC;

#3. count of cars based on ModelName 
SELECT `Model Name`, COUNT(*) AS count 
FROM cars24data
GROUP BY `Model Name`
ORDER BY count DESC;

##4.  Price comaprisons based on Transmission , Engine capacity and  owners 

SELECT transmission, round(avg(price)) AS avg_price
FROM cars24data
GROUP BY transmission;

SELECT `Engine capacity`, round(AVG(price)) AS avg_price
FROM cars24data
GROUP BY `Engine capacity`
ORDER BY `Engine capacity`;

SELECT Ownership, round(AVG(price)) AS avg_price
FROM cars24data
GROUP BY Ownership
ORDER BY Ownership;

SELECT `fuel type`, round(AVG(price)) AS avg_price 
FROM cars24data 
GROUP BY `fuel type`
ORDER BY avg_price DESC;

##5. Filtering based on spare key, Imperfections, Repainted parts

SELECT `Spare key`,count(*) as count 
FROM cars24data
group by `Spare key`;

SELECT `Model Name`, price, `KM driven`, imperfections
FROM cars24data
WHERE imperfections >=10;

SELECT `Model Name`, price, `KM driven`, imperfections, `Repainted parts`
FROM cars24data
WHERE `repainted parts` >=10;

##6. Trend analysis

SELECT `manufacturing year`, AVG(price) AS avg_price
FROM used_cars
GROUP BY `manufacturing year`
ORDER BY `manufacturing year`;

SELECT repainted_parts, AVG(price) AS avg_price, COUNT(*) 
FROM used_cars 
GROUP BY repainted_parts;

SELECT imperfections, AVG(price) AS avg_price 
FROM used_cars 
GROUP BY imperfections 
ORDER BY avg_price DESC;

SELECT ownership, AVG(price) AS avg_price, COUNT(*) 
FROM used_cars 
GROUP BY ownership 
ORDER BY avg_price DESC;

##7. key segement from the data

## Most affordable cars 
SELECT `model name`, `Fuel type`, Transmission, AVG(price) AS avg_price 
FROM cars24data
GROUP BY`model name`, `Fuel type`, Transmission 
ORDER BY avg_price ASC 
LIMIT 10;

## Luxury car segements
SELECT *
FROM cars24data
ORDER BY price DESC
LIMIT 5;

## Cars with highest KM driven 
SELECT *
FROM cars24data
ORDER BY `km driven` DESC
LIMIT 10;


