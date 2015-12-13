# Wandoo API Specification

##Users
 
### GET /api/users:\<userID\>

#### Example

```json
curl -i http://127.0.0.1:8000/api/user/324624
```

#### Usage
1. When user logs in, we need to display user info within their profile. 
2. When a user likes a wandoo, we need to display user info to host

### POST /api/users


#### Payload

Name | Notes | Example | 
-----|------------- | --------- |
facebookID | Uniquely identifies a user on Facebook| 10153381139067956 | 
name | Full name | John Smith |  
age | | 28 | 
sex | | M| 
profilePic | Image file | ? | 
employer | | Google | 
jobTitle |  | Software Engineer | 
educationInstitution | | Stanford |
friends | POST MVP | |
interests | POST MVP | |
likes | POST MVP |  |



#### Examples

TODO

```json

curl -i http://127.0.0.1:8000/api/articles -H "Content-Type: application/json" -d '[{"title":"TensorFlow and Monetizing Intellectual Property","linkURL":"test","summary":"test","source":"bleh","imgURL":"gah","date":"1995-12-17T11:24:00.000Z","categories":["Startups","bleh","Money","JavaS"]},{"title":"Another Article","linkURL":"test","summary":"test","source":"bleh","imgURL":"gah","date":"1995-12-17T11:24:00.000Z","categories":["Startups","bleh","x"]}]';

```
#### Usage
1. Every new user that is created will have its user data sent to the server to store in the database.

### DELETE /api/users:\<userID\>

#### Example

TODO

```json
curl -i http://127.0.0.1:8000/api/user
```

#### Usage
1. When a user deletes his/her account from our system.

### PUT /api/users:\<userID\>

#### Payload

Name | Notes | Example |
-----|------------- | --------- |
latitude | latitude of user's current position | 37.7836675 |
longitude | longitude of user's current position| -122.4091699 | 

#### Usage
1. For every user request from the client, we will send this PUT request to update the user location (ex. from web application, we can use navigator.geolocation.getCurrentPosition)




## Wandoos

### GET /api/wandoos

#### Parameters

Name | Notes | Example
-----|-------|------------|
offset| The record number to start from | 1 |
limit | Limits the number of return values | 25 |
userID | | 222 |
startTime | ISO:8601 String (use Date.prototype.toJSON()) POST MVP| 2015-12-12T01:31:00.040Z |
endTime | ISO:8601 String (use Date.prototype.toJSON()) POST MVP| 2015-12-12T01:31:00.040Z |
postTime | ISO:8601 String (use Date.prototype.toJSON()) POST MVP | 2015-12-12T01:31:00.040Z |
tag | POST MVP | dinner |

#### Examples

TODO

```json
curl -i http://127.0.0.1:8000/api/wandoos/4256245
```

#### Usage
1. Retrieve all wandoos of a host by specifying host's userID
2. Retrieving all wandoos near user's location

### POST /api/wandoos

#### Payload

Name | Notes | Example | 
-----|------------- | --------- |
userID | | 222 | 
text | Full text of the wandoo (max of x characters)? | Going out to lunch |  
startTime | ISO:8601 String (use Date.prototype.toJSON()) | 2015-12-12T01:31:00.040Z | 
endTime | ISO:8601 String (use Date.prototype.toJSON()) | 2015-12-12T01:31:00.040Z | 
postTime | ISO:8601 String (use Date.prototype.toJSON()) | 2015-12-12T01:31:00.040Z | 
tag | | dinner | 
latitude | latitude of user's position | 37.7836675 |
longitude | longitude of user's position | -122.4091699 |

### DELETE /api/wandoos/\<wandooID\>



#### Examples

#### Usage
1. When a user deletes a wandoo
2. When a wandoo expires and the worker deletes it

## Interested 

### GET /api/interested

#### Parameters

Name | Notes | Example
-----|-------|---------
wandooID| Cannot be specified if userID is specified| 22323|
userID| Cannot be specified if wandooID is specified| 235245|

#### Examples

#### Usage
1. On the bulletin board, all wandoos which a user has already expressed interest in will be disabled
2. A user will be able to view all of their wandoos

### POST /api/interested

#### Payload

Name | Notes | Example
-----|-------|--------
wandooID| | 234325
userID| | 245425

### PUT /api/interested/\<wandooID\>/\<userID\>

#### Payload
Name | Notes | Example
----|------|------
selected| Bool that indicates that a host has selected a user | true
rejected| Bool that indicates that a host has rejected a user | true

## Rooms

### GET /api/rooms/\<roomID\>

#### Parameters

Name | Notes | Example
-----|-------|---------
userID| Cannot be specified if wandooID is specified| 22323|
wandooID| Cannot be specified if userID is specified| 235245|
expired| Boolean specifying if room is expired | true |

### POST /api/rooms

#### Payload

Name| Notes | Example
----|-------|--------
wandooID| | 352436|
userID| | 235435| 

### DELETE /api/rooms/\<roomID\>












