module ForumEngine
  module Controllers
    module PostsController
      extend ActiveSupport::Concern

      included do
        respond_to :html
        actions :all, :except => :show
        has_scope :by_topic, :only => :index, :as => :id
        belongs_to :topic, :optional => true

        include ForumEngine::Helpers::PostsHelper
        include ForumEngine::Controllers::Auth
        before_filter lambda{ build_resource; resource.user = current_user }, :only => :create # TODO Refactor
        before_filter :build_resource, lambda{ @topic = Topic.find(params[:id]) if params[:id] }, :only => :index
        after_filter lambda{ ::Topic.increment_counter('views_count', @topic.id) if @topic }, :only => :index
        include ForumEngine::Controllers::Paginate
      end

      module InstanceMethods
        def create
          create!{ collection_link(resource) }
        end

        def update
          update!{ collection_link(resource) }
        end

        def destroy
          destroy!{ collection_link }
        end
      end

      module ClassMethods
      end
    end
  end
end
