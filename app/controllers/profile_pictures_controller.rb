class ProfilePicturesController < ApplicationController

  def new
    @profile_picture = ProfilePicture.new
  end

  def create
    @user = current_user
    @profile_picture = @user.profile_pictures.new(profile_picture_params)
    if @profile_picture.save
      @user.profile_pictures.update_all activated: false
      @profile_picture.update(activated: true)
      redirect_to @user
    end
  end

  private
    def profile_picture_params
      params.require(:profile_picture).permit(:picture)
    end
end
