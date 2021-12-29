/*Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null */

create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees;

--Наполнить таблицу employee 70 строками.
insert into employees (employee_name)
values  ('Juanita Richards'),
		('Linda Adams'),
		('Ramona Robertson'),
		('Karen Ford'),
		('David Phillips'),
		('Mildred Lopez'),
		('James Anderson'),
		('Katrina Williams'),
		('Terry Pearson'),
		('Sandra Graham'),
		('Donna Barnes'),
		('Larry Simmons'),
		('Dawn Cross'),
		('Terry Moore'),
		('Richard Wright'),
		('Susan Simmons'),
		('Gary Chambers'),
		('Diane Tucker'),
		('James White'),
		('Donna Hill'),
		('Jason Williams'),
		('Tamara Peterson'),
		('Carole Peters'),
		('Jimmy Patterson'),
		('Arnold Oliver'),
		('Tim Romero'),
		('Bobby Davis'),
		('Douglas Davis'),
		('Brett Castro'),
		('Sonia Collins'),
		('Michelle Long'),
		('Michelle Miller'),
		('Emma Hall'),
		('Julia Reese'),
		('Frank Dawson'),
		('Brandon Anderson'),
		('Arthur Potter'),
		('Carolyn Fisher'),
		('Mary Diaz'),
		('Joshua Thomas'),
		('Dennis Clark'),
		('Mary Zimmerman'),
		('Timothy Edwards'),
		('Michael Anderson'),
		('Donald Rogers'),
		('David Greene'),
		('Dorothy McKinney'),
		('Maria Turner'),
		('Michael Allen'),
		('Sandra Fowler'),
		('Bertha Burns'),
		('Jeff Phillips'),
		('Irene Rivera'),
		('Robert Castillo'),
		('Michael Martin'),
		('Gregory Washington'),
		('Melanie Peterson'),
		('Jonathan Lamb'),
		('John Olson'),
		('Josephine Freeman'),
		('Tony Walters'),
		('Nancy Marshall'),
		('Brenda Lopez'),
		('Hector Robinson'),
		('Margaret Walters'),
		('Gerald Leonard'),
		('Virgil King'),
		('John Jones'),
		('Leo Stewart'),
		('Nicholas Lopez');
		
--	Создать таблицу salary
-- -id. Serial  primary key,
-- -monthly_salary. Int, not null
	
create table salary(
	id serial primary key,
	monthly_salary int not null
);

select * from salary

-- Наполнить таблицу salary 15 строками:
insert into salary (monthly_salary)
values  (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400);
		
select * from salary;

/* Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null*/

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

select * from employee_salary;

-- Наполнить таблицу employee_salary 40 строками:
--	- в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary(employee_id, salary_id)
values  (1,1),
		(2,2),
		(3,3),
		(71,4),
		(4,5),
		(5,6),
		(6,7),
		(72,8),
		(7,9),
		(8,10),
		(9,11),
		(73,12),
		(10,13),
		(11,14),
		(12,15),
		(74,1),
		(13,2),
		(14,3),
		(15,4),
		(75,5),
		(16,6),
		(17,7),
		(18,8),
		(76,9),
		(19,10),
		(20,11),
		(21,12),
		(77,13),
		(22,14),
		(23,15),
		(24,1),
		(78,2),
		(25,3),
		(26,4),
		(27,5),
		(79,6),
		(28,7),
		(29,8),
		(30,9),
		(80,10);

/* Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique*/
create table roles(
	id serial primary key,
	role_name int not null unique
);
select * from roles;

--Поменять тип столба role_name с int на varchar(30)
alter table roles
alter column role_name type varchar(30);

-- Наполнить таблицу roles 20 строками:
insert into roles(role_name)
values  ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');

	/*10.	Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)*/
create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key(employee_id)
		references employees(id),
	foreign key(role_id)
		references roles(id)
);

select * from roles_employee;

-- Наполнить таблицу roles_employee 40 строками
insert into roles_employee (employee_id,role_id)
values  (7,2),
		(20,4),
		(3,9),
		(5,13),
		(23,4),
		(11,2),
		(10,9),
		(22,13),
		(21,3),
		(34,4),
		(6,7),
		(37,12),
		(53,13),
		(55,14),
		(12,15),
		(35,1),
		(13,2),
		(14,3),
		(15,4),
		(33,5),
		(16,6),
		(17,7),
		(18,8),
		(39,9),
		(19,10),
		(59,11),
		(43,12),
		(41,13),
		(51,14),
		(57,15),
		(24,16),
		(45,17),
		(25,18),
		(26,19),
		(27,20),
		(47,6),
		(28,13),
		(29,8),
		(30,3),
		(49,10);