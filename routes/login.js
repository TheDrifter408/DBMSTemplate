const express = require('express');

const logIn = express.Router();

logIn.use('/',(req,res) => {
    res.render('Login');
})

module.exports = logIn;