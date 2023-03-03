const express = require("express");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const Admin = require("../Models/AdminModel");

const adminLoginRouter = express.Router();

adminLoginRouter.post("/", async(req,res,next)=>{
    try{
        const {BankName,adminPassword}= req.body;

        const admin = await Admin.findOne({BankName});
        

        if(!admin){
            return res.status(400).json({
                message:"Bank Doesnot Exist Please Contact Blood_Sanchaya",
                
            });
        };

        const adminPassMatch = await bcrypt.compare(adminPassword,admin.adminPassword);

        if(!adminPassMatch){
            return res.status(400).json({message:"Invalid Password"});
        };

        const token = jwt.sign({id:admin.id},"adminPassKey");
        res.json({token,...admin._doc});

    }catch(e){
        res.status(500).json({
            error:e.message
        });
    }
    next();
});


module.exports=adminLoginRouter;