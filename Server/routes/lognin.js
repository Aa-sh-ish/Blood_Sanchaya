const express = require("express");
const bcryptjs = require("bcrypt");
const jwt = require("jsonwebtoken");
const User = require("../Models/UserModel");
const auth = require("../middleware/auth");

const loginRouter = express.Router();

loginRouter.post("/",async(req,res,next)=>{
    try{
        const{email, password} =req.body;

        const user =await User.findOne({email});

        if(!user){
            return res.status(400).json({
                message:"User Doesnot Exist Please Register first"
            });
        };

        const isMatch = await bcryptjs.compare(password,user.password);

        if(!isMatch){
            return res.status(400).json({message:"Password Do not match"});
        };
        
        const token = jwt.sign({id:user.id},"passwordKey");
        res.json({token,...user._doc});
    }catch(e){
        res.status(500).json({error:e.message});
    }
    next();
});

loginRouter.post("/tokenIsValid", async (req, res) => {
    try {
      const token = req.header("x-auth-token");
      if (!token) return res.json(false);
      const verified = jwt.verify(token, "passwordKey");
      if (!verified) return res.json(false);
      const user = await User.findById(verified.id);
      if (!user) return res.json(false);
      res.json(true);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  loginRouter.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
  });

module.exports=loginRouter;