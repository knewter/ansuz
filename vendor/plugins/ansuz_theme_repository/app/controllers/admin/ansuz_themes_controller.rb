class Admin::AnsuzThemesController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app

  layout 'admin'
  before_filter :load_ansuz_theme,     :only => [:show, :edit, :update]
  before_filter :load_new_ansuz_theme, :only => [:new, :create]
  before_filter :load_ansuz_themes,    :only => [:index]

  protected
  def load_ansuz_theme
    @ansuz_theme = Ansuz::JAdams::AnsuzTheme.find(params[:id])
  end

  def load_new_ansuz_theme
    @ansuz_theme = Ansuz::JAdams::AnsuzTheme.new(params[:ansuz_theme])
  end

  def load_ansuz_themes
    @ansuz_themes = Ansuz::JAdams::AnsuzTheme.find(:all, :order => 'name DESC')
  end
  public
  def new
  end

  def create
    if @ansuz_theme.save
      flash[:notice] = "Ansuz Theme was created successfully."
      redirect_to admin_ansuz_themes_path
    else
      flash.now[:error] = "There was a problem creating the ansuz theme."
      render :action => 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ansuz_theme.update_attributes(params[:ansuz_theme])
      flash[:notice] = "Ansuz Theme has been updated."
      redirect_to admin_ansuz_themes_path
    else
      flash.now[:error] = "There was a problem updating the Ansuz Theme.  Please try again."
      render :action => 'edit'
    end
  end

  def destroy
    @ansuz_theme.destroy
    flash[:notice] = "Ansuz Theme was deleted."
    redirect_to admin_ansuz_themes_path
  end
end
