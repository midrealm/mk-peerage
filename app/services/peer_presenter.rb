class PeerPresenter
  extend Forwardable
  def_delegators :@peer, :sca_name, :modern_name,  :profile_pic, :profile_pic_full, :profile_pic_thumb, :arms, :group, :specialties_link, :peerage_type,
    :specialties?, :elevated_by, :elevation_date, :dependent_name, :superiors, :superiors_link, :dependent_of, :bio, :slug, :order_title, :specialties_on?

  def initialize(peer)
    @peer = peer
  end

  def has_ever_signed_in?
    !!@peer.user.last_sign_in_at 
  end

  def self.for(peer)
    case peer.order
    when :laurel
      LaurelPeerPresenter.new(peer)
    when :pelican
      PelicanPeerPresenter.new(peer)
    end
  end
end

class LaurelPeerPresenter < PeerPresenter
  def peer_div_css
    "laurel-border-left"
  end
end

class PelicanPeerPresenter < PeerPresenter
  def peer_div_css
    "pelican-border-left"
  end
end
