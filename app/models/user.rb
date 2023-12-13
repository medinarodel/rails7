class User < ApplicationRecord
  # Enables bcrypt password hashing
  has_secure_password

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
