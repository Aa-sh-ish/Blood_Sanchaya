const adminAutheRouter = require("express").Router();
const bcrypt = require("bcrypt");
const Admin = require("../Models/AdminModel");



adminAutheRouter.post("/",async(req,res,next)=>{
    try{
        const {BankName,adminPassword,district,municipality}= req.body;

        const existingAdmin = await Admin.findOne({BankName});
       

        if(existingAdmin){
            return res.status(400).json({
                message:"Account Already Exist"
            });
        };

        const hashedPassword = await bcrypt.hash(adminPassword,8);

        let admin = new Admin({
            BankName,
            adminPassword:hashedPassword,
            district,
            municipality
        });

        admin = await admin.save();
        res.json(admin); 
    }catch(e){
        res.status(500).json({error:e.message});
    }
});

module.exports= adminAutheRouter;