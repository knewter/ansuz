namespace :admin do |admin|
  admin.resources :content_sections, :member => [:rollback, :get_dropdown]
end
