
require 'rails_helper'

RSpec.describe CreateVehicleState do 
    let!(:new_state) { "complete" }

    subject(:context){ CreateVehicleState.call({state: new_state}) }

    describe '.call' do 
        it "succeeds" do 
            expect(context).to be_a_success
        end
    end

end