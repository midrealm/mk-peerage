class Chambers::Pelican::Poll::CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_pelican
  helper_method :peerage

  def index
    if Poll.current(:pelican).nil?
      redirect_to chambers_path
    else
      @ballot = Ballot.new(current_user.peer(peerage)) 
    end
  end
  def update
    @advising = BallotEntry.new(candidate: Candidate.find(params[:id]), peer: current_user.pelican).advising
    if @advising.update(advising_params)
      @advising.update(submitted: true)  
      redirect_to action: :index
    else
      render :edit
    end
  end
  
  def edit
    @candidate = Candidate.find(params[:id]) 
    @advising = BallotEntry.new(candidate: @candidate, peer: current_user.pelican).advising
  end
  
  
  private
  def advising_params
    params.require(:advising).permit(:judgement, :comment)
  end
  def authorize_pelican
    authorize! :take_poll, :pelican
  end


  def peerage
    :pelican
  end

  def self.controller_path
    'chambers/peerage/poll/candidates'
  end
end

