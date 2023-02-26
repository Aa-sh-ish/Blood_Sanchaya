const mongoose = require("mongoose");

const locationSchema = new mongoose.Schema({
    userId:{
        type:mongoose.Types.ObjectId,
        ref:"users",
        require:true,
        // unique:true
    },
    lattitude:{
        required:true,
        type:String
    },
    longitude:{
        type:String,
        rewuired:true
    }
});

const Location = mongoose.model("Locations",locationSchema);
module.exports = Location;