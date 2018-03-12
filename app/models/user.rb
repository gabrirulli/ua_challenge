class User < ApplicationRecord
  include Clearance::User

  has_many :hotel_users
  has_many :hotels, through: :hotel_users

  has_many :hotel_managers
  has_many :managed_hotels, through: :hotel_managers, source: :hotel
end
