class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :average_price, :views_count

  def description
    case scope[:locale]
    when "en"
      object.description_en
    when "es_us"
      object.description_es_us
    else
      object.description
    end
  end

  def average_price
    c = CurrencyExchange.find_by(country_code: scope[:locale])
    case scope[:locale]
    when "en"
      "%.2f #{c.currency}" % object.average_price_en
    when "es_us"
      "%.2f #{c.currency}" % object.average_price_es_us
    else
      "%.2f €" % object.average_price
    end
  end
end
