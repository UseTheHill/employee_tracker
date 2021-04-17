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
        message: "What would you like to do?"
        choices: ["View All Employees", "View All Employees by Department", "View All Employees by Manager", "Add Employee", "Remove Employee", "Update Employee Role", "Update Employee Manager", "Exit"],
    })
    .then((answer)) => {
        
    }
}