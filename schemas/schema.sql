DROP DATABASE IF EXISTS employee_db;
CREATE DATABASE employee_db;
USE employee_db;

CREATE TABLE department (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE roles (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    department_id INT NOT NULL,
    CONSTRAINT fk_department_id
    FOREIGN KEY (department_id)
    REFERENCES department(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (id)
);

CREATE TABLE employee (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INT NOT NULL,
    manager_id INT NULL, 
    CONSTRAINT fk_role_id
    FOREIGN KEY (role_id)
    REFERENCES roles(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (id)
);

SELECT * FROM department;

INSERT INTO department (name)
VALUES ("Engineering");

INSERT INTO department (name)
VALUES ("Sales");

INSERT INTO department (name)
VALUES ("Legal");

INSERT INTO department (name)
VALUES ("Finance");

INSERT INTO roles (title, salary, department_id)
VALUES ("Sales Lead", 100000, 1);

INSERT INTO roles (title, salary, department_id)
VALUES ("Salesperson", 80000, 1);

INSERT INTO roles (title, salary, department_id)
VALUES ("Lead Engineer", 150000, 2);

INSERT INTO roles (title, salary, department_id)
VALUES ("Software Engineer", 120000, 2);

INSERT INTO roles (title, salary, department_id)
VALUES ("Accountant", 125000, 3);

INSERT INTO roles (title, salary, department_id)
VALUES ("Leagal Team Lead", 255000, 4);

INSERT INTO roles (title, salary, department_id)
VALUES ("lawyer", 190000, 4);

INSERT INTO employee (first_name, last_name, role_id)
VALUES ("Kayte", "McDonough", 2);