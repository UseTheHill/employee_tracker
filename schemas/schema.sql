DROP DATABASE IF EXISTS employee_mgmt_db;
CREATE DATABASE employee_mgmt_db;
USE employee_mgmt_db;

CREATE TABLE departments (
    id INT NOT NULL AUTO_INCREMENT,
    department_name VARCHAR(30),
    PRIMARY KEY (id)
);

INSERT INTO departments (department_name) values ('Sales'), ('Engineering'), ('Finance'), ('Management');

CREATE TABLE roles (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(30),
    salary DECIMAL(10,2),
    department_id INT NOT NULL,
    PRIMARY KEY (id),
    KEY fk_deparmtnet_id (department_id),
    CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO roles (title, salary, department_id) values ("Web Developer", "80000", 2)

INSERT INTO roles (title, salary, department_id) values ("Software Engineer", "100000", 2)

CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR (30),
    last_name VARCHAR(30),
    role_id INT NOT NULL,
    manager_id INT NULL,
    PRIMARY KEY (id),
    KEY fk_role_id (role_id),
    CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE RESTRICT ON UPDATE CASCADE, 
    KEY fk_department_id (manager_id),
    CONSTRAINT fk_manager_id FOREIGN KEY (manager_id) REFERENCES employees(id)
);

INSERT INTO employees (first_name, last_name, role_id, manager_id) values ("Kayte", "McDonough", 1, 3);

INSERT INTO employees (first_name, last_name, role_id) values ("Caroline", "Felice", 2);