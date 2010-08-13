module ForumEngine
  module Models
    module Forum
      extend ActiveSupport::Concern

      # TODO posts_count
      included do
        attr_accessible :name, :description, :state

        has_many :topics, :dependent => :destroy

        validates :name, :description, :state, :presence => true
        
        scope :ordered, order('id ASC')
      end

      module InstanceMethods
        # TODO Refactor
        def slug; name.parameterize; end
        def to_param
          "#{id}-#{slug}"
        end
      end

      module ClassMethods
      end
    end
  end
end
