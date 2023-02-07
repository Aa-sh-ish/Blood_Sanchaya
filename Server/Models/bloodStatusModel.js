const bloodMongoose = require("mongoose");
const bloodTpyeMongoose = require("mongoose");

const bloodTpyeSchema = bloodTpyeMongoose.Schema({
    status:{
        require:true,
        type:Number,
        default:0
    },
    Plasma:{
        require:true,
        type:Number,
        default:1
    },
    platelets:{
        require:true,
        type:Number,
        default:0
    }
});

const bloodStatusSchema = bloodMongoose.Schema({
    "A+":bloodTpyeSchema,
    "A-":bloodTpyeSchema,
    "B+":bloodTpyeSchema,
    "B-":bloodTpyeSchema,
    "AB+":bloodTpyeSchema,
    "AB-":bloodTpyeSchema,
    "O+":bloodTpyeSchema,
    "O-":bloodTpyeSchema,
});

const BloodStatus = bloodMongoose.model("BloodStatus",bloodStatusSchema);
module.exports= BloodStatus;