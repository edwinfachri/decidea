class PortfolioViewLike < ApplicationRecord
  belongs_to :portfolio
  belongs_to :user

  def like
    update_attribute(:like, true)
  end
end
