class UsersController < ApplicationController
  include UsersHelper

  def show
    @user = User.find(params[:id])
    if @user.id != session[:user_id]
      render :file => "#{Rails.root}/public/404.html", :status => 404
    end
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      set_session(user)
      redirect_to user
    else
      redirect_to '/users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
