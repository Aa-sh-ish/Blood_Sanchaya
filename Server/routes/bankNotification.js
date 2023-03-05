const express = require("express");
const Banknotification = require("../Models/bankNotification");

const BankNoti = express.Router();

BankNoti.post("/notification",async(req,res,next)=>{
    try{
        const payload = req.body;

        const newNotification = new Banknotification(payload);

        newNotification.save().then((data)=>{
            res.status(200).json({data});
        });

    }catch(e){
        res.status(500).json({error:e.error});
    }
});




BankNoti.post('/get', async (req, res) => {
  const { bankName } = req.body;

  try {
    const notifications = await Banknotification.find({ bankName });
    res.json(notifications);
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server Error');
  }
});


BankNoti.post("/delete", async (req, res) => {
    const { id } = req.body;
    try {
      const deletedNotification = await Banknotification.findByIdAndDelete(id);
      if (!deletedNotification) {
        return res.status(404).send({ error: "Notification not found" });
      }
      return res.status(200).send({ message: "Notification deleted successfully" });
    } catch (error) {
      return res.status(500).send({ error: "Internal server error" });
    }
  });

module.exports = BankNoti;