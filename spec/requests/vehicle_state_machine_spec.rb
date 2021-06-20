require 'rails_helper'

RSpec.describe "VehicleStateMachines", type: :request do

  describe "POST /states/create_state" do
    let(:new_state) {"completed"}
    let(:event) {"complete"}
    let(:from) {"tested"}

   let(:params){{state: new_state, event: event, from: from}}
 
    before {post "/states/create_state", params: params} 
    
    it "creates a new state for vehicles" do 
      expect(response.body).to be_empty
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

  end
  describe 'POST /states/order_states' do 
    before {post "/states/order_states"}

    it "changes the states order of vehicles" do 
      expect(response.body).to be_empty
    end

    it "retirns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
 
end
