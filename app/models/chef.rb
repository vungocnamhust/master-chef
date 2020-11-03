class Chef < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.mail = mail.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, length: { maximum: 255 },
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  class << self
    # Do not need to understand cost or st else
    # This method used for validating password by some restrictions
    def digest(string)
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Password.create(string, cost: cost)
             end
    end

    # Returns a random token.
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # Remember a user in database for persistent session
  def remember
    self.remember_token = Chef.new_token
    update_attribute(:remember_digest, Chef.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forget chef logged in by updating attributes remember_token = nil
  def forget
    update_attribute(:remember_digest, nil)
  end
end
