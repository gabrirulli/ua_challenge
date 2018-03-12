require 'rails_helper'

RSpec.describe HotelsController, type: :controller do
  describe 'GET index'do
    before(:each) do
      @user = User.create(first_name: "", last_name: "", email: "email@example.com", password: "password")
    end

    context "if user is not logged" do
      it 'assigns empty array to @hotels' do
        Hotel.create(name: "", country_code: "", description: "", average_price: "", views_count: "")

        get :index

        expect(assigns(:hotels)).to eq []
      end
    end

    context "if user is logged and has not managed hotels" do
      it "assigns empty array to @hotels" do
        sign_in_as(@user)

        get :index

        expect(assigns(:hotels)).to eq []
      end
    end

    context "if user is logged and has managed hotels" do
      it "assigns user.managed_hotels to @hotels" do
        sign_in_as(@user) # this is a clearance gem helper

        hotel = Hotel.create(name: "", country_code: "", description: "", average_price: 0, views_count: 0)
        @user.managed_hotels << hotel

        get :index

        expect(assigns(:hotels)).to eq [hotel]
      end
    end

    context "if user is logged and the language is set in the request header" do
      it "assigns empty array to @hotels" do
        locales = ["it", "en", "es"]
        locale = locales.sample
        sign_in_as(@user)

        hotel = Hotel.create(
          name: "",
          country_code: "",
          description_it: "Italiano",
          description_en: "Inglese",
          description_es: "Spagnolo",
          average_price: "",
          views_count: ""
        )

        get :index

        expect(hotel.description).to eq hotel.send("description_#{locale}")
      end
    end

  end
end
