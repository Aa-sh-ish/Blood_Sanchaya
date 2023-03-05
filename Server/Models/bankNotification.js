const bankModelMongoose = require("mongoose");

const banknotification = bankModelMongoose.Schema({
    bankName:{
        required:true,
        type:String,
    },
    name:{
        required:true,
        type:String,
    },
    Phone:{
        required:true,
        type:String,
    },
    amount:{
        required:true,
        type:String,
    },
    bloodgroup:{
        required:true,
        type:String,
    }
});




const Banknotification = bankModelMongoose.model("Bank_Notification",banknotification);
module.exports = Banknotification;