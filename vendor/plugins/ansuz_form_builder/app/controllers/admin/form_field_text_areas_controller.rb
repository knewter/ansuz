class Admin::FormFieldTextAreasController < Admin::BaseController
  before_filter :load_form_field_text_area, :only => [:edit, :update]

  protected
  def load_form_field_text_area
    @form_field_text_area = Ansuz::JAdams::FormFieldTextArea.find(params[:id])
  end

  public
  def edit
  end

  def update
    if @form_field_text_area.update_attributes(params[:form_field_text_area])
      flash[:notice] = "Text Field updated."
      redirect_to admin_form_builder_path(@form_field_text_area.form_field.form_builder)
    else
      flash.now[:error] = "There was a problem updating the text area."
      render :action => 'edit'
    end
  end
end
