class BallotPresenter
  extend Forwardable
  def_delegators :@ballot, :percent_complete, :submission_count, :candidates, :submission_for?

  def initialize(ballot)
    @ballot = ballot
  end

  def vote_list
    srand(@ballot.seed)
    @ballot.candidates.where(vote: true).shuffle.map{|c| BallotCandidatePresenter.new(c)}
  end

  def watch_list
    srand(@ballot.seed)
    @ballot.candidates.where(vote: false).shuffle.map{|c| BallotCandidatePresenter.new(c)}
  end
end

class BallotCandidatePresenter
  extend Forwardable
  def_delegators :@candidate, :sca_name, :id, :specialties_sentence
  
  def initialize(candidate)
    @candidate = candidate
  end
end
