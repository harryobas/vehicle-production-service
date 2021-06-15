class ChangeVehicleStatesOrder 
    include Interactor 

    def call 
        VehicleStateMachine.aasm do 
            event :test do 
                transitions from: [:assembled], to: :tested
            end

            event :paint do 
                transitions from: [:tested], to: :painted 
            end
        end

    end
end