# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'a1247817ee38adae53ccd6380e55670e'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password


private
  def admin_logged_in?
    unless session[:admin]
      flash[:notice] = "Please log in"
      redirect_to :controller => 'admin', :action => 'login'
      return false
    else
      return true
  end 
end  
end
