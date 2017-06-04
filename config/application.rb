require_relative "boot"
require "rails/all"

module SampleApp
  class Application < Rails::Application
    Bundler.require *Rails.groups
    Config::Integrations::Rails::Railtie.preload
  end
end
