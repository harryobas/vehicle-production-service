class UsersController < ApplicationController

    def create 
       result = CreateUser.call(user_params)
       if result.success?
        json_response(result.user, :created)
       else 
        status = filter_http_status(result.message)
        json_response({error: result.message}, status)
       end 

    end

    private 

    def user_params
        params.permit(:username, :email, :password, :password_confirmation, :role)
       end
end
