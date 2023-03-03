const mongoose = require("mongoose");

const locationSchema = new mongoose.Schema({
    userId:{
        required:true,
        type:String,
    },
    userName:{
        required:true,
        type:String
    },
    phone:{
        required:true,
        type:String
    },
    bloodGrouo:{
        required:true,
        type:String
    },
    lattitude:{
        required:true,
        type:String
    },
    longitude:{
        type:String,
        rewuired:true
    },
    updatedate:{
        type:String,
        required:true,
    }
});

const Location = mongoose.model("Locations",locationSchema);
module.exports = Location;