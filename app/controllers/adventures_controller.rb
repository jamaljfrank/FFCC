class AdventuresController < ApplicationController
  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @adventures = @user.adventures
    else
      @adventures = Adventure.all
    end
  end

  def new
    admin_check
    @adventure = Adventure.new
  end

  def show
    current_adventure
  end

  def create
    @adventure = current_user.adventures.build(adventure_params)
    if @adventure.save
      redirect_to user_path(current_user), notice: 'Adventure created!'
    else
      render 'new', notice: 'Adventure exists. Try another.'
    end
  end

  def edit
    admin_check
    current_adventure
  end

  def update
    current_adventure
    if @adventure.update(adventure_params)
      redirect_to adventure_path(@adventure), notice: 'Update successful!'
    else
      redirect_to edit_adventure_path,
                  notice: 'Title or flavor text exists. Please try another.'
    end
  end

  def destroy
    current_adventure.destroy
    redirect_to root_path, notice: 'Adventure deleted'
  end

  private

  def adventure_params
    params.require(:adventure).permit(
      :title,
      :flavor,
      :boss,
      :boss_lv,
      :clavat_difficulty,
      :lilty_difficulty,
      :selkie_difficulty,
      :yuke_difficulty
    )
  end
end
