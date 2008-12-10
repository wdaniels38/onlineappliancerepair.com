class AccountController < ApplicationController
  def create
	  @title = "Create a new account"
	  @create_user = User.new
  end
  
  def create_account
	  @create_user = User.new(params[:user])
	  @create_user.save
	  render :action => 'create'
  end
  
  def verified
	  
  end
  
  def login
	  @title = "Sign in to you account"
  end	 
  
    def send_login
	    found_user = User.authenticate(params[:user_id], params[:password])    
    #marked user as logged in
    if found_user
      flash[:notice] = "You are now logged in"
      session[:user] = found_user.user_id
      redirect_to(:controller => 'home', :action => 'index')
    else
    #if password is wrong send back to login page
      flash[:notice] = "Username/Password combination incorrect"
      render (:action => 'login')
    end
  end
  
    def log_out
    reset_session
    redirect_to(:controller => 'home', :action => 'index')
  end
  
end
