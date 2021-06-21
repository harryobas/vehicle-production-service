# vehicle-production-service

An API-only app that provides endpoints for both regular users and admin users to change and manage the states of vehicles under production. Furthermore, endpoint for  jwt authentication and authourization is also provided. More specifically, the app provides the following:

1. Endpoints to enable regular users to change the state of a vehicle. A vehicle state can be in either of Designed(initial state), Assembled, Painted or Tested.

2. Endpoints to enable admin users to configure and change the order of the states of vehicles. 

## Requirements 

1. Ruby 2.6.6 
2. Rails 5.2.6
3. postgresql 

## How to run 

### Docker 

This app is dockerized to enable both ease of installation and execution on either Linux, mac or windows. To install/run on Linux, make sure to have both docker and docker-compose installed on your machine and follow the instructions below:

1. $ git clone https://github.com/harryobas/vehicle-production-service.git
2. $ cd webhooks-receiver
3. $ sudo docker-compose build
4. $ sudo docker-compose up -d


## API Endpoints 

### Address: `localhost:3000`

### `POST /auth/signin`: Signin
  - Request body:

  ```
  { "auth": {"username": string, "email": string } }

  ```
  - Response

    - 201 Created
    ```
     { "jwt": string // bearer token }
    ```
    - 404 Not Found

### `POST /vehicles : Creates a new vehicle with initial state designed
  - Header:
    - Authorization: bearer \<token\>
  - Response
    - 201 Created
    ```
     {
         "id": integer, 
         "current_state": "designed", 
         "states": [] // list of strings
    }
    ```

### `GET /vehicles`: Get all vehicle information
  - Header:
    - Authorization: bearer \<token\>
  - Response
    - 200 OK
    ```
    [

        {
            "id": integer,
            "current_state": string,
            "states": [] // list of strings
        }
    ]

    ```
### `GET /vehicles/{id}': Get vehicle information by id
  - Header:
    - Authorization: bearer \<token\>
  - Response
    - 200 OK
    ```
    {
    
         "id": integer,
         "current_state": string,
         "states": [] // list of strings
    }
    ```
    - 404 Not Found
    ```
    {
       "error": "Couldn't find Vehicle with 'id'={id}",
       
    }
    ```

    ### `GET /vehicles/{id}/paint': Change a vehicle's current state to painted 
  - Header:
    - Authorization: bearer \<token\>
  - Response
    - 200 OK
    ```
    {
    
         "id": integer,
         "current_state": "painted",
         "states": [] // list of strings
    }
    ```
    - 404 Not Found
    ```
    {
       "error": "Couldn't find Vehicle with 'id'={id}"
       
    }
    ```
    - 422 Unprocessable Entity
    ```
     { 
         "error": "Event paint cannot transition from {designed, painted, tested}" 
         // painted state can only be transitioned to from assembled state by default. 
         //This could however not be the case if the states order of vehicles changes.

     }

    ```
    



 










