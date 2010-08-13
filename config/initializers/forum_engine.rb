require 'forum_engine'

# Rails Monkey Patch
module ActiveRecord
  class Relation
    def empty?
      # loaded? ? @records.empty? : count.zero?
      loaded? ? @records.empty? : count.blank?
    end
  end
end

