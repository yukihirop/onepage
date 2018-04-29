class CreateTagFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_followings do |t|
      t.references :user, foreign_key: true, null: false
      t.references :tag, foreign_key: true,  null: false

      t.timestamps
    end
  end
end
