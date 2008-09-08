class UsersController < ApplicationController
  before_filter :load_users, :only => [:index]
  before_filter :load_user,  :only => [:show]

protected
  def load_users
    @users = User.paginate :page => params[:page], :order => 'created_at DESC'
  end

  def load_user
    @user = User.find params[:id]
  end

public
  def index
  end

  def show
  end
end
