class CreateVehicleState 
    include Interactor

    def call 
        vehicle = Vehicle.find(context.id)
        state_machine = vehicle.vehicle_state_machine.class
        new_state = context.state.to_sym

        state_machine.aasm do 
            state new_state
        end
        vehicle.states = vehicle.vehicle_state_machine.aasm.states.map do |s|
            s.name.to_s 
        end
        context.vehicle = vehicle if vehicle.save
    rescue ActiveRecord::RecordNotFound => e
        context.fail!(message: e.message)
    
    end
end