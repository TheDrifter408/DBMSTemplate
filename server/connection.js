//establishing the mysql connection
const mysql = require('mysql2');

const db = mysql.createConnection({
    host:'localhost',
    user:'Nurullah',
    password: 'nuru11@hA1N00r',
    database: 'lankabangla'
})    


//testing the connection 

module.exports = db;


