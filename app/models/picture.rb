class Picture < ApplicationRecord
  belongs_to :portfolio
  mount_uploader :picture, PictureUploader
  validates :title, presence: true
  validates :picture, presence: true

  def next
    portfolio.pictures.where("id > ?", id).first
  end

  def prev
    portfolio.pictures.where("id < ?", id).last
  end

end
