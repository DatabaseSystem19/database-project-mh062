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
