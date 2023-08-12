class CreatePostsComments < ActiveRecord::Migration[6.1]
  def change
    create_table :posts_comments do |t|
      t.integer :customer_id
      t.integer :post_id
      t.string :comment

      t.timestamps
    end
  end
end
