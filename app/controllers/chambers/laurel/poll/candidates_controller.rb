class Chambers::Laurel::Poll::CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_laurel
  helper_method :peerage

  def index
    if Poll.current(:laurel).nil?
      redirect_to chambers_path
    else
      @ballot = Ballot.new(current_user.peer(peerage)) 
    end
  end
  def update
    @advising = BallotEntry.new(candidate: Candidate.find(params[:id]), peer: current_user.laurel).advising
    if @advising.update(advising_params)
      @advising.update(submitted: true)  
      redirect_to action: :index
    else
      render :edit
    end
  end
  
  def edit
    @candidate = Candidate.find(params[:id]) 
    @advising = BallotEntry.new(candidate: @candidate, peer: current_user.laurel).advising
  end
  
  
  private
  def advising_params
    params.require(:advising).permit(:judgement, :comment)
  end
  def authorize_laurel
    authorize! :take_poll, :laurel
  end


  def peerage
    :laurel
  end

  def self.controller_path
    'chambers/peerage/poll/candidates'
  end
end

