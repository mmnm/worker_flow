var mysql = require('mysql');
var config = require('./config');

module.exports = mysql.createConnection({
  user: 'root',
  password: 'ramen',
  database: 'wandoo'
});
