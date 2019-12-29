class Chambers::Admin::OfflinePollSubmittersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  def new
    @ballot = OfflineBallot.new(peerage)
  end
  def create
    @ballot = OfflineBallot.new(peerage)
    @ballot.assign_attributes(ballot_params)
    if @ballot.save
     flash[:success] = 'Poll Saved'  
     redirect_to chambers_admin_polls_path(peerage)
    else
      flash[:error] = 'Poll Invalid'  
      render :new
    end
  end
  private
  def ballot_params
    params.require(:offline_ballot).permit(:peer_id, :vote_list_advisings_attributes => [:candidate_id, :judgement, :comment], :watch_list_advisings_attributes => [:candidate_id, :judgement, :comment])
  end
  def self.controller_path
    'chambers/peerage/admin/offline_poll_submitters'
  end
end
