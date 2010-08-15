module ForumEngine
  module Controllers
    module ForumsController
      extend ActiveSupport::Concern

      included do
        respond_to :html
        actions :all, :except => :show

        include ForumEngine::Controllers::Auth
        include ForumEngine::Controllers::Slug
      end

      module InstanceMethods
      end

      module ClassMethods
      end
    end
  end
end
