class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :authentication_check, :admin, :current_adventure, :user_check, :admin_check

  private

  def authentication_check
    redirect_to root_path if !logged_in?
  end

  def logged_in?
    !!session[:user_id]
  end

  def admin
    current_user.admin
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def current_adventure
    @adventure ||= Adventure.find_by(id: params[:id])
  end

  def user_check
    redirect_to root_path, notice: "User doesn't match or exist." unless params[:user_id] && current_user = User.find_by_id(params[:user_id])
  end

  def admin_check
    redirect_to root_path, notice: 'Must be admin.' unless admin
  end
end
