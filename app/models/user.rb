class User < ActiveRecord::Base
  has_many :messages
  has_many :conversations
  validates :username, presence: true
  validates :email, presence: true
  has_secure_password
end
