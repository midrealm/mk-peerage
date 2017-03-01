class Candidate < ApplicationRecord
  has_many :advocacies
  has_many :users, through: :advocacies
end
