class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id, null: false
      t.integer :soccer_group_id, null: false
      t.string :post_title
      t.string :body
      

      t.timestamps
    end
  end
end
