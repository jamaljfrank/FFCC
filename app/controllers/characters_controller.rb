class CharactersController < ApplicationController

  def index
    user_check
    @characters = Character.party(current_user)
  end

  def new
    user_check
    party_limit
    @character = current_user.characters.build
  end

  def create
    @character = current_user.characters.build(character_params)
    if @character.save
      redirect_to root_path, notice: "You're ready for an Adventure!"
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
      redirect_to root_path, notice: "Party limit reached."
    end
  end
end
