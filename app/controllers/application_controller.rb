class ApplicationController < ActionController::API
    include Knock::Authenticable
    include Response
    include HttpStatusFilter
    include AdminAuthorize
end
