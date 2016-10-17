class JobPost < ApplicationRecord
  has_many :specialities
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :logo, PictureUploader
  validates :job_title, presence: true
  validates :job_location, presence: true
  validates :job_description, presence: true
  validates :company_name, presence: true
  validates :company_description, presence: true
  validates :company_website, presence: true
  validates :rates, presence: true
  validates :user_id, presence: true
  validate :logo_size

  private

    # Validates the size of an uploaded picture.
    def logo_size
      if logo.size > 5.megabytes
        errors.add(:logo, "should be less than 5MB")
      end
    end
end
