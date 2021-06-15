RSpec.describe ChangeVehicleStatesOrder do 
    
    subject(:context){ ChangeVehicleStatesOrder.call }

    describe '.call' do
        it "succeeds" do
            expect(context).to be_a_success
        end
    end

end