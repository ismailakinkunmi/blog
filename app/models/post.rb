class Post < ApplicationRecord
  belongs_to :user
  has_many :like
  has_many :comment

  def update_counter
    user.increment(:post_counter)
  end

  def recent_comment
    comment.order(:created_on, :desc).limit(5)
  end
end
