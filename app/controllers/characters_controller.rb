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
            binding.pry
            render 'new'
        end 
    end

    def update
        @battle = Battle.new(:character_id => current_user.id, :adventure_id => params[:adventure_id])
        redirect_to root_path, :flash => @battle.results
    end

    private

    def character_params 
        params.require(:character).permit(:name, :tribe)
    end

    
end
