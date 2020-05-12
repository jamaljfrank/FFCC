class CharactersController < ApplicationController

    def new 
        @character = Character.new
    end

    def index
        @characters = Character.led_by(current_user.id)
    end

    def create 
        @character = current_user.characters.build(character_params)
        @character.adventure_id = current_user.id
        if @character.save 
            redirect_to root_path
        else 
            # Error message
            
            render 'new'
        end 
    end

    private

    def character_params 
        params.require(:character).permit(:name, :tribe, :avatar)
    end

    
end
