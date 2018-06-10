class RenameFromUserIdColumnToPostLikings < ActiveRecord::Migration[5.1]
  def change
    rename_column :post_likings, :from_user_id, :to_user_id
  end
end
