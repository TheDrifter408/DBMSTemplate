// ---Boiler plate code---
// The express framework is brought in
const express = require('express');
// The port number the app will listen on
const PORT = 5500
// 'app' is an instance of express()
const app = express();
//These settings must be given for json transfers
app.use(express.json());
app.use(express.urlencoded({extended: true}))

//Setting the templating engine 
app.set('view engine','ejs');
//set the folder to use CSS from 
app.use(express.static(__dirname + 'public'));

//---------------------------------------
//Bring in the dashboard router 'DBroute.js'
const dbrouter = require('./routes/DBRoute');
const form = require('./routes/FormRoute');
const clientForm = require('./routes/clientRoute');


app.use('/dashboard',dbrouter);
app.use('/form',form);
app.use('/clientForm',clientForm);


//app using main route at localhost:5000/
app.get('/',(req,res) => {
    res.render('index')
})


app.listen(PORT,(req,res) => {
    console.log(`App listening on ${PORT}`);
})

