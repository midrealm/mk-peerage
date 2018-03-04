class Pelican < Peer
  def self.mailing_list
    ENV['PELICAN_MAILING_LIST']
  end 

  def self.collection
    'pelicanate'
  end

  def self.dependent_name
    'protege'
  end

  def self.image
  end
end
