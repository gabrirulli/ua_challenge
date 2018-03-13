class HotelsController < ApplicationController
  def index
    if signed_in?
      @hotels = current_user.managed_hotels
    else
      @hotels = []
    end

    if @hotels != []
      ViewsCountIncrementJob.perform_now(@hotels.map(&:id))
    end

    # @hotels = Hotel.all
    render json: @hotels, each_serializer: HotelSerializer, scope: {
      'locale': request.headers["HTTP_ACCEPT_LANGUAGE"]
    }
  end
end
