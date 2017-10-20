class Specialty < ApplicationRecord
  has_many :specializations

  has_many :users, through: :specializations

  has_many :peers, through: :specializations

  has_many :candidates, through: :specializations

end
