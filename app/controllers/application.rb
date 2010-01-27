# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '905d4bbeccc4226be2dfeb23eaa73f8b'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

    #authentication stuff
    def handle_admin_permissions()
        if !session[:debater].is_admin
            redirect_to(:controller => :debater, :action => :login_form, :message => "must login as admin to make specified request")
            return false
        end
        return true
    end
    def handle_login_permissions()
        if !session[:debater]
            redirect_to(:controller => :debater, :action => :login_form, :message => "must be logged in to make specified request")
            return false
        end
        return true
    end

end
