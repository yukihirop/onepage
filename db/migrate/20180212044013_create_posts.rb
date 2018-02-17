class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.bigint :newest_revision_id

      t.timestamps
    end
  end
end
