class Laurel < Peer
  def url
    Rails.application.routes.url_helpers.laurel_path(slug)
  end

  def peerage_type
    'laurel'
  end

  def peerage_name
    'Laurel'
  end

end
