class User < ApplicationRecord
  # Relationships
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  # Attributes
  attr_accessor :remember_token
  attr_accessor :activation_token
  
  # Before actions
  before_save :email_downcase
  before_create :set_activation_token
  
  # Validations
  validates :name, presence: true, length: { maximum: 20 }
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: EMAIL_FORMAT }, uniqueness: { case_sensitive: false }
  # Other...
  has_secure_password

  # returns hash for given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # generates unique token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # remember user on computer
  def remember
    self.remember_token = User.new_token
    self.update_column('remember_digest', User.digest(self.remember_token))
  end

  # forget user from computer
  def forget
    self.update_column(:remember_digest, nil)
  end

  private

    # email downcasing
    def email_downcase
      self.email = self.email.downcase
    end

    # sets activation token
    def set_activation_token
      self.activation_token = User.new_token
      self.activation_digest = User.digest(self.activation_token)
    end
end
