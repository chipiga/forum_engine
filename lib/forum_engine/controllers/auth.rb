# Authentication & Authorization
module ForumEngine
  module Controllers
    module Auth
      extend ActiveSupport::Concern

      included do
        before_filter :authenticate_user!, :except => [:index, :show]
        authorize_resource
      end
    end
  end
end
