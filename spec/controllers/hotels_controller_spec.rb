require 'rails_helper'

RSpec.describe HotelsController, type: :controller do
  describe 'GET index'do
    before(:each) do
      @user = User.create(first_name: "", last_name: "", email: "email@example.com", password: "password")
      @hotel = Hotel.create(name: "", country_code: "", description: "", average_price: 0, views_count: 0)
    end

    context "if user is not logged" do
      it 'assigns empty array to @hotels' do
        get :index

        expect(assigns(:hotels)).to eq []
      end
    end

    context "if user is logged and has not managed hotels" do
      it "assigns empty array to @hotels" do
        sign_in_as(@user) # this is a clearance gem helper

        get :index

        expect(assigns(:hotels)).to eq []
      end
    end

    context "if user is logged and has managed hotels" do
      it "assigns user.managed_hotels to @hotels" do
        sign_in_as(@user)

        @user.managed_hotels << @hotel

        get :index

        expect(assigns(:hotels)).to eq [@hotel]
      end
    end
  end
end
