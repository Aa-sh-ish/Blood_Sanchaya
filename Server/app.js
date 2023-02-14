var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const mongoose = require("mongoose").mongoose;
const dotenv = require("dotenv");



var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var autheRouter = require("./routes/autheRoute");
var loginRouter = require("./routes/lognin");
var blood_G_Filter = require("./routes/blood_G_filter");
var adminAutheRouter= require("./routes/adminSignin");
var adminLoginRouter = require("./routes/adminLogin");
var bloodStatusRouter = require("./routes/bloosStatusRoute");



var app = express();
const db ="mongodb+srv://Blood_Sanchaya:Blood_Sanchaya@cluster0.lamnncx.mongodb.net/bood_sanchaya";



// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');


dotenv.config();
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use((req,res,next)=>{
  console.log("respond with middle ware");
  next();
});

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use("/signin",autheRouter);
app.use("/login",loginRouter);
app.use("/filter_blood",blood_G_Filter);
app.use("/adminSignin",adminAutheRouter);
app.use("/adminLogin",adminLoginRouter);
app.use("/bloodStatus",bloodStatusRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});


module.exports = app;


mongoose.connect("mongodb://0.0.0.0:27017/Blood_sanchaya").then(()=>{
  console.log(`connection succesful`);
}).catch((e)=>{
  console.log(e);   
});


app.listen(8848,"192.168.137.1",(err)=>{
  if(err){
    console.log("err:>>",err);
  }console.log("Server running in port 8848");
}); 