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

var putQueryCB = function (err, result, res) {
  if (err) {
    console.error(err);
    res.status('400').send('There was an error with update');
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

var deleteQueryCB = function (err, result, res) {
  if (err) {
    console.error(err);
    res.status('400').send('There was an error in deletion');
  } else {
    res.send();
  }
}

module.exports = {
  get : function (req, res) {
    room.getAll(function (err, result) {
      getQueryCB(err, result, res);
    })
  },

  post : function (req, res) {
    var expiryTime = new Date();
    expiryTime.setDate(expiryTime.getDate() + 1);
    util.isoDateToMySQL(expiryTime.toJSON());
    
    room.create([expiryTime, req.body.wandooID], req.body.userID, function(err, result) {
      postQueryCB(err, result, res);
    });

  },

  delete : function (req, res) {
    room.delete(req.params.roomID, function (err, result) {
      deleteQueryCB(err, result, res);
    });
  },

  put : function (req, res) {
    room.addRoomUsers([room.params.roomID, room.body.userID], function(err, result) {
      putQueryCB(err, result, res);
    });
    
  } 
}
