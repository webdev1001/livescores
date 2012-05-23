class CreatePoules < ActiveRecord::Migration
  def change
    create_table :poules do |t|
      t.string :name
      t.integer :tournament_id
      
      t.timestamps
    end
  end
end
