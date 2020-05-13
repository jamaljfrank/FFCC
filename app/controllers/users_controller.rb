class UsersController < ApplicationController
    before_action :authentication_check, only: [:show]
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user), :notice => "Create a character to begin."
        else 
            render 'new'
        end 
    end

    def show
        @user = User.find_by(:id => params[:id])
    end

    private

    def user_params 
        params.require(:user).permit(:email, :password, :admin)
    end 
end
