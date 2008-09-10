ActionController::Routing::Routes.draw do |map|
  map.resources :photo_albums, :has_many => [:photos]
end
