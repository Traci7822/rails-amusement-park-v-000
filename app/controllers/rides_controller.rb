class RidesController < ApplicationController
  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(params[:ride])
    @ride.save
    @user = User.find(params[:ride][:user_id])
    redirect_to user_path(@user)
  end
end
