//establishing the mysql connection
const mysql = require('mysql2');

const db = mysql.createConnection({
    host:'127.0.0.1',
    user:'root',
    password: 'asdf1234',
    database: 'lankabangla'
})
    
db.connect((err,results) => {
    if(err) throw err;
    else{
        console.log('connected');
    }
})

//testing the connection 

module.exports = db;


