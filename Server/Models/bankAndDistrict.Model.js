const mongoose = require("mongoose");


const bankSchema = new mongoose.Schema({
    bankName:{
        type:String,
        required:true
    },
    email:{
        type:String,
        default:"Not Available",
    },
    ph_number:{
        type:String
    },
    location:{
        type:String,
        default:"Nepal"
    }
});


const munilSchema = new mongoose.Schema({
    municipalityName:{
        require:true,
        type :String,
    },
    Bloodbank:[bankSchema],
});



const bankAndDistrictSchema = new mongoose.Schema({
    districtName:{
        require: true,
        type:String
    },
    municipality:[munilSchema]
});



const bankAndDistrict = mongoose.model("District_And_Bank",bankAndDistrictSchema);
module.exports = bankAndDistrict;