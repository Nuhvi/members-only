# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: { minimum: 6 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, presence: true

  def remember
    encrypted_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
    update_attribute(:remember_token, encrypted_token)
  end

  def forget
    update_attribute(:remember_token, nil)
  end
end
