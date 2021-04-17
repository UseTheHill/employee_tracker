DROP DATABASE IF EXISTS "employee_mgmt_db";
CREATE DATABASE "employee_mgmt_db";
USE "employee_mgmt_db";

CREATE TABLE departments (
    id INT NOT NULL AUTO_INCREMENT,
    department_name VARCHAR(30),
    PRIMARY KEY (id)
);


