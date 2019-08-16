# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_digest
  before_create :create_new_token

  validates :name, presence: true, length: { minimum: 6 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, presence: true

  def create_new_token
    new_token = SecureRandom.urlsafe_base64
    encrypted_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
    self.remember_token = encrypted_token
  end
end
