var mysql = require('mysql');
var config = require('./config');

db = mysql.createConnection({
  user: 'root',
  password: '',
  database: 'wandoo'
});

db.connect(function(err) {
  if (err) {
    console.error('Database Connection Error: ' + err.stack);
    return;
  }

  console.log('Database successfully connected');
});


module.exports = db;
