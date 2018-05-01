class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.references :user, foreign_key: true, null: false
      t.bigint :to_user_id,                  null: false

      t.timestamps
    end
  end
end
