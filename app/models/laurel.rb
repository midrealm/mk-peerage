class Laurel < Peer
  def url
    Rails.application.routes.url_helpers.peer_path('laurel',slug)
  end


end
