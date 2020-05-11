class AdventuresController < ApplicationController

    def index
        redirect_to root_path
    end
    
    def new
        @adventure = Adventure.new
        #@user = current_user
    end

    def show
        current_adventure
    end

    def create
        @adventure =  current_user.adventures.build(adventure_params)
        if @adventure.save 
            
            redirect_to user_path(current_user)
        else 
            flash[:message] = "Adventure exists. Try another, please!"
            render 'new'
        end 
    end

    def edit
        current_adventure
    end

    def update
        current_adventure
        if @adventure.update(adventure_params)
            redirect_to adventure_path(@adventure)
        else
            #error message
            redirect_to edit_adventure_path
        end
    end

    

    def destroy 
        current_adventure.destroy 
        redirect_to adventures_path
    end

    private

    def adventure_params 
        params.require(:adventure).permit(:title, :flavor, :reqs)
    end 
end


