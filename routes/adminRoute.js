const express =  require('express');
const multer = require('multer');
const upload = multer();
const adminRoute = express.Router();

const db = require('../server/connection');

adminRoute.use('/',(req,res) => {
    res.render('adminDash');
})

const sqlQuery = 'SELECT * FROM lankabangla.client';
db.query(sqlQuery, (error, results) => {
    if (error) {
        console.error('Error querying the database:', error);
        return;
    }

    // Pass the results to the EJS template for rendering
    // Render the template and pass the data
    adminRoute.get('/', (req, res) => {
        res.render('adminDash', { results: results });
    });
});

//Add the sql queries here
adminRoute.post('/', upload.none(), (req,res) => {
    const {bankAccountNum, clientBoNum} = req.body;
    bank_sql = 'INSERT INTO lankabangla.bank (account) VALUES (?)';
    /*db.query(bank_sql,[bankAccountNum],(err,results) => {
        if (err) throw err;
        res.json({message: 'bank account added.'});
    });*/
    bo_sql = `INSERT INTO lankabangla.bo_account (bo_number) VALUES (?)`;
    /*db.query(bo_sql,[clientBoNum],(err,results) => {
        if(err){
            res.render('adminDash',{text: "Entry Failed" || ''});
        } else {
            res.render('adminDash',{text:"Entry Success" || ''});
        }
    });*/
});
adminRoute.put('/',upload.none(), (req,res) => {

})





module.exports = adminRoute;