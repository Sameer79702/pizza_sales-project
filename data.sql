
-- Revenue Analysis
select sum(total_price * quantity) from pizza_sales ;

-- Top-Selling Pizzas

select pizza_name , count(quantity) as qty from pizza_sales group by pizza_name order by qty desc ;

-- Peak Order Times
select pizza_name , order_time from pizza_sales ;

SELECT 
    ingredient, 
    COUNT(*) AS usage_count
FROM (
    SELECT UNNEST(STRING_TO_ARRAY(pizza_ingredients, ', ')) AS ingredient
    FROM pizza_sales
) ingredient_list
GROUP BY ingredient
ORDER BY usage_count DESC;

-- Seasonal Trends How does pizza sales performance vary across different months?
SELECT EXTRACT(MONTH FROM ORDER_DATE) AS OD , COUNT(*) FROM PIZZA_SALES GROUP BY OD ORDER BY OD ;

-- Profit Margin Analysis What is the profit margin of each pizza type assuming a fixed cost per pizza?

-- Profit Margin Analysis What is the profit margin of each pizza type assuming a fixed cost per pizza?
SELECT PIZZA_NAME , 
SUM( TOTAL_PRICE * QUANTITY ) AS TOTAL_REVENUE,
SUM(5 * QUANTITY  ) AS COST_PRICE ,
ROUND( SUM(TOTAL_PRICE * QUANTITY) - SUM(5 * QUANTITY) / SUM(TOTAL_PRICE * QUANTITY) * 100 , 2) AS MARGIN , 
  PIZZA_SIZE
 FROM PIZZA_SALES GROUP BY PIZZA_NAME , PIZZA_SIZE


-- Order Patterns
-- How many unique orders were placed for each day of the week?

SELECT DISTINCT EXTRACT(DOW FROM ORDER_DATE) AS DT ,  COUNT( DISTINCT ORDER_ID) AS ORDERS FROM PIZZA_SALES GROUP BY DT ORDER BY ORDERS DESC ;
