class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :read, :create, :update, to: :take
    user ||= User.new # guest user (not logged in)
      if user.admin?
        #can :manage, :laurel
      elsif user.peer?
        can :take, Poll    
      else
        can :read, :all
      end
    user.peers.each do |peer| 
      can :manage, :royalty if peer.admin?
      case peer.type
      when 'Laurel'
        if peer.admin?
          can :manage, :laurel
        else
          can :read, :laurel
        end
      when 'Pelican'
        if peer.admin?
          can :manage, :pelican
        else
          can :read, :pelican
        end
      end
    end
   
    if user.royalty?
      can :read, PollResult
    else
      cannot :read, PollResult
    end 
  end
end
