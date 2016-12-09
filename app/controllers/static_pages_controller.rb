class StaticPagesController < ApplicationController
  def home
    @portfolios = Portfolio.all
  end

  def help
  end

  def about
  end

  def contact
  end
end
