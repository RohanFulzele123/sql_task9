select * from sales
select sales,profit,sales/quantity from sales

	create user da7user password 'admin123' nocreatedb

create or replace function getprofit(productId varchar)
returns double precision as $$
DECLARE
     total_sales double precision;
      total_profit double precision;
      profitper double precision;
BEGIN
    select sum(sales) as total_sales, sum(profit) as total_profit into total_sales,total_profit
         from sales 
    where product_id = productId;

     profitper := total_profit/total_sales *100 ;
    return profitper;

end
$$ LANGUAGE plpgsql;

select sales, profit, getprofit('OFF-ST-10000760') from sales

select * from sales


select sum(sales) as total_sales, sum(profit) as total_profit, sum(sales)/sum(profit) as profitper
         from sales 
    where product_id = 'OFF-ST-10000760'

select * from product
select * from customer
select * from sales

create or replace function getprofit(productId varchar)
returns double precision as $$
    declare
        sum_sales double precision;
		sum_profit	double precision;
        profitper double precision;
BEGIN
   select sum(sales) as sum_sales, sum(profit) as sum_profit into sum_sales,sum_profit
	from sales 
	
  where product_id = productId;
 

  profitper := (sum_sales/sum_profit) *100;
  return profitper;

end
$$ LANGUAGE plpgsql;

select getprofit('FUR-BO-10001798') 

select getprofit('FUR-TA-10000577')


create or replace function getavg(customerId varchar)
returns double precision as $$

declare
     avg_discount double precision;
     avg_quantity int;
     profit double precision;
BEGIN

   select avg(discount) as avg_discount, avg(quantity) as avg_quantity 
	into avg_discount,avg_quantity from sales
   where customer_id = customerId;

  profit := (avg_discount/avg_quantity)*100;
return profit;
end;
$$ LANGUAGE plpgsql;

select getavg('CG-12520') from sales
