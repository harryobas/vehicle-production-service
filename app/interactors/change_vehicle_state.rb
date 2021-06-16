class ChangeVehicleState 
    include Interactor

    def call 
        vehicle = Vehicle.find(context.id)
        state_machine = vehicle.vehicle_state_machine

        state_machine.aasm_state = context.state if state_machine.aasm.states
        .map{|s| s.name}
        .include?(context.state.to_sym) 

        vehicle.current_state = vehicle.vehicle_state_machine.aasm_state
        vehicle.states = state_machine.aasm.states.map{|s| s.name.to_s }

        context.vehicle = vehicle if vehicle.save
        
    rescue ActiveRecord::RecordNotFound => e 
        context.fail!(message: e.message)
    end
end