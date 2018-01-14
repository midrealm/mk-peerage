class Pelican < Peer
  def url
    Rails.application.routes.url_helpers.peer_path('pelican',slug)
  end


end
