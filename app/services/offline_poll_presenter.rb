class OfflinePollPresenter
  def initialize(peerage)
    @peerage = peerage
	end
  def vote_list
    Candidate.vote_list(@peerage).order(:sca_name).map { |c| OfflinePollCandidatePresenter.new(c) }
  end
  def watch_list
    Candidate.watch_list(@peerage).order(:sca_name).map { |c| OfflinePollCandidatePresenter.new(c) }
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
 
  def name
    if Peer.subclass(@candidate.order).specialties_on? && @candidate.specialties?
      "#{@candidate.sca_name} (#{@candidate.specialties_sentence})"
    else
      @candidate.sca_name
    end
  end 
end
