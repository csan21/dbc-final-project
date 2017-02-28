class SessionsController < ApplicationController
  include UsersHelper

  def new
    if current_user
      redirect_to "/users/#{current_user.id}"
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      set_session(user)
      redirect_to user
    else
      redirect_to '/sessions/new'
    end
  end

  def destroy
    delete_session
    redirect_to root_path
  end
end
