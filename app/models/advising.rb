class Advising < ApplicationRecord
  belongs_to :user
  belongs_to :candidate
  belongs_to :poll
  belongs_to :judgement
end
