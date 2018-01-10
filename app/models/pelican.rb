class Pelican < Peer
  def url
    Rails.application.routes.url_helpers.pelican_path(slug)
  end


end
