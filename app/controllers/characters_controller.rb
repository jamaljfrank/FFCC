class CharactersController < ApplicationController

    def index
        @characters = Character.led_by(current_user.id)
    end
end
