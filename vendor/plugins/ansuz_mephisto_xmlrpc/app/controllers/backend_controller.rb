require_dependency 'meta_weblog_api'
require_dependency 'blogger_api'
require_dependency 'movable_type_api'

class BackendController < ApplicationController
  unloadable

  session :off

  web_service_dispatching_mode :layered
  web_service(:metaWeblog) { MetaWeblogService.new(self)  }
  web_service(:mt)         { MovableTypeService.new(self) }
  web_service(:blogger)    { BloggerService.new(self) }

  alias xmlrpc api
  
  #cache_sweeper :article_sweeper, :assigned_section_sweeper, :comment_sweeper
end
