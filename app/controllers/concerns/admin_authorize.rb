module AdminAuthorize 
    def authorize_as_admin 
        unless !current_user.nil?  && current_user.is_admin?
            json_response({error: "not authorized"}, :unauthorized)
        end   
    end
end