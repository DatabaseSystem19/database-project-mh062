--ddl

   
-- drop table
drop table attendance_report;
drop table leave;
drop table job;
drop table dept;
drop table duty_duration;
drop table employee;

   --create table
   
 
   
Create table employee(
employee_id number(20) primary key,
e_name varchar(30) not null,
gender varchar(30),
age number check(age>20),
address varchar(30),
emp_email varchar(30),
emp_pass number(30)
);

Create table duty_duration(
duty_id number(30),
employee_id number(30),
job_id number(30),
duration number(30),
duty_date date,
foreign key(employee_id) references employee(employee_id),
primary key (duty_id)
);

create table dept(
dept_id number(30),
dept_name varchar(30),
primary key(dept_id)
);

create table job(
job_id number(20),
job_title varchar(30),
dept_id number(30),
primary key(job_id),
foreign key (dept_id) references dept(dept_id) on delete cascade
);


create table leave(
leave_id number(30),
employee_id number(30),
job_id number(30),
leave_date date,
primary key(leave_id),
foreign key (job_id) references job(job_id),
foreign key (employee_id) references employee(employee_id) 
);


create table attendance_report(
report_id number(30),
employee_id number(30),
duty_id number(30),
job_id number(30),
leave_id number(30),
total_labor varchar(30),
salary number(30),
ar_date date,
primary key(report_id),
foreign key(employee_id) references employee(employee_id),
foreign key(duty_id) references duty_duration(duty_id),
foreign key(job_id) references job(job_id),
foreign key(leave_id) references leave(leave_id)

);


   --alter
   
   
 
alter table employee
    modify e_name varchar(50);

alter table employee
    add phone_number varchar(15);
    alter table employee
    drop column phone_number;


alter table duty_duration
    modify duration number(10, 2);
    alter table duty_duration
    modify duration number(30);
    
alter table duty_duration
    rename column duty_date to start_date;
    alter table duty_duration
    rename column start_date to duty_date;


alter table dept
    drop column dept_name;
    
alter table dept
    add dept_name varchar(50);



alter table job
    modify job_title varchar(50);


alter table job
    add salary_range varchar(20);
    
    alter table job
    drop column salary_range;


    --data insertion
    
    
    --employee table
    
insert into employee(employee_id, e_name, gender, age, address, emp_email, emp_pass) values(1,'MH Shoeb','male',32,'mymensingh','mhasan@gmail.com',1234);
insert into employee(employee_id, e_name, gender, age, address, emp_email, emp_pass) values(2,'Hasibur','male',31,'comilla','hasib@gmail.com',12345);
insert into employee(employee_id, e_name, gender, age, address, emp_email, emp_pass) values(3,'sadikul','male',30,'lalmonirhat','sadik@gmail.com',123456);
insert into employee(employee_id, e_name, gender, age, address, emp_email, emp_pass) values(4,'siam','male',29,'dhaka','siam@gmail.com',1234567);
insert into employee(employee_id, e_name, gender, age, address, emp_email, emp_pass) values(5,'akash','male',25,'kishorgonj','akash@gmail.com',12345678);
insert into employee(employee_id, e_name, gender, age, address, emp_email, emp_pass) values(6,'shanto','male',35,'meghaloy','shanto@gmail.com',123456789);
insert into employee(employee_id, e_name, gender, age, address, emp_email, emp_pass) values(7,'reju','male',29,'dhaka','siam@gmail.com',1234567);
insert into employee(employee_id, e_name, gender, age, address, emp_email, emp_pass) values(8,'farjana','female',23,'dhaka','f@gmail.com',00000);
insert into employee(employee_id, e_name, gender, age, address, emp_email, emp_pass) values(9,'shan','male',39,'megh','shan@gmail.com',12222);



      --duty duration

