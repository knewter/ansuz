# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
if( Rails::VERSION::STRING =~ /2\.2\.\d/ )
  config.cache_classes = true
else
  config.action_view.cache_template_loading            = true
end

# Use a different cache store in production
# config.cache_store = :mem_cache_store

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false

# This is required for ansuz, for now.  It allows me to 
# monkeypatch rails to work with extensions on classes
# inside modules.  I'm fixing bug: http://dev.rubyonrails.org/attachment/ticket/6450/modulized_extensions_with_tests_update.diff
# FIXME: Once that bug is fixed this can all go away. -ja
# It has to be in every environment.
require 'isotope11/active_record_extensions'
require 'ansuz/setup_admin_menu_entries'
