class AddUserRefToPostLikes < ActiveRecord::Migration[5.1]
  def change
    add_reference :post_likes, :user, foreign_key: true, after: :post_id
  end
end
