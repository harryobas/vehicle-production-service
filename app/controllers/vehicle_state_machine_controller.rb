class VehicleStateMachineController < ApplicationController

    def create_state 
        state = params[:state]
        event = params[:event]
        from = params[:from]
        CreateVehicleState.call(state: state, event: event, from: from)
        head :no_content
    end

    def order_states 
        ChangeVehicleStatesOrder.call 
        head :no_content
    end

end
