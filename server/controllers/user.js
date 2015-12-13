var user = require('../models/user.js');

module.exports = {
  get : function (req, res) {
    user.get(function (err, result) {
      if ( err ) {
        console.error(err);
        res.send('There was an error');
      } else {
        res.json(result); 
      }
    });
  }
}
