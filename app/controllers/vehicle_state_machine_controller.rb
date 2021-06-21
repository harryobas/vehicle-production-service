class VehicleStateMachineController < ApplicationController
    before_action :authenticate_user, :authorize_as_admin

    def create_state 
        state = params[:state]
        event = params[:event]
        from = params[:from]
        result = CreateVehicleState.call(state: state, event: event, from: from)
        if result.success?
            head :no_content
        else 
            json_response({error: "Something went wrong"}, :internal_server_error)
        end
    end

    def order_states 
        result = ChangeVehicleStatesOrder.call 
        if result.success?
            head :no_content
        else
            json_response({error: "Something went wrong"}, :internal_server_error)
        end
    end

    def delete_state 
        result = DeleteVehicleState.call(state: params[:state])
        if result.success?
            head :no_content
        else 
            json_response({error: "Something went wrong"}, :internal_server_error)
        end
    
    end

end
