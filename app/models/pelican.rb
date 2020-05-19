class Pelican < Peer
  def self.mailing_list
    ENV['PELICAN_MAILING_LIST']
  end 
  def self.order_title
    "Order of the Pelican"
  end

  def self.collection
    'pelicanate'
  end

  def self.dependent_name
    'protégé'
  end

  def self.image
    'pelican.png'
  end

  def self.oath
    "I here swear fealty and do homage<br/>\n"\
    "To the Crown of the Middle Kingdom<br/>\n"\
    "To serve the Crown in all things<br/>\n"\
    "To remember courtesy and kindness<br/>\n"\
    "To prize justice above personal gain<br/>\n"\
    "To labor for the common good<br/>\n"\
    "To enrich the Kingdom and the Society<br/>\n"\
    "So they may flourish and grow<br/>\n"\
    "And to be worthy of the title of Pelican.<br/>\n"\
    "Here by my honor, my hand<br/>\n"\
    "and my heart swear I, [ Name ].".html_safe
  end

  def self.order_secretary
    Pelican.find_by(admin: true)
  end

  def self.specialties_on?
    false
  end
end
