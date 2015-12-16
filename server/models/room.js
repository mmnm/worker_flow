var db = require('../db');
var queryBuilder = function (qs, data, callback) {
  db.query(qs, data, function (err, result) {
    if (err) {
      callback(err);
    } else {
      callback(null, result);
    }
  });
}

module.exports = {
  get : function () {

  },

  create : function (roomData, roomUserData, callback) {

    var qs1 = "INSERT INTO `room` (`roomID`,`expiry_time`,`wandooID`) VALUES\
      (0,?,?);";

    var qs2 = "INSERT INTO `room_user` (`roomID`,`userID`) VALUES\
      (?,?);"

    

    db.query(qs1, roomData, function (err, result1) {
      if (err) {
        callback(err);
      } else {
        roomUserData.unshift(result1.insertId);
        db.query(qs2, roomUserData, function (err, result2) {
          if (err) {
            callback(err);
          } else {
            callback(null, result1, result2);
          }
        })
      }
    })



  },

  delete : function (req, res) {

  }
}


