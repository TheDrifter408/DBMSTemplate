//bring in the express framework
const express = require('express');

//Create an instance of express.Router -- it is use to simplify webpage links
const formRouter = express.Router();

//Dummy name and some statistics
dummyData = {
    name: "Ateef",
}

//just like with the express instance in app.js
formRouter.get('/',(req,res) => {
    res.render('BOForm');
})

//Always export all router functions
module.exports = formRouter;