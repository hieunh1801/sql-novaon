-- query 1:
-- - sản phẩm đã được bán: order_date phải trước ngày hôm nay
-- - thứ tự bán từ nhiều đến ít: tổng số sản phẩm của các mặt hàng đã bán được từ nhiều tới ít
with product_selled as (
	select od.product_id, sum(od.quantity) as total_quantity
	from order_detail od, orders o 
	where o.orders_id = od.orders_id 
		and o.order_date <= now()
	group by od.product_id
)
select p.*, ps.total_quantity
from product p, product_selled ps
where p.product_id = ps.product_id
order by ps.total_quantity desc

-- query 2:
-- lấy ra các sản phẩm chưa bán: nghĩa là loại trừ các sản phẩm đã bán
select p.*
from product p
where p.product_id not in (
select distinct od.product_id
	from order_detail od, orders o 
	where o.orders_id = od.orders_id 
		and o.order_date <= now()
)

-- query 3:
alter table orders add column vat money

-- query 4:
update orders
set vat = round((total * 0.1)::numeric, 2)