class CreateSoccerGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :soccer_groups do |t|
      t.integer :customer_id
      t.string :team_name
      t.string :league_name
      t.string :name
      
      t.timestamps
    end
  end
end
