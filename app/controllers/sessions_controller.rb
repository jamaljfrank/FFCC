class SessionsController < ApplicationController
  def home
    redirect_to user_characters_path(current_user) if logged_in?
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.save && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_characters_path(@user), notice: 'Welcome back!'
    else
      redirect_to root_path, notice: 'Invalid login. It happens.'
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
