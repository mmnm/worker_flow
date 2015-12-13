var user = require('../models/user.js');
var _ = require('underscore');

module.exports = {
  get : function (req, res) {
    user.get(req.params.userID, function (err, result) {
      if ( err ) {
        console.error(err);
        res.status('400').send('There was an error');
      } else {
        res.json(result); 
      }
    });
  },
  post: function (req, res) {
    var userAttr = {
      name : 0,
      facebookID : 1,
      email : 2,
      age : 3,
      sex : 4,
      profilePic : 5,
      employer : 6,
      jobTitle : 7,
      latitude : 8,
      longitude : 9
    };

    var eduAttr = {
      educationInstitution : 0
    };

    var userValues = [],
      eduValues = [];

    for ( var i in req.body ) {
      if ( i in userAttr ) {
        userValues[userAttr[i]] = req.body[i];
      } else if ( i in eduAttr ) {
        eduValues[eduAttr[i]] = req.body[i];
      }
    }

    user.post(userValues, eduValues, function (err, result) {
      if ( err ) {
        console.error(err);
        res.status('400').send('There was an error with insertion');
      } else {
        res.send();
      }
    });
  }
}
