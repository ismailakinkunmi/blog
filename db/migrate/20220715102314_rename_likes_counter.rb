class RenameLikesCounter < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :LikesCounter, :like_counter
  end
end
