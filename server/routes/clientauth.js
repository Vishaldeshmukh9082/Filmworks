const express= require("express");
const Client=require("../models/client");
const clientauth=require("../middlewares/clientauth");
const bcryptjs=require('bcryptjs');
const jwt=require("jsonwebtoken");
const clientRouter= express.Router();

//signup
clientRouter.post("/client/signup",async (req,res)=>{
        try{
            const{clientname,mobileno,email,gender,address,roledescription,image,filmcard,password} =req.body;

                const existinguser = await Client.findOne({email});
                if(existinguser){
                    return res.status(400).json({msg:"user with same email exist"});
                }
                const hashedpassword= await bcryptjs.hash(password,8);
                let client=new Client({
                    clientname,
                    mobileno,
                    email,
                    gender,
                    address,
                    roledescription,
                    image,
                    filmcard,
                    password: hashedpassword,
                });
                client =await client.save();
                res.json(client);
        }catch(e){
            res.status(500).json({error: e.message});
        }
});

//sign in
clientRouter.post('/client/signin', async(req,res)=>{
    try{
        const{email,password}=req.body;
        const client=await Client.findOne({email});
        if(!client){
            return res.status(400).json({msg: 'user with this email not exist!'});
        }
        const isMatch = await bcryptjs.compare(password,client.password);
        if(!isMatch){
            return res.status(400).json({msg: 'Incorrect Password!'});
        }
        const token=jwt.sign({id: client._id},"passwordKey");
        res.json({token, ...client._doc});
    }catch(e){
        res.status(500).json({error: e.message});
    }
});

//token details
clientRouter.post("/client/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);

    const client = await Client.findById(verified.id);
    if (!client) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// get user data
clientRouter.get("/client/profile", clientauth, async (req, res) => {
  const client = await Client.findById(req.client);
});


module.exports=clientRouter;