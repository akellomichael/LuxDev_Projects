create schema if not exists nairobi_academy;

set search_path to nairobi_academy;

create table students(
student_id INT primary key,
first_name VARCHAR(50) not null,
last_name VARCHAR(50) not null,
gender VARCHAR(1),
date_of_birth DATE,
class VARCHAR(10),
city VARCHAR(50)
);

create table subjects(
subject_id INT primary key,
subject_name VARCHAR(100) not null unique,
department VARCHAR(50),
teacher_name VARCHAR(100),
credits INT
);

create table exam_results(
result_id INT primary key,
student_id INT not null,
subject_id INT not null,
marks INT not null,
exam_date DATE,
grade VARCHAR(2)
);


alter table students
add column phone_number VARCHAR(20);


select * from subjects;

alter table subjects 
rename credits to credit_hours;


alter table students 
drop column phone_number;



insert into students (student_id, first_name, last_name, gender, date_of_birth, class, city)
values(1, 'Amina', 'Wanjiku', 'F', '2008-03-12', 'Form3', 'Nairobi');

insert into students (student_id, first_name, last_name, gender, date_of_birth, class, city)
values(2, 'Brian', 'Ochieng', 'M', '2007-07-25', 'Form4', 'Mombasa'),
(3, 'Cynthia', 'Mutua', 'F', '2008-11-05', 'Form3', 'Kisumu'),
(4, 'David', 'Kamau', 'M', '2007-02-18', 'Form4', 'Nairobi'),
(5, 'Esther', 'Akinyi', 'F' , '2009-06-30', 'Form2', 'Nakuru'),
(6, 'Felix', 'Otieno', 'M', '2009-09-14', 'Form2','Eldoret'),
(7, 'Grace', 'Mwangi', 'F', '2008-01-22', 'Form3', 'Nairobi'),
(8, 'Hassan', 'Abdi', 'M', '2007-04-09', 'Form4', 'Mombasa'),
(9, 'Ivy', 'Chebet', 'F', '2009-12-01', 'Form2', 'Nakuru'),
(10, 'James', 'Kariuki', 'M', '2008-08-17', 'Form3', 'Nairobi');

insert into subjects (subject_id, subject_name, department, teacher_name, credit_hours)
values (1, 'Mathematics', 'Sciences', 'Mr. Njoroge', 4),
(2,'English', 'Languages', 'Ms. Adhiambo', 3),
(3, 'Biology', 'Sciences', 'Ms. Otieno', 4 ),
(4, 'History', 'Humanities', 'Mr. Waweru', 3),
(5, 'Kiswahili',' Languages', 'Ms. Nduta', 3),
(6, 'Physics', 'Sciences', 'Ms. Kamande', 4),
(7, 'Geography', 'Humanities', 'Ms. Chebet', 3),
(8, 'Chemistry', 'Sciences', 'Ms. Muthoni', 4),
(9, 'Computer Sciences', 'Sciences', 'Mr. Oduya', 3),
(10, 'Business Studies', 'Humanities', 'Ms. Wangari', 3);

select * from exam_results;

insert into exam_results (result_id, student_id, subject_id, marks, exam_date, grade)
values (2, 1, 2, 85, '2024-03-16', 'A'),
(3, 2, 1, 92, '2024-03-15', 'A'),
(4 ,2 , 3, 55, '2024-03-17', 'C'),
(5, 3, 2, 49, '2024-03-16', 'D'),
(6, 3, 4, 71, '2024-03-18', 'B'),
(7, 4, 1, 88, '2024-03-15', 'A'),
(8, 4, 6, 63, '2024-03-19', 'C'),
(9, 5, 5, 39, '2024-03-20', 'F'),
(10, 6, 9, 95, '2024-03-21', 'A');



select * from students;

select * from subjects;

select * from exam_results;

-- Q12 - Update student change city to Nairobi
update students
set city = 'Nairobi'
where student_id = 5;

-- Q13 - Update marks to 59 for student id 5
update exam_results
set marks = 59
where result_id = 5;


-- Q14 - Delete result id 9
delete from exam_results
where result_id = 9;


/*
 * Section C
 */
-- Q15 
select * from students
where class = 'Form4';

-- Q16
select subject_name  from subjects
where department = 'Sciences';

-- Q17
select * from exam_results er
where er.marks >= 70;

-- 	Q18
select first_name, last_name from students s
where gender = 'F';

-- Q19
select * from students s 
where class = 'Form3' and city = 'Nairobi';

-- Q20
select * from students s 
where class = 'Form2' or class = 'Form4';

/*
 * Part 2
 */
-- section A
-- Q1
select * from exam_results er 
where er.marks between 50 and 80;

select * from exam_results er 
where er.marks >= 50 and er.marks <= 80;

-- Q2
select * from exam_results er 
where er.exam_date between '2024-03-15' and '2024-03-18';

select * from exam_results er 
where er.exam_date >= '2024-03-15' and er.exam_date <= '2024-03-18';

-- Q3
select * from students s 
where s.city in ('Nairobi', 'Mombasa', 'Kisumu');

-- Q4
select s.first_name, s.last_name  from students s 
where s."class" not in ('Form2', 'Form3'); 


-- Q5
select s.first_name, s.last_name from students s
where s.first_name like 'A%';

-- Q6
select s.subject_name, s.department  from subjects s
where s.subject_name like '%Studies%';

/*
 * Section B - Count
 */
--Q7
select count(*)
from students s
where s."class" = 'Form3';

-- Q8
select count(*)
from exam_results er 
where marks <= 70;

-- Section c
-- Q9
select *,
case
	when er.marks >= 80 then 'Distinction'
	when er.marks >= 60 then 'Merit'
	when er.marks >= 40 then 'Pass'
	else 'fail'
end as Performance
from exam_results er;

--Q10
select s.first_name, s.last_name, s."class",
case
	when s."class" in ('Form3', 'Form4') then 'Senior'
	when s."class" in ('Form2', 'Form1') then 'Junior'
	else 'error'
end as student_level
from students s ;











select * from students s ;















