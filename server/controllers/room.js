var room = require('../models/room');
var util = require('../util');

var roomExpiry = 1;// number of days after end time when room will be expired

var postQueryCB = function (err, result, res) {
  if (err) {
    console.error(err);
    res.status('400').send('There was an error with insertion');
  } else {
    res.send();
  }  
}

var getQueryCB = function (err, result, res) {
  if (err) {
    console.error(err);
    res.status('400').send('There was an error with selection');
  } else {
    res.json({data : result});
  }
}

var getQueryCB = function (err, result, res) {
    if (err) {
      console.error(err);
      res.status('400').send('There was an error with selection');
    } else {
      res.json({data : result});
    }
}

module.exports = {
  get : function (req, res) {
    
  },

  post : function (req, res) {
    var expiryTime = new Date();
    expiryTime.setDate(expiryTime.getDate() + 1);
    console.log('expiryTIme',expiryTime);
    util.isoDateToMySQL(expiryTime.toJSON());
    
    room.create([expiryTime, req.body.wandooID], [req.body.userID], function(err, result) {
      postQueryCB(err, result, res)
    });

  },

  delete : function (req, res) {

  }
}
