class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :average_price, :views_count

  def description
    case scope[:locale]
    when "en"
      object.description_en
    when "es-US"
      object.description_es
    else
      object.description
    end
  end
end
