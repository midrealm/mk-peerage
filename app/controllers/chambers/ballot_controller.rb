class Chambers::BallotController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_peer
  helper_method :peerage

  def index
    if Poll.current(peerage).nil?
      redirect_to chambers_path
    else
      @ballot = Ballot.new(current_user.peer(peerage)) 
    end
  end
  def update
    @advising = BallotEntry.new(candidate: Candidate.find(params[:id]), peer: current_user.peer(peerage)).advising
    if @advising.update(advising_params)
      @advising.update(submitted: true)  
      redirect_to action: :index
    else
      render :edit
    end
  end
  
  def edit
    @candidate = Candidate.find(params[:id]) 
    @advising = BallotEntry.new(candidate: @candidate, peer: current_user.peer(peerage)).advising
  end
  
  
  private
  def advising_params
    params.require(:advising).permit(:judgement, :comment)
  end
  def authorize_peer
    authorize! :take_poll, peerage
  end

  def peerage
    params[:peerage].to_sym
  end

  def self.controller_path
    'chambers/peerage/poll/candidates'
  end
end

