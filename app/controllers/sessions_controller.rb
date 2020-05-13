class SessionsController < ApplicationController

  def home
    redirect_to user_path(current_user) if logged_in?
  end

  def destroy
    #session.delete("user_id")
    session.clear
    redirect_to root_path
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.save && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else
      flash[:message] = "Invalid login. It happens." 
      redirect_to root_path
    end
  end

  def google
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to root_path
    
  end

  private
 
  def auth
    request.env['omniauth.auth']
  end
end




