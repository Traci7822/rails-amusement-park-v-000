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
      if @user.admin
        @admin_status = "ADMIN"
      end
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end
