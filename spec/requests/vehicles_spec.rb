require 'rails_helper'

RSpec.describe "Vehicles", type: :request do

  describe "POST /vehicles" do
    before { post '/vehicles' }

    it "returns a vehicle with initial state set to designed" do 
      expect(json['current_state']).to eq('designed')
    end

    it "returns status code 201" do 
      expect(response).to have_http_status(201)
    end
  end
  describe "POST /vehicles/:id/assemble" do 
      let!(:vehicle) { create(:designed_state_vehicle) }
      let (:vehicle_id) {vehicle.id}
      let (:invalid_id) {3000}

      let(:sm) {
        s = VehicleStateMachine.new 
        s.aasm_state = "assembled"
        s 
    }

    let(:vehicle_asm) { create(:vehicle, vehicle_state_machine: sm)}
    let(:vehicle_asm_id) {vehicle_asm.id}

    context "when the vehicle is in designed state" do
      before {post "/vehicles/#{vehicle_id}/assemble"}

      it "returns the vehicle with current state set to assembled" do 
        expect(json['current_state']).to eq('assembled')
      end
      it "returns status code of 200" do 
        expect(response).to have_http_status(200)
      end
    end

    context "when vehicle is not in designed state" do 
      before {post "/vehicles/#{vehicle_asm_id}/assemble"} 
      it "returns error" do
        expect(json['error']).to eq("Event 'assemble' cannot transition from 'assembled'. ") 
      end
      it "returns status code of 422" do 
        expect(response).to have_http_status(422)
      end
    end
    context "when vehicle id is invalid" do 
      before {post "/vehicles/#{invalid_id}/assemble"}
      it "returns error" do 
        expect(json['error'])
        .to eq("Couldn't find Vehicle with 'id'=#{invalid_id}") 
      end 
      it "returns status code of 422" do 
        expect(response).to have_http_status(422)
      end
    end
  end
  
end
