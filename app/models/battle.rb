class Battle < ApplicationRecord
  belongs_to :character
  belongs_to :adventure

  def level_up
    if adventure.boss_lv >= character.lv
      new_lv = character.lv += 1
      character.update(lv: new_lv)
      'You leveled up!'
    else
      'This adventure is no match for you now! Choose another.'
    end
  end

  def game_over
    character.destroy
    'Game Over'
  end

  def dice_roll
    character.lv + rand(0..5)
  end

  def results
    if character.tribe == 'Clavat'
      dice_roll + bonus >= adventure.clavat_difficulty ? level_up : game_over
    elsif character.tribe == 'Lilty'
      dice_roll + bonus >= adventure.lilty_difficulty ? level_up : game_over
    elsif character.tribe == 'Selkie'
      dice_roll + bonus >= adventure.selkie_difficulty ? level_up : game_over
    else
      character.tribe == 'Yuke'
      dice_roll + bonus >= adventure.yuke_difficulty ? level_up : game_over
    end
  end
end
