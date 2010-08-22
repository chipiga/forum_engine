module ForumEngine
  module Helpers
    module PostsHelper
      extend ActiveSupport::Concern

      included do
      end

      module InstanceMethods
        def collection_link(post = nil)
          post ||= Post.where(:topic_id => resource.topic_id).last
          page = (Post.where("topic_id = ? AND id <= ?", post.topic_id, post.id).count.to_f / ForumEngine.per_page).ceil
          posts_collection_path(post.topic, :page => page, :anchor => post.id)
        end
      end

      module ClassMethods
      end
    end
  end
end
