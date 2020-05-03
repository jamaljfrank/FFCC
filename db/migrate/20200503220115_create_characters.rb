class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :tribe
      t.text :avatar

      t.timestamps
    end
  end
end
