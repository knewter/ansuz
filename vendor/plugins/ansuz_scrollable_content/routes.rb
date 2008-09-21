namespace :admin do |admin|
  admin.resources :scrollable_contents, :has_many => [:scrollable_content_sections]
end
