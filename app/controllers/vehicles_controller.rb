class VehiclesController < ApplicationController
    #before_action :authenticate_user
    #before_action :authorize_as_admin, :only [:create, 
    #:update, :create_state, :order_states, :index, :show, :delete]
 
    def index 
        vehicles = Vehicle.all 
        json_response(vehicles)
    end

    def show 
        result = GetVehicle.call(id: params[:id])
        if result.success?
            json_response(result.vehicle) 
        else
            status = filter_http_status(result.nessage)
            json_response({error: result.message}, status)
        end   
    end

    def create 
        result = StartVehicleProduction.call 
        json_response(result.vehicle, :created) if result.success? 
    end

    def assemble 
        result = AssembleVehicle.call(id: params[:id]) 
        if result.success?
            json_response(result.vehicle)
        else 
            status = filter_http_status(result.message)
            json_response({error: result.message}, status)
        end 
    end

    def paint 
        result = PaintVehicle.call(id: params[:id])
        if result.success?
            json_response(result.vehicle)
        else 
            status = filter_http_status(result.message)
            json_response({error: result.message}, status)
        end   
    end

    def test 
        result = TestVehicle.call(id: params[:id]) 
        if result.success?
            json_response(result.vehicle)
        else 
            status = filter_http_status(result.message)
            json_response({error: result.message}, status)
        end 
    end

end
