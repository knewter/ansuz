ActionController::Routing::Routes.draw do |map|
  map.from_plugin :ansuz_photo_album
  map.from_plugin :ansuz_blog
  map.from_plugin :savage_beast
  map.from_plugin :ansuz_content_section
  map.from_plugin :ansuz_user_manager
  map.from_plugin :ansuz_menu_system

  map.resources :users
  map.resources :tags
  map.namespace :admin do |admin|
    admin.resources :pages, :member => [:shift_order]
    admin.resources :page_plugins
    admin.resources :plugins
    admin.resource  :account
    admin.connect 'account/:action/:id', :controller => 'account'
    admin.resource  :site_settings
    admin.resources :tags
  end
  map.connect '/admin', :controller => 'admin/pages'

  # stock rails routes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  # Ansuz route
  map.connect '/pages/*path', :controller => 'page', :action => 'indexer'
  map.connect '', :controller => 'page', :action => 'indexer', :path => ''
end
