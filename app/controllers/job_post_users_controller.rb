class JobPostUsersController < ApplicationController

  def new

  end

  def create
    @job_post = JobPost.find_by(params[:job_post_id])
    current_user.apply(@job_post)
    respond_to do |format|
      format.html { redirect_to @job_post }
    end
  end

  def destroy
    @job_post = JobPost.find_by(params[:job_post_id])
    current_user.cancel_job(@job_post)
    respond_to do |format|
      format.html { redirect_to @job_post}
    end
  end

end
