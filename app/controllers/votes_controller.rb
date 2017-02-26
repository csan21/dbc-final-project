class VotesController < ApplicationController
  def create
    p "X" * 50
    p params["answer_id"]
    p "X" * 50
    Vote.create(user_id: , answer_id: params["answer_id"].to_i)
  end
end
