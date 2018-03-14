require 'rails_helper'

RSpec.describe Hotel, type: :model do
  let(:hotel) { Hotel.create(name: "", country_code: "", description: "", average_price: 10, views_count: 0) }

  describe "#set_average_price" do
    it "set every average_prices to the value of average_price_it" do
      ["en", "es_us"].each do |lng|
        expect(hotel.send("average_price_#{lng}")).to eq hotel.average_price_it
      end
    end
  end

  describe "#calculate_average_price" do
    it "calculates the exchange of every average_prices in €" do
      CurrencyExchange.create(country_code: "en", currency: "£", rate: 0.8865)
      CurrencyExchange.create(country_code: "es_us", currency: "$", rate: 1.2378)

      CurrencyExchange.all.each do |ce|
        expect(hotel.send("average_price_#{ce.country_code}")).to eq (hotel.average_price_it * ce.rate)
      end
    end
  end
end
