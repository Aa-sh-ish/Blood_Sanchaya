const express = require("express");
const Notification = require("../Models/Noti.model");

const NotiRouter = express.Router();

NotiRouter.post("/help",async(req,res,next)=>{
    try{
        const payload = req.body;

        const newNotification = new Notification(payload);

        newNotification.save().then((data)=>{
            res.status(200).json({data});
        })

    }catch(e){
        res.status(500).json({error:e.message});
    }
});


NotiRouter.get("/", async (req, res) => {
    try{
        const getNotification = await Notification.find();
        res.status(200).json(getNotification);
    }catch(e){
        res.status(500).json({error:e.message});
    }
  });




module.exports= NotiRouter;