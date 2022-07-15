class Post < ApplicationRecord
  belongs_to :author, class_name: User
  has_many :like
  has_many :comment

  def recent_comment
    comment.order(:created_on, :desc).limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:post_counter)
  end
end
