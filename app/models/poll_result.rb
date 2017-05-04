class PollResult < ApplicationRecord
  belongs_to :candidate
  belongs_to :poll
end
