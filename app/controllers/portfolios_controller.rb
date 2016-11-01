class PortfoliosController < ApplicationController

  before_action :logged_in_user

  def new
    @portfolio = Portfolio.new
  end

  def create
    @user = current_user
    @portfolio = @user.portfolios.create(portfolio_params)

    if @portfolio.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:name, :description)
  end

  def picture_params
    params.require(:picture).permit(:title, :description, :picture)
  end

end
