--HW
--庫名:iii  
create database iii;
use iii
--客戶資料表：id(int primary key , auto_increment)，姓名，電話(nui) ，email，address；
create table Customers (customerID int unsigned primary key auto_increment , companyName varchar(40),phone varchar(24),email varchar(60),address varchar(60),unique(phone));

\d #
create procedure Cust_insert(in companyName varchar(40), phone varchar(24), email varchar(60), address varchar(60))
begin
set @companyName=companyName;
set @phone=phone;
set @email= email;
set @address=address;
insert into Customers(companyName,phone,email,address)values(@companyName,@phone,@email,@address );
end #
\d ;

Call Cust_insert('Rakuten','02-2508-8181','www.rakuten.com.tw','Japan');
Call Cust_insert('Momo','0800-777-959','www.momoshop.com.tw','Taipei');
Call Cust_insert('Amazon',' +1 206-922-0880','www.amazon.com','USA');


--供應商：id(...)，名稱，電話(nui)，地址
create table Suppliers(supplierID int unsigned primary key auto_increment ,companyName varchar(40), phone varchar(24),address varchar(100) ,unique(phone));

\d #
create procedure Sup_insert(in companyName varchar(40), phone varchar(24), address varchar(60))
begin
set @companyName=companyName;
set @phone=phone;
set @address=address;
insert into Suppliers(companyName,phone,address)values(@companyName,@phone,@address );
end #
\d ;

Call Sup_insert('SONY','02-4499111','Japen');
Call Sup_insert('Nintendo ','1-23456-789',' Japen');
Call Sup_insert('Kingston','0141-2219174',' Rashi');



--商品表：id(...) ，編號(nui)，名稱，建議售價，供應商(f)
create table Products(productID int unsigned primary key auto_increment,productNum int unique key not null,productName varchar(40),unitPrice decimal(19,4) ,supplierID int unsigned, foreign key(supplierID) references Suppliers(supplierID));

\d #
create procedure Pro_insert(in productNum int, productName varchar(40), unitPrice decimal(19,4), supplierID int)
begin
set @productNum = productNum;
set @productName = productName;
set @unitPrice = unitPrice;
set @supplierID = supplierID;
insert into Products(productNum, productName, unitPrice, supplierID)values(@productNum,@productName,@unitPrice,@supplierID);
end #
\d ;

call Pro_insert('826577','RAM',380,3);
call Pro_insert('800083','PlayStation',11021,1);
call Pro_insert('838368','SSD',1599,3);
call Pro_insert('830087','Switch',11999,2);

--訂單：id(...)，編號(uni)，客戶(f)
create table Orders(orderID int unsigned primary key auto_increment, orderNum int unique key not null,customerID int unsigned, foreign key(customerID) references Customers(customerID));

\d #
create procedure Ord_insert(in orderNum int,customerID int)
begin
set @orderNum = orderNum;
set @customerID = customerID;
insert into Orders(orderNum, customerID)values(@orderNum,@customerID);
end #
\d ;

call Ord_insert('0001', 1);
call Ord_insert('0002', 2);
call Ord_insert('0003', 3);
call Ord_insert('0004', 1);
call Ord_insert('0005', 3);

--訂單細項：id(...)，編號(f)，商品(f)，實際單價，數量
create table OrderDetails(orderID int unsigned primary key auto_increment,orderNum int,productNum int,unitPrice decimal(19,4),quantity smallint(6), foreign key(orderNum) references orders (orderNum), foreign key(productNum) references Products(productNum));

\d #
create procedure OrD_insert(in orderNum int,productNum int,unitPrice decimal(19,4),quantity smallint(6))
begin
set @productNum= productNum;
set @orderNum=orderNum;
set @unitPrice= unitPrice;
set @quantity=quantity;
insert into OrderDetails(orderNum,productNum,unitPrice,quantity)values(@orderNum,@productNum,@unitPrice,@quantity);
end #
\d ;

call OrD_insert('0001','830087',8999,10);
call OrD_insert('0002','800083',8050,3);
call OrD_insert('0003','838368',900,5);
call OrD_insert('0004','826577',200,15);
call OrD_insert('0005','830087',8999,8);

--功能:

--客戶：新增、修改、刪除
    --查詢：電話，姓名 =>關鍵字，若無=>全部

--供應商：新增、修改、刪除
    --查詢：電話，姓名 =>關鍵字，若無=>全部

--商品：新增、修改、刪除
    --查詢：名稱 =>關鍵字，若無=>全部

--訂單：新增、刪除 => 包含訂單細項的處理
--訂單明細：新增、刪除、修改(只能修改數量及實際單價)
--綜合查詢：
--  a.指定客戶查詢訂單，含訂單明細
--  b.指定客戶查詢訂單金額
--  c.指定客戶
--  d.指定供應商查詢訂單中的商品清單
