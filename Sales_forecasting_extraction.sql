-- Daily Sales Forecasting Dataset Extraction 
select
     sale_date,
     sum(line_subtotal) as daily_sales
from sales_data 
group by sale_date 
order by sale_date;
