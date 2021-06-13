class VehicleStateMachine < ApplicationRecord
    include AASM

    aasm do 
        state :designed, initial: true
        state :assembled
        state :painted
        state :tested

        event :assemble do
            transitions from: [:designed], to: :assembled
        end

        event :paint do 
            transitions from: [:assembled], to: :painted
        end

        event :test do
            transitions from: [:painted], to: :tested 
        end

    end

end

