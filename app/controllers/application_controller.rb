class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :authentication_check, :admin, :current_adventure
 

    private
    def authentication_check 
        redirect_to root_path if !logged_in?
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
    
    def current_adventure
        @adventure ||= Adventure.find_by(:id => params[:id])
    end
end


