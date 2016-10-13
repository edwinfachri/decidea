class SpecialitiesUsersController < ApplicationController
   before_action :logged_in_user

  def index
  end

  def show
    @user = User.find(params[:id])
    @specialities_users = @user.specialities_users
  end

  def new
  end

  def create
    @speciality = Speciality.find(params[:speciality_id])
    current_user.specialization(@speciality)
  end
end
