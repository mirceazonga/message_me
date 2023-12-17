# app/models/user.rb

class User < ApplicationRecord
  has_secure_password
  has_many :messages, dependent: :destroy

  validates :username, presence: true, length: { minimum: 3, maximum: 15 },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
end
