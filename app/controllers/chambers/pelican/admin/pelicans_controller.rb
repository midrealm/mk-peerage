class Chambers::Pelican::Admin::PelicansController < Chambers::Admin::PeersController
  private
  def peerage
    :pelican
  end
end
