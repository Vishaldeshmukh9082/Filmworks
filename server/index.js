// import from packages
const express = require("express");
const mongoose=require("mongoose");
const logger = require("morgan");

const DB="mongodb+srv://vishal:wkPq2VM4WnSeMhnA@cluster0.gbsbhl0.mongodb.net/filmworks?retryWrites=true&w=majority";

//imports from other files
const authRouter=require("./routes/auth");
const clientRouter=require("./routes/clientauth");
const clientrequirementRouter=require("./routes/clientrequirement");
const userappliedRouter=require("./routes/userapplied");


//initialization
const PORT=3000;
const app=express();

//middleware
app.use(express.json());
app.use(logger("dev"));
app.use(authRouter);
app.use(clientRouter);
app.use(clientrequirementRouter);
app.use(userappliedRouter);



//connection
mongoose.connect(DB).then(()=>{
console.log("mongoConnected");
}).catch(e=>{
    console.log(e);
});


app.listen(PORT,"0.0.0.0",()=>{
    console.log('connected at port '+PORT);
}
);