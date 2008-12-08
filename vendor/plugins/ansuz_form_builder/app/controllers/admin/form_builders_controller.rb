class Admin::FormBuildersController < Admin::BaseController
  before_filter :load_form_builder, :only => [:show]

  protected
  def load_form_builder
    @form_builder = Ansuz::JAdams::FormBuilder.find(params[:id])
  end

  public
  def show
  end
end
