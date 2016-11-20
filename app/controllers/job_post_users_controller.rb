class JobPostUsersController < ApplicationController

  def new

  end

  def create
    @job_post = JobPost.find_by(params[:job_post_id])
    current_user.apply(@job_post)
  end

end
