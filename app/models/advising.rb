class Advising < ApplicationRecord
  belongs_to :peer
  belongs_to :candidate
  belongs_to :poll
  belongs_to :judgement
end
