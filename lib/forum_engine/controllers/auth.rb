# Authentication & Authorization
module ForumEngine
  module Controllers
    module Auth
      extend ActiveSupport::Concern

      included do
        before_filter :authenticate_user!, :except => [:index, :show]
        load_and_authorize_resource :except => [:create, :destroy] # TODO redo this gap!
        # authorize_resource
      end
    end
  end
end
