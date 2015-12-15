var interested = require('../models/interested.js');

module.exports = {
  get : function (req, res) {
    var wandooID = req.query.wandooID ? req.query.wandooID : undefined;
    var userID = req.query.userID ? req.query.userID : undefined;

    if (wandooID && userID) {
      res.status('400').send('Must specify either wandooID or userID, but not both'); //what error should I send here?
      return; // do I need this return?
    } else if {
    // CONTINUE WITH THIS...
    }


  },

  post : function (req, res) {

  },

  put : function (req, res) {

  }

}
