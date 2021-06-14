RSpec.describe UpdateVehicleState do
    let!(:vehicle) { create(:designed_state_vehicle) }
    let (:vehicle_id) {vehicle.id} 
    let (:new_state) {"assembled"}

    subject(:context){ UpdateVehicleState.call({id: vehicle_id, state: new_state}) }

    describe '.call' do 
        it "succeeds" do
            expect(context).to be_a_success
        end

        it "provides the vehicle" do
            expect(context.vehicle).to be_an_instance_of Vehicle 
        end

        it "provides the vehicle current state as assembled" do
            expect(context.vehicle.current_state).to eq new_state
        end
    end
end