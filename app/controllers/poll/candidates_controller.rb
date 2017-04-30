class Poll::CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_laurel
  def update
    @advising = Advising.find_by(candidate_id: params[:id], user_id: current_user.id, poll_id: Poll.last.id)
    if @advising.update(advising_params)
      @advising.update(submitted: true)  
      redirect_to poll_path
    else
      render :edit
    end
  end

  def edit
     
    @advising = Advising.find_by(candidate_id: params[:id], user_id: current_user.id, poll_id: Poll.last.id)

    if @advising.nil? 

      @advising = Advising.find_by(candidate_id: params[:id], user_id: current_user.id, poll_id: nil)
      unless @advising.nil?
        @advising.update(poll_id: Poll.last.id)
      else

        old_advising = nil 
        old_advising = Advising.find_by(candidate_id: params[:id], user_id: current_user.id, poll_id: Poll.second_to_last.id) unless Poll.second_to_last.nil?
        unless old_advising.nil?
          @advising = Advising.create(candidate_id: params[:id], user_id: current_user.id, poll_id: Poll.last.id, 
            judgement_id: old_advising.judgement_id, comment: old_advising.comment)
        else
          @advising = Advising.create(candidate_id: params[:id], user_id: current_user.id, poll_id: Poll.last.id)
        end
      end 
    end 
   
    @candidate = Candidate.find(params[:id]) 
  end
  def advising_params
    params.require(:advising).permit(:judgement_id, :comment)
  end
  def authorize_laurel
    authorize! :take, Poll
  end
end
