class AnsuzThemesController < ApplicationController
  unloadable # This is required if you subclass a controller provided by the base rails app

  before_filter :load_ansuz_themes, :only => [:index]

  protected
  def load_ansuz_themes
    @ansuz_themes = Ansuz::JAdams::AnsuzTheme.find(:all)
  end

  public

  def index
    respond_to do |format|
      format.xml{ render }
    end
  end
end
