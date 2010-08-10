module ForumEngine
  module Controllers
    module TopicsController
      extend ActiveSupport::Concern

      included do
        respond_to :html
      end

      module InstanceMethods
      end

      module ClassMethods
      end
    end
  end
end
