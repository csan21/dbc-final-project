class VotesController < ApplicationController
  def create
    Vote.create(user_id: session[:user_id], answer_id: params["answer_id"].to_i)
    redirect_to "/users/#{session[:user_id]}"
  end
end
