class Admin::ContentSectionsController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app
  layout 'admin'
  before_filter :load_admin_plugin_nav
  before_filter :load_content_section, :only => [:show, :edit, :update, :rollback, :get_dropdown]
  helper :content_section
  
  protected
  # This method duplicated from admin/base_controller
  def load_admin_plugin_nav
    # The plugin nav comes across as an array of arrays like [text, url]
    @admin_plugin_nav = Ansuz::PluginManagerInstance.admin_plugin_nav
  end
  
  def load_content_section
    @content_section = Ansuz::JAdams::ContentSection.find(params[:id])
  end
  public
  def show
  end

  def edit
  end

  def update
    if @content_section.update_attributes(params[:content_section])
      render :update do |page|
        page << "notify('Content Section has been updated');"
      end
    else
      render :update do |page|
        page << "notify('An error occurred updating the content section');"
      end
    end
  end

  def rollback
    @content_section.revert_to(params[:version_number])
    render :text => @content_section.contents
  end

  def get_dropdown
    render :text => render_to_string(:partial => 'get_dropdown')
  end
end
