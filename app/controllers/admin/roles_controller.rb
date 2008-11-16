class Admin::RolesController < Admin::BaseController
  before_filter :load_roles, :only => [:index]

  protected
  def load_roles
    @roles = Role.root.find(:all)
  end

  public
  def index
  end
end