insert into duty_duration (duty_id, employee_id, job_id, duration, duty_date) values
(10, 1, 101, 8, to_date('2023-05-21', 'YYYY-MM-DD'));
insert into duty_duration (duty_id, employee_id, job_id, duration, duty_date) values
(11, 2, 102, 8, to_date('2023-05-22', 'YYYY-MM-DD'));
insert into duty_duration (duty_id, employee_id, job_id, duration, duty_date) values
(12, 3, 103, 8, to_date('2023-05-23', 'YYYY-MM-DD'));
insert into duty_duration (duty_id, employee_id, job_id, duration, duty_date) values
(13, 4, 104, 8, to_date('2023-05-24', 'YYYY-MM-DD'));
insert into duty_duration (duty_id, employee_id, job_id, duration, duty_date) values
(14, 5, 105, 8, to_date('2023-03-25', 'YYYY-MM-DD'));
insert into duty_duration (duty_id, employee_id, job_id, duration, duty_date) values
(15, 6, 106, 8, to_date('2023-05-26', 'YYYY-MM-DD'));
insert into duty_duration (duty_id, employee_id, job_id, duration, duty_date) values
(16, 7, 107, 8, to_date('2023-05-27', 'YYYY-MM-DD'));
insert into duty_duration (duty_id, employee_id, job_id, duration, duty_date) values
(17, 8, 108, 8, to_date('2023-05-28', 'YYYY-MM-DD'));
insert into duty_duration (duty_id, employee_id, job_id, duration, duty_date) values
(18, 9, 109, 9, to_date('2023-05-29', 'YYYY-MM-DD'));

    --dept
    
    insert into dept (dept_id, dept_name) values (1, 'Finance');
insert into dept (dept_id, dept_name) values (2, 'Human Resources');
insert into dept (dept_id, dept_name) values (3, 'Marketing');
insert into dept (dept_id, dept_name) values (4, 'Operations');
insert into dept (dept_id, dept_name) values (5, 'Information Technology');
insert into dept (dept_id, dept_name) values (6, 'Sales');
insert into dept (dept_id, dept_name) values (7, 'Customer Service');
insert into dept (dept_id, dept_name) values (8, 'Research and Development');
insert into dept (dept_id, dept_name) values (9, 'Administration');



   --job title
   
   insert into job (job_id, job_title, dept_id) values (101, 'Accountant', 1);
insert into job (job_id, job_title, dept_id) values (102, 'HR Manager', 2);
insert into job (job_id, job_title, dept_id) values (103, 'Marketing Specialist', 3);
insert into job (job_id, job_title, dept_id) values (104, 'Operations Supervisor', 4);
insert into job (job_id, job_title, dept_id) values (105, 'IT Analyst', 5);
insert into job (job_id, job_title, dept_id) values (106, 'Sales Representative', 6);
insert into job(job_id,  job_title, dept_id) values (107, 'Cse', 7);
insert into job (job_id, job_title, dept_id) values (108, 'Research Scientist', 8);
insert into job (job_id, job_title, dept_id) values (109, 'Administrative Assistant', 9);


--leave table

insert into leave (leave_id, employee_id, job_id, leave_date) values (1001, 1, 101, to_date('2023-05-27', 'YYYY-MM-DD'));
insert into leave (leave_id, employee_id, job_id, leave_date) values (1002, 2, 102, to_date('2023-05-28', 'YYYY-MM-DD'));
insert into leave (leave_id, employee_id, job_id, leave_date) values (1003, 3, 103, to_date('2023-06-01', 'YYYY-MM-DD'));
insert into leave (leave_id, employee_id, job_id, leave_date) values (1004, 4, 104, to_date('2023-06-03', 'YYYY-MM-DD'));
insert into leave (leave_id, employee_id, job_id, leave_date) values (1005, 5, 105, to_date('2023-06-05', 'YYYY-MM-DD'));
insert into leave (leave_id, employee_id, job_id, leave_date) values (1006, 6, 106, to_date('2023-06-07', 'YYYY-MM-DD'));
insert into leave (leave_id, employee_id, job_id, leave_date) values (1007, 7, 107, to_date('2023-06-09', 'YYYY-MM-DD'));
insert into leave (leave_id, employee_id, job_id, leave_date) values (1008, 8, 108, to_date('2023-06-11', 'YYYY-MM-DD'));
insert into leave (leave_id, employee_id, job_id, leave_date) values (1009, 9, 109, to_date('2023-06-13', 'YYYY-MM-DD'));

          --attendance report
          
