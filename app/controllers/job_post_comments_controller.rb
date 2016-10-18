class JobPostCommentsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def new
    @job_post_comment = JobPostComment.new
  end

  def create
    redirect_to job_posts_url
  end

  private

end
