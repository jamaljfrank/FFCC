class CharactersController < ApplicationController

  def index
    if current_user
      @characters = Character.party(current_user)
    else
      render 'new'
    end
  end

  def new
    party_limit
    user_check
    @character = current_user.characters.build
  end

  def create
    @character = current_user.characters.build(character_params)
    if @character.save
      redirect_to adventures_path, notice: "You're ready for an Adventure!"
    else
      render 'new', notice: 'Sorry, one character at a time.'
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :tribe, :lv)
  end

    def party_limit
    if !current_user.characters.empty?
      redirect_to adventures_path, notice: "Party limit reached. You're ready for an adventure!"
    end
  end
end
