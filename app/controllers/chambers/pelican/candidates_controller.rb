class Chambers::Pelican::CandidatesController < ApplicationController
  before_action :authenticate_user!
  helper_method :peerage
  def index
    authorize! :read, :pelican
    @candidates = Candidate.where(peerage_type: :pelican)
    render template: 'chambers/peerage/candidates/index'
  end

  def show
    authorize! :read, :pelican
    @candidate = Candidate.find(params[:id])
    raise "Access Denied" unless @candidate.pelican?
    @pr = @candidate.poll_results.last
    @comment = Comment.new
    @image = Image.new
    render template: 'chambers/peerage/candidates/show'
  end

  def poll_comments
    authorize! :read, PollResult
    @candidate = Candidate.find(params[:id])
    @pr = @candidate.poll_results.last
    if @pr.nil?
      redirect_to chambers_pelican_candidates_path
    end
  end
  private
  def self.controller_path
    'chambers/peerage/candidates'
  end
  def peerage
    :pelican
  end
end
