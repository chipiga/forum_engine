module ForumEngine
  module Controllers
    module TopicsController
      extend ActiveSupport::Concern

      included do
        respond_to :html

        include ForumEngine::Controllers::Auth
        # before_filter :build_resource, lambda{ params['topic']['posts_attributes']['0']['user_id'] = current_user.id; resource.state = 'open' }, :only => :create
        before_filter lambda{ build_resource; resource.user = current_user; resource.state = 'open' }, :only => :create # TODO Refactor
        before_filter :build_resource, lambda{ resource.posts.build }, :only => :new
        include ForumEngine::Controllers::Slug
        include ForumEngine::Controllers::Paginate
      end

      module InstanceMethods
      end

      module ClassMethods
      end
    end
  end
end
