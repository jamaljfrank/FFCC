class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :tribe
      t.integer :lv
      
      t.references :user, foreign_key: true
      t.references :battle, foreign_key: true

      t.timestamps
    end
  end
end
