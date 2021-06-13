
require 'rails_helper'

RSpec.describe AssembleVehicle do
    let!(:vehicle) { create(:designed_state_vehicle) }
    let (:vehicle_id) {vehicle.id}
    let(:sm) {
        s = VehicleStateMachine.new 
        s.aasm_state = "tested"
        s 
    }
    let(:vehicle_two) { create(:vehicle, vehicle_state_machine: sm)}
    let(:vehicle_two_id) {vehicle_two.id}
    
    subject(:context){ AssembleVehicle.call({id: vehicle_id}) }
    
    describe '.call' do 
        context "when vehicle is in designed state" do
            it "succeeds" do 
                expect(context).to be_a_success
            end
    
            it "provides the vehicle" do
                expect(context.vehicle).to be_an_instance_of Vehicle
            end
    
            it "provides the vehicle current state as assembled" do
                expect(context.vehicle.current_state).to eq "assembled"
            end
        end
        context "when vehicle not in designed state" do
            subject(:context){ AssembleVehicle.call({id: vehicle_two_id}) }
            it "fails" do
                expect(context).to be_a_failure
            end
        end
    end
end