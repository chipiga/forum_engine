module ForumEngine
  module Models
    module Post
      extend ActiveSupport::Concern

      included do
        attr_accessible :body

        belongs_to :topic, :counter_cache => true
        belongs_to :user, :counter_cache => true

        validates :body, :presence => true

        scope :ordered, order('id ASC')
      end

      module InstanceMethods
        # TODO remove topic if post is first
      end

      module ClassMethods
      end
    end
  end
end
