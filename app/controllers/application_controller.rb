class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :authentication_check, :admin
 
    def authentication_check
        if !logged_in?
            redirect_to root_path
        end
    end

    def logged_in?
        session[:user_id]
    end

    def admin
        current_user.admin
    end 

    def current_user
        @user ||= User.find_by(id: session[:user_id])
    end 
end


