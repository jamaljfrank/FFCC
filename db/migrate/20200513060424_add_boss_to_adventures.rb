class AddBossToAdventures < ActiveRecord::Migration[6.0]
  def change
    add_column :adventures, :boss, :string
  end
end
