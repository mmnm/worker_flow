var fs = require('fs');
var db = require('./db') // for the connection
var mysql = require('mysql'); // for my test

module.exports = {
  isoDateToMySQL : function (date) {
    return date.substring(0,10) + ' ' + date.substring(11, 19);
  },

  writeImage : function (path, image) {
    fs.writeFile(__dirname + '/public' + path, new Buffer(image, 'base64'), function (err) {
      if (err) {
        throw err;
      } 
      console.log('Image successfully saved to the server');
    });
  } 

}
