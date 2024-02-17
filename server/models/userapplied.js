const mongoose = require("mongoose");

const userappliedSchema = mongoose.Schema({
  jobid:{
    required: true,
    type: String,
    trim: true,
  },
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
});

const UserApplied = mongoose.model("UserApplied", userappliedSchema);
module.exports = UserApplied;
