class Specialty < ApplicationRecord
  has_many :specializations


  has_many :peers, through: :specializations
  has_many :candidates, through: :specializations

  validates_presence_of(:peerage_type)
  enum peerage_type: Peer.orders

end
