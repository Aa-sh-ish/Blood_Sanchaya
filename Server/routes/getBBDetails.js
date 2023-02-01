var express = require('express');

const getbbRouter = express.Router();

getbbRouter.get("/",async(req,res)=>{
    blood_bank_and_district.find().then((result)=>{
        res.send(result);
    }).catch((e)=>{
        console.log(err);
    });
});

module.exports=getbbRouter;
