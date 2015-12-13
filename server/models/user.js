var db = require('../db');

module.exports = {
  get : function (callback) {
    var qs = "select * " + 
      "from user;";
    db.query(qs, [], function (err, results) {
      if ( err ) {
        callback(err);
      } else {
        callback(null, { results: results });
      }
    });
  },

  post : function (userData, callback) {
    var qs = 'INSERT INTO `user` (`userID`,`facebookID`,`age`,`sex`,`name`,`profile_picture`,`employer`,`job_title`,`email`,`latitude`,`longitude`) VALUES (?,?,?,?,?,?,?,?,?,?,?);';

    db.query(qs, userData, function(err, results) {
      if (err) {
        callback(err);
      } else {
        callback(null, results);
      }  
    });

  }
}
