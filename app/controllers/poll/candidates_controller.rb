class Poll::CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_laurel
  def update
    @advising = Advising.find_by(candidate_id: params[:id], peer_id: current_user.peer.id, poll_id: Poll.last.id)
    if @advising.update(advising_params)
      @advising.update(submitted: true)  
      redirect_to poll_path
    else
      render :edit
    end
  end

  def edit
    @candidate = Candidate.find(params[:id]) 
    
    last_advising = Advising.where(candidate: @candidate, peer:current_user.peer).last
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
      @advising = Advising.create(candidate_id: params[:id], peer: current_user.peer, poll: Poll.last, 
          judgement: judgement(last_advising), comment: comment(last_advising))
    end 
  end
  
  def advising_params
    params.require(:advising).permit(:judgement_id, :comment)
  end
  def authorize_laurel
    authorize! :take, Poll
  end

  private
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
end
