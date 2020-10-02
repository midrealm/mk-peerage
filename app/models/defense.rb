class Defense < Peer
  def self.mailing_list
    ENV['MOD_MAILING_LIST']
  end 
  def self.order_title
    "Order of Defense"
  end

  def self.collection
    'defenders'
  end

  def self.dependent_name
    'provost'
  end

  def self.image
    'mod.png'
  end

  def self.oath
    "I here swear fealty and do homage<br/>\n"\
    "To the Crown of the Middle Kingdom<br/>\n"\
    "To ever stand in its defense<br/>\n"\
    "Facing my foes with courage and honor<br/>\n"\
    "Protecting the Innocent<br/>\n"\
    "Mindful of mercy<br/>\n"\
    "Obedient to my Liege Lord<br/>\n"\
    "Guardian of the just and right<br/>\n"\
    "Thus swear I, [ Name ].".html_safe
  end

  def self.order_secretary
    Defense.find_by(admin: true)
  end

  def self.specialties_on?
    false
  end
end
