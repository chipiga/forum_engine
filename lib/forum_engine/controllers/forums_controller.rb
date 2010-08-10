module ForumEngine
  module Controllers
    module ForumsController
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
