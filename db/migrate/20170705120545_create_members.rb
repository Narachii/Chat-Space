class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.integer :group_id, :null => false
      t.integer :user_id, :null => false
      t.timestamps
    end
    add_foreign_key :members, :users
    add_foreign_key :members, :groups
  end
end
