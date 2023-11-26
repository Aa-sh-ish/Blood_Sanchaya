const Location = require("../Models/location");
const LocationRoute = require("express").Router();

LocationRoute.post("/Post", async (req, res) => {
  try {
    const newLocation = new Location({
      userId: req.body.userId,
      userName: req.body.userName,
      phone: req.body.phone,
      bloodGrouo: req.body.bloodGrouo,
      lattitude: req.body.lattitude,
      longitude: req.body.longitude,
      updatedate:req.body.updatedate
    });
    const savedLocation = await newLocation.save();

    res.status(200).json({
      message: "Location added successfully",
      location: savedLocation,
    });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

LocationRoute.post('/getUsers', async (req, res) => {
  try {
    // Get the bloodgroup, donatedate, latitude, and longitude parameters from the request body
    const { bloodGrouo, updatedate, lattitude, longitude } = req.body;


    const minLat = parseFloat(lattitude) - 0.2;
    const maxLat = parseFloat(lattitude) + 0.2;
    const minLong = parseFloat(longitude) - 0.2;
    const maxLong = parseFloat(longitude) + 0.2;

console.log(minLat,typeof(minLat));

    const threeMonthsAgo = new Date(updatedate);
    threeMonthsAgo.setMonth(threeMonthsAgo.getMonth() - 3);

    console.log(threeMonthsAgo);

    const users = await Location.find({
      bloodGrouo: bloodGrouo,
   //  updatedate: { $gte: threeMonthsAgo.toString() },
      lattitude: { $gte: minLat, $lte: maxLat },
      longitude: { $gte: minLong, $lte: maxLong }
    });

    console.log(bloodGrouo);
    res.json(users);
  } catch (err) {
    console.error(err);
    res.status(500).send('Server Error');
  }
});




LocationRoute.post("/update", async (req, res) => {
  try {
    const { userId, userName, phone, bloodGroup, lattitude, longitude, updatedate } = req.body;

    const updatedLocation = await Location.findOneAndUpdate(
      { userId },
      { userName, phone, bloodGroup, lattitude, longitude, updatedate },
      { new: true }
    );

    if (!updatedLocation) {
      return res.status(404).send({ message: "Location not found" });
    }

    res.send(updatedLocation);
  } catch (error) {
    console.error(error);
    res.status(500).send({ message: "Internal server error" });
  }
});
LocationRoute.post("/oneuserid",async(req,res,next)=>{
  const userId =req.body;
try{
  data = await Location.findOne(userId);
  if(!data){
    res.status(200).json(1234);
  }else{
    res.status(400).json(567);
  }
}catch(e){
  res.status(500).json({error:e.error});
}
}),

module.exports= LocationRoute;