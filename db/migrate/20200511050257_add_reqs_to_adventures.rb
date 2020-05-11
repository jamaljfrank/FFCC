class AddReqsToAdventures < ActiveRecord::Migration[6.0]
  def change
    add_column :adventures, :reqs, :integer
  end
end
