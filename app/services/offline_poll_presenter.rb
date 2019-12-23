class OfflinePollPresenter
  def initialize(peerage)
    @peerage = peerage
    @candidates = Candidate.where_order(@peerage)
	end
  def vote_list
    @candidates.where(vote:true).order(:sca_name).map { |c| OfflinePollCandidatePresenter.new(c) }
  end
  def watch_list
    @candidates.where(vote:false).order(:sca_name).map { |c| OfflinePollCandidatePresenter.new(c) }
  end
  def poll_date
    p = Poll.active_for(@peerage)
    "#{date(p.start_date)} to #{date(p.end_date)}" 
  end
  private
  def date(date)
   date.strftime("%b %d, %Y") 
  end
end

class OfflinePollCandidatePresenter
  extend Forwardable
  def_delegators :@candidate, :sca_name, :profile_pic, :specialties_sentence
  def initialize(candidate)
    @candidate = candidate
  end 
end
