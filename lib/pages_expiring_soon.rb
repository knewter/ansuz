# Call me from a cron job/scheduled task.
# e.g. /path/to/script/runner.rb /path/to/this/file.rb RAILS_ENV=production
Page.expires_soon.each do |page|
  AnsuzMailer.deliver_page_expiring_soon_notification( page )
end
