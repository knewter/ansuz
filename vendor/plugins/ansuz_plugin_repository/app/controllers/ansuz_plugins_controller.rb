class AnsuzPluginsController < ApplicationController
  unloadable # This is required if you subclass a controller provided by the base rails app
  include PluginManagementHelper

  before_filter :load_ansuz_plugins, :only => [:index]

  protected
  def load_ansuz_plugins
    @ansuz_plugins = Ansuz::JAdams::AnsuzPlugin.find(:all)
  end

  public

  def index
    respond_to do |format|
      format.xml{ render }
    end
  end
end
