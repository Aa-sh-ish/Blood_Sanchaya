const mongoose=require ("mongoose");

const updatedateSchema=mongoose.Schema({
    userId:{
        required:true,
        type:String,
        unique:true
    },
    donateDate:{
        required:true,
        type:String,
        default:Date.now
    },
    nextDonateDate:{
        required : true,
        type :String,
        default:Date.now
    }
});
const Updatedate=mongoose.model("UpdateDate",updatedateSchema);
module.exports=Updatedate;