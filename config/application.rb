require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Azordens
  class Application < Rails::Application
    config.i18n.available_locales = ["pt-BR"]
    config.i18n.default_locale = :"pt-BR"
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
    config.assets.initialize_on_precompile = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
