class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.integer :member_id
      t.text :member_post

      t.timestamps
    end
    add_index :members, :member_id
  end
end
