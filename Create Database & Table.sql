---- CREATING DATABASE AND TABLE ---

create database Test2

drop database Test2

use Test2

Create Table Demo
(
	First_Name Varchar(255),  --Alphabet
	Gender nvarchar(255),   --Alphabet & Number
	Age Int,   --Without Decimal number
	Salary Float,    --with Decimal Nummber
	DOB date  --Date
	)

select * from Demo

insert into Demo values ('Irfan','M','27','2000.0','1992-06-26')
insert into Demo values ('Nikita','F','31','1500.0','1996-01-06')
insert into Demo values ('Deeksha','F','28','2000.0','1997-08-20')
insert into Demo values ('Hardik','M','37','6500.0','1992-03-26')
insert into Demo values ('Komal','F','21','8500.0','1996-04-06')
insert into Demo values ('Irman','M','24','4500.0','1997-07-20')
insert into Demo values ('Rohini','F','22','10000.0','1997-01-20')


--- Important of ;go ------

select * from Orders
where OrderID = 10248;
go

select * from Customers
where Country = 'UK';
go


----10/08/2022---

---- Sub Query---
--- it required 2 table for analysis
--- first table output will be input of second table

select * from orders
where Customerid in ( select distinct CustomerID
					  from Customers
					  where Country = 'UK')
Order by Customerid


--Q1
-- Order wise total Bill amount for poland country

select * from [Order Details]

select OrderID,sum(UnitPrice*Quantity) as Total_cost,
	count(OrderID) as No_Product_Purchase
into Poland_Data
from [Order Details]
where OrderID in (select distinct OrderID
				  from Orders
				  where ShipCountry='Poland')
group by OrderID

select * from Poland_Data

order by OrderID desc

select * from Orders

alter table Orders
add Delivery_Day Float

select * from Orders

Update Orders
Set Delivery_Day = DATEDIFF(d,orderDate,ShippedDate)

select * from Orders

alter table poland_Data
add Shipping_Cost float,Product_Cost float,Delivery_Days float

select * from Poland_Data

select * from Orders


Update Poland_Data
set Shipping_Cost = Orders.Freight,
Delivery_days = Orders.Delivery_day
from Orders inner join Poland_Data
on Poland_Data.OrderID = Orders.OrderID

--select Freight,Delivery_day from Orders
--where OrderID = 10374


select * from Poland_Data

Update Poland_Data
set Product_Cost = Total_Cost - Shipping_Cost
where OrderID in (select OrderID from Poland_Data
					where Total_cost > 300);


select * from Poland_Data

Update Poland_Data
set Product_Cost = Total_Cost
where Product_Cost is null

select * from Poland_Data

delete from Poland_Data
where OrderID in (select OrderID		
					from Orders
					where Freight <=10)
					
select * from Poland_Data

select OrderID,Ouantity,
CASE  --IF
	When Quantity > 30 Then 'High'
	when Quantity = 30 Then 'Equal'
	else 'Other'
End as QuantityText
into backup1  ---saving Data
From [Order Details]  --- Main File Data

select * from backup1


---hackerrank