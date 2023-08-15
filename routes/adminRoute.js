const express =  require('express');
const multer = require('multer');
const upload = multer();
const adminRoute = express.Router();

const db = require('../server/connection');


adminRoute.get('/',(req,res) => {
    res.render('adminDash');
})

//Add the sql queries here
adminRoute.post('/', upload.none(), (req,res) => {
    const {bankAccountNum, clientBoNum} = req.body;
    bank_sql = 'INSERT INTO lankabangla.bank (account) VALUES (?)';
    /*db.query(bank_sql,[bankAccountNum],(err,results) => {
        if (err) throw err;
        res.json({message: 'bank account added.'});
    });*/
    bo_sql = `INSERT INTO lankabangla.bo_account (bo_number) VALUES (?)`;
    db.query(bo_sql,[clientBoNum],(err,results) => {
        if(err){
            res.render('adminDash',{text: "Entry Failed"});
        } else {
            res.render('adminDash',{text:"Entry Success"});
        }
    });
});





module.exports = adminRoute;