module Admin
  class PollsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin
    def new
      @poll = Poll.new
    end
  
    def edit
      @poll = Poll.last
      if @poll.end_date < DateTime.now
        redirect_to chambers_path
      end
    end
  
    def create
      @poll = Poll.new(poll_params)
      @poll.end_date = @poll.end_date + 23.hours + 59.minutes + 59.seconds unless @poll.end_date.nil?
      if @poll.save
        redirect_to chambers_path
      else
        render :new
      end 
    end
  
    def update
      @poll = Poll.last
      new_params = poll_params
      tempPoll = Poll.new(poll_params) 
      new_params.end_date = new_params.end_date + 23.hours + 59.minutes + 59.seconds unless tempPoll.end_date.nil?
      if @poll.update(new_params)
        redirect_to chambers_path
      else
        render :update
      end
    end
    private
    def poll_params
      params.require(:poll).permit(:start_date, :end_date)
    end
    def authorize_admin
      authorize! :manage, :all
    end
  end
end
