class CreateAdventures < ActiveRecord::Migration[6.0]
  def change
    create_table :adventures do |t|
      t.string :title
      t.string :flavor
      t.integer :boss_lv

      t.integer :clavat_difficulty
      t.integer :lilty_difficulty
      t.integer :selkie_difficulty
      t.integer :yuke_difficulty

      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
