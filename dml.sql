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

select d.dept_name, SUM(dd.duration) as total_labor_hours
from dept d
JOIN job j ON d.dept_id = j.dept_id
JOIN duty_duration dd ON j.job_id = dd.job_id
GROUP BY d.dept_name;

select dept_id, COUNT(*) as total_employees
from dept
GROUP BY dept_id having min(dept_id)>5;



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

-- and or not

SELECT * FROM employee WHERE gender = 'male' AND age > 30;
SELECT * FROM employee WHERE employee_id = 1 OR employee_id = 3;
SELECT * FROM employee WHERE employee_id <> 4;


--views

drop view employee_details;
create view employee_details as
select employee_id,e_name from employee;
select * from employee_details;




