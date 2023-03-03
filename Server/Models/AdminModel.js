const adminMongoose = require("mongoose");

const adminSchema = adminMongoose.Schema({
    district:{
        require:true,
        type:String,
    },
    municipality:{
        require:true,
        type:String,
    },
    BankName:{
        require:true,
        type:String,
        unique:true,
    },
    adminPassword:{
        require:true,
        type:String,
    },
});

const Admin  = adminMongoose.model("Admin",adminSchema);

module.exports= Admin;