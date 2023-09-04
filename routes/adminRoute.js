const express =  require('express');
const methodOverride = require('method-override');
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
//Add the sql queries here
adminRoute.post('/', upload.none(), (req,res) => {
    const {postClientName, postClientAcc, postClientBank, postBankAccountNum, postClientBoNum} = req.body;
    bank_sql = `INSERT INTO lankabangla.bank (account,bank_name) VALUES ("${postBankAccountNum}","${postClientBank}")`;
    //parent tables must be filled first
    db.query(bank_sql,(err,results) => {
        if (err) throw err;
        console.log('bank account added');
    });
    bo_sql = `INSERT INTO lankabangla.bo_account (bo_number) VALUES (?)`;
    db.query(bo_sql,[postClientBoNum],(err,results) => {
        if(err)throw err;
        console.log('bo account addded');
    });
    //client is a child table
    client_sql = `INSERT INTO lankabangla.client (account_number,client_name,bo_account_number,bank_account_number) VALUES ("${postClientAcc}","${postClientName}","${postClientBoNum}","${postBankAccountNum}");`;
    db.query(client_sql, (err,results) => {
        if(err) throw err;
        console.log('client Added.');
    })
});
adminRoute.delete('/',upload.none(), (req,res) => {
    const {delClientName, delClientAcc, delBankAccountNum,delClientBoNum} = req.body;
    //delete child records first
    client_sql = `DELETE FROM lankabangla.client WHERE account_number = "${delClientAcc}" AND client_name = "${delClientName}";`;
    db.query(client_sql, (err, results) => {
        if(err) throw err;
        console.log('client deleted');
    })
    bank_sql = `DELETE FROM lankabangla.bank WHERE account = "${delBankAccountNum}";`
    db.query(bank_sql,(err,results) => {
        if(err) throw err;
        console.log('bank account deleted');
    })
    bo_sql = `DELETE FROM lankabangla.bo_account WHERE bo_number = ${delClientBoNum};`
    db.query(bo_sql, (err,results) => {
        if(err) throw err;
        console.log("bo number deleted.");
    })
});

adminRoute.put('/',upload.none(),(req,res) => {
    const {updateClientName, updateClientTitle, updateClientPhone,updateClientAcc,updateClientFather,updateClientMother} = req.body;
    client_sql = `UPDATE lankabangla.client SET title = "${updateClientTitle.toUpperCase()}",phone_number = "${updateClientPhone}",father_name = "${updateClientFather}", mother_name = "${updateClientMother}" WHERE client_name = "${updateClientName}" AND account_number = "${updateClientAcc}";`;
    db.query(client_sql,(err,results) => {
        if(err) throw err;
        console.log('update succeeded.');
    })

})



module.exports = adminRoute;