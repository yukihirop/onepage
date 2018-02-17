class AddCommentColumnToRevision < ActiveRecord::Migration[5.1]
  def change
    add_column :revisions, :comment, :text
  end
end
