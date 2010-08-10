module ForumEngine
  module Models
    module Post
      extend ActiveSupport::Concern

      included do
        belongs_to :topic, :counter_cache => true
        belongs_to :user
      end

      module InstanceMethods
      end

      module ClassMethods
      end
    end
  end
end
