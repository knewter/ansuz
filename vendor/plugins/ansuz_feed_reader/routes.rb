namespace :admin do |admin|
  admin.resources :feed_readers
end
resources :feed_readers, :collection => [:get_feed]
