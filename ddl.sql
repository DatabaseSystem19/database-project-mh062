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

  

