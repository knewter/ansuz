namespace :admin do |admin|
  admin.resources :ansuz_themes
end
resources :ansuz_themes, :collection => [:fetch_theme_preview]
