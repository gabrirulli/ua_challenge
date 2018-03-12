class Hotel < ApplicationRecord
  translates :description
  globalize_accessors :locales => [:en, :it, :es], attributes: [:description]

  has_many :hotel_users
  has_many :users, through: :hotel_users

  has_many :hotel_managers
  has_many :managers, through: :hotel_managers, source: :user
end
