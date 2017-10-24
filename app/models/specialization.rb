class Specialization < ApplicationRecord
  belongs_to :peer
  belongs_to :specialty
  belongs_to :candidate
end
