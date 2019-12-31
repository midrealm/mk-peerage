class Chambers::BallotController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_peer

  def index
    if Poll.current(peerage).nil?
      redirect_to chambers_path
    else
      @ballot = Ballot.new(current_user.peer(peerage)) 
    end
  end
  def update
    @advising = Advising.find_or_initialize_by(candidate: Candidate.find(params[:id]), peer: current_user.peer(peerage), poll: Poll.current(peerage))
	  @advising.assign_attributes(advising_params)
    if @advising.save
      @advising.update(submitted: true)  
      redirect_to action: :index
    else
      render :edit
    end
  end
  
  def edit
		cand = Candidate.find(params[:id])
		@ballot_entry = BallotEntry.new(candidate: cand, peer: current_user.peer(peerage))
		@candidate = CandidatePresenter.new(cand)
    @advising = @ballot_entry.advising
  end
  
  
  private
  def advising_params
    params.require(:advising).permit(:judgement, :comment)
  end
  def authorize_peer
    authorize! :take_poll, peerage
  end
  def self.controller_path
    'chambers/peerage/poll/candidates'
  end
end

