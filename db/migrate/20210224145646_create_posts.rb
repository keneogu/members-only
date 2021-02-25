class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :post

      t.timestamps
    end
    add_index :posts, :user_id, unique: true
  end
end
