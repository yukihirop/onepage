class CreateRevisions < ActiveRecord::Migration[5.1]
  def change
    create_table :revisions do |t|
      t.references :post, foreign_key: true
      t.text :title
      t.text :summary
      t.text :goal
      t.text :event_url
      t.text :body
      t.text :slide_url

      t.timestamps
    end
  end
end
