//bring in the express framework
const express = require('express');

//Create an instance of express.Router -- it is use to simplify webpage links
const dbrouter = express.Router();

//Dummy name and some statistics
dummyData = {
    name: "Ateef",
}

//just like with the express instance in app.js
dbrouter.get('/',(req,res) => {
    res.render('dashboard',{name: dummyData.name});
})

//Always export all router functions
module.exports = dbrouter;