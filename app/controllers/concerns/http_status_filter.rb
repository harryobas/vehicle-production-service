module HttpStatusFilter 
    def filter_http_status(message)
        message = message.split(" ").first 
        return :not_found if message.include?("Couldn't")
        :unprocessable_entity
    end 
end