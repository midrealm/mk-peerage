class PollsController < ApplicationController
  before_action :authenticate_user!
  def show
    authorize! :take, Poll
    @candidates = Candidate.order(vote: :desc)
    @poll = Poll.last
    if @poll.end_date < DateTime.now || @poll.start_date >DateTime.now 
      redirect_to chambers_path
    end
    if @candidates.count > 0
      @percent_complete = current_user.poll_submitted_count * 100 / @candidates.count
    else
      @percent_complete = 0
    end
    
  end
end
