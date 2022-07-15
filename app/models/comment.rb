class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_comment_counter
    post.increament(:comment_counter)
  end
end
