class ApplicationController < ActionController::API
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.

    # before_action :require_login
    include Response
    def force_login
	redirect_to login_path
    end
end
