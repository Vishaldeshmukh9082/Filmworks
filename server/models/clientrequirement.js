const mongoose = require("mongoose");

const clientrequirementSchema = mongoose.Schema({

  clientname:{
    required: true,
    type:String,
    trim: true
  },
  clientdetail:{
      required: true,
      type:String,
      trim: true
    },
    clientemail: {
    required: true,
    type: String,
    trim: true,
    },
  jobtitle: {
    required: true,
    type: String,
    trim: true,
  },
  jobdesciption: {
    required: true,
    type: String,
    trim: true,
  },
  startdate: {
    required: true,
    type: String,
    trim: true,
  },
  enddate: {
    required: true,
    type: String,
    trim: true,
  },
  tilldate: {
      required: true,
      type: String,
      trim: true,
    },
  gender: {
    required: true,
    type: String,
    trim: true,
  },
  quantity: {
    required: true,
    type: String,
    trim: true,
  },
  payment: {
    required: true,
    type: String,
    trim: true,
  },
  joblocation: {
    required: true,
    type: String,
    trim: true,
  },

 
});

const ClientRequirement = mongoose.model("ClientRequirement", clientrequirementSchema);
module.exports = ClientRequirement;
