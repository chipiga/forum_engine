# Redirect to correct slug if needed
module ForumEngine
  module Controllers
    module Slug
      extend ActiveSupport::Concern

      # TODO Refactor
      included do
        before_filter lambda{ redirect_to resource, :status => :moved_permanently unless "#{resource.id}-#{resource.slug}" == params[:id] }, :only => :show
      end
    end
  end
end
