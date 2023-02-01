const { compare } = require("bcrypt");
const express  = require("express");
const User = require("../Models/UserModel");

const blood_G_Filter = express.Router();

blood_G_Filter.post("/",async(req,res,next)=>{
    try{
        const {bloodGroup} = req.body;
        // console.log('Blood Group received',bloodGroup)

     const blood_G = await User.find({bloodGroup});
    //  console.log('users: ', blood_G)

    // const isMatch =await compare(bloodGroup,blood_G.bloodGroup);
     //   const blood_Gru  =User.filter(blood_G => blood_G.b === "Bob");

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

module.exports = blood_G_Filter;


