class StaticPagesController < ApplicationController
  before_action :paiduser

  def home
    @portfolios = Portfolio.all
    @portfolio_view_likes = PortfolioViewLike.all
    @portfolio_comments = PortfolioComment.where(deleted: false).all
    paiduser
  end

  def help
  end

  def about
  end

  def contact
  end

  def graphic_designer
    @portfolios = Portfolio.where(speciality_id: 1)
    @portfolio_view_likes = PortfolioViewLike.all
    @portfolio_comments = PortfolioComment.where(deleted: false).all
  end

  private
    def paiduser
      @paiduser = User.where(paid: true)
      @paidportfolios = Portfolio.where(user_id: @paiduser.ids).limit(5)
    end

end
