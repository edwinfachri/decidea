class JobPostsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @job_posts = JobPost.paginate(page: params[:page])
  end

  def show
    @job_post = JobPost.find(params[:id])
    @user = @job_post.user_id
    unless request.env["HTTP_USER_AGENT"].match(/\(.*https?:\/\/.*\)/)
      JobPost.increment_counter :seen_counter, @job_post
    end
  end

  def new
    @user = current_user
    @jobpost = JobPost.new
  end

  def create
    @user = current_user
    @jobpost = JobPost.new(jobpost_params)
    if @jobpost.save
      flash[:info] = "Posted"
      redirect_to job_posts_url
    else
      render 'new'
    end
  end

  private

  def jobpost_params
    params.require(:job_post).permit(:job_title, :job_location, :job_description,
      :speciality_id, :company_name, :company_description, :company_website, :logo,
      :user_id, :rates)
  end

end
