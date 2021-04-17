const mysql = require("mysql");
const inquirer = require ("inquirer");
const consoleTable = require('console.table');
require("dotenv").config();

const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DATABASE,
});

connection.connect((err) => {
    if (err) throw err;
    console.log(`connected as id ${connection.threadId}`);
    start();
});

const start = () => {
    inquirer
      .prompt({
        name: "startOptions",
        type: "list",
        message: "What would you like to do?",
        choices: ["View All Employees", "View All Employees by Department", "View All Employees by Manager", "Add Employee", "Remove Employee", "Update Employee Role", "Update Employee Manager", "Exit"],
      })
      .then((answer) => {
        if (answer.startOptions === "View All Employees") {
          viewEmployees();
        } else if (answer.startOptions === "View All Employees by Department") {
          viewDepartment();
        } else if (answer.startOptions === "View All Employees by Manager") {
          viewManager();
        } else if (answer.startOptions === "Add Employee") {
          addEmployee();
        } else if (answer.startOptions === "Remove Employee") {
          removeEmployee();
        } else if (answer.startOptions === "Update Employee Role") {
          updateRole();
        } else if (answer.startOptions === "Update Employee Manager") {
          updateManager();
        } else if (answer.startOptions === "Exit") {
          connection.end();
        }
      });
  };

const viewEmployees = () => {
    const query = `SELECT employee.id, employee.first_name, employee.last_name, role.title, department.name AS department, role.salary, CONCAT(manager.first_name, ' ', manager.last_name) AS manager
    FROM employee
    LEFT JOIN employee manager on manager.id = employee.manager_id
    INNER JOIN roles ON (roles.id = employee.roles_id)
    INNER JOIN department ON (department.id = roles.department_id)
    ORDER BY employee.id;`;

    connection.query(query, (err, res) => {
        if (err) throw err;
        console.log("\n");
        console.table(res);
        start();
      });
};

const viewDepartment = () => {
    const query = `SELECT departmnet.name AS department, role.title, employee.id, employee.first_name, employee.last_name
    FROM employee
    LEFT JOIN roles ON (roles.id = employee.roles_id)
    LEFT JOIN department ON (department.id = roles.department_id)
    ORDER BY department.name;`;
    connection.query(query, (err, res) => {
        if (err) throw err;
        console.log("\n");
        console.table(res);
        start();
    });
};

const viewManager = () => {
    const query = `SELECT CONCAT(manager.first_name, ' ', manager.last_name) AS manager, department.name AS department, employee.id, employee.first_name, employee.last_name, roles.title
    FROM employee
    LEFT JOIN employee manager on manager.id = employee.manager_id
    INNER JOIN roles ON (roles.id = employee.roles_id && employee.manager_id != 'NULL')
    INNER JOIN department ON (department.id = roles.department_id)
    ORDER BY manager;`;

    connection.query(query, (err, res) => {
        if (err) throw err;
        console.log("\n");
        console.table(res);
        start();
    });
};