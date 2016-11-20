class SpecialityJobPost < ApplicationRecord
  belongs_to :speciality
  belongs_to :job_post
  validates :job_post_id, presence: true
  validates :speciality_id, presence: true
end
