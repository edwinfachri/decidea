class JobPostCommentsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def new
    @job_post = JobPost.find(params[:job_post_id])
    @job_post_comment = @job_post.JobPostComment.new
  end

  def create
    @user = current_user
    @job_post = JobPost.find(params[:job_post_id])
    @job_post_comment = @job_post.job_post_comments.create(comment_params)
    @job_post_comment.user_id = @user.id
    if @job_post_comment.save
      redirect_to @job_post
    else
      render 'new'
    end
  end

  def destroy
    @job_post = JobPost.find(params[:job_post_id])
    @job_post_comment = @job_post.job_post_comments.find(params[:id])
    @job_post_comment.destroy
    redirect_to @job_post
  end

  private
  def comment_params
    params.require(:job_post_comment).permit(:comment, :user_id, :job_post_id)
  end
end
