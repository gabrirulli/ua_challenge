class HotelManager < ApplicationRecord
  belongs_to :hotel
  belongs_to :user
end
