class Message < ApplicationRecord
  belongs_to :message_user
  belongs_to :user

  validates_presence_of :body, :message_user_id, :user_id

  def message_time
     created_at.strftime("%m/%d/%y at %l:%M %p")
 end
end
