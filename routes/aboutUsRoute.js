const express = require('express');

const aboutUs = express.Router();

aboutUs.get('/',(req,res) => {
    res.render('AboutUs');
})

module.exports = aboutUs;