const express= require("express");
const User=require("../models/user");
const auth=require("../middlewares/auth");
const bcryptjs=require('bcryptjs');
const jwt=require("jsonwebtoken");
const authRouter= express.Router();

//signup
authRouter.post("/user/signup",async (req,res)=>{
        try{
            const{firstname,lastname,mobileno,email,gender,address,image,filmcard,password} =req.body;

                const existinguser = await User.findOne({mobileno});
                if(existinguser){
                    return res.status(400).json({msg:"user with same mobile exist"});
                }
                const hashedpassword= await bcryptjs.hash(password,8);
                let user=new User({
                    firstname,
                    lastname,
                    mobileno,
                    email,
                    gender,
                    address,
                    image,
                    filmcard,
                    password: hashedpassword,
                });
                user =await user.save();
                res.json(user);
        }catch(e){
            res.status(500).json({error: e.message});
        }
});

//sign in
authRouter.post('/user/signin', async(req,res)=>{
    try{
        const{mobileno,password}=req.body;
        const user=await User.findOne({mobileno});
        if(!user){
            return res.status(400).json({msg: 'user with this mobileno not exist!'});
        }
        const isMatch = await bcryptjs.compare(password,user.password);
        if(!isMatch){
            return res.status(400).json({msg: 'Incorrect Password!'});
        }
        const token=jwt.sign({id: user._id},"passwordKey");
        res.json({token, ...user._doc});
    }catch(e){
        res.status(500).json({error: e.message});
    }
});

//token details
authRouter.post("/user/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);

    const user = await User.findById(verified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// get user data
authRouter.get("/user/profile", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});
module.exports=authRouter;