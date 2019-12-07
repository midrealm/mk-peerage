class RoyaltyCandidatePresenter < CandidatePresenter
  def initialize(candidate)
    @candidate = candidate
    @results = @candidate.last_poll_result
  end
end
