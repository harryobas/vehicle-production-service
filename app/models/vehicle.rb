class Vehicle < ApplicationRecord
    has_one :vehicle_state_machine, dependent: :destroy
    validates_presence_of :current_state, :states
end

    