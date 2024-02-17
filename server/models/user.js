const mongoose=require("mongoose");

const userSchema=mongoose.Schema({
    firstname:{
        required: true,
        type: String,
        trim:true,
    },
    lastname:{
        required:true,
        type: String,
        trim:true,
    },
    mobileno:{
        required:true,
        type:String,
        trim:true,
    },
    email:{
        required:true,
        type: String,
        trim:true,
    },
    gender:{
        required:true,
        type: String,
    },
    address:{
        required:true,
        type: String,
        trim: true,
    },
    image:{
        type: String,
    },
    filmcard:{
        type: String,
    },
    password:{
        required:true,
        type: String,
        trim: true,
    }
});

const User=mongoose.model('User',userSchema);
module.exports=User;

