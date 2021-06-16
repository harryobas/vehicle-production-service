class ApplicationController < ActionController::API
    include Response
    include HttpStatusFilter
end
