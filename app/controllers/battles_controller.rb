class BattlesController < ApplicationController
  def create
    @battle = Battle.new(:character_id => current_user.characters.first.id, :adventure_id => params[:adventure_id])
    redirect_to root_path, :notice => @battle.results
  end
end
