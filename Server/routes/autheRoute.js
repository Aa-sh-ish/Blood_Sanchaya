const User = require("../Models/UserModel");
const autheRouter = require("express").Router();
const bcryptjs = require("bcrypt");

autheRouter.post("/",async(req,res,next)=>{
    try{
        const {email,name,password,phoneNumber,address,bloodGroup}=req.body;

        const existingUser = await User.findOne({email});
        if(existingUser){
            return res.status(400).json({
                message:"Account already exist "
            });
        };
        const hashedPassword = await bcryptjs.hash(password,8);

        let user = new User({
            email,
            name,
            password:hashedPassword,
            phoneNumber,
            address,
            bloodGroup
        });
        user = await user.save();
        res.json(user);
    }catch(e){
        res.status(500).json({error:e.message});
    };
});

module.exports=autheRouter;