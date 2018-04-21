class CreateTagFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_followings do |t|
      t.references :user, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
