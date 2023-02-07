const bloodStatusRouter = require("express").Router();
const BloodStatus = require("../Models/bloodStatusModel");

bloodStatusRouter.post("/add",async(req,res,next)=>{
    try{
        const payload = req.body;
        const bloodStatus  =new BloodStatus(payload);

       await bloodStatus.save().then((data)=>{
            res.json({
                data
            });
        });
    }catch(e){
        res.json({e});
    }
});

module.exports=bloodStatusRouter;
