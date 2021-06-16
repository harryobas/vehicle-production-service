class ChangeVehicleStatesOrder 
    include Interactor 

    def call 

        begin 
            s = VehicleStateMachine.painted 
            unless s.empty? 
                s.all?{|s| s.test == true}
            end
            rescue AASM::InvalidTransition
                VehicleStateMachine.aasm do 
                    event :paint do
                        transitions from: [:assembled], to: :painted 
                    end
                    event :test do 
                        transitions from: [:painted], to: :tested
                    end 
                end
            else
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
    end
                    
