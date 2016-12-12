class PortfolioComment < ApplicationRecord
  belongs_to :user
  belongs_to :portfolio
  validates :user_id, presence: true
  validates :portfolio_id, presence: true
  validates :comment, presence: true
  default_scope -> { order(created_at: :desc) }
end
