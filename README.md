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

### `POST /auth/signup`: Signup
   - Request body:

  ```
  {
    "username": string,
    "email": string,
    "password": string,
    "password_confirmation": string,
    "role": string  
   }

  ```
  - Response

    - 201 Created
    ```
     { 
       "id": integer
       "username": string,
       "email": string,
       "role": string 
     }
    ```
    - 422 Uprocessable Entity
    ```
    {error: "validation faild"}
    ```

### `POST /vehicles`: Creates a new vehicle with initial state designed
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
### `GET /vehicles/{id}`: Get vehicle information by id
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

### `POST /vehicles/{id}/assemble`: Change a vehicle's current state to assembled
  - Header:
    - Authorization: bearer \<token\>
  - Response
    - 200 OK
    ```
    {
    
         "id": integer,
         "current_state": "assembled",
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
         "error": "Event assemble cannot transition from assembled or painted or tested" 
        
     }
     // assembled state can only be transitioned to from designed state. 
    ```

### `POST /vehicles/{id}/paint`: Change a vehicle's current state to painted 
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
         "error": "Event paint cannot transition from designed or painted or tested" 
        
     }
      // painted state can only be transitioned to from assembled state by default. 
     //This could however not be the case if the states order of vehicles changes.

    ```
### `POST /vehicles/{id}/test`: Change a vehicle's current state to tested
  - Header:
    - Authorization: bearer \<token\>
  - Response
    - 200 OK
    ```
    {
    
         "id": integer,
         "current_state": "tested",
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

      "error": "Event paint cannot transition from designed or painted or tested" 
        
     }
      // tested state can only be transitioned to from painted state by default. 
     //This could however not be the case if the states order of vehicles changes.

     ```
### `POST /states/create_state`: Creates a new state for vehicles 
  - Header:
    - Authorization: bearer \<token\>

  - Request body:

  ```
  {"state": string, "event": string, "from": string } 

  ```
  - Response
    - 204 No Content 

    - 500 Internal Server Error
    ```
    {
        "error": "Something went wrong"
    }
    ```
    - 401 Not Authorized // when user is not admin
    ```
    {
        "error": "not authorized"
    }
    ```

### `POST /states/delete_state`: Deletes a state 
  - Header:
    - Authorization: bearer \<token\>
   
  - Request body:

  ```
  {"state": string } 

  ```
  - Response
    - 204 No Content 

    - 500 Internal Server Error
    ```
    {
        "error": "Something went wrong"
    }
    ```
    - 401 Not Authorized // when user is not admin
    ```
    {
        "error": "not authorized"
    }
    ```

### `POST /states/order_states`: re-orders the states of vehicles
  - Header:
    - Authorization: bearer \<token\>
   
  - Request body:

  ```
  {"state": string } 

  ```
  - Response
    - 204 No Content 

    - 500 Internal Server Error
    ```
    {
        "error": "Something went wrong"
    }
    ```
    - 401 Not Authorized // when user is not admin
    ```
    {
        "error": "not authorized"
    }
    ```

### Addendum 

## Testing with httpie 

- Signup to create a user account

```
http POST localhost:3000/auth/signup \
username=danny
email=danny@mail.com
password=password
password_confirmation=password
role=admin 

```
- Signin to obtain a bearer token 

```
http POST localhost:3000/auth/signin \
 auth:='{"email": "danny@mail.com", "password": "password" }'

```
- Use bearer token for each request 

```
http POST localhost:3000/vehicles \
'Authorization: Bearer TOKEN'

```
 



    



 










