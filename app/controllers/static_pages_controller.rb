class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @portfolios = Portfolio.paginate(page: params[:page])
      @user = current_user
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
