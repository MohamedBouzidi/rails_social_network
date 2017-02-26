class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  attr_accessor :remember_digest
  before_save :email_downcase
  validates :name, presence: true, length: { maximum: 20 }
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: EMAIL_FORMAT }, uniqueness: { case_sensitive: false }
  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_digest = User.new_token
    self.update_column('remember_digest', self.remember_digest)
  end

  def forget
    self.update_column(:remember_digest, nil)
  end

  private

    def email_downcase
      self.email = self.email.downcase
    end
end
