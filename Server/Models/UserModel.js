const bloodMongoose = require("mongoose");
var passwordValidator = require('password-validator');
const validator = require("validator");

const userSchema = bloodMongoose.Schema({
    email:{
        required:true,
        type:String,
        validate:{
            validator :(value)=>{
                const re =
                /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message:"Please Enter a valid Email Address",
        },
    },
    password:{
        required:true,
        type:String,
        passwordValidator(value){
            min(8,"Password must contain 8 characters"),
            digits(1,"Must contain atleast 1 digits"),
            symbols(1,"Must contain atleast 1 special characters"),
            max(15,"Password lenght must not exceed 15 characters")
        }
    },
    phoneNumber:{
        required:true,
        type:Number,
    },
    address:[
        {
            lang:{
                type:String,
                required:true
            },
            lat:{
                type:String,
                required:true
            }
        }
    ],
    bloodGroup:{
        required:true,
        type:String,
    },
});

const User = bloodMongoose.model("User",userSchema);

module.exports = User;