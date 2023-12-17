# config/application.rb

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module YourAppName
  class Application < Rails::Application
    # Egyéb konfigurációk...

    config.action_controller.per_form_csrf_tokens = true

    # Egyéb konfigurációk...
  end
end
