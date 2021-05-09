/* Data Analysis */

/* 1. List the following details of each employee: employee number, last name, first name, sex, and salary. */
select
    emp.emp_no as EmployeeNumber
    , emp.last_name as LastName
    , emp.first_name as FirstName
    , emp.sex as Sex
    , sal.salary as Salary
from
    employees as emp
    inner join salaries as sal
      on emp.emp_no = sal.emp_no;


/* 2. List first name, last name, and hire date for employees who were hired in 1986. */
select
    emp.first_name
    , emp.last_name
    , emp.hire_date
from
    employees as emp
where
    emp.hire_date >= '1986-01-01'
    and emp.hire_date < '1987-01-01';


/* 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name. */

select
    dep.dept_no as DepartmentNumber
    , dep.dept_name as DepartmentName
    , emp.emp_no as EmployeeNumber
    , emp.last_name as LastName
    , emp.first_name as FirstName
from
    departments as dep
    inner join dept_manager as depman
      on dep.dept_no = depman.dept_no
    inner join employees as emp
      on depman.emp_no = emp.emp_no;


/* 4. List the department of each employee with the following information: employee number, last name, first name, and department name. */

select
    emp.emp_no as EmployeeNumber
    , emp.last_name as LastName
    , emp.first_name as FirstName
    , dep.dept_name as DepartmentName
from
    departments as dep
    inner join dept_emp as depemp
      on dep.dept_no = depemp.dept_no
    inner join employees as emp
      on depemp.emp_no = emp.emp_no
order by
    emp.emp_no asc;


/* 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B." */

select
    emp.first_name as FirstName
    , emp.last_name as LastName
    , emp.sex as Sex
from
    employees as emp
where
    emp.first_name = 'Hercules'
    and emp.last_name like 'B%';


/* 6. List all employees in the Sales department, including their employee number, last name, first name, and department name. */

select
    emp.emp_no as EmployeeNumber
    , emp.last_name as LastName
    , emp.first_name as FirstName
    , dep.dept_name as DepartmentName
from
    departments as dep
    inner join dept_emp as depemp
      on dep.dept_no = depemp.dept_no
    inner join employees as emp
      on depemp.emp_no = emp.emp_no
where
    dep.dept_name = 'Sales'
order by
    emp.emp_no asc;


/* 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name. */

select
    emp.emp_no as EmployeeNumber
    , emp.last_name as LastName
    , emp.first_name as FirstName
    , dep.dept_name as DepartmentName
from
    departments as dep
    inner join dept_emp as depemp
      on dep.dept_no = depemp.dept_no
    inner join employees as emp
      on depemp.emp_no = emp.emp_no
where
    dep.dept_name in ('Sales','Development')
order by
    emp.emp_no asc;


/* 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name. */

select
    emp.last_name as LastName
    , count(*) as LastNameCount
from
    employees as emp
group by
    emp.last_name
order by
    count(*) desc;
