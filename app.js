// ---Boiler plate code---
// The express framework is brought in
const express = require('express');
//multer package to handle multipart form data
const multer = require('multer');
const upload = multer();

// The port number the app will listen on
const PORT = 5500
// 'app' is an instance of express()
const app = express();

const path = require('path');
//Setting the templating engine 
app.set('view engine','ejs');
//set the folder to use images from
app.use(express.static(path.join(__dirname,'public')));

//---------------------------------------
//Bring in the dashboard router 'DBroute.js'
const dashboard = require('./routes/clientDashRoute');
const BoForm = require('./routes/BoFormRoute');
const clientForm = require('./routes/clientFormRoute');
const aboutUs = require('./routes/aboutUsRoute');
const logIn = require('./routes/loginRoute');
const index = require('./routes/homeRoute');
const adminDash = require('./routes/adminRoute');


app.get('/',(req,res) => {
    res.render('index')
})


app.use('/dashboard',dashboard);
app.use('/boform',BoForm);
app.use('/clientForm',clientForm);
app.use('/AboutUs',aboutUs);
app.use('/login',logIn);
app.use('/index',index)
app.use('/adminDash',adminDash)

//100009823
//621230928429322
//app using main route at localhost:5000/
app.listen(PORT,(req,res) => {
    console.log(`App listening on ${PORT}`);
})

