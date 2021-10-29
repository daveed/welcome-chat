# Welcome Chat

____

## Overview

A Rails 6 chat app using websockets

____

## Getting Started

```shell
  ./bin/docker-build
  ./bin/docker-up
```

____

## Testing

connections, channels, broadcasts

```shell
  ./bin/test
```

____

## Containerization

The entire project runs on Docker.  
Dependencies are Postresql and Redis for pub/sub.  
The versions used are Rails 6.1.4, Ruby 3.0.2, Postgres 11.2 and Redis 5.0.4  
____

## Mechanism

A user creates an account and/or logs in  
A user creates or joins a room  
The client subscribes to the room channel  
A user submits a message  
The message is posted to the RoomMessages Controller  
The message is persisted in Postgres  
The message is streamed to the channel  
All users in the room can see the message  

____

## Enhancements

Use ActiveJob for broadcasting messages  
Link to custom domain name  
Continuous integration  
Use JWT token for authentication instead of using session / cookies  
Better front-end using Vue or React  
Private conversations  
Notifications using @username  
Limit history of messages displayed  
