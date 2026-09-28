DROP TABLE IF EXISTS employees_departments;
DROP TABLE IF EXISTS documents ;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS documents_type;


CREATE TABLE departments (
	id bigint GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	name varchar(150) NOT NULL UNIQUE
);

CREATE TABLE roles (
	id bigint GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	name varchar(150) NOT NULL UNIQUE
);

CREATE TABLE documents_type (
	id bigint GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	type varchar(150) NOT NULL UNIQUE
);

CREATE TABLE employees (
	id bigint GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	email varchar(150) NOT NULL UNIQUE,
	name varchar(50) NOT NULL,
	surname varchar(50) NOT NULL,
	patronymic varchar(50),
	birthday date NOT NULL,
	role_id bigint NOT NULL,
	FOREIGN KEY (role_id)  REFERENCES roles (id)
);

CREATE TABLE documents (
	id bigint GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	issue_date date NOT NULL,
	organization varchar(150) NOT NULL,
	number varchar(150) NOT NULL,
	type_id bigint NOT NULL,
	employee_id bigint NOT NULL,
	FOREIGN KEY (type_id)  REFERENCES documents_type (id) ON DELETE CASCADE,
	FOREIGN KEY (employee_id)  REFERENCES employees (id) ON DELETE CASCADE,
	CONSTRAINT uk_employee_document
	UNIQUE (employee_id, type_id)
);

CREATE TABLE employees_departments (
	id bigint GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	employee_id bigint NOT NULL,
	department_id bigint NOT NULL,
	FOREIGN KEY (employee_id)  REFERENCES employees  (id) ON DELETE CASCADE,
	FOREIGN KEY (department_id)  REFERENCES departments  (id) ON DELETE CASCADE,
	CONSTRAINT uk_employee_department UNIQUE (employee_id, department_id)
);
