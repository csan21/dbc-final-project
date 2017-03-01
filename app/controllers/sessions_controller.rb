class SessionsController < ApplicationController
  include UsersHelper

  def new
    @user = User.new
    @errors = []
    if current_user
      redirect_to "/users/#{current_user.id}"
    end
  end

  def index
    redirect_to new_session_path
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    @errors = []
    if @user && @user.authenticate(params[:session][:password])
      set_session(@user)
      redirect_to @user
    else
      @errors << "Invalid username and password combination"
      render :new
    end
  end

  def destroy
    delete_session
    redirect_to root_path
  end
end
