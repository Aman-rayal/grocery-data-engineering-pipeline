-- Visualization SQL quaries 

select 
      min(sale_date) as start_date,
      max(sale_date) as end_date
from sales_data;


select 
      sum(line_subtotal) as total_revenue
from sales_data;


select 
	c.category_name,
    SUM(s.line_subtotal) AS total_revenue
FROM sales_data s 
JOIN product_data p
on s.product_upc = p.product_upc 
join category_data c
on p.category_ID = c.category_ID 
group by c.category_name 
order by total_revenue desc;

select 
     st.store_name,
     SUM(S.line_subtotal) AS total_revenue 
from sales_data s 
join store_data st
on s.store_ID = st.store_ID 
GROUP BY st.store_name 
ORDER BY total_revenue DESC;



select
    case 
      when promo_ID is null then 'Without Promotion'
      else 'With Promotion'
	end as promotion_status,
    sum(line_subtotal) as total_revenue,
    sum(quantity) as total_quaantity_sold
from sales_data 
group by promotion_status 
order by total_revenue desc;
