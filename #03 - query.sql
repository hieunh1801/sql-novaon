-- query 1:
-- - sản phẩm đã được bán: order_date phải trước ngày hôm nay ?
-> ở đâu ra cái nè vậy :D sáng tạo qá :))
-- - thứ tự bán từ nhiều đến ít: tổng số sản phẩm của các mặt hàng đã bán được từ nhiều tới ít :)) 
-> sắp xếp giảm dần theo số lượng bán được
-> Hiểu sai nghiệp vụ :D

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

Yêu cầu đề bài là:
- Thống kê tất cả các sản phẩm đã được bán.
- sắp xếp giảm dần theo số lượng bán

1. Lấy ra được sản phẩm: id, tên sản phẩm, số lượng bán.
2. sắp xếp lại theo số lượng bán là giảm dần
đấp án thế này thôi:
select od.product_id as product_id, sum(od.quantity) as total_quantity
	from order_detail od
	group by od.product_id having od.date desc
	
	

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


Yêu cầu đề bài là: .
- Thống kê ra toàn bộ các sản phẩm chưa từng được bán ra
select p.*
from product p
where p.product_id not in (
	select od.product_id as product_id, sum(od.quantity) as total_quantity
		from order_detail od
		group by od.product_id having od.date desc
)


-- query 3:
alter table orders add column vat money

-- query 4:
update orders
set vat = round((total * 0.1)::numeric, 2)
