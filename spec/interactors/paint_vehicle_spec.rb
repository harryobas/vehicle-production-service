
require 'rails_helper'

RSpec.describe PaintVehicle do
    let!(:vehicle) { create(:designed_state_vehicle) }
    let (:vehicle_id) {vehicle.id}

    let(:sm) {
        s = VehicleStateMachine.new 
        s.aasm_state = "assembled"
        s 
    }

    let(:vehicle_paint) { create(:vehicle, vehicle_state_machine: sm)}
    let(:vehicle_paint_id) {vehicle_paint.id}

    subject(:context){ PaintVehicle.call({id: vehicle_paint_id}) }

    describe ".call" do 
        context "when vehicle is in assembled state" do 
            it 'succeeds' do 
                expect(context).to be_a_success
            end
            it "provides the vehicle" do
                expect(context.vehicle).to be_an_instance_of Vehicle
            end
            it "provides the vehicle's current_state as painted" do
                expect(context.vehicle.current_state).to eq "painted"
            end
        end
        context "when is not in assembled state" do
            subject(:context){ PaintVehicle.call({id: vehicle_id}) }

            it "fails" do 
                expect(context).to be_a_failure
            end
        end
    end

end