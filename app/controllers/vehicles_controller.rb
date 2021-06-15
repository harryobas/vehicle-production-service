class VehiclesController < ApplicationController

    def create 
        result = StartVehicleProduction.call 
        if result.success?
            json_response(result.vehicle, :created)
        else
            json_response({error: result.message}, :unprocessable_entity) 
        end
    end

    def assemble 
        result = AssembleVehicle.call(id: params[:id])
        if result.success? 
            json_response(result.vehicle)
        else 
            json_response({error: result.message}, :unprocessable_entity)
        end
    end

    def paint 
        result = PaintVehicle.call(id: params[:id])
        if result.success?
            json_response(result.vehicle)
        else 
            json_response({error: result.message}, :unprocessable_entity)
        end
    end

end
