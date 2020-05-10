class CharactersController < ApplicationController


    def index
        @characters = Character.led_by(current_user.id)
    end

    def new 
        @character = Character.new
    end

    def create 
        @character = current_user.characters.build(character_params)
        if @character.save 
            redirect_to characters_path(current_user)
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
