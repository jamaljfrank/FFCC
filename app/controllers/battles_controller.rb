class BattlesController < ApplicationController
  def create
    @battle = current_adventure.battles.build(battle_params)
    @battle.character_id = current_user.characters.first.id

    redirect_to root_path, notice: @battle.results
  end

  private

  def battle_params
    params.require(:battle).permit(:bonus)
  end
end
