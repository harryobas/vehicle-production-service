require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:valid_attr) {{username: "ben", email: "ben@mail.com", password: "pa$$", password_confirmation: "pa$$", role: "admin"}}
  let(:invalid_attr) {{email: "ben@mail.com", password: "pa$$", password_confirmation: "pa$$"}} 
  describe "POST /auth/signup" do
    context 'with valid user attributes' do 
      before {post "/auth/signup", params: valid_attr}
      it "creates a new user" do 
        expect(json['username']).to eq 'ben'
      end
      it "returns status code 201" do 
        expect(response).to have_http_status(201)
      end
    end
    context "with invalid user attributes" do 
      before {post "/auth/signup", params: invalid_attr}
      it "returns error" do 
        expect(json['error']).to eq "Validation failed: Username can't be blank"
      end
      it "returns status code 422" do
      expect(response).to have_http_status(422)
      end
    end
  end
end
