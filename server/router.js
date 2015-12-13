var user = require('./controllers/user');

module.exports = function (router) {
  router.get('/api/test', function (req, res) {
    console.log('Request received.');
    res.send();
  });

  router.get('/api/users/:userID', user.get);

  router.post('/api/users', user.post);

}
