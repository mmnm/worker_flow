var db = require('../db');

module.exports = {
  get : function (callback) {
    var qs1 = 'select * from wandoo';

    db.query(qs1, function (err, results) {
      if ( err ) {
        callback(err);
      } else {
        callback(err, results);
      }
    });
  
  },

  post : function (wandooData, callback) {
    var qs1 = 'INSERT INTO `wandoo` (`wandooID`,`userID`,`text`,`start_time`,\
    `end_time`,`post_time`,`latitude`,`longitude`,`num_people`) VALUES \
    (0,?,?,?,?,?,?,?,?);';
    
    db.query(qs1, wandooData, function (err, results) {
      if (err) {
       callback(err);
      } else {
       callback(err, results);
      }
    });
  },

  delete : function (wandooID, callback) {
    var qs1 = 'delete from wandoo_interest where wandooID = ?;' 
    var qs2 = 'delete from wandoo_tag where wandooID = ?;'
    var qs3 = 'delete from wandoo where wandooID = ?;'
  db.query(qs1, wandooID, function (err, results1) {
      if (err) {
        callback(err);
      } else {
        db.query(qs1, wandooID, function (err, results2) {
          if (err) {
            callback(err);
          } else {
            db.query(qs3, wandooID, function (err, results3) {
              if (err) {
                callback(err);
              } else {
                callback(null, results1, results2, results3);
              }
            });
          }
        });
      }
    });
  }
}
