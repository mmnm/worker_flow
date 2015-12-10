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
  }
}
