module.exports = {
  isoDateToMySQL : function (date) {
    return date.substring(0,10) + ' ' + date.substring(11, 19);
  }
}
