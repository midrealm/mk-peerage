class PeerageParamHandler
  attr_reader :peerage
  def initialize(peerage=nil)
    @peerage = get_symbol(peerage)
  end
  private
  def get_symbol(peerage)
    if !peerage.nil? and Peer.orders.include?(peerage.to_sym)
      peerage.to_sym   
    end 
  end 
end
