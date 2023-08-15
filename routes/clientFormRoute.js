const express = require("express");
const db = require('../server/connection');

db.connect();
//testing the connection 
/*
db.connect((err) => {
    if(err){
        console.log('connection failed');
    }
    console.log('Connected successful.')
})
*/

const clientRoute = express.Router();

clientRoute.get('/',(req,res) => {
    res.render('clientForm');
})
let client = {};

clientRoute.post('/',(req,res) => {
    let clientAccountNum = req.body.accountNo;
    let clientCode = req.body.clientCode;
    let clientTitle = req.body.clientTitle;
    let clientName = req.body.clientName;
    let clientFather = req.body.clientFather;
    let clientMother = req.body.clientMother;
    let clientSpouse = req.body.clientSpouse;
    let clientCountry = req.body.clientCountry;
    let clientPhone = req.body.clientPhone;
    let clientOperation = req.body.clientOperation;
    let clientIntroId = req.body.clientIntroId;
    let clientBoNum = req.body.clientBoNum;
    let clientBankAcc = req.body.clientBankAcc;
    console.log('Client Name: ' + clientName);
    console.log('Client account number: ' + clientAccountNum);
    statement = `INSERT INTO client(account_number,client_name) VALUES(${clientAccountNum},'${clientName}');`;
    /*db.query(statement,(err,results,fields) => {
        if(err){
            console.error("Unsuccessful " + err);
        } else {
            console.log(results);    
        }
    })*/
})


module.exports = clientRoute;