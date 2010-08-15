module ForumEngine
  module Controllers
    module PostsController
      extend ActiveSupport::Concern

      included do
        respond_to :html
        actions :all, :except => :show
        has_scope :by_topic, :only => :index, :as => :id
        belongs_to :topic, :optional => true

        include ForumEngine::Controllers::Auth
        before_filter lambda{ build_resource; resource.user = current_user }, :only => :create # TODO Refactor
        before_filter :build_resource, lambda{ @topic = Topic.find(params[:id]) if params[:id] }, :only => :index
        include ForumEngine::Controllers::Paginate
      end

      module InstanceMethods
        # TODO calc link to last post
        def create
          create!{ request.env["HTTP_REFERER"] || collection_path } # TODO add anchor "##{id}"
        end

        def update
          update!{ collection_path }
        end

        def destroy
          destroy!{ request.env["HTTP_REFERER"] || collection_path }
        end
      end

      module ClassMethods
      end
    end
  end
end
