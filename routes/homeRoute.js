const express = require('express');

const homeRoute = express.Router();

homeRoute.use('/',(req,res) => {
    res.render('index');
})

module.exports = homeRoute;