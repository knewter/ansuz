namespace :admin do |admin|
  admin.resources :ansuz_plugin_installers, :collection => [:install, :update, :delete, :enable, :disable]
end
