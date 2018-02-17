class CreatePostLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :post_likes do |t|
      t.references :post, foreign_key: true
      t.bigint :from_user_id

      t.timestamps
    end
  end
end
