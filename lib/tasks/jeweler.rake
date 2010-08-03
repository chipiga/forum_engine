begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "forum_engine"
    gem.summary = %Q{Forum engine based on Rails 3}
    gem.description = %Q{Forum engine built on Rails 3 which can work standalone and easy embed into other projects}
    gem.email = "pavel.chipiga@gmail.com"
    gem.homepage = "http://github.com/chipiga/forum_engine"
    gem.authors = ["Pavel Chipiga"]
    # gem.add_development_dependency "rspec", ">= 1.2.9"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
