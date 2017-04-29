class PollsController < ApplicationController
  before_action :authenticate_user!
  def show
    authorize! :take, Poll
    @candidates = Candidate.all
    @poll = Poll.last
    if @poll.end_date < DateTime.now || @poll.start_date >DateTime.now 
      redirect_to chambers_path
    end
  end
end