insert into attendance_report (report_id, employee_id, duty_id, job_id, leave_id, total_labor, salary, ar_date) values (201, 1, 10, 101, 1001, '8 hours', 100, to_date('2023-05-27', 'YYYY-MM-DD'));
insert into attendance_report (report_id, employee_id, duty_id, job_id, leave_id, total_labor, salary, ar_date) values (202, 2, 11, 102, 1002, '7 hours', 90, to_date('2023-05-28', 'YYYY-MM-DD'));
insert into attendance_report (report_id, employee_id, duty_id, job_id, leave_id, total_labor, salary, ar_date) values (203, 3, 12, 103, 1003, '6 hours', 80, to_date('2023-05-29', 'YYYY-MM-DD'));
insert into attendance_report (report_id, employee_id, duty_id, job_id, leave_id, total_labor, salary, ar_date) values (204, 4, 13, 104, 1004, '7.5 hours', 95, to_date('2023-05-30', 'YYYY-MM-DD'));
insert into attendance_report (report_id, employee_id, duty_id, job_id, leave_id, total_labor, salary, ar_date) values (205, 5, 14, 105, 1005, '8 hours', 100, to_date('2023-05-31', 'YYYY-MM-DD'));
insert into attendance_report (report_id, employee_id, duty_id, job_id, leave_id, total_labor, salary, ar_date) values (206, 6, 15, 106, 1006, '6.5 hours', 85, to_date('2023-06-01', 'YYYY-MM-DD'));
insert into attendance_report (report_id, employee_id, duty_id, job_id, leave_id, total_labor, salary, ar_date) values (207, 7, 16, 107, 1007, '7 hours', 90, to_date('2023-06-02', 'YYYY-MM-DD'));
insert into attendance_report (report_id, employee_id, duty_id, job_id, leave_id, total_labor, salary, ar_date) values (208, 8, 17, 108, 1008, '8 hours', 100, to_date('2023-06-03', 'YYYY-MM-DD'));
insert into attendance_report (report_id, employee_id, duty_id, job_id, leave_id, total_labor, salary, ar_date) values (209, 9, 18, 109, 1009, '6.5 hours', 85, to_date('2023-06-04', 'YYYY-MM-DD'));

  

--dml----



--DML

insert into employee (employee_id, e_name, gender, age, address, emp_email, emp_pass)
values (11, 'John Doe', 'male', 28, 'New York', 'johndoe@example.com', 5678);

insert into duty_duration (duty_id, employee_id, job_id, duration, duty_date)
values (19, 11, 102, 7, TO_DATE('2023-06-02', 'YYYY-MM-DD'));

insert into dept (dept_id, dept_name)
values (10, 'Operations');

insert into job (job_id, job_title, dept_id)
values (110, 'Operations Manager', 10);

insert into leave (leave_id, employee_id, job_id, leave_date)
values (1010, 3, 103, TO_DATE('2023-06-05', 'YYYY-MM-DD'));

insert into attendance_report (report_id, employee_id, duty_id, job_id, leave_id, total_labor, salary, ar_date)
values (210, 4, 13, 104, NULL, '8 hours', 100, TO_DATE('2023-06-04', 'YYYY-MM-DD'));


--update
update employee
set age = 33
where employee_id = 1;
update duty_duration
set duration = 9
where duty_id = 10;
update dept
set dept_name = 'Finance Department'
where dept_id = 1;
update job
set job_title = 'Senior Accountant'
where job_id = 101;
update attendance_report
set salary = 110
where report_id = 201;


insert into dept (dept_id, dept_name)
values (11, 'New Department');
select * from dept where dept_id = 11;
--delete particular attribute
delete from dept where dept_id = 10;

-- duration more than 8 hours people's dept name

select d.dept_name
from dept d
join job jt ON d.dept_id = jt.dept_id
join duty_duration dd ON jt.job_id = dd.job_id
where dd.duration > 8;

