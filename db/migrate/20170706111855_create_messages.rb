class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text  :body
      t.string  :image
      t.integer :group_id, :null => false
      t.integer :user_id, :null => false
    end
    add_foreign_key :messages, :users
    add_foreign_key :messages, :groups
  end
end

