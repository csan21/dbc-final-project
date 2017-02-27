class FriendshipsController < ApplicationController
  # protect_from_forgery with: :null_session

  def index
    @friends = User.find_by(id: params[:user_id]).friends_who_have_accepted
  end

  def new
  end

  def create

    #if User.find_by(phone_number:)
    @user = User.create(name: params["name"], email: SecureRandom.hex(4) + "@random.com", password: "password", phone_number: params["phone"])
    @friendship = Friendship.create(adder_id: session[:user_id], accepter_id: @user.id)
    friend_add(params["phone"], @friendship.id)
    redirect_to "/users/#{current_user.id}/friendships"
  end

  def update
    friendship = Friendship.find_by(id: params[:id])
    friendship.update_attribute(:accepted?, true)
    redirect_to "/users/#{current_user.id}"
  end

  def destroy
    friendship = Friendship.find_by(id: params[:id])
    friendship.destroy
    redirect_to "/users/#{current_user.id}"
  end
end
