class VehiclesController < ApplicationController

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

    def update 
        result = ChangeVehicleState.call(vehicle_params)
        if result.success?
            json_response(result.vehicle, :ok)
        else 
            status = filter_http_status(result.message)
            json_response({error: result.message}, status)
        end   
    end

    private 

    def vehicle_params 
        params.permit(:current_state)
    end

end
