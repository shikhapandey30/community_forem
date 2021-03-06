require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'will_paginate/array'
require "active_merchant"
require "pry"
account_sid = 'AC6ed1ef793a411dd07d2cfa533eedb30e'
auth_token = 'a8472a48e49f9be22527e93d2cf147ba'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# ENV['RAILS_ADMIN_THEME'] = 'flatly_theme'

module CommunityForem
  class Application < Rails::Application
    config.exceptions_app = self.routes
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
   
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
