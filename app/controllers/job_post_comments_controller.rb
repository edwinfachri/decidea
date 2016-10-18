class JobPostCommentsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @comment = JobPostComment.new(params[:comment])
    @job_post = JobPost.find_by(params[:id])
    current_user.job_post.build(user_id: current_user,
    job_post_id: @job_post, comment: @comment)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private
  def comment_params
    params.require(:micropost).permit(:comment)
  end

  def correct_user
    @job_post_comment = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end

end
