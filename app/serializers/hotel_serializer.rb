class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :average_price, :views_count

  def description
    locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first rescue I18n.default_locale
    object.send("description_#{locale}")
  end
end
