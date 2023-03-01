const bankAndDistrict = require("../Models/bankAndDistrict.Model");

const Router = require("express").Router();


Router.post("/districts",async(req,res,next)=>{
    try{
        const payload = req.body;

        const newBackAndDistrct = new bankAndDistrict(payload);

        newBackAndDistrct.save().then((data)=>{
            res.status(200).json({data});
        });
    }catch(err){
        res.status(500).json({error:err.message});
    }
});




Router.get("/districts",async(req,res,next)=>{
    try {
        bankAndDistrict.find({}, 'districtName', function(err, districts) {
          console.log('Districts:');
          const districtNames = districts.map(district => district.districtName);
         res.status(200).json(districtNames);
        }).lean();
      } catch (err) {
        res.status(500).json(e);
        console.error(err);
      }
});




Router.post("/municipality",async(req,res,next)=>{

    try {
        const {districtName} = req.body;
        bankAndDistrict.find({ districtName }, 'municipality', function(err, districts) {
          if (err) throw err;

          if(districts.length==0){
            res.status(400).json({msg:"not found"});
          }
          const municipalities = districts.map(district => district.municipality.map(m => m.municipalityName)).flat();
          res.status(200).json(municipalities);
       //   console.log(json);
        }).lean();
      } catch (err) {
        res.status(500).json(err);
        console.error(err);
      }
});


Router.post("/bloodbanksname",async(req,res,next)=>{
  const { districtName, municipalityName } = req.body;
  try  {
    const district = await bankAndDistrict.findOne({ districtName });
    const municipality = district.municipality.find(m => m.municipalityName === municipalityName);
    const bankNames = municipality.Bloodbank.map(b => b.bankName);

    return res.json(bankNames);
}
  catch(err){
    res.status(500).json(err);
        console.error(err);
  }
});


Router.post('/bloodbank', async (req, res) => {
  const { districtName, municipalityName, bankName } = req.body;

  try {
    const district = await bankAndDistrict.findOne({ districtName });
    console.log(district);
    const municipality = district.municipality.find(m => m.municipalityName === municipalityName);
    console.log(municipality);
    const bloodBank = municipality.Bloodbank.find(b => b.bankName === bankName);

    if (!bloodBank) {
      return res.status(404).json({ error: 'Blood bank not found' });
    }

    return res.json(bloodBank);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Server error' });
  }
});


module.exports= Router;