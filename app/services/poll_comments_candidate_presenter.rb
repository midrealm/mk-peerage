class PollCommentsCandidatePresenter
  extend Forwardable
  def_delegators :@candidate, :sca_name, :comments, :profile_pic, :profile_pic_full, :profile_pic_thumb, :list, :group, 
    :documents, :peerage_type, :id, :documents?, :poll_result?, :poll_date, :status, :advocates, :advocates?, :document_count, 
    :comments, :specialties, :specialties?, :elevate, :wait, :drop, :no_strong_opinion, :rec, :fav, :date

  def initialize(candidate)
    @candidate = candidate
  end

  def advisings
    @candidate.results.advisings.map {|adv| PollCommentsAdvisingPresenter.new(adv)}
  end

end

class PollCommentsAdvisingPresenter
  extend Forwardable
	def_delegators :@advising, :peer, :judgement_name, :comment
  def initialize(advising)
		@advising = advising
	end
	def shortened_comment
		@advising.comment.truncate(300, separator: /\s/)
	end
end
