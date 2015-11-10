class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :conversations

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
end
