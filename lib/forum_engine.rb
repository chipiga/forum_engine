module ForumEngine
  module Models
    extend ActiveSupport::Autoload

    autoload :Forum
    autoload :Topic
    autoload :Post
  end

  module Controllers
    extend ActiveSupport::Autoload

    autoload :ForumsController
    autoload :TopicsController
    autoload :PostsController
  end

  module Helpers
    extend ActiveSupport::Autoload

    autoload :ForumsHelper
    autoload :TopicsHelper
    autoload :PostsHelper
  end

  class Engine < Rails::Engine
    # paths.app.views = 'app/views/forum'
  end
end
