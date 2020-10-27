class Chef < ApplicationRecord
  before_save { self.mail = mail.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, length: { maximum: 255 },
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  # Do not need to understand cost or st else
  # This method used for validating password by some restrictions
  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Password.create(string, cost: cost)
           end
  end
end
