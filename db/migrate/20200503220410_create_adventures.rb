class CreateAdventures < ActiveRecord::Migration[6.0]
  def change
    create_table :adventures do |t|
      t.string :title
      t.string :flavor
      t.boolean :completed

      t.timestamps
    end
  end
end
