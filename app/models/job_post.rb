class JobPost < ApplicationRecord
  has_many :specialities

  has_many :job_post_comments, foreign_key: "job_post_id",
    class_name: "JobPostComment", dependent: :destroy
  has_many :users, through: :job_post_comments

  has_many :job_post_views, foreign_key: "job_post_id", dependent: :destroy
  has_many :users, through: :job_post_views

  has_many :speciality_job_posts, foreign_key: "job_post_id", dependent: :destroy
  has_many :specialities, through: :speciality_job_posts

  has_many :job_post_users, foreign_key: "job_post_id", dependent: :destroy
  has_many :users, through: :job_post_users


  has_one :location
  has_one :user, foreign_key: "user_id"

  default_scope -> { order(created_at: :desc) }
  mount_uploader :logo, PictureUploader
  validates :job_title, presence: true
  validates :user_id, presence: true
  validates :location_id, presence: true
  validates :company_name, presence: true
  validates :rates, numericality: { greater_than_or_equal_to: 1 }
  validates :rates, presence: true
  validate :logo_size

  #Comment
  def comment(comment, job_post)
    job_post_comments.create(job_post_id: job_post.id, comment: comment)
  end

  def comment_feeds
    job_post = JobPost.find(params[:id])
    JobPostComment.where("job_post_id IN (#{job_post})",
      user_id: id)
  end

  def self.search(search)
    where("job_title LIKE ?", "%#{search}%")
    where("job_description LIKE ?", "%#{search}%")
    where("company_name LIKE ?", "%#{search}%")
    where("company_description LIKE ?", "%#{search}%")
  end

  private

    # Validates the size of an uploaded picture.
    def logo_size
      if logo.size > 5.megabytes
        errors.add(:logo, "should be less than 5MB")
      end
    end
end
