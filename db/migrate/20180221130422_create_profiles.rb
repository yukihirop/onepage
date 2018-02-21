class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :kana
      t.string :organization
      t.text :introduction
      t.binary :image

      t.timestamps
    end
  end
end
