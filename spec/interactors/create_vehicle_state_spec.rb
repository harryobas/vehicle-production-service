
require 'rails_helper'

RSpec.describe CreateVehicleState do 
    let!(:vehicle) { create(:designed_state_vehicle) }
    let (:vehicle_id) {vehicle.id}

    let (:new_state) {"complete"}
    let (:v_states) { ["designed", "assembled", "painted", "tested", "complete"] }


    subject(:context){ CreateVehicleState.call({id: vehicle_id, state: new_state}) }

    describe '.call' do 
        it "succeeds" do 
            expect(context).to be_a_success
        end

        it "provides the vehicle" do 
            expect(context.vehicle).to be_an_instance_of Vehicle 
        end

        it "provides the vehicle states with complete included" do
            expect(context.vehicle.states).to eq v_states
        end
    end

end