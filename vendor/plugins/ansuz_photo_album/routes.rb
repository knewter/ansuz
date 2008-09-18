namespace :admin do |admin|
  admin.resources :photo_albums, :has_many => [:photos]
end
