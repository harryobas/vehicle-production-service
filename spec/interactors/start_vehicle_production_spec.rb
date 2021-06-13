require 'rails_helper'

RSpec.describe StartVehicleProduction do
    subject(:context){ StartVehicleProduction.call } 
   
    describe '.call' do
    
       it "succeeds" do
        expect(context).to be_a_success
       end

       it "provides the vehicle" do
        expect(context.vehicle).to be_an_instance_of Vehicle
       end

       it "provides the vehicles's current state" do 
        expect(context.vehicle.current_state).to eq "designed"
       end

       it "provides the vehicle's permitted states" do
        expect(context.vehicle.states).to eq(["designed", "assembled", "painted", "tested"])
       end
    end

end