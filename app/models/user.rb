class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: :author_id
  has_many :comments, dependent: :destroy, foreign_key: :author_id
  has_many :likes, dependent: :destroy, foreign_key: :author_id
  validates :name, presence: true

  def top_three_recent_posts
    posts.includes(:author).order(created_at: :DESC).limit(3)
  end
end
