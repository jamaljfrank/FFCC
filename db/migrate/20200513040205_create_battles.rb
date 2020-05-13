class CreateBattles < ActiveRecord::Migration[6.0]
  def change
    create_table :battles do |t|
      t.belongs_to :character, null: false, foreign_key: true
      t.belongs_to :adventure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
