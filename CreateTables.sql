drop table if exists dept_emp;
drop table if exists dept_manager;
drop table if exists salaries;
drop table if exists employees;
drop table if exists titles;
drop table if exists departments;

/****** Object:  Table titles    Script Date: 4/28/2021 8:58:45 PM ******/

CREATE TABLE titles(
	title_id char(5) NOT NULL,
	title varchar(50) NOT NULL,
	primary key(title_id)
);


/****** Object:  Table [dbo].[departments]    Script Date: 4/27/2021 6:07:00 PM ******/

CREATE TABLE departments(
	dept_no char(4) NOT NULL,
	dept_name varchar(50) NOT NULL,
	primary key(dept_no)
);

/****** Object:  Table employees    Script Date: 4/28/2021 8:58:45 PM ******/

CREATE TABLE employees(
	emp_no int NOT NULL,
	title_id char(5) NOT NULL,
	birth_date date NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	sex char(1) NOT NULL,
	hire_date date NOT NULL,
	primary key(emp_no),
	constraint fk_employees_titles
	  foreign key(title_id)
	  references titles(title_id)
);

/****** Object:  Table salaries    Script Date: 4/28/2021 8:58:45 PM ******/

CREATE TABLE salaries(
	emp_no int NOT NULL,
	salary numeric(12,2) NOT NULL,
	primary key(emp_no),
	constraint fk_salaries_employees
	  foreign key(emp_no)
	  references employees(emp_no)
);

/****** Object:  Table dept_emp    Script Date: 4/28/2021 8:58:45 PM ******/

CREATE TABLE dept_emp(
	emp_no int NOT NULL,
	dept_no char(5) NOT NULL,
	primary key(emp_no, dept_no),
	constraint fk_deptemp_departments
	  foreign key(dept_no)
	  references departments(dept_no),
	constraint fk_deptemp_employees
	  foreign key(emp_no)
	  references employees(emp_no)
);

/****** Object:  Table dept_manager    Script Date: 4/28/2021 8:58:45 PM ******/

CREATE TABLE dept_manager(
	dept_no char(4) NOT NULL,
	emp_no int NOT NULL,
	primary key(dept_no, emp_no),
	constraint fk_deptmanager_departments
	  foreign key(dept_no)
	  references departments(dept_no)
);

