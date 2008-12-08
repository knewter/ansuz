class FormBuildersController < ApplicationController
  unloadable
  helper :form_builder_helper

  before_filter :load_form_builder, :only => [:submit]
  before_filter :load_form_builder_response, :only => [:submit]

  protected
  def load_form_builder
    @form_builder = Ansuz::JAdams::FormBuilder.find(params[:id])
  end

  def load_form_builder_response
    @form_builder_response = Ansuz::JAdams::FormBuilderResponse.new(:form_builder_id => @form_builder.id)
  end

  public
  def submit
    @form_builder.form_fields.each do |form_field|
      field_response = @form_builder_response.form_field_responses.build(:form_field_id => form_field.id)
      field_response.string = params["form_field_#{form_field.id}"]
    end
    if @form_builder_response.save
      flash[:notice] = "Form was filled out successfully."
    else
      flash[:error] = "There was a problem filling out the form."
    end
    redirect_to params[:refurl]
  end
end
