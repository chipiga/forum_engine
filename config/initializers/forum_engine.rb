require 'forum_engine'

# TODO remove?
# Rails Monkey Patch to force count work with group
module ActiveRecord
  class Relation
    def empty?
      # loaded? ? @records.empty? : count.zero?
      loaded? ? @records.empty? : count.blank?
    end
  end
end

