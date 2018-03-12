require "rails_helper"

RSpec.describe ViewsCountIncrementJob, :type => :job do
  describe "#perform" do
    it "should increment hotel.views_count by 1" do
      hotel = Hotel.create(
        name: "",
        country_code: "",
        description_it: "Italiano",
        description_en: "Inglese",
        description_es: "Spagnolo",
        average_price: "",
        views_count: ""
      )

      ViewsCountIncrementJob.perform_now(hotel.id)
      expect(hotel.views_count).to eq (hotel.views_count + 1)
    end
  end
end

