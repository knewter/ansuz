# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

# This is required for ansuz, for now.  It allows me to 
# monkeypatch rails to work with extensions on classes
# inside modules.  I'm fixing bug: http://dev.rubyonrails.org/attachment/ticket/6450/modulized_extensions_with_tests_update.diff
# FIXME: Once that bug is fixed this can all go away. -ja
# It has to be in every environment.
require 'isotope11/active_record_extensions'
