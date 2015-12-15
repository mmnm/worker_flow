var wandoo = require('../models/wandoo.js');

module.exports = {
  get : function (req, res) {
    wandoo.get(function (err, result) {
      if (err) {
        console.error(err);
        res.status('400').send('There was an error with selection');
      } else {
        res.send(result);
      }
    });
  },

  post : function (req, res) {
    var wandooAttr = {
      userID : 0,
      text : 1,
      startTime : 2,
      endTime : 3,
      postTime : 4,
      latitude : 5, 
      longitude : 6,
      numPeople : 7
    };

    var wandooValues = [];
    
    for ( var i in req.body ) {
      console.log(i);
      if ( i in wandooAttr ) {
  
        if (/.*?Time/.exec(i)) {
          wandooValues[wandooAttr[i]] = req.body[i].substring(0,10) + ' ' + req.body[i].substring(11, 19);
        } else {
          wandooValues[wandooAttr[i]] = req.body[i];
        }

      } else {
        res.status('400').send('Wrong parameters');
        return;
      }
    }

    wandoo.post(wandooValues, function (err, result) {
      if (err) {
        console.error(err);
        res.status('400').send('There was an error with insertion');
      } else {
        res.send();
      }
    });
    
  },

  delete : function (req,res) {
    console.log("entered controller");
    wandoo.delete(req.params.wandooID, function (err, result) {
      if ( err ) {
        console.error(err);
        res.status('400').send('Error with deletion');
      } else {
        res.send();
      }
    });

  }
}
