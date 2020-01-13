class Chambers::CandidatesController < ApplicationController
  before_action :authenticate_user!
  def index
    authorize! :read, peerage
    @candidates = Candidate.where_order(peerage).map{|cand| presenter_picker(cand) }

    @poll_date = @candidates.find{ |c| c.poll_date.present?}&.poll_date || ''
  end

  def show
    authorize! :read, peerage
    candidate = Candidate.find(params[:id])
    @candidate = presenter_picker(candidate)

    raise "Access Denied" unless @candidate.peerage_type == peerage.to_s
    @comment = Comment.new
    @document = Document.new
    @old_advisings = OldAdvisings.new(peer: current_user.peer(peerage), candidate: candidate)
    @current_advising = CurrentAdvising.new(peer: current_user.peer(peerage), candidate: candidate) 
  end

  def poll_comments
    authorize! :read, PollResult
		@candidate = PollCommentsCandidatePresenter.new( presenter_picker( Candidate.find(params[:id]) ) )
    unless @candidate.poll_result?
      redirect_to chambers_candidates_path(peerage)
    end
  end
  private
  def self.controller_path
    'chambers/peerage/candidates'
  end
  def presenter_picker(candidate)
    if candidate.vote?
      VoteListCandidatePresenter.new(candidate: candidate, results_picker: results_picker)
    else
      WatchListCandidatePresenter.new(candidate: candidate, results_picker: results_picker)
    end
  end

  def results_picker
    if current_user.royalty?
      RoyalResultsPicker.new
    else
      ResultsPicker.new
    end
  end
end
