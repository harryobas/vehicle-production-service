
FactoryBot.define do
    factory :vehicle, aliases: [:designed_state_vehicle] do
        current_state { 'designed' }
        vehicle_state_machine { VehicleStateMachine.new }
        states { ["designed", "assembled", "painted", "tested"] }
    end
end