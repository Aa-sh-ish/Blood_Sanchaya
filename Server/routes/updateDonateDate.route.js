const Updatedate = require("../Models/donateDate.Model");

const DonateDateRouter = require("express").Router();

DonateDateRouter.post("/post",async(req,res,next)=>{
    try{
        const payload = req.body;
        const newDonateDate = new Updatedate(payload);
        newDonateDate.save().then((data)=>{
            res.status(200).json({data});
        });
    }catch(e){
        res.status(500).json({error:e.error});
    }
});



DonateDateRouter.post('/get', async (req, res) => {
  const userId = req.body.userId;
  try {
    const updateDate = await Updatedate.findOne({ userId });
    if (!updateDate) {
      return res.status(404).json({ message: 'User not found' });
    }
    const { donateDate, nextDonateDate } = updateDate;
    res.json({ donateDate, nextDonateDate });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
});


DonateDateRouter.post('/update', async (req, res) => {
  const { userId, donateDate, nextDonateDate } = req.body;

  try {
    const updatedDoc = await Updatedate.findOneAndUpdate(
      { userId: userId },
      { donateDate: donateDate,
         nextDonateDate: nextDonateDate 
        },
      { new: true }
    );

    if (updatedDoc) {
      res.json({
        message: `Successfully updated donateDate and nextDonateDate for user ${userId}.`,
        updatedDocument: updatedDoc,
      });
    } else {
      res.status(404).json({ message: `No document found for userId ${userId}.` });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});


module.exports = DonateDateRouter;