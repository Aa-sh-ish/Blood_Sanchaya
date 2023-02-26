// updateProductById(req, res, next) {
//     Product.findByIdAndUpdate(req.params.id, payload, { new: true })
//       .then((data) => {
//         res.json({
//           msg: "Product updated successfully",
//           data: data,
//         });
//       })
//       .catch((err) => {
//         next("Something went wrong while updating");
//       });
//   }

const Location = require("../Models/location");
const LocationRoute = require("express").Router();

LocationRoute.post("/Location",async(req,res,next)=>{
 try {  
    const {userId,lattitude,longitude} = req.body;
    let newlocation =  Location({
      userId,
      lattitude,
      longitude
    });
   newlocation = await newlocation.save();
    res.status(200).json({newlocation});
}catch(err){
    res.status(500).json({error:err.message});
}
next();
});


LocationRoute.get("/Location",async(req,res,next)=>{
  try{
    const userLocation =await Location.find();
    console.log(userLocation);
    res.status(200).json(userLocation);
    }catch(e){

    }
})


module.exports= LocationRoute;