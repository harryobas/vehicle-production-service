require 'rails_helper'

RSpec.describe "Vehicles", type: :request do

  describe "POST /vehicles" do
    before { post '/vehicles' }

    it "creates a vehicle with initial state set to designed" do 
      expect(json['current_state']).to eq('designed')
    end

    it "returns status code 201" do 
      expect(response).to have_http_status(201)
    end
  end
end
