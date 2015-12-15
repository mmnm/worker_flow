var user = require('./controllers/user');
var wandoo = require('./controllers/wandoo');
var interested = require('./controllers/interested');

module.exports = function (router) {
  router.get('/api/test', function (req, res) {
    console.log('Request received.');
    res.send();
  });

  router.get('/api/users/:userID', user.get);

  router.post('/api/users', user.post);

  router.delete('/api/users/:userID', user.delete);

  router.put('/api/users/:userID', user.put);

  router.get('/api/wandoos', wandoo.get);

  router.post('/api/wandoos', wandoo.post);

  router.delete('/api/wandoos/:wandooID', wandoo.delete);

  // router.get('/api/interested', )

}
