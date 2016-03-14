# Twitter clone rails 4 application

## Features

This application provides some simple features such as:

* User registration and sign in
* Post new messages up to 160 characters
* Follow/Unfollow other users
* See timeline from followed users
* API access to messages, followers and followed users from one user

## Used gems
### For users
* Devise

### For database
* sqlite 3
* foreigner

### For template
* haml

### For CSS Styling
* bootstrap-sass
* devise-bootstrap-views

### For pagination
* Kaminari

### For testing and debugging
* faker
* byebug
* web_console
* spring

### For API serialization
* active_model_serializers

See more details on [Gemfile](https://github.com/zaraheath/twitter-clone-app/blob/master/Gemfile).

## Getting started

Clone the repository:

    $ git clone https://github.com/zaraheath/twitter-clone-app.git

Run bundle install to instal missing gems:
    
    $ cd twitter-clone-app/
    $ bundle install
    
Run rake db:migrate to create the database schema and rake db:seed if you want to populate development database with fake users, messages and relationships:
    
    $ rake db:migrate
    $ rake db:seed

Run rails server:

    $ spring rails s

## API usage

Available requests and JSON responses:
### GET /api/v1/users/ID/messages
Retrieves all message from the given user ID.

    curl http://localhost:3000/api/v1/users/ID/messages

Response (text and date):

```json
{
    "messages": [{
        "text": "message 1",
        "date": "2016-03-14 04:13:29"
    }, {
        "text": "message 2",
        "date": "2016-03-09 20:02:21"
    }, {
        "text": "message 3",
        "date": "2016-03-13 07:55:59"
    }]
}
```
### GET /api/v1/users/ID/followers
Retrieves all followers from the given user ID. 

    curl http://localhost:3000/api/v1/users/ID/followers

Response (id and username):
```json
{
    "users": [{
        "id": 43,
        "username": "duncan_metz"
    }, {
        "id": 5,
        "username": "cassidy_mcclure"
    }]
}
```

### GET /api/v1/users/ID/following
Retrieves all followed users from the given user ID. 

    curl http://localhost:3000/api/v1/users/ID/following

Response (id and username):
```json
{
    "users": [{
        "id": 18,
        "username": "esta_franecki"
    }, {
        "id": 28,
        "username": "mrs_elsie_reichel"
    }]
}
```

### API error response

Response (status 404):

```json
{"error":"not_found"}
```
