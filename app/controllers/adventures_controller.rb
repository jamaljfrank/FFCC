class AdventuresController < ApplicationController

    def new
        @adventure = Adventure.new
    end

    def create
        current_user.adventures << Adventure.create(adventure_params)
        if current_user.save 
            
            redirect_to user_path(current_user)
        else 
            # Error message
            render 'new'
        end 
    end

    private

    def adventure_params 
        params.require(:adventure).permit(:title, :flavor)
    end 
end


