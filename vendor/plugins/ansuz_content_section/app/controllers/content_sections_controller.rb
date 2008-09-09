class ContentSectionsController < ApplicationController
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
  end

  def update
    if @content_section.update_attributes(params[:content_section])
      flash[:notice] = "Content Section has been updated."
      redirect_to content_section_path(@content_section)
    else
      flash.now[:error] = "There was a problem updating the ContentSection.  Please try again."
      render :action => 'edit'
    end
  end
end
