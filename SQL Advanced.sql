/*selecting a database to use for this session, All the tables will be created in the below database*/
USE AUGUST;

drop table customers;

CREATE TABLE customers (
    Id INT NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Age INT NOT NULL,
    Address VARCHAR(200),
    Salary NUMERIC(30),
    PRIMARY KEY (ID)
);

drop table orders;

CREATE TABLE orders (
    Oid INT NOT NULL,
    Date DATETIME NOT NULL,
    Customerid INT NOT NULL,
    Amount NUMERIC(20),
    PRIMARY KEY (oid)
);

insert into customers values(1, "John",32, "New York", 12455);
insert into customers values(2, "Robert",25, "London", 48755);
insert into customers values(3, "Juan",28, "Paris", 13525);
insert into customers values(4, "Cello",18, "Jakarta", 78925);
insert into customers values(5, "Oscar",39, "Singapore", 13655);
insert into customers values(6, "Anshu",42, "Delhi", 12455);
insert into customers values(7, "Rahul",21, "Kualalumpur", 78555);

select * from customers;

insert into orders values(105, "20191012",3,2000);
insert into orders values(100, "20190202",3,5400);
insert into orders values(106, "20191121",2,3210);
insert into orders values(112, "20191226",6,7840);
insert into orders values(110, "20190312",1,1000);
insert into orders values(109, "20190521",4,6300);
insert into orders values(120, "20190521",9,8700);

select * from orders; 
select * from customers;
/* We have created two tables - customers and orders*/

/*How to join two tables*/

select id,name,age,date,amount from customers, orders where customers.id = orders.customerid;
select id,name,age,date,amount from customers as c,orders as o where c.id = o.customerid;

-- how to see the above table with increasing order of id
select id,name,age,date,amount from customers, orders where customers.id = orders.customerid order by id;

-- INNER join
select id,name,age,amount from customers inner join orders on customers.id = orders.customerid;

-- LEFT join
select id,name,age,amount from customers left join orders on customers.id = orders.customerid;

-- RIGHT join
select id,name,age,amount from customers right join orders on customers.id = orders.customerid;

-- Full join
select id,name,age,amount from customers full join orders on customers.id = orders.customerid;
-- OR
select id,name,age,amount from customers left join orders on customers.id = orders.customerid;
union
select id,name,age,amount from customers right join orders on customers.id = orders.customerid;



/************************************************************************/
-- SELF JOIN
select a.id, a.name,a.age from customers as a;

select a.id,b.name,a.age from customers as a,customers as b;
select a.id,b.name,a.age,b.salary from customers as a,customers as b where a.salary<b.salary;

-- creating new table after data transformation
CREATE TABLE final_cust SELECT id, name, age, amount,salary,date FROM





