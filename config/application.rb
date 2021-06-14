require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InternBookingHotel
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**",
      "*.{rb,yml}")]
    config.i18n.available_locales = [:en, :vi]
    config.i18n.default_locale = :en
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.middleware.insert_before 0, Rack::Cors do
      allow do
          origins "*"
          resource "*", headers: :any, :methods => [:get, :post, :options]
      end
    end

    config.to_prepare do
      Devise::SessionsController.layout "layouts/devise/application"
      Devise::RegistrationsController.layout "layouts/devise/application"
    end

    config.autoload_paths += ["#{config.root}/app/serializers"]
  end
end
