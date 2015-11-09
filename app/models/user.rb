class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :conversations

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates_confirmation_of :password
end
