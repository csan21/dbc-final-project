class FriendshipsController < ApplicationController
  # protect_from_forgery with: :null_session

  def index
    @friends = User.find_by(id: params[:user_id]).friends_who_have_accepted
    @errors = []
  end

  def new
  end

  def create
    @user = User.find_by(phone_number: "+"+params["phone"])
    if @user
      @friendship = Friendship.find_by(adder_id: current_user.id, accepter_id: @user.id)
      if @friendship && @friendship.accepted?
        @errors = []
        @errors << "The person with number #{params["phone"]} is already your friend."
        @friends = User.find_by(id: params[:user_id]).friends_who_have_accepted
        render :index
      elsif @friendship
        @errors = []
        @errors << "You already added the person with number #{params["phone"]}."
        @friends = User.find_by(id: params[:user_id]).friends_who_have_accepted
        render :index
      else
        @friendship = Friendship.create(adder_id: current_user.id, accepter_id: @user.id)
        friend_add(params["phone"], @friendship.id)
        redirect_to "/users/#{current_user.id}/friendships"
      end
    else
      @user = User.create(name: params["name"], email: SecureRandom.hex(4) + "@random.com", password: "password", password_confirmation: "password", phone_number: params["phone"])
      @friendship = Friendship.create(adder_id: current_user.id, accepter_id: @user.id)
      p "**********"
      p @user
      p current_user
      p @friendship
      p "**********"
      friend_add(params["phone"], @friendship.id)
      redirect_to "/users/#{current_user.id}/friendships"
    end
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
