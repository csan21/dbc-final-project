class AudienceVotesController < ApplicationController
  def index
    @audience_votes = AudienceVote.all
  end
end
