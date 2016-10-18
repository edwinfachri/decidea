class SpecialitiesController < ApplicationController
  def index
    @specialities = Speciality.all
  end

  def create
    @user = current_user
    @speciality = Speciality.find(params[:speciality_id])
    @user.specialities_users << @speciality
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
