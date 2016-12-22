class Speciality < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :speciality_job_posts, foreign_key: "speciality_id", dependent: :destroy
  has_many :job_posts, through: :speciality_job_posts
  belongs_to :portfolio
end
