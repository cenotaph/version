require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Version
  class Application < Rails::Application

    config.i18n.fallbacks = true
    # JavaScript files you want as :defaults (application.js is always included).
    # config.action_view.javascript_expansions[:defaults] = %w(jquery )

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"
    config.assets.enabled = true
    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]
    config.generators do |g|
      g.template_engine :haml
    end
    
  end
end
