class UserAdder
  attr_reader :user, :id, :sca_name, :email, :vigilant, :peerage
  def initialize(id: nil, sca_name: '', email: '', vigilant: true, peerage:) 
    vigilant = true if vigilant.nil? 
    @id = id
    @sca_name = sca_name
    @email = email
    @vigilant = vigilant
    @peerage = peerage
    @user = nil
  end

  def add
    if(id.nil? and (sca_name.blank? or email.blank?))
      raise ArgumentError.new("need id or both sca_name and email") 
    end
    @user = User.find_or_initialize_by(id: @id)
    if @user.id.nil?
      pwd = Devise.friendly_token.first(8)  
      @user.password = pwd 
      @user.assign_attributes(sca_name: @sca_name, email: @email)
    end
    if @user.save and @user.peer(@peerage).nil?
      Peer.subclass(@peerage).create(user: @user, active: true, vigilant: @vigilant) 
      return true
    else
      return false
    end
  end
  
  def send_email
    if @user.nil?
      raise ArgumentError.new("must add user first")
    end
    if @user.peers.count == 1
      @user.send_reset_password_instructions
    else
      PeerageMailer.add_to_peerage(@user,peerage).deliver
    end
  end 
  private
end
