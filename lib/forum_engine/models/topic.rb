module ForumEngine
  module Models
    module Topic
      extend ActiveSupport::Concern

      included do
        attr_accessible :title, :forum_id, :posts_attributes

        belongs_to :forum, :counter_cache => true
        has_many :posts, :dependent => :destroy
        
        delegate :user, :user=, :to => :first_post

        validates :title, :forum, :presence => true

        scope :ordered, joins(:posts).group('topics.id').order('posts.created_at DESC')

        accepts_nested_attributes_for :posts
      end

      module InstanceMethods
        # TODO Refactor
        def slug; title.parameterize; end
        def to_param
          "#{id}-#{slug}"
        end
        
        def first_post
          posts.first
        end
      end

      module ClassMethods
      end
    end
  end
end
