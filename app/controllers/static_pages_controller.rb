class StaticPagesController < ApplicationController
  def home
    @portfolios = Portfolio.all
    @portfolio_view_likes = PortfolioViewLike.all
    @portfolio_comments = PortfolioComment.all
  end

  def help
  end

  def about
  end

  def contact
  end
end
