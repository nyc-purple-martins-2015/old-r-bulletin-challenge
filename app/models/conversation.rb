class Conversation < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages

  validates :name, presence: true
  validates :topic_id, presence: true
end
