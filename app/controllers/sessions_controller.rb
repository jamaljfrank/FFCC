class SessionsController < ApplicationController

  # def home
  # end
  
  # def new
  # end

   

  def destroy
    #session.delete("user_id")
    session.clear
    redirect_to root_path
  end

  def create
    
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      flash[:message] = "Invalid login. It happens." 
      redirect_to root_path
    end
  end
end






