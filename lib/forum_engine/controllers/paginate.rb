# For will_paginate collection paginator
module ForumEngine
  module Controllers
    module Paginate
      extend ActiveSupport::Concern

      module InstanceMethods
        protected

        def collection
          instance_eval("@#{resource_collection_name} ||= end_of_association_chain.accessible_by(current_ability).ordered.paginate(:page => params[:page], :per_page => ForumEngine.per_page)")
        end
      end
    end
  end
end
