class Chambers::Laurel::CandidatesController < ApplicationController
  before_action :authenticate_user!
  helper_method :peerage
  def index
    authorize! :read, :laurel
    @candidates = Candidate.where(peerage_type: :laurel)
  end

  def show
    authorize! :read, :laurel
    @candidate = Candidate.find(params[:id])
    raise "Access Denied" unless @candidate.laurel?
    @pr = @candidate.poll_results.last
    @comment = Comment.new
    @image = Image.new
  end

  def poll_comments
    authorize! :read, PollResult
    @candidate = Candidate.find(params[:id])
    @pr = @candidate.poll_results.last
    if @pr.nil? 
      redirect_to chambers_laurel_candidates_path
    end
  end
  private
  def self.controller_path
    'chambers/peerage/candidates'
  end
  def peerage
    :laurel
  end
end
