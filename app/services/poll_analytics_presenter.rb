class PollAnalyticsPresenter
	attr_reader :peers
	def initialize(poll)
		@poll = poll
		@peers = Peer.active(@poll.peerage_type).map{|p| PollAnalyticsPeerPresenter.new(p)}
	end
end

class PollAnalyticsPeerPresenter
	extend Forwardable
	def_delegators :@peer, :sca_name
	def initialize(peer)
		@peer = peer
	end
  def advisings_count
		ballot.submission_count
	end
	def ballot_candidates_count
		ballot.candidates.count
	end	
	private
	def ballot
	  Ballot.new(@peer)
	end
end
