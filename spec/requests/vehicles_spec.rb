require 'rails_helper'

RSpec.describe "Vehicles", type: :request do
  let!(:vehicles) { create_list(:designed_state_vehicle, 10) }
  let (:vehicle_id) {vehicles.first.id}
  let(:vehicle_a){AssembleVehicle.call(id: vehicles.last.id).vehicle}
  let(:vehicle_a_id) {vehicle_a.id}

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
      before {post "/vehicles/#{vehicle_a_id}/assemble"}
      it "returns error" do
        expect(json['error']).to eq("Event 'assemble' cannot transition from 'assembled'. ") 
      end
      it "returns status code of 422" do 
        expect(response).to have_http_status(422)
      end
    end
    
    context "when vehicle id is invalid" do 
      before {post "/vehicles/300/assemble"}
      it "returns error" do 
        expect(json['error'])
        .to eq("Couldn't find Vehicle with 'id'=300") 
      end 
      it "returns status code of 422" do 
        expect(response).to have_http_status(404)
      end
    end
  end

  describe "GET /vehicles" do 
    before {get "/vehicles"}

    it "returns vehicles" do 
      expect(json).not_to be_empty 
      expect(json.size).to eq 10
    end
    it "returns status code of 200" do 
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /vehicles/:id" do 
    before {get "/vehicles/#{vehicle_id}"}

    context "when the record exist" do 
      it "returns the vehicle" do 
        expect(json['id']).to eq vehicle_id
      end
      it "returns status code of 200" do 
        expect(response).to have_http_status(200)
      end
    end
  end

end
