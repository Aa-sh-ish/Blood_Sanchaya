const bloodMongoose = require("mongoose");

const NotiSchema = bloodMongoose.Schema({
    disrict:{
        required:true,
        type:String,
    },
    municipality:{
        required:true,
        type:String,
    },
    bloodGroup:{
        required:true,
        type:String,
    },
    bloodPint:{
        required:true,
        type:String
    },
    phoneNumber:{
        required:true,
        type:Number,
    },
});

const Notification = bloodMongoose.model("Notification",NotiSchema);

module.exports = Notification;