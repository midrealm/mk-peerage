class Pelican < Peer
  def url
    Rails.application.routes.url_helpers.pelican_path(slug)
  end

  def peerage_type
    'pelican'
  end

  def peerage_name
    'Pelican'
  end

end
