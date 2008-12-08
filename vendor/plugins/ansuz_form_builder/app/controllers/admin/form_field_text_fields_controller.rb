class Admin::FormFieldTextFieldsController < Admin::BaseController
  before_filter :load_form_field_text_field, :only => [:edit, :update]

  protected
  def load_form_field_text_field
    @form_field_text_field = Ansuz::JAdams::FormFieldTextField.find(params[:id])
  end

  public
  def edit
  end

  def update
    if @form_field_text_field.update_attributes(params[:form_field_text_field])
      flash[:notice] = "Text Field updated."
      redirect_to admin_form_builder_path(@form_field_text_field.form_field.form_builder)
    else
      flash.now[:error] = "There was a problem updating the text field."
      render :action => 'edit'
    end
  end
end
