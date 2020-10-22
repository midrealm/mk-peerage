class Laurel < Peer
  def self.mailing_list 
    ENV['LAUREL_MAILING_LIST']
  end
  def self.order_title
    "Order of the Laurel"
  end

  def self.collection
    'laurelate'
  end
  
  def self.plural
    'laurels'
  end

  def self.dependent_name
    'apprentice'
  end

  def self.image
    'laurel_leaves.png'
  end

  def self.oath
    "I here swear fealty and service<br/>\n"\
    "To the Crown of the Middle Kingdom.<br/>\n"\
    "To ever enrich the Crown.<br/>\n"\
    "With my talents and abilities.<br/>\n"\
    "To promote the diverse arts,<br/>\n"\
    "To continue the instruction of my dependents,<br/>\n"\
    "To increase the glory of the Middle Kingdom,<br/>\n"\
    "And to be worthy of the Wreath I wear...<br/>\n"\
    "thus swear I, [ Name ].<br/>\n".html_safe
  end
  def self.order_secretary
    Laurel.find_by(admin: true)
  end
end
