class MessageUser < ApplicationRecord
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

  has_many  :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, :scope => :recipient_id

  scope :between, -> (sender_id, recipient_id) do
    where("(message_users.sender_id = ? AND message_users.recipient_id = ?)
    OR (message_users.sender_id = ? AND message_users.recipient_id = ?)",
    sender_id, recipient_id, recipient_id, sender_id)
  end
end
