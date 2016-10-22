class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    if current_user.admin == 'true'
      #Admin flow controls
    end
  end

  def show
    @user = current_user
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end
end
