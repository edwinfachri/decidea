class JobPostComment < ApplicationRecord
  belongs_to :users
  belongs_to :job_posts
  validates :user_id, presence: true
  validates :job_post_id, presence: true
end
