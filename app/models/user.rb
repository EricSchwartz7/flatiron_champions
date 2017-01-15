class User < ApplicationRecord
  has_secure_password
  has_many :characters
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :nickname, presence: true

end
