class AddPouleIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :poule_id, :integer
  end
end
