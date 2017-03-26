class Notification < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :body, presence: true,
                  length: { maximum: 50 } 
end
