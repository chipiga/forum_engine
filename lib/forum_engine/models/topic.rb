module ForumEngine
  module Models
    module Topic
      extend ActiveSupport::Concern

      included do
        attr_accessible :title, :posts_attributes

        belongs_to :forum, :counter_cache => true
        has_many :posts, :dependent => :destroy

        delegate :user, :user=, :to => :first_post

        validates :title, :presence => true

        scope :by_forum, lambda{|forum_id| where(:forum_id => forum_id)}
        scope :priority, order('priority DESC')
        scope :activity, joins(:posts).group('topics.id').order('posts.created_at DESC')
        scope :ordered, priority.activity # TODO not working with sqlite

        accepts_nested_attributes_for :posts
      end

      module InstanceMethods
        # TODO Refactor
        def slug; title.parameterize; end
        def to_param
          "#{id}-#{slug}"
        end

        def first_post
          @first_post ||= posts.first
        end

        def last_post
          @last_post ||= posts.ordered.last
        end
      end

      module ClassMethods
      end
    end
  end
end
