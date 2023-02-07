const express = require("express");
const bcryptjs = require("bcrypt");
const jwt = require("jsonwebtoken");
const User = require("../Models/UserModel");

const loginRouter = express.Router();

loginRouter.post("/",async(req,res,next)=>{
    try{
        const{email, password} =req.body;

        const user =await User.findOne({email});

        if(!user){
            return res.status(400).json({
                msg:"User Doesnot Exist Please Register first"
            });
        };

        const isMatch = await bcryptjs.compare(password,user.password);

        if(!isMatch){
            return res.status(400).json({msg:"Password Do not match"});
        };

        const token = jwt.sign({id:user.id},"passwordKey");
        res.json({token,...user._doc});
    }catch(e){
        res.status(500).json({error:e.message});
    }
    next();
});

module.exports=loginRouter;