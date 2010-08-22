module ForumEngine
  module Controllers
    module TopicsController
      extend ActiveSupport::Concern

      included do
        respond_to :html
        actions :all, :except => :show
        has_scope :by_forum, :only => :index, :as => :id
        belongs_to :forum, :optional => true

        include ForumEngine::Controllers::Auth
        # before_filter :build_resource, lambda{ params['topic']['posts_attributes']['0']['user_id'] = current_user.id; resource.state = 'open' }, :only => :create
        before_filter lambda{ build_resource; resource.user = current_user }, :only => :create # TODO Refactor # ; resource.state = 'open'
        before_filter lambda{ build_resource; resource.posts.build }, :only => :new # before_filter :build_resource, lambda{ resource.posts.build }, :only => :new
        before_filter :build_resource, lambda{ @forum = Forum.find(params[:id]) if params[:id] }, :only => :index
        include ForumEngine::Controllers::Slug
        include ForumEngine::Controllers::Paginate
      end

      module InstanceMethods
        def create
          create!{ topic_path(resource) }
        end
      end

      module ClassMethods
      end
    end
  end
end
