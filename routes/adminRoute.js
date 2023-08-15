const express =  require('express');
const multer = require('multer');
const upload = multer();
const adminRoute = express.Router();

const db = require('../server/connection');

adminRoute.get('/',(req,res) => {
    console.log("Its getting it now.");
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
//bank account_number : 100009173
//bo_account_number : 620232349173665
//

//Add the sql queries here
adminRoute.post('/', upload.none(), (req,res) => {
    const {bankAccountNum, clientBoNum} = req.body;
    bank_sql = 'INSERT INTO lankabangla.bank (account) VALUES (?)';
    db.query(bank_sql,[bankAccountNum],(err,results) => {
        if (err) throw err;
        console.log(bankAccountNum)
    });
    /*bo_sql = `INSERT INTO lankabangla.bo_account (bo_number) VALUES (?)`;
    db.query(bo_sql,[clientBoNum],(err,results) => {
        if(err)throw err;
        console.log(clientBoNum);
    });*/
});




module.exports = adminRoute;