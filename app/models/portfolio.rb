class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures
  validates :name, presence: true
  validates :user_id, presence: true

  has_many :portfolio_comments, foreign_key: "portfolio_id",
    class_name: "PortfolioComment", dependent: :destroy
  has_many :commentable_users, through: :portfolio_comments, :class_name => "User"

  has_many :portfolio_view_likes, foreign_key: "portfolio_id", dependent: :destroy
  has_many :viewable_users, through: :portfolio_view_likes, :class_name => "User"

end
