const express = require("express");
const multer = require('multer');
const upload = multer();
const db = require('../server/connection');
const clientRoute = express.Router();

clientRoute.get('/',(req,res) => {
    res.render('clientForm');
})

clientRoute.post('/',upload.none(),(req,res) => {
    const {clientAccountNum,clientCode,clientTitle,clientName,clientFather,clientMother,clientSpouse,clientCountry,clientPhone,clientOperation,clientIntroId,clientBoNum,clientBankAcc} = req.body;
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