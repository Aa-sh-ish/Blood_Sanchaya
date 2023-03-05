const bloodMongoose = require("mongoose");



const bloodStatusSchema = bloodMongoose.Schema({

    "bankName" :{
        require:true,
        type:String
    },
    "A+":{
        require:true,
        type:Number,
        default:0
        },
    "A-":{
        require:true,
        type:Number,
        default:0
        },
    "B+":{
        require:true,
        type:Number,
        default:0
        },
    "B-":{
        require:true,
        type:Number,
        default:0
        },
    "AB+":{
        require:true,
        type:Number,
        default:0
        },
    "AB-":{
        require:true,
        type:Number,
        default:0
        },
    "O+":{
        require:true,
        type:Number,
        default:0
        },
    "O-":{
        require:true,
        type:Number,
        default:0
        },
        
},{
    timestamps:true,  
  });

const BloodStatus = bloodMongoose.model("BloodStatus",bloodStatusSchema);
module.exports= BloodStatus;


