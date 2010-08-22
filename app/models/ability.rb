class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :read, [Forum, Topic, Post] #, :state => 'public'
    if user.roles?(:admin)
      can :manage, :all
    else
      if user.roles?(:user)
        can :create, Topic
        can :create, Post do |post, topic| # Disable post to closed topics
          topic.try(:state) == 'open' # TODO Nil! Fix this!
        end
        can [:update, :destroy], Post, :user_id => user.id
        can :update, Topic do |topic|
          topic.user == user
        end
      end
      if user.roles?(:moderator)
        can [:read, :update, :destroy], [Forum, Topic, Post]
      end
    end
    cannot :destroy, Post do |post| # Disable destroy first post in topic
      post.topic.posts.first == post # TODO Nil! Fix this!
    end
  end
end
