require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RidersApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.time_zone = 'Kolkata'
    config.active_record.default_timezone = :local
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    # use to import old database data to rails database
    # config.middleware.use Rack::MethodOverride
    # config.paperclip_defaults = {
    #   :storage => :s3,
    #   :s3_protocol => ENV['AWS_PROTOCOL'],
    #   :bucket => ENV['AWS_BUCKET'],
    #   :url => ENV['AWS_URL'],
    #   :s3_host_name => ENV['AWS_HOST_NAME'],
    #   :s3_credentials => {
    #     :access_key_id => ENV['AWS_ACCESS_KEY'],
    #     :secret_access_key => ENV['AWS_SECRET_KEY']
    #   }
    # }
    
    # Paperclip.options[:command_path] = "/usr/bin/"

      #SMTP Details   
    # if ENV["SMTP"].present? && ENV["SMTP"]=="1"
    #   config.action_mailer.delivery_method = :smtp
    #   config.action_mailer.smtp_settings = {
    #   address:              ENV["SMTP_ADDRESS"],
    #   port:                 ENV["SMTP_PORT"],
    #   user_name:            ENV["SMTP_USER_NAME"],
    #   password:             ENV["SMTP_PASSWORD"],
    #   authentication:       'plain',
    #   :openssl_verify_mode  => 'none',
    #   enable_starttls_auto: true  }
    # else
       # Amazon SES mail deliver
    #   config.action_mailer.delivery_method = :ses
    # end

    config.api_only = true
    config.autoload_paths += %W(#{config.root}/lib)
    # core_ext has the extended classes of default rails classes
    config.autoload_paths += Dir[File.join(Rails.root, "lib", "*.rb")].each {|l| require l }
    config.api_only = true
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
      allow do
        origins '*'
        resource '*',
          :headers => :any,
          :methods => [:get, :post, :delete, :put, :options, :head, :patch],
          :max_age => 0,
          :expose => ['Token','X-Request-Origin']
      end
    end
  end
end
