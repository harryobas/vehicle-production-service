class DeleteVehicleState 
    include Interactor

    def call 
        idx = VehicleStateMachine.aasm
        .states
        .map{|s| s.name.to_s}.index(context.state)

        VehicleStateMachine.aasm.states.delete_at(idx)
    end
end