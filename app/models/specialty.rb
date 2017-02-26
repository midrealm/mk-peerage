class Specialty < ApplicationRecord
  has_many :specializations
  has_many :users, through: :specializations
end
