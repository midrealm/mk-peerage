## Next Step: Work on Checking for Future Polls
class PollCommentsPresenter < RoyaltyCandidatePresenter

  def advisings
    @results.advisings.map {|adv| PollCommentsAdvisingPresenter.new(adv)}
  end

end

class PollCommentsAdvisingPresenter
  extend Forwardable
	def_delegators :@advising, :peer, :judgement_name, :comment
  def initialize(advising)
		@advising = advising
	end
	def shortened_comment
		@advising.comment.truncate(500, separator: /\s/)
	end
end
