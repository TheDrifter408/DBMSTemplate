const express =  require('express');
const multer = require('multer');
const upload = multer();
const adminRoute = express.Router();

const db = require('../server/connection');
db.connect();

adminRoute.get('/',(req,res) => {
    res.render('adminDash');
})

/* db.query(sqlQuery, (error, results) => {
    if (error) {
        console.error('Error querying the database:', error);
        return;
    }

    // Pass the results to the EJS template for rendering
    // Render the template and pass the data
    adminRoute.get('/', (req, res) => {
        res.render('adminDash');
    });
}); */
//bank account_number : 100005010
//bo_account_number : 621230926322084
//

//Add the sql queries here
adminRoute.post('/', upload.none(), (req,res) => {
    const {postBankAccountNum, postClientName, postClientBoNum} = req.body;
    let acc_num = 1009537;
    bank_sql = 'INSERT INTO lankabangla.bank (account) VALUES (?)';
    //parent tables must be filled first
    db.query(bank_sql,[postBankAccountNum],(err,results) => {
        if (err) throw err;
        console.log('bank account added');
    });
    bo_sql = `INSERT INTO lankabangla.bo_account (bo_number) VALUES (?)`;
    db.query(bo_sql,[postClientBoNum],(err,results) => {
        if(err)throw err;
        console.log('bo account addded');
    });
    //client is a child table
    client_sql = `INSERT INTO lankabangla.client (account_number,client_name,bo_account_number,bank_account_number) VALUES (${acc_num},${postClientName},${postClientBoNum},${postBankAccountNum});`;
    db.query(client_sql, (err,results) => {
        if(err) throw err;
        console.log('client Added.');
    })
});
//Finish delete and put requests
adminRoute.delete('/',upload.none(), (req,res) => {
    const {delClientName, delBankAccountNum, delClientBoNum} = req.body;
    let acc_num = 1009536;
    //delete child records first
    client_sql = `DELETE FROM lankabangla.client (account_num, client_name,bo_account_number,bank_account_number) VALUES 
    (${acc_num},${delClientName},${delClientBoNum},${delBankAccountNum});`;
    db.query(client_sql, (err, results) => {
        if(err) throw err;
        console.log('client deleted');
    })
})



module.exports = adminRoute;