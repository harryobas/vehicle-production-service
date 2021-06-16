class ChangeVehicleState 
    include Interactor

    def call 
        vehicle = Vehicle.find(context.id)
        vehicle.vehicle_state_machine.aasm_state = context.state 
        vehicle.current_state = vehicle.vehicle_state_machine.aasm_state

        context.vehicle = vehicle if vehicle.save
        
    rescue ActiveRecord::RecordNotFound => e 
        context.fail!(message: e.message)
    end
end