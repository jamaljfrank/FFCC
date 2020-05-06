class AdventuresController < ApplicationController

    def new
        @adventure = Adventure.new
    end

    def create
        @adventure =  current_user.adventures.build(adventure_params)
        if @adventure.save 
            
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


