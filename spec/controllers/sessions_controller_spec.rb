require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST create' do
    it "creates the user session" do
      user = User.create(first_name: "", last_name: "", email: "email@example.com", password: "password")

      post :create, params: {session: {email: user.email, password: user.password}}

      expect(response.status).to eq 200
    end
  end
end
