namespace :admin do |admin|
  admin.resources :ansuz_theme_installers, :collection => [:install, :update, :delete]
end
