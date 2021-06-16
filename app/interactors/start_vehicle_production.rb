
class StartVehicleProduction 
    include Interactor

    def call 
        vehicle = Vehicle.new
        state_machine = VehicleStateMachine.new 
        vehicle.vehicle_state_machine = state_machine

        vehicle.current_state = vehicle.vehicle_state_machine.aasm_state
        vehicle.states = vehicle.vehicle_state_machine.aasm.states.map do |s|
            s.name.to_s
        end
        context.vehicle = vehicle if vehicle.save

    end
end