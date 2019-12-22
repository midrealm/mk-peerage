## Next Step: Work on Checking for Future Polls
class PollCommentsPresenter < RoyaltyCandidatePresenter

  def advisings
    @results.advisings.map {|adv| PollCommentsAdvisingPresenter.new(adv)}
  end

  def poll_date
    poll = @results.poll
    "#{date(poll.start_date)} - #{date(poll.end_date)}"
  end
	
	

  private
  def date(date)
   date.strftime("%b %d, %Y") 
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
