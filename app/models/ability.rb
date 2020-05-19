class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :read, :create, :update, to: :take_poll
    alias_action :read, :create, :update, to: :take
    user ||= User.new # guest user (not logged in)

    user.peers.each do |peer| 
      can :manage, :royalty if peer.admin?

      can :take_poll, peer.order
      if peer.admin?
        can :manage, peer.order
      else
        can :read, peer.order
      end
    end
		if user.superuser?
			can :manage, :royalty
			Peer.orders.each do |order|
				can :manage, order
        cannot :read, order if user.peer(order).nil?
			end
		end
   
    if user.royalty?
      can :read, :all
    else
      cannot :read, PollResult
    end 
  end
end
