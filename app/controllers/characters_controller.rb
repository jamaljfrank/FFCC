class CharactersController < ApplicationController
    

    def new 
        @character = Character.new
    end

    def index
        @characters = Character.led_by(current_user)
    end

    def create 
        @character = current_user.characters.build(character_params)
        if @character.save 
            redirect_to root_path, :notice => "You're ready for an Adventure!"
        else 
            render 'new', :notice => "Sorry, one character at a time."
        end 
    end

    private

    def character_params 
        params.require(:character).permit(:name, :tribe, :lv)
    end

    
end
