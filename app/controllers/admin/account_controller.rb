class Admin::AccountController < ApplicationController
  skip_filter :login_required, :only => [:login]

  permit 'admin', :except => 'login'

  def index
    redirect_to(:action => 'login') unless logged_in? || User.count > 0
		redirect_to(:controller => 'page_admin', :action => 'index')
  end

  def login
    if request.post?
      self.current_user = User.authenticate(params[:login], params[:password])
      if logged_in?
        if params[:remember_me] == "1"
          self.current_user.remember_me
          cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
        end
        flash[:message] = "Logged in successfully"
        redirect_back_or_default(admin_pages_path)
      end
      flash.now[:message] = 'Invalid username and password.'
    else
      render :layout => 'mini'
    end
  end

  def update
    #@user = User.find(params[:user])
    @user = self.current_user
    unless request.post? and params[:user] and params[:user][:password]
			render :template => 'account/update'
			return
    end
    #auth = User.authenticate(@user.login, params[:user][:password])
		
    @user.password = params[:user][:password]
		@user.password_confirmation = params[:user][:password_confirmation]
		@user.email =  params[:user][:email]
    @user.save!
		
    flash[:notice] = "Your login information has been updated."
		@user.password = @user.password_confirmation = '' # Blank out passwords
		render :template => 'admin/account/update', :layout => false
  rescue ActiveRecord::RecordInvalid
		# Blank out password and password confirmation
		@user.password = @user.password_confirmation = '';
    render :template => 'admin/account/update', :layout => false
  end

#  def signup
#   @user = User.new(params[:user])
#    return unless request.post?
#    @user.save!
#    self.current_user = @user
#    redirect_back_or_default(:controller => '/account', :action => 'index')
#    flash[:notice] = "Thanks for signing up!"
#  rescue ActiveRecord::RecordInvalid
#    render :action => 'signup'
#  end
  
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default("/admin/account/login")
  end
end
