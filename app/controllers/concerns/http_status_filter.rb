module HttpStatusFilter 
    def filter_http_status(message)
        message = message.split(" ")
        return :unprocessable_entity if message.include?("Event")
        :not_found 
    end 
end