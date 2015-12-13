var db = require('../db');
var _ = require('underscore');

module.exports = {
  get : function (userID, callback) {
    var qs = "select user.*, institution_name from user \
      inner join user_educational_institution where user.userID = ?;";
    db.query(qs, userID, function (err, results) {
      if ( err ) {
        callback(err);
      } else {
        callback(null, { results: results });// should we wrap the results like this?
      }
    });
  },

  post : function (userData, eduData, callback) {
    var qs1 = "INSERT INTO `user` (`userID`,`name`,`facebookID`,`email`,\
      `age`,`sex`,`profile_picture`,`employer`,`job_title`,`latitude`,`longitude`) \
      VALUES (0,?,?,?,?,?,?,?,?,?,?);";

    var qs2 = "INSERT INTO `user_educational_institution` \
      (`userID`,`institution_name`) VALUES (?,?);";

    db.query(qs1, userData, function(err, results1) {
      if ( err ) {
        callback(err);
      } else {
        eduData.unshift(results1.insertId);
        db.query(qs2, eduData, function(err,results2) {
          if ( err ) {
            callback(err);
          } else {
            callback(null, results1, results2);
          }
        });
      }  
    });

  }

}
