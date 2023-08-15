// ---Boiler plate code---
// The express framework is brought in
const express = require('express');
//body parser package
var bodyParser = require('body-parser');
// The port number the app will listen on
const PORT = 5500
// 'app' is an instance of express()
const app = express();
//These settings must be given for json transfers
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}))
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


app.get('/',(req,res) => {
    res.render('index')
})

app.use('/dashboard',dashboard);
app.use('/form',BoForm);
app.use('/clientForm',clientForm);
app.use('/AboutUs',aboutUs);
app.use('/login',logIn);
app.use('/index',index)

//app using main route at localhost:5000/
app.listen(PORT,(req,res) => {
    console.log(`App listening on ${PORT}`);
})

