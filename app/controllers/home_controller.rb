class HomeController < ApplicationController
  def index
    @carousel_events = Event.last(3)
  end
end
