//Using the express package
const express = require('express');
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


module.exports = logIn;