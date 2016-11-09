class JobPostView < ApplicationRecord
  belongs_to :job_post, class_name: "JobPost"
  belongs_to :user, class_name: "User"
end
