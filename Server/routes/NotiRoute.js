const express = require("express");
const Notification = require("../Models/Noti.model");

const NotiRouter = express.Router();

NotiRouter.post("/help",async(req,res,next)=>{
    try{
        const payload = req.body;

        const newNotification = new Notification(payload);

        newNotification.save().then((data)=>{
            res.status(200).json({data});
        });

    }catch(e){
        res.status(500).json({error:e.error});
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

  NotiRouter.post("/delete", async (req, res) => {
    const { id } = req.body;
    try {
      const deletedNotification = await Notification.findByIdAndDelete(id);
      if (!deletedNotification) {
        return res.status(404).send({ error: "Notification not found" });
      }
      return res.status(200).send({ message: "Notification deleted successfully" });
    } catch (error) {
      return res.status(500).send({ error: "Internal server error" });
    }
  });
  

module.exports= NotiRouter;