class CreatePostsComments < ActiveRecord::Migration[6.1]
  def change
    create_table :posts_comments do |t|
      t.integer :customer_id
      t.integer :posts_id
      t.string :comments

      t.timestamps
    end
  end
end
