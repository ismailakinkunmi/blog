class RenameCommentsCounter < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :CommentsCounter, :comment_counter
  end
end
