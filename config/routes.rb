ActionController::Routing::Routes.draw do |map|
  map.from_plugin :ansuz_photo_album
  map.from_plugin :ansuz_blog
  map.from_plugin :ansuz_savage_beast
  map.from_plugin :ansuz_content_section
  map.from_plugin :ansuz_user_manager
  map.from_plugin :ansuz_menu_system
  map.from_plugin :ansuz_theme_repository
  map.from_plugin :ansuz_theme_installer
  map.from_plugin :ansuz_scrollable_content
  map.from_plugin :ansuz_testimonials

  map.resources :tags
  map.resources :users

  # <admin routes>
  map.namespace :admin do |admin|
    admin.resources :pages, :member => [:shift_order], :has_one => [:page_metadata]
    admin.resources :page_plugins
    admin.resources :plugins
    admin.resources :tags
    admin.resources :roles
    admin.resource  :account
    admin.resource  :site_settings, :collection => [:fetch_theme_preview, :choose_theme]
    admin.connect   'account/:action/:id', :controller => 'account'
  end
  map.connect '/admin', :controller => 'admin/pages' # admin root
  # </admin routes>

  # stock rails routes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  # Ansuz route
  map.connect '/pages/*path', :controller => 'page', :action => 'indexer'
  map.connect '', :controller => 'page', :action => 'indexer', :path => ''
end
