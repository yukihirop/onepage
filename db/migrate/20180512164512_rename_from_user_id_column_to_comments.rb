class RenameFromUserIdColumnToComments < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :from_user_id, :to_user_id
  end
end
