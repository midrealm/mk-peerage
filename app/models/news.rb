class News < ApplicationRecord
  validates_presence_of(:peerage_type)
  enum peerage_type: Peer.orders

  def peerage
    Peer.subclass(peerage_type).peerage_name
  end
end
