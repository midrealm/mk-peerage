class Mark < Peer
  def self.mailing_list
    ENV['MARK_MAILING_LIST']
  end 

  def self.order_title
    "Order of the Mark"
  end

  def self.collection
    'hunters'
  end

  def self.plural
    'hunters'
  end

  def self.singular
    'hunter'
  end

  def self.dependent_name
    'esperant'
  end

  def self.image
    'mark_badge.png'
  end

  def self.oath
    "I here swear fealty and do homage<br/>\n"\
    "To the Crown of the Middle Kingdom<br/>\n"\
    "To ever be a worthy Hunter of the Mark<br/>\n"\
    "Patient in pursuit<br/>\n"\
    "Measured in judgment<br/>\n"\
    "Obedient to my Liege Lord<br/>\n"\
    "A steadfast missileer<br/>\n"\
    "Ever ready with bow, blade, or engine<br/>\n"\
    "Watchful of the realm's far borders<br/>\n"\
    "Thus swear I, [ Name ].".html_safe
  end

  def self.order_secretary
    Mark.find_by(admin: true)
  end

  def self.specialties_on?
    false
  end
end
