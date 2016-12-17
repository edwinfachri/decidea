class JobPostUsersController < ApplicationController

  def new

  end

  def create
    @job_post = JobPost.find_by(params[:job_post_id])
    @apply = current_user.apply(@job_post)

    if @apply.save
      create_notification @job_post
      respond_to do |format|
        format.html { redirect_to @job_post }
      end
    end
  end

  def destroy
    @job_post = JobPost.find_by(params[:job_post_id])
    current_user.cancel_job(@job_post)
    respond_to do |format|
      format.html { redirect_to @job_post}
    end
  end

  private
  def create_notification(job_post)
    return if job_post.user_id == current_user.id
    Notification.create!(user_id: job_post.user_id,
                        notified_by_id: current_user.id,
                        identifier: job_post.id,
                        notice_type: 4
                        )
  end
end
