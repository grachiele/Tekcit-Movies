class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :username, presence: true
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_many :tickets
end
