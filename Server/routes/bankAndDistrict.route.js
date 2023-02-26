const { mongo, default: mongoose } = require("mongoose");
const { db } = require("../Models/bankAndDistrict.Model");
const bankAndDistrict = require("../Models/bankAndDistrict.Model");

const Router = require("express").Router();


Router.post("/districts",async(req,res,next)=>{
    try{
        const payload = req.body;

        const newBackAndDistrct = new bankAndDistrict(payload);

        newBackAndDistrct.save().then((data)=>{
            res.status(200).json({data});
        });
    }catch(err){
        res.status(500).json({error:err.message});
    }
});


Router.get("/districts",async(req,res,next)=>{
    try{
        const bankdistricts = await bankAndDistrict.find();
        console.log(bankdistricts);
        res.status(200).json(bankdistricts);
    }catch(err){
       // res.status(500).json({error:err.message});
       console.log(err);
    }
    next();
});


// Router.get("/municipality",async(req,res,next)=>{
//     try{

//     }catch(e){

//     }
// })

// const district = new Districts();
// Router.get("/districts",district.getDistricts)


module.exports= Router;