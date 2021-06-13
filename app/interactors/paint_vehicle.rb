class PaintVehicle 
    include Interactor

    def call 
        vehicle = Vehicle.find(context.id)
        if vehicle.vehicle_state_machine.paint
        vehicle.current_state = vehicle.vehicle_state_machine.aasm_state
        context.vehicle = vehicle if vehicle.save
        end  
        rescue ActiveRecord::RecordNotFound, AASM::InvalidTransition  => e
            context.fail!(message: e.message)
    end
end