class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
    :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])

  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) #not the final implementation
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:commit] == 'update'
      if @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
        redirect_to edit_user_path
      else
        render 'edit'
      end
    elsif params[:commit] == 'speciality'
      specialization
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def profile_setting
    respond_to do |format|
      format.js
    end
  end

  def portfolio_setting
    respond_to do |format|
      format.js
    end
  end

  def password_setting
    respond_to do |format|
      format.js
    end
  end

  def specialization
    @speciality = Speciality.find(params[:speciality_id])
    @user.specialities << @speciality
  end

  def unspecialization
    @user.specialities.destroy(1)
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email,
        :username, :password, :password_confirmation, :location, :biography)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
