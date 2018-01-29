class Specialty < ApplicationRecord
  has_many :specializations


  has_many :peers, through: :specializations
  has_many :candidates, through: :specializations

  validates_presence_of(:peerage_type, :slug)
  enum peerage_type: Peer.orders
  before_save :set_slug
  def set_slug
    self.slug = I18n.transliterate(self.name).downcase.tr(' ','_')
  end
end
