module ForumEngine
  module Models
    module Post
      extend ActiveSupport::Concern

      included do
        attr_accessible :body

        belongs_to :topic, :counter_cache => true
        belongs_to :user, :counter_cache => true

        validates :body, :presence => true
        
        # TODO optimize?
        after_create {|post| ::Forum.increment_counter('posts_count', post.topic.forum.id)}
        after_destroy {|post| ::Forum.decrement_counter('posts_count', post.topic.forum.id)}

        scope :by_topic, lambda{|topic_id| where(:topic_id => topic_id)}
        scope :ordered, order('id ASC')
      end

      module InstanceMethods
      end

      module ClassMethods
      end
    end
  end
end
