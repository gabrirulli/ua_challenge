class Hotel < ApplicationRecord
  # Definizione campi da tradurre con la gemma globalize-accessor
  translates :description, :average_price
  globalize_accessors :locales => [:it, :en, :es_us], attributes: [:description, :average_price]

  has_many :hotel_users
  has_many :users, through: :hotel_users

  has_many :hotel_managers
  has_many :managers, through: :hotel_managers, source: :user

  before_create :set_average_price, :calculate_average_price

  private

  # Salva in database un prezzo unico per tutte le valute, altrimenti il valore su cui calcolare il cambio sarebbe sbagliato.
  # Quando si crea un Hotel basta dare un valore ad average_price senza specificare la lingua
  def set_average_price
    ['en', 'es_us'].each do |lng|
      self.send("average_price_#{lng}=", average_price_it)
    end
  end

  # Calcola il prezzo in base alla lingua, alla valuta ed al suo tasso di scambio
  def calculate_average_price
    CurrencyExchange.all.each do |ce|
      self.send("average_price_#{ce.country_code}=", (average_price_it * ce.rate))
    end
  end
end
