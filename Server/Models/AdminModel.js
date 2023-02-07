const adminMongoose = require("mongoose");

const adminSchema = adminMongoose.Schema({
    BankName:{
        require:true,
        type:String,
    },
    adminPassword:{
        require:true,
        type:String,
    },
    bankId:{
        requre:true,
        type:Number,
        unique:true
    }
});

const Admin  = adminMongoose.model("Admin",adminSchema);

module.exports= Admin;