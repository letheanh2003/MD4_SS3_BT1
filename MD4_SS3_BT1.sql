create database md4_ss3_bt1;

use md4_ss3_bt1;

create table Customer(
id int primary key auto_increment,
name varchar(255) not null unique,
age int 
);

create table `Order`(
id int primary key auto_increment,
customer_id int,
createdDate datetime default now(),
total float,
foreign key (customer_id) references Customer(id)
);

create table Product(
id int primary key auto_increment,
name varchar(255) unique not null,
price float
);

create table OrderDetail(
oder_id int references `Order`(id),
product_id int references Product(id),
quantity int
);

insert into customer(name,age)values
("Minh Quan",10),
("Ngoc Oanh",20),
("Hong Ha",50);

insert into `Order`(customer_id,createdDate,total)values
(1,"2006-03-21",null),
(2,"2006-03-23",null),
(1,"2006-03-16",null);

insert into Product(name,price)values
("May Giat",3),
("Tu Lanh",5),
("Dieu Hoa",7),
("Quat",1),
("Bep Dien",2);

insert into OrderDetail(oder_id,product_id,quantity)values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select o.id,o.createdDate,o.total from `Order` o;

select `customer`.`name`, `product`.`name` from `customer` 
join `order` 
	on `customer`.`id` = `order`.`customer_id` 
join `orderdetail` 
	on `order`.`id` = `orderdetail`.`order_id` 
join `product` 
	on `product`.`id` = `orderdetail`.`product_id`;

select `customer`.`name` from  `customer` where `id` not in (select `customer_id` from `order`);


select `order`.id,`order`.createdDate, sum(`orderdetail`.quantity*`product`.price) as "total" from `order` 
join `orderdetail` on `order`.id=`orderdetail`.order_id
join `product` on `product`.`id` = `orderdetail`.`product_id` group by `order`.`id`; 