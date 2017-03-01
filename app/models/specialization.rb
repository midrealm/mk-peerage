class Specialization < ApplicationRecord
  belongs_to :user
  belongs_to :specialty
  belongs_to :candidate
end
