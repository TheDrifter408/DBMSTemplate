//Using the express package
const express = require('express');
const multer = require('multer');
const upload = multer();
//Declaring the express.Router()
const logIn = express.Router();
//importing the routes needed from the login page to admin or client dashboard
const adminDashboard = require('./adminRoute');
const clientDashboard = require('./clientDashRoute');
//Dummuy data for now
let admin = {
    email: 'admin@iub.edu.bd',
    pass: 'admin1234'
}

let client = {
    email: 'client@iub.edu.bd',
    pass: 'client1234'
}
//To render the login page
logIn.get('/',(req,res) => {
    res.render('Login');
    
})
//Getting the form data
logIn.post('/',upload.none(),(req,res) => {
    const {userEmail , userPassword} = req.body;
    if(userEmail === client.email){
        if(userPassword === client.pass){
            res.redirect('/clientDash');
        }
        return;
    } 
    else if(userEmail === admin.email){
        if(userPassword === admin.pass) {
            res.redirect(200,'/adminDash');
        }
        return;
    }
    res.render('Login',{message: 'Please Check your credentials' || ''} );
})

module.exports = logIn;