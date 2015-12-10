var express = require('express');
var config = require('./config')
var router = require('./router');
var logger = require('./logger');
//var bodyParser = require('cookie-parser');

var app = express();
var expressRouter = express.Router(); 

app.use(logger);
app.use('/', expressRouter);

// app.get('/', function(req, res){
//   res.send('hello world');
// });

router(expressRouter);
app.listen(config.port);

module.exports = app;
