class Specialization < ApplicationRecord
  belongs_to :peer, optional: true
  belongs_to :specialty
  belongs_to :candidate, optional: true
end
