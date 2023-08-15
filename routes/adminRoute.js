const express =  require('express');

const adminRoute = express.Router();

adminRoute.get('/',(req,res) => {
    res.render('adminDash');
})

//Add the sql queries here


module.exports = adminRoute;