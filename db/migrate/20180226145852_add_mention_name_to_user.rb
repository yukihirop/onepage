class AddMentionNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :mention_name, :string, after: :id
    add_index :users, :mention_name, unique: true
    add_index :users, :email, unique: true
  end
end
