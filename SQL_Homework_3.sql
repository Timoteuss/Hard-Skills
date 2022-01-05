-- Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select e.employee_name from employees e 
join employee_salary es 
on e.id = es.employee_id;

-- Вывести всех работников у которых ЗП меньше 2000.
select e.employee_name, s.monthly_salary from employees e 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where monthly_salary<2000;

-- Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s, e.employee_name from salary s 
left join employee_salary es on s.id = es.salary_id
left join employees e on es.employee_id = e.id
where employee_name is null;

-- другой, правильный варинт
select monthly_salary from salary s 
left join employee_salary es on s.id = es.salary_id
where es.employee_id is null;

-- Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s, e.employee_name from salary s 
left join employee_salary es on es.salary_id = s.id
left join employees e on e.id = es.employee_id
where employee_name is null and monthly_salary<2000;

-- Найти всех работников кому не начислена ЗП.
select e.employee_name, es.salary_id from employees e 
left join employee_salary es on es.employee_id = e.id
where salary_id is null;

-- Вывести всех работников с названиями их должности.
select e.employee_name, r.role_name from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id;

-- Вывести имена и должность только Java разработчиков.
select e.employee_name, r.role_name from employees e 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id
where role_name like '%Java developer';

-- Вывести имена и должность только Python разработчиков.
select e.employee_name, r.role_name from employees e 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like '%Python developer';

-- Вывести имена и должность всех QA инженеров.
select e.employee_name, r.role_name from employees e 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like '%QA%';

-- Вывести имена и должность ручных QA инженеров.
select e.employee_name, r.role_name from employees e 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like '%Manual QA%';

-- Вывести имена и должность автоматизаторов QA
select e.employee_name, r.role_name from employees e 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like '%Automation QA%';

-- Вывести имена и зарплаты Junior специалистов
select e.employee_name, s.monthly_salary from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like 'Junior%';

-- Вывести имена и зарплаты Middle специалистов
select e.employee_name, s.monthly_salary from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like 'Middle%';

-- Вывести имена и зарплаты Senior специалистов
select e.employee_name, s.monthly_salary from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id 
where role_name like 'Senior%';

-- Вывести зарплаты Java разработчиков
select monthly_salary from salary s 
join employee_salary es on es.salary_id = s.id 
join employees e on e.id = es.employee_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like '%Java developer';

-- Вывести зарплаты Python разработчиков
select monthly_salary from salary s 
join employee_salary es on es.salary_id = s.id 
join employees e on e.id = es.employee_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like '%Python developer';

-- Вывести имена и зарплаты Junior Python разработчиков

insert into employee_salary(employee_id, salary_id)
values  (35, 1),
		(36, 2);
	
insert into roles_employee (employee_id,role_id)
values  (36, 1);

select e.employee_name, s.monthly_salary from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like 'Junior Python developer';

-- Вывести имена и зарплаты Middle JS разработчиков
select e.employee_name, s.monthly_salary from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like 'Middle JavaScript developer';

-- Вывести имена и зарплаты Senior Java разработчиков
select e.employee_name, s.monthly_salary from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like 'Senior Java developer';

-- Вывести зарплаты Junior QA инженеров
select monthly_salary from salary s 
join employee_salary es on es.salary_id = s.id 
join employees e on e.id = es.employee_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like 'Junior%QA engineer';

-- Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) from salary s 
join employee_salary es on es.salary_id = s.id 
join employees e on e.id = es.employee_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like 'Junior%';

-- Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) from salary s 
join employee_salary es on es.salary_id = s.id 
join employees e on e.id = es.employee_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like '%JavaScript developer';

-- Вывести минимальную ЗП QA инженеров
select min(monthly_salary) from salary s 
join employee_salary es on es.salary_id = s.id 
join employees e on e.id = es.employee_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like '%QA%';

-- Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from salary s 
join employee_salary es on es.salary_id = s.id 
join employees e on e.id = es.employee_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like '%QA%';

-- Вывести количество QA инженеров
select COUNT(*) from roles_employee re 
join roles r on r.id = re.role_id 
where role_name like '%QA%';

-- Вывести количество Middle специалистов.
select count(*) from roles_employee re 
join roles r on r.id = re.role_id 
where role_name like 'Middle%';

-- Вывести количество разработчиков
select count(*) from roles_employee re 
join roles r on r.id = re.role_id 
where role_name like '%developer'; 

-- Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) from salary s 
join employee_salary es on es.salary_id = s.id 
join employees e on e.id = es.employee_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like '%developer';

-- Вывести имена, должности и ЗП всех специалистов по возрастанию
select e.employee_name, r.role_name, s.monthly_salary from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
order by s.monthly_salary;

-- Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select e.employee_name, r.role_name, s.monthly_salary from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where monthly_salary between 1700 and 2300
order by monthly_salary;

-- Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select e.employee_name, r.role_name, s.monthly_salary from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where monthly_salary<2300
order by monthly_salary;

-- Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select e.employee_name, r.role_name, s.monthly_salary from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where monthly_salary=1100 or monthly_salary=1500 or monthly_salary=2000
order by monthly_salary;

--или
select e.employee_name, r.role_name, s.monthly_salary from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;