require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jooktube
  # Base application class.
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified
    # here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Make public assets requireable in manifest files
    config.assets.paths << Rails.root.join('public', 'assets', 'stylesheets')
    config.assets.paths << Rails.root.join('public', 'assets', 'javascripts')
  end
end
