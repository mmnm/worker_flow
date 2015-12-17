var _ = require('underscore');
var wandoo = require('./models/wandoo.js');
var interested = require('./models/interested.js');





 // get : function (req, res) {
 //    if (req.query.offset && req.query.limit && !req.query.userID) {
 //      wandoo.getPartialRes([+req.query.offset, +req.query.limit], function (err, result) {
 //        getQueryCB(err, result, res); // need to wrap this function so that I can pass res to my callback
 //      });
 //    } else if (!req.query.offset && !req.query.limit && req.query.userID) {
 //      wandoo.getByUserID(+req.query.userID, function (err, result) {
 //        getQueryCB(err, result, res);
 //      });
 //    } else if (!Object.keys(req.query).length) {
 //      wandoo.getAll(function (err, result) {
 //        getQueryCB(err, result, res);
 //      });
 //    } else {
 //      res.status('400').send('Wrong parameters');
 //    } // can account for other edge cases later if necessary
 //  }



// var deleteUsers = function (callback, done) {
//   var qs1 = "delete from user_educational_institution";
//   var qs2 = "delete from user";

//   db.query(qs1, function (err, results1) {
//     if ( err ) {
//       callback(err);
//     } else {
//       db.query(qs2, function (err, results2) {
//         if ( err ) {
//           callback(err);
//         } else {
//           callback(null, done);
//         }
//       });
//     }
//   });
// };

// var queryBuilder = function (qs, data, callback) {
//   db.query(qs, data, function (err, result) {
//     if (err) {
//       callback(err);
//     } else {
//       callback(null, result);
//     }
//   });
// }


 // getAll : function (callback) {
 //    var qs = "select * from wandoo";
 //    queryBuilder(qs, [], callback);  
 //  },

// var getQueryCB = function (err, result, res) {
//     if (err) {
//       console.error(err);
//       res.status('400').send('There was an error with selection');
//     } else {
//       res.json({data : result});
//     }
// }


var processWandooData = function(data) {

	console.log("Hey there", data);
	//What we need to do with this data?
	//Filter for all expired entries and collect those wandoo ids
	//for each expired entries , 
		//Delete /interested/ table entries with the id = expired_wandoo_id
		//Delete /wandoo/expired_wandoo_id

}

var getQueryCBAndProcess = function (err, result, callback) {

    if(err) {
    	console.log("DB entries not retrieved");
    } else {
    	callback(result);
    }

  }

  module.exports = {

  	job: function() {

  	console.log("Test this every minute");
    wandoo.getAll(function (err, result) {
    	getQueryCBAndProcess(err, result, processWandooData);
    });

  }

};