select dept_name from dept where dept_id in (select dept_id from job where job_id in (select job_id from duty_duration where
duration >8 ));


-- job id whose job id 102
select duty_date
from duty_duration
where job_id = 104;


select d.dept_name
from dept d
join job jt ON d.dept_id = jt.dept_id
where jt.job_title = 'Cse';

--job id to dept name

select d.dept_name
from dept d
inner join job jt ON jt.dept_id = d.dept_id
where jt.job_id = 104;

select dept_name from dept where dept_id = ( select dept_id from job where job_id=104);

  -- max working hour employee name;
  
  select e_name from employee where employee_id in (select employee_id from duty_duration where duration=(select max(duration) from duty_duration));


   --union , intersect , except
   
 select dept_id from job
union
select job_id from leave;

 select dept_id from job
intersect
select job_id from leave;

select job_title from job
except
select dept_name from dept;


--aggregate function
select count(*) as total_employees from employee;
select sum(salary) as total_salary from attendance_report;
select avg(age) as average_age from employee;
select min(duration) as min_duration from duty_duration;
select max(salary) as max_salary from attendance_report;


-- group by & having
-- Grouping employees by job title and calculating the average age per job title

-- Query to get the total labor hours per department

select d.dept_name, sum(dd.duration) as total_labor_hours
from dept d
join job j ON d.dept_id = j.dept_id
join duty_duration dd on j.job_id = dd.job_id
group by d.dept_name;

select dept_id, count(*) as total_employees
from dept
group by dept_id having min(dept_id)>5;



--string operation

select dept_name
from dept
where dept_name LIKE '%e%r%';


select dept_name
from dept
where dept_name LIKE '%er%';


select dept_name
from dept
where dept_name LIKE '%e';


select dept_name
from dept
where dept_name LIKE 'F%';


select dept_name
from dept
where dept_name LIKE '--r';

--join

select * from dept natural join employee where employee_id=3;

select job_title,dept_id from job join dept using(dept_id);


--views

drop view employee_details;
create view employee_details as
select employee_id,e_name from employee;
select * from employee_details;

--and or not

SELECT * FROM employee WHERE gender = 'male' AND age > 30;
SELECT * FROM employee WHERE employee_id = 1 OR employee_id = 3;
SELECT * FROM employee WHERE employee_id <> 4;


  --plsql

--variable declaration and print value
set serveroutput on;
declare 
employee_id employee.employee_id%type;
e_name employee.e_name%type;
no_of_employee number;
begin
select employee_id,e_name,no_of_employee into employee_id,e_name,no_of_employee from employee where employee_id=7;
dbms_output.put_line('employee_id: '||employee_id|| ' employee name: '||e_name || ' no_of_employee: '||no_of_employee);
end;
/

--insert and set default value
set serveroutput on;
declare 
employee_id employee.employee_id%type:=12;
e_name employee.e_name%type:='hasibur';
gender employee.gender%type:='male';
age employee.age%type:=31;
address employee.address%type:='magura';
emp_email employee.emp_email%type:='emp@gmail,com';
emp_pass employee.emp_pass%type:='2344234';
begin
insert into employee values(employee_id,e_name,gender,age,address,emp_email,emp_pass);
end;
/

--cursor and row count
declare
cursor emp_cursor is select * from employee;
dept_row employee%rowtype;
begin
open emp_cursor;
fetch emp_cursor into dept_row.employee_id, dept_row.e_name, dept_row.gender, dept_row.age, dept_row.address, dept_row.emp_email, dept_row.emp_pass;

while emp_cursor%found loop
dbms_output.put_line('employee_id: '||dept_row.employee_id|| ' dept_name: '||dept_row.e_name || 
' gender: ' ||dept_row.gender|| ' age '||dept_row.age|| ' address '||dept_row.address|| ' email '||dept_row.emp_email|| ' password '||dept_row.emp_pass);

