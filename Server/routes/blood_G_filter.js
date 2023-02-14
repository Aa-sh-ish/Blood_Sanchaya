const { compare } = require("bcrypt");
const express  = require("express");
const User = require("../Models/UserModel");

const blood_G_Filter = express.Router();

blood_G_Filter.post("/",async(req,res,next)=>{
    try{
        const {bloodGroup} = req.body;

     const blood_G = await User.find({bloodGroup});

        if(!blood_G){
            return res.status(400).json({
                msg:"Blood Group doesn't exists"
            });
        }
        res.status(200).json({...blood_G});
        
    }catch(e){
        res.status(500).json({error:e.message});
    }
    next();
});


// blood_gropu.get("/",async(req,res,next)=>{
//     try{

//     }catch(e){

//     }
// })

module.exports = blood_G_Filter;

