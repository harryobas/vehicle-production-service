class CreateVehicleState 
    include Interactor

    def call
        new_state = context.state.to_sym
        evt = context.event.to_sym
        from = context.from.to_sym

        VehicleStateMachine.aasm do 
            state new_state

            event evt do 
                transitions from: [from], to: new_state
            end
        end
    
    end
end