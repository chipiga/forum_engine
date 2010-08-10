module ForumEngine
  module Models
    module Topic
      extend ActiveSupport::Concern

      included do
        belongs_to :forum, :counter_cache => true
        has_many :posts
      end

      module InstanceMethods
      end

      module ClassMethods
      end
    end
  end
end
