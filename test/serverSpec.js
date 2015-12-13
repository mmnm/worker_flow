var request = require('supertest');

var server = request.agent('http://localhost:8000');

describe('GET /api/test', function(){
  it('Sanity check', function(done){
    server
      .get('/api/test')
      // .set('Accept', 'application/json')
      // .expect('Content-Type', /json/)
      .expect(200, done);
  });
});

// users

describe('POST /api/users', function() {
  it('should add a user to the database', function() {
    server
      .post('/api/users')
      .send({
        facebookID : 'fasdgadfgadfg',
        name: 'Pete Zurish',
        age: 28,
        sex: 'M',
        profilePic: 'need a profile pic',
        employer: 'Google',
        jobTitle: 'Software Engineer',
        email: 'pete.z@gmail.com',
        educationInstitution: 'University of Toronto',
        latitude: '37.7836675',
        longitude: '-122.4091699'
      })
      .expect(200)
      .end(done);
  });

});

describe('GET /api/users', function() {
  it('should return all users', function () {

  });

  it('should return all required data for a user', function () {

  });

  it('should return a specific user specified by userID? or facebookID?', function () {

  });

  it('should use limit to limit the number of returned results', function () {

  });

  it('should use offset to specify the record number to start returns for', function () {

  });
});


describe('DELETE /api/users', function() {
  it('should delete a specified user from the database', function() {

  });

});

// wandoos

describe('GET /api/wandoos', function() {
  it('should return all wandoos', function() {

  });

  it('should use limit to limit the number of returned wandoos', function () {

  });

  it('should use offset to specify the record number to start returns for', function () {

  });
});

describe('POST /api/wandoos', function() {
  it('should add a wandoo to the database', function() {

  });
});

describe('DELETE /api/wandoos', function() {
  it('should delete a specified wandoo from the database', function() {

  });
});

// rooms

describe('GET /api/rooms', function() {
  it('should return all rooms', function() {

  });
});

describe('POST /api/rooms', function() {
  it('should add a room to the database', function() {

  });
});

describe('DELETE /api/rooms', function() {
  it('should delete a room from the database', function() {

  });
});
