ActionController::Routing::Routes.draw do |map|
  map.from_plugin :savage_beast
  map.from_plugin :ansuz_content_section
  map.from_plugin :ansuz_photo_album
  map.from_plugin :ansuz_blog
  map.resources :page_plugins
  map.resources :users

  map.connect 'admin/account/:action/:id', :controller => 'account'
  map.connect 'admin/:action/:id', :controller => 'page_admin'
  # stock rails routes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  # Ansuz route
  map.connect 'pages/*path', :controller => 'page', :action => 'indexer'
  map.connect '', :controller => 'page', :action => 'indexer', :path => ''
end
