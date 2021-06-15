require 'rails_helper'

RSpec.describe TestVehicle do
    let!(:vehicle) { create(:designed_state_vehicle) }
    let (:vehicle_id) {vehicle.id}

    let(:sm) {
        s = VehicleStateMachine.new 
        s.aasm_state = "painted"
        s 
    }

    let(:vehicle_test) { create(:vehicle, vehicle_state_machine: sm)}
    let(:vehicle_test_id) {vehicle_test.id}

    subject(:context){ TestVehicle.call({id: vehicle_test_id}) }

    describe ".call" do 
        context "when vehicle is in painted state and tested is ordered after painted" do
            before(:each) do 
                VehicleStateMachine.aasm do 
                    event :test do 
                        transitions from: [:painted], to: :tested
                    end
                end
            end 
            it "succeeds" do
                expect(context).to be_a_success
            end

            it "provides the vehicle" do
                expect(context.vehicle).to be_an_instance_of Vehicle
            end

            it "provides the vehicle's current state as tested" do 
                expect(context.vehicle.current_state).to eq "tested"
            end
        end
        context "when vehicle is not in tested state" do 
            subject(:context){ TestVehicle.call({id: vehicle_id}) }

            it "fails" do
                expect(context).to be_a_failure
            end

        end
    end

end