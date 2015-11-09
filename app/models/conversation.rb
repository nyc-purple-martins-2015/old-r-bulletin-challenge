class Conversation < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages

  def to_param
  	"#{id}-#{name.parameterize}"
  end
end
