class HonorRollPresenter
  def initialize(peerage)
    @peerage = peerage
  end
  def active_peers
    peers(active: true) 
  end
  def inactive_peers
    peers(active: false) 
  end

  def order_title
  end
  def page_title
  end
  def css_class
  end

  def self.for(peerage)
    case peerage
    when :laurel
      HonorRollLaurelsPresenter.new(peerage)
    when :pelican
      HonorRollPelicansPresenter.new(peerage)
    end
  end
  private
  def peers(active:)
    Peer.where_order(@peerage).where(active: active).joins(:user).order(:sca_name).map{|p| HonorRollPeerPresenter.for(p)}
  end
end

class HonorRollPelicansPresenter < HonorRollPresenter
  def order_title
    "Masters and Mistresses of the Pelican"
  end
  def page_title
    "Pelican Roll of Honor"
  end
  def css_class
    "pelican-plate"
  end
end

class HonorRollLaurelsPresenter < HonorRollPresenter
  def order_title
    "Masters and Mistresses of the Laurel"
  end
  def page_title
    "Laurel Roll of Honor"
  end
  def css_class
    "laurel-plate"
  end
end

class HonorRollPeerPresenter
  extend Forwardable
  def_delegators :@peer, :sca_name, :slug, :vigilant?, :deceased, :specialties?
  def initialize(peer)
    @peer = peer
  end

  def self.for(peer)
    case peer.order
    when (:laurel)
      HonorRollLaurelPresenter.new(peer)
    else
      HonorRollPeerPresenter.new(peer)
    end
  end
end

class HonorRollLaurelPresenter < HonorRollPeerPresenter
  def sca_name
    name = @peer.sca_name
    name = "#{@peer.sca_name} (#{@peer.specialties_sentence})" if @peer.specialties?
    name
  end
end
