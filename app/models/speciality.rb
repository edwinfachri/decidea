class Speciality < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category
  validates :category_id, presence: true
end
