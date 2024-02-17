const express= require("express");
const client=require("../middlewares/clientauth");
const User=require("../models/user");
const auth=require("../middlewares/auth");
const ClientRequirement=require("../models/clientrequirement");
const clientrequirementRouter= express.Router();

clientrequirementRouter.post("/clientrequirement",async (req,res)=>{
        try{
            const{clientname,clientdetail,clientemail,jobtitle,jobdesciption,startdate,enddate,tilldate,gender,quantity,payment,joblocation} =req.body;

                let clientrequirement=new ClientRequirement({
                    clientname,
                    clientdetail,
                    clientemail,
                    jobtitle,
                    jobdesciption,
                    startdate,
                    enddate,
                    tilldate,
                    gender,
                    quantity,
                    payment,
                    joblocation,
                });
                clientrequirement =await clientrequirement.save();
                res.json(clientrequirement);
        }catch(e){
            res.status(500).json({error: e.message});
        }
});

// Get all your requirement on userside
clientrequirementRouter.get("/user/getrequirement", auth, async (req, res) => {
  try {
    const clientRequirements = await ClientRequirement.find({});
    res.json(clientRequirements);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Get all your requirement on clientside
clientrequirementRouter.get("/client/getrequirement", client, async (req, res) => {
  try {
    const clientReq = await ClientRequirement.find({});
    res.json(clientReq);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Delete the requirement
clientrequirementRouter.post("/client/deleterequirement", client, async (req, res) => {
  try {
    const { id } = req.body;
    let clientrequirement = await ClientRequirement.findByIdAndDelete(id);
    res.json(clientrequirement);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports=clientrequirementRouter;