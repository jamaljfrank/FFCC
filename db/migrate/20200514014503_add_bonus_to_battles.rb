class AddBonusToBattles < ActiveRecord::Migration[6.0]
  def change
    add_column :battles, :bonus, :integer
  end
end
