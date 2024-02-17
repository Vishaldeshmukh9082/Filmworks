const mongoose = require("mongoose");


const clientSchema = mongoose.Schema({
  clientname: {
    required: true,
    type: String,
    trim: true,
  },
  mobileno: {
    required: true,
    type: String,
    trim: true,
  },
  email: {
      required: true,
      type: String,
      trim: true,

    },
    gender: {
          required: true,
          type: String,
          trim: true,
        },
  address: {
    required: true,
    type: String,
    trim: true,
  },
  roledescription: {
    required: true,
    type: String,
    trim: true,
  },
  image: {
    type: String,
  },
  filmcard: {
      type: String,
    },

  password: {
    required: true,
    type: String,
    trim: true,
  },
});

const Client = mongoose.model("Client", clientSchema);
module.exports = Client;
