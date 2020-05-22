class Chambers::CandidatesController < ApplicationController
  before_action :authenticate_user!
  def index
    authorize! :read, peerage
    @candidates = Candidate.where_order(peerage).order(vote: :desc, sca_name: :asc).map{|cand| CandidatePresenter.for(candidate: cand, results_picker: results_picker) }

    @poll_date = @candidates.find{ |c| c.poll_date.present?}&.poll_date || ''
  end

  def show
    authorize! :read, peerage
    candidate = Candidate.find(params[:id])
    @candidate = CandidatePresenter.for(candidate: candidate, results_picker: results_picker) 

    raise "Access Denied" unless @candidate.peerage_type == peerage.to_s
    @comment = Comment.new
    @document = Document.new
    @old_advisings = OldAdvisings.new(peer: current_user.peer(peerage), candidate: candidate)
    @current_advising = CurrentAdvising.new(peer: current_user.peer(peerage), candidate: candidate) 
  end

  def poll_comments
    authorize! :read, PollResult
		@candidate = PollCommentsCandidatePresenter.new( CandidatePresenter.for(candidate: Candidate.find(params[:id]), results_picker: results_picker ) )
    unless @candidate.poll_result?
      redirect_to chambers_candidates_path(peerage)
    end
  end
  private
  def self.controller_path
    'chambers/peerage/candidates'
  end

  def results_picker
    if current_user.royalty?
      RoyalResultsPicker.new
    else
      ResultsPicker.new
    end
  end
end
