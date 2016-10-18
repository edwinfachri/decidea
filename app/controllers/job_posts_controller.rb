class JobPostsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy, :show]
  before_action :correct_user, only: :destroy

  def index
    @user = User.find_by(params[:user_id])
    @job_posts = JobPost.paginate(page: params[:page])
  end

  def show
    @user = current_user
    @job_post = JobPost.find(params[:id])
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
      @user.job_posts << @jobpost
      flash[:info] = "Posted"
      redirect_to job_posts_url
    else
      render 'new'
    end
  end
  def commentpost
    redirect_to job_posts_url
  end

  private

  def jobpost_params
    params.require(:job_post).permit(:job_title, :job_location, :job_description,
      :speciality_id, :company_name, :company_description, :company_website, :logo,
      :rates)
  end

end
