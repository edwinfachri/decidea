class PicturesController < ApplicationController

  before_action :logged_in_user

  def show
    @portfolio = Portfolio.find(params[:portfolio_id])
    @picture = @portfolio.pictures.find(params[:id])
    @pictures = @portfolio.pictures
    @user = User.where(id: @portfolio.user_id).take
    @next = @picture.next
    @prev = @picture.prev
    @portfolio_view = current_user.portfolio_view_likes.find_or_create_by(portfolio_id: @portfolio.id)
    @portfolio_comments = PortfolioComment.where(portfolio_id: @portfolio.id, deleted: false).all
  end

  def new
    portfolio = Portfolio.find(params[:portfolio_id])
    @picture = portfolio.pictures.build

    respond_to do |format|
      format.html
      format.xml { render :xml => @picture }
    end
  end

  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    @picture = @portfolio.pictures.create(picture_params)
    @picture.save!
    redirect_to portfolios_path
  end

  def like
    @portfolio = Portfolio.find(params[:portfolio_id])
    @portfolio.update_attributes(like: true)
    redirect_to @portfolio
  end

  def dislike
    @portfolio = Portfolio.find(params[:portfolio_id])
    @portfolio.disliked_by current_user
    redirect_to @portfolio
  end

  private
  def picture_params
    params.require(:picture).permit(:title, :description, :picture)
  end

end
