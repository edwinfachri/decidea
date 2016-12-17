class PortfolioCommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @portfolio_comment = @portfolio.PortfolioComment.new
  end

  def create
    @user = current_user
    @portfolio = Portfolio.find(params[:portfolio_id])
    @portfolio_comment = @portfolio.portfolio_comments.create(comment_params)
    @portfolio_comment.user_id = @user.id
    if @portfolio_comment.save
      create_notification @portfolio
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:portfolio_id])
    @portfolio_comment = @portfolio.portfolio_comments.find(params[:id])
    @portfolio_comment.destroy
    redirect_to root_url
  end

  private
  def comment_params
    params.require(:portfolio_comment).permit(:comment, :user_id, :portfolio_id)
  end

  def create_notification(portfolio)
    return if portfolio.user.id == current_user.id
    Notification.create!(user_id: portfolio.user.id,
                        notified_by_id: current_user.id,
                        identifier: portfolio.id,
                        notice_type: 1
                        )
  end
end
