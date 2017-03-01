class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  default_scope -> { order(created_at: :desc) }
  validates :body, presence: true
  validates :user_id, presence: true
end
