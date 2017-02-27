class FriendshipsController < ApplicationController
  def index
    @friends = User.find_by(id: params[:user_id]).squad_member_users
  end

  def new
  end

  def create
    friend_add(params["phone"])
    @user = User.find_or_create_by(phone_number: params["phone"])
    Friendship.create(adder_id: current_user.id, accepter_id: @user.id)
    redirect_to "/users/#{current_user.id}/friendships"
  end
end
