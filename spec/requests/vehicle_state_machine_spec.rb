require 'rails_helper'

RSpec.describe "VehicleStateMachines", type: :request do

  let(:admin) { create :user, role: 'admin' }
  let(:user) { create :user, role: 'user' }

  let(:new_state) {"completed"}
  let(:event) {"complete"}
  let(:from) {"tested"}

 let(:params) {{state: new_state, event: event, from: from}}

  describe "POST /states/create_state" do
    context "user is admin" do 
      before {post "/states/create_state", params: params, headers: auth_headers(admin)}
      
      it "creates a new state for vehicles" do 
      expect(response.body).to be_empty
      end
      it 'returns status code 204' do
      expect(response).to have_http_status(204)
      end 
    end
    context "user is not admin" do 
      before {post "/states/create_state", params: params, headers: auth_headers(user)}
      it "returns error" do 
        expect(json['error']).to eq 'not authorized'
      end
      it "returns status code 401" do 
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'POST /states/order_states' do 
    context "user is admin" do 
      before {post "/states/order_states", headers: auth_headers(admin) }
      it "changes the states order of vehicles" do 
        expect(response.body).to be_empty
      end
      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end
    context "user is not admin" do 
      before {post "/states/order_states", headers: auth_headers(user) }
      it "returns error" do 
        expect(json['error']).to eq 'not authorized' 
      end
      it 'returns status code 401' do 
        expect(response).to have_http_status(401)
      end
    end 
  end
  describe "POST /states/delete_state" do 
    context "user is admin" do 
      before {post "/states/order_states", params: {state: "painted"}, headers: auth_headers(admin)}
      it "removes a state from the state machine" do 
        expect(response.body).to be_empty
      end
      it "returns status code 204" do 
        expect(response).to have_http_status(204)
      end
    end
    context "user is not admin" do 
      before {post "/states/order_states", params: {state: "painted"}, headers: auth_headers(user)}
      it "returns error" do 
        expect(json['error']).to eq 'not authorized'
      end 
      it "returns status code 401" do 
        expect(response).to have_http_status(401)
      end
    end
  end
 
end
