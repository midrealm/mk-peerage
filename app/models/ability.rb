class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :read, :create, :update, to: :take
    user ||= User.new # guest user (not logged in)
    can :manage, :all
#    if user.admin?
#      can :manage, :all
#    elsif user.laurel?
#      can :take, Poll    
#    else
#      can :read, :all
#    end
   
    if user.royalty?
      can :read, PollResult
    else
      cannot :read, PollResult
    end 
  end
end
