class PollResult < ApplicationRecord
  belongs_to :candidate
  belongs_to :poll

  def advisings
    Advising.where(candidate: candidate, poll: poll)
  end

end
