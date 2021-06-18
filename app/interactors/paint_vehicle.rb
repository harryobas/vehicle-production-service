class PaintVehicle 
    include Interactor

    def call 
        vehicle = Vehicle.find(context.id)
        state_machine = vehicle.vehicle_state_machine

        if state_machine.paint 
            vehicle.current_state = state_machine.aasm_state
           
            vehicle.states = state_machine.aasm.states.map{|s| s.name.to_s}
            context.vehicle = vehicle if vehicle.save &&  state_machine.save
        end

    rescue ActiveRecord::RecordNotFound, AASM::InvalidTransition  => e
            context.fail!(message: e.message)
            
    end
end