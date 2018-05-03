class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
      t.bigint :from_user_id, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
