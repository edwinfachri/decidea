class SpecialitiesUser < ApplicationRecord
    belongs_to :user
    belongs_to :speciality
    validates :user_id, presence: true
    validates :speciality_id, presence: true
    self.primary_key = "id"
end
