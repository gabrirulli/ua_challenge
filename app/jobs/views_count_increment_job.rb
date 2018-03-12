class ViewsCountIncrementJob < ApplicationJob
  queue_as :default

  def perform(hotel_ids)
    hotel_ids.each do |id|
      hotel = Hotel.find(id)
      hotel.update(views_count: hotel.views_count + 1)
    end
  end
end
