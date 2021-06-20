
require 'rails_helper'

RSpec.describe CreateVehicleState do 
    let!(:new_state) { "completed" }
    let(:event) {"complete"}
    let(:from) {"tested"}

   let(:params){{state: new_state, event: event, from: from}}

    subject(:context){ CreateVehicleState.call(params) }

    describe '.call' do 
        it "succeeds" do 
            expect(context).to be_a_success
        end
    end

end