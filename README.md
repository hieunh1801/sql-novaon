# sql-novaon
- product
    - product_id
    - product_name
    - product_group
    - price

- orders
    - orders_id
    - order_date
    - total
    - customer_id
- order_detail
    - order_detail_id
    - product_id
    - orders_id
    - quantity
    - price

## Câu hỏi
- a. Thống kê tất cả các sản phẩm đã được bán, sắp xếp theo thứ tự từ bán nhiều đến ít
    - sản phẩm đã được bán: order_date phải trước ngày hôm nay
    - thứ tự bán từ nhiều đến ít: tổng số sản phẩm của các mặt hàng từ nhiều tới ít
- b. Thống kê ra toàn bộ các sản phẩm chưa từng được bán ra
    - các sản phẩm chưa được bán ra = tổng loại sản phẩm trừ đi các sản phẩm đã được bán ra
- c. Thêm cột Vat vào bảng Orders
    - alter table
- d. Cập nhật dữ liệu cho cột Vat, theo công thức Vat = 10% của Tổng tiền, làm tròn đến 2 số sau số 0.
    - update and round dữ liệu