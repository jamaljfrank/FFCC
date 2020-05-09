class AdventuresController < ApplicationController

    def new
        @adventure = Adventure.new
    end

    def show
        @dventure =Adventure.find_by(:id => params[:id])
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

    def edit
        @adventure = Adventure.find_by(:id => params[:id])
    end

    private

    def adventure_params 
        params.require(:adventure).permit(:title, :flavor)
    end 
end


