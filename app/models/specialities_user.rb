class SpecialitiesUser < ApplicationRecord
    belongs_to :user
    belongs_to :speciality
end
