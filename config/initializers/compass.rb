require 'compass'
require 'compass/app_integration/rails'
Compass::AppIntegration::Rails.initialize!

Haml::Template.options[:format] = :html5
Sass::Plugin.options[:template_location] = { 'app/stylesheets' => 'public/stylesheets' }
