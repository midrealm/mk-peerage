class Laurel < Peer
  def url
    Rails.application.routes.url_helpers.laurel_path(slug)
  end

  def peerage
    'laurel'
  end

end
