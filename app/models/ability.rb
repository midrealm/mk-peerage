class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :read, :create, :update, to: :take_poll
    alias_action :read, :create, :update, to: :take
    user ||= User.new # guest user (not logged in)

    user.peers.each do |peer| 
      can :manage, :royalty if peer.admin?
      case peer.type
      when 'Laurel'
        can :take_poll, :laurel 
        if peer.admin?
          can :manage, :laurel
        else
          can :read, :laurel
        end
      when 'Pelican'
        can :take_poll, :pelican 
        if peer.admin?
          can :manage, :pelican
        else
          can :read, :pelican
        end
      end
    end
   
    if user.royalty?
      can :read, :all
    else
      cannot :read, PollResult
    end 
  end
end
