class Speciality < ApplicationRecord
  has_many :specialities_users
  has_many :users, through: :specialities_users
  belongs_to :category
  validates :category_id, presence: true
end