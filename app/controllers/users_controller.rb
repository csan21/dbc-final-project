class UsersController < ApplicationController
  include UsersHelper

  def show
    @user = User.find(params[:id])
    if @user.id != session[:user_id]
      render :file => "#{Rails.root}/public/404.html", :status => 404
    end
  end

  def index
    redirect_to new_user_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_session(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def polls_to_answer
    user = User.find(params[:id])
    render :partial => 'user_polls_to_vote_on', :layout => false, :locals => {user: user}
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number)
  end
end
