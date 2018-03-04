class RenamePostLikeToPostLiking < ActiveRecord::Migration[5.1]
  def change
    rename_table :post_likes, :post_likings
  end
end
