class User < ApplicationRecord
  has_secure_password
  has_many :payments

  validates :name, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 6 }
end
