class Admin::AnsuzPluginsController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app

  layout 'admin'
  before_filter :load_ansuz_plugin,     :only => [:show, :edit, :update, :destroy]
  before_filter :load_new_ansuz_plugin, :only => [:new, :create]
  before_filter :load_ansuz_plugins,    :only => [:index]

  protected
  def load_ansuz_plugin
    @ansuz_plugin = Ansuz::JAdams::AnsuzPlugin.find(params[:id])
  end

  def load_new_ansuz_plugin
    @ansuz_plugin = Ansuz::JAdams::AnsuzPlugin.new(params[:ansuz_plugin])
  end

  def load_ansuz_plugins
    @ansuz_plugins = Ansuz::JAdams::AnsuzPlugin.find(:all, :order => 'name DESC')
  end
  public
  def new
  end

  def create
    if @ansuz_plugin.save
      flash[:notice] = "Ansuz Plugin was created successfully."
      redirect_to admin_ansuz_plugins_path
    else
      flash.now[:error] = "There was a problem creating the ansuz plugin."
      render :action => 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ansuz_plugin.update_attributes(params[:ansuz_plugin])
      flash[:notice] = "Ansuz Plugin has been updated."
      redirect_to admin_ansuz_plugins_path
    else
      flash.now[:error] = "There was a problem updating the Ansuz Plugin.  Please try again."
      render :action => 'edit'
    end
  end

  def destroy
    @ansuz_plugin.destroy
    flash[:notice] = "Ansuz Plugin was deleted."
    redirect_to admin_ansuz_plugins_path
  end
end
