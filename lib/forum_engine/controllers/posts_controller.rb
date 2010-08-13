module ForumEngine
  module Controllers
    module PostsController
      extend ActiveSupport::Concern

      included do
        respond_to :html
        belongs_to :topic

        include ForumEngine::Controllers::Auth
        before_filter :build_resource, lambda{ resource.user = current_user }, :only => :create # TODO Refactor
        include ForumEngine::Controllers::Paginate
      end

      module InstanceMethods
        def create
          create!{ params[:post][:return_url] || collection_path }
        end

        def update
          update!{ params[:post][:return_url] || collection_path }
        end
      end

      module ClassMethods
      end
    end
  end
end
