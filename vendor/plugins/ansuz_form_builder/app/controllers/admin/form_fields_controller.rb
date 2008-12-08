class Admin::FormFieldsController < Admin::BaseController
  before_filter :load_form_builder
  before_filter :load_new_form_field, :only => [:new, :create]
  before_filter :load_form_field,     :only => [:edit, :destroy]

  protected
  def load_form_builder
    @form_builder = Ansuz::JAdams::FormBuilder.find(params[:form_builder_id])
  end

  def load_new_form_field
    @form_field = Ansuz::JAdams::FormField.new
  end

  def load_form_field
    @form_field = Ansuz::JAdams::FormField.find(params[:id])
  end

  public
  def new
  end

  def create
    # create the appropriate stuff...
    case params[:type]
    # TODO: Split this up and provide an API for other plugins to add form field types to the builder
    when "Text Field"
      @field = Ansuz::JAdams::FormFieldTextField.new
      @form_field.form_builder_id = @form_builder.id
      @form_field.field = @field
    when "Text Area"
      @field = Ansuz::JAdams::FormFieldTextArea.new
      @form_field.form_builder_id = @form_builder.id
      @form_field.field = @field
    end
    if @form_field.save
      flash[:notice] = "The Form Field was added successfully."
      redirect_to admin_form_builder_path(@form_builder)
    else
      flash.now[:error] = "There was a problem creating the Form Field."
      render :action => "edit"
    end
  end

  def edit
    case @form_field.field.type.to_s
    when "Ansuz::JAdams::FormFieldTextField"
      redirect_to edit_admin_form_field_text_field_path(@form_field.field)
    when "Ansuz::JAdams::FormFieldTextArea"
      redirect_to edit_admin_form_field_text_area_path(@form_field.field)
    end
  end

  def destroy
    if @form_field.destroy
      flash[:notice] = "Form Field was destroyed."
    else
      flash.now[:error] = "There was a problem destroying the form field."
    end
    redirect_to admin_form_builder_path(@form_builder)
  end
end
