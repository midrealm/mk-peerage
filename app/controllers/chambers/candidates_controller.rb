module Chambers
  class CandidatesController < ApplicationController
    before_action :authenticate_user!
    def index
      @vote_candidates = Candidate.where(vote: true)
      @watch_candidates = Candidate.where(vote: false)
    end
    def show
      @candidate = Candidate.find(params[:id])
      @comment = Comment.new
    end
  end
end
