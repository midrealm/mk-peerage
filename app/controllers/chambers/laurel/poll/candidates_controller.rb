class Chambers::Laurel::Poll::CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_laurel
  helper_method :peerage

  def index
    poll = Poll.current(:laurel)
    if poll.nil?
      redirect_to chambers_path
    else
      @ballot = Ballot.new(current_user.peer(peerage)) 
    end
  end
  def update
    @advising = Advising.find_by(candidate_id: params[:id], peer: current_user.laurel, poll: Poll.current(:laurel))
    if @advising.update(advising_params)
      @advising.update(submitted: true)  
      redirect_to action: :index
    else
      render :edit
    end
  end
  
  def edit
    @candidate = Candidate.find(params[:id]) 
    
    last_advising = Advising.where(candidate: @candidate, peer:current_user.laurel).last
    poll = 'NoPoll'
    if last_advising
      poll = last_advising.poll
    end
    @advising = last_advising
  
    case poll
    when Poll.last
    when nil
      @advising.update(poll: Poll.last)
    else
      @advising = Advising.create(candidate_id: params[:id], peer: current_user.laurel, poll: Poll.last, 
          judgement: judgement(last_advising), comment: comment(last_advising))
    end 
  end
  
  
  private
  def advising_params
    params.require(:advising).permit(:judgement, :comment)
  end
  def authorize_laurel
    authorize! :take_poll, :laurel
  end

  def judgement(old_advising)
    if old_advising
      old_advising.judgement
    end
  end
  
  def comment(old_advising)
    if old_advising
      old_advising.comment
    end
  end

  def peerage
    :laurel
  end

  def self.controller_path
    'chambers/peerage/poll/candidates'
  end
end

