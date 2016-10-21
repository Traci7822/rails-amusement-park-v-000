class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_name(params[:user][:name])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

end
