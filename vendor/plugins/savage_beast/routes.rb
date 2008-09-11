resources :posts, :name_prefix => 'all_', :collection => { :search => :get }
resources :forums, :topics, :posts, :monitorship

%w(forum).each do |attr|
  resources :posts, :name_prefix => "#{attr}_", :path_prefix => "/#{attr.pluralize}/:#{attr}_id"
end

resources :forums do |forum|
  forum.resources :topics do |topic|
    topic.resources :posts
    topic.resource :monitorship, :controller => :monitorships
  end
end