dbms_output.put_line('row count: '|| emp_cursor%rowcount);
fetch emp_cursor into dept_row.employee_id, dept_row.e_name, dept_row.gender, dept_row.age, dept_row.address, dept_row.emp_email, dept_row.emp_pass;
end loop;

close emp_cursor;
end;
/

--row type
set serveroutput on;
declare 
dept_row employee%rowtype;
begin
select employee_id,e_name,address into dept_row.employee_id,dept_row.e_name,dept_row.address from employee where employee_id=7;
end;
/

--for loop/while loop/array with extend() function
set serveroutput on;
declare 
counter number;
e_name2 employee.e_name%type;
type namearray is varray(5) of employee.e_name%type; 
a_name namearray := namearray();
begin
counter := 1;
for x in 1..5  
loop
select e_name into e_name2 from employee where employee_id = x;
a_name.extend();
a_name(counter) := e_name2;
counter := counter + 1;
end loop;

counter := 1;
while counter <= a_name.count 
loop 
dbms_output.put_line(a_name(counter)); 
counter := counter + 1;
end loop;
end;
/

--array without extend() function
declare
counter number := 1;
book_name2 employee.e_name%type;
type namearray is varray(5) of employee.e_name%type;
a_name namearray := namearray('book 1', 'book 2', 'book 3', 'book 4', 'book 5');
begin
counter := 1;
for x in 5..9
loop
select e_name into book_name2 from employee where employee_id = x;
a_name(counter) := book_name2;
counter := counter + 1;
end loop;
counter := 1;
while counter <= a_name.count 
loop 
dbms_output.put_line(a_name(counter)); 
counter := counter + 1;
end loop;
end;
/

--if/elseif/else
begin
declare
counter number := 1;
book_name2 employee.e_name%type;
type namearray is varray(5) of employee.e_name%type;
a_name namearray := namearray('mh shoeb', 'hasibur', 'sadikul', 'siam', 'akash');
begin
counter := 1;
for x in 1..10  
loop
begin
select e_name into book_name2 from employee where employee_id = x;
if book_name2 = 'mh shoeb' then
dbms_output.put_line(book_name2 || ' is in the finance department');
elsif book_name2 = 'hasibur' then
dbms_output.put_line(book_name2 || ' is in the human resources department');
elsif book_name2 = 'sadikul' then
dbms_output.put_line(book_name2 || ' is in the marketing department');
elsif book_name2 = 'siam' then
dbms_output.put_line(book_name2 || ' is in the operations department');
elsif book_name2 = 'akash' then
dbms_output.put_line(book_name2 || ' is in the information technology department');
else
dbms_output.put_line(book_name2 || ' is in an unknown department');
end if;
exception
when no_data_found then
dbms_output.put_line('no data found for employee_id ' || x);
continue; -- continue the loop without terminating
end;
end loop;
end;
end;
/

--procedure
create or replace procedure proc2(
  var1 in number,
  var2 out varchar2,
  var3 in out number
)
as
  t_show varchar2(30);
begin
  t_show := 'from procedure: ';
  select dept_name into var2 from dept where dept_id in (select dept_id from job where job_id = var1);
  var3 := var1 + 1; 
  dbms_output.put_line(t_show || var2 || ' code is ' || var1 || ' in out parameter: ' || var3);
exception
  when no_data_found then
    dbms_output.put_line('no data found for job_id ' || var1);
end;
/

declare
  book_no employee.employee_id%type := 12;
  course_name job.job_title%type;
  extra number;
begin
  -- call the proc2 procedure passing the parameters
  proc2(book_no, course_name, extra);
  
  -- print the output
  dbms_output.put_line('output: ' || course_name || ', ' || extra);
end;
/

--function
set serveroutput on;

create or replace function fun(var1 in varchar) return varchar as
  value dept.dept_name%type;
begin
  select dept_name into value from dept where dept_id = var1;
  return value;
end;
/

set serveroutput on;

declare
  value varchar(50); 
begin
  value := fun('5');
  dbms_output.put_line('output: ' || value);
end;
/

--drop procedure/function
drop procedure proc2;
drop function fun;
