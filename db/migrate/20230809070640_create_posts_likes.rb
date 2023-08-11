class CreatePostsLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :posts_likes do |t|
      t.integer :customer_id
      t.integer :post_id

      t.timestamps
    end
  end
end
