class Admin::UsersController < Admin::BaseController
  before_filter :load_users, :only => [:index]
  before_filter :load_user,  :only => [:show, :edit, :update, :destroy]
  before_filter :load_new_user, :only => [:new, :create]

  protected
  def load_users
    @users = User.find(:all)
  end

  def load_user
    @user = User.find(params[:id])
  end

  def load_new_user
    @user = User.new(params[:user])
  end

  public
  def index
  end

  def new
  end

  def create
    if @user.save
      flash[:notice] = "User was created successfully."
      redirect_to admin_users_path
    else
      flash.now[:error] = "There was a problem creating this user."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      Role.base_roles.each do |role|
        if params[:roles].include?(role)
          @user.has_role(role)
        else
          @user.has_no_role(role)
        end
      end

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
