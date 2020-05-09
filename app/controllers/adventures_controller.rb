class AdventuresController < ApplicationController

    def new
        @adventure = Adventure.new
    end

    def show
        @adventure =Adventure.find_by(:id => params[:id])
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

    def update
        @adventure = Adventure.find_by(:id => params[:id])
        if @adventure.update(adventure_params)
            redirect_to adventure_path(@adventure)
        else
            #error message
            redirect_to edit_attraction_path
        end
    end

    private

    def adventure_params 
        params.require(:adventure).permit(:title, :flavor)
    end 
end


