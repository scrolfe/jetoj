class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :manage, Post
      can :manage, Medium
      can :manage, Performer
      can :manage, Event
      can :update, User, user_id: user.id
    end
  end
end
