 use BikeStore
--1
select top 1 product_name,list_price from production.products order by list_price desc

--2
select count(customer_id) as Total_customers from sales.customers

--3
select * from sales.stores 

--4
select top 10 order_id,sum(list_price*quantity*(1-discount)) total_price from sales.order_items group by order_id

--5
select store_name,sum(list_price*quantity*(1-discount)) Sales_revenue from sales.order_items OT
join sales.orders O on OT.order_id = O.order_id
join sales.stores s on o.store_id = s.store_id
group by store_name

--6
select c.category_id,category_name,sum(quantity) total_sold from production.categories c
join production.products p on c.category_id= p.category_id join
sales.order_items o on p.product_id=o.product_id group by c.category_id,c.category_name order by total_sold desc

--7
select c.category_name,count(d.order_status) rejected_orders from production.categories c
join production.products p on c.category_id= p.category_id join
sales.order_items o on p.product_id=o.product_id
join sales.orders d on o.order_id=d.order_id
where order_status =3
group by c.category_name order by rejected_orders desc

--8
select top 1 sum(OI.quantity) total_sold,p.product_name from production.products p
join sales.order_items OI on p.product_id=OI.product_id group by p.product_name
order by total_sold

--9
select concat(first_name,' ',last_name) Full_Name from sales.customers where customer_id in (259)

--10
select concat(first_name,' ',last_name) Full_Name,p.product_name,o.order_date,o.order_status
from sales.customers c join sales.orders o on c.customer_id=o.customer_id
join sales.order_items OI on o.order_id=OI.order_id
join production.products p on OI.product_id=p.product_id 
where o.customer_id in(259)

--11
select c.customer_id,concat(s.first_name,' ',s.last_name) Staff_Name,st.store_name from sales.customers c
join sales.orders o on c.customer_id=o.customer_id
join sales.staffs s on o.staff_id=s.staff_id join sales.stores st on s.store_id=st.store_id
where c.customer_id in (259)

--12
select * from sales.staffs

--13
select b.brand_name,sum(OI.quantity) total_sold from production.brands b join production.products p
on b.brand_id=p.brand_id join sales.order_items OI on p.product_id=OI.product_id group by b.brand_name
order by total_sold desc

--14
select * from production.categories 

select c.category_name ,sum(OI.quantity) total_Sold from production.categories c join production.products p
on c.category_id=p.category_id join sales.order_items OI on p.product_id=OI.product_id group by
c.category_name order by total_Sold 

--15
select ST.store_name ,sum(s.quantity) Stocks from production.brands b join production.products p
on b.brand_id=p.brand_id join production.stocks s on p.product_id=s.product_id join
sales.stores ST on s.store_id=ST.store_id where b.brand_id =1
group by ST.store_name order by Stocks desc 

--16
select s.state, sum(OI.list_price*quantity*(1-discount)) Sales from sales.order_items OI
join sales.orders o on OI.order_id=o.order_id
join sales.stores s on o.store_id=s.store_id group by s.state order by Sales desc 

--17
select product_id,list_price,discount,(list_price*(1 - discount)) discounted_price
from sales.order_items where product_id =259

--18
select b.brand_name,c.category_name,p.product_name,p.list_price,p.model_year,sum(s.quantity) total_quantity
from production.products p
join production.stocks s on p.product_id=s.product_id
join production.categories c on p.category_id=c.category_id
join production.brands b on p.brand_id=b.brand_id 
where p.product_id = 44
group by brand_name,category_name,product_name,list_price,model_year

--19
select zip_code from sales.stores where state ='CA' 

--20
select count(state) state_count_operate from sales.stores 

--21
select sum(OT.quantity) children_bike_sold from production.categories c
join production.products p on c.category_id= p.category_id
join sales.order_items OT on p.product_id=OT.product_id
join sales.orders o on OT.order_id=o.order_id
where c.category_name='Children Bicycles' and
o.order_date >= dateadd(month, -8, (select max(order_date) from sales.orders))

--22
select shipped_date,customer_id from sales.orders where customer_id=523

--23
select count(order_id) pending_orders from sales.orders
where order_status=1 

--24 
select b.brand_name,c.category_name from production.products p
join production.brands b on p.brand_id=b.brand_id
join production.categories c on p.category_id=c.category_id
where p.product_name ='Electra white water 3i - 2018' 