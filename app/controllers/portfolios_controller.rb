class PortfoliosController < ApplicationController

  before_action :logged_in_user

  def index
    @user = current_user
    @portfolios = Portfolio.all
    @portfolio_view_likes = PortfolioViewLike.all
    @portfolio_comments = PortfolioComment.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = current_user.portfolios.create!(portfolio_params)

    if @portfolio.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:name, :description, :speciality_id)
  end

end
