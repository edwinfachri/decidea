class JobPostsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy, :show]
  before_action :correct_user, only: :destroy

  def index
    if params[:search]
      @job_posts = JobPost.search(params[:search]).paginate(page: params[:page])
    else
      @job_posts = JobPost.paginate(page: params[:page])
    end
    @job_post_views = JobPostView.all
    @job_post_comments = JobPostComment.all
  end

  def show
    @user = current_user
    @job_post = JobPost.find(params[:id])
    @job_post_view = @user.job_post_views.find_or_create_by(job_post_id: @job_post.id)
    @job_post_comments = JobPostComment.where(job_post_id: @job_post.id)
    @specialities = SpecialityJobPost.where(job_post_id: @job_post.id)
  end

  def new
    @user = current_user
    @jobpost = JobPost.new
  end

  def create
    @jobpost = JobPost.new(jobpost_params)
    if @jobpost.save
      @speciality_job_post = @jobpost.speciality_job_posts.create(speciality_id: params[:speciality_id])
      flash[:info] = "Posted"
      redirect_to job_posts_url
    else
      render 'new'
    end
  end

  def commentpost
    redirect_to job_posts_url
  end

  def applying
    @user = User.find(params[:id])
    job_posts = @user.job_post_users.all
  end

  private

  def jobpost_params
    params.require(:job_post).permit(:job_title, :job_description,
      :speciality_id, :company_name, :company_description, :company_website, :logo,
      :rates, :location_id, :user_id)
  end

  def speciality_params
    params.require(:speciality_job_post).permit(:job_post_id, :speciality_id)
  end

end
