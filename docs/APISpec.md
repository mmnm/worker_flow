# Wandoo API Specification

##Users

### GET /api/users

#### Parameters

Name|Notes|Example
----|-----|-------
facebookID| | 10153381139067955


#### Example

```json
curl -i http://127.0.0.1:8000/api/user/?facebookID=10153381139067955
```

#### Usage
1. When user logs in, we need to get their userID and profile data
 
### GET /api/users/\<userID\>

#### Example

```json
curl -i http://127.0.0.1:8000/api/user/324624
```

#### Usage
1. When a user likes a wandoo, we need to display user info to host

### POST /api/users


#### Payload

Name | Notes | Example | 
-----|------------- | --------- |
name | Full name | John Smith |
facebookID | Uniquely identifies a user of Facebook | 10153381139067955 |
email | | john.smith@yahoo.com |
age | | 53 |
sex | | M |
profilePic | Image file | ? |
employer | | Google |
jobTitle | | Stanford |
latitude | | 37.7836675 |
longitude | | -122.4091699 |
friends | POST MVP | |
interests | POST MVP | |
likes | POST MVP |  |

#### Examples

```json

curl -i -X POST -H 'Content-Type: application/json' -d '{"name":"Pete Zurish","facebookID":134515,"email":"pete.z@gmail.com","age":28,"sex":"M","profilePic":"need a profile pic","employer":"Google","jobTitle":"Software Engineer","latitude":"37.7836675","longitude":"-122.4091699","educationInstitution":"University of Toronto"}' localhost:8000/api/users

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
1. When a user deletes his/her account from our system. a) delete user from user table b) delete host wandoos c) delete all wandoo interests by the user

### PUT /api/users:\<userID\>

#### Payload

Name | Notes | Example |
-----|------------- | --------- |
latitude | latitude of user's current position | 37.7836675 |
longitude | longitude of user's current position| -122.4091699 | 

#### Usage
1. For every user request from the client, we will send this PUT request to update the user location (ex. from web application, we can use navigator.geolocation.getCurrentPosition)

#### Example

```json
curl -i -X PUT -H "Content-Type: application/json" localhost:8000/api/users/21 -d '{"latitude":23.00,"longitude":45.234}'
```


## Wandoos

### GET /api/wandoos

#### Parameters

Name | Notes | Example
-----|-------|------------|
offset| The record number to start from. Must be used with limit. | 1 |
limit | Limits the number of return values | 25 |
userID | Returns all wandoos with this userID. Cannot be used with offset and limit.| 222 |
startTime | ISO:8601 String (use Date.prototype.toJSON()) POST MVP| 2015-12-12T01:30:00.040Z |
endTime | ISO:8601 String (use Date.prototype.toJSON()) POST MVP| 2015-12-12T02:30:00.040Z |
postTime | ISO:8601 String (use Date.prototype.toJSON()) POST MVP | 2015-12-12T01:00:00.040Z |
tag | POST MVP | dinner |

#### Examples

TO DO 

```json
curl -i http://127.0.0.1:8000/api/wandoos/4256245
curl -i localhost:8000/api/wandoos?offset=2\&limit=5
curl -i localhost:8000/api/wandoos?userID=1
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
startTime | ISO:8601 String (use Date.prototype.toJSON()) | 2015-12-12T01:30:00.040Z | 
endTime | ISO:8601 String (use Date.prototype.toJSON()) | 2015-12-12T02:00:00.040Z | 
postTime | ISO:8601 String (use Date.prototype.toJSON()) | 2015-12-12T01:00:00.040Z | 
tag | POST MVP | lunch | 
latitude | latitude of user's position | 37.7836675 |
longitude | longitude of user's position | -122.4091699 |
numPeople | | 4 |

#### Examples

```json
curl -i -X POST -H 'Content-Type: application/json' localhost:8000/api/wandoos -d '{"userID":63,"text":"I want to go out to lunch","startTime":"2015-12-12T01:30:00.040Z","endTime":"2015-12-12T02:30:00.040Z","postTime":"2015-12-12T01:00:00.040Z","latitude":37.7836675,"longitude":-122.4091699,"numPeople":4}'
```

### DELETE /api/wandoos/\<wandooID\>



#### Examples

#### Usage
1. When a user deletes a wandoo (delete room, tags, interests)
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

#### Examples

```json
curl -i -X POST -H 'Content-Type: application/json' localhost:8000/api/interested -d '{"wandooID":9,"userID":63}'
```

### PUT /api/interested/\<wandooID\>/\<userID\>

#### Payload
Name | Notes | Example
----|------|------
selected| 1 indicates that a host has selected a user, 0 indicates that host has not. Cannot be specified if **rejected** is specified.  | 1
rejected| 1 indicates that a host has selected a user, 0 indicates that host has not. Cannot be specified if **selected** is specified. | 0

#### Usage
1. When a host selects/rejects a user, send a PUT to change respective flag

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
userID| An array of userIDs | [235435, 53466]| 

#### Examples

```json
curl -i -X POST -H 'Content-Type: application/json' localhost:8000/api/rooms -d '{"wandooID":1,"userID":1}'
```

#### Usage
1. When a host has selected a guest for the hosts's wandoo, the room will be created with the host userIDs and the selected guest userIDs.

### PUT /api/rooms

#### Payload

Name| Notes | Example
----|-------|--------
userID| NEED TO VERIFY IF WE NEED THIS - should prob be an array | 2354| 

#### Examples

```json
curl -i -X POST -H 'Content-Type: application/json' localhost:8000/api/rooms -d '{"wandooID":1,"userID":1}'
```

### DELETE /api/rooms/\<roomID\>

#### Examples

```json
curl -i -X DELETE localhost:8000/api/rooms/3
```

#### Usage
1. Worker deletes rooms when they have been expired.

## Tags

### POST MVP

### GET /api/tags

#### Usage
1. Client must know the valid tags that a user can submit for a wandoo.










