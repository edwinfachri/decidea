class JobPostUser < ApplicationRecord
  belongs_to :user
  belongs_to :job_post
  validates :user_id, presence: true
  validates :job_post_id, presence: true
end
