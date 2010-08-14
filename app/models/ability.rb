class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    
    can :read, [Forum, Topic, Post] #, :state => 'public'
    if user.roles?(:admin)
      can :manage, :all
    else
      if user.roles?(:user)
        can :create, Post, Topic
        can [:update, :destroy], [Post, Topic], :user_id => user.id
      end
      if user.roles?(:moderator)
        can [:read, :update, :destroy], [Forum, Topic, Post]
      end
    end
  end
end
