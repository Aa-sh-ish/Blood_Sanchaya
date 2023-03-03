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


bloodStatusRouter.post('/get', async (req, res) => {
  const bankName = req.body.bankName; // Assuming that the bank name is passed in the request body

  try {
    const bankDetails = await BloodStatus.findOne({ "bankName": bankName }); // Find the bank details based on the bank name
    if (bankDetails) {
      res.status(200).json(bankDetails); // Return the details as JSON
    } else {
      res.status(404).json({ error: 'Bank not found' }); // If the bank is not found, return a 404 error
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Server error' }); // If there is a server error, return a 500 error
  }
});

module.exports=bloodStatusRouter;
