class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id
      t.integer :team_id
      t.string :post_title
      t.string :post_text
      t.string :tags

      t.timestamps
    end
  end
end
