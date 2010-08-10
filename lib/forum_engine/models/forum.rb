module ForumEngine
  module Models
    module Forum
      extend ActiveSupport::Concern

      # TODO posts_count
      included do
        has_many :topics
      end

      module InstanceMethods
      end

      module ClassMethods
      end
    end
  end
end
