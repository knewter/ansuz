ActionController::Routing::Routes.draw do |map|
  map.resources :page_plugins

  # These routes need to be provided by the plugins via engines
  map.resources :content_sections
  map.resources :photo_albums, :has_many => [:photos]

  map.connect 'admin/account/:action/:id', :controller => 'account'
  map.connect 'admin/:action/:id', :controller => 'page_admin'
  # stock rails routes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  # Ansuz route
  map.connect 'pages/*path', :controller => 'page', :action => 'indexer'
end
