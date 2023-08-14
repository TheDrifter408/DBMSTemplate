const express =  require('express');

const adminRoute = express.Router();

adminRoute.get('/',(req,res) => {
    res.render('adminDash');
})

module.exports = adminRoute;