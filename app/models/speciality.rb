class Speciality < ApplicationRecord

  has_many :specialized_ins
  has_many :users, through: :specialized_ins

end
