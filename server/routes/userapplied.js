const express=require("express");
const Userapplied=require("../models/userapplied");
const clientauth=require("../middlewares/clientauth");
const userappliedRouter=express.Router();

//user applied for job
userappliedRouter.post("/userapplied",async (req,res)=>{
    try{
        const{jobid,firstname,lastname,mobileno,email,gender,address,image,filmcard} =req.body;

        let userapplied=Userapplied({
            jobid,
            firstname,
            lastname,
            mobileno,
            email,
            gender,
            address,
            image,
            filmcard
        });
        userapplied=await userapplied.save();
        res.json(userapplied);
    }catch(e){
        res.status(500).json({error: e.message});
    }

});

// Get all your applications
userappliedRouter.get("/client/getapplications", clientauth, async (req, res) => {
  try {
    const userapp = await userapplied.find({});
   // res.json({ ...client._doc, token: req.token });
    res.json(userapp);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports=userappliedRouter;