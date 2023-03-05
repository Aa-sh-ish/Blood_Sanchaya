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
        type:String,
        default:"A+"
    },
    lattitude:{
        required:true,
        type:Number
    },
    longitude:{
        type:Number,
        required:true
    },
    updatedate:{
        type:String,
        default:"2022-02-02"
    }
});

const Location = mongoose.model("Locations",locationSchema);
module.exports = Location;