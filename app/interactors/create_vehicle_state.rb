class CreateVehicleState 
    include Interactor

    def call 
        new_state = context.state.to_sym

        VehicleStateMachine.aasm do 
            state new_state
        end
    
    end
end