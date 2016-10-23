class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      redirect_to new_user_path
    end
  end

  def show
    if logged_in?
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def signin
  end

  def update
    ride = Ride.new(ride_params[:attraction_attributes])
    ride.user = current_user
    if ride.take_ride
      ride.save
    end
    redirect_to user_path(current_user), :alert => ride.take_ride
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin, :attraction)
  end

  def ride_params
    params.require(:user).permit(:attraction_attributes => [:tickets, :happiness_rating, :name, :nausea_rating, :min_height, :attraction_id])
  end

end
