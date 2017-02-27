class FriendshipsController < ApplicationController
  def index
    @friends = User.find_by(id: params[:user_id]).friends_who_have_accepted
  end

  def new
  end

  def create
    friend_add(params["phone"])
    @user = User.create(name: params["name"], email: "place1@holder.com", password: "password", phone_number: params["phone"])
    Friendship.create(adder_id: current_user.id, accepter_id: @user.id)
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
