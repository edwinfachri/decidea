class Notification < ApplicationRecord
  belongs_to :notified_by, class_name: 'User'
  belongs_to :user

  validates :user_id, :notified_by_id, :identifier, :notice_type, presence: true
end
