# frozen_string_literal: true

class User < ApplicationRecord
  has_one :confirmation_code_user, dependent: :destroy
  has_many :orders, dependent: :restrict_with_exception

  has_secure_password
  acts_as_paranoid

  validates :email, presence: true, length: { in: 6..100 }, uniqueness: true
  validates :password_digest, presence: true, length: { in: 8..100 }
  validates :firstname, length: { maximum: 50 }
  validates :lastname, length: { maximum: 50 }

  enum profile: {
    customer: 0,
    admin: 1
  }
end
