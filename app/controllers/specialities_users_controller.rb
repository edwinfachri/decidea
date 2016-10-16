class SpecialitiesUsersController < ApplicationController
   before_action :logged_in_user

  def index
  end

  def create
    @specialities_user = current_user.specialities_users.build(micropost_params)
  end

  def show
    @user = User.find(params[:id])
    @specialities_users = @user.specialities_users
    @specialities_user = SpecialitiesUser.find(params[:id])
  end

  def new
  end

  def destroy
    @speciality_id.destroy
    redirect_to edit_user_path
  end

end
