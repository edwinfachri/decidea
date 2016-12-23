class PortfolioCommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :update]

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
      redirect_to :back
    else
      render 'new'
    end
  end

  def update
    @portfolio = Portfolio.find(params[:portfolio_id])
    @portfolio_comment = @portfolio.portfolio_comments.find(params[:id])
    @portfolio_comment.update_attributes!(deleted: true)
    if @portfolio_comment.save
      redirect_to :back
    end
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
