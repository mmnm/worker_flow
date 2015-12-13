var express = require('express');
var config = require('./config')
var router = require('./router');
var logger = require('./logger');
var bodyParser = require('body-parser');

var app = express();
var expressRouter = express.Router(); 

app.use(logger);
// app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use('/', expressRouter);

router(expressRouter);
app.listen(config.port);

module.exports = app;
