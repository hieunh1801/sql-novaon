-- query 1:
with product_selled as (
	select od.product_id, sum(od.quantity) as total_quantity
    from order_detail od inner join orders o on o.orders_id = od.orders_id 
    where o.order_date < now()
    group by od.product_id
)
select p.*, ps.total_quantity
from product p inner join product_selled ps 
 	on p.product_id = ps.product_id
order by ps.total_quantity desc


-- query 2:
with product_selled as (
	select od.product_id, sum(od.quantity) as total_quantity
	from order_detail od
	group by od.product_id
)
select p.*, ps.total_quantity
from product p left join product_selled ps 
 	on p.product_id = ps.product_id
where ps.product_id is null

-- query 3:
alter table orders add column vat money

-- query 4:
update orders
set vat = round((total * 0.1)::numeric, 2)