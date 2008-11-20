# Settings specified here will take precedence over those in config/environment.rb

# The test environment is used exclusively to run your application's
# test suite.  You never need to work with it otherwise.  Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs.  Don't rely on the data there!
config.cache_classes = true

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false

# Disable request forgery protection in test environment
config.action_controller.allow_forgery_protection    = false

# Tell Action Mailer not to deliver emails to the real world.
# The :test delivery method accumulates sent emails in the
# ActionMailer::Base.deliveries array.
config.action_mailer.delivery_method = :test

# This is required for ansuz, for now.  It allows me to 
# monkeypatch rails to work with extensions on classes
# inside modules.  I'm fixing bug: http://dev.rubyonrails.org/attachment/ticket/6450/modulized_extensions_with_tests_update.diff
# FIXME: Once that bug is fixed this can all go away. -ja
# It has to be in every environment.
require 'isotope11/active_record_extensions'
require 'ansuz/setup_admin_menu_entries'
