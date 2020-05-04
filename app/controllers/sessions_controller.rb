class SessionsController < ApplicationController

  def home
  end
  
  def new
  end

  def create
  end

  def destroy
    #session.delete("user_id")
    session.clear
    redirect_to root_path
  end
end






