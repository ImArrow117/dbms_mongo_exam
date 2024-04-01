create database dbms;
use dbms;

#Q1
create table customers(
c_id int auto_increment primary key,
name varchar(50) not null,
price float check(price>0),
product_id int unique default 0);

#Q2
insert into customers values (null ,"abhishek",5000,101),
(null, "jack",2000,201),
(null,"steven",6000,501);

select * from customers;

use hr;

select * from employees;

#Q3
select first_name from employees where first_name like '____';


#Q4
select sum(salary),department_id as total_salary from employees 
group by department_id;


#Q5
select first_name , salary,department_id from employees 
where salary = (select avg(salary) as avg_sal from employees group by department_id having avg_sal >75000);


select * from regions;
select * from locations;

#Q6
SELECT r.region_id, COUNT(l.city) AS city_count FROM regions r 
join locations l on l.region_id=r.region_id
GROUP BY r.region_id
ORDER BY city_count DESC
LIMIT 1;



#########################################################
# Q7
delimiter //
create procedure getEmpDetailsbyID (in emp_id int)
begin
    select concat(first_name," ",last_name) as full_name,hire_date,d.department_name from employees e
    join departments d on d.department_id=e.department_id
    where employee_id = emp_id;
end //
delimiter ;

call getEmpDetailsbyID(100);

select * from employees;


##############################################
#Q8

delimiter //
create function getYearofExp( e_id int)
returns int
deterministic
begin
    declare years int;
    select timestampdiff(year,hire_date,curdate()) into years from employees
    where employee_id = e_id;
    return years;
end //
delimiter ;

select getYearofExp(100);



################################### MONGO DB #############################################

#Q1
#db.restaurants.find({name:{$regex:/^[P]/}});



#Q2
#db.restaurants.find({$or:[{cuisine:'Bakery'},{cuisine:'Chinese'}]});


#Q3
#db.restaurants.find({ "grades.score": { $gte: 20}});