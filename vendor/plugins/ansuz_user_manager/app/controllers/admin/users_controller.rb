class Admin::UsersController < Admin::BaseController
  before_filter :get_users, :only => [:index]
  before_filter :get_user,  :only => [:edit, :destroy]

  protected
  def get_users
    @users = User.find(:all)
  end

  def get_user
    @user = User.find(params[:id])
  end

  public
  def index
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "User was updated successfully."
      redirect_to admin_users_path
    else
      flash.now[:error] = "There was a problem updating the user."
      render :action => 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User was deleted."
    redirect_to admin_users_path
  end
end
