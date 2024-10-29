class User < ApplicationRecord
  MINIMUM_PASSWORD_LENGTH = 8

  has_secure_password
  has_many :sessions, dependent: :destroy

  validates :email_address, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: MINIMUM_PASSWORD_LENGTH }, confirmation: true
  validates :password_confirmation, presence: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
