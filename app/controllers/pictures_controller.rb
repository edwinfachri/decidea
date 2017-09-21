class PicturesController < ApplicationController

  before_action :logged_in_user

  def show
    @portfolio = Portfolio.find(params[:portfolio_id])
    @picture = @portfolio.pictures.find(params[:id])
    @pictures = @portfolio.pictures
    @user = User.where(id: @portfolio.user_id).take
    @next = @picture.next
    @prev = @picture.prev
    likeable
    @portfolio_views= @portfolio.portfolio_view_likes
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
    likeable
    redirect_to :back
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

  def likeable
    @likeable = PortfolioViewLike.where("portfolio_id = ? AND user_id = ?", @portfolio.id, current_user.id).take
    if @likeable.like == false
      @likeable.update_attributes(like: true)
    else
      @likeable.update_attributes(like: false)
    end
  end

end
