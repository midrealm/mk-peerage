class Chivalry < Peer
  def self.mailing_list
    ENV['CHIVALRY_MAILING_LIST']
  end 
  def self.order_title
    "Order of the Chivalry"
  end

  def self.collection
    'chivlary'
  end

  def self.plural
    'knights'
  end
  def self.dependent_name
    'squire'
  end

  def self.image
    'chivalry.png'
  end

  def self.oath
    "I here swear fealty and do homage<br/>\n"\
    "to the Crown of the Middle Kingdom:<br/>\n"\
    "To ever be a good knight and true,<br/>\n"\
    "Reverent and generous,<br/>\n"\
    "Shield of the weak,<br/>\n"\
    "Obedient to my liege-lord,<br/>\n"\
    "Foremost in battle,<br/>\n"\
    "Courteous at all times,<br/>\n"\
    "Champion of the right and the good.<br/>\n"\
    "Thus swear I, Sir/Master <<Name>>.".html_safe
  end

  def self.order_secretary
    Chivalry.find_by(admin: true)
  end

  def self.specialties_on?
    false
  end
end
