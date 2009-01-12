class UsersController < ApplicationController
  unloadable
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

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.registering = true
    @user.save
    if @user.errors.empty?
      redirect_to('/')
    else
      render :controller => 'sessions', :action => 'new'
    end
  end

  def check
    @user = User.new(:login => params[:login])

    respond_to do |format|
      if @user.valid? || @user.errors[:login].blank?
        @message = "Username &ldquo;#{@user.login}&rdquo; is available."
        @type    = "success"
      else
        error    = [ @user.errors.on(:login) ].flatten.first
        login    = @user.login
        login    = "&ldquo;#{login}&rdquo;" unless login.blank?
        @message = "Username #{login} #{error}"
        @type    = "error"
      end
      format.js {}
    end
  end

  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/')
  end

  def send_activation_code
    user = User.find_by_email params[:email]
    if user
      # UserMailer.deliver_forgot_password(user) # FIXME: NYI
      flash[:notice] = "An email has been sent with instructions for resetting your password.  NOTE: Not really, that's NYI."
    else
      flash[:error] = "There was no user with that email address."
    end
    redirect_to login_path
  end

  def reset_password
    @user = User.find_by_activation_code params[:activation_code]
    unless @user
      flash[:error] = "There was no user with that activation code.  Please try again."
      redirect_to login_path and return
    end
    if request.post?
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
      error = !(params[:password] == params[:password_confirmation])
      if !error && @user.save(false) 
        flash[:notice] = "Your password has been reset and you have been logged in."
        self.current_user = @user
        redirect_to '/'
      else
        flash.now[:error] = "There was a problem resetting your password."
      end
    end
  end
end
