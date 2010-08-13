module ForumEngine
  mattr_accessor :per_page
  @@per_page = 20

  module Models
    extend ActiveSupport::Autoload

    autoload :Forum
    autoload :Topic
    autoload :Post
  end

  module Controllers
    extend ActiveSupport::Autoload

    autoload :Auth
    autoload :Paginate
    autoload :Slug
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
