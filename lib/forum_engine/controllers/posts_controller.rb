module ForumEngine
  module Controllers
    module PostsController
      extend ActiveSupport::Concern

      included do
        actions :all, :except => [:show, :index] #:new, :edit, :create, :update, :destroy
        respond_to :html
        belongs_to :topic

        include ForumEngine::Controllers::Auth
        before_filter :build_resource, lambda{ resource.user = current_user }, :only => :create # TODO Refactor
        include ForumEngine::Controllers::Paginate
      end

      module InstanceMethods
        def create
          # create!{ request.env["HTTP_REFERER"] || params[:post][:return_url] || collection_path }
          create!{ request.env["HTTP_REFERER"] || collection_path } # TODO add anchor "##{id}"
        end

        def update
          # update!{ params[:post][:return_url] || collection_path }
          update!{ collection_path }
        end

        # TODO how to pass return_url ?
        def destroy
          # destroy!{ request.env["HTTP_REFERER"] || params[:post][:return_url] || collection_path }
          destroy!{ request.env["HTTP_REFERER"] || collection_path }
        end
      end

      module ClassMethods
      end
    end
  end
end
