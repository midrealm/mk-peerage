class Chambers::CandidatesController < ApplicationController
  before_action :authenticate_user!
  helper_method :peerage
  def index
    authorize! :read, peerage
    @candidates = Candidate.where(peerage_type: peerage)
  end

  def show
    authorize! :read, peerage
    @candidate = Candidate.find(params[:id])
    raise "Access Denied" unless @candidate.peerage_type == peerage.to_s
    @pr = @candidate.poll_results.last
    @comment = Comment.new
    @image = Image.new
    @document = Document.new
  end

  def poll_comments
    authorize! :read, PollResult
    @candidate = Candidate.find(params[:id])
    @pr = @candidate.poll_results.last
    if @pr.nil? 
      redirect_to chambers_candidates_path(peerage)
    end
  end
  private
  def self.controller_path
    'chambers/peerage/candidates'
  end
  def peerage
    params[:peerage].to_sym
  end
end
