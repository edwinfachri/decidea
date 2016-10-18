class JobPost < ApplicationRecord
  has_many :specialities
  has_and_belongs_to_many :users

  has_many :job_post_comments, foreign_key: "job_post_id",
    class_name: "JobPostComment", dependent: :destroy
  has_many :users, through: :job_post_comments

  default_scope -> { order(created_at: :desc) }
  mount_uploader :logo, PictureUploader
  validates :job_title, presence: true
  validates :job_location, presence: true
  validates :job_description, presence: true
  validates :company_name, presence: true
  validates :company_description, presence: true
  validates :company_website, presence: true
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

  private

    # Validates the size of an uploaded picture.
    def logo_size
      if logo.size > 5.megabytes
        errors.add(:logo, "should be less than 5MB")
      end
    end
end
