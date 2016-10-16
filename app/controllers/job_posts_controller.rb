class JobPostsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @job_posts = JobPost.paginate(page: params[:page])
  end

  def show
    @job_post = JobPost.find(params[:id])
    unless request.env["HTTP_USER_AGENT"].match(/\(.*https?:\/\/.*\)/)
      JobPost.increment_counter :seen_counter, @job_post  
    end
  end

  def new
    @jobpost = JobPost.new
  end

  def create
    @jobpost = JobPost.new(jobpost_params)
    if @jobpost.save
      flash[:info] = "Posted"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def jobpost_params
    params.require(:job_post).permit(:job_title, :job_location, :job_description,
      :speciality_id, :company_name, :company_description, :company_website, :logo)
  end

end
