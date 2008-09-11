ActionController::Routing::Routes.draw do |map|
  map.from_plugin :ansuz_photo_album
  map.from_plugin :ansuz_blog
  map.from_plugin :savage_beast
  map.from_plugin :ansuz_content_section

  map.resources :users
  map.resources :page_plugins
  map.namespace :admin do |admin|
    admin.resources :pages
  end

  map.connect 'admin/account/:action/:id', :controller => 'account'
  map.connect 'admin/:action/:id', :controller => 'admin/pages'

  # stock rails routes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  # Ansuz route
  map.connect 'pages/*path', :controller => 'page', :action => 'indexer'
  map.connect '', :controller => 'page', :action => 'indexer', :path => ''
end
