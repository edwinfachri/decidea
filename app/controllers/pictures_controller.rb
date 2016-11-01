class PicturesController < ApplicationController

  before_action :logged_in_user

  def show
    @portfolio = Portfolio.find(params[:portfolio_id])
    @picture = @portfolio.pictures.find(params[:id])
    @pictures = @portfolio.pictures
    @user = User.find_by(params[:user_id])
    @next = @picture.next
    @prev = @picture.prev
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
    portfolio = Portfolio.find(params[:portfolio_id])
    @picture = portfolio.pictures.create(picture_params)

  end

  private
  def picture_params
    params.require(:picture).permit(:title, :description, :picture)
  end

end
