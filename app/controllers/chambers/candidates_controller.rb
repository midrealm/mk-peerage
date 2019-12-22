class Chambers::CandidatesController < ApplicationController
  before_action :authenticate_user!
  def index
    authorize! :read, peerage
    if current_user.royalty?
      @candidates = Candidate.where(peerage_type: peerage).map{|cand| RoyaltyCandidatePresenter.new(cand) }
    else
      @candidates = Candidate.where(peerage_type: peerage).map{|cand| CandidatePresenter.new(cand) }
    end

    @poll_date = @candidates.find{ |c| c.poll_date.present?}&.poll_date || ''
  end

  def show
    authorize! :read, peerage
    if current_user.royalty?
      @candidate = RoyaltyCandidatePresenter.new(Candidate.find(params[:id]))
    else
      @candidate = CandidatePresenter.new(Candidate.find(params[:id]))
    end
    raise "Access Denied" unless @candidate.peerage_type == peerage.to_s
    @comment = Comment.new
    @document = Document.new
  end

  def poll_comments
    authorize! :read, PollResult
		@candidate = PollCommentsPresenter.new(Candidate.find(params[:id]))
    unless @candidate.poll_result?
      redirect_to chambers_candidates_path(peerage)
    end
  end
  private
  def self.controller_path
    'chambers/peerage/candidates'
  end
end
