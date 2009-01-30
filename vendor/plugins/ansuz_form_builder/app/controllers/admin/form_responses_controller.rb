class Admin::FormResponsesController < Admin::BaseController
  before_filter :load_form_builder
  before_filter :load_form_responses

  protected
  def load_form_builder
    @form_builder = Ansuz::JAdams::FormBuilder.find(params[:form_builder_id])
  end

  def load_form_responses
    @form_responses = @form_builder.form_builder_responses
  end

  public
  def index
  end
end
