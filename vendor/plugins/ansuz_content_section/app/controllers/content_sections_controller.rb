class ContentSectionsController < ApplicationController
  unloadable # This is required if you subclass a controller provided by the base rails app

  layout 'admin'
  before_filter :load_content_section, :only => [:show, :edit, :update]
  protected
  def load_content_section
    @content_section = Ansuz::JAdams::ContentSection.find(params[:id])
  end
  public
  def show
  end

  def edit
    render :partial => 'edit', :layout => false
  end

  def update
    if @content_section.update_attributes(params[:content_section])
      render :update do |page|
        page << "notify('Content Section has been updated'); jQuery('#modal').jqmHide();"
      end
    else
      render :update do |page|
        page << "notify('An error occurred updating the content section'); jQuery('#modal').jqmHide();"
      end
    end
  end
end
