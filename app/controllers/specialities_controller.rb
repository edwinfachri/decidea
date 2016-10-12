class SpecialitiesController < ApplicationController
  before_action :logged_in_user

  def create
    @speciality = Speciality.find_by(params[:id])
    current_user.specialization(@speciality)
  end
